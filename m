Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1B3786E0BDE
	for <lists+linux-media@lfdr.de>; Thu, 13 Apr 2023 12:54:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229530AbjDMKyz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Apr 2023 06:54:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231236AbjDMKyw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 Apr 2023 06:54:52 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 503A01FF5
        for <linux-media@vger.kernel.org>; Thu, 13 Apr 2023 03:54:49 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id m4so18355015lfj.13
        for <linux-media@vger.kernel.org>; Thu, 13 Apr 2023 03:54:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=noisolation.com; s=google; t=1681383287; x=1683975287;
        h=to:cc:date:message-id:subject:mime-version
         :content-transfer-encoding:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sWXL8RkrtxOLLFCi3isADcnnYp2zOTykQfvqbUD9OTA=;
        b=QptY3Z8omkamMJrrImlFCB7vQpAgRzCMU9V7Qsx67X52zTZ3fLP+ChA++h5PcZ3n6q
         wpUN//SsuXPUYAjZHPBGagdKNMgxFYWXLiHP9n4TttzuTJAjlV0Vr3DHy3iUfUbRzC23
         TSiPowU9tyvPCzogarmw5mkI1BMmV2DVp6gruM07QetNLFYLzJjp+8+Jcaib3FDAJpyB
         mhKZ0mZ2CnOCI+GC3TvWiNfPYvCelTUbiYhxjfcpx38QBuSvMEjL9dbWcdOjKBq04AEI
         Aw45NJ1CVwcTO9vqSId+RR0Mn8DDRVg5hv4x/hQyu0WWv7oeNsjvvWn7n4MdCoxFCGu4
         9lLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681383287; x=1683975287;
        h=to:cc:date:message-id:subject:mime-version
         :content-transfer-encoding:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sWXL8RkrtxOLLFCi3isADcnnYp2zOTykQfvqbUD9OTA=;
        b=bUIPv0VKYPu3QgKzMeJOkclTKkzwbIHX+yw44oTOwf5HZb2fYujswqKX6Tx6ukNPU0
         iOosMx9UvyKvVNbX49HyL6uu22uGod2cw1UCYROPZfI1JtSHOLMGkV5WZYcCzQJ1Qm/k
         DccsLF9MU4GADH5htdUDI9fkOevVpKSa77Cok7TkYwCjV6rr7Hi0se+CAkD6f2FOFP83
         AeUDtD9n3oBK450CMqcjmLKmIZnv3P0bc1UnriFwd1b2s37jA6qMKT9pnDkbya+esII3
         XR1S4iXzU7IeP5WPXpkEcI28X/7xHza3ybTKcvuDsBOuVAe6TbmPYzawiZ1RUiNg54eV
         lj7Q==
X-Gm-Message-State: AAQBX9dPruSfKZzmJMOSUnFJuDFyaYKPGSWDpFcTVrD9C+VvCVaw8u7s
        43MKOSA6In+NVWpucFeDYO5ifvVMyQS8wIEkwpM=
X-Google-Smtp-Source: AKy350ZSKQBihutvalfiWjSHkicsHBkzFTe5uHqKlxA1y6NTIjL8x4fKqh4pJ+XQaI8ziOwaQiAsFA==
X-Received: by 2002:ac2:4199:0:b0:4eb:d8d:6c13 with SMTP id z25-20020ac24199000000b004eb0d8d6c13mr893314lfh.9.1681383287402;
        Thu, 13 Apr 2023 03:54:47 -0700 (PDT)
Received: from smtpclient.apple (108.224.92.62.static.cust.telenor.com. [62.92.224.108])
        by smtp.gmail.com with ESMTPSA id o15-20020ac2494f000000b004d3d43c7569sm265982lfi.3.2023.04.13.03.54.46
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 13 Apr 2023 03:54:47 -0700 (PDT)
From:   =?utf-8?Q?Martin_D=C3=B8rum?= <dorum@noisolation.com>
Content-Type: text/plain;
        charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.500.231\))
Subject: [PATCH] qcom/camss: use 1X16 formats instead of 2X8 
Message-Id: <B15AD941-B2E4-4C65-9D84-C58D3E34EBCE@noisolation.com>
Date:   Thu, 13 Apr 2023 12:54:36 +0200
Cc:     linux-media@vger.kernel.org
To:     rfoss@kernel.org, todor.too@gmail.com
X-Mailer: Apple Mail (2.3731.500.231)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Platforms with qcom-camss use CSI-2, which means 1X16 is more correct
than 2X8. The fact that qcom-camss supported only 2X8 meant it was
incompatible with camera sensors it should have been compatible with.

For example, the ov5645 driver (correctly) reports that its format is
UYVY8_1X16 (after ba449bb56203aedc4530a82b0f3f83358808b7f2).
Since qcom-camss only supports 2X8, the qcom-camss system is
incompatible with the ov5645 driver, even though they should be
compatible.

This patch replaces all uses of UYVY8_2X8/VYUY8_2X8/YUYV8_2X8/YVYU8_2X8
with the equivalent 1X16 formats.

Signed-off-by: Martin D=C3=B8rum <dorum@noisolation.com =
<mailto:dorum@noisolation.com>>

---

I have an APQ8016 with an OV5645 camera. Before this patch, linking the
ov5645 node to the csiphy node didn=E2=80=99t work because the OV5645 =
only
supported UYVY8_1X16 and the camss-csiphy node only supported 2X8 =
formats.
With this patch, I can successfully capture frames from the camera. I =
don=E2=80=99t have
other hardware to test with.

 .../platform/qcom/camss/camss-csid-4-1.c      |   8 +-
 .../platform/qcom/camss/camss-csid-4-7.c      |   8 +-
 .../platform/qcom/camss/camss-csid-gen2.c     |   8 +-
 .../media/platform/qcom/camss/camss-csid.c    |   6 +-
 .../media/platform/qcom/camss/camss-csiphy.c  |  28 ++---
 .../media/platform/qcom/camss/camss-ispif.c   |  20 ++--
 .../media/platform/qcom/camss/camss-vfe-4-1.c |  16 +--
 .../media/platform/qcom/camss/camss-vfe-4-7.c |  16 +--
 .../media/platform/qcom/camss/camss-vfe-4-8.c |  16 +--
 drivers/media/platform/qcom/camss/camss-vfe.c | 100 +++++++++---------
 .../media/platform/qcom/camss/camss-video.c   |  64 +++++------
 11 files changed, 145 insertions(+), 145 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-4-1.c =
