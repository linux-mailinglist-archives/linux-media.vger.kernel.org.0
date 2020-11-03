Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C8B72A56FE
	for <lists+linux-media@lfdr.de>; Tue,  3 Nov 2020 22:33:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732382AbgKCVc6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Nov 2020 16:32:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732579AbgKCVc6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 Nov 2020 16:32:58 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD5CBC0613D1
        for <linux-media@vger.kernel.org>; Tue,  3 Nov 2020 13:32:57 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 6CB411F45881
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Philipp Zabel <p.zabel@pengutronix.de>, cphealy@gmail.com,
        Benjamin.Bara@skidata.com, l.stach@pengutronix.de,
        Ezequiel Garcia <ezequiel@collabora.com>, kernel@collabora.com
Subject: [PATCH v3 0/2] CODA timeout and macroblock error control
Date:   Tue,  3 Nov 2020 18:32:36 -0300
Message-Id: <20201103213238.575909-1-ezequiel@collabora.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi all,

I'm sending here the patches that are pending in previous series [2].

The main motivation for this fix is to address a PIC_RUN
timeout, which we managed to link with a hardware bitstream
buffer underrun condition.

Upon further investigation we discovered that the underrun
was produced by a subtle issue in the way buffer_meta's were
being tracked.

The issue is fixed by patch "1/2 coda: coda_buffer_meta housekeeping fix".

Also, while testing with corrupted bitstreams we realized
the driver was logging too verbosely, so patch 2 addresses
this by introducing a private control to read an macroblock-error
counter.

These patches have been tested against media's upstream
and v5.4-based, on i.MX6 (Wandboard) with H.264 and MPEG-2
streams.

As reported by Benjamin Bara this fix is not sufficient
to fix all timeouts. However, the fix does help to fix
some of the cases.

For instance, videos containing small black frames,
are now fixed. See:

gst-launch-1.0 videotestsrc pattern=black num-buffers=300 ! \
video/x-raw,format=I420,width=176,height=120 ! avenc_mpeg2video ! \
mpegvideoparse ! mpegtsmux ! filesink location=black-qcif-10s.ts

Reviews and feedback are appreciated, as always.

[1] https://lkml.org/lkml/2020/8/21/495
[2] https://patchwork.linuxtv.org/project/linux-media/list/?series=3592

Changelog
---------

v3:
* Address Hans' feedback on patch 2.
  In particular, the control is not marked as volatile,
  since that was incorrect.
  Also, move the control CID definition inside the driver header.

v2:
* Keep the error MB message, but move it to coda_dbg(1, ctx).
* Add per-device rate limitting for the error MB message.
* Rename V4L2_CID_CODA_ERR_MB description.
* s/__coda_decoder_drop_used_metas/coda_decoder_drop_used_metas

Ezequiel Garcia (2):
  coda: coda_buffer_meta housekeeping fix
  coda: Add a V4L2 user for control error macroblocks count

 drivers/media/platform/coda/coda-bit.c    | 52 ++++++++++++++++++++---
 drivers/media/platform/coda/coda-common.c | 18 ++++++++
 drivers/media/platform/coda/coda.h        | 11 +++++
 include/uapi/linux/v4l2-controls.h        |  4 ++
 4 files changed, 78 insertions(+), 7 deletions(-)

-- 
2.27.0

