Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 87565583DD8
	for <lists+linux-media@lfdr.de>; Thu, 28 Jul 2022 13:42:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236709AbiG1LmR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 28 Jul 2022 07:42:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236852AbiG1Llw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 Jul 2022 07:41:52 -0400
Received: from aer-iport-2.cisco.com (aer-iport-2.cisco.com [173.38.203.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC1F9643D
        for <linux-media@vger.kernel.org>; Thu, 28 Jul 2022 04:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=1478; q=dns/txt; s=iport;
  t=1659008512; x=1660218112;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZV27oEQ0c4Bf39zyMjYO91SIh+6idpUgvNeumAP+Kwc=;
  b=T7fWrQ1XWZnq5iIsE3ngDLSoYFCiRmpzpGLKp0bc/X/8/EHq0tyQSRbB
   1eBC+F85pSPpOdZTMAfzM9H1SBgx4fz6PBYBPnZqq7StQ4eDh+KYYx489
   WnyM+pyQC0s35JdcTs5xowDEjihyS1+TBEDDy103/aAuOr7AbEpZD59Me
   k=;
X-IronPort-AV: E=Sophos;i="5.93,198,1654560000"; 
   d="scan'208";a="3279440"
Received: from aer-iport-nat.cisco.com (HELO aer-core-1.cisco.com) ([173.38.203.22])
  by aer-iport-2.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 28 Jul 2022 11:40:45 +0000
Received: from office-260.rd.cisco.com ([10.47.77.162])
        by aer-core-1.cisco.com (8.15.2/8.15.2) with ESMTP id 26SBegI6010979;
        Thu, 28 Jul 2022 11:40:44 GMT
From:   Erling Ljunggren <hljunggr@cisco.com>
To:     linux-media@vger.kernel.org
Cc:     Erling Ljunggren <hljunggr@cisco.com>
Subject: [PATCH 5/5] media: v4l2-dev: handle V4L2_CAP_EDID_MEMORY
Date:   Thu, 28 Jul 2022 13:40:50 +0200
Message-Id: <20220728114050.2400475-6-hljunggr@cisco.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220728114050.2400475-1-hljunggr@cisco.com>
References: <20220728114050.2400475-1-hljunggr@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 10.47.77.162, [10.47.77.162]
X-Outbound-Node: aer-core-1.cisco.com
X-Spam-Status: No, score=-10.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        SPF_HELO_PASS,SPF_NONE,USER_IN_DEF_DKIM_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When the V4L2_CAP_EDID_MEMORY capability flag is set,
ioctls for enum inputs and get/set edid are automatically set.

Signed-off-by: Erling Ljunggren <hljunggr@cisco.com>
---
 drivers/media/v4l2-core/v4l2-dev.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
index d00237ee4cae..39437911edcc 100644
--- a/drivers/media/v4l2-core/v4l2-dev.c
+++ b/drivers/media/v4l2-core/v4l2-dev.c
@@ -556,6 +556,7 @@ static void determine_valid_ioctls(struct video_device *vdev)
 	bool is_rx = vdev->vfl_dir != VFL_DIR_TX;
 	bool is_tx = vdev->vfl_dir != VFL_DIR_RX;
 	bool is_io_mc = vdev->device_caps & V4L2_CAP_IO_MC;
+	bool is_edid_mem =  vdev->device_caps & V4L2_CAP_EDID_MEMORY;
 
 	bitmap_zero(valid_ioctls, BASE_VIDIOC_PRIVATE);
 
@@ -778,6 +779,13 @@ static void determine_valid_ioctls(struct video_device *vdev)
 		SET_VALID_IOCTL(ops, VIDIOC_S_TUNER, vidioc_s_tuner);
 		SET_VALID_IOCTL(ops, VIDIOC_S_HW_FREQ_SEEK, vidioc_s_hw_freq_seek);
 	}
+	if (is_edid_mem) {
+		SET_VALID_IOCTL(ops, VIDIOC_G_EDID, vidioc_g_edid);
+		SET_VALID_IOCTL(ops, VIDIOC_S_EDID, vidioc_s_edid);
+		SET_VALID_IOCTL(ops, VIDIOC_ENUMINPUT, vidioc_enum_input);
+		SET_VALID_IOCTL(ops, VIDIOC_G_INPUT, vidioc_g_input);
+		SET_VALID_IOCTL(ops, VIDIOC_S_INPUT, vidioc_s_input);
+	}
 
 	bitmap_andnot(vdev->valid_ioctls, valid_ioctls, vdev->valid_ioctls,
 			BASE_VIDIOC_PRIVATE);
-- 
2.37.1