b/drivers/media/platform/qcom/camss/camss-csid-4-1.c
index d2aec0679dfc..dd49a40e6a70 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-4-1.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-4-1.c
@@ -47,28 +47,28 @@
=20
 static const struct csid_format csid_formats[] =3D {
 	{
-		MEDIA_BUS_FMT_UYVY8_2X8,
+		MEDIA_BUS_FMT_UYVY8_1X16,
 		DATA_TYPE_YUV422_8BIT,
 		DECODE_FORMAT_UNCOMPRESSED_8_BIT,
 		8,
 		2,
 	},
 	{
-		MEDIA_BUS_FMT_VYUY8_2X8,
+		MEDIA_BUS_FMT_VYUY8_1X16,
 		DATA_TYPE_YUV422_8BIT,
 		DECODE_FORMAT_UNCOMPRESSED_8_BIT,
 		8,
 		2,
 	},
 	{
-		MEDIA_BUS_FMT_YUYV8_2X8,
+		MEDIA_BUS_FMT_YUYV8_1X16,
 		DATA_TYPE_YUV422_8BIT,
 		DECODE_FORMAT_UNCOMPRESSED_8_BIT,
 		8,
 		2,
 	},
 	{
-		MEDIA_BUS_FMT_YVYU8_2X8,
+		MEDIA_BUS_FMT_YVYU8_1X16,
 		DATA_TYPE_YUV422_8BIT,
 		DECODE_FORMAT_UNCOMPRESSED_8_BIT,
 		8,
diff --git a/drivers/media/platform/qcom/camss/camss-csid-4-7.c =
b/drivers/media/platform/qcom/camss/camss-csid-4-7.c
index e7436ec6d02b..6b26e036294e 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-4-7.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-4-7.c
@@ -46,28 +46,28 @@
=20
 static const struct csid_format csid_formats[] =3D {
 	{
-		MEDIA_BUS_FMT_UYVY8_2X8,
+		MEDIA_BUS_FMT_UYVY8_1X16,
 		DATA_TYPE_YUV422_8BIT,
 		DECODE_FORMAT_UNCOMPRESSED_8_BIT,
 		8,
 		2,
 	},
 	{
-		MEDIA_BUS_FMT_VYUY8_2X8,
+		MEDIA_BUS_FMT_VYUY8_1X16,
 		DATA_TYPE_YUV422_8BIT,
 		DECODE_FORMAT_UNCOMPRESSED_8_BIT,
 		8,
 		2,
 	},
 	{
-		MEDIA_BUS_FMT_YUYV8_2X8,
+		MEDIA_BUS_FMT_YUYV8_1X16,
 		DATA_TYPE_YUV422_8BIT,
 		DECODE_FORMAT_UNCOMPRESSED_8_BIT,
 		8,
 		2,
 	},
 	{
-		MEDIA_BUS_FMT_YVYU8_2X8,
+		MEDIA_BUS_FMT_YVYU8_1X16,
 		DATA_TYPE_YUV422_8BIT,
 		DECODE_FORMAT_UNCOMPRESSED_8_BIT,
 		8,
diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen2.c =
b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
index 2031bde13a93..086dd38d1954 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-gen2.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
@@ -179,28 +179,28 @@
=20
 static const struct csid_format csid_formats[] =3D {
 	{
-		MEDIA_BUS_FMT_UYVY8_2X8,
+		MEDIA_BUS_FMT_UYVY8_1X16,
 		DATA_TYPE_YUV422_8BIT,
 		DECODE_FORMAT_UNCOMPRESSED_8_BIT,
 		8,
 		2,
 	},
 	{
-		MEDIA_BUS_FMT_VYUY8_2X8,
+		MEDIA_BUS_FMT_VYUY8_1X16,
 		DATA_TYPE_YUV422_8BIT,
 		DECODE_FORMAT_UNCOMPRESSED_8_BIT,
 		8,
 		2,
 	},
 	{
-		MEDIA_BUS_FMT_YUYV8_2X8,
+		MEDIA_BUS_FMT_YUYV8_1X16,
 		DATA_TYPE_YUV422_8BIT,
 		DECODE_FORMAT_UNCOMPRESSED_8_BIT,
 		8,
 		2,
 	},
 	{
-		MEDIA_BUS_FMT_YVYU8_2X8,
+		MEDIA_BUS_FMT_YVYU8_1X16,
 		DATA_TYPE_YUV422_8BIT,
 		DECODE_FORMAT_UNCOMPRESSED_8_BIT,
 		8,
diff --git a/drivers/media/platform/qcom/camss/camss-csid.c =
b/drivers/media/platform/qcom/camss/camss-csid.c
index 88f188e0f750..643ff5623c0a 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.c
+++ b/drivers/media/platform/qcom/camss/camss-csid.c
@@ -302,7 +302,7 @@ static void csid_try_format(struct csid_device =
*csid,
=20
 		/* If not found, use UYVY as default */
 		if (i >=3D csid->nformats)
-			fmt->code =3D MEDIA_BUS_FMT_UYVY8_2X8;
+			fmt->code =3D MEDIA_BUS_FMT_UYVY8_1X16;
=20
 		fmt->width =3D clamp_t(u32, fmt->width, 1, 8191);
 		fmt->height =3D clamp_t(u32, fmt->height, 1, 8191);
@@ -331,7 +331,7 @@ static void csid_try_format(struct csid_device =
*csid,
=20
 			/* If not found, use UYVY as default */
 			if (i >=3D csid->nformats)
-				fmt->code =3D MEDIA_BUS_FMT_UYVY8_2X8;
+				fmt->code =3D MEDIA_BUS_FMT_UYVY8_1X16;
=20
 			fmt->width =3D clamp_t(u32, fmt->width, 1, =
8191);
 			fmt->height =3D clamp_t(u32, fmt->height, 1, =
8191);
@@ -497,7 +497,7 @@ static int csid_init_formats(struct v4l2_subdev *sd, =
struct v4l2_subdev_fh *fh)
 		.which =3D fh ? V4L2_SUBDEV_FORMAT_TRY :
 			      V4L2_SUBDEV_FORMAT_ACTIVE,
 		.format =3D {
-			.code =3D MEDIA_BUS_FMT_UYVY8_2X8,
+			.code =3D MEDIA_BUS_FMT_UYVY8_1X16,
 			.width =3D 1920,
 			.height =3D 1080
 		}
diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c =
b/drivers/media/platform/qcom/camss/camss-csiphy.c
index 3f726a7237f5..c5ae9c61ee0b 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
@@ -30,10 +30,10 @@ struct csiphy_format {
 };
=20
 static const struct csiphy_format csiphy_formats_8x16[] =3D {
-	{ MEDIA_BUS_FMT_UYVY8_2X8, 8 },
-	{ MEDIA_BUS_FMT_VYUY8_2X8, 8 },
-	{ MEDIA_BUS_FMT_YUYV8_2X8, 8 },
-	{ MEDIA_BUS_FMT_YVYU8_2X8, 8 },
+	{ MEDIA_BUS_FMT_UYVY8_1X16, 8 },
+	{ MEDIA_BUS_FMT_VYUY8_1X16, 8 },
+	{ MEDIA_BUS_FMT_YUYV8_1X16, 8 },
+	{ MEDIA_BUS_FMT_YVYU8_1X16, 8 },
 	{ MEDIA_BUS_FMT_SBGGR8_1X8, 8 },
 	{ MEDIA_BUS_FMT_SGBRG8_1X8, 8 },
 	{ MEDIA_BUS_FMT_SGRBG8_1X8, 8 },
@@ -50,10 +50,10 @@ static const struct csiphy_format =
csiphy_formats_8x16[] =3D {
 };
=20
 static const struct csiphy_format csiphy_formats_8x96[] =3D {
-	{ MEDIA_BUS_FMT_UYVY8_2X8, 8 },
-	{ MEDIA_BUS_FMT_VYUY8_2X8, 8 },
-	{ MEDIA_BUS_FMT_YUYV8_2X8, 8 },
-	{ MEDIA_BUS_FMT_YVYU8_2X8, 8 },
+	{ MEDIA_BUS_FMT_UYVY8_1X16, 8 },
+	{ MEDIA_BUS_FMT_VYUY8_1X16, 8 },
+	{ MEDIA_BUS_FMT_YUYV8_1X16, 8 },
+	{ MEDIA_BUS_FMT_YVYU8_1X16, 8 },
 	{ MEDIA_BUS_FMT_SBGGR8_1X8, 8 },
 	{ MEDIA_BUS_FMT_SGBRG8_1X8, 8 },
 	{ MEDIA_BUS_FMT_SGRBG8_1X8, 8 },
@@ -74,10 +74,10 @@ static const struct csiphy_format =
csiphy_formats_8x96[] =3D {
 };
=20
 static const struct csiphy_format csiphy_formats_sdm845[] =3D {
-	{ MEDIA_BUS_FMT_UYVY8_2X8, 8 },
-	{ MEDIA_BUS_FMT_VYUY8_2X8, 8 },
-	{ MEDIA_BUS_FMT_YUYV8_2X8, 8 },
-	{ MEDIA_BUS_FMT_YVYU8_2X8, 8 },
+	{ MEDIA_BUS_FMT_UYVY8_1X16, 8 },
+	{ MEDIA_BUS_FMT_VYUY8_1X16, 8 },
+	{ MEDIA_BUS_FMT_YUYV8_1X16, 8 },
+	{ MEDIA_BUS_FMT_YVYU8_1X16, 8 },
 	{ MEDIA_BUS_FMT_SBGGR8_1X8, 8 },
 	{ MEDIA_BUS_FMT_SGBRG8_1X8, 8 },
 	{ MEDIA_BUS_FMT_SGRBG8_1X8, 8 },
@@ -357,7 +357,7 @@ static void csiphy_try_format(struct csiphy_device =
*csiphy,
=20
 		/* If not found, use UYVY as default */
 		if (i >=3D csiphy->nformats)
-			fmt->code =3D MEDIA_BUS_FMT_UYVY8_2X8;
+			fmt->code =3D MEDIA_BUS_FMT_UYVY8_1X16;
=20
 		fmt->width =3D clamp_t(u32, fmt->width, 1, 8191);
 		fmt->height =3D clamp_t(u32, fmt->height, 1, 8191);
@@ -527,7 +527,7 @@ static int csiphy_init_formats(struct v4l2_subdev =
*sd,
 		.which =3D fh ? V4L2_SUBDEV_FORMAT_TRY :
 			      V4L2_SUBDEV_FORMAT_ACTIVE,
 		.format =3D {
-			.code =3D MEDIA_BUS_FMT_UYVY8_2X8,
+			.code =3D MEDIA_BUS_FMT_UYVY8_1X16,
 			.width =3D 1920,
 			.height =3D 1080
 		}
diff --git a/drivers/media/platform/qcom/camss/camss-ispif.c =
b/drivers/media/platform/qcom/camss/camss-ispif.c
index b713f5b86aba..1c7e4b1b4940 100644
--- a/drivers/media/platform/qcom/camss/camss-ispif.c
+++ b/drivers/media/platform/qcom/camss/camss-ispif.c
@@ -106,10 +106,10 @@ enum ispif_intf_cmd {
 };
=20
 static const u32 ispif_formats_8x16[] =3D {
-	MEDIA_BUS_FMT_UYVY8_2X8,
-	MEDIA_BUS_FMT_VYUY8_2X8,
-	MEDIA_BUS_FMT_YUYV8_2X8,
-	MEDIA_BUS_FMT_YVYU8_2X8,
+	MEDIA_BUS_FMT_UYVY8_1X16,
+	MEDIA_BUS_FMT_VYUY8_1X16,
+	MEDIA_BUS_FMT_YUYV8_1X16,
+	MEDIA_BUS_FMT_YVYU8_1X16,
 	MEDIA_BUS_FMT_SBGGR8_1X8,
 	MEDIA_BUS_FMT_SGBRG8_1X8,
 	MEDIA_BUS_FMT_SGRBG8_1X8,
@@ -126,10 +126,10 @@ static const u32 ispif_formats_8x16[] =3D {
 };
=20
 static const u32 ispif_formats_8x96[] =3D {
-	MEDIA_BUS_FMT_UYVY8_2X8,
-	MEDIA_BUS_FMT_VYUY8_2X8,
-	MEDIA_BUS_FMT_YUYV8_2X8,
-	MEDIA_BUS_FMT_YVYU8_2X8,
+	MEDIA_BUS_FMT_UYVY8_1X16,
+	MEDIA_BUS_FMT_VYUY8_1X16,
+	MEDIA_BUS_FMT_YUYV8_1X16,
+	MEDIA_BUS_FMT_YVYU8_1X16,
 	MEDIA_BUS_FMT_SBGGR8_1X8,
 	MEDIA_BUS_FMT_SGBRG8_1X8,
 	MEDIA_BUS_FMT_SGRBG8_1X8,
@@ -911,7 +911,7 @@ static void ispif_try_format(struct ispif_line =
*line,
=20
 		/* If not found, use UYVY as default */
 		if (i >=3D line->nformats)
-			fmt->code =3D MEDIA_BUS_FMT_UYVY8_2X8;
+			fmt->code =3D MEDIA_BUS_FMT_UYVY8_1X16;
=20
 		fmt->width =3D clamp_t(u32, fmt->width, 1, 8191);
 		fmt->height =3D clamp_t(u32, fmt->height, 1, 8191);
@@ -1078,7 +1078,7 @@ static int ispif_init_formats(struct v4l2_subdev =
*sd, struct v4l2_subdev_fh *fh)
 		.which =3D fh ? V4L2_SUBDEV_FORMAT_TRY :
 			      V4L2_SUBDEV_FORMAT_ACTIVE,
 		.format =3D {
-			.code =3D MEDIA_BUS_FMT_UYVY8_2X8,
+			.code =3D MEDIA_BUS_FMT_UYVY8_1X16,
 			.width =3D 1920,
 			.height =3D 1080
 		}
diff --git a/drivers/media/platform/qcom/camss/camss-vfe-4-1.c =
b/drivers/media/platform/qcom/camss/camss-vfe-4-1.c
index 42047b11ba52..bc309f326f51 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-4-1.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-4-1.c
@@ -614,20 +614,20 @@ static void vfe_set_demux_cfg(struct vfe_device =
*vfe, struct vfe_line *line)
 	writel_relaxed(val, vfe->base + VFE_0_DEMUX_GAIN_1);
=20
 	switch (line->fmt[MSM_VFE_PAD_SINK].code) {
-	case MEDIA_BUS_FMT_YUYV8_2X8:
+	case MEDIA_BUS_FMT_YUYV8_1X16:
 		even_cfg =3D VFE_0_DEMUX_EVEN_CFG_PATTERN_YUYV;
 		odd_cfg =3D VFE_0_DEMUX_ODD_CFG_PATTERN_YUYV;
 		break;
-	case MEDIA_BUS_FMT_YVYU8_2X8:
+	case MEDIA_BUS_FMT_YVYU8_1X16:
 		even_cfg =3D VFE_0_DEMUX_EVEN_CFG_PATTERN_YVYU;
 		odd_cfg =3D VFE_0_DEMUX_ODD_CFG_PATTERN_YVYU;
 		break;
-	case MEDIA_BUS_FMT_UYVY8_2X8:
+	case MEDIA_BUS_FMT_UYVY8_1X16:
 	default:
 		even_cfg =3D VFE_0_DEMUX_EVEN_CFG_PATTERN_UYVY;
 		odd_cfg =3D VFE_0_DEMUX_ODD_CFG_PATTERN_UYVY;
 		break;
-	case MEDIA_BUS_FMT_VYUY8_2X8:
+	case MEDIA_BUS_FMT_VYUY8_1X16:
 		even_cfg =3D VFE_0_DEMUX_EVEN_CFG_PATTERN_VYUY;
 		odd_cfg =3D VFE_0_DEMUX_ODD_CFG_PATTERN_VYUY;
 		break;
@@ -775,17 +775,17 @@ static void vfe_set_camif_cfg(struct vfe_device =
*vfe, struct vfe_line *line)
 	u32 val;
=20
 	switch (line->fmt[MSM_VFE_PAD_SINK].code) {
-	case MEDIA_BUS_FMT_YUYV8_2X8:
+	case MEDIA_BUS_FMT_YUYV8_1X16:
 		val =3D VFE_0_CORE_CFG_PIXEL_PATTERN_YCBYCR;
 		break;
-	case MEDIA_BUS_FMT_YVYU8_2X8:
+	case MEDIA_BUS_FMT_YVYU8_1X16:
 		val =3D VFE_0_CORE_CFG_PIXEL_PATTERN_YCRYCB;
 		break;
-	case MEDIA_BUS_FMT_UYVY8_2X8:
+	case MEDIA_BUS_FMT_UYVY8_1X16:
 	default:
 		val =3D VFE_0_CORE_CFG_PIXEL_PATTERN_CBYCRY;
 		break;
-	case MEDIA_BUS_FMT_VYUY8_2X8:
+	case MEDIA_BUS_FMT_VYUY8_1X16:
 		val =3D VFE_0_CORE_CFG_PIXEL_PATTERN_CRYCBY;
 		break;
 	}
diff --git a/drivers/media/platform/qcom/camss/camss-vfe-4-7.c =
b/drivers/media/platform/qcom/camss/camss-vfe-4-7.c
index ab2d57bdf5e7..8acd76c9746b 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-4-7.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-4-7.c
@@ -768,20 +768,20 @@ static void vfe_set_demux_cfg(struct vfe_device =
*vfe, struct vfe_line *line)
 	writel_relaxed(val, vfe->base + VFE_0_DEMUX_GAIN_1);
=20
 	switch (line->fmt[MSM_VFE_PAD_SINK].code) {
-	case MEDIA_BUS_FMT_YUYV8_2X8:
+	case MEDIA_BUS_FMT_YUYV8_1X16:
 		even_cfg =3D VFE_0_DEMUX_EVEN_CFG_PATTERN_YUYV;
 		odd_cfg =3D VFE_0_DEMUX_ODD_CFG_PATTERN_YUYV;
 		break;
-	case MEDIA_BUS_FMT_YVYU8_2X8:
+	case MEDIA_BUS_FMT_YVYU8_1X16:
 		even_cfg =3D VFE_0_DEMUX_EVEN_CFG_PATTERN_YVYU;
 		odd_cfg =3D VFE_0_DEMUX_ODD_CFG_PATTERN_YVYU;
 		break;
-	case MEDIA_BUS_FMT_UYVY8_2X8:
+	case MEDIA_BUS_FMT_UYVY8_1X16:
 	default:
 		even_cfg =3D VFE_0_DEMUX_EVEN_CFG_PATTERN_UYVY;
 		odd_cfg =3D VFE_0_DEMUX_ODD_CFG_PATTERN_UYVY;
 		break;
-	case MEDIA_BUS_FMT_VYUY8_2X8:
+	case MEDIA_BUS_FMT_VYUY8_1X16:
 		even_cfg =3D VFE_0_DEMUX_EVEN_CFG_PATTERN_VYUY;
 		odd_cfg =3D VFE_0_DEMUX_ODD_CFG_PATTERN_VYUY;
 		break;
@@ -941,17 +941,17 @@ static void vfe_set_camif_cfg(struct vfe_device =
*vfe, struct vfe_line *line)
 	u32 val;
=20
 	switch (line->fmt[MSM_VFE_PAD_SINK].code) {
-	case MEDIA_BUS_FMT_YUYV8_2X8:
+	case MEDIA_BUS_FMT_YUYV8_1X16:
 		val =3D VFE_0_CORE_CFG_PIXEL_PATTERN_YCBYCR;
 		break;
-	case MEDIA_BUS_FMT_YVYU8_2X8:
+	case MEDIA_BUS_FMT_YVYU8_1X16:
 		val =3D VFE_0_CORE_CFG_PIXEL_PATTERN_YCRYCB;
 		break;
-	case MEDIA_BUS_FMT_UYVY8_2X8:
+	case MEDIA_BUS_FMT_UYVY8_1X16:
 	default:
 		val =3D VFE_0_CORE_CFG_PIXEL_PATTERN_CBYCRY;
 		break;
-	case MEDIA_BUS_FMT_VYUY8_2X8:
+	case MEDIA_BUS_FMT_VYUY8_1X16:
 		val =3D VFE_0_CORE_CFG_PIXEL_PATTERN_CRYCBY;
 		break;
 	}
diff --git a/drivers/media/platform/qcom/camss/camss-vfe-4-8.c =
b/drivers/media/platform/qcom/camss/camss-vfe-4-8.c
index 7e6b62c930ac..3a0167ecf873 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-4-8.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-4-8.c
@@ -739,20 +739,20 @@ static void vfe_set_demux_cfg(struct vfe_device =
*vfe, struct vfe_line *line)
 	writel_relaxed(val, vfe->base + VFE_0_DEMUX_GAIN_1);
=20
 	switch (line->fmt[MSM_VFE_PAD_SINK].code) {
-	case MEDIA_BUS_FMT_YUYV8_2X8:
+	case MEDIA_BUS_FMT_YUYV8_1X16:
 		even_cfg =3D VFE_0_DEMUX_EVEN_CFG_PATTERN_YUYV;
 		odd_cfg =3D VFE_0_DEMUX_ODD_CFG_PATTERN_YUYV;
 		break;
-	case MEDIA_BUS_FMT_YVYU8_2X8:
+	case MEDIA_BUS_FMT_YVYU8_1X16:
 		even_cfg =3D VFE_0_DEMUX_EVEN_CFG_PATTERN_YVYU;
 		odd_cfg =3D VFE_0_DEMUX_ODD_CFG_PATTERN_YVYU;
 		break;
-	case MEDIA_BUS_FMT_UYVY8_2X8:
+	case MEDIA_BUS_FMT_UYVY8_1X16:
 	default:
 		even_cfg =3D VFE_0_DEMUX_EVEN_CFG_PATTERN_UYVY;
 		odd_cfg =3D VFE_0_DEMUX_ODD_CFG_PATTERN_UYVY;
 		break;
-	case MEDIA_BUS_FMT_VYUY8_2X8:
+	case MEDIA_BUS_FMT_VYUY8_1X16:
 		even_cfg =3D VFE_0_DEMUX_EVEN_CFG_PATTERN_VYUY;
 		odd_cfg =3D VFE_0_DEMUX_ODD_CFG_PATTERN_VYUY;
 		break;
@@ -873,17 +873,17 @@ static void vfe_set_camif_cfg(struct vfe_device =
*vfe, struct vfe_line *line)
 	u32 val;
=20
 	switch (line->fmt[MSM_VFE_PAD_SINK].code) {
-	case MEDIA_BUS_FMT_YUYV8_2X8:
+	case MEDIA_BUS_FMT_YUYV8_1X16:
 		val =3D VFE_0_CORE_CFG_PIXEL_PATTERN_YCBYCR;
 		break;
-	case MEDIA_BUS_FMT_YVYU8_2X8:
+	case MEDIA_BUS_FMT_YVYU8_1X16:
 		val =3D VFE_0_CORE_CFG_PIXEL_PATTERN_YCRYCB;
 		break;
-	case MEDIA_BUS_FMT_UYVY8_2X8:
+	case MEDIA_BUS_FMT_UYVY8_1X16:
 	default:
 		val =3D VFE_0_CORE_CFG_PIXEL_PATTERN_CBYCRY;
 		break;
-	case MEDIA_BUS_FMT_VYUY8_2X8:
+	case MEDIA_BUS_FMT_VYUY8_1X16:
 		val =3D VFE_0_CORE_CFG_PIXEL_PATTERN_CRYCBY;
 		break;
 	}
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c =
b/drivers/media/platform/qcom/camss/camss-vfe.c
index a26e4a5d87b6..9519b0795c38 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -37,10 +37,10 @@ struct vfe_format {
 };
=20
 static const struct vfe_format formats_rdi_8x16[] =3D {
-	{ MEDIA_BUS_FMT_UYVY8_2X8, 8 },
-	{ MEDIA_BUS_FMT_VYUY8_2X8, 8 },
-	{ MEDIA_BUS_FMT_YUYV8_2X8, 8 },
-	{ MEDIA_BUS_FMT_YVYU8_2X8, 8 },
+	{ MEDIA_BUS_FMT_UYVY8_1X16, 8 },
+	{ MEDIA_BUS_FMT_VYUY8_1X16, 8 },
+	{ MEDIA_BUS_FMT_YUYV8_1X16, 8 },
+	{ MEDIA_BUS_FMT_YVYU8_1X16, 8 },
 	{ MEDIA_BUS_FMT_SBGGR8_1X8, 8 },
 	{ MEDIA_BUS_FMT_SGBRG8_1X8, 8 },
 	{ MEDIA_BUS_FMT_SGRBG8_1X8, 8 },
@@ -57,17 +57,17 @@ static const struct vfe_format formats_rdi_8x16[] =3D =
{
 };
=20
 static const struct vfe_format formats_pix_8x16[] =3D {
-	{ MEDIA_BUS_FMT_UYVY8_2X8, 8 },
-	{ MEDIA_BUS_FMT_VYUY8_2X8, 8 },
-	{ MEDIA_BUS_FMT_YUYV8_2X8, 8 },
-	{ MEDIA_BUS_FMT_YVYU8_2X8, 8 },
+	{ MEDIA_BUS_FMT_UYVY8_1X16, 8 },
+	{ MEDIA_BUS_FMT_VYUY8_1X16, 8 },
+	{ MEDIA_BUS_FMT_YUYV8_1X16, 8 },
+	{ MEDIA_BUS_FMT_YVYU8_1X16, 8 },
 };
=20
 static const struct vfe_format formats_rdi_8x96[] =3D {
-	{ MEDIA_BUS_FMT_UYVY8_2X8, 8 },
-	{ MEDIA_BUS_FMT_VYUY8_2X8, 8 },
-	{ MEDIA_BUS_FMT_YUYV8_2X8, 8 },
-	{ MEDIA_BUS_FMT_YVYU8_2X8, 8 },
+	{ MEDIA_BUS_FMT_UYVY8_1X16, 8 },
+	{ MEDIA_BUS_FMT_VYUY8_1X16, 8 },
+	{ MEDIA_BUS_FMT_YUYV8_1X16, 8 },
+	{ MEDIA_BUS_FMT_YVYU8_1X16, 8 },
 	{ MEDIA_BUS_FMT_SBGGR8_1X8, 8 },
 	{ MEDIA_BUS_FMT_SGBRG8_1X8, 8 },
 	{ MEDIA_BUS_FMT_SGRBG8_1X8, 8 },
@@ -90,17 +90,17 @@ static const struct vfe_format formats_rdi_8x96[] =3D =
{
 };
=20
 static const struct vfe_format formats_pix_8x96[] =3D {
-	{ MEDIA_BUS_FMT_UYVY8_2X8, 8 },
-	{ MEDIA_BUS_FMT_VYUY8_2X8, 8 },
-	{ MEDIA_BUS_FMT_YUYV8_2X8, 8 },
-	{ MEDIA_BUS_FMT_YVYU8_2X8, 8 },
+	{ MEDIA_BUS_FMT_UYVY8_1X16, 8 },
+	{ MEDIA_BUS_FMT_VYUY8_1X16, 8 },
+	{ MEDIA_BUS_FMT_YUYV8_1X16, 8 },
+	{ MEDIA_BUS_FMT_YVYU8_1X16, 8 },
 };
=20
 static const struct vfe_format formats_rdi_845[] =3D {
-	{ MEDIA_BUS_FMT_UYVY8_2X8, 8 },
-	{ MEDIA_BUS_FMT_VYUY8_2X8, 8 },
-	{ MEDIA_BUS_FMT_YUYV8_2X8, 8 },
-	{ MEDIA_BUS_FMT_YVYU8_2X8, 8 },
+	{ MEDIA_BUS_FMT_UYVY8_1X16, 8 },
+	{ MEDIA_BUS_FMT_VYUY8_1X16, 8 },
+	{ MEDIA_BUS_FMT_YUYV8_1X16, 8 },
+	{ MEDIA_BUS_FMT_YVYU8_1X16, 8 },
 	{ MEDIA_BUS_FMT_SBGGR8_1X8, 8 },
 	{ MEDIA_BUS_FMT_SGBRG8_1X8, 8 },
 	{ MEDIA_BUS_FMT_SGRBG8_1X8, 8 },
@@ -172,40 +172,40 @@ static u32 vfe_src_pad_code(struct vfe_line *line, =
u32 sink_code,
=20
 	if (vfe->camss->version =3D=3D CAMSS_8x16)
 		switch (sink_code) {
-		case MEDIA_BUS_FMT_YUYV8_2X8:
+		case MEDIA_BUS_FMT_YUYV8_1X16:
 		{
 			u32 src_code[] =3D {
-				MEDIA_BUS_FMT_YUYV8_2X8,
+				MEDIA_BUS_FMT_YUYV8_1X16,
 				MEDIA_BUS_FMT_YUYV8_1_5X8,
 			};
=20
 			return vfe_find_code(src_code, =
ARRAY_SIZE(src_code),
 					     index, src_req_code);
 		}
-		case MEDIA_BUS_FMT_YVYU8_2X8:
+		case MEDIA_BUS_FMT_YVYU8_1X16:
 		{
 			u32 src_code[] =3D {
-				MEDIA_BUS_FMT_YVYU8_2X8,
+				MEDIA_BUS_FMT_YVYU8_1X16,
 				MEDIA_BUS_FMT_YVYU8_1_5X8,
 			};
=20
 			return vfe_find_code(src_code, =
ARRAY_SIZE(src_code),
 					     index, src_req_code);
 		}
-		case MEDIA_BUS_FMT_UYVY8_2X8:
+		case MEDIA_BUS_FMT_UYVY8_1X16:
 		{
 			u32 src_code[] =3D {
-				MEDIA_BUS_FMT_UYVY8_2X8,
+				MEDIA_BUS_FMT_UYVY8_1X16,
 				MEDIA_BUS_FMT_UYVY8_1_5X8,
 			};
=20
 			return vfe_find_code(src_code, =
ARRAY_SIZE(src_code),
 					     index, src_req_code);
 		}
-		case MEDIA_BUS_FMT_VYUY8_2X8:
+		case MEDIA_BUS_FMT_VYUY8_1X16:
 		{
 			u32 src_code[] =3D {
-				MEDIA_BUS_FMT_VYUY8_2X8,
+				MEDIA_BUS_FMT_VYUY8_1X16,
 				MEDIA_BUS_FMT_VYUY8_1_5X8,
 			};
=20
@@ -223,52 +223,52 @@ static u32 vfe_src_pad_code(struct vfe_line *line, =
u32 sink_code,
 		 vfe->camss->version =3D=3D CAMSS_845 ||
 		 vfe->camss->version =3D=3D CAMSS_8250)
 		switch (sink_code) {
-		case MEDIA_BUS_FMT_YUYV8_2X8:
+		case MEDIA_BUS_FMT_YUYV8_1X16:
 		{
 			u32 src_code[] =3D {
-				MEDIA_BUS_FMT_YUYV8_2X8,
-				MEDIA_BUS_FMT_YVYU8_2X8,
-				MEDIA_BUS_FMT_UYVY8_2X8,
-				MEDIA_BUS_FMT_VYUY8_2X8,
+				MEDIA_BUS_FMT_YUYV8_1X16,
+				MEDIA_BUS_FMT_YVYU8_1X16,
+				MEDIA_BUS_FMT_UYVY8_1X16,
+				MEDIA_BUS_FMT_VYUY8_1X16,
 				MEDIA_BUS_FMT_YUYV8_1_5X8,
 			};
=20
 			return vfe_find_code(src_code, =
ARRAY_SIZE(src_code),
 					     index, src_req_code);
 		}
-		case MEDIA_BUS_FMT_YVYU8_2X8:
+		case MEDIA_BUS_FMT_YVYU8_1X16:
 		{
 			u32 src_code[] =3D {
-				MEDIA_BUS_FMT_YVYU8_2X8,
-				MEDIA_BUS_FMT_YUYV8_2X8,
-				MEDIA_BUS_FMT_UYVY8_2X8,
-				MEDIA_BUS_FMT_VYUY8_2X8,
+				MEDIA_BUS_FMT_YVYU8_1X16,
+				MEDIA_BUS_FMT_YUYV8_1X16,
+				MEDIA_BUS_FMT_UYVY8_1X16,
+				MEDIA_BUS_FMT_VYUY8_1X16,
 				MEDIA_BUS_FMT_YVYU8_1_5X8,
 			};
=20
 			return vfe_find_code(src_code, =
ARRAY_SIZE(src_code),
 					     index, src_req_code);
 		}
-		case MEDIA_BUS_FMT_UYVY8_2X8:
+		case MEDIA_BUS_FMT_UYVY8_1X16:
 		{
 			u32 src_code[] =3D {
-				MEDIA_BUS_FMT_UYVY8_2X8,
-				MEDIA_BUS_FMT_YUYV8_2X8,
-				MEDIA_BUS_FMT_YVYU8_2X8,
-				MEDIA_BUS_FMT_VYUY8_2X8,
+				MEDIA_BUS_FMT_UYVY8_1X16,
+				MEDIA_BUS_FMT_YUYV8_1X16,
+				MEDIA_BUS_FMT_YVYU8_1X16,
+				MEDIA_BUS_FMT_VYUY8_1X16,
 				MEDIA_BUS_FMT_UYVY8_1_5X8,
 			};
=20
 			return vfe_find_code(src_code, =
ARRAY_SIZE(src_code),
 					     index, src_req_code);
 		}
-		case MEDIA_BUS_FMT_VYUY8_2X8:
+		case MEDIA_BUS_FMT_VYUY8_1X16:
 		{
 			u32 src_code[] =3D {
-				MEDIA_BUS_FMT_VYUY8_2X8,
-				MEDIA_BUS_FMT_YUYV8_2X8,
-				MEDIA_BUS_FMT_YVYU8_2X8,
-				MEDIA_BUS_FMT_UYVY8_2X8,
+				MEDIA_BUS_FMT_VYUY8_1X16,
+				MEDIA_BUS_FMT_YUYV8_1X16,
+				MEDIA_BUS_FMT_YVYU8_1X16,
+				MEDIA_BUS_FMT_UYVY8_1X16,
 				MEDIA_BUS_FMT_VYUY8_1_5X8,
 			};
=20
@@ -843,7 +843,7 @@ static void vfe_try_format(struct vfe_line *line,
=20
 		/* If not found, use UYVY as default */
 		if (i >=3D line->nformats)
-			fmt->code =3D MEDIA_BUS_FMT_UYVY8_2X8;
+			fmt->code =3D MEDIA_BUS_FMT_UYVY8_1X16;
=20
 		fmt->width =3D clamp_t(u32, fmt->width, 1, 8191);
 		fmt->height =3D clamp_t(u32, fmt->height, 1, 8191);
@@ -1260,7 +1260,7 @@ static int vfe_init_formats(struct v4l2_subdev =
*sd, struct v4l2_subdev_fh *fh)
 		.which =3D fh ? V4L2_SUBDEV_FORMAT_TRY :
 			      V4L2_SUBDEV_FORMAT_ACTIVE,
 		.format =3D {
-			.code =3D MEDIA_BUS_FMT_UYVY8_2X8,
+			.code =3D MEDIA_BUS_FMT_UYVY8_1X16,
 			.width =3D 1920,
 			.height =3D 1080
 		}
diff --git a/drivers/media/platform/qcom/camss/camss-video.c =
b/drivers/media/platform/qcom/camss/camss-video.c
index 41deda232e4a..b7607af4dc77 100644
--- a/drivers/media/platform/qcom/camss/camss-video.c
+++ b/drivers/media/platform/qcom/camss/camss-video.c
@@ -48,13 +48,13 @@ struct camss_format_info {
 };
=20
 static const struct camss_format_info formats_rdi_8x16[] =3D {
-	{ MEDIA_BUS_FMT_UYVY8_2X8, V4L2_PIX_FMT_UYVY, 1,
+	{ MEDIA_BUS_FMT_UYVY8_1X16, V4L2_PIX_FMT_UYVY, 1,
 	  { { 1, 1 } }, { { 1, 1 } }, { 16 } },
-	{ MEDIA_BUS_FMT_VYUY8_2X8, V4L2_PIX_FMT_VYUY, 1,
+	{ MEDIA_BUS_FMT_VYUY8_1X16, V4L2_PIX_FMT_VYUY, 1,
 	  { { 1, 1 } }, { { 1, 1 } }, { 16 } },
-	{ MEDIA_BUS_FMT_YUYV8_2X8, V4L2_PIX_FMT_YUYV, 1,
+	{ MEDIA_BUS_FMT_YUYV8_1X16, V4L2_PIX_FMT_YUYV, 1,
 	  { { 1, 1 } }, { { 1, 1 } }, { 16 } },
-	{ MEDIA_BUS_FMT_YVYU8_2X8, V4L2_PIX_FMT_YVYU, 1,
+	{ MEDIA_BUS_FMT_YVYU8_1X16, V4L2_PIX_FMT_YVYU, 1,
 	  { { 1, 1 } }, { { 1, 1 } }, { 16 } },
 	{ MEDIA_BUS_FMT_SBGGR8_1X8, V4L2_PIX_FMT_SBGGR8, 1,
 	  { { 1, 1 } }, { { 1, 1 } }, { 8 } },
@@ -85,13 +85,13 @@ static const struct camss_format_info =
formats_rdi_8x16[] =3D {
 };
=20
 static const struct camss_format_info formats_rdi_8x96[] =3D {
-	{ MEDIA_BUS_FMT_UYVY8_2X8, V4L2_PIX_FMT_UYVY, 1,
+	{ MEDIA_BUS_FMT_UYVY8_1X16, V4L2_PIX_FMT_UYVY, 1,
 	  { { 1, 1 } }, { { 1, 1 } }, { 16 } },
-	{ MEDIA_BUS_FMT_VYUY8_2X8, V4L2_PIX_FMT_VYUY, 1,
+	{ MEDIA_BUS_FMT_VYUY8_1X16, V4L2_PIX_FMT_VYUY, 1,
 	  { { 1, 1 } }, { { 1, 1 } }, { 16 } },
-	{ MEDIA_BUS_FMT_YUYV8_2X8, V4L2_PIX_FMT_YUYV, 1,
+	{ MEDIA_BUS_FMT_YUYV8_1X16, V4L2_PIX_FMT_YUYV, 1,
 	  { { 1, 1 } }, { { 1, 1 } }, { 16 } },
-	{ MEDIA_BUS_FMT_YVYU8_2X8, V4L2_PIX_FMT_YVYU, 1,
+	{ MEDIA_BUS_FMT_YVYU8_1X16, V4L2_PIX_FMT_YVYU, 1,
 	  { { 1, 1 } }, { { 1, 1 } }, { 16 } },
 	{ MEDIA_BUS_FMT_SBGGR8_1X8, V4L2_PIX_FMT_SBGGR8, 1,
 	  { { 1, 1 } }, { { 1, 1 } }, { 8 } },
@@ -134,13 +134,13 @@ static const struct camss_format_info =
formats_rdi_8x96[] =3D {
 };
=20
 static const struct camss_format_info formats_rdi_845[] =3D {
-	{ MEDIA_BUS_FMT_UYVY8_2X8, V4L2_PIX_FMT_UYVY, 1,
+	{ MEDIA_BUS_FMT_UYVY8_1X16, V4L2_PIX_FMT_UYVY, 1,
 	  { { 1, 1 } }, { { 1, 1 } }, { 16 } },
-	{ MEDIA_BUS_FMT_VYUY8_2X8, V4L2_PIX_FMT_VYUY, 1,
+	{ MEDIA_BUS_FMT_VYUY8_1X16, V4L2_PIX_FMT_VYUY, 1,
 	  { { 1, 1 } }, { { 1, 1 } }, { 16 } },
-	{ MEDIA_BUS_FMT_YUYV8_2X8, V4L2_PIX_FMT_YUYV, 1,
+	{ MEDIA_BUS_FMT_YUYV8_1X16, V4L2_PIX_FMT_YUYV, 1,
 	  { { 1, 1 } }, { { 1, 1 } }, { 16 } },
-	{ MEDIA_BUS_FMT_YVYU8_2X8, V4L2_PIX_FMT_YVYU, 1,
+	{ MEDIA_BUS_FMT_YVYU8_1X16, V4L2_PIX_FMT_YVYU, 1,
 	  { { 1, 1 } }, { { 1, 1 } }, { 16 } },
 	{ MEDIA_BUS_FMT_SBGGR8_1X8, V4L2_PIX_FMT_SBGGR8, 1,
 	  { { 1, 1 } }, { { 1, 1 } }, { 8 } },
@@ -201,21 +201,21 @@ static const struct camss_format_info =
formats_pix_8x16[] =3D {
 	  { { 1, 1 } }, { { 2, 3 } }, { 8 } },
 	{ MEDIA_BUS_FMT_VYUY8_1_5X8, V4L2_PIX_FMT_NV21, 1,
 	  { { 1, 1 } }, { { 2, 3 } }, { 8 } },
-	{ MEDIA_BUS_FMT_YUYV8_2X8, V4L2_PIX_FMT_NV16, 1,
+	{ MEDIA_BUS_FMT_YUYV8_1X16, V4L2_PIX_FMT_NV16, 1,
 	  { { 1, 1 } }, { { 1, 2 } }, { 8 } },
-	{ MEDIA_BUS_FMT_YVYU8_2X8, V4L2_PIX_FMT_NV16, 1,
+	{ MEDIA_BUS_FMT_YVYU8_1X16, V4L2_PIX_FMT_NV16, 1,
 	  { { 1, 1 } }, { { 1, 2 } }, { 8 } },
-	{ MEDIA_BUS_FMT_UYVY8_2X8, V4L2_PIX_FMT_NV16, 1,
+	{ MEDIA_BUS_FMT_UYVY8_1X16, V4L2_PIX_FMT_NV16, 1,
 	  { { 1, 1 } }, { { 1, 2 } }, { 8 } },
-	{ MEDIA_BUS_FMT_VYUY8_2X8, V4L2_PIX_FMT_NV16, 1,
+	{ MEDIA_BUS_FMT_VYUY8_1X16, V4L2_PIX_FMT_NV16, 1,
 	  { { 1, 1 } }, { { 1, 2 } }, { 8 } },
-	{ MEDIA_BUS_FMT_YUYV8_2X8, V4L2_PIX_FMT_NV61, 1,
+	{ MEDIA_BUS_FMT_YUYV8_1X16, V4L2_PIX_FMT_NV61, 1,
 	  { { 1, 1 } }, { { 1, 2 } }, { 8 } },
-	{ MEDIA_BUS_FMT_YVYU8_2X8, V4L2_PIX_FMT_NV61, 1,
+	{ MEDIA_BUS_FMT_YVYU8_1X16, V4L2_PIX_FMT_NV61, 1,
 	  { { 1, 1 } }, { { 1, 2 } }, { 8 } },
-	{ MEDIA_BUS_FMT_UYVY8_2X8, V4L2_PIX_FMT_NV61, 1,
+	{ MEDIA_BUS_FMT_UYVY8_1X16, V4L2_PIX_FMT_NV61, 1,
 	  { { 1, 1 } }, { { 1, 2 } }, { 8 } },
-	{ MEDIA_BUS_FMT_VYUY8_2X8, V4L2_PIX_FMT_NV61, 1,
+	{ MEDIA_BUS_FMT_VYUY8_1X16, V4L2_PIX_FMT_NV61, 1,
 	  { { 1, 1 } }, { { 1, 2 } }, { 8 } },
 };
=20
@@ -236,29 +236,29 @@ static const struct camss_format_info =
formats_pix_8x96[] =3D {
 	  { { 1, 1 } }, { { 2, 3 } }, { 8 } },
 	{ MEDIA_BUS_FMT_VYUY8_1_5X8, V4L2_PIX_FMT_NV21, 1,
 	  { { 1, 1 } }, { { 2, 3 } }, { 8 } },
-	{ MEDIA_BUS_FMT_YUYV8_2X8, V4L2_PIX_FMT_NV16, 1,
+	{ MEDIA_BUS_FMT_YUYV8_1X16, V4L2_PIX_FMT_NV16, 1,
 	  { { 1, 1 } }, { { 1, 2 } }, { 8 } },
-	{ MEDIA_BUS_FMT_YVYU8_2X8, V4L2_PIX_FMT_NV16, 1,
+	{ MEDIA_BUS_FMT_YVYU8_1X16, V4L2_PIX_FMT_NV16, 1,
 	  { { 1, 1 } }, { { 1, 2 } }, { 8 } },
-	{ MEDIA_BUS_FMT_UYVY8_2X8, V4L2_PIX_FMT_NV16, 1,
+	{ MEDIA_BUS_FMT_UYVY8_1X16, V4L2_PIX_FMT_NV16, 1,
 	  { { 1, 1 } }, { { 1, 2 } }, { 8 } },
-	{ MEDIA_BUS_FMT_VYUY8_2X8, V4L2_PIX_FMT_NV16, 1,
+	{ MEDIA_BUS_FMT_VYUY8_1X16, V4L2_PIX_FMT_NV16, 1,
 	  { { 1, 1 } }, { { 1, 2 } }, { 8 } },
-	{ MEDIA_BUS_FMT_YUYV8_2X8, V4L2_PIX_FMT_NV61, 1,
+	{ MEDIA_BUS_FMT_YUYV8_1X16, V4L2_PIX_FMT_NV61, 1,
 	  { { 1, 1 } }, { { 1, 2 } }, { 8 } },
-	{ MEDIA_BUS_FMT_YVYU8_2X8, V4L2_PIX_FMT_NV61, 1,
+	{ MEDIA_BUS_FMT_YVYU8_1X16, V4L2_PIX_FMT_NV61, 1,
 	  { { 1, 1 } }, { { 1, 2 } }, { 8 } },
-	{ MEDIA_BUS_FMT_UYVY8_2X8, V4L2_PIX_FMT_NV61, 1,
+	{ MEDIA_BUS_FMT_UYVY8_1X16, V4L2_PIX_FMT_NV61, 1,
 	  { { 1, 1 } }, { { 1, 2 } }, { 8 } },
-	{ MEDIA_BUS_FMT_VYUY8_2X8, V4L2_PIX_FMT_NV61, 1,
+	{ MEDIA_BUS_FMT_VYUY8_1X16, V4L2_PIX_FMT_NV61, 1,
 	  { { 1, 1 } }, { { 1, 2 } }, { 8 } },
-	{ MEDIA_BUS_FMT_UYVY8_2X8, V4L2_PIX_FMT_UYVY, 1,
+	{ MEDIA_BUS_FMT_UYVY8_1X16, V4L2_PIX_FMT_UYVY, 1,
 	  { { 1, 1 } }, { { 1, 1 } }, { 16 } },
-	{ MEDIA_BUS_FMT_VYUY8_2X8, V4L2_PIX_FMT_VYUY, 1,
+	{ MEDIA_BUS_FMT_VYUY8_1X16, V4L2_PIX_FMT_VYUY, 1,
 	  { { 1, 1 } }, { { 1, 1 } }, { 16 } },
-	{ MEDIA_BUS_FMT_YUYV8_2X8, V4L2_PIX_FMT_YUYV, 1,
+	{ MEDIA_BUS_FMT_YUYV8_1X16, V4L2_PIX_FMT_YUYV, 1,
 	  { { 1, 1 } }, { { 1, 1 } }, { 16 } },
-	{ MEDIA_BUS_FMT_YVYU8_2X8, V4L2_PIX_FMT_YVYU, 1,
+	{ MEDIA_BUS_FMT_YVYU8_1X16, V4L2_PIX_FMT_YVYU, 1,
 	  { { 1, 1 } }, { { 1, 1 } }, { 16 } },
 };
=20
--=20
2.34.1

