Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 38693743A53
	for <lists+linux-media@lfdr.de>; Fri, 30 Jun 2023 13:08:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231633AbjF3LIS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Jun 2023 07:08:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230013AbjF3LIC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Jun 2023 07:08:02 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DE6930F7
        for <linux-media@vger.kernel.org>; Fri, 30 Jun 2023 04:06:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1688123216;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=9cGL2hQIZ3D1OzVC0VCv0O8LlEmMh1LNLve5le9XibY=;
        b=QlR4TjIaWjQHyciBwj3lnn8+mcUQmNxASYlGtv4sYnnCOtL0461+cYuGddxXqXKZ9wpHRe
        bG2gReWBgxCnyXyUdkEfjdgQ7/cRU5sZ5jo+G2LdlPscZPMTM9NbIu6K5vLrJcezfgJrfn
        g5WwUygE96nlkplg6+/N2a5Xrpwbiok=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-255-NRZ3xLNGPS6PjX2TRNkNyQ-1; Fri, 30 Jun 2023 07:06:53 -0400
X-MC-Unique: NRZ3xLNGPS6PjX2TRNkNyQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CD41C8910F6;
        Fri, 30 Jun 2023 11:06:52 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.193.184])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 56FBF492B02;
        Fri, 30 Jun 2023 11:06:50 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        Hao Yao <hao.yao@intel.com>, Bingbu Cao <bingbu.cao@intel.com>,
        linux-media@vger.kernel.org
Subject: [PATCH v2 03/15] media: ipu-bridge: Move initialization of node_names.vcm to ipu_bridge_init_swnode_names()
Date:   Fri, 30 Jun 2023 13:06:31 +0200
Message-ID: <20230630110643.209761-4-hdegoede@redhat.com>
In-Reply-To: <20230630110643.209761-1-hdegoede@redhat.com>
References: <20230630110643.209761-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Move initialization of node_names.vcm to ipu_bridge_init_swnode_names()
where it belongs.

And make the initialization of nodes[SWNODE_VCM] unconditional,
ipu_bridge_init_swnode_group() takes care of not registering it
when there is no VCM.

Reviewed-by: Andy Shevchenko <andy@kernel.org>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/pci/intel/ipu-bridge.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index ef6c6cb7b51b..1c88fd925a8b 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -201,6 +201,12 @@ static void ipu_bridge_init_swnode_names(struct ipu_sensor *sensor)
 	snprintf(sensor->node_names.endpoint,
 		 sizeof(sensor->node_names.endpoint),
 		 SWNODE_GRAPH_ENDPOINT_NAME_FMT, 0); /* And endpoint 0 */
+	if (sensor->ssdb.vcmtype) {
+		/* append ssdb.link to distinguish nodes with same model VCM */
+		snprintf(sensor->node_names.vcm, sizeof(sensor->node_names.vcm),
+			 "%s-%u", ipu_vcm_types[sensor->ssdb.vcmtype - 1],
+			 sensor->ssdb.link);
+	}
 }
 
 static void ipu_bridge_init_swnode_group(struct ipu_sensor *sensor)
@@ -237,13 +243,7 @@ static void ipu_bridge_create_connection_swnodes(struct ipu_bridge *bridge,
 						sensor->node_names.endpoint,
 						&nodes[SWNODE_IPU_PORT],
 						sensor->ipu_properties);
-	if (sensor->ssdb.vcmtype) {
-		/* append ssdb.link to distinguish VCM nodes with same HID */
-		snprintf(sensor->node_names.vcm, sizeof(sensor->node_names.vcm),
-			 "%s-%u", ipu_vcm_types[sensor->ssdb.vcmtype - 1],
-			 sensor->ssdb.link);
-		nodes[SWNODE_VCM] = NODE_VCM(sensor->node_names.vcm);
-	}
+	nodes[SWNODE_VCM] = NODE_VCM(sensor->node_names.vcm);
 
 	ipu_bridge_init_swnode_group(sensor);
 }
-- 
2.41.0

