Return-Path: <linux-media+bounces-3981-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id ADCC28364A5
	for <lists+linux-media@lfdr.de>; Mon, 22 Jan 2024 14:45:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3AAB21F259AB
	for <lists+linux-media@lfdr.de>; Mon, 22 Jan 2024 13:45:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 398753D0B5;
	Mon, 22 Jan 2024 13:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="YPyZb6Cq"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3E6B3D0A9
	for <linux-media@vger.kernel.org>; Mon, 22 Jan 2024 13:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705931139; cv=none; b=htVGZMF23WFD2cXyMzBuncjkbgc3szBlaNdAPm02WEO2t/oMR0F5InibfcyJQjhEoGIs08skPS/yucE/uORGsTQBtbs8KzUT7QCPvPUGq6gUOwuixKCqxy2a+nD5iptkYuKZQvuxc1eYt/NCKDPExCsxy7ux/YrpnqmqDYniQlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705931139; c=relaxed/simple;
	bh=i01YyzXRmT/NtyxGPTg5IkoMuFdx2qVQIXQ+ac4fT7g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KLv55oSRAnOWY0Yrnctpf7toXLC7+l4K1zwTSo605L6f0gMve/M65UQu9ry6jJM64qc0lxYBgnI0h+l8uuUf0oLwAI0AdWj6HMIRKY7bcCrpNW21f67EeNDnn0SON3wSmd+LHMaeAjg9IveS3Tnbkflmr+w67yHPpGaqUeDFGuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=YPyZb6Cq; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-55c2c90c67dso1199945a12.1
        for <linux-media@vger.kernel.org>; Mon, 22 Jan 2024 05:45:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1705931135; x=1706535935; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/sFKZ9aKqMbCvkQImFVLZG9GxH3/1gHn/k1Q6xFsCUM=;
        b=YPyZb6CqiA2XXL13UuAw8ClRFoXt2Cxw2fmq+pNCVZqqWEUUA3c+GUzjHEceVZTgRT
         OSnm41gYAJ2bUvhy/C24et/5btIyL2H/AmUlyiPazN1SyBpjYu8BZJHZBDbMcJm7lYfT
         MRkesKxyHmyd+nShjcvCjVIe14nSQSXPuak5Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705931135; x=1706535935;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/sFKZ9aKqMbCvkQImFVLZG9GxH3/1gHn/k1Q6xFsCUM=;
        b=ICkTPd4u3LHRhZWMghYyEFt6Dy31BSCMkz5Yv6DHH4kZSUkIpP+MBMlD+BpU5p6UkV
         uJmmH5z2pVUkVCTSmD1dodTdd4kayW5MurAHh7muBNsA567HBiC7y3g3eZkiyRakG8ka
         7PgNdsULx7hua5qzx+vNe3qIXtL9DryigoQ+BhR2LerF/qbpJmfBXWFhUpcdxjPmwxR4
         K0ue3Bngy1TbSklE1hsJeDVzU2VRkobEQCWpn1TLvrxLS6qtaMaLZCGWrVH8DbI9Q1SE
         PHPc4foqOtRpjipjH699nxaJh6xrn0iIa5IZARE1YTcL0nqtIjoUx9OpBqgjX68gIvMV
         QFyA==
X-Gm-Message-State: AOJu0YwDedbG6+y3SaN4mHQa3XhwWmi67uLPIBpGBzAk1S9jQX2P2GYs
	wZF1KXiLGiGu4f0VOzzof/VdhI0MCck2q6JpBhAeU0VqQCdu+Xe+mSWFyqENQLFuOJK+HVaZQ8c
	C6sZT
X-Google-Smtp-Source: AGHT+IFHQr2Zw+blQ5SEERxiLQHX1/P2wYnr739PYlHpmyxpki2LrPb6qdIWVov6jKdR2ufwxzOdUQ==
X-Received: by 2002:a05:6402:550:b0:55c:5787:9fcf with SMTP id i16-20020a056402055000b0055c57879fcfmr441964edx.56.1705931135086;
        Mon, 22 Jan 2024 05:45:35 -0800 (PST)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com. [209.85.221.50])
        by smtp.gmail.com with ESMTPSA id ev24-20020a056402541800b005581573e251sm14291462edb.2.2024.01.22.05.45.34
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jan 2024 05:45:34 -0800 (PST)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-337cc8e72f5so2937945f8f.1
        for <linux-media@vger.kernel.org>; Mon, 22 Jan 2024 05:45:34 -0800 (PST)
X-Received: by 2002:adf:e8c7:0:b0:337:bc8e:2ae8 with SMTP id
 k7-20020adfe8c7000000b00337bc8e2ae8mr2246401wrn.63.1705931133688; Mon, 22 Jan
 2024 05:45:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240122115105.3482080-1-jason.z.chen@intel.com>
