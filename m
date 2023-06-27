Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4F8357402BA
	for <lists+linux-media@lfdr.de>; Tue, 27 Jun 2023 19:57:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231909AbjF0R5v (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Jun 2023 13:57:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231859AbjF0R5n (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Jun 2023 13:57:43 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8B252D4F
        for <linux-media@vger.kernel.org>; Tue, 27 Jun 2023 10:56:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1687888610;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=w8MUS/JF8mAAIA1wCYsaqakNYwVwRSrtgG+mkyN+AN8=;
        b=csgb1aPYBP8vH49iRy/tCbVWItcxeW6dx3JIdYijb8pCVrwJ8erARAdzGVJDZP0CUiTJTs
        eiOCqoTmlqvaaDSdUKztWvLYBb3L4ojilr72llxEr6Le0MyVk5O/iGBtuMXyzAh0sj747J
        QBwRtquW9nVDrYRtJXjc2oKn3T9eEDs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-618-4bdiVO-hN4ulDOOFVJgbRw-1; Tue, 27 Jun 2023 13:56:48 -0400
X-MC-Unique: 4bdiVO-hN4ulDOOFVJgbRw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4FAB1280BC4C;
        Tue, 27 Jun 2023 17:56:48 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.194.24])
        by smtp.corp.redhat.com (Postfix) with ESMTP id F203E200A3AD;
        Tue, 27 Jun 2023 17:56:46 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        Hao Yao <hao.yao@intel.com>, Bingbu Cao <bingbu.cao@intel.com>,
        linux-media@vger.kernel.org
Subject: [PATCH 02/12] media: ipu3-cio2: Move initialization of node_names.vcm to cio2_bridge_init_swnode_names()
Date:   Tue, 27 Jun 2023 19:56:32 +0200
Message-ID: <20230627175643.114778-3-hdegoede@redhat.com>
In-Reply-To: <20230627175643.114778-1-hdegoede@redhat.com>
References: <20230627175643.114778-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Move initialization of node_names.vcm to cio2_bridge_init_swnode_names()
where it belongs.

And make the initialization of nodes[SWNODE_VCM] unconditional,
cio2_bridge_init_swnode_group() takes care of not registering it
when there is no VCM.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/pci/intel/ipu3/cio2-bridge.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/media/pci/intel/ipu3/cio2-bridge.c b/drivers/media/pci/intel/ipu3/cio2-bridge.c
index dab5395ccc84..0f7adca9d6f9 100644
--- a/drivers/media/pci/intel/ipu3/cio2-bridge.c
+++ b/drivers/media/pci/intel/ipu3/cio2-bridge.c
@@ -201,6 +201,12 @@ static void cio2_bridge_init_swnode_names(struct cio2_sensor *sensor)
 	snprintf(sensor->node_names.endpoint,
 		 sizeof(sensor->node_names.endpoint),
 		 SWNODE_GRAPH_ENDPOINT_NAME_FMT, 0); /* And endpoint 0 */
+	if (sensor->ssdb.vcmtype) {
+		/* append ssdb.link to distinguish nodes with same model VCM */
+		snprintf(sensor->node_names.vcm, sizeof(sensor->node_names.vcm),
+			 "%s-%u", cio2_vcm_types[sensor->ssdb.vcmtype - 1],
+			 sensor->ssdb.link);
+	}
 }
 
 static void cio2_bridge_init_swnode_group(struct cio2_sensor *sensor)
@@ -237,13 +243,7 @@ static void cio2_bridge_create_connection_swnodes(struct cio2_bridge *bridge,
 						sensor->node_names.endpoint,
 						&nodes[SWNODE_CIO2_PORT],
 						sensor->cio2_properties);
-	if (sensor->ssdb.vcmtype) {
-		/* append ssdb.link to distinguish VCM nodes with same HID */
-		snprintf(sensor->node_names.vcm, sizeof(sensor->node_names.vcm),
-			 "%s-%u", cio2_vcm_types[sensor->ssdb.vcmtype - 1],
-			 sensor->ssdb.link);
-		nodes[SWNODE_VCM] = NODE_VCM(sensor->node_names.vcm);
-	}
+	nodes[SWNODE_VCM] = NODE_VCM(sensor->node_names.vcm);
 
 	cio2_bridge_init_swnode_group(sensor);
 }
-- 
2.41.0

