Return-Path: <linux-media+bounces-48982-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B09BCC774A
	for <lists+linux-media@lfdr.de>; Wed, 17 Dec 2025 12:58:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9D436305995B
	for <lists+linux-media@lfdr.de>; Wed, 17 Dec 2025 11:54:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E563F327BE6;
	Wed, 17 Dec 2025 11:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="Ob+xZdqa"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C9862D9EEF
	for <linux-media@vger.kernel.org>; Wed, 17 Dec 2025 11:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765972497; cv=none; b=L7i3mDCFsK0JLoE/XlpXtR0yq1ylxElAZDiUm9B0nGoP1iUtH8ZeSt9BQKSsMH3wUGpxB357tBDq6gvWAs0Rptk0wtIssUu30edkQXDoHsHmbfBC3oAgYPR5Fv+dnvfwlcEgW3zJolGb2KAZYrcreDi00nAPDOI6k/yY+mOuI5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765972497; c=relaxed/simple;
	bh=70F01enocztNAr3xVFOrgGWn+2IKyhD+BDtjzDjx4nY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eDxWL7GH2ZUCA3b2IyG0QxU84X5qtecyuwu/27FTL9WYy3TH1tFOBeR8RYqTTgjBkP0wI31ZUKM0EmlvU/NJcNkHjI2LyoQZvmI3GQpvkDlJW9+OeNgm0yjX3ZP4NSXiFbUJeMJ9Xzr288aSz5hT44yV/uKyftOk2GkQMoUh5qU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=Ob+xZdqa; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-78ac9f30833so49357707b3.0
        for <linux-media@vger.kernel.org>; Wed, 17 Dec 2025 03:54:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1765972494; x=1766577294; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=W3dwWg2D+m7WGcXWn772LPt2UQYpGANryW0nj84dguM=;
        b=Ob+xZdqapCD8YHYlr9dKwAPBUkcKvui13tbk0dJJGRcxJaw+3TCqgzxCsNfDKHM49z
         EYUsmKjjHCr8kXHOhaUp5SRQ0pIwScew80hXCC/qHFte3kjh/aNa37wllVGwGtna5H86
         kfiw3WMBANdXKxSuvON19ZeWOd/FQ/TN/szaUg3qS0TTVanBJIn2bduRFARfRQARomPK
         FgRgBFaowUCOp7nV5Ssa4Rnl2CWUMdma/xauBvhWqBqio2XnAgwZKwAZuECxmxdIH6cO
         qzCmZuoCOiZq0k3SEpjE5ygtkCrX6m2Cq0D3l9clcbJU18Ju96GpEplCb2/7fsrK+PeO
         zptQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765972494; x=1766577294;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W3dwWg2D+m7WGcXWn772LPt2UQYpGANryW0nj84dguM=;
        b=bDbw+xr2nVS2tdktpoTQJZau2qfAHvEdEw32pU0EGO4w75uVpxrE8OJHSP3sr63UC8
         /5BP1LmeEr0448jgSTLgzNy8/Lu1+n7EeJzT3SQRNX4rnvy/iycrHyV5O70JngZsh1Lw
         RboYzsWggojmLN4XNMnSN0m9JpSxaFO+oGtOwkGNBxzytkK3fNzPU5874RIx5NREKkNX
         1N8FTS5NOwrEGC9TdQaAy81SIop6agJslZc7DyIArqjqdXWBnZ0/sy44IOwnp2ruQczX
         JAfysExVxTID14dePrNTOwRdYVW/6NENdieMYlO8H32aDhvOiaY1VG//4H2bjVR0NuKM
         I9wA==
X-Forwarded-Encrypted: i=1; AJvYcCWcUARnxIa1ePP9tF8HNgmXp/+TFwjDAvaXPQZFhwJD10srXCOeOaYJXuZDq5LP7MwZSB7veeF4+caWAw==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywm0j9KK6czq2lkObqOWADKR581U5E0M4BTzNAcXRbr9W9rzPuA
	S0Lo60i9ao/Dky99M/zK19wILvT0hsyK6rf/W3owkqvMezdNCxovk5jKToVqZxH+6XGSNi3PbTL
	O/xoGFFzAtQOSnY6faLxoR/hVdEysLYD6iNMOwLuDgA==
X-Gm-Gg: AY/fxX4vHteBb5Q4kKSUEKliK4MHQC5Mn90VvwEYBtjcNCq9Wtp/ZYk4aBFA6h/QWhX
	YLKY11E89Jeqs0MuGjLuL6AG39v6XYjDKlnBG6SWJgCz1XqDgayB8tecg27wrifm+GGzMs6e7mC
	ZCvfAFJg9yS5wIeCXUp7UNLe+lZddAXsJ7BF3F6U1UcO0se10WWtvO4ZaLFei26Kj4ahRQCI90P
	w9mX/RUWR7jQvMM9/7gkFVIfriCTif945zTUvuoIwTtQp2febapHja5b9NxWpI4I4xZwus/QkyJ
	bNqtx1o76FeTLYgjxRw1L/Fgjno=
