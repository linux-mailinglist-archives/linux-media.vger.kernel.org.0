Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C98E318B244
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2020 12:22:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727041AbgCSLWw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Mar 2020 07:22:52 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:56962 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726947AbgCSLWw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Mar 2020 07:22:52 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 02JBMe7J036448;
        Thu, 19 Mar 2020 06:22:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1584616960;
        bh=4XCUG4ipfgWgdfnpFZryc9YTyd4tvJTagW6kuPRPM/o=;
        h=Subject:From:To:CC:References:Date:In-Reply-To;
        b=mh3lBXc/6bBia7nxYrasfYW5ZiUnnH7pdqh2cLn2MJs5aCE9W/okrllCu9UyzJvM0
         0Q2rd9rjq+WmuqakTvOMhbgWM+ot8zuwxEWpbWoxTpi1AEDgQ8nbcdY0WWP06fz1oo
         4s3jQAMFiIEDj8/6FqhxKaaey606TDV3wSkDOfHI=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02JBMeE4061668;
        Thu, 19 Mar 2020 06:22:40 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 19
 Mar 2020 06:22:38 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 19 Mar 2020 06:22:38 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02JBMaG8021292;
        Thu, 19 Mar 2020 06:22:37 -0500
Subject: Re: OV5640 CSI2 problemsg
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
CC:     Benoit Parrot <bparrot@ti.com>,
        Loic Poulain <loic.poulain@linaro.org>,
        Hugues Fruchet <hugues.fruchet@st.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        <linux-media@vger.kernel.org>, Maxime Ripard <maxime@cerno.tech>
References: <d0510b81-9ae1-9b6f-02c5-f4eb08e67bfa@ti.com>
 <20200317102214.kc2rh7s67ycl4req@uno.localdomain>
 <1496451e-b3ba-efbb-1836-6eb321993b11@ti.com>
Message-ID: <ff66ea3a-bd2e-9bd6-894c-bf372de69a31@ti.com>
Date:   Thu, 19 Mar 2020 13:22:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <1496451e-b3ba-efbb-1836-6eb321993b11@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 17/03/2020 14:40, Tomi Valkeinen wrote:

> Looking at the git log, these values seem to have been there from the start. Initially in the raw 
> register sequences, then moved from there to ov5640_mode_info. But the numbers have been the same.
> 
> I wonder where they came originally, and whether they have ever been correct.
> 
> Perhaps I'll cook up a patch where I'll update the values to what the sensor sheet suggests, and 
> other people can try and see if the driver still works for them.

Here's an RFC patch which makes everything work for me.

The numbers are from the datasheet, "DVP timing specifications" table. I have to say it's not quite clear to me how all those numbers should be used, and how they match to the registers. The htot value (4) seems quite obvious, though. But then, how to come up with the vtot, I don't know. The current vtot values work for me, but where they come from, or how to calculate them, I have no idea.

So, this is obviously a bit of a hack. But if the change works for everyone else, and fixes issues on my setup, I wish it could be merged.


From a5d6caf1369396a82e9b4f9bf731194ca4907dbd Mon Sep 17 00:00:00 2001
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Date: Fri, 13 Mar 2020 10:30:02 +0200
Subject: [PATCH] media: ov5640: adjust htot

Adjust htot for most of the modes. The numbers are from the OV5640
datasheet, and with these the driver works more reliably on DRA76 EVM +
OV5640, using 2 datalanes.

Without the patch, I see often ComplexIO (i.e. PHY) errors when
starting the streaming, and 1280x720 does not work at all without this
change.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
---
 drivers/media/i2c/ov5640.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
index 2fe4a7ac0592..736b286ebb4b 100644
--- a/drivers/media/i2c/ov5640.c
+++ b/drivers/media/i2c/ov5640.c
@@ -551,42 +551,42 @@ static const struct ov5640_mode_info ov5640_mode_init_data = {
 static const struct ov5640_mode_info
 ov5640_mode_data[OV5640_NUM_MODES] = {
 	{OV5640_MODE_QCIF_176_144, SUBSAMPLING,
-	 176, 1896, 144, 984,
+	 176, 2844, 144, 984,
 	 ov5640_setting_QCIF_176_144,
 	 ARRAY_SIZE(ov5640_setting_QCIF_176_144),
 	 OV5640_30_FPS},
 	{OV5640_MODE_QVGA_320_240, SUBSAMPLING,
-	 320, 1896, 240, 984,
+	 320, 2844, 240, 984,
 	 ov5640_setting_QVGA_320_240,
 	 ARRAY_SIZE(ov5640_setting_QVGA_320_240),
 	 OV5640_30_FPS},
 	{OV5640_MODE_VGA_640_480, SUBSAMPLING,
-	 640, 1896, 480, 1080,
+	 640, 2844, 480, 1080,
 	 ov5640_setting_VGA_640_480,
 	 ARRAY_SIZE(ov5640_setting_VGA_640_480),
 	 OV5640_60_FPS},
 	{OV5640_MODE_NTSC_720_480, SUBSAMPLING,
-	 720, 1896, 480, 984,
+	 720, 2844, 480, 984,
 	 ov5640_setting_NTSC_720_480,
 	 ARRAY_SIZE(ov5640_setting_NTSC_720_480),
 	OV5640_30_FPS},
 	{OV5640_MODE_PAL_720_576, SUBSAMPLING,
-	 720, 1896, 576, 984,
+	 720, 2844, 576, 984,
 	 ov5640_setting_PAL_720_576,
 	 ARRAY_SIZE(ov5640_setting_PAL_720_576),
 	 OV5640_30_FPS},
 	{OV5640_MODE_XGA_1024_768, SUBSAMPLING,
-	 1024, 1896, 768, 1080,
+	 1024, 2844, 768, 1080,
 	 ov5640_setting_XGA_1024_768,
 	 ARRAY_SIZE(ov5640_setting_XGA_1024_768),
 	 OV5640_30_FPS},
 	{OV5640_MODE_720P_1280_720, SUBSAMPLING,
-	 1280, 1892, 720, 740,
+	 1280, 2844, 720, 740,
 	 ov5640_setting_720P_1280_720,
 	 ARRAY_SIZE(ov5640_setting_720P_1280_720),
 	 OV5640_30_FPS},
 	{OV5640_MODE_1080P_1920_1080, SCALING,
-	 1920, 2500, 1080, 1120,
+	 1920, 2844, 1080, 1120,
 	 ov5640_setting_1080P_1920_1080,
 	 ARRAY_SIZE(ov5640_setting_1080P_1920_1080),
 	 OV5640_30_FPS},

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
