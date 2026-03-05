Return-Path: <linux-media+bounces-54656-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WGlwAOCYqWm7AgEAu9opvQ
	(envelope-from <linux-media+bounces-54656-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 05 Mar 2026 15:53:20 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 95D9B213E45
	for <lists+linux-media@lfdr.de>; Thu, 05 Mar 2026 15:53:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 064D83080E2E
	for <lists+linux-media@lfdr.de>; Thu,  5 Mar 2026 14:46:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 648133A9638;
	Thu,  5 Mar 2026 14:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="dn4rpkPW"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE1443A9002
	for <linux-media@vger.kernel.org>; Thu,  5 Mar 2026 14:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772721862; cv=pass; b=oolul7JsZO3lE2mbBnC6T8XTJ/HawVSA3gsLmgOIcPzzy1Rj4SLm2dF26QrYkMwpCksiwnzSiR3WKJqn0HusOrIJ2vwVlDeVmD59B8sDo8B0SXkD62CjB8VzQ25kwlduFg/FDxnEpj9tqqtf3y2gw3+fxV1NPX7E9wAf7oH9rqw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772721862; c=relaxed/simple;
	bh=w3e9sSN7rbZ1yIbcBjQIknwdSJkIxtra65Y+IoaRfB0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hLRGcKUvT/+p1w1f8ViU/wm9QNRTI031I+u8/FUJemYG8BUxq3lKnNSabAe6X5NYp9D2Wjg7bpmd7Oht/ApjvEV0EG2WEVVd2o+LdGniHsYJH3hQfBuCHcco/mJzPBNrNdc3KDZXD6HWTbBGLeotqYlADVciJ6Ym9mx6agR2BRc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=dn4rpkPW; arc=pass smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-7982c3b7dfcso81724827b3.0
        for <linux-media@vger.kernel.org>; Thu, 05 Mar 2026 06:44:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772721859; cv=none;
        d=google.com; s=arc-20240605;
        b=DPGlJfCDqfwBHszP8f9yCLbedZ2ASZiDBdplZWoRERUIH8DBMmjZAJay/4mA8a6HtF
         PWiz67RcCjQAighWRmDs2Wa/kAzvIAVvwtN3ikOCgXMRai7q40vuZSDEAdAxhl5EMrbb
         FkRrZyTqAy2lYiDJS4f3lzKBech5QeMT2fTS7w2K9LVXw4pwgCwiKdGEP+YqGFcGL8Yr
         Nno7u/U8i6/JtMInFZYjUrkHNW1qePN3Nhu5df3wpX4uvKCuM9RQ0C6xKLhAZsnqqTKp
         74IrKgh5U2hmQLXkusNtKkNugh26q3JESjpN9HdL2CSm2LmQJX475lCHEYPk2ZedsOL+
         vIeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=JEmLX9VgRahW+qJozlLIhZVQxpz/LOxrneMfdOojc0A=;
        fh=/ejuO3qZcY2n+yPKzQtqSp4qkbYKvY/8MlLcvc/47X0=;
        b=annLJVqCPLg2yZ8gldGKx2D1BCKfu7HpmZUMC9/PfLj6Mag4HJYvhYT8WDcIdjh15d
         5PY6MV6vpH9pdfFQI6sbraoIBP4rrlyZwERVF1K4oGoFnerUEdI+bDblQQKsd0M+MNyC
         5Je9xkkRjyL8nZEoZkoQrxYJ74/VD7I3veT0Nu5EuEN4sv3UqKPHB9HHFKTTockEfcux
         QTQ6z3jPlPS+7JUP+LvfUzCnJbBrDyftq4MigX6bXCyLW3IMNTXIXypCrrU2L6SpnGV9
         5jGOaugjpT24xJk7iC3UhUWkGrOcaH9u814nZmc5K54sqM+Ne7RUyvpP0xRbD+1LQgGq
         qDUg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1772721859; x=1773326659; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JEmLX9VgRahW+qJozlLIhZVQxpz/LOxrneMfdOojc0A=;
        b=dn4rpkPW1stSKt4X9TiTS+Ny8+egiB/OYj3CvHHz767fieddSHd5e904HbnLpKnfXE
         FWNyQ6b2aoOc4zEAedHhzDIuY1eZJmji+vORc4nRuSvrJBquJazEnTsFgb7yoayHcc1/
         sn4Dj3CawRDDF4sfdasz6ox4l5BpjenyOcJW4zK9QRHSj0cXYPmQvtOdO8KSNRuKhWl/
         ICwMny/b2yz/7tw8dGBBwaE9a9FQ4h0hOd2TwrtMF0IDOioyrT2eBoaexP5BZP1a7qQV
         MA61AEpaiA0hUn+BgBSuInavaVKC8NKv+BTygayNrM63DvlywBFyS5jxDX+p1seZp4vC
         ov4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772721859; x=1773326659;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JEmLX9VgRahW+qJozlLIhZVQxpz/LOxrneMfdOojc0A=;
        b=Bg9nA8NvAqoWH5bjbdzu+jkrQtSf2NQAra54wPP+UfBSz+G8SJs1hVXtGGpEYv8uRM
         VxHnab9V0/ZCKyI+KfiDy4Xdr3wOvfinM2yX3Ck8GEaiquew3XzaJwyVzy7EmqvNmtAL
         lZEaFvlyDYkDKGF+HH79Y4rMuSyXUjdsGU8a4sPXYjngPoJIOpzjwDjEueNPbP8jxSH9
         WlzlKwaYl88U4yLqqe+Z7L3+dE+kYh98yjpHZB9IQRoWHJ9EnvhAPNRnzKF4KeyRhtr0
         FCRCryBs9HXCmODp+7xGgKjAQi/WO0tw2AxnR8bnzL6RCR4OE7C4S9SlnPWfskwGKtIF
         FwUg==
X-Forwarded-Encrypted: i=1; AJvYcCX8DJWzRnn4i201LOXJi8MX547lVYbhxRs48OwCGumhVJuhhjWXSGSP47+VwVOnRF40e3qX3fZGeDXmfA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5KbL3Y82pineuOkSjCepRydfMIk1NYLBvyFtifbdUAYSM91D4
	RgVdYaQaOc/2/nQCQtjXMcptH3OT7ICoF2mKN9X0KehhxV/HvH8kF8liEIuo2HpXqbeUlh0B5aS
	JG5mbrPqoBR9Ts3fjKy5REW2Ow3WIT5C9rn5xHK7m7A==
X-Gm-Gg: ATEYQzyw085lp7Q61ukzrP2TBy/Dy6BqQmMq0Wp9emP46gD/vzfbot4KzmURW6cytyW
	HAIGWelb3ynirrhAIrONIy/gMk79YwNuHQ8qZLFd0Eu+n/TNG9utgU/0ed5tHPFfyNyagzZTeA9
	O8EzSG6IvXb8yfh3QZGF+f2DjQFOtfNVNCjEsSrUArNCi02TxR8X/fRvN/OL1NtPPZ6Dg8SBqNG
	4N12x62ZPgHgF/aogUgDNp+znFrMg6ENX8tUA4C7kzFz9SBhL/v951EKANcMhapOyt79k+g+/fU
	VasDrwX+swPEpXzDWssYvBDxM0T6ZqoMD9kPyvM=
X-Received: by 2002:a05:690c:d94:b0:798:7821:8b8c with SMTP id
 00721157ae682-798c6d000a7mr49050637b3.49.1772721858797; Thu, 05 Mar 2026
 06:44:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260305043350.2151936-1-xiaolei.wang@windriver.com> <20260305043350.2151936-3-xiaolei.wang@windriver.com>
In-Reply-To: <20260305043350.2151936-3-xiaolei.wang@windriver.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 5 Mar 2026 14:44:01 +0000
X-Gm-Features: AaiRm51Gr2K46tADYos1K31cmL4v0qX7Lzr8_PeXYTjt5qYO2xwCWwpr854Y-mI
Message-ID: <CAPY8ntAL05qyHi7FkkVUrcZUSUOEaGZwVmyEBhFufknufgiF=w@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] media: i2c: ov9282: Switch to using the sub-device
 state lock
