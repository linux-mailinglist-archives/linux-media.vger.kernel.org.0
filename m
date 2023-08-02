Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 650B976D5A7
	for <lists+linux-media@lfdr.de>; Wed,  2 Aug 2023 19:40:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233159AbjHBRkF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Aug 2023 13:40:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230523AbjHBRjx (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Aug 2023 13:39:53 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBD4D3C24
        for <linux-media@vger.kernel.org>; Wed,  2 Aug 2023 10:38:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1690997889;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=zv4wc/KrPFjSdLd8ZjfVcuoMD+rO4L1aVjHfc9rhDPg=;
        b=Kekr8AnrkQC+gwgWiVCX5kkeGCf9RlB3Cee+N+WlAyq2XxGWhXJM4tJB66hTdjmsQ0AL4V
        HczEgWHceYqO6XGPuBsSBoqZ2mdDR0o/8cqfLJQpM6lSbJ6vZvgogyvsYX+feu3m2j6PVi
        qanvMxLr2YqiUzcF/R8GunyPYHRAhqY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-68-eNjTtrKQOv2o7MEZkSLjwA-1; Wed, 02 Aug 2023 13:32:01 -0400
X-MC-Unique: eNjTtrKQOv2o7MEZkSLjwA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8FD6F90E420;
        Wed,  2 Aug 2023 17:32:00 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.110])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 357B91454143;
        Wed,  2 Aug 2023 17:31:59 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Daniel Scally <dan.scally@ideasonboard.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Tommaso Merciai <tomm.merciai@gmail.com>,
        linux-media@vger.kernel.org
Subject: [PATCH v4 31/32] media: ipu-bridge: Add link-frequency to OV2680 ipu_supported_sensors[] entry
Date:   Wed,  2 Aug 2023 19:30:45 +0200
Message-ID: <20230802173046.368434-32-hdegoede@redhat.com>
In-Reply-To: <20230802173046.368434-1-hdegoede@redhat.com>
References: <20230802173046.368434-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Now that the ov2680 driver verifies the bus-cfg from the endpoint
fwnode the link-frequency must be set for things to work.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/pci/intel/ipu-bridge.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index 940457940057..be9ab2ab6b8d 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -30,7 +30,7 @@ static const struct ipu_sensor_config ipu_supported_sensors[] = {
 	/* Omnivision OV7251 */
 	IPU_SENSOR_CONFIG("INT347E", 1, 319200000),
 	/* Omnivision OV2680 */
-	IPU_SENSOR_CONFIG("OVTI2680", 0),
+	IPU_SENSOR_CONFIG("OVTI2680", 1, 331200000),
 	/* Omnivision ov8856 */
 	IPU_SENSOR_CONFIG("OVTI8856", 3, 180000000, 360000000, 720000000),
 	/* Omnivision ov2740 */
-- 
2.41.0

