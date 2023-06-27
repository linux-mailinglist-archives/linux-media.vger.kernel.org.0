Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 915F77402B9
	for <lists+linux-media@lfdr.de>; Tue, 27 Jun 2023 19:57:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231855AbjF0R5k (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Jun 2023 13:57:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230361AbjF0R5i (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Jun 2023 13:57:38 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C881C296B
        for <linux-media@vger.kernel.org>; Tue, 27 Jun 2023 10:56:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1687888610;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=R0U8uQhbtG16k9BC3X+eFDuoEN8n7CYMNO+M8lwvbi0=;
        b=N50N82kje9SxsQvRb31bkBHt5m/cak2BYXCF3WQ0r+/R7CkZ3j1vusBe7nFNelCn2Ev0oj
        Ywh+NfV0O8M8oQ0ddOmsZBob8R98QmEwQS5A7k14EdSt1BYdJ9KrAl6gp8fo2RPmRbbY7l
        kdm/3ATQ8Z/FBZ60Mf1vVKL+BjmwPXs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-364-WU1u5ucgMSuV_zw8Zoy9jQ-1; Tue, 27 Jun 2023 13:56:47 -0400
X-MC-Unique: WU1u5ucgMSuV_zw8Zoy9jQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BDEDB92E4C1;
        Tue, 27 Jun 2023 17:56:46 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.194.24])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 6D98A200A3AD;
        Tue, 27 Jun 2023 17:56:45 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        Hao Yao <hao.yao@intel.com>, Bingbu Cao <bingbu.cao@intel.com>,
        linux-media@vger.kernel.org
Subject: [PATCH 01/12] media: ipu3-cio2: Do not use on stack memory for software_node.name field
Date:   Tue, 27 Jun 2023 19:56:31 +0200
Message-ID: <20230627175643.114778-2-hdegoede@redhat.com>
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

Commit 567f97bd381f ("media: ipu3-cio2: support multiple sensors and VCMs
with same HID") introduced an on stack vcm_name and then uses this for
the name field of the software_node struct used for the vcm.

But the software_node struct is much longer lived then the current
stack-frame, so this is no good.

Instead extend the cio2_node_names struct with an extra field to store
the vcm software_node name and use that.

Note this also changes the length of the allocated buffer from
ACPI_ID_LEN + 4 to 16. the name is filled with "<cio2_vcm_types[x]>-%u"
where cio2_vcm_types[x] is not an ACPI_ID. The maximum length of
the strings in the cio2_vcm_types[] array is 11 + 5 bytes for "-255\0"
means 16 bytes are needed in the worst case scenario.

Fixes: 567f97bd381f ("media: ipu3-cio2: support multiple sensors and VCMs with same HID")
Cc: Bingbu Cao <bingbu.cao@intel.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/pci/intel/ipu3/cio2-bridge.c | 7 +++----
 drivers/media/pci/intel/ipu3/cio2-bridge.h | 1 +
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/pci/intel/ipu3/cio2-bridge.c b/drivers/media/pci/intel/ipu3/cio2-bridge.c
index 3c2accfe5455..dab5395ccc84 100644
--- a/drivers/media/pci/intel/ipu3/cio2-bridge.c
+++ b/drivers/media/pci/intel/ipu3/cio2-bridge.c
@@ -220,7 +220,6 @@ static void cio2_bridge_create_connection_swnodes(struct cio2_bridge *bridge,
 						  struct cio2_sensor *sensor)
 {
 	struct software_node *nodes = sensor->swnodes;
-	char vcm_name[ACPI_ID_LEN + 4];
 
 	cio2_bridge_init_swnode_names(sensor);
 
@@ -240,10 +239,10 @@ static void cio2_bridge_create_connection_swnodes(struct cio2_bridge *bridge,
 						sensor->cio2_properties);
 	if (sensor->ssdb.vcmtype) {
 		/* append ssdb.link to distinguish VCM nodes with same HID */
-		snprintf(vcm_name, sizeof(vcm_name), "%s-%u",
-			 cio2_vcm_types[sensor->ssdb.vcmtype - 1],
+		snprintf(sensor->node_names.vcm, sizeof(sensor->node_names.vcm),
+			 "%s-%u", cio2_vcm_types[sensor->ssdb.vcmtype - 1],
 			 sensor->ssdb.link);
-		nodes[SWNODE_VCM] = NODE_VCM(vcm_name);
+		nodes[SWNODE_VCM] = NODE_VCM(sensor->node_names.vcm);
 	}
 
 	cio2_bridge_init_swnode_group(sensor);
diff --git a/drivers/media/pci/intel/ipu3/cio2-bridge.h b/drivers/media/pci/intel/ipu3/cio2-bridge.h
index b76ed8a641e2..a824b96bcdf2 100644
--- a/drivers/media/pci/intel/ipu3/cio2-bridge.h
+++ b/drivers/media/pci/intel/ipu3/cio2-bridge.h
@@ -104,6 +104,7 @@ struct cio2_node_names {
 	char port[7];
 	char endpoint[11];
 	char remote_port[7];
+	char vcm[16];
 };
 
 struct cio2_sensor_config {
-- 
2.41.0

