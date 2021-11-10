Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 929AC44C0FA
	for <lists+linux-media@lfdr.de>; Wed, 10 Nov 2021 13:10:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231912AbhKJMMi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Nov 2021 07:12:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231789AbhKJMMT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Nov 2021 07:12:19 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32E95C0613F5;
        Wed, 10 Nov 2021 04:09:31 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id 796EA1F45559
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
        t=1636546170; bh=SrLsl/Xy1dk6a8Yeq6s/71g3rL99Bi4t6iAWUz6Orq8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=MMA5RlDwH1YdkU8dV8fGotnmyDuLvz4x4mU6wKXGAZDa6VkbgznWOVRvcfxeMBAlf
         YW/O7bdliTUDoM/EE051K4FMzhqVmDilS0VpiyOHDlwi9AubCDIl4QHEHUjNWutual
         dNWZC+vQAd3zO98eBO/qR85gFHk+G8FBSY3pn6MgnaJyfXeAywzdzMqHRtbU81JZYU
         W0rqH3S17gvY1pB/GtI2ejPCwiX2Zp4xM233Sw3FkbNqPuicLDjmNW1K6KroCazFvo
         /kqZXk5S7R24itPv1CaCrPaARaldaga5VE8060s7t4eVp0UVjYF4iok7UOsu7CAdRL
         1idrAdRERjXNw==
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Robert Beckett <bob.beckett@collabora.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM),
        linux-kernel@vger.kernel.org (open list),
        laurent.pinchart@ideasonboard.com, hverkuil@xs4all.nl,
        kernel@collabora.com, dafna3@gmail.com,
        kiril.bicevski@collabora.com,
        Nas Chung <nas.chung@chipsnmedia.com>,
        lafley.kim@chipsnmedia.com, scott.woo@chipsnmedia.com,
        olivier.crete@collabora.com, dan.carpenter@oracle.com,
        rdunlap@infradead.org
Subject: [PATCH v3 4/6] staging: media: wave5: Add TODO file
Date:   Wed, 10 Nov 2021 14:09:08 +0200
Message-Id: <20211110120910.12411-5-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211110120910.12411-1-dafna.hirschfeld@collabora.com>
References: <20211110120910.12411-1-dafna.hirschfeld@collabora.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add a TODO file listing all that is need for destaging.

Signed-off-by: Robert Beckett <bob.beckett@collabora.com>
Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 drivers/staging/media/wave5/TODO | 59 ++++++++++++++++++++++++++++++++
 1 file changed, 59 insertions(+)
 create mode 100644 drivers/staging/media/wave5/TODO

diff --git a/drivers/staging/media/wave5/TODO b/drivers/staging/media/wave5/TODO
new file mode 100644
index 000000000000..98dc3b923ad6
--- /dev/null
+++ b/drivers/staging/media/wave5/TODO
@@ -0,0 +1,59 @@
+* Test on real silicon once available
+
+  This driver has so far been tested on pre-silicon FPGA and on the beta BeagleV
+  board which uses the StarFive JH7100 beta SoC.
+
+  Testing on FPGA shows it working fine, though the FPGA uses polled interrupts
+  and copied buffers between the host and it's on board RAM.
+
+  Testing on BeagleV shows buffer corruption that is currently attributed to a
+  known silicon issue in the SoC that makes the cache coherent interconnect not
+  so coherent.
+  This can likely be solved when the riscv non-coherent dma support lands and
+  provide optional v4l2 non-contiguous allocator, though it remains to be seen
+  whether support non-coherent use cases will be useful in real world hw.
+
+  Until we can test and resolve any issues on final silicon (due 2H 2021)
+  this driver should remain in staging.
+
+* Handle interrupts better
+
+  Currently the interrupt handling uses an unusual design employing a kfifo to
+  transfer irq status to irq thread. This was done as a work around for dropped
+  interrupts seen with IRQF_ONESHOT based handling.
+
+  This needs further investigation and fixing properly, with the aid of
+  C&M and StarFive engineers.
+
+* Fix early end of stream handling
+
+  When using a gstreamer pipeline like this:
+  gst-launch-1.0 filesrc location=<file> ! parsebin ! h264parse ! v4l2h264dec ! jpegenc ! identity eos-after=3 !  multifilesink location=%05d.jpeg
+  i.e. forced eos after 3 buffers
+  the pipeline stalls on exit waiting for end of job.
+  We need to add some form of early exit detection, instead of the current
+  behaviour of only considering a job finish on PIC_END.
+
+* Support more formats
+
+  The current frontend v4l2 layer only supports V4L2_PIX_FMT_HEVC and
+  V4L2_PIX_FMT_H264.
+  The backend logic supports other formats, so we should wire up the support
+  for further bitsream formats.
+
+* appropreate error handling:
+allocation failure, mutex acquire failure etc.
+
+* remove all unused struct fields
+
+* change struct fields to 'bool' type or bitfield when appropreate
+Likely good candidates are fields named '*_enable' , '*_on'
+
+* handle vdi_allocate_dma_memory failure , each function has to clean after itself
+
+* make sure that 'u32', 's32' etc. are only used when reading/writing hw
+and change s32 to u32 when s32 is not required
+
+* power management handling - add (runtime_)suspen/resume cb where the clock is enabled
+
+* fix checkpatch issues (mostly fixes , only left to fix MACRO_ARG_REUSE, LONG_LINE)
-- 
2.17.1

