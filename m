Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2B6387D4D6D
	for <lists+linux-media@lfdr.de>; Tue, 24 Oct 2023 12:14:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234428AbjJXKOV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Oct 2023 06:14:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234316AbjJXKOU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Oct 2023 06:14:20 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4525F109
        for <linux-media@vger.kernel.org>; Tue, 24 Oct 2023 03:13:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1698142413;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Jhf+zih70iLYmxsfOGmu6Bkx6txhyZ4Vq4nAhrEWTdA=;
        b=do12yd8+aG4c8CkPKD1n90TFEq1QHYezmeTUnIZVbBeXpepQ/K/YK8NcTri4cI3cT93M8z
        YssfZT8rZxJVmQ1HciO8S+5nb0vAn5X9kAAcW7qk4qKcOBOo/4H3GzrpNk1q/InAMTrkqE
        p9uiMq7uF92o+wphHyupr0EmqrnaFWY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-539-EmnB8n_zOdCjSI4iha6BKg-1; Tue, 24 Oct 2023 06:13:24 -0400
X-MC-Unique: EmnB8n_zOdCjSI4iha6BKg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9C6A9891F21;
        Tue, 24 Oct 2023 10:13:23 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.194.214])
        by smtp.corp.redhat.com (Postfix) with ESMTP id BA66F492BFB;
        Tue, 24 Oct 2023 10:13:22 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Wentong Wu <wentong.wu@intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, Kate Hsuan <hpa@redhat.com>,
        linux-media@vger.kernel.org
Subject: [PATCH 2/2] media: mei_ace: Fix driver modalias not matching device modalias
Date:   Tue, 24 Oct 2023 12:13:19 +0200
Message-ID: <20231024101319.11878-3-hdegoede@redhat.com>
In-Reply-To: <20231024101319.11878-1-hdegoede@redhat.com>
References: <20231024101319.11878-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.10
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The name field of struct mei_cl_device_id is only intended for use
with NFC devices where different devices share the same GUID,
see drivers/misc/mei/bus-fixup.c which sets the name field to
"microread" or "pn544".

For all other mei devices the name field is unset and specifying
it in the drivers mei_cl_device_id MODULE_DEVICE_TABLE() leads
to the driver not properly being autoloaded by modprobe since
it causes the module's alias to not match:

cat .../spi-INTC1094:00-5db76cf6-0a68-4ed6-9b78-0361635e2447/modalias
mei::5db76cf6-0a68-4ed6-9b78-0361635e2447:01:

modinfo mei_ace | grep alias
mei:vsc_ace:5db76cf6-0a68-4ed6-9b78-0361635e2447:*:*

Things still work when manually loading the module because
mei_cl_device_find() only matches the name when the *device* has a name
set, so setting it in the id_table of the driver does not matter.

Drop setting the name in mei_ace_tbl[] so that modprobe will
properly autoload the module.

This makes the mei_cl_device_id use identical to all
the other non NFC mei drivers:
drivers/misc/mei/gsc_proxy/mei_gsc_proxy.c
drivers/misc/mei/hdcp/mei_hdcp.c
drivers/misc/mei/pxp/mei_pxp.c
drivers/watchdog/mei_wdt.c

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/pci/intel/ivsc/mei_ace.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/pci/intel/ivsc/mei_ace.c b/drivers/media/pci/intel/ivsc/mei_ace.c
index a0491f307831..e0a4deb9dc16 100644
--- a/drivers/media/pci/intel/ivsc/mei_ace.c
+++ b/drivers/media/pci/intel/ivsc/mei_ace.c
@@ -554,7 +554,7 @@ static const struct dev_pm_ops mei_ace_pm_ops = {
 			     0x9B, 0x78, 0x03, 0x61, 0x63, 0x5E, 0x24, 0x47)
 
 static const struct mei_cl_device_id mei_ace_tbl[] = {
-	{ MEI_ACE_DRIVER_NAME, MEI_ACE_UUID, MEI_CL_VERSION_ANY },
+	{ .uuid = MEI_ACE_UUID, .version = MEI_CL_VERSION_ANY },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(mei, mei_ace_tbl);
-- 
2.41.0

