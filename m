Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E88F86316F6
	for <lists+linux-media@lfdr.de>; Sun, 20 Nov 2022 23:44:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229769AbiKTWoF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 20 Nov 2022 17:44:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229735AbiKTWoE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 20 Nov 2022 17:44:04 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1DB525C6D
        for <linux-media@vger.kernel.org>; Sun, 20 Nov 2022 14:41:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1668984113;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=MWyOxLMViW1TAHabsoOU/2cIorVkoo4S1pV51b0SvFE=;
        b=cybgcjoIimR73IZF57a2yDnNrSaVzQU9bFQ78piXS9KyhiwaUTe1uwsAkqX2KMfOShWJOx
        dKtXVkgMSduoiROSdLttt6Y2kT/EMOsOc0vBJ0BjRrYSIcPohMuTvH9P/pAdoO+oRG2Su6
        QDPPPhrp3hg0p9+KfWOfKIF+jyvONtI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-517-3eDJ2gTsOzmVKnJ_yOVQkw-1; Sun, 20 Nov 2022 17:41:46 -0500
X-MC-Unique: 3eDJ2gTsOzmVKnJ_yOVQkw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3E537801755;
        Sun, 20 Nov 2022 22:41:45 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.70])
        by smtp.corp.redhat.com (Postfix) with ESMTP id BE02B47505E;
        Sun, 20 Nov 2022 22:41:43 +0000 (UTC)
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
Subject: [PATCH 20/20] media: atomisp_ov2680: Fix 1280x720 -> 1296x736 resolution
Date:   Sun, 20 Nov 2022 23:41:01 +0100
Message-Id: <20221120224101.746199-21-hdegoede@redhat.com>
In-Reply-To: <20221120224101.746199-1-hdegoede@redhat.com>
References: <20221120224101.746199-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The ov2680_720p_30fps register init list used for the 1296x736 resolution
sets the hsize register to 1296 and the vsize register to 736.

This is actually the right thing to do when combined with the atomISP2
because the ISP requires 16 bytes padding leaving userspace to see
1280x720.

But the resolution list entries for this was incorrectly reporting
the resolution being send to the ISP as already being 1280x720,
leaving usespace to see 1274x704 as resolution.

Worse then userspace seeing a weird resolution selecting the
1280x720 sensor resolution (which in reality is sending 1296x736
to the ISP was causing the ISP to hang on Cherry Trail based tablets
(Bay Trail works fine for some reason).

This commit also adds a bunch of comments annotating what
the various register writes in the init lists are doing.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/i2c/ov2680.h | 46 +++++++++++-----------
 1 file changed, 23 insertions(+), 23 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/ov2680.h b/drivers/staging/media/atomisp/i2c/ov2680.h
index 4e351196fe34..7ab337b859ad 100644
--- a/drivers/staging/media/atomisp/i2c/ov2680.h
+++ b/drivers/staging/media/atomisp/i2c/ov2680.h
@@ -485,19 +485,19 @@ static struct ov2680_reg const ov2680_720x592_30fps[] = {
 static struct ov2680_reg const ov2680_800x600_30fps[] = {
 	{0x3086, 0x01},
 	{0x370a, 0x23},
-	{0x3801, 0x00},
+	{0x3801, 0x00}, /* hstart 0 */
 	{0x3802, 0x00},
-	{0x3803, 0x00},
+	{0x3803, 0x00}, /* vstart 0 */
 	{0x3804, 0x06},
-	{0x3805, 0x4f},
+	{0x3805, 0x4f}, /* hend 1615 */
 	{0x3806, 0x04},
-	{0x3807, 0xbf},
+	{0x3807, 0xbf}, /* vend 1215 */
 	{0x3808, 0x03},
-	{0x3809, 0x20},
+	{0x3809, 0x20}, /* hsize 800 */
 	{0x380a, 0x02},
-	{0x380b, 0x58},
+	{0x380b, 0x58}, /* vsize 600 */
 	{0x380c, 0x06},
-	{0x380d, 0xac},
+	{0x380d, 0xac}, /* htotal 1708 */
 	{0x3810, 0x00},
 	{0x3811, 0x00},
 	{0x3812, 0x00},
@@ -524,19 +524,19 @@ static struct ov2680_reg const ov2680_800x600_30fps[] = {
 static struct ov2680_reg const ov2680_720p_30fps[] = {
 	{0x3086, 0x00},
 	{0x370a, 0x21},
-	{0x3801, 0xa0},
+	{0x3801, 0xa0}, /* hstart 160 */
 	{0x3802, 0x00},
-	{0x3803, 0xf2},
+	{0x3803, 0xf2}, /* vstart 242 */
 	{0x3804, 0x05},
-	{0x3805, 0xbf},
+	{0x3805, 0xbf}, /* hend 1471 */
 	{0x3806, 0x03},
-	{0x3807, 0xdd},
+	{0x3807, 0xdd}, /* vend 989 */
 	{0x3808, 0x05},
-	{0x3809, 0x10},
+	{0x3809, 0x10}, /* hsize 1296 */
 	{0x380a, 0x02},
-	{0x380b, 0xe0},
+	{0x380b, 0xe0}, /* vsize 736 */
 	{0x380c, 0x06},
-	{0x380d, 0xa8},
+	{0x380d, 0xa8}, /* htotal 1704 */
 	{0x3810, 0x00},
 	{0x3811, 0x08},
 	{0x3812, 0x00},
@@ -563,19 +563,19 @@ static struct ov2680_reg const ov2680_720p_30fps[] = {
 static struct ov2680_reg const ov2680_1296x976_30fps[] = {
 	{0x3086, 0x00},
 	{0x370a, 0x21},
-	{0x3801, 0xa0},
+	{0x3801, 0xa0}, /* hstart 160 */
 	{0x3802, 0x00},
-	{0x3803, 0x78},
+	{0x3803, 0x78}, /* vstart 120 */
 	{0x3804, 0x05},
-	{0x3805, 0xbf},
+	{0x3805, 0xbf}, /* hend 1471 */
 	{0x3806, 0x04},
-	{0x3807, 0x57},
+	{0x3807, 0x57}, /* vend 1111 */
 	{0x3808, 0x05},
-	{0x3809, 0x10},
+	{0x3809, 0x10}, /* hsize 1296 */
 	{0x380a, 0x03},
-	{0x380b, 0xd0},
+	{0x380b, 0xd0}, /* vsize 976 */
 	{0x380c, 0x06},
-	{0x380d, 0xa8},
+	{0x380d, 0xa8}, /* htotal 1704 */
 	{0x3810, 0x00},
 	{0x3811, 0x08},
 	{0x3812, 0x00},
@@ -820,8 +820,8 @@ static struct ov2680_resolution ov2680_res_preview[] = {
 		.regs = ov2680_1296x976_30fps,
 	},
 	{
-		.width = 1280,
-		.height = 720,
+		.width = 1296,
+		.height = 736,
 		.fps = 60,
 		.pix_clk_freq = 66,
 		.pixels_per_line = 1698,//1704,
-- 
2.38.1

