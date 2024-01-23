Return-Path: <linux-media+bounces-4073-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 09646838B54
	for <lists+linux-media@lfdr.de>; Tue, 23 Jan 2024 11:04:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AEC7628F83E
	for <lists+linux-media@lfdr.de>; Tue, 23 Jan 2024 10:04:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B9045A0FC;
	Tue, 23 Jan 2024 10:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ZIkTKSF+"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 525345A0F2
	for <linux-media@vger.kernel.org>; Tue, 23 Jan 2024 10:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706004255; cv=none; b=gn4cn8+6dUgbbm2r1BW0Ud5+w3qXn0Rzl2BV5xIOT6wsr3LvAsl7As/Y1jHbhwRoym/ZPOOWU31FgbBpd1p6E99gtoOlrVixUWLW1+dKwnmHb0+BcaSixWrw6zxfZXNgNt8kC/0zU75E02KCnBhobWxgph1T8jW8qjcWo9IDM8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706004255; c=relaxed/simple;
	bh=XL1sqkPQzrwVgrEuALb3xIQe7vQpsCo0MNoE9dlIcyc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Eo206XOe5MW9vkUEEqznrpJKjstTUAcUlaCKnu7A8np0M7+cNc03PJUe+CLlZ8SdGaiy5EogVHa4g9Vz9qRd2iA/PA0BU4nXL20Ld/FSNam2I8zxcVyEG6ucOdlMn+tIxnebNFc5W1azKMs6DC3q6CnMnS2Y6xT3ed+BL1ucgSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ZIkTKSF+; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-55a9008c185so4593615a12.1
        for <linux-media@vger.kernel.org>; Tue, 23 Jan 2024 02:04:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1706004250; x=1706609050; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZLigYYxsw835JJoxLyi++OTEZrod/0zcxvVDN5Dspc4=;
        b=ZIkTKSF+sqNbReZJYJ1xW0vEmDrhFxCkIreY9urVNNngfKdWHIxDd3sbgpZVoKjXCM
         iMsIzSmZo4fHbJjaO8GWRyNgVNCgMj26fysaR/J500hsq8vTauGB/9m8DCiIhrwj0Wdb
         QVKLKDgWq/ptTmApeHdEftx61I5fUOBoh/1ME=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706004250; x=1706609050;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZLigYYxsw835JJoxLyi++OTEZrod/0zcxvVDN5Dspc4=;
        b=owqUR+MG8yDpBBIsZr4c9pcZm1rfRyLyic0B+omvUaQ9pODtvg6Wxc5NY4ICKgB2tO
         wtgZk4kRsB2Wt44vQcRf5UMLJX/WFGVheSUzIhR9eKRye+glYO3pBMEgXyhcxqyHL977
         7EK3bIRiV5pUsZtxxJaA+qY4PjN0Debmqd1/eEbIh9oApRVYCUcLvFdR4hDRvB5Yx37H
         fNUeLm3i6Tn8N9GaKfdfwm7frMxsFXDWX4n0pcR/+F9zcbDVoxfn6OQ54vPMTRqlSJq1
         R/oHT8aLTXP4CEHVXhNeCUIb00suvzWfUwBUKqMmzhetUAddfE+s79ACi995KKofMkYd
         96ew==
X-Gm-Message-State: AOJu0Yyg8JL2x0DKVXHMdLthQkey57XvUiPuT/4NRLL8Hp8WbG8+U3AF
	6OY7Y3iGngpjiVO5VOTxazWy+0pAowgO8twphPh99PvrOvseYTG/XymkeoO3qQj/iSirfhtQyub
	vsk/o
X-Google-Smtp-Source: AGHT+IGUSmdhJ0ul1xs5cvyf04tx1ds3cwDKZMA3J7RmaIB6XHPZdU1X1d9aNlbhnLPdxmAVqO02Aw==
X-Received: by 2002:a05:6402:54d:b0:55a:8431:ba7c with SMTP id i13-20020a056402054d00b0055a8431ba7cmr1423108edx.37.1706004250537;
        Tue, 23 Jan 2024 02:04:10 -0800 (PST)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com. [209.85.221.48])
        by smtp.gmail.com with ESMTPSA id u3-20020aa7d543000000b00558bd6df5ffsm14490481edr.33.2024.01.23.02.04.09
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jan 2024 02:04:09 -0800 (PST)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-336c5b5c163so2477404f8f.1
        for <linux-media@vger.kernel.org>; Tue, 23 Jan 2024 02:04:09 -0800 (PST)
