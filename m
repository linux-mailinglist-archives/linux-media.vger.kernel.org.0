Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2E0CCDFEC
	for <lists+linux-media@lfdr.de>; Mon, 29 Apr 2019 11:55:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727843AbfD2Jz5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 Apr 2019 05:55:57 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:42501 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727624AbfD2Jz4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 Apr 2019 05:55:56 -0400
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtp (Exim 4.89)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1hL30t-0002I3-AC; Mon, 29 Apr 2019 11:55:55 +0200
Message-ID: <1556531755.3009.6.camel@pengutronix.de>
Subject: Re: [PATCH 4/5] media: coda: Remove pic_run_work worker
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        linux-media@vger.kernel.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     kernel@collabora.com
Date:   Mon, 29 Apr 2019 11:55:55 +0200
In-Reply-To: <52effdcfcbacac8a6df56d0d43591326d314a894.camel@collabora.com>
References: <20190425183546.16244-1-ezequiel@collabora.com>
         <20190425183546.16244-5-ezequiel@collabora.com>
         <1556266306.3664.5.camel@pengutronix.de>
         <52effdcfcbacac8a6df56d0d43591326d314a894.camel@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.22.6-1+deb9u1 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, 2019-04-26 at 15:19 -0300, Ezequiel Garcia wrote:
> On Fri, 2019-04-26 at 10:11 +0200, Philipp Zabel wrote:
> > On Thu, 2019-04-25 at 15:35 -0300, Ezequiel Garcia wrote:
> > > There isn't any reason to run the mem2mem job on a separate worker,
> > > because the mem2mem framework guarantees that device_run will never
> > > run in interrupt context.
> > 
> > The purpose of the workqueue is to serialize BIT processor commands,
> > currently the PIC_RUN commands issued by the mem2mem framework (as well
> > as SEQ_INIT, SET_FRAME_BUF, and ENCODE_HEADER) against the SEQ_END
> > command issued directly from the STREAMOFF ioctl.
> 
> Right, but that's serialized by the coda_mutex, not by the worker, right?

Hmm, coda_start_decoding as called from .start_streaming is indeed just
serialized by the device coda_mutex. I would prefer this to be scheduled
as a work item as well though, those are way easier to reason about.

As an aside, while SEQ_INIT on its own is fast, technically
.start_streaming (or .buf_queue, see below) wouldn't even have to wait
until the SEQ_INIT command has finished, in case the BIT processor is
busy decoding for another context.

> > Further, to fully support the stateful decoder API we'll have to move
> > SEQ_INIT out of the mem2mem device_run as well, since that should be
> > called on queued OUTPUT buffers before the CAPTURE side is even
> > streaming.
> 
> Isn't that already done? I see SEQ_INIT being issued in start_streaming.
> In what sense is this driver currently violating the decoder spec?

I suppose it should try SEQ_INIT on every OUTPUT .buf_queue as long as
initialization hasn't succeeded, not only on .start_streaming of the
second queue (whichever is last). Right now, the buffers fed into the
output queue before STREAMON on both OUTPUT and CAPTURE must already
contain headers, or stream start will fail.

> So, returning to the serialization. I believe commands are still
> serialized after this change.

While I'm not sure if any odd corner cases could still arise with this
change, I think you are right. I remember having a few deadlock issues
with the locking before adding the workqueue, but that was before we
could just wait for the device to finish in .device_run.

> The pic_run_work worker is only queued from .device_run.
> Only one job can run on a context at any given time,
> but multiple contexts can run in parallel.
> 
> Inside the worker, the coda_mutex serializes the commands.
> The worker waits until the command has finished execution.
> 
> So, with this commit, there is no longer a worker, but commands
> are still serialized by the mutex and the fact that the command
> is completed in .device_run.
> 
> That being said, the worker does makes the serialization
> more clear, so I think dropping this patch is better.

I agree with both analysis and conclusion.

> Perhaps adding a small comment so the purpose of pic_run_work
> is clear.

Yes, that is a good idea.

regards
Philipp
