Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2FCC75EDBA2
	for <lists+linux-media@lfdr.de>; Wed, 28 Sep 2022 13:22:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233252AbiI1LWZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Sep 2022 07:22:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232959AbiI1LWX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Sep 2022 07:22:23 -0400
Received: from aer-iport-6.cisco.com (aer-iport-6.cisco.com [173.38.203.68])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16555DCEB1
        for <linux-media@vger.kernel.org>; Wed, 28 Sep 2022 04:22:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=1711; q=dns/txt; s=iport;
  t=1664364142; x=1665573742;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lqL9lLmFaDtF9r4XcvzUHpGO4/UFYfKq+3g0/9ZdfMo=;
  b=ZdpDHK5hoDCu6u2jCovE9YfxJBTWJBOyuSw1R+p+xxYtp3QqFw3Ni44s
   FmdxmCMjdRs5cplCWW6I8C3J4UYb7g5A55MPoRAq3KQQ5H9o6N7M/mhD8
   OP5iQdvF9EHa+cXh+rlVQ624aAYtL3psfvO2RMq/J2wUoX+KgaN1KwCd+
   8=;
X-IronPort-AV: E=Sophos;i="5.93,352,1654560000"; 
   d="scan'208";a="1511164"
Received: from aer-iport-nat.cisco.com (HELO aer-core-1.cisco.com) ([173.38.203.22])
  by aer-iport-6.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 28 Sep 2022 11:21:16 +0000
Received: from office-260.rd.cisco.com ([10.47.77.162])
        by aer-core-1.cisco.com (8.15.2/8.15.2) with ESMTP id 28SBLFep008487;
        Wed, 28 Sep 2022 11:21:16 GMT
From:   Erling Ljunggren <hljunggr@cisco.com>
To:     linux-media@vger.kernel.org
Cc:     Erling Ljunggren <hljunggr@cisco.com>
Subject: [PATCH v3 5/5] media: v4l2-dev: handle V4L2_CAP_EDID
Date:   Wed, 28 Sep 2022 13:21:47 +0200
Message-Id: <20220928112147.358745-6-hljunggr@cisco.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220928112147.358745-1-hljunggr@cisco.com>
References: <20220928112147.358745-1-hljunggr@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 10.47.77.162, [10.47.77.162]
X-Outbound-Node: aer-core-1.cisco.com
X-Spam-Status: No, score=-9.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        SPF_HELO_NONE,SPF_NONE,USER_IN_DEF_DKIM_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When the V4L2_CAP_EDID capability flag is set,
ioctls for enum inputs/outputs and get/set edid are automatically set.

Signed-off-by: Erling Ljunggren <hljunggr@cisco.com>
---
 drivers/media/v4l2-core/v4l2-dev.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
index d00237ee4cae..e8222b9835e6 100644
--- a/drivers/media/v4l2-core/v4l2-dev.c
+++ b/drivers/media/v4l2-core/v4l2-dev.c
@@ -556,6 +556,7 @@ static void determine_valid_ioctls(struct video_device *vdev)
 	bool is_rx = vdev->vfl_dir != VFL_DIR_TX;
 	bool is_tx = vdev->vfl_dir != VFL_DIR_RX;
 	bool is_io_mc = vdev->device_caps & V4L2_CAP_IO_MC;
+	bool is_edid =  vdev->device_caps & V4L2_CAP_EDID;
 
 	bitmap_zero(valid_ioctls, BASE_VIDIOC_PRIVATE);
 
@@ -778,6 +779,20 @@ static void determine_valid_ioctls(struct video_device *vdev)
 		SET_VALID_IOCTL(ops, VIDIOC_S_TUNER, vidioc_s_tuner);
 		SET_VALID_IOCTL(ops, VIDIOC_S_HW_FREQ_SEEK, vidioc_s_hw_freq_seek);
 	}
+	if (is_edid) {
+		SET_VALID_IOCTL(ops, VIDIOC_G_EDID, vidioc_g_edid);
+		if (is_tx) {
+			SET_VALID_IOCTL(ops, VIDIOC_G_OUTPUT, vidioc_g_output);
+			SET_VALID_IOCTL(ops, VIDIOC_S_OUTPUT, vidioc_s_output);
+			SET_VALID_IOCTL(ops, VIDIOC_ENUMOUTPUT, vidioc_enum_output);
+		}
+		if (is_rx) {
+			SET_VALID_IOCTL(ops, VIDIOC_ENUMINPUT, vidioc_enum_input);
+			SET_VALID_IOCTL(ops, VIDIOC_G_INPUT, vidioc_g_input);
+			SET_VALID_IOCTL(ops, VIDIOC_S_INPUT, vidioc_s_input);
+			SET_VALID_IOCTL(ops, VIDIOC_S_EDID, vidioc_s_edid);
+		}
+	}
 
 	bitmap_andnot(vdev->valid_ioctls, valid_ioctls, vdev->valid_ioctls,
 			BASE_VIDIOC_PRIVATE);
-- 
2.37.3