In-Reply-To: <20240122115105.3482080-1-jason.z.chen@intel.com>
From: Tomasz Figa <tfiga@chromium.org>
Date: Mon, 22 Jan 2024 22:45:14 +0900
X-Gmail-Original-Message-ID: <CAAFQd5C1v41VX59Q46equ=btqHV7NPxr_MM56KYJu7Bg2H0hDA@mail.gmail.com>
Message-ID: <CAAFQd5C1v41VX59Q46equ=btqHV7NPxr_MM56KYJu7Bg2H0hDA@mail.gmail.com>
Subject: Re: [PATCH v2] media: ov08x40: Reduce start streaming time
To: "Chen, Jason Z" <jason.z.chen@intel.com>
Cc: sakari.ailus@linux.intel.com, bingbu.cao@linux.intel.com, 
	linux-media@vger.kernel.org, andy.yeh@intel.com, qingwu.zhang@intel.com, 
	Sergey Senozhatsky <senozhatsky@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jason,

On Mon, Jan 22, 2024 at 8:54=E2=80=AFPM Chen, Jason Z <jason.z.chen@intel.c=
om> wrote:
>
> From: Jason Chen <jason.z.chen@intel.com>
>
> Because video duration involves calculating the streaming time, and i2c
> communication incurs too many XTALK register settings every 4 bytes with
> i2c START and STOP.
>
> So we have opted switch to the i2c burst method.
> This method involves writing the XTALK registers in the order of
> the register block.
>
> The start streaming time can be reduced from around 400ms to 150ms
>
> Signed-off-by: Jason Chen <jason.z.chen@intel.com>
> ---
>  drivers/media/i2c/ov08x40.c | 1199 ++---------------------------------
>  1 file changed, 47 insertions(+), 1152 deletions(-)
>

Thanks for the patch! Please see my comments inline.

> diff --git a/drivers/media/i2c/ov08x40.c b/drivers/media/i2c/ov08x40.c
> index ddcb4b6848b..839c87f1a25 100644
> --- a/drivers/media/i2c/ov08x40.c
> +++ b/drivers/media/i2c/ov08x40.c
[snip]
> +static int ov08x40_burst_write_regs(struct ov08x40 *ov08x, u16 reg, u8 v=
al, size_t num_regs)
> +{
> +       struct i2c_client *client =3D v4l2_get_subdevdata(&ov08x->sd);
> +       struct i2c_msg *msgs;
> +       __be16 reg_addr_be =3D cpu_to_be16(reg);
> +       size_t i;
> +       int ret;
> +
> +       msgs =3D kmalloc_array(num_regs, sizeof(struct i2c_msg), GFP_KERN=
EL);

Shouldn't this be num_regs + 1 to also allocate the initial msg for
the register address?

> +       if (!msgs)
> +               return -ENOMEM;
> +
> +       /* Set up the first message for the register address */
> +       msgs[0].addr =3D client->addr;
> +       msgs[0].flags =3D 0;
> +       msgs[0].len =3D 2;
> +       msgs[0].buf =3D (u8 *)&reg_addr_be;
> +
> +       /* Set up the subsequent messages for the data value */
> +       for (i =3D 1; i <=3D num_regs; ++i) {
> +               msgs[i].addr =3D client->addr;
> +               msgs[i].flags =3D 0;
> +               msgs[i].len =3D 1;
> +               msgs[i].buf =3D &val;
> +       }
> +
> +       ret =3D i2c_transfer(client->adapter, msgs, num_regs);

Are we sure this actually works as intended? i2c_transfer() will issue
a repeated start before every subsequent message, but the sensor
datasheet mentions just subsequent bytes without repeated starts for
sequential write (ov08x40 datasheet 2.01 page 2-18 aka 36).

Also, shouldn't the last argument be num_regs + 1?

> +
> +       kfree(msgs);
> +
> +       if (ret !=3D num_regs) {
> +               dev_err(&client->dev, "Only %d out of %zu msgs have trans=
ferred successfully\n",
> +                       ret, num_regs);
> +               return -EIO;
> +       }
> +
> +       dev_dbg(&client->dev, "I2C burst transfer succeeded\n");
> +
> +       return 0;
> +}
> +
>  /* Write registers up to 4 at a time */
>  static int ov08x40_write_reg(struct ov08x40 *ov08x,
>                              u16 reg, u32 len, u32 __val)
> @@ -2936,6 +1825,12 @@ static int ov08x40_start_streaming(struct ov08x40 =
*ov08x)
>                 return ret;
>         }
>
> +       /* Use i2c burst to write register on full size registers */
> +       if (ov08x->cur_mode->exposure_shift =3D=3D 1) {
> +               ov08x40_burst_write_regs(ov08x, 0x5a80, 0x75, 0x5b9f - 0x=
5a80 + 1);
> +               ov08x40_burst_write_regs(ov08x, 0x5bc0, 0x75, 0x5f1f - 0x=
5bc0 + 1);

Please define these magic numbers as macros.

Also, would it make sense to make this function prototype something like:

ov0x840_burst_fill_regs(..., first reg, last reg, val)

so we don't have to do the length calculation by hand in every call?
(and the function effectively fills the registers, not writes with
their own values, so the name is more appropriate too)

Also, please add error handling.

Best regards,
Tomasz

