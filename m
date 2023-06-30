Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B768743A58
	for <lists+linux-media@lfdr.de>; Fri, 30 Jun 2023 13:08:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232768AbjF3LIb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Jun 2023 07:08:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230178AbjF3LIR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Jun 2023 07:08:17 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13A9535B6
        for <linux-media@vger.kernel.org>; Fri, 30 Jun 2023 04:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1688123250;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=9ukcLME768l1S+BSrqeDM2lUjeMVGj/zgUi9p7TG8kQ=;
        b=cNStkiXRhQTNzWDXUVTPmfep+cHpa2QtbV1megQi7gLyoHaTAHIx36JWz8a9xhe8XV1lO7
        mNeUlxpbQuEZ+qVtrC1wCRSEQ01SXk+Se5LN0lTe7gBiTVfI94H0FwHFSNUqfT00PXnM/3
        86KTktUxvjPIMjvqHjd4La3lBNpS30g=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-121-q4MySscdMVmd40q4Lzq_CQ-1; Fri, 30 Jun 2023 07:07:26 -0400
X-MC-Unique: q4MySscdMVmd40q4Lzq_CQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6D7F8835050;
        Fri, 30 Jun 2023 11:07:26 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.193.184])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 1996548FB02;
        Fri, 30 Jun 2023 11:07:24 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        Hao Yao <hao.yao@intel.com>, Bingbu Cao <bingbu.cao@intel.com>,
        linux-media@vger.kernel.org
Subject: [PATCH v2 12/15] media: ipu-bridge: Add GalaxyCore GC0310 to ipu_supported_sensors[]
Date:   Fri, 30 Jun 2023 13:06:40 +0200
Message-ID: <20230630110643.209761-13-hdegoede@redhat.com>
In-Reply-To: <20230630110643.209761-1-hdegoede@redhat.com>
References: <20230630110643.209761-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The GalaxyCore GC0310 is used together with the atomisp no various
devices, add it to ipu_supported_sensors[].

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/pci/intel/ipu-bridge.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index eb7c56e8ef9f..07a34f20af8e 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -36,6 +36,8 @@ static const struct ipu_sensor_config ipu_supported_sensors[] = {
 	IPU_SENSOR_CONFIG("INT3537", 1, 437000000),
 	/* Omnivision ov13b10 */
 	IPU_SENSOR_CONFIG("OVTIDB10", 1, 560000000),
+	/* GalaxyCore GC0310 */
+	IPU_SENSOR_CONFIG("INT0310", 0),
 };
 
 static const struct ipu_property_names prop_names = {
-- 
2.41.0

