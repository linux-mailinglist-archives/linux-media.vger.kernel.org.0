Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3C678588861
	for <lists+linux-media@lfdr.de>; Wed,  3 Aug 2022 09:58:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237371AbiHCH6N (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Aug 2022 03:58:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235626AbiHCH6K (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 3 Aug 2022 03:58:10 -0400
Received: from aer-iport-8.cisco.com (aer-iport-8.cisco.com [173.38.203.70])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 596ED2A273
        for <linux-media@vger.kernel.org>; Wed,  3 Aug 2022 00:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=1478; q=dns/txt; s=iport;
  t=1659513489; x=1660723089;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZV27oEQ0c4Bf39zyMjYO91SIh+6idpUgvNeumAP+Kwc=;
  b=l7tpznPxxT9jKGMffrvXxcrC6TTDa/W4tkkizdWA89Jco6MIT8xMhUtM
   E75F91QtgftVJxQY9qP8us3hP6nGodENDGfumXfSO/0S5H9cK0MsPkul7
   C5dJjWz1zCPjMr6u2dIgqE21u+g0R2YyDgZG5+YUVv1d3qimXhG1MId0q
   c=;
X-IronPort-AV: E=Sophos;i="5.93,213,1654560000"; 
   d="scan'208";a="692986"
Received: from aer-iport-nat.cisco.com (HELO aer-core-1.cisco.com) ([173.38.203.22])
  by aer-iport-8.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 03 Aug 2022 07:58:07 +0000
Received: from office-260.rd.cisco.com ([10.47.77.162])
        by aer-core-1.cisco.com (8.15.2/8.15.2) with ESMTP id 2737w5SD024084;
        Wed, 3 Aug 2022 07:58:07 GMT
From:   Erling Ljunggren <hljunggr@cisco.com>
To:     linux-media@vger.kernel.org
Cc:     Erling Ljunggren <hljunggr@cisco.com>
Subject: [PATCH v2 5/5] media: v4l2-dev: handle V4L2_CAP_EDID_MEMORY
Date:   Wed,  3 Aug 2022 09:58:50 +0200
Message-Id: <20220803075850.1196988-6-hljunggr@cisco.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220803075850.1196988-1-hljunggr@cisco.com>
References: <20220803075850.1196988-1-hljunggr@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 10.47.77.162, [10.47.77.162]
X-Outbound-Node: aer-core-1.cisco.com
X-Spam-Status: No, score=-10.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        SPF_HELO_NONE,SPF_NONE,USER_IN_DEF_DKIM_WL autolearn=ham
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