To: Xiaolei Wang <xiaolei.wang@windriver.com>
Cc: sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com, 
	tarang.raval@siliconsignals.io, jacopo@jmondi.org, mchehab@kernel.org, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, hverkuil+cisco@kernel.org, 
	johannes.goede@oss.qualcomm.com, hverkuil-cisco@xs4all.nl, 
	jai.luthra@ideasonboard.com, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 95D9B213E45
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[raspberrypi.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[raspberrypi.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-54656-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,siliconsignals.io:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,windriver.com:email,raspberrypi.com:dkim,raspberrypi.com:email]
X-Rspamd-Action: no action

On Thu, 5 Mar 2026 at 04:35, Xiaolei Wang <xiaolei.wang@windriver.com> wrote:
>
> Switch to using the sub-device state lock and properly call
> v4l2_subdev_init_finalize() / v4l2_subdev_cleanup() on probe() /
> remove().
>
> Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>
> Reviewed-by: Tarang Raval <tarang.raval@siliconsignals.io>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/media/i2c/ov9282.c | 51 +++++++++++++++-----------------------
>  1 file changed, 20 insertions(+), 31 deletions(-)
>
> diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
> index 56f854a4d04f..98e0a0732ef7 100644
> --- a/drivers/media/i2c/ov9282.c
> +++ b/drivers/media/i2c/ov9282.c
> @@ -221,7 +221,6 @@ struct ov9282 {
>         bool noncontinuous_clock;
>         const struct ov9282_mode *cur_mode;
>         u32 code;
> -       struct mutex mutex;
>  };
>
>  static const s64 link_freq[] = {
> @@ -795,8 +794,6 @@ static int ov9282_get_pad_format(struct v4l2_subdev *sd,
>  {
>         struct ov9282 *ov9282 = to_ov9282(sd);
>
> -       mutex_lock(&ov9282->mutex);
> -
>         if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
>                 struct v4l2_mbus_framefmt *framefmt;
>
> @@ -807,8 +804,6 @@ static int ov9282_get_pad_format(struct v4l2_subdev *sd,
>                                        fmt);
>         }
>
> -       mutex_unlock(&ov9282->mutex);
> -
>         return 0;
>  }
>
> @@ -829,8 +824,6 @@ static int ov9282_set_pad_format(struct v4l2_subdev *sd,
>         u32 code;
>         int ret = 0;
>
> -       mutex_lock(&ov9282->mutex);
> -
>         mode = v4l2_find_nearest_size(supported_modes,
>                                       ARRAY_SIZE(supported_modes),
>                                       width, height,
> @@ -856,8 +849,6 @@ static int ov9282_set_pad_format(struct v4l2_subdev *sd,
>                 }
>         }
>
> -       mutex_unlock(&ov9282->mutex);
> -
>         return ret;
>  }
>
> @@ -904,10 +895,8 @@ static int ov9282_get_selection(struct v4l2_subdev *sd,
>         case V4L2_SEL_TGT_CROP: {
>                 struct ov9282 *ov9282 = to_ov9282(sd);
>
> -               mutex_lock(&ov9282->mutex);
>                 sel->r = *__ov9282_get_pad_crop(ov9282, sd_state, sel->pad,
>                                                 sel->which);
> -               mutex_unlock(&ov9282->mutex);
>
>                 return 0;
>         }
> @@ -1019,9 +1008,10 @@ static int ov9282_stop_streaming(struct ov9282 *ov9282)
>  static int ov9282_set_stream(struct v4l2_subdev *sd, int enable)
>  {
>         struct ov9282 *ov9282 = to_ov9282(sd);
> +       struct v4l2_subdev_state *state;
>         int ret;
>
> -       mutex_lock(&ov9282->mutex);
> +       state = v4l2_subdev_lock_and_get_active_state(sd);
>
>         if (enable) {
>                 ret = pm_runtime_resume_and_get(ov9282->dev);
> @@ -1036,14 +1026,14 @@ static int ov9282_set_stream(struct v4l2_subdev *sd, int enable)
>                 pm_runtime_put(ov9282->dev);
>         }
>
> -       mutex_unlock(&ov9282->mutex);
> +       v4l2_subdev_unlock_state(state);
>
>         return 0;
>
>  error_power_off:
>         pm_runtime_put(ov9282->dev);
>  error_unlock:
> -       mutex_unlock(&ov9282->mutex);
> +       v4l2_subdev_unlock_state(state);
>
>         return ret;
>  }
> @@ -1285,9 +1275,6 @@ static int ov9282_init_controls(struct ov9282 *ov9282)
>         if (ret)
>                 return ret;
>
> -       /* Serialize controls with sensor device */
> -       ctrl_hdlr->lock = &ov9282->mutex;
> -
>         /* Initialize exposure and gain */
>         lpfr = mode->vblank + mode->height;
>         ov9282->exp_ctrl = v4l2_ctrl_new_std(ctrl_hdlr,
> @@ -1409,13 +1396,10 @@ static int ov9282_probe(struct i2c_client *client)
>                 return dev_err_probe(ov9282->dev, PTR_ERR(ov9282->regmap),
>                                      "Failed to init CCI\n");
>
> -       mutex_init(&ov9282->mutex);
> -
>         ret = ov9282_power_on(ov9282->dev);
> -       if (ret) {
> -               dev_err(ov9282->dev, "failed to power-on the sensor");
> -               goto error_mutex_destroy;
> -       }
> +       if (ret)
> +               return dev_err_probe(ov9282->dev, ret,
> +                                    "failed to power-on the sensor");
>
>         /* Check module identity */
>         ret = ov9282_detect(ov9282);
> @@ -1448,27 +1432,34 @@ static int ov9282_probe(struct i2c_client *client)
>                 goto error_handler_free;
>         }
>
> -       ret = v4l2_async_register_subdev_sensor(&ov9282->sd);
> +       ov9282->sd.state_lock = ov9282->ctrl_handler.lock;
> +       ret = v4l2_subdev_init_finalize(&ov9282->sd);
>         if (ret < 0) {
> -               dev_err(ov9282->dev,
> -                       "failed to register async subdev: %d", ret);
> +               dev_err_probe(ov9282->dev, ret, "failed to init subdev\n");
>                 goto error_media_entity;
>         }
>
>         pm_runtime_set_active(ov9282->dev);
>         pm_runtime_enable(ov9282->dev);
> +
> +       ret = v4l2_async_register_subdev_sensor(&ov9282->sd);
> +       if (ret < 0)
> +               goto v4l2_subdev_cleanup;
> +
>         pm_runtime_idle(ov9282->dev);
>
>         return 0;
>
> +v4l2_subdev_cleanup:
> +       v4l2_subdev_cleanup(&ov9282->sd);
> +       pm_runtime_disable(ov9282->dev);
> +       pm_runtime_set_suspended(ov9282->dev);
>  error_media_entity:
>         media_entity_cleanup(&ov9282->sd.entity);
>  error_handler_free:
>         v4l2_ctrl_handler_free(ov9282->sd.ctrl_handler);
>  error_power_off:
>         ov9282_power_off(ov9282->dev);
> -error_mutex_destroy:
> -       mutex_destroy(&ov9282->mutex);
>
>         return ret;
>  }
> @@ -1482,9 +1473,9 @@ static int ov9282_probe(struct i2c_client *client)
>  static void ov9282_remove(struct i2c_client *client)
>  {
>         struct v4l2_subdev *sd = i2c_get_clientdata(client);
> -       struct ov9282 *ov9282 = to_ov9282(sd);
>
>         v4l2_async_unregister_subdev(sd);
> +       v4l2_subdev_cleanup(sd);
>         media_entity_cleanup(&sd->entity);
>         v4l2_ctrl_handler_free(sd->ctrl_handler);
>
> @@ -1492,8 +1483,6 @@ static void ov9282_remove(struct i2c_client *client)
>         if (!pm_runtime_status_suspended(&client->dev))
>                 ov9282_power_off(&client->dev);
>         pm_runtime_set_suspended(&client->dev);
> -
> -       mutex_destroy(&ov9282->mutex);
>  }
>
>  static const struct dev_pm_ops ov9282_pm_ops = {
> --
> 2.43.0
>

