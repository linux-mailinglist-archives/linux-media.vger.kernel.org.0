Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE2E4677BBF
	for <lists+linux-media@lfdr.de>; Mon, 23 Jan 2023 13:53:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231613AbjAWMx2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Jan 2023 07:53:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231859AbjAWMx1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Jan 2023 07:53:27 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EEFD7EE8
        for <linux-media@vger.kernel.org>; Mon, 23 Jan 2023 04:52:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1674478358;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=CZ12ejeYl100/U4BG3/nBetZC8aAp4eDcs4J6fKaeyE=;
        b=jMWY0e8A6xTkgmckLkyDCgi5gX3rQvCEQ2378teoCNzApj0pdi5xW85od4cjhTs2dDowLm
        2QSgfjCUd8fzb/UR1ORpN6o9dEYZePdPMEFEoxpU81xm/Bk0n3pPIbq6BRK++2Z0hTD54X
        266GWFJ2yxtd/pyUC5g+/KW32ufglp4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-329-5w0J3MQGPPuXMH3r-F2eWw-1; Mon, 23 Jan 2023 07:52:28 -0500
X-MC-Unique: 5w0J3MQGPPuXMH3r-F2eWw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9D557811E6E;
        Mon, 23 Jan 2023 12:52:27 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.194.13])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 10C5BC15BA0;
        Mon, 23 Jan 2023 12:52:24 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Andy Shevchenko <andy@kernel.org>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH 06/57] media: atomisp: Remove non working doorbell check from punit_ddr_dvfs_enable()
Date:   Mon, 23 Jan 2023 13:51:14 +0100
Message-Id: <20230123125205.622152-7-hdegoede@redhat.com>
In-Reply-To: <20230123125205.622152-1-hdegoede@redhat.com>
References: <20230123125205.622152-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

punit_ddr_dvfs_enable() is only used on CHT devices and there dmesg
gets filled with: "DDR DVFS, door bell is not cleared within 3ms"
messages, so clearly the doorbell checking is not working.

This check was added by:
https://github.com/intel/ProductionKernelQuilts/blob/master/uefi/cht-m1stable/patches/cam-0340-atomisp-add-door-bell-for-ddr-dvfs-on-cht.patch

Which commit message says: "PUNIT interface added to check Req_ACK
of freq status". This suggests that the doorbell mechanism may only
be available with certain PUNIT fw versions and it seems that
many CHT devices do not have this fw version; that or the doorbell
mechanism is not working for other reasons.

Revert cam-0340-atomisp-add-door-bell-for-ddr-dvfs-on-cht.patch,
replacing the doorbell check with a msleep(20) this fixes dmesg
getting filled with error messages.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../staging/media/atomisp/pci/atomisp_v4l2.c    | 17 ++++-------------
 1 file changed, 4 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
index e994a4a5284e..9eea8ffbc3d6 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
@@ -638,27 +638,16 @@ static int atomisp_mrfld_pre_power_down(struct atomisp_device *isp)
 */
 static void punit_ddr_dvfs_enable(bool enable)
 {
-	int door_bell = 1 << 8;
-	int max_wait = 30;
 	int reg;
 
 	iosf_mbi_read(BT_MBI_UNIT_PMC, MBI_REG_READ, MRFLD_ISPSSDVFS, &reg);
 	if (enable) {
 		reg &= ~(MRFLD_BIT0 | MRFLD_BIT1);
 	} else {
-		reg |= (MRFLD_BIT1 | door_bell);
+		reg |= MRFLD_BIT1;
 		reg &= ~(MRFLD_BIT0);
 	}
 	iosf_mbi_write(BT_MBI_UNIT_PMC, MBI_REG_WRITE, MRFLD_ISPSSDVFS, reg);
-
-	/* Check Req_ACK to see freq status, wait until door_bell is cleared */
-	while ((reg & door_bell) && max_wait--) {
-		iosf_mbi_read(BT_MBI_UNIT_PMC, MBI_REG_READ, MRFLD_ISPSSDVFS, &reg);
-		usleep_range(100, 500);
-	}
-
-	if (max_wait == -1)
-		pr_info("DDR DVFS, door bell is not cleared within 3ms\n");
 }
 
 static int atomisp_mrfld_power(struct atomisp_device *isp, bool enable)
@@ -671,8 +660,10 @@ static int atomisp_mrfld_power(struct atomisp_device *isp, bool enable)
 	dev_dbg(isp->dev, "IUNIT power-%s.\n", enable ? "on" : "off");
 
 	/* WA for P-Unit, if DVFS enabled, ISP timeout observed */
-	if (IS_CHT && enable)
+	if (IS_CHT && enable) {
 		punit_ddr_dvfs_enable(false);
+		msleep(20);
+	}
 
 	/*
 	 * FIXME:WA for ECS28A, with this sleep, CTS
-- 
2.39.0

