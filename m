Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FD1440C9FE
	for <lists+linux-media@lfdr.de>; Wed, 15 Sep 2021 18:23:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229849AbhIOQZM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Sep 2021 12:25:12 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:42862 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229672AbhIOQZI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Sep 2021 12:25:08 -0400
Received: from guri.fritz.box (unknown [IPv6:2a02:810a:880:f54:6886:1a1c:e30b:c0f1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 04D6A1F43794;
        Wed, 15 Sep 2021 17:23:47 +0100 (BST)
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Robert Beckett <bob.beckett@collabora.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org (open list:MEDIA INPUT INFRASTRUCTURE
        (V4L/DVB)),
        linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM),
        linux-kernel@vger.kernel.org (open list),
        laurent.pinchart@ideasonboard.com, hverkuil@xs4all.nl,
        kernel@collabora.com, dafna3@gmail.com,
        kiril.bicevski@collabora.com,
        Nas Chung <nas.chung@chipsnmedia.com>,
        lafley.kim@chipsnmedia.com, scott.woo@chipsnmedia.com,
        olivier.crete@collabora.com
Subject: [PATCH 4/6] staging: wave5: Add TODO file
Date:   Wed, 15 Sep 2021 18:23:22 +0200
Message-Id: <20210915162324.25513-5-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210915162324.25513-1-dafna.hirschfeld@collabora.com>
References: <20210915162324.25513-1-dafna.hirschfeld@collabora.com>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add a TODO file listing all that is need for destaging.

Signed-off-by: Robert Beckett <bob.beckett@collabora.com>
Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 drivers/staging/media/wave5/TODO | 42 ++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 drivers/staging/media/wave5/TODO

diff --git a/drivers/staging/media/wave5/TODO b/drivers/staging/media/wave5/TODO
new file mode 100644
index 000000000000..7e94e8dcedcf
--- /dev/null
+++ b/drivers/staging/media/wave5/TODO
@@ -0,0 +1,42 @@
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
-- 
2.17.1

