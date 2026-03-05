Return-Path: <linux-media+bounces-54657-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YDo5LI6ZqWm7AgEAu9opvQ
	(envelope-from <linux-media+bounces-54657-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 05 Mar 2026 15:56:14 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F325213EF1
	for <lists+linux-media@lfdr.de>; Thu, 05 Mar 2026 15:56:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4BA2C30D8DFA
	for <lists+linux-media@lfdr.de>; Thu,  5 Mar 2026 14:46:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1E9C3A9D9E;
	Thu,  5 Mar 2026 14:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="RLSMrgIm"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C534B3A9001
	for <linux-media@vger.kernel.org>; Thu,  5 Mar 2026 14:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772721886; cv=pass; b=ryiaBZFdo61HqhbuSmO9A211q/45m/Erv9WE4wyouVKYhlN6AyztOYl3+zbiWITfz/X0I7GlPm3fk3OQFCr3yGrlOGlVM+xdxSO/vAeZRUpKv7UGg+Fm546Awj86aQWrgihOQWatnzJzGNlqMKpCz6jF9IK//nfgdCa5/YKDh10=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772721886; c=relaxed/simple;
	bh=g6ya5pJN690f9IaGgwwqMZDnMn5Y8Ban3wg9bNO+2kc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Tlj1Nrgolk5hEajQFWXj+k5XIlWcBJrp8UNLv4+HY2CkhZ2iQET+qCQmYSvYgjwJVsCmjKyrbAo33OkV1waGEwX0cYr5QjI02Ke6+5y4gu+6G7lF7WFZMHIz3ueA+O+bApV1HXREIoF7jPBy7yxsrz7FZhDCd57jcaOqmVsYI14=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=RLSMrgIm; arc=pass smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-7986c7b8076so87870917b3.2
        for <linux-media@vger.kernel.org>; Thu, 05 Mar 2026 06:44:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772721884; cv=none;
        d=google.com; s=arc-20240605;
        b=T3DobyQwuTJqYoSjX75e7HyrOR/stWs5fB8kxcijTZuohsVUxefXh9nwsrsuUmvwO5
         wof3MNk7Z1jqQpAhmctgC6511bBobujYm1TDj9FZ8fesGR2edMSLpiTi2edZy+Zvyh21
         De+LxbiLzPbvZu7RLI0jhrEPAlTW3daMhuubTmwcJf3OLYZusX5I/+ygUj+zrHdAeLps
         kwaHa5k7zR+fpgmcqlT+tjZe4l594ua10YDUrKgR92WQbnxUqZipCJlA/ZnzmGWjKhv3
         RyG8KiaaWQGn8sPU5D3fUlr6c7egfkk7moqLJOrkeAKTcq3KxwJ7nqmrPAN0NmfRwxr/
         SkSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=qoOJ3nRjjTFcouXhrkDU7FsIC4TsYXYceWPTKo9QVBg=;
        fh=Lszm6TcTAXjnqws/6fcFLC2chw/2pYyHo+nGZ4HSCzo=;
        b=avTL9vwCWSDPadlCITjPSmosYMNnQ3uoMJy4GSFU7vlhw94ZTvNxycymCSxOFdUlSV
         zqSImxV+Hs+Wo78gnxLiqdqLBNHsLjDxP7mPB3x1YRMWEs0JXp5jNuqyV2wRkF4BJQMi
         xeW7q90Tq0/7eoWqQtv7nJtXfga3NRRJm81FF3U57YqrLITeUhgdgatDeh6oKQkPRZ8K
         sYJlYv5vRsIjOvT/M+RWEBFyOiS12wr6uDqaDtKMg1XPRUkKJczqwfUN0w5PHyQBBIoX
         rBOoh64emziP+xD9jCunVkDSiG2SHctEyINjHC0N7bZmRWfBuuc9TKsjUYsxCd/DVpqz
         1vEA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1772721884; x=1773326684; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qoOJ3nRjjTFcouXhrkDU7FsIC4TsYXYceWPTKo9QVBg=;
        b=RLSMrgIm1erxCmQg6DmEOMoJJvOmPAxBf0KdgdRtKHmy2xIP/fJXXzJMt96V2jFVQe
         yn6lO3hVh20vIt2xOyDg/m8H2oOlxX2vggyHWNwUj2widsiDi6ROEr2Df8BVYSLPVFfm
         aV30wWFjIbZ1/s/Z3DULdQnRV8q8RNn8TWN5cq7TUbv4MskZgd+YazQ/EvxrGC9pR4xJ
         bRxhGVuNTZdi+2nz/Bk/K0/hp3y7NcTFRxZxJOEdXwOjHiAqXJ0wbmq6yLut6qrOIrpS
         uolpc42I4OZ8ME3UMaQ0y5KlJVZcoZ5oTdPSWP0bPt4XLbLDWnlB/3bwi2hNcPEbl3ld
         TuAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772721884; x=1773326684;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qoOJ3nRjjTFcouXhrkDU7FsIC4TsYXYceWPTKo9QVBg=;
        b=T9C2MHd80Yc6c98DMF3jIMfQUUer+njfMwuIrFw+AMmgHG6DMxjLwS0aE4DbEX4jXG
         Y4WUkgXIOtbq5W0EIbBNLeYOekfOz1Fzb1hd6G254XRud4ve26zXHsKr590ePG7w0U2b
         c1EA2Y8EI8x/t41SexMZ3itxn6j9hKqNW+NUpbUA8Fj1pJq7jxesG3IdCuzw6tR42Ofx
         NEKiRbqqkj7yUOtTcexbLOY26tj4Ing72XLo2fpzdcsvmIU0+LQCqx0posGKFv/tus6Z
         KWQuWaPWRiDStN7sMqYbN1QIJSgDMw9qpW1B+KSqUI3uTAqPO9CYl9D0DgybGQX0g1N0
         r/Fg==
X-Forwarded-Encrypted: i=1; AJvYcCVdXO8wSP0hhrE4bSg35NgCaHipK6rQrcp7kcUjLfty8rOYnseywZpTXXEmaMMG/pzRATybSMdLNjx/iw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzCKLh3nrhZZ0ey9AyfTHLDp2T54YCkxhSBjTh+05ktuU5haRVy
	+dZcq+foHfEpk17fK1aSzTReXdcMxLjjqBvJsHo0vwU7TTcPuDq3ADzJO6P5jdJyhPUV/8m6aGD
	X0CcoXm9IQD+ub1gkrzb/nbTrN/9mD+hNyhQ3A3krVg==
X-Gm-Gg: ATEYQzyLRNvJ4X0HmytvG0IDD65c5SzhqdXrgnltW4RiObmi2IBLlkOgEXbk9D8REBQ
	JtEp6Gc2Pwx9unTS1QlnatiRqlF9q5AdYknQdD/BHaXUY2aUGeAM8jqzV4x9dgZ5KeSDPp9EJhu
	e3mZyPnLkYc0XzufC0MyHvTTcOZvGQD+D6vsIS0TvlvZhcd59yQlyns7dnBukGlaH/LaqcYxegW
	ATM5zjyGop8SrW/AJn7caK07eZA+WQVZ5IF5zevs4SkFuihNyga7roDZszF26FAA2/k8ibcRIXZ
	gLki/qdU0tfgfr97slheGusYPzeqNuga/n5VVmA=
X-Received: by 2002:a05:690c:6e86:b0:796:34f7:8ea2 with SMTP id
 00721157ae682-798da4cabecmr175537b3.31.1772721883768; Thu, 05 Mar 2026
 06:44:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260305043350.2151936-1-xiaolei.wang@windriver.com> <20260305043350.2151936-4-xiaolei.wang@windriver.com>
In-Reply-To: <20260305043350.2151936-4-xiaolei.wang@windriver.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 5 Mar 2026 14:44:27 +0000
X-Gm-Features: AaiRm50Shc7AZ3k9jl7MseZHGT6Lzan9uZt4AOmRp-X7trpeIGusrSAl9BNmQYs
Message-ID: <CAPY8ntCYy3xMO+inHp_VdXVZiKL6ia6-Lxw4NnF3tBoT7FeDyQ@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] media: i2c: ov9282: switch to {enable,disable}_streams
To: Xiaolei Wang <xiaolei.wang@windriver.com>
Cc: sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com, 
	tarang.raval@siliconsignals.io, jacopo@jmondi.org, mchehab@kernel.org, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, hverkuil+cisco@kernel.org, 
	johannes.goede@oss.qualcomm.com, hverkuil-cisco@xs4all.nl, 
	jai.luthra@ideasonboard.com, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 2F325213EF1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[raspberrypi.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[raspberrypi.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-54657-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_CC(0.00)[linux.intel.com,ideasonboard.com,siliconsignals.io,jmondi.org,kernel.org,bp.renesas.com,oss.qualcomm.com,xs4all.nl,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dave.stevenson@raspberrypi.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[raspberrypi.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[windriver.com:email,raspberrypi.com:dkim,raspberrypi.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,siliconsignals.io:email,mail.gmail.com:mid]
X-Rspamd-Action: no action

On Thu, 5 Mar 2026 at 04:35, Xiaolei Wang <xiaolei.wang@windriver.com> wrote:
>
> Switch from s_stream to enable_streams and disable_streams callbacks.
>
> Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>
> Reviewed-by: Tarang Raval <tarang.raval@siliconsignals.io>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

For the series:
Tested-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/media/i2c/ov9282.c | 79 ++++++++++++--------------------------
>  1 file changed, 25 insertions(+), 54 deletions(-)
>
> diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
> index 98e0a0732ef7..22bea5cd6d14 100644
> --- a/drivers/media/i2c/ov9282.c
> +++ b/drivers/media/i2c/ov9282.c
> @@ -922,13 +922,9 @@ static int ov9282_get_selection(struct v4l2_subdev *sd,
>         return -EINVAL;
>  }
>
> -/**
> - * ov9282_start_streaming() - Start sensor stream
> - * @ov9282: pointer to ov9282 device
> - *
> - * Return: 0 if successful, error code otherwise.
> - */
> -static int ov9282_start_streaming(struct ov9282 *ov9282)
> +static int ov9282_enable_streams(struct v4l2_subdev *sd,
> +                                struct v4l2_subdev_state *state, u32 pad,
> +                                u64 streams_mask)
>  {
>         const struct cci_reg_sequence bitdepth_regs[2][2] = {
>                 {
> @@ -939,16 +935,21 @@ static int ov9282_start_streaming(struct ov9282 *ov9282)
>                         {OV9282_REG_ANA_CORE_2, OV9282_ANA_CORE2_RAW8},
>                 }
>         };
> +       struct ov9282 *ov9282 = to_ov9282(sd);
>         const struct ov9282_reg_list *reg_list;
>         int bitdepth_index;
>         int ret;
>
> +       ret = pm_runtime_resume_and_get(ov9282->dev);
> +       if (ret)
> +               return ret;
> +
>         /* Write common registers */
>         ret = cci_multi_reg_write(ov9282->regmap, common_regs,
>                                   ARRAY_SIZE(common_regs), NULL);
>         if (ret) {
>                 dev_err(ov9282->dev, "fail to write common registers");
> -               return ret;
> +               goto err_pm_put;
>         }
>
>         bitdepth_index = ov9282->code == MEDIA_BUS_FMT_Y10_1X10 ? 0 : 1;
> @@ -956,7 +957,7 @@ static int ov9282_start_streaming(struct ov9282 *ov9282)
>                                   bitdepth_regs[bitdepth_index], 2, NULL);
>         if (ret) {
>                 dev_err(ov9282->dev, "fail to write bitdepth regs");
> -               return ret;
> +               goto err_pm_put;
>         }
>
>         /* Write sensor mode registers */
> @@ -965,14 +966,14 @@ static int ov9282_start_streaming(struct ov9282 *ov9282)
>                                   reg_list->num_of_regs, NULL);
>         if (ret) {
>                 dev_err(ov9282->dev, "fail to write initial registers");
> -               return ret;
> +               goto err_pm_put;
>         }
>
>         /* Setup handler will write actual exposure and gain */
>         ret =  __v4l2_ctrl_handler_setup(ov9282->sd.ctrl_handler);
>         if (ret) {
>                 dev_err(ov9282->dev, "fail to setup handler");
> -               return ret;
> +               goto err_pm_put;
>         }
>
>         /* Start streaming */
> @@ -980,60 +981,28 @@ static int ov9282_start_streaming(struct ov9282 *ov9282)
>                         OV9282_MODE_STREAMING, NULL);
>         if (ret) {
>                 dev_err(ov9282->dev, "fail to start streaming");
> -               return ret;
> +               goto err_pm_put;
>         }
>
>         return 0;
> -}
>
> -/**
> - * ov9282_stop_streaming() - Stop sensor stream
> - * @ov9282: pointer to ov9282 device
> - *
> - * Return: 0 if successful, error code otherwise.
> - */
> -static int ov9282_stop_streaming(struct ov9282 *ov9282)
> -{
> -       return cci_write(ov9282->regmap, OV9282_REG_MODE_SELECT,
> -                        OV9282_MODE_STANDBY, NULL);
> +err_pm_put:
> +       pm_runtime_put(ov9282->dev);
> +
> +       return ret;
>  }
>
> -/**
> - * ov9282_set_stream() - Enable sensor streaming
> - * @sd: pointer to ov9282 subdevice
> - * @enable: set to enable sensor streaming
> - *
> - * Return: 0 if successful, error code otherwise.
> - */
> -static int ov9282_set_stream(struct v4l2_subdev *sd, int enable)
> +static int ov9282_disable_streams(struct v4l2_subdev *sd,
> +                                 struct v4l2_subdev_state *state, u32 pad,
> +                                 u64 streams_mask)
>  {
>         struct ov9282 *ov9282 = to_ov9282(sd);
> -       struct v4l2_subdev_state *state;
>         int ret;
>
> -       state = v4l2_subdev_lock_and_get_active_state(sd);
> -
> -       if (enable) {
> -               ret = pm_runtime_resume_and_get(ov9282->dev);
> -               if (ret)
> -                       goto error_unlock;
> -
> -               ret = ov9282_start_streaming(ov9282);
> -               if (ret)
> -                       goto error_power_off;
> -       } else {
> -               ov9282_stop_streaming(ov9282);
> -               pm_runtime_put(ov9282->dev);
> -       }
> -
> -       v4l2_subdev_unlock_state(state);
> -
> -       return 0;
> +       ret = cci_write(ov9282->regmap, OV9282_REG_MODE_SELECT,
> +                       OV9282_MODE_STANDBY, NULL);
>
> -error_power_off:
>         pm_runtime_put(ov9282->dev);
> -error_unlock:
> -       v4l2_subdev_unlock_state(state);
>
>         return ret;
>  }
> @@ -1165,7 +1134,7 @@ static const struct v4l2_subdev_core_ops ov9282_core_ops = {
>  };
>
>  static const struct v4l2_subdev_video_ops ov9282_video_ops = {
> -       .s_stream = ov9282_set_stream,
> +       .s_stream = v4l2_subdev_s_stream_helper,
>  };
>
>  static const struct v4l2_subdev_pad_ops ov9282_pad_ops = {
> @@ -1174,6 +1143,8 @@ static const struct v4l2_subdev_pad_ops ov9282_pad_ops = {
>         .get_fmt = ov9282_get_pad_format,
>         .set_fmt = ov9282_set_pad_format,
>         .get_selection = ov9282_get_selection,
> +       .enable_streams = ov9282_enable_streams,
> +       .disable_streams = ov9282_disable_streams,
>  };
>
>  static const struct v4l2_subdev_ops ov9282_subdev_ops = {
> --
> 2.43.0
>

