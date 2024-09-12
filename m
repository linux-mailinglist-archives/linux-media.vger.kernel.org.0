Return-Path: <linux-media+bounces-18202-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB0A976AE6
	for <lists+linux-media@lfdr.de>; Thu, 12 Sep 2024 15:40:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8D9201C210FB
	for <lists+linux-media@lfdr.de>; Thu, 12 Sep 2024 13:40:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31DE01B12F1;
	Thu, 12 Sep 2024 13:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BEp8c2YY"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8804E1A3020;
	Thu, 12 Sep 2024 13:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726148413; cv=none; b=cZA4qAXE+Y2Jc7sPqiR0cOUoQmdmJzKCMqrPtvLKh7R5GXttsItdpLSNLJFjHk8rL53rpVhJTukrzMDTgCW3gz35akvOVbGFakj8Zh6HBeFbtTtoGev+QqzC2CciogS59pDpkA9xK6igW07m1N71UYjBm93xWGAW2LRQg2zljUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726148413; c=relaxed/simple;
	bh=DL4r0O+R6v2AX/R0/ff7Hz0z7SSO2IxHsWtTWD68ru0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IUiKox1Q6cFQQp1pZrCV8kMGEVGuppNE/nAPBKtifMGDZ3BeynHLQ/Juk+EgkpwmFBJ6j34MtVUiIRsewcAdfMQV7kgs+FPFfGBg3IVJCvUgDClwwRu3EIc2GzLuIEPGuzrDBadxcVsBMPl5l6mkUCUOv9T4iHxJ9dP0HAdzIPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BEp8c2YY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 209E7C4CECF;
	Thu, 12 Sep 2024 13:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726148413;
	bh=DL4r0O+R6v2AX/R0/ff7Hz0z7SSO2IxHsWtTWD68ru0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=BEp8c2YYQzSka1e725md1K+4XTuMMiqQMo+eHx6KHzP1b7xE4sP4aiLk0m24vLrj4
	 fW0DI6Nne/DBuip9cjLY46EinJXE3BbVKG+s1wxy8gN6VaCWtqe9CEEHZM7wcIFZF3
	 9mE1psx1PxT3wztFGxRRHSHX/qoONxqu4jekjjEmzfdOcmG6n44dS+WO6lWehSXV+N
	 ko6KJjoLCBjmQMOh/vfk9KhJ3NUqy3s6CUT1ip9OXdMOWNgXpvMGR8DCvb0tlM+kvH
	 DVSd5tWLVm/dtGRIBRTPurfy7iEXmQUgLfCz7IFzBI7nsM8A+OleH6NeZwxsPA3ZYi
	 hjcaulsr2wkKg==
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-711009878e2so389707a34.2;
        Thu, 12 Sep 2024 06:40:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVi6RlgfHZwsbdopBHLt570NudE+UIIwqfQbmZQCxoR6l3XJidcWQbb49E6LZv8hj0DZg+aqQPJyFclOa0=@vger.kernel.org, AJvYcCXFL3xcRG71XoS4kXcaHJzA/805Yu8jwxQ0xRkbvPo026e1zNGGzIJ9SeVe8DZg8tKzmudo094wznYdU0I=@vger.kernel.org, AJvYcCXKqGXlzep9MDYBKbAOiRTwbtOwNPoaTMU4ogPAW9iB6gl/CBsMlKt6dRvy+RWYUonOmJbf1O1ERctd8uE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7ABz29/Pe8McbQAF3yXUBqUiPCtJtnwMhjO1AafQLCxrROO15
	naM2xRenNlg+34GITmoWFI2F0ArXxyiE5UnnslajGjOzyZOsqmBHTflZOVXVPKDVJZVMBGjguU9
	9bO4vipfdJU1PMT1REcE4gNxKyEc=