X-Google-Smtp-Source: AGHT+IGckuHShVbvxc6ufAHIWbsIO8u+LmaiNiqNwEMgNBziJtkEBwHWsEgys1TxSWooCVKNgi5iOcDUjluVG6gxmfs=
X-Received: by 2002:a05:690c:e3ee:b0:78f:916e:b583 with SMTP id
 00721157ae682-78f916ebbb7mr29455967b3.37.1765972494619; Wed, 17 Dec 2025
 03:54:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251217-imx283-ext-v1-0-906a762f592d@emfend.at> <20251217-imx283-ext-v1-3-906a762f592d@emfend.at>
In-Reply-To: <20251217-imx283-ext-v1-3-906a762f592d@emfend.at>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 17 Dec 2025 11:54:38 +0000
X-Gm-Features: AQt7F2rWc2bY9eE8ucf14QiONAUNLJF3tcPeIUUR4B-rKXrFZUPkuBh_s7N1C0E
Message-ID: <CAPY8ntCiOJb9iyFDYS_wxhteoHL7vMFpEF8gVwrf2qeFd-Fssw@mail.gmail.com>
Subject: Re: [PATCH 3/3] media: i2c: imx283: implement {g,s}_register
To: Matthias Fend <matthias.fend@emfend.at>
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>, Umang Jain <uajain@igalia.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Matthias

On Wed, 17 Dec 2025 at 07:41, Matthias Fend <matthias.fend@emfend.at> wrote:
>
> Implement {g,s}_register to support advanced V4L2 debug functionality.

Is there any real benefit to providing access via {g,s}_register
rather than using i2ctransfer -f ? The I2C framework ensures that each
transfer is atomic as long as it is formed into one transaction
request.

IMHO The only place these are really needed is with devices such as
the adv7180 family which have a bank and page addressing scheme, and
the driver is caching the last accessed bank.

> Signed-off-by: Matthias Fend <matthias.fend@emfend.at>
> ---
>  drivers/media/i2c/imx283.c | 44 ++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 44 insertions(+)
>
> diff --git a/drivers/media/i2c/imx283.c b/drivers/media/i2c/imx283.c
> index 7a6ab2941ea985401b21d60163b58e980cf31ddc..d8ccde0a1587259f39a10984c517cc57d323b6bc 100644
> --- a/drivers/media/i2c/imx283.c
> +++ b/drivers/media/i2c/imx283.c
> @@ -1295,7 +1295,51 @@ static const struct v4l2_subdev_internal_ops imx283_internal_ops = {
>         .init_state = imx283_init_state,
>  };
>
> +#ifdef CONFIG_VIDEO_ADV_DEBUG
> +static int imx283_g_register(struct v4l2_subdev *sd,
> +                            struct v4l2_dbg_register *reg)
> +{
> +       struct imx283 *imx283 = to_imx283(sd);
> +       u64 val;
> +       int ret;
> +
> +       if (!pm_runtime_get_if_active(imx283->dev))
> +               return 0;

Returning no error if the device is powered down feels wrong. How is
the caller meant to differentiate between powered down and the
register actually containing 0?

> +
> +       ret = cci_read(imx283->cci, CCI_REG8(reg->reg), &val, NULL);
> +       reg->val = val;
> +
> +       pm_runtime_put(imx283->dev);
> +
> +       return ret;
> +}
> +
> +static int imx283_s_register(struct v4l2_subdev *sd,
> +                            const struct v4l2_dbg_register *reg)
> +{
> +       struct imx283 *imx283 = to_imx283(sd);
> +       int ret;
> +
> +       if (!pm_runtime_get_if_active(imx283->dev))
> +               return 0;

Ditto here. The caller is told the value was written, but it wasn't.

Thanks.
  Dave

> +
> +       ret = cci_write(imx283->cci, CCI_REG8(reg->reg), reg->val, NULL);
> +
> +       pm_runtime_put(imx283->dev);
> +
> +       return ret;
> +}
> +#endif
> +
> +static const struct v4l2_subdev_core_ops imx283_core_ops = {
> +#ifdef CONFIG_VIDEO_ADV_DEBUG
> +       .g_register = imx283_g_register,
> +       .s_register = imx283_s_register,
> +#endif
> +};
> +
>  static const struct v4l2_subdev_ops imx283_subdev_ops = {
> +       .core = &imx283_core_ops,
>         .video = &imx283_video_ops,
>         .pad = &imx283_pad_ops,
>  };
>
> --
> 2.34.1
>
>

