Return-Path: <linux-media+bounces-40020-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7516CB29040
	for <lists+linux-media@lfdr.de>; Sat, 16 Aug 2025 21:44:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D0C851C876A8
	for <lists+linux-media@lfdr.de>; Sat, 16 Aug 2025 19:44:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCAD2213E6A;
	Sat, 16 Aug 2025 19:44:23 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8EB51A3166;
	Sat, 16 Aug 2025 19:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755373463; cv=none; b=orCQ50s2u4ZMAT/L12iK1eufauLSHrlHZiieGKslYAYIB4U4rVqDOQdrJdkrr1VeuU0QyqYk2RbIxmJhDL1usFl8MCKkdZ446C+QfjJ8yvSR/XfBQudRhMQVlN9T6sFlbPzNqpzDEx7vtqomgvaJkB/c+9eHQnynXFOTVpWxh7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755373463; c=relaxed/simple;
	bh=CxOkN5Im8aBXZWyAkD76EEsI08M13nbfFlULVi6mYiw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V9yYH8Q5P301P1w+cnB8NPtfInQRsjSNCFwYS/c3njDQ8WnfoArlTOndr6aPihb5YZt3xQXnAaSpfU1ccEeoL4x+cTLy84GTfFcz32XY20yhvRg9VdNouep7iRDgVCqkfG/1JyRRkuujMFLPCQrfcmZ62Ll5ODIQoFJgUSApbuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=willwhang.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=willwhang.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6188b5ad681so4108542a12.0;
        Sat, 16 Aug 2025 12:44:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755373459; x=1755978259;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xhNfRQTJCTHs8wZzyX52sBmas0EwpebMHyW2WLiU29g=;
        b=gJG61+u8JIZab8zkSfVYatuTh8ggrV1uvAVroshRVIf60QVl+xDN9P5s+b3VW83k68
         oNQNIydh/rZ/PIHjNepE29pvOu83a+qrpSHgjdvegQTFf6DCJ5xnFajcP10GKu13IQNA
         PQK0BgQppHAbj9adQFUTV0lEdjRb9JsUG+uomIjSkEy29J0kQSEuk8Sm5lUGYT30tBoq
         lwOdhe9Slgssme4MV5wm0RI3/lEQnb1vr7EYEkqkoOU1HLDEKSsvgyUW9CBmGzrG4yWX
         d/2QLNac8SziSrj2k1Gg1Lx1MJW4y/T/NVQcQvf8d9IXNDoIMuoHVGfCP8+6trcU1Kak
         Jq9g==
X-Forwarded-Encrypted: i=1; AJvYcCUE7eLKUbRBBilvt6i6FohonuQk5PKbLs26rkpfzJV1+a9KfjQn19bK/8BXX22+ZlG7CzcUVqXZXb+RAK++@vger.kernel.org, AJvYcCVYdzQ9gfIPjZyL+lmPuXk+qmJLfBCNL1OWihiRJcs8s+7dUjk8KIR5pnk4UE6r3odmKKXNPdF/zXdF@vger.kernel.org, AJvYcCVaLmKANxt8/1dbORUu1mRJgoSGcnyr9zIkgPn0HeFRw4+JzQEhV+TVgQWkYWSUGbfuOvgHZGPbAwnfWfs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDYADuoFEYVix2JLp/ZtcV37KWhJQysPBEo8+jObm3/UgKoS9C
	SOrvtpbxBmY6b++yQugsakk/Bp7xgbTRSGk0nC9vKFGD8ZIOl0Ml6uIhG8U+aXGcKy8=
X-Gm-Gg: ASbGncvfqV2qxogbMxruZseV1rnjG51DnxIB6+5wZByBYwc0qIyZL7as4NrBHuuqm8p
	ZShXTjXD9XdD/9nD89KabAcnpdqXgh5tPKTixeeOGYewlR0YsErmkgsz4WkCMfVU5NQgnLRVRyP
	CnaPki99pkbTuCtn9AYZIBTInxBmgGi7iLSDxTfwLQaTR/xo+4cMlApSUdK5/gOGicF2ng78kOE
	bv+wcrzsZCPZBUiWQ9CFa/V08GjlrUorcqeqnxpvs9JhTIsH38KCNCkDJ+8D8eOjCn/zYB75QLk
	rechTE3BpvS+1G9Yxxg1hsz5E6kHBlySpkVuaUfxL8rUXSANtitPATKXbo9SNWjBisgNbIpuV21
	M1Z8zA9s/ZpClM1ZEou2m+69W9abqdZJw6V6Mu8+L5yMzjStSrkZQw7BUMQ==
X-Google-Smtp-Source: AGHT+IF11+0kRNdzNVSkYd7J4a+gx/5oVsKz4/r1QtGu9V4+SCyBNATcWaR+MPKV/XHPcqLojimmbA==
X-Received: by 2002:a05:6402:2102:b0:618:10c3:d799 with SMTP id 4fb4d7f45d1cf-619bf20ff00mr3560066a12.28.1755373458986;
        Sat, 16 Aug 2025 12:44:18 -0700 (PDT)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com. [209.85.208.44])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-618b02b0e42sm3785588a12.52.2025.08.16.12.44.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 16 Aug 2025 12:44:18 -0700 (PDT)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-618b62dba21so1805728a12.2;
        Sat, 16 Aug 2025 12:44:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUP1IcS3O7jgMxSzu5iGLG/zEP9br3iXc7Id5t12d40PqJAklFVQdClsgmI0+tIZPUX8cXBDZjfADwRJngW@vger.kernel.org, AJvYcCW/PjHylU9c67IDIbJ0fPQ5kBhh1AsR9yGcIhmHp9X5eUTDiGTXjc+ZO1/eNuYxh8oTa8ZvrPynteIB@vger.kernel.org, AJvYcCWeKOT8+GTevppPN1jEbXchD1NdQxW92O3UFPoUHge/Ri1ekXRLuqjBKazUVWDtV55WxiTEg21BgE0FzAs=@vger.kernel.org