X-Received: by 2002:a5d:5f53:0:b0:337:caa9:4a16 with SMTP id
 cm19-20020a5d5f53000000b00337caa94a16mr2861888wrb.45.1706004249268; Tue, 23
 Jan 2024 02:04:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240123093648.285711-1-jason.z.chen@intel.com>
In-Reply-To: <20240123093648.285711-1-jason.z.chen@intel.com>
From: Tomasz Figa <tfiga@chromium.org>
Date: Tue, 23 Jan 2024 19:03:49 +0900
X-Gmail-Original-Message-ID: <CAAFQd5D6y8nKg8axJxZj+yhMD8ZNC=q6w_e2=7qcQo1HFWSFTw@mail.gmail.com>
Message-ID: <CAAFQd5D6y8nKg8axJxZj+yhMD8ZNC=q6w_e2=7qcQo1HFWSFTw@mail.gmail.com>
Subject: Re: [PATCH v3] media: ov08x40: Reduce start streaming time
To: "Chen, Jason Z" <jason.z.chen@intel.com>
Cc: sakari.ailus@linux.intel.com, bingbu.cao@linux.intel.com, 
	linux-media@vger.kernel.org, andy.yeh@intel.com, qingwu.zhang@intel.com, 
	senozhatsky@chromium.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 23, 2024 at 6:37=E2=80=AFPM Chen, Jason Z <jason.z.chen@intel.c=
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
>  drivers/media/i2c/ov08x40.c | 1207 ++---------------------------------
>  1 file changed, 55 insertions(+), 1152 deletions(-)
>
> diff --git a/drivers/media/i2c/ov08x40.c b/drivers/media/i2c/ov08x40.c
> index ddcb4b6848b..7b09f405fc5 100644
> --- a/drivers/media/i2c/ov08x40.c
> +++ b/drivers/media/i2c/ov08x40.c
[snip]
> +static int ov08x40_burst_fill_regs(struct ov08x40 *ov08x, u16 first_reg,
> +                                  u16 last_reg,  u8 val)
> +{
> +       struct i2c_client *client =3D v4l2_get_subdevdata(&ov08x->sd);
> +       struct i2c_msg msgs;
> +       __be16 reg_addr_be =3D cpu_to_be16(first_reg);
> +       size_t i, num_regs;
> +       int ret;
> +
> +       num_regs =3D last_reg - first_reg + 1;
> +       msgs.addr =3D client->addr;
> +       msgs.flags =3D 0;
> +       msgs.len =3D 2 + num_regs;
> +       msgs.buf =3D kmalloc(msgs.len, GFP_KERNEL);
> +       if (!msgs.buf)
> +               return -ENOMEM;
> +
> +       /* Set the register address to the first two bytes of the buffer =
*/
> +       memcpy(msgs.buf, &reg_addr_be, 2);

nit: Wouldn't the code be much simpler to follow if rewritten as below?

msgs.buf[0] =3D first_reg >> 8;
msgs.buf[1] =3D first_reg & 0xff;

> +       for (i =3D 0; i < num_regs; ++i)
> +               msgs.buf[2 + i] =3D val;
> +
> +       ret =3D i2c_transfer(client->adapter, &msgs, 1);
> +
> +       kfree(msgs.buf);
> +
> +       if (ret !=3D 1) {
> +               dev_err(&client->dev, "Failed %d regs transferred: %d\n",=
 ret);
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
> @@ -2936,6 +1826,19 @@ static int ov08x40_start_streaming(struct ov08x40 =
*ov08x)
>                 return ret;
>         }
>
> +       /* Use i2c burst to write register on full size registers */
> +       if (ov08x->cur_mode->exposure_shift =3D=3D 1) {
> +               ret =3D ov08x40_burst_fill_regs(ov08x, OV08X40_REG_XTALK_=
FIRST_A,
> +                                             OV08X40_REG_XTALK_LAST_A, 0=
x75);
> +               ret =3D ov08x40_burst_fill_regs(ov08x, OV08X40_REG_XTALK_=
FIRST_B,
> +                                             OV08X40_REG_XTALK_LAST_B, 0=
x75);
> +       }

Hmm, if we only need to set these if exposure_shift is 1, don't we
need to somehow "unset" them if the mode exposure_shift !=3D 1?

Best regards,
Tomasz

