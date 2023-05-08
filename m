Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B184B6FA00E
	for <lists+linux-media@lfdr.de>; Mon,  8 May 2023 08:43:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232887AbjEHGnz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 May 2023 02:43:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231791AbjEHGny (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 8 May 2023 02:43:54 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D6569031
        for <linux-media@vger.kernel.org>; Sun,  7 May 2023 23:43:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683528233; x=1715064233;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=0p+cKv7AwlfpCfoUAYlt2zVBFwYg9QU6Qw9UV9pW4a0=;
  b=FNG2rnehsMeDU9MQp4fTALXeg46zlszkinn/JteczdjejnWEbwHMzXcf
   AeSrbI4s2NSDy+I1+lWXUzxlSA8JH4CgR1qE6cQuBhzp6iAcoMUfXbLMb
   O4XmQ+seyvBCh15nRpSutyozRUkNS8wMacY4MTkCx2/Vbij9e/UUxsc/f
   ngenrWoQYFSveuU5V4X3kWfolx9K7sIUXZTPWsewY/ku8wcPQU3LysaxS
   KiUB3m6zlvJ2AE/jDO6ILNLrsqj4HVNk9i68yntWX8WvGE7c7eYvjCbjN
   yoGDNrbtOLvKCIrfMFW6NAiLuXdgkxrSR3/hZJbh1iU+xAdfk5QbAw8O9
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10703"; a="435888713"
X-IronPort-AV: E=Sophos;i="5.99,258,1677571200"; 
   d="scan'208";a="435888713"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2023 23:43:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10703"; a="692502857"
X-IronPort-AV: E=Sophos;i="5.99,258,1677571200"; 
   d="scan'208";a="692502857"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2023 23:43:52 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 5C2871203DA;
        Mon,  8 May 2023 09:43:49 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.94.2)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1pvuYv-0046oO-KS; Mon, 08 May 2023 09:41:33 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     bingbu.cao@intel.com
Subject: [PATCH v2 1/1] media: pci: ipu3-cio2: Obtain remote pad from endpoint
Date:   Mon,  8 May 2023 09:41:23 +0300
Message-Id: <20230508064123.979451-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use the endpoint fwnode to find out the remote pad, instead of using the
first source pad found. Also improve error messages.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
since v1:

- Drop pad variable.

- Wrap long lines.

 drivers/media/pci/intel/ipu3/ipu3-cio2-main.c | 31 +++++++++----------
 1 file changed, 15 insertions(+), 16 deletions(-)

diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c b/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
index 3c84cb1216320..c5d00c929bfac 100644
--- a/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
+++ b/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
@@ -1373,6 +1373,7 @@ static const struct v4l2_subdev_ops cio2_subdev_ops = {
 struct sensor_async_subdev {
 	struct v4l2_async_subdev asd;
 	struct csi2_bus_info csi2;
+	struct fwnode_endpoint endpoint;
 };
 
 #define to_sensor_asd(asd)	container_of(asd, struct sensor_async_subdev, asd)
@@ -1417,31 +1418,28 @@ static int cio2_notifier_complete(struct v4l2_async_notifier *notifier)
 	struct sensor_async_subdev *s_asd;
 	struct v4l2_async_subdev *asd;
 	struct cio2_queue *q;
-	unsigned int pad;
 	int ret;
 
 	list_for_each_entry(asd, &cio2->notifier.asd_list, asd_list) {
 		s_asd = to_sensor_asd(asd);
 		q = &cio2->queue[s_asd->csi2.port];
 
-		for (pad = 0; pad < q->sensor->entity.num_pads; pad++)
-			if (q->sensor->entity.pads[pad].flags &
-						MEDIA_PAD_FL_SOURCE)
-				break;
-
-		if (pad == q->sensor->entity.num_pads) {
-			dev_err(dev, "failed to find src pad for %s\n",
-				q->sensor->name);
-			return -ENXIO;
+		ret = media_entity_get_fwnode_pad(&q->sensor->entity,
+						  s_asd->endpoint.local_fwnode,
+						  MEDIA_PAD_FL_SOURCE);
+		if (ret < 0) {
+			dev_err(dev, "no endpoint for %pfw (%d)\n",
+				s_asd->endpoint.local_fwnode, ret);
+			return ret;
 		}
 
-		ret = media_create_pad_link(
-				&q->sensor->entity, pad,
-				&q->subdev.entity, CIO2_PAD_SINK,
-				0);
+		ret = media_create_pad_link(&q->sensor->entity, ret,
+					    &q->subdev.entity, CIO2_PAD_SINK,
+					    0);
 		if (ret) {
-			dev_err(dev, "failed to create link for %s\n",
-				q->sensor->name);
+			dev_err(dev, "failed to create link for %s (endpoint %pfw, error %d)\n",
+				q->sensor->name, s_asd->endpoint.local_fwnode,
+				ret);
 			return ret;
 		}
 	}
@@ -1485,6 +1483,7 @@ static int cio2_parse_firmware(struct cio2_device *cio2)
 			goto err_parse;
 		}
 
+		s_asd->endpoint = vep.base;
 		s_asd->csi2.port = vep.base.port;
 		s_asd->csi2.lanes = vep.bus.mipi_csi2.num_data_lanes;
 
-- 
2.30.2