X-Received: by 2002:a05:6402:3495:b0:615:5bec:1df with SMTP id
 4fb4d7f45d1cf-619bf1f7206mr3258270a12.25.1755373458280; Sat, 16 Aug 2025
 12:44:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250810220921.14307-1-will@willwhang.com> <20250810220921.14307-4-will@willwhang.com>
 <20250811-cinnamon-tapir-of-music-0bda96@kuoka>
In-Reply-To: <20250811-cinnamon-tapir-of-music-0bda96@kuoka>
From: Will Whang <will@willwhang.com>
Date: Sat, 16 Aug 2025 12:44:05 -0700
X-Gmail-Original-Message-ID: <CAFoNnryfrJvoEHNgQDpSZBbGiGjPr-bwnhhg4cgpNK_hW=0EbQ@mail.gmail.com>
X-Gm-Features: Ac12FXy-vY_C5easw1Tym_fd5E3dOtxKIqhJ9wZAZ5bar5LAous57hWKnWEIrdU
Message-ID: <CAFoNnryfrJvoEHNgQDpSZBbGiGjPr-bwnhhg4cgpNK_hW=0EbQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] media: i2c: imx585: Add Sony IMX585 image-sensor driver
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 11, 2025 at 1:06=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Sun, Aug 10, 2025 at 11:09:20PM +0100, Will Whang wrote:
> > +
> > +/* -------------------------------------------------------------------=
-------
> > + * Power / runtime PM
> > + * -------------------------------------------------------------------=
-------
> > + */
> > +
> > +static int imx585_power_on(struct device *dev)
> > +{
> > +     struct v4l2_subdev *sd =3D dev_get_drvdata(dev);
> > +     struct imx585 *imx585 =3D to_imx585(sd);
> > +     int ret;
> > +
> > +     dev_dbg(imx585->clientdev, "power_on\n");
> > +
> > +     ret =3D regulator_bulk_enable(IMX585_NUM_SUPPLIES, imx585->suppli=
es);
> > +     if (ret) {
> > +             dev_err(imx585->clientdev, "Failed to enable regulators\n=
");
> > +             return ret;
> > +     }
> > +
> > +     ret =3D clk_prepare_enable(imx585->xclk);
> > +     if (ret) {
> > +             dev_err(imx585->clientdev, "Failed to enable clock\n");
> > +             goto reg_off;
> > +     }
> > +
> > +     gpiod_set_value_cansleep(imx585->reset_gpio, 1);
>
> You asserted reset gpio causing it to enter reset and you call this
> "power on"?
>
> > +     usleep_range(IMX585_XCLR_MIN_DELAY_US,
> > +                  IMX585_XCLR_MIN_DELAY_US + IMX585_XCLR_DELAY_RANGE_U=
S);
> > +     return 0;
> > +
> > +reg_off:
> > +     regulator_bulk_disable(IMX585_NUM_SUPPLIES, imx585->supplies);
> > +     return ret;
> > +}
> > +
> > +static int imx585_power_off(struct device *dev)
> > +{
> > +     struct v4l2_subdev *sd =3D dev_get_drvdata(dev);
> > +     struct imx585 *imx585 =3D to_imx585(sd);
> > +
> > +     dev_dbg(imx585->clientdev, "power_off\n");
> > +
> > +     gpiod_set_value_cansleep(imx585->reset_gpio, 0);
>
> And here device comes up, but you call it power off? Your functions or
> reset gpio code are completely reversed/wrong.

Reset pin High -> Run normally
Reset pin Low -> Reset state

See drivers/media/i2c/imx219.c with the same logic:

static int imx219_power_on(struct device *dev)
{
struct v4l2_subdev *sd =3D dev_get_drvdata(dev);
struct imx219 *imx219 =3D to_imx219(sd);
int ret;

ret =3D regulator_bulk_enable(IMX219_NUM_SUPPLIES,
   imx219->supplies);
if (ret) {
dev_err(dev, "%s: failed to enable regulators\n",
__func__);
return ret;
}

ret =3D clk_prepare_enable(imx219->xclk);
if (ret) {
dev_err(dev, "%s: failed to enable clock\n",
__func__);
goto reg_off;
}

gpiod_set_value_cansleep(imx219->reset_gpio, 1);
usleep_range(IMX219_XCLR_MIN_DELAY_US,
    IMX219_XCLR_MIN_DELAY_US + IMX219_XCLR_DELAY_RANGE_US);

return 0;

reg_off:
regulator_bulk_disable(IMX219_NUM_SUPPLIES, imx219->supplies);

return ret;
}

static int imx219_power_off(struct device *dev)
{
struct v4l2_subdev *sd =3D dev_get_drvdata(dev);
struct imx219 *imx219 =3D to_imx219(sd);

gpiod_set_value_cansleep(imx219->reset_gpio, 0);
regulator_bulk_disable(IMX219_NUM_SUPPLIES, imx219->supplies);
clk_disable_unprepare(imx219->xclk);

return 0;
}

I really don't understand why this is a problem, it is up to the chip
designer to decide
what to do with reset behavior and not the reviewers.

I'm simply writing the code following the datasheets here.


> Best regards,
> Krzysztof
>

