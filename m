Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 89460708522
	for <lists+linux-media@lfdr.de>; Thu, 18 May 2023 17:38:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231491AbjERPin (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 May 2023 11:38:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231362AbjERPi3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 May 2023 11:38:29 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA49BD7
        for <linux-media@vger.kernel.org>; Thu, 18 May 2023 08:37:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1684424265;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=dMT5xrzVZ3FBHKSt/zrpdXr0SeyitSqkJJcvC33ry9s=;
        b=RY5gU9N7WtRoXAmR8IoucDruUvIo9/BtUgSF5sFxH5G6IXUbMopkUYk9Zf3ADvuMinGnhS
        nRU1YaiBLq6YxUv1bx8f++mb9/b9GI7g0VnCRUQKXwV3AjIgeqKEk920o8P2f10S5z2Gp7
        IgkuKYoTNQa8B1702U5VIhLUkN+/lss=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-593-uRfJBWA3NGSAEMb0iWEnMA-1; Thu, 18 May 2023 11:37:40 -0400
X-MC-Unique: uRfJBWA3NGSAEMb0iWEnMA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B14511C05B02;
        Thu, 18 May 2023 15:37:37 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.133])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 33DDA63F5F;
        Thu, 18 May 2023 15:37:36 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>, Kate Hsuan <hpa@redhat.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH 1/9] media: atomisp: Drop MRFLD_PORT_NUM define
Date:   Thu, 18 May 2023 17:37:25 +0200
Message-Id: <20230518153733.195306-2-hdegoede@redhat.com>
In-Reply-To: <20230518153733.195306-1-hdegoede@redhat.com>
References: <20230518153733.195306-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The info in the MRFLD_PORT_NUM define is duplicate with
the ATOMISP_CAMERA_NR_PORTS define. Drop MRFLD_PORT_NUM.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/pci/atomisp-regs.h | 1 -
 drivers/staging/media/atomisp/pci/atomisp_v4l2.c | 8 ++++----
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp-regs.h b/drivers/staging/media/atomisp/pci/atomisp-regs.h
index 022997f47121..a7b0196686be 100644
--- a/drivers/staging/media/atomisp/pci/atomisp-regs.h
+++ b/drivers/staging/media/atomisp/pci/atomisp-regs.h
@@ -112,7 +112,6 @@
 
 /* MRFLD CSI lane configuration related */
 #define MRFLD_PORT_CONFIG_NUM  8
-#define MRFLD_PORT_NUM         3
 #define MRFLD_PORT1_ENABLE_SHIFT       0
 #define MRFLD_PORT2_ENABLE_SHIFT       1
 #define MRFLD_PORT3_ENABLE_SHIFT       2
diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
index a76b60f8b411..93998fdc836d 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
@@ -701,7 +701,7 @@ int atomisp_csi_lane_config(struct atomisp_device *isp)
 	struct pci_dev *pdev = to_pci_dev(isp->dev);
 	static const struct {
 		u8 code;
-		u8 lanes[MRFLD_PORT_NUM];
+		u8 lanes[ATOMISP_CAMERA_NR_PORTS];
 	} portconfigs[] = {
 		/* Tangier/Merrifield available lane configurations */
 		{ 0x00, { 4, 1, 0 } },		/* 00000 */
@@ -725,7 +725,7 @@ int atomisp_csi_lane_config(struct atomisp_device *isp)
 	};
 
 	unsigned int i, j;
-	u8 sensor_lanes[MRFLD_PORT_NUM] = { 0 };
+	u8 sensor_lanes[ATOMISP_CAMERA_NR_PORTS] = { 0 };
 	u32 csi_control;
 	int nportconfigs;
 	u32 port_config_mask;
@@ -782,12 +782,12 @@ int atomisp_csi_lane_config(struct atomisp_device *isp)
 	}
 
 	for (i = 0; i < nportconfigs; i++) {
-		for (j = 0; j < MRFLD_PORT_NUM; j++)
+		for (j = 0; j < ATOMISP_CAMERA_NR_PORTS; j++)
 			if (sensor_lanes[j] &&
 			    sensor_lanes[j] != portconfigs[i].lanes[j])
 				break;
 
-		if (j == MRFLD_PORT_NUM)
+		if (j == ATOMISP_CAMERA_NR_PORTS)
 			break;			/* Found matching setting */
 	}
 
-- 
2.40.1

