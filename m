Return-Path: <linux-media+bounces-18210-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 989E5976AF9
	for <lists+linux-media@lfdr.de>; Thu, 12 Sep 2024 15:43:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 05E111F26C6E
	for <lists+linux-media@lfdr.de>; Thu, 12 Sep 2024 13:43:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 401681BC077;
	Thu, 12 Sep 2024 13:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SDDgtyA0"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 982001BBBDC;
	Thu, 12 Sep 2024 13:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726148442; cv=none; b=rgw0QbiI3Np8cl59n7NYsXA5opfhZdpoVgymeMlK6VidbiTTdgLt0O6mXd01u5D+PreN/+dm2jPpROTdsG9U6+vbnQSx/64HZXSWn+85QH1DkJHArz+e4q9KYUcoyH5FmAj8e5nj4MevOWAfZ2TmTY/hBmQjXE0V7tjUhjQm+po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726148442; c=relaxed/simple;
	bh=0UpL5Z4H/gPJEJaEc/AIYWb3PKgC6jCM1uY1uEpUngs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D9tvKltPzvw+aI6O9oWVDxOkKxCAvBI5SsqUoZWOd870YbHjzwg34zvQ1krEpQ/qmex35Kqq05fc0V52bAsLhQm8DLIv1Fknm/XoQmOT7OSoNebFJluNiXAA7igqd8fAwFKh0N8vUbJcrXcwBtVbZ0WPuR9RuwohaE/nrKnYGwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SDDgtyA0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19280C4CEC4;
	Thu, 12 Sep 2024 13:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726148442;
	bh=0UpL5Z4H/gPJEJaEc/AIYWb3PKgC6jCM1uY1uEpUngs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=SDDgtyA0gavnO0zhlVMgf3AtYPGyfVJ/w5LU8OlN6+QANlteW0EkxJYydRtE+0cY7
	 Yv7QW5M4t4E4EfnExNdamZYEawDv3goxEGCxq4efXzOq3OAfCbdqe0JynMNf+sJW6c
	 1GvxQ0fNO6suJPAt2x2wA7Xai6R43a1Oi0SytagEsIV6c5Vb7g5jLDtfnA80HqD41C
	 CceJfx96SLwGrZa/DRWbQdzxrJLwMNW+aFPsSqR0mW1+w9dspZBOiiuOUXrxB/wCRB
	 h6PWm7y7MPK+nB8POEQScZ6rI3rOAwme/DNXrE2eUkNiCkob3B+NuaGXDUC0a7GnON
	 xm8Nev8wQQZgw==
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-7094641d4e6so329473a34.3;
        Thu, 12 Sep 2024 06:40:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU7Z3COpTxQvO3CVvXqMClK1/NuK6k1+TA3NS7is5uI1bYEPyIDxfOuS+R2cqZJx9jJ/yznXnNIXAWB47I=@vger.kernel.org, AJvYcCUf87Fse9O/348DyyvwjRwM0NdO4Ilvv88lG9Y0PapXqMOquocYGiN0GINoW+cuhqgGo+iHu3GumGcYhys=@vger.kernel.org, AJvYcCVz1fHsNpTzkDWL3qilbdVGUc0V3org2vxwUARLJZDsUPqIwQyXzpJLY/socYnRY5yn8lJaQpwVu9cYmwA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGqGo1LD4R2BVndDuJVNOeDV7OX3MnnPIsAQUgOSgIhMFX4Y9O
	jNU5U5rLwLLY4o9Zksb4wSDfQsIIkoar5DvJMDoyLXWezCPyPCMr0SdIMMatQb1t4iflnfboD2a
	2ZSELDx0D6k4kSQOX4x/oPMOSq+Q=
X-Google-Smtp-Source: AGHT+IEHdaDMiqCGY6MU9vTj00ElWCs66j9XfequVIxi6mXXdaPPnEIuz/HiI5p9dHRuEiYtJACRhy63wsetjpuPmIw=
X-Received: by 2002:a05:6358:88d:b0:1bc:2eae:935a with SMTP id
 e5c5f4694b2df-1bc2eae93femr29052755d.19.1726148441214; Thu, 12 Sep 2024
 06:40:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240902-imx214-v1-0-c96cba989315@apitzsch.eu> <20240902-imx214-v1-4-c96cba989315@apitzsch.eu>
In-Reply-To: <20240902-imx214-v1-4-c96cba989315@apitzsch.eu>
From: Ricardo Ribalda Delgado <ribalda@kernel.org>
Date: Thu, 12 Sep 2024 15:40:24 +0200
X-Gmail-Original-Message-ID: <CAPybu_17JUEdOytyt4cmKz=08_1ZoS+O+RjtaNES2r2y4WASYQ@mail.gmail.com>
Message-ID: <CAPybu_17JUEdOytyt4cmKz=08_1ZoS+O+RjtaNES2r2y4WASYQ@mail.gmail.com>
Subject: Re: [PATCH 04/13] media: i2c: imx214: Convert to CCI register access helpers
To: git@apitzsch.eu
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, ~postmarketos/upstreaming@lists.sr.ht, 
	phone-devel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 2, 2024 at 11:53=E2=80=AFPM Andr=C3=A9 Apitzsch via B4 Relay
