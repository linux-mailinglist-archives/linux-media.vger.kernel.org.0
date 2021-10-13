Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA5D542BE1D
	for <lists+linux-media@lfdr.de>; Wed, 13 Oct 2021 12:57:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233774AbhJMK64 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Oct 2021 06:58:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232260AbhJMK6Z (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Oct 2021 06:58:25 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 555EDC06176A;
        Wed, 13 Oct 2021 03:56:22 -0700 (PDT)
Received: from guri.fritz.box (unknown [IPv6:2a02:810a:880:f54:2d05:985b:ed8c:969a])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id B96171F4417C;
        Wed, 13 Oct 2021 11:56:20 +0100 (BST)
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
        olivier.crete@collabora.com
Subject: [PATCH v2 4/6] staging: media: wave5: Add TODO file
Date:   Wed, 13 Oct 2021 12:56:07 +0200
Message-Id: <20211013105609.21457-5-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211013105609.21457-1-dafna.hirschfeld@collabora.com>
References: <20211013105609.21457-1-dafna.hirschfeld@collabora.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add a TODO file listing all that is need for destaging.

Signed-off-by: Robert Beckett <bob.beckett@collabora.com>
Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 drivers/staging/media/wave5/TODO | 58 ++++++++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)
 create mode 100644 drivers/staging/media/wave5/TODO

diff --git a/drivers/staging/media/wave5/TODO b/drivers/staging/media/wave5/TODO
new file mode 100644
index 000000000000..3a2c94389c44
--- /dev/null
+++ b/drivers/staging/media/wave5/TODO
@@ -0,0 +1,58 @@
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
+
+* power management handling - add (runtime_)suspen/resume cb where the clock is enabled
+
+* fix checkpatch issues (mostly fixes , only left to fix MACRO_ARG_REUSE, LONG_LINE)
-- 
2.17.1

