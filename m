Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D7324702C8F
	for <lists+linux-media@lfdr.de>; Mon, 15 May 2023 14:21:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240712AbjEOMVt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 May 2023 08:21:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229679AbjEOMVs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 May 2023 08:21:48 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D8751B1
        for <linux-media@vger.kernel.org>; Mon, 15 May 2023 05:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684153308; x=1715689308;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=dopmhLkZ7yo60I2xXF2pcGe3gHu0tC5yUeCfqkjU2NM=;
  b=UBJRQS8h6FXFeND/Plh/9BoSWleGsQ+Fi6vQQTxPSRC8qZ0fdTlCYZQf
   qvBRe3I354BTOWJX2Mx5mFsbjZ32hzZYsydBOx5rrYIghmJ+sVeacb8D/
   bW2BWtIZNhX24JqrM3iNDJEyQUchCpASqqZMQbBVZIt49Du7NHwBImoYg
   R+wiS7jcf26weX3qKqZVOILDUqpxIssyNwOGG0q1Aw6nfW+03xzbtUeBC
   Wkcl5hmqtFJ8el6vvHwRm5MFicQpukbsrXGvIVta6tei/5XvQLAUMedT3
   5zk5EAtDINf6Ney8IoPuLSGN6kDQdLKJ3nof+hAIlX99yBaUsG84M4CKT
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="437525793"
X-IronPort-AV: E=Sophos;i="5.99,276,1677571200"; 
   d="scan'208";a="437525793"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2023 05:21:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="845245443"
X-IronPort-AV: E=Sophos;i="5.99,276,1677571200"; 
   d="scan'208";a="845245443"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2023 05:21:47 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 89B35120279;
        Mon, 15 May 2023 15:21:44 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.94.2)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1pyXCs-002Tgk-1h; Mon, 15 May 2023 15:21:38 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     bingbu.cao@intel.com
Subject: [PATCH v3 1/1] media: pci: ipu3-cio2: Obtain remote pad from endpoint
Date:   Mon, 15 May 2023 15:21:27 +0300
Message-Id: <20230515122127.590733-1-sakari.ailus@linux.intel.com>
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
Oh well. Hopefully this is final then.

since v2:
- Use remote fwnode for finding the remote pad, not local.

 drivers/media/pci/intel/ipu3/ipu3-cio2-main.c | 28 ++++++++-----------
 1 file changed, 12 insertions(+), 16 deletions(-)

diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c b/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
index 39a8022eec396..2743ecc9b8e4b 100644
--- a/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
+++ b/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
@@ -1418,31 +1418,27 @@ static int cio2_notifier_complete(struct v4l2_async_notifier *notifier)
 	struct sensor_async_subdev *s_asd;
 	struct v4l2_async_connection *asd;
 	struct cio2_queue *q;
-	unsigned int pad;
 	int ret;
 
 	list_for_each_entry(asd, &cio2->notifier.done_list, asc_entry) {
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
+						  s_asd->asd.match.fwnode,
+						  MEDIA_PAD_FL_SOURCE);
+		if (ret < 0) {
+			dev_err(dev, "no pad for endpoint %pfw (%d)\n",
+				s_asd->asd.match.fwnode, ret);
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
+				q->sensor->name, s_asd->asd.match.fwnode, ret);
 			return ret;
 		}
 	}
-- 
2.30.2

