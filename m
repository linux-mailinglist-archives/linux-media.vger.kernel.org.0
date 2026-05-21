Return-Path: <linux-media+bounces-62434-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yN0QA3HWDmr2CQYAu9opvQ
	(envelope-from <linux-media+bounces-62434-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 11:54:57 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 632F95A2C00
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 11:54:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1BA5A31167C1
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 09:24:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9612D34B1B0;
	Thu, 21 May 2026 09:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J4XXePb4"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0EE636F434
	for <linux-media@vger.kernel.org>; Thu, 21 May 2026 09:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779355452; cv=pass; b=g6LMnRNvW5+xOcK360/tpHx0WRNWH1n7L76VXo054oejOjVWwS7M9kKJVudLGejj4gBSIaPrdZ0DJ7+OH6vRiffvNh/sgkTEp1a7Ro6Gv0FtMl0wRUD4rDeM66kPrIPFBO0elrOsM2cKtDNKcI7Jn4+edi6lPkCMWFGuTQDLnGY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779355452; c=relaxed/simple;
	bh=RL59BZOrhPjg0L0Ms+OIJfvtIFaBX3/J/gg5/XayWR4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SKQE9CSERDftcadIDknWcnLBRBRDJWRLhFAyyJPclMwAY/Yk8+X7nS0QDtdHOpC4E1GIaBvjoIT8+NUQ5UusD0qkSeDblePB//oC9H65/KV8jHVBdtVZkYQXuS1G4gKfPAf8P4oDFe/atici9HsMxG5iKyHoTVFJLukL7r9lJXU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J4XXePb4; arc=pass smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-7dcd689829eso4943061a34.3
        for <linux-media@vger.kernel.org>; Thu, 21 May 2026 02:24:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779355446; cv=none;
        d=google.com; s=arc-20240605;
        b=gdy3m/TEULuIQ3qYsbKKO0bV8wPMbwNVaWRKsPK6Q7yp/RU88ZIfCtyNg9QjsT4i2i
         Jk3y7qDdniPjKd5ZAi+etWbnzmu13jjAWFDSdlKxm4Vk2u4SU+1zRuhCqlAM0iO+UByu
         CPnZJsjuTd5ZTeByp3Ugd1c+CcSocHyHdMyDNvxOBRVMyMc8TIwGn4yOlbo7Co/9N55Q
         Gzdncwa0CmKF6oEtXwhlmVAyJTpS7YLyoBCfh22mMlZg33uel6AMqLX3IE17NsfMBCK2
         K8rKMMQd+rZStttUnF4Qsx/C8N0vY4IX5p2GeTCH3lPVdL+I/sZ0NSa+bfSuLUSDZxod
         7D+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Bg/32xNRu9xmU6RjD3VE0ZNzN4b0mPq9saaOodPsoaY=;
        fh=GP5zbwGsHIVGgxC1Fihe1L0ZnEh2ifkPL/J4fskmbDU=;
        b=A84M0RU/XzeII9ZnXySIiEsfgvN3L63S+JozNCfZtGwD9wpGqBOjZ0+5pShiDkIw9w
         xrlXqpk/ZtcF3Bn+rw7J6xdSHZU4k+cD9ixTAcI/Qp2Jq+8hTwzB/gwaCzaspIQkXBCR
         bp88EzZqMvTNC5nuym+7L8wQcE4jUZ21ECblbda/xStZBsA8NreoT1xOCRuXVbjne3mh
         F+OarjTK1urn6iSg7YlO/4Vo/orVlr81gU0N7XIFOALOZ7+UkXO4cTVDClxPpBFHyBDB
         iaxVrjjwb7FFzpVuQvCY+ywXFPcIB3Jc9xsDKyPfKVGYmzVQXRVX2QT8IBn9kNjqZ2tT
         56VA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779355446; x=1779960246; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bg/32xNRu9xmU6RjD3VE0ZNzN4b0mPq9saaOodPsoaY=;
        b=J4XXePb4lgdgtmApXqejflgrt5k70+2LgFehfHnc0sNn3ocZr/Lw3y0kxn0CRv1FjP
         wsZIXsU2JXoN2iCl3uwSOOQCkamqwkeq9ZcxhEFuS6oaX5TnVokN0SgAeoAI09S8/9nS
         VXdk7+W8bxlxFzfxCpvi70HQNfJVTb1aB+jpoeVrB1WbvcbMh5V0AfmQtrYVUVpV7j/C
         Tpli7rFQKbdCHV78TQLTWwbJarMMYgeCpeE4747E0J9K2I/IolMQJJUQphrnskoCzteC
         GTxfjzKHcMp+/yhlIqw0xvgbgk9UySJp9UEmB5WHJ8qNS9aSipoVYo4uR3AD4A7OSCFO
         mX8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779355446; x=1779960246;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Bg/32xNRu9xmU6RjD3VE0ZNzN4b0mPq9saaOodPsoaY=;
        b=RjdDJEczvqKCV1jW/ZwnIYB3LwmKbCE3vqEyCkJlEXIkcxzcsaztfD+2d+DwaH9tq6
         Q32eUa614Jc6H17+/RPegJe8eVvvs2MPhLAaD6uzR6rUSsUyJJrLz45Pp6VeCKFt+6Ud
         a+2oxP+L1M307NjI4sKrACGyjUhllyGvDpAcwmkaIIMSRbxLoNb8yEOkjZsO32Y+KzM4
         fax6ewHdENU0RXGg3VLydT7sso5s6NS3gmpWE31U/Q5xi0LFbQ1S3aUQrMMJkzX1nGr3
         bWMe/228wAUjZsC6ukbKcDkHm19nEh34o30/2CF1DXtvL+r+H1ljHP3v9U73b3zDY7mB
         ivYQ==
X-Gm-Message-State: AOJu0YwOqdXahsYXD6bckRBPsuJh+dSKbE8LP1FGEhlOD09hVnd7mTad
	7N27qfcZOw+SiaL/t9DAjlEyu9m/CLd12/t7um3kTt1cHI9jG791GbQ3SzWaeHsAgjYDyAidRlc
	EG+LDhqOYX2+ZY/AMBZO5NSXqAVSIxko=
X-Gm-Gg: Acq92OGRVdCONR8GI8vZwVKTUq5apdmC1qwnJHWqEHDS6tHUpQEkizfrJeiiCSnv9cA
	KEjFGXv//ynnHDwlXURhogXMfBmsRc0DgB/CLrsexFLXYxpToujX8wI/YIFv4JBfuw7DQX4jg+R
	+YIFFkahdyQj9ZSQuy3jh8aJukRXw3T0UvbxKCGFtoqVLk2jqx1mIA8lgesTE8pWVhPqLzcLpzx
	PZhOGnvHK7+0Rg8mXRJp/eMG5r5numAtc24Pd/9Tgvkq4meR1e8VoC7YBBBYOYoD1cgX0VdhTZN
	uYc/HzBU/T3Gcn9ThSrvAYvEv/H2FVXZutBQE6zWwQfGGOw+AUrjV91OuFS6q4oDXeBjQWxMw9e
	6OWa2
X-Received: by 2002:a05:6820:81c8:b0:67e:2988:15e1 with SMTP id
 006d021491bc7-69d6ee60692mr915956eaf.16.1779355445586; Thu, 21 May 2026
 02:24:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260518102451.417971-1-paulk@sys-base.io> <20260518102451.417971-15-paulk@sys-base.io>
In-Reply-To: <20260518102451.417971-15-paulk@sys-base.io>
From: arash golgol <arash.golgol@gmail.com>
Date: Thu, 21 May 2026 12:53:42 +0330
X-Gm-Features: AVHnY4JLgYD5g8KSsZAQsfTJHSovnmg95Dqn-5an288CZbWMq20rZb5y5QAIb78
Message-ID: <CAMxPZkg9MgZrsM2L0vKzzUOA_tnSLKHdHkzDsfH5_WRqSQgvZg@mail.gmail.com>
Subject: Re: [PATCH 14/16] media: sun6i-isp: Use V4L2 subdev active state
To: Paul Kocialkowski <paulk@sys-base.io>
Cc: linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-staging@lists.linux.dev, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Nicolas Dufresne <nicolas.dufresne@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62434-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.infradead.org,lists.linux.dev,kernel.org,gmail.com,sholland.org,linuxfoundation.org,ideasonboard.com,collabora.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arashgolgol@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,sys-base.io:email]
X-Rspamd-Queue-Id: 632F95A2C00
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Paul,