<devnull+git.apitzsch.eu@kernel.org> wrote:
>
> From: Andr=C3=A9 Apitzsch <git@apitzsch.eu>
>
> Use the new common CCI register access helpers to replace the private
> register access helpers in the imx214 driver. This simplifies the driver
> by reducing the amount of code.
>
Acked-by: Ricardo Ribalda <ribalda@chromium.org>

> Signed-off-by: Andr=C3=A9 Apitzsch <git@apitzsch.eu>
> ---
>  drivers/media/i2c/Kconfig  |   1 +
>  drivers/media/i2c/imx214.c | 672 +++++++++++++++++++++------------------=
------
>  2 files changed, 310 insertions(+), 363 deletions(-)
>
> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> index 8ba096b8ebca..85ecb2aeefdb 100644
> --- a/drivers/media/i2c/Kconfig
> +++ b/drivers/media/i2c/Kconfig
> @@ -140,6 +140,7 @@ config VIDEO_IMX214
>         tristate "Sony IMX214 sensor support"
>         depends on GPIOLIB
>         select REGMAP_I2C
> +       select V4L2_CCI_I2C
>         help
>           This is a Video4Linux2 sensor driver for the Sony
>           IMX214 camera.
> diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
> index ad2f1db6baeb..780c9b8f88b0 100644
> --- a/drivers/media/i2c/imx214.c
> +++ b/drivers/media/i2c/imx214.c
> @@ -15,11 +15,12 @@
>  #include <linux/regmap.h>
>  #include <linux/regulator/consumer.h>
>  #include <media/media-entity.h>
> +#include <media/v4l2-cci.h>
>  #include <media/v4l2-ctrls.h>
>  #include <media/v4l2-fwnode.h>
>  #include <media/v4l2-subdev.h>
>
> -#define IMX214_REG_MODE_SELECT         0x0100
> +#define IMX214_REG_MODE_SELECT         CCI_REG8(0x0100)
>  #define IMX214_MODE_STANDBY            0x00
>  #define IMX214_MODE_STREAMING          0x01
>
> @@ -30,7 +31,7 @@
>  #define IMX214_MBUS_CODE MEDIA_BUS_FMT_SRGGB10_1X10
>
>  /* Exposure control */
> -#define IMX214_REG_EXPOSURE            0x0202
> +#define IMX214_REG_EXPOSURE            CCI_REG16(0x0202)
>  #define IMX214_EXPOSURE_MIN            0
>  #define IMX214_EXPOSURE_MAX            3184
>  #define IMX214_EXPOSURE_STEP           1
> @@ -73,345 +74,324 @@ struct imx214 {
>         struct gpio_desc *enable_gpio;
>  };
>
> -struct reg_8 {
> -       u16 addr;
> -       u8 val;
> -};
> -
> -enum {
> -       IMX214_TABLE_WAIT_MS =3D 0,
> -       IMX214_TABLE_END,
> -       IMX214_MAX_RETRIES,
> -       IMX214_WAIT_MS
> -};
> -
>  /*From imx214_mode_tbls.h*/
> -static const struct reg_8 mode_4096x2304[] =3D {
> -       {0x0114, 0x03},
> -       {0x0220, 0x00},
> -       {0x0221, 0x11},
> -       {0x0222, 0x01},
> -       {0x0340, 0x0C},
> -       {0x0341, 0x7A},
> -       {0x0342, 0x13},
> -       {0x0343, 0x90},
> -       {0x0344, 0x00},
> -       {0x0345, 0x38},
> -       {0x0346, 0x01},
> -       {0x0347, 0x98},
> -       {0x0348, 0x10},
> -       {0x0349, 0x37},
> -       {0x034A, 0x0A},
> -       {0x034B, 0x97},
> -       {0x0381, 0x01},
> -       {0x0383, 0x01},
> -       {0x0385, 0x01},
> -       {0x0387, 0x01},
> -       {0x0900, 0x00},
> -       {0x0901, 0x00},
> -       {0x0902, 0x00},
> -       {0x3000, 0x35},
> -       {0x3054, 0x01},
> -       {0x305C, 0x11},
> -
> -       {0x0112, 0x0A},
> -       {0x0113, 0x0A},
> -       {0x034C, 0x10},
> -       {0x034D, 0x00},
> -       {0x034E, 0x09},
> -       {0x034F, 0x00},
> -       {0x0401, 0x00},
> -       {0x0404, 0x00},
> -       {0x0405, 0x10},
> -       {0x0408, 0x00},
> -       {0x0409, 0x00},
> -       {0x040A, 0x00},
> -       {0x040B, 0x00},
> -       {0x040C, 0x10},
> -       {0x040D, 0x00},
> -       {0x040E, 0x09},
> -       {0x040F, 0x00},
> -
> -       {0x0301, 0x05},
> -       {0x0303, 0x02},
> -       {0x0305, 0x03},
> -       {0x0306, 0x00},
> -       {0x0307, 0x96},
> -       {0x0309, 0x0A},
> -       {0x030B, 0x01},
> -       {0x0310, 0x00},
> -
> -       {0x0820, 0x12},
> -       {0x0821, 0xC0},
> -       {0x0822, 0x00},
> -       {0x0823, 0x00},
> -
> -       {0x3A03, 0x09},
> -       {0x3A04, 0x50},
> -       {0x3A05, 0x01},
> -
> -       {0x0B06, 0x01},
> -       {0x30A2, 0x00},
> -
> -       {0x30B4, 0x00},
> -
> -       {0x3A02, 0xFF},
> -
> -       {0x3011, 0x00},
> -       {0x3013, 0x01},
> -
> -       {0x0202, 0x0C},
> -       {0x0203, 0x70},
> -       {0x0224, 0x01},
> -       {0x0225, 0xF4},
> -
> -       {0x0204, 0x00},
> -       {0x0205, 0x00},
> -       {0x020E, 0x01},
> -       {0x020F, 0x00},
> -       {0x0210, 0x01},
> -       {0x0211, 0x00},
> -       {0x0212, 0x01},
> -       {0x0213, 0x00},
> -       {0x0214, 0x01},
> -       {0x0215, 0x00},
> -       {0x0216, 0x00},
> -       {0x0217, 0x00},
> -
> -       {0x4170, 0x00},
> -       {0x4171, 0x10},
> -       {0x4176, 0x00},
> -       {0x4177, 0x3C},
> -       {0xAE20, 0x04},
> -       {0xAE21, 0x5C},
> -
> -       {IMX214_TABLE_WAIT_MS, 10},
> -       {0x0138, 0x01},
> -       {IMX214_TABLE_END, 0x00}
> +static const struct cci_reg_sequence mode_4096x2304[] =3D {
> +       { CCI_REG8(0x0114), 0x03 },
> +       { CCI_REG8(0x0220), 0x00 },
> +       { CCI_REG8(0x0221), 0x11 },
> +       { CCI_REG8(0x0222), 0x01 },
> +       { CCI_REG8(0x0340), 0x0C },
> +       { CCI_REG8(0x0341), 0x7A },
> +       { CCI_REG8(0x0342), 0x13 },
> +       { CCI_REG8(0x0343), 0x90 },
> +       { CCI_REG8(0x0344), 0x00 },
> +       { CCI_REG8(0x0345), 0x38 },
> +       { CCI_REG8(0x0346), 0x01 },
> +       { CCI_REG8(0x0347), 0x98 },
> +       { CCI_REG8(0x0348), 0x10 },
> +       { CCI_REG8(0x0349), 0x37 },
> +       { CCI_REG8(0x034A), 0x0A },
> +       { CCI_REG8(0x034B), 0x97 },
> +       { CCI_REG8(0x0381), 0x01 },
> +       { CCI_REG8(0x0383), 0x01 },
> +       { CCI_REG8(0x0385), 0x01 },
> +       { CCI_REG8(0x0387), 0x01 },
> +       { CCI_REG8(0x0900), 0x00 },
> +       { CCI_REG8(0x0901), 0x00 },
> +       { CCI_REG8(0x0902), 0x00 },
> +       { CCI_REG8(0x3000), 0x35 },
> +       { CCI_REG8(0x3054), 0x01 },
> +       { CCI_REG8(0x305C), 0x11 },
> +
> +       { CCI_REG8(0x0112), 0x0A },
> +       { CCI_REG8(0x0113), 0x0A },
> +       { CCI_REG8(0x034C), 0x10 },
> +       { CCI_REG8(0x034D), 0x00 },
> +       { CCI_REG8(0x034E), 0x09 },
> +       { CCI_REG8(0x034F), 0x00 },
> +       { CCI_REG8(0x0401), 0x00 },
> +       { CCI_REG8(0x0404), 0x00 },
> +       { CCI_REG8(0x0405), 0x10 },
> +       { CCI_REG8(0x0408), 0x00 },
> +       { CCI_REG8(0x0409), 0x00 },
> +       { CCI_REG8(0x040A), 0x00 },
> +       { CCI_REG8(0x040B), 0x00 },
> +       { CCI_REG8(0x040C), 0x10 },
> +       { CCI_REG8(0x040D), 0x00 },
> +       { CCI_REG8(0x040E), 0x09 },
> +       { CCI_REG8(0x040F), 0x00 },
> +
> +       { CCI_REG8(0x0301), 0x05 },
> +       { CCI_REG8(0x0303), 0x02 },
> +       { CCI_REG8(0x0305), 0x03 },
> +       { CCI_REG8(0x0306), 0x00 },
> +       { CCI_REG8(0x0307), 0x96 },
> +       { CCI_REG8(0x0309), 0x0A },
> +       { CCI_REG8(0x030B), 0x01 },
> +       { CCI_REG8(0x0310), 0x00 },
> +
> +       { CCI_REG8(0x0820), 0x12 },
> +       { CCI_REG8(0x0821), 0xC0 },
> +       { CCI_REG8(0x0822), 0x00 },
> +       { CCI_REG8(0x0823), 0x00 },
> +
> +       { CCI_REG8(0x3A03), 0x09 },
> +       { CCI_REG8(0x3A04), 0x50 },
> +       { CCI_REG8(0x3A05), 0x01 },
> +
> +       { CCI_REG8(0x0B06), 0x01 },
> +       { CCI_REG8(0x30A2), 0x00 },
> +
> +       { CCI_REG8(0x30B4), 0x00 },
> +
> +       { CCI_REG8(0x3A02), 0xFF },
> +
> +       { CCI_REG8(0x3011), 0x00 },
> +       { CCI_REG8(0x3013), 0x01 },
> +
> +       { CCI_REG8(0x0202), 0x0C },
> +       { CCI_REG8(0x0203), 0x70 },
> +       { CCI_REG8(0x0224), 0x01 },
> +       { CCI_REG8(0x0225), 0xF4 },
> +
> +       { CCI_REG8(0x0204), 0x00 },
> +       { CCI_REG8(0x0205), 0x00 },
> +       { CCI_REG8(0x020E), 0x01 },
> +       { CCI_REG8(0x020F), 0x00 },
> +       { CCI_REG8(0x0210), 0x01 },
> +       { CCI_REG8(0x0211), 0x00 },
> +       { CCI_REG8(0x0212), 0x01 },
> +       { CCI_REG8(0x0213), 0x00 },
> +       { CCI_REG8(0x0214), 0x01 },
> +       { CCI_REG8(0x0215), 0x00 },
> +       { CCI_REG8(0x0216), 0x00 },
> +       { CCI_REG8(0x0217), 0x00 },
> +
> +       { CCI_REG8(0x4170), 0x00 },
> +       { CCI_REG8(0x4171), 0x10 },
> +       { CCI_REG8(0x4176), 0x00 },
> +       { CCI_REG8(0x4177), 0x3C },
> +       { CCI_REG8(0xAE20), 0x04 },
> +       { CCI_REG8(0xAE21), 0x5C },
>  };
>
> -static const struct reg_8 mode_1920x1080[] =3D {
> -       {0x0114, 0x03},
> -       {0x0220, 0x00},
> -       {0x0221, 0x11},
> -       {0x0222, 0x01},
> -       {0x0340, 0x0C},
> -       {0x0341, 0x7A},
> -       {0x0342, 0x13},
> -       {0x0343, 0x90},
> -       {0x0344, 0x04},
> -       {0x0345, 0x78},
> -       {0x0346, 0x03},
> -       {0x0347, 0xFC},
> -       {0x0348, 0x0B},
> -       {0x0349, 0xF7},
> -       {0x034A, 0x08},
> -       {0x034B, 0x33},
> -       {0x0381, 0x01},
> -       {0x0383, 0x01},
> -       {0x0385, 0x01},
> -       {0x0387, 0x01},
> -       {0x0900, 0x00},
> -       {0x0901, 0x00},
> -       {0x0902, 0x00},
> -       {0x3000, 0x35},
> -       {0x3054, 0x01},
> -       {0x305C, 0x11},
> -
> -       {0x0112, 0x0A},
> -       {0x0113, 0x0A},
> -       {0x034C, 0x07},
> -       {0x034D, 0x80},
> -       {0x034E, 0x04},
> -       {0x034F, 0x38},
> -       {0x0401, 0x00},
> -       {0x0404, 0x00},
> -       {0x0405, 0x10},
> -       {0x0408, 0x00},
> -       {0x0409, 0x00},
> -       {0x040A, 0x00},
> -       {0x040B, 0x00},
> -       {0x040C, 0x07},
> -       {0x040D, 0x80},
> -       {0x040E, 0x04},
> -       {0x040F, 0x38},
> -
> -       {0x0301, 0x05},
> -       {0x0303, 0x02},
> -       {0x0305, 0x03},
> -       {0x0306, 0x00},
> -       {0x0307, 0x96},
> -       {0x0309, 0x0A},
> -       {0x030B, 0x01},
> -       {0x0310, 0x00},
> -
> -       {0x0820, 0x12},
> -       {0x0821, 0xC0},
> -       {0x0822, 0x00},
> -       {0x0823, 0x00},
> -
> -       {0x3A03, 0x04},
> -       {0x3A04, 0xF8},
> -       {0x3A05, 0x02},
> -
> -       {0x0B06, 0x01},
> -       {0x30A2, 0x00},
> -
> -       {0x30B4, 0x00},
> -
> -       {0x3A02, 0xFF},
> -
> -       {0x3011, 0x00},
> -       {0x3013, 0x01},
> -
> -       {0x0202, 0x0C},
> -       {0x0203, 0x70},
> -       {0x0224, 0x01},
> -       {0x0225, 0xF4},
> -
> -       {0x0204, 0x00},
> -       {0x0205, 0x00},
> -       {0x020E, 0x01},
> -       {0x020F, 0x00},
> -       {0x0210, 0x01},
> -       {0x0211, 0x00},
> -       {0x0212, 0x01},
> -       {0x0213, 0x00},
> -       {0x0214, 0x01},
> -       {0x0215, 0x00},
> -       {0x0216, 0x00},
> -       {0x0217, 0x00},
> -
> -       {0x4170, 0x00},
> -       {0x4171, 0x10},
> -       {0x4176, 0x00},
> -       {0x4177, 0x3C},
> -       {0xAE20, 0x04},
> -       {0xAE21, 0x5C},
> -
> -       {IMX214_TABLE_WAIT_MS, 10},
> -       {0x0138, 0x01},
> -       {IMX214_TABLE_END, 0x00}
> +static const struct cci_reg_sequence mode_1920x1080[] =3D {
> +       { CCI_REG8(0x0114), 0x03 },
> +       { CCI_REG8(0x0220), 0x00 },
> +       { CCI_REG8(0x0221), 0x11 },
> +       { CCI_REG8(0x0222), 0x01 },
> +       { CCI_REG8(0x0340), 0x0C },
> +       { CCI_REG8(0x0341), 0x7A },
> +       { CCI_REG8(0x0342), 0x13 },
> +       { CCI_REG8(0x0343), 0x90 },
> +       { CCI_REG8(0x0344), 0x04 },
> +       { CCI_REG8(0x0345), 0x78 },
> +       { CCI_REG8(0x0346), 0x03 },
> +       { CCI_REG8(0x0347), 0xFC },
> +       { CCI_REG8(0x0348), 0x0B },
> +       { CCI_REG8(0x0349), 0xF7 },
> +       { CCI_REG8(0x034A), 0x08 },
> +       { CCI_REG8(0x034B), 0x33 },
> +       { CCI_REG8(0x0381), 0x01 },
> +       { CCI_REG8(0x0383), 0x01 },
> +       { CCI_REG8(0x0385), 0x01 },
> +       { CCI_REG8(0x0387), 0x01 },
> +       { CCI_REG8(0x0900), 0x00 },
> +       { CCI_REG8(0x0901), 0x00 },
> +       { CCI_REG8(0x0902), 0x00 },
> +       { CCI_REG8(0x3000), 0x35 },
> +       { CCI_REG8(0x3054), 0x01 },
> +       { CCI_REG8(0x305C), 0x11 },
> +
> +       { CCI_REG8(0x0112), 0x0A },
> +       { CCI_REG8(0x0113), 0x0A },
> +       { CCI_REG8(0x034C), 0x07 },
> +       { CCI_REG8(0x034D), 0x80 },
> +       { CCI_REG8(0x034E), 0x04 },
> +       { CCI_REG8(0x034F), 0x38 },
> +       { CCI_REG8(0x0401), 0x00 },
> +       { CCI_REG8(0x0404), 0x00 },
> +       { CCI_REG8(0x0405), 0x10 },
> +       { CCI_REG8(0x0408), 0x00 },
> +       { CCI_REG8(0x0409), 0x00 },
> +       { CCI_REG8(0x040A), 0x00 },
> +       { CCI_REG8(0x040B), 0x00 },
> +       { CCI_REG8(0x040C), 0x07 },
> +       { CCI_REG8(0x040D), 0x80 },
> +       { CCI_REG8(0x040E), 0x04 },
> +       { CCI_REG8(0x040F), 0x38 },
> +
> +       { CCI_REG8(0x0301), 0x05 },
> +       { CCI_REG8(0x0303), 0x02 },
> +       { CCI_REG8(0x0305), 0x03 },
> +       { CCI_REG8(0x0306), 0x00 },
> +       { CCI_REG8(0x0307), 0x96 },
> +       { CCI_REG8(0x0309), 0x0A },
> +       { CCI_REG8(0x030B), 0x01 },
> +       { CCI_REG8(0x0310), 0x00 },
> +
> +       { CCI_REG8(0x0820), 0x12 },
> +       { CCI_REG8(0x0821), 0xC0 },
> +       { CCI_REG8(0x0822), 0x00 },
> +       { CCI_REG8(0x0823), 0x00 },
> +
> +       { CCI_REG8(0x3A03), 0x04 },
> +       { CCI_REG8(0x3A04), 0xF8 },
> +       { CCI_REG8(0x3A05), 0x02 },
> +
> +       { CCI_REG8(0x0B06), 0x01 },
> +       { CCI_REG8(0x30A2), 0x00 },
> +
> +       { CCI_REG8(0x30B4), 0x00 },
> +
> +       { CCI_REG8(0x3A02), 0xFF },
> +
> +       { CCI_REG8(0x3011), 0x00 },
> +       { CCI_REG8(0x3013), 0x01 },
> +
> +       { CCI_REG8(0x0202), 0x0C },
> +       { CCI_REG8(0x0203), 0x70 },
> +       { CCI_REG8(0x0224), 0x01 },
> +       { CCI_REG8(0x0225), 0xF4 },
> +
> +       { CCI_REG8(0x0204), 0x00 },
> +       { CCI_REG8(0x0205), 0x00 },
> +       { CCI_REG8(0x020E), 0x01 },
> +       { CCI_REG8(0x020F), 0x00 },
> +       { CCI_REG8(0x0210), 0x01 },
> +       { CCI_REG8(0x0211), 0x00 },
> +       { CCI_REG8(0x0212), 0x01 },
> +       { CCI_REG8(0x0213), 0x00 },
> +       { CCI_REG8(0x0214), 0x01 },
> +       { CCI_REG8(0x0215), 0x00 },
> +       { CCI_REG8(0x0216), 0x00 },
> +       { CCI_REG8(0x0217), 0x00 },
> +
> +       { CCI_REG8(0x4170), 0x00 },
> +       { CCI_REG8(0x4171), 0x10 },
> +       { CCI_REG8(0x4176), 0x00 },
> +       { CCI_REG8(0x4177), 0x3C },
> +       { CCI_REG8(0xAE20), 0x04 },
> +       { CCI_REG8(0xAE21), 0x5C },
>  };
>
> -static const struct reg_8 mode_table_common[] =3D {
> +static const struct cci_reg_sequence mode_table_common[] =3D {
>         /* software reset */
>
>         /* software standby settings */
> -       {0x0100, 0x00},
> +       { CCI_REG8(0x0100), 0x00 },
>
>         /* ATR setting */
> -       {0x9300, 0x02},
> +       { CCI_REG8(0x9300), 0x02 },
>
>         /* external clock setting */
> -       {0x0136, 0x18},
> -       {0x0137, 0x00},
> +       { CCI_REG8(0x0136), 0x18 },
> +       { CCI_REG8(0x0137), 0x00 },
>
>         /* global setting */
>         /* basic config */
> -       {0x0101, 0x00},
> -       {0x0105, 0x01},
> -       {0x0106, 0x01},
> -       {0x4550, 0x02},
> -       {0x4601, 0x00},
> -       {0x4642, 0x05},
> -       {0x6227, 0x11},
> -       {0x6276, 0x00},
> -       {0x900E, 0x06},
> -       {0xA802, 0x90},
> -       {0xA803, 0x11},
> -       {0xA804, 0x62},
> -       {0xA805, 0x77},
> -       {0xA806, 0xAE},
> -       {0xA807, 0x34},
> -       {0xA808, 0xAE},
> -       {0xA809, 0x35},
> -       {0xA80A, 0x62},
> -       {0xA80B, 0x83},
> -       {0xAE33, 0x00},
> +       { CCI_REG8(0x0101), 0x00 },
> +       { CCI_REG8(0x0105), 0x01 },
> +       { CCI_REG8(0x0106), 0x01 },
> +       { CCI_REG8(0x4550), 0x02 },
> +       { CCI_REG8(0x4601), 0x00 },
> +       { CCI_REG8(0x4642), 0x05 },
> +       { CCI_REG8(0x6227), 0x11 },
> +       { CCI_REG8(0x6276), 0x00 },
> +       { CCI_REG8(0x900E), 0x06 },
> +       { CCI_REG8(0xA802), 0x90 },
> +       { CCI_REG8(0xA803), 0x11 },
> +       { CCI_REG8(0xA804), 0x62 },
> +       { CCI_REG8(0xA805), 0x77 },
> +       { CCI_REG8(0xA806), 0xAE },
> +       { CCI_REG8(0xA807), 0x34 },
> +       { CCI_REG8(0xA808), 0xAE },
> +       { CCI_REG8(0xA809), 0x35 },
> +       { CCI_REG8(0xA80A), 0x62 },
> +       { CCI_REG8(0xA80B), 0x83 },
> +       { CCI_REG8(0xAE33), 0x00 },
>
>         /* analog setting */
> -       {0x4174, 0x00},
> -       {0x4175, 0x11},
> -       {0x4612, 0x29},
> -       {0x461B, 0x12},
> -       {0x461F, 0x06},
> -       {0x4635, 0x07},
> -       {0x4637, 0x30},
> -       {0x463F, 0x18},
> -       {0x4641, 0x0D},
> -       {0x465B, 0x12},
> -       {0x465F, 0x11},
> -       {0x4663, 0x11},
> -       {0x4667, 0x0F},
> -       {0x466F, 0x0F},
> -       {0x470E, 0x09},
> -       {0x4909, 0xAB},
> -       {0x490B, 0x95},
> -       {0x4915, 0x5D},
> -       {0x4A5F, 0xFF},
> -       {0x4A61, 0xFF},
> -       {0x4A73, 0x62},
> -       {0x4A85, 0x00},
> -       {0x4A87, 0xFF},
> +       { CCI_REG8(0x4174), 0x00 },
> +       { CCI_REG8(0x4175), 0x11 },
> +       { CCI_REG8(0x4612), 0x29 },
> +       { CCI_REG8(0x461B), 0x12 },
> +       { CCI_REG8(0x461F), 0x06 },
> +       { CCI_REG8(0x4635), 0x07 },
> +       { CCI_REG8(0x4637), 0x30 },
> +       { CCI_REG8(0x463F), 0x18 },
> +       { CCI_REG8(0x4641), 0x0D },
> +       { CCI_REG8(0x465B), 0x12 },
> +       { CCI_REG8(0x465F), 0x11 },
> +       { CCI_REG8(0x4663), 0x11 },
> +       { CCI_REG8(0x4667), 0x0F },
> +       { CCI_REG8(0x466F), 0x0F },
> +       { CCI_REG8(0x470E), 0x09 },
> +       { CCI_REG8(0x4909), 0xAB },
> +       { CCI_REG8(0x490B), 0x95 },
> +       { CCI_REG8(0x4915), 0x5D },
> +       { CCI_REG8(0x4A5F), 0xFF },
> +       { CCI_REG8(0x4A61), 0xFF },
> +       { CCI_REG8(0x4A73), 0x62 },
> +       { CCI_REG8(0x4A85), 0x00 },
> +       { CCI_REG8(0x4A87), 0xFF },
>
>         /* embedded data */
> -       {0x5041, 0x04},
> -       {0x583C, 0x04},
> -       {0x620E, 0x04},
> -       {0x6EB2, 0x01},
> -       {0x6EB3, 0x00},
> -       {0x9300, 0x02},
> +       { CCI_REG8(0x5041), 0x04 },
> +       { CCI_REG8(0x583C), 0x04 },
> +       { CCI_REG8(0x620E), 0x04 },
> +       { CCI_REG8(0x6EB2), 0x01 },
> +       { CCI_REG8(0x6EB3), 0x00 },
> +       { CCI_REG8(0x9300), 0x02 },
>
>         /* imagequality */
>         /* HDR setting */
> -       {0x3001, 0x07},
> -       {0x6D12, 0x3F},
> -       {0x6D13, 0xFF},
> -       {0x9344, 0x03},
> -       {0x9706, 0x10},
> -       {0x9707, 0x03},
> -       {0x9708, 0x03},
> -       {0x9E04, 0x01},
> -       {0x9E05, 0x00},
> -       {0x9E0C, 0x01},
> -       {0x9E0D, 0x02},
> -       {0x9E24, 0x00},
> -       {0x9E25, 0x8C},
> -       {0x9E26, 0x00},
> -       {0x9E27, 0x94},
> -       {0x9E28, 0x00},
> -       {0x9E29, 0x96},
> +       { CCI_REG8(0x3001), 0x07 },
> +       { CCI_REG8(0x6D12), 0x3F },
> +       { CCI_REG8(0x6D13), 0xFF },
> +       { CCI_REG8(0x9344), 0x03 },
> +       { CCI_REG8(0x9706), 0x10 },
> +       { CCI_REG8(0x9707), 0x03 },
> +       { CCI_REG8(0x9708), 0x03 },
> +       { CCI_REG8(0x9E04), 0x01 },
> +       { CCI_REG8(0x9E05), 0x00 },
> +       { CCI_REG8(0x9E0C), 0x01 },
> +       { CCI_REG8(0x9E0D), 0x02 },
> +       { CCI_REG8(0x9E24), 0x00 },
> +       { CCI_REG8(0x9E25), 0x8C },
> +       { CCI_REG8(0x9E26), 0x00 },
> +       { CCI_REG8(0x9E27), 0x94 },
> +       { CCI_REG8(0x9E28), 0x00 },
> +       { CCI_REG8(0x9E29), 0x96 },
>
>         /* CNR parameter setting */
> -       {0x69DB, 0x01},
> +       { CCI_REG8(0x69DB), 0x01 },
>
>         /* Moire reduction */
> -       {0x6957, 0x01},
> +       { CCI_REG8(0x6957), 0x01 },
>
>         /* image enhancement */
> -       {0x6987, 0x17},
> -       {0x698A, 0x03},
> -       {0x698B, 0x03},
> +       { CCI_REG8(0x6987), 0x17 },
> +       { CCI_REG8(0x698A), 0x03 },
> +       { CCI_REG8(0x698B), 0x03 },
>
>         /* white balanace */
> -       {0x0B8E, 0x01},
> -       {0x0B8F, 0x00},
> -       {0x0B90, 0x01},
> -       {0x0B91, 0x00},
> -       {0x0B92, 0x01},
> -       {0x0B93, 0x00},
> -       {0x0B94, 0x01},
> -       {0x0B95, 0x00},
> +       { CCI_REG8(0x0B8E), 0x01 },
> +       { CCI_REG8(0x0B8F), 0x00 },
> +       { CCI_REG8(0x0B90), 0x01 },
> +       { CCI_REG8(0x0B91), 0x00 },
> +       { CCI_REG8(0x0B92), 0x01 },
> +       { CCI_REG8(0x0B93), 0x00 },
> +       { CCI_REG8(0x0B94), 0x01 },
> +       { CCI_REG8(0x0B95), 0x00 },
>
>         /* ATR setting */
> -       {0x6E50, 0x00},
> -       {0x6E51, 0x32},
> -       {0x9340, 0x00},
> -       {0x9341, 0x3C},
> -       {0x9342, 0x03},
> -       {0x9343, 0xFF},
> -       {IMX214_TABLE_END, 0x00}
> +       { CCI_REG8(0x6E50), 0x00 },
> +       { CCI_REG8(0x6E51), 0x32 },
> +       { CCI_REG8(0x9340), 0x00 },
> +       { CCI_REG8(0x9341), 0x3C },
> +       { CCI_REG8(0x9342), 0x03 },
> +       { CCI_REG8(0x9343), 0xFF },
>  };
>
>  /*
> @@ -421,16 +401,19 @@ static const struct reg_8 mode_table_common[] =3D {
>  static const struct imx214_mode {
>         u32 width;
>         u32 height;
> -       const struct reg_8 *reg_table;
> +       unsigned int num_of_regs;
> +       const struct cci_reg_sequence *reg_table;
>  } imx214_modes[] =3D {
>         {
>                 .width =3D 4096,
>                 .height =3D 2304,
> +               .num_of_regs =3D ARRAY_SIZE(mode_4096x2304),
>                 .reg_table =3D mode_4096x2304,
>         },
>         {
>                 .width =3D 1920,
>                 .height =3D 1080,
> +               .num_of_regs =3D ARRAY_SIZE(mode_1920x1080),
>                 .reg_table =3D mode_1920x1080,
>         },
>  };
> @@ -631,7 +614,6 @@ static int imx214_set_ctrl(struct v4l2_ctrl *ctrl)
>  {
>         struct imx214 *imx214 =3D container_of(ctrl->handler,
>                                              struct imx214, ctrls);
> -       u8 vals[2];
>         int ret;
>
>         /*
> @@ -643,12 +625,7 @@ static int imx214_set_ctrl(struct v4l2_ctrl *ctrl)
>
>         switch (ctrl->id) {
>         case V4L2_CID_EXPOSURE:
> -               vals[1] =3D ctrl->val;
> -               vals[0] =3D ctrl->val >> 8;
> -               ret =3D regmap_bulk_write(imx214->regmap, IMX214_REG_EXPO=
SURE, vals, 2);
> -               if (ret < 0)
> -                       dev_err(imx214->dev, "Error %d\n", ret);
> -               ret =3D 0;
> +               cci_write(imx214->regmap, IMX214_REG_EXPOSURE, ctrl->val,=
 &ret);
>                 break;
>
>         default:
> @@ -734,46 +711,13 @@ static int imx214_ctrls_init(struct imx214 *imx214)
>         return 0;
>  };
>
> -#define MAX_CMD 4
> -static int imx214_write_table(struct imx214 *imx214,
> -                             const struct reg_8 table[])
> -{
> -       u8 vals[MAX_CMD];
> -       int i;
> -       int ret;
> -
> -       for (; table->addr !=3D IMX214_TABLE_END ; table++) {
> -               if (table->addr =3D=3D IMX214_TABLE_WAIT_MS) {
> -                       usleep_range(table->val * 1000,
> -                                    table->val * 1000 + 500);
> -                       continue;
> -               }
> -
> -               for (i =3D 0; i < MAX_CMD; i++) {
> -                       if (table[i].addr !=3D (table[0].addr + i))
> -                               break;
> -                       vals[i] =3D table[i].val;
> -               }
> -
> -               ret =3D regmap_bulk_write(imx214->regmap, table->addr, va=
ls, i);
> -
> -               if (ret) {
> -                       dev_err(imx214->dev, "write_table error: %d\n", r=
et);
> -                       return ret;
> -               }
> -
> -               table +=3D i - 1;
> -       }
> -
> -       return 0;
> -}
> -
>  static int imx214_start_streaming(struct imx214 *imx214)
>  {
>         const struct imx214_mode *mode;
>         int ret;
>
> -       ret =3D imx214_write_table(imx214, mode_table_common);
> +       ret =3D cci_multi_reg_write(imx214->regmap, mode_table_common,
> +                                 ARRAY_SIZE(mode_table_common), NULL);
>         if (ret < 0) {
>                 dev_err(imx214->dev, "could not sent common table %d\n", =
ret);
>                 return ret;
> @@ -782,17 +726,24 @@ static int imx214_start_streaming(struct imx214 *im=
x214)
>         mode =3D v4l2_find_nearest_size(imx214_modes,
>                                 ARRAY_SIZE(imx214_modes), width, height,
>                                 imx214->fmt.width, imx214->fmt.height);
> -       ret =3D imx214_write_table(imx214, mode->reg_table);
> +       ret =3D cci_multi_reg_write(imx214->regmap, mode->reg_table,
> +                                 mode->num_of_regs, NULL);
>         if (ret < 0) {
>                 dev_err(imx214->dev, "could not sent mode table %d\n", re=
t);
>                 return ret;
>         }
> +
> +       usleep_range(10000, 10500);
> +
> +       cci_write(imx214->regmap, CCI_REG8(0x0138), 0x01, NULL);
> +
>         ret =3D __v4l2_ctrl_handler_setup(&imx214->ctrls);
>         if (ret < 0) {
>                 dev_err(imx214->dev, "could not sync v4l2 controls\n");
>                 return ret;
>         }
> -       ret =3D regmap_write(imx214->regmap, IMX214_REG_MODE_SELECT, IMX2=
14_MODE_STREAMING);
> +       ret =3D cci_write(imx214->regmap, IMX214_REG_MODE_SELECT,
> +                       IMX214_MODE_STREAMING, NULL);
>         if (ret < 0)
>                 dev_err(imx214->dev, "could not sent start table %d\n", r=
et);
>
> @@ -803,7 +754,8 @@ static int imx214_stop_streaming(struct imx214 *imx21=
4)
>  {
>         int ret;
>
> -       ret =3D regmap_write(imx214->regmap, IMX214_REG_MODE_SELECT, IMX2=
14_MODE_STANDBY);
> +       ret =3D cci_write(imx214->regmap, IMX214_REG_MODE_SELECT,
> +                       IMX214_MODE_STANDBY, NULL);
>         if (ret < 0)
>                 dev_err(imx214->dev, "could not sent stop table %d\n",  r=
et);
>
> @@ -904,12 +856,6 @@ static const struct v4l2_subdev_internal_ops imx214_=
internal_ops =3D {
>         .init_state =3D imx214_entity_init_state,
>  };
>
> -static const struct regmap_config sensor_regmap_config =3D {
> -       .reg_bits =3D 16,
> -       .val_bits =3D 8,
> -       .cache_type =3D REGCACHE_MAPLE,
> -};
> -
>  static int imx214_get_regulators(struct device *dev, struct imx214 *imx2=
14)
>  {
>         unsigned int i;
> @@ -992,10 +938,10 @@ static int imx214_probe(struct i2c_client *client)
>                 return dev_err_probe(dev, PTR_ERR(imx214->enable_gpio),
>                                      "failed to get enable gpio\n");
>
> -       imx214->regmap =3D devm_regmap_init_i2c(client, &sensor_regmap_co=
nfig);
> +       imx214->regmap =3D devm_cci_regmap_init_i2c(client, 16);
>         if (IS_ERR(imx214->regmap))
>                 return dev_err_probe(dev, PTR_ERR(imx214->regmap),
> -                                    "regmap init failed\n");
> +                                    "failed to initialize CCI\n");
>
>         v4l2_i2c_subdev_init(&imx214->sd, client, &imx214_subdev_ops);
>         imx214->sd.internal_ops =3D &imx214_internal_ops;
>
> --
> 2.46.0
>
>

