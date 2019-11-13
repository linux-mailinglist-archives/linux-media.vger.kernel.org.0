Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5B5CFFAADC
	for <lists+linux-media@lfdr.de>; Wed, 13 Nov 2019 08:22:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726165AbfKMHWF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Nov 2019 02:22:05 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:59270 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726057AbfKMHWF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Nov 2019 02:22:05 -0500
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 66BAC2905D4;
        Wed, 13 Nov 2019 07:22:03 +0000 (GMT)
Date:   Wed, 13 Nov 2019 08:22:00 +0100
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Alexandre Courbot <acourbot@google.com>
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        Maxime Ripard <mripard@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: H264 stateless reference frames ordering lists
Message-ID: <20191113082200.134721c3@collabora.com>
In-Reply-To: <CAPBb6MVmUAmp5kmtqOx=V=1NJHyDyK28FD=rtoZEXdXvfZ2-9g@mail.gmail.com>
References: <CAPBb6MWXj+PNbJ0_m6O6wnYf6Z9NcYwr49qbSowG66NB-23k2g@mail.gmail.com>
        <20191112115343.1b1908ce@collabora.com>
        <CAPBb6MVmUAmp5kmtqOx=V=1NJHyDyK28FD=rtoZEXdXvfZ2-9g@mail.gmail.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Alexandre,

On Wed, 13 Nov 2019 15:30:40 +0900
Alexandre Courbot <acourbot@google.com> wrote:

> On Tue, Nov 12, 2019 at 7:53 PM Boris Brezillon
> <boris.brezillon@collabora.com> wrote:
> >
> > Hi Alexandre,
> >
> > On Tue, 12 Nov 2019 19:14:22 +0900
> > Alexandre Courbot <acourbot@google.com> wrote:
> >  
> > > Hi Boris and Ezequiel,
> > >
> > > Patch c3adb85745ca6 has removed the ref_pic_list_* members from the
> > > v4l2_ctrl_h264_decode_params struct. The MT8183 stateless decoder
> > > driver I am working on still relies on these lists and I am trying (a
> > > bit late to the game) to remove them from the Chromium OS kernel UAPI
> > > in order to match upstream.
> > >
> > > I have dug into the discussion that resulted in this removal and could
> > > not really find how these are supposed to be reconstructed and on the
> > > basis on which information. The commit log for the above-mentioned
> > > patch mentions that "generic helpers will be provided for drivers that
> > > need this list". I could not find any in the kernel so far, do you
> > > have any code available at the moment? Or any idea on how these can be
> > > reconstructed? The process seems to involve reading the DPB itself as
> > > well as reordering information from the slice parameters, and seems to
> > > be a bit involved to be done in the kernel, but maybe I am missing
> > > something here.  
> >
> > The code is here [1], and it should indeed be extracted and put in a
> > generic v4l2_h264 lib at some point (should happen soon, since we need
> > the same logic for the rkvdec driver).
> >
> > Let me know if you have any questions.  
> 
> Thanks - not sure how I missed it. I have tried adapting the code for
> MT8183 and it seems to be working perfectly there as well.

That's great news! Note that we have a fix queued to media/master, so
if you copy the code, take it from there.

> 
> Regarding the lib to make this code available to other drivers, I was
> thinking about doing it on top of
> https://patchwork.kernel.org/patch/11076405/ but is this patch still
> being worked on?

Unfortunately no. Hans was not in favor of this extra codec abstraction
layer and suggested to provide a set of helpers instead. But after
looking at it, there's not much that can be automated/shared if drivers
don't all share the same base object (maybe part of the ctrls handling
logic). Also had the same feedback from Paul K (reported privately on
IRC), so I decided to give up on this approach.

Regards,

Boris