On Mon, May 18, 2026 at 2:02=E2=80=AFPM Paul Kocialkowski <paulk@sys-base.i=
o> wrote:
>
> Store the active format using the common V4L2 subdev active state
> instead of our local copy of it.
>
> Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
> ---
>  .../media/sunxi/sun6i-isp/sun6i_isp_capture.c |  16 ++-
>  .../media/sunxi/sun6i-isp/sun6i_isp_params.c  |  18 ++-
>  .../media/sunxi/sun6i-isp/sun6i_isp_params.h  |   4 +-
>  .../media/sunxi/sun6i-isp/sun6i_isp_proc.c    | 117 ++++++++----------
>  .../media/sunxi/sun6i-isp/sun6i_isp_proc.h    |   7 --
>  5 files changed, 82 insertions(+), 80 deletions(-)
>
> diff --git a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_capture.c b/=
drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_capture.c
> index e7b99cee63d6..24e731bcabe9 100644
> --- a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_capture.c
> +++ b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_capture.c
> @@ -595,11 +595,25 @@ static int sun6i_isp_capture_link_validate(struct m=
edia_link *link)
>                 media_entity_to_video_device(link->sink->entity);
>         struct sun6i_isp_device *isp_dev =3D video_get_drvdata(video_dev)=
;
>         struct v4l2_device *v4l2_dev =3D &isp_dev->v4l2.v4l2_dev;
> +       struct v4l2_subdev *proc_subdev =3D
> +               media_entity_to_v4l2_subdev(link->source->entity);
>         unsigned int capture_width, capture_height;
>         unsigned int proc_width, proc_height;
> +       struct v4l2_subdev_format proc_subdev_format =3D {
> +               .which  =3D V4L2_SUBDEV_FORMAT_ACTIVE,
> +               .pad    =3D link->source->index,
> +       };
> +       int ret;
>
>         sun6i_isp_capture_dimensions(isp_dev, &capture_width, &capture_he=
ight);
> -       sun6i_isp_proc_dimensions(isp_dev, &proc_width, &proc_height);
> +
> +       ret =3D v4l2_subdev_call(proc_subdev, pad, get_fmt, NULL,
> +                              &proc_subdev_format);
> +       if (ret)
> +               return ret;
> +
> +       proc_width =3D proc_subdev_format.format.width;
> +       proc_height =3D proc_subdev_format.format.height;
>
>         /* No cropping/scaling is supported (yet). */
>         if (capture_width !=3D proc_width || capture_height !=3D proc_hei=
ght) {
> diff --git a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_params.c b/d=
rivers/staging/media/sunxi/sun6i-isp/sun6i_isp_params.c
> index b7ef33fa2b13..0cc48e2bc8c6 100644
> --- a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_params.c
> +++ b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_params.c
> @@ -43,11 +43,14 @@ static const struct sun6i_isp_params_config sun6i_isp=
_params_config_default =3D {
>         },
>  };
>
> -static void sun6i_isp_params_configure_ob(struct sun6i_isp_device *isp_d=
ev)
> +static void
> +sun6i_isp_params_configure_ob(struct sun6i_isp_device *isp_dev,
> +                             const struct v4l2_mbus_framefmt *mbus_forma=
t)
>  {
>         unsigned int width, height;
>
> -       sun6i_isp_proc_dimensions(isp_dev, &width, &height);
> +       width =3D mbus_format->width;
> +       height =3D mbus_format->height;
>
>         sun6i_isp_load_write(isp_dev, SUN6I_ISP_OB_SIZE_REG,
>                              SUN6I_ISP_OB_SIZE_WIDTH(width) |
> @@ -112,10 +115,12 @@ static void sun6i_isp_params_configure_wb(struct su=
n6i_isp_device *isp_dev)
>                              SUN6I_ISP_WB_CFG_CLIP(0xfff));
>  }
>
> -static void sun6i_isp_params_configure_base(struct sun6i_isp_device *isp=
_dev)
> +static void
> +sun6i_isp_params_configure_base(struct sun6i_isp_device *isp_dev,
> +                               const struct v4l2_mbus_framefmt *mbus_for=
mat)
>  {
>         sun6i_isp_params_configure_ae(isp_dev);
> -       sun6i_isp_params_configure_ob(isp_dev);
> +       sun6i_isp_params_configure_ob(isp_dev, mbus_format);
>         sun6i_isp_params_configure_wb(isp_dev);
>  }
>
> @@ -170,14 +175,15 @@ sun6i_isp_params_configure_modules(struct sun6i_isp=
_device *isp_dev,
>         sun6i_isp_load_write(isp_dev, SUN6I_ISP_MODULE_EN_REG, value);
>  }
>
> -void sun6i_isp_params_configure(struct sun6i_isp_device *isp_dev)
> +void sun6i_isp_params_configure(struct sun6i_isp_device *isp_dev,
> +                               const struct v4l2_mbus_framefmt *mbus_for=
mat)
>  {
>         struct sun6i_isp_params_state *state =3D &isp_dev->params.state;
>         unsigned long flags;
>
>         spin_lock_irqsave(&state->lock, flags);
>
> -       sun6i_isp_params_configure_base(isp_dev);
> +       sun6i_isp_params_configure_base(isp_dev, mbus_format);
>
>         /* Default config is only applied at the very first stream start.=
 */
>         if (state->configured)
> diff --git a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_params.h b/d=
rivers/staging/media/sunxi/sun6i-isp/sun6i_isp_params.h
> index 50f10f879c42..c0d6cff95d54 100644
> --- a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_params.h
> +++ b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_params.h
> @@ -36,8 +36,8 @@ struct sun6i_isp_params {
>
>  /* Params */
>
> -void sun6i_isp_params_configure(struct sun6i_isp_device *isp_dev);
> -
> +void sun6i_isp_params_configure(struct sun6i_isp_device *isp_dev,
> +                               const struct v4l2_mbus_framefmt *mbus_for=
mat);
>  /* State */
>
>  void sun6i_isp_params_state_update(struct sun6i_isp_device *isp_dev,
> diff --git a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_proc.c b/dri=
vers/staging/media/sunxi/sun6i-isp/sun6i_isp_proc.c
> index 46a334b602f1..9073a7f3f8c8 100644
> --- a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_proc.c
> +++ b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_proc.c
> @@ -15,17 +15,6 @@
>  #include "sun6i_isp_proc.h"
>  #include "sun6i_isp_reg.h"
>
> -/* Helpers */
> -
> -void sun6i_isp_proc_dimensions(struct sun6i_isp_device *isp_dev,
> -                              unsigned int *width, unsigned int *height)
> -{
> -       if (width)
> -               *width =3D isp_dev->proc.mbus_format.width;
> -       if (height)
> -               *height =3D isp_dev->proc.mbus_format.height;
> -}
> -
>  /* Format */
>
>  static const struct sun6i_isp_proc_format sun6i_isp_proc_formats[] =3D {
> @@ -137,9 +126,10 @@ static void sun6i_isp_proc_disable(struct sun6i_isp_=
device *isp_dev)
>         regmap_write(regmap, SUN6I_ISP_FE_CFG_REG, 0);
>  }
>
> -static void sun6i_isp_proc_configure(struct sun6i_isp_device *isp_dev)
> +static void
> +sun6i_isp_proc_configure(struct sun6i_isp_device *isp_dev,
> +                        const struct v4l2_mbus_framefmt *mbus_format)
>  {
> -       struct v4l2_mbus_framefmt *mbus_format =3D &isp_dev->proc.mbus_fo=
rmat;
>         const struct sun6i_isp_proc_format *format;
>         u32 value;
>
> @@ -173,6 +163,8 @@ static int sun6i_isp_proc_s_stream(struct v4l2_subdev=
 *subdev, int on)
>         struct sun6i_isp_proc_source *source;
>         struct v4l2_subdev *source_subdev;
>         struct media_pad *remote_pad;
> +       struct v4l2_subdev_state *state;
> +       const struct v4l2_mbus_framefmt *mbus_format;
>         int ret;
>
>         /* Source */
> @@ -191,6 +183,10 @@ static int sun6i_isp_proc_s_stream(struct v4l2_subde=
v *subdev, int on)
>         else
>                 source =3D &proc->source_csi1;
>
> +       /* Active State */
> +
> +       state =3D v4l2_subdev_lock_and_get_active_state(subdev);
> +
>         if (!on) {
>                 sun6i_isp_proc_irq_disable(isp_dev);
>                 v4l2_subdev_call(source_subdev, video, s_stream, 0);
> @@ -202,7 +198,7 @@ static int sun6i_isp_proc_s_stream(struct v4l2_subdev=
 *subdev, int on)
>
>         ret =3D pm_runtime_resume_and_get(dev);
>         if (ret < 0)
> -               return ret;
> +               goto unlock;
>
>         /* Clear */
>
> @@ -210,9 +206,12 @@ static int sun6i_isp_proc_s_stream(struct v4l2_subde=
v *subdev, int on)
>
>         /* Configure */
>
> +       mbus_format =3D v4l2_subdev_state_get_format(state,
> +                                                  SUN6I_ISP_PROC_PAD_SIN=
K_CSI);
> +
>         sun6i_isp_tables_configure(isp_dev);
> -       sun6i_isp_params_configure(isp_dev);
> -       sun6i_isp_proc_configure(isp_dev);
> +       sun6i_isp_params_configure(isp_dev, mbus_format);
> +       sun6i_isp_proc_configure(isp_dev, mbus_format);
>         sun6i_isp_capture_configure(isp_dev);
>
>         /* State Update */
> @@ -230,13 +229,17 @@ static int sun6i_isp_proc_s_stream(struct v4l2_subd=
ev *subdev, int on)
>                 goto disable;
>         }
>
> -       return 0;
> +       ret =3D 0;
> +       goto unlock;
>
>  disable:
>         sun6i_isp_proc_disable(isp_dev);
>
>         pm_runtime_put(dev);
>
> +unlock:
> +       v4l2_subdev_unlock_state(state);
> +
>         return ret;
>  }
>
> @@ -259,21 +262,22 @@ sun6i_isp_proc_mbus_format_prepare(struct v4l2_mbus=
_framefmt *mbus_format)
>  static int sun6i_isp_proc_init_state(struct v4l2_subdev *subdev,
>                                      struct v4l2_subdev_state *state)
>  {
> -       struct sun6i_isp_device *isp_dev =3D v4l2_get_subdevdata(subdev);
> -       unsigned int pad =3D SUN6I_ISP_PROC_PAD_SINK_CSI;
> -       struct v4l2_mbus_framefmt *mbus_format =3D
> -               v4l2_subdev_state_get_format(state, pad);
> -       struct mutex *lock =3D &isp_dev->proc.lock;
> +       unsigned int pad;
>
> -       mutex_lock(lock);
> +       for (pad =3D 0; pad < subdev->entity.num_pads; pad++) {
> +               struct v4l2_mbus_framefmt *mbus_format;
>
> -       mbus_format->code =3D sun6i_isp_proc_formats[0].mbus_code;
> -       mbus_format->width =3D 1280;
> -       mbus_format->height =3D 720;
> +               if (pad =3D=3D SUN6I_ISP_PROC_PAD_SINK_PARAMS)
> +                       continue;
>
> -       sun6i_isp_proc_mbus_format_prepare(mbus_format);
> +               mbus_format =3D v4l2_subdev_state_get_format(state, pad);
>
> -       mutex_unlock(lock);
> +               mbus_format->code =3D sun6i_isp_proc_formats[0].mbus_code=
;
> +               mbus_format->width =3D 1280;
> +               mbus_format->height =3D 720;
> +
> +               sun6i_isp_proc_mbus_format_prepare(mbus_format);
> +       }
>
>         return 0;
>  }
> @@ -291,53 +295,31 @@ sun6i_isp_proc_enum_mbus_code(struct v4l2_subdev *s=
ubdev,
>         return 0;
>  }
>
> -static int sun6i_isp_proc_get_fmt(struct v4l2_subdev *subdev,
> -                                 struct v4l2_subdev_state *state,
> -                                 struct v4l2_subdev_format *format)
> -{
> -       struct sun6i_isp_device *isp_dev =3D v4l2_get_subdevdata(subdev);
> -       struct v4l2_mbus_framefmt *mbus_format =3D &format->format;
> -       struct mutex *lock =3D &isp_dev->proc.lock;
> -
> -       mutex_lock(lock);
> -
> -       if (format->which =3D=3D V4L2_SUBDEV_FORMAT_TRY)
> -               *mbus_format =3D *v4l2_subdev_state_get_format(state,
> -                                                            format->pad)=
;
> -       else
> -               *mbus_format =3D isp_dev->proc.mbus_format;
> -
> -       mutex_unlock(lock);
> -
> -       return 0;
> -}
> -
>  static int sun6i_isp_proc_set_fmt(struct v4l2_subdev *subdev,
>                                   struct v4l2_subdev_state *state,
>                                   struct v4l2_subdev_format *format)
>  {
> -       struct sun6i_isp_device *isp_dev =3D v4l2_get_subdevdata(subdev);
> -       struct v4l2_mbus_framefmt *mbus_format =3D &format->format;
> -       struct mutex *lock =3D &isp_dev->proc.lock;
> +       struct v4l2_mbus_framefmt *mbus_format;
>
> -       mutex_lock(lock);
> +       if (format->pad !=3D SUN6I_ISP_PROC_PAD_SINK_CSI)
> +               return v4l2_subdev_get_fmt(subdev, state, format);
>
> -       sun6i_isp_proc_mbus_format_prepare(mbus_format);
> +       sun6i_isp_proc_mbus_format_prepare(&format->format);
>
> -       if (format->which =3D=3D V4L2_SUBDEV_FORMAT_TRY)
> -               *v4l2_subdev_state_get_format(state, format->pad) =3D
> -                       *mbus_format;
> -       else
> -               isp_dev->proc.mbus_format =3D *mbus_format;
> +       mbus_format =3D v4l2_subdev_state_get_format(state, format->pad);
> +       *mbus_format =3D format->format;
>
> -       mutex_unlock(lock);
> +       /* Propagate the format to the source pad. */
> +       mbus_format =3D v4l2_subdev_state_get_format(state,
> +                                                  SUN6I_ISP_PROC_PAD_SOU=
RCE);
> +       *mbus_format =3D format->format;
>
>         return 0;
>  }
>
>  static const struct v4l2_subdev_pad_ops sun6i_isp_proc_pad_ops =3D {
>         .enum_mbus_code =3D sun6i_isp_proc_enum_mbus_code,
> -       .get_fmt        =3D sun6i_isp_proc_get_fmt,
> +       .get_fmt        =3D v4l2_subdev_get_fmt,
>         .set_fmt        =3D sun6i_isp_proc_set_fmt,
>  };
>
> @@ -499,8 +481,6 @@ int sun6i_isp_proc_setup(struct sun6i_isp_device *isp=
_dev)
>         struct media_pad *pads =3D proc->pads;
>         int ret;
>
> -       mutex_init(&proc->lock);
> -
>         /* V4L2 Subdev */
>
>         v4l2_subdev_init(subdev, &sun6i_isp_proc_subdev_ops);
> @@ -532,10 +512,14 @@ int sun6i_isp_proc_setup(struct sun6i_isp_device *i=
sp_dev)
>
>         /* V4L2 Subdev */
>
> +       ret =3D v4l2_subdev_init_finalize(subdev);
> +       if (ret < 0)
> +               goto error_media_entity;
> +
>         ret =3D v4l2_device_register_subdev(v4l2_dev, subdev);
>         if (ret < 0) {
>                 v4l2_err(v4l2_dev, "failed to register v4l2 subdev: %d\n"=
, ret);
> -               goto error_media_entity;
> +               goto error_subdev_finalize;
>         }
>
>         /* V4L2 Async */
> @@ -562,6 +546,9 @@ int sun6i_isp_proc_setup(struct sun6i_isp_device *isp=
_dev)
>
>         v4l2_device_unregister_subdev(subdev);
>
> +error_subdev_finalize:
> +       v4l2_subdev_cleanup(subdev);
> +
>  error_media_entity:
>         media_entity_cleanup(&subdev->entity);
>
> @@ -577,5 +564,7 @@ void sun6i_isp_proc_cleanup(struct sun6i_isp_device *=
isp_dev)
>         v4l2_async_nf_cleanup(notifier);
>
>         v4l2_device_unregister_subdev(subdev);
> +       v4l2_subdev_cleanup(subdev);
> +
>         media_entity_cleanup(&subdev->entity);
>  }
> diff --git a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_proc.h b/dri=
vers/staging/media/sunxi/sun6i-isp/sun6i_isp_proc.h
> index db6738a39147..26c4327c5ed7 100644
> --- a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_proc.h
> +++ b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_proc.h
> @@ -42,18 +42,11 @@ struct sun6i_isp_proc {
>         struct v4l2_subdev              subdev;
>         struct media_pad                pads[3];
>         struct v4l2_async_notifier      notifier;
> -       struct v4l2_mbus_framefmt       mbus_format;
> -       struct mutex                    lock; /* Mbus format lock. */
>
>         struct sun6i_isp_proc_source    source_csi0;
>         struct sun6i_isp_proc_source    source_csi1;
>  };
>
> -/* Helpers */
> -
> -void sun6i_isp_proc_dimensions(struct sun6i_isp_device *isp_dev,
> -                              unsigned int *width, unsigned int *height)=
;
> -
>  /* Format */
>
>  const struct sun6i_isp_proc_format *sun6i_isp_proc_format_find(u32 mbus_=
code);
> --
> 2.54.0
>

I used LicheePi Zero Dock (V3s) with the following pipeline as test setup.

ov5647 -> sun6i-mipi-csi2 -> sun6i-csi-bridge -> sun6i-isp-proc ->
sun6i-isp-capture

I verified TRY and ACTIVE state handling, including changing TRY
formats without affecting ACTIVE state. Format propagation from the
sink (csi) pad to the source pad was also tested.

I also tested streaming with the sensor test pattern enabled and
verified the captured output was correct.

Tested-by: Arash Golgol <arash.golgol@gmail.com>
--=20
Regards
Arash Golgol

