Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3582F721880
	for <lists+linux-media@lfdr.de>; Sun,  4 Jun 2023 18:15:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230392AbjFDQPQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 4 Jun 2023 12:15:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232085AbjFDQPO (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 4 Jun 2023 12:15:14 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35D6BBD
        for <linux-media@vger.kernel.org>; Sun,  4 Jun 2023 09:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1685895264;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=M3j4urxrfbfsTzi9VhtL6nDLuxZBzv2hqo4tFVVp13E=;
        b=ek0l5E/bPnEZYsm/KUL5KqobXZayXfuwuFbHBeIOXEg3zPP/HPWiROryX9hmFugeen8XPj
        iphUwCLvU8BZ83uG+5vpdbOCXH7uY4WB5SpsQ+hCxmoU3xsjFhGCBgHMwSav9TcKKvhP8W
        qDzPgRBIu9+3GiABxWoZ3QZmr55xyeI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-488-GwxHq19ROFWPj0DMcjTnIA-1; Sun, 04 Jun 2023 12:14:19 -0400
X-MC-Unique: GwxHq19ROFWPj0DMcjTnIA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6828C3C02B7A;
        Sun,  4 Jun 2023 16:14:18 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.9])
        by smtp.corp.redhat.com (Postfix) with ESMTP id D711E401029;
        Sun,  4 Jun 2023 16:14:15 +0000 (UTC)
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
Subject: [PATCH 2/5] media: atomisp: ov2680: Stop using half pixelclock for binned modes
Date:   Sun,  4 Jun 2023 18:14:03 +0200
Message-Id: <20230604161406.69369-3-hdegoede@redhat.com>
In-Reply-To: <20230604161406.69369-1-hdegoede@redhat.com>
References: <20230604161406.69369-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Stop using half pixelclock for binned modes this fixes:
1. The exposure being twice as high for binned mods (due to the half clk)
2. The framerate being 15 fps instead of 30 fps

The original code with fixed per mode register lists did use half pixel
clk, but this should be combined with using half for the VTS value too.

Using half VTS fixes the framerate issue, but this has the undesired
side-effect of change the exposure ctrl range (half the range, double
the amount of exposure per step).

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/i2c/atomisp-ov2680.c | 8 +-------
 drivers/staging/media/atomisp/i2c/ov2680.h         | 1 +
 2 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
index 3ec0421b90a5..1db2eb9f9e25 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
@@ -244,27 +244,21 @@ static void ov2680_calc_mode(struct ov2680_dev *sensor)
 static int ov2680_set_mode(struct ov2680_dev *sensor)
 {
 	struct i2c_client *client = sensor->client;
-	u8 pll_div, unknown, inc, fmt1, fmt2;
+	u8 unknown, inc, fmt1, fmt2;
 	int ret;
 
 	if (sensor->mode.binning) {
-		pll_div = 1;
 		unknown = 0x23;
 		inc = 0x31;
 		fmt1 = 0xc2;
 		fmt2 = 0x01;
 	} else {
-		pll_div = 0;
 		unknown = 0x21;
 		inc = 0x11;
 		fmt1 = 0xc0;
 		fmt2 = 0x00;
 	}
 
-	ret = ov_write_reg8(client, 0x3086, pll_div);
-	if (ret)
-		return ret;
-
 	ret = ov_write_reg8(client, 0x370a, unknown);
 	if (ret)
 		return ret;
diff --git a/drivers/staging/media/atomisp/i2c/ov2680.h b/drivers/staging/media/atomisp/i2c/ov2680.h
index fd9c7485f8c1..b6c0ef591c69 100644
--- a/drivers/staging/media/atomisp/i2c/ov2680.h
+++ b/drivers/staging/media/atomisp/i2c/ov2680.h
@@ -181,6 +181,7 @@ static struct ov2680_reg const ov2680_global_setting[] = {
 	{0x3082, 0x45},
 	{0x3084, 0x09},
 	{0x3085, 0x04},
+	{0x3086, 0x00},
 	{0x3503, 0x03},
 	{0x350b, 0x36},
 	{0x3600, 0xb4},
-- 
2.40.1