X-Google-Smtp-Source: AGHT+IGHZExVrLttlRlmulr921uUh4RLCBBvJ8OSgzw4JC2tb2Gh9GkIoaehGRMR7LrEXd9k4KwH57vTAnIHrsHEWgM=
X-Received: by 2002:a05:6358:5e03:b0:1ba:5d0d:a259 with SMTP id
 e5c5f4694b2df-1bb23e0322bmr141981555d.24.1726148412418; Thu, 12 Sep 2024
 06:40:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240902-imx214-v1-0-c96cba989315@apitzsch.eu> <20240902-imx214-v1-12-c96cba989315@apitzsch.eu>
In-Reply-To: <20240902-imx214-v1-12-c96cba989315@apitzsch.eu>
From: Ricardo Ribalda Delgado <ribalda@kernel.org>
Date: Thu, 12 Sep 2024 15:39:56 +0200
X-Gmail-Original-Message-ID: <CAPybu_2JqoQbAz8qm8BWF_dknbMExK+vhNvn62wjaO0QrZyeHA@mail.gmail.com>
Message-ID: <CAPybu_2JqoQbAz8qm8BWF_dknbMExK+vhNvn62wjaO0QrZyeHA@mail.gmail.com>
Subject: Re: [PATCH 12/13] media: i2c: imx214: Verify chip ID
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
> Check the chip ID and stop probing if it is no imx214 sensor.
>
> Signed-off-by: Andr=C3=A9 Apitzsch <git@apitzsch.eu>
Acked-by: Ricardo Ribalda <ribalda@chromium.org>

> ---
>  drivers/media/i2c/imx214.c | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
>
> diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
> index ce6d8a90f4a1..6493a9b9ea88 100644
> --- a/drivers/media/i2c/imx214.c
> +++ b/drivers/media/i2c/imx214.c
> @@ -20,6 +20,10 @@
>  #include <media/v4l2-fwnode.h>
>  #include <media/v4l2-subdev.h>
>
> +/* Chip ID */
> +#define IMX214_REG_CHIP_ID             CCI_REG16(0x0016)
> +#define IMX214_CHIP_ID                 0x0214
> +
>  #define IMX214_REG_MODE_SELECT         CCI_REG8(0x0100)
>  #define IMX214_MODE_STANDBY            0x00
>  #define IMX214_MODE_STREAMING          0x01
> @@ -1168,6 +1172,27 @@ static int imx214_get_regulators(struct device *de=
v, struct imx214 *imx214)
>                                        imx214->supplies);
>  }
>
> +/* Verify chip ID */
> +static int imx214_identify_module(struct imx214 *imx214)
> +{
> +       struct i2c_client *client =3D v4l2_get_subdevdata(&imx214->sd);
> +       int ret;
> +       u64 val;
> +
> +       ret =3D cci_read(imx214->regmap, IMX214_REG_CHIP_ID, &val, NULL);
> +       if (ret)
> +               return dev_err_probe(&client->dev, ret,
> +                                    "failed to read chip id %x\n",
> +                                    IMX214_CHIP_ID);
> +
> +       if (val !=3D IMX214_CHIP_ID)
> +               return dev_err_probe(&client->dev, -EIO,
> +                                    "chip id mismatch: %x!=3D%llx\n",
> +                                    IMX214_CHIP_ID, val);
> +
> +       return 0;
> +}
> +
>  static int imx214_parse_fwnode(struct device *dev, struct imx214 *imx214=
)
>  {
>         struct fwnode_handle *endpoint;
> @@ -1261,6 +1286,10 @@ static int imx214_probe(struct i2c_client *client)
>          */
>         imx214_power_on(imx214->dev);
>
> +       ret =3D imx214_identify_module(imx214);
> +       if (ret)
> +               goto error_power_off;
> +
>         pm_runtime_set_active(imx214->dev);
>         pm_runtime_enable(imx214->dev);
>         pm_runtime_idle(imx214->dev);
>
> --
> 2.46.0
>
>

