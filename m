Return-Path: <linux-media+bounces-62941-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2PdVJaHwF2q5WAgAu9opvQ
	(envelope-from <linux-media+bounces-62941-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 28 May 2026 09:37:05 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 112BC5EDC63
	for <lists+linux-media@lfdr.de>; Thu, 28 May 2026 09:37:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6277C308DCF5
	for <lists+linux-media@lfdr.de>; Thu, 28 May 2026 07:35:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63BB4346FB0;
	Thu, 28 May 2026 07:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HjaLf1dC"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 532AC33F5AB
	for <linux-media@vger.kernel.org>; Thu, 28 May 2026 07:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779953750; cv=pass; b=GBYfMlbyvvUBhi5XtMkxSJzrBHA/rNtnmdcEP3Zy4gY2uGUeRC8f7wR9HQknbIIfTiGaeqSrOd7ocxY+RJPxrBxaPv8RatZnmR56MPjH3rBcTe367oYjs32EaM1syy7kGVrDK8kamoSXXMX9sDzokM8dejEuEvrnYXXUEAKQwZk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779953750; c=relaxed/simple;
	bh=8Nvv30A+3WElDIyVWIGJ6U51jBycEW5osp0TGNnbCqA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qInms+TNtORQtleIaX2rmWVTDVfLAvyBIqgCExkl3QFnMHL6VTrQPYdi/Df4vbVF68AsRc/PJCnE4CnaxyI55+LaJsmeOCKAf202FeO/YSSgb5TxBjIaSbr3KvcaI33GCt5lNIO7ysqlsuJ2l4Mu9grsUTM1csE4lHgjDYElEcI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HjaLf1dC; arc=pass smtp.client-ip=209.85.210.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-7dcdca9aa0bso12538919a34.0
        for <linux-media@vger.kernel.org>; Thu, 28 May 2026 00:35:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779953748; cv=none;
        d=google.com; s=arc-20240605;
        b=How3Y3LqoE9yAyEDPBz+liX5gjbKAwCAypZxgBJiBNwG1gkHWB2mtlY/Ym5gaA7VOj
         APBWcXEdoLX1dpTldTvO+V0nwgz3Xz8M/jW/lKdsnk1Im6Q7WNZ2O+Ir5luhlObnjgU+
         2sxbVFz7GUy652qwbBsAhZe0UJlUYdW5NEU/S+psBMKKgo8cjyJ/uwoHokQl/tmbN3kY
         4ZjUAlNlAb+SndYhOJ7ce0DEQBqbpPlsUmLapVdG97HdFIyLTVzjIpQ59USpUT8EfRqy
         dX4u6mZxDVPSpO9rEl8RFk3EgCTP8vC7N0W4UdtTJ8ptpSMmXlG77P4ZPk+SgEdXXSUq
         tY5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=T20GWQ7AAxX56WT8tx5xeyPGgn/3xota+hYuh6TNyvE=;
        fh=GP5zbwGsHIVGgxC1Fihe1L0ZnEh2ifkPL/J4fskmbDU=;
        b=fYLHJD42ZxGT505GBrFobztSx4HZSoBlea1xWT+4L9sJdYZMblEGs8lZHZ2zHewBjg
         l6ZChficBJZ7uVG2wPXVmu/mJePfuV+24/dnkcDjLXIr8t53XhQF86rE0MxnNs3gXxUK
         1OOzAI29i4lDXTiUza42W3Lc79Zbh8ABCBFVgDdL58UR/lYlP9s64c5nzZZZXHcZ1EWC
         a5cNRAiarKjbdsthVK518DY/JWP9lVOH7WrcT/EKfX0uKzTBbPoPxZGeIsJNaaxuR+aJ
         YOsyjQYbGGyKtSV2jLCSFsMqGcO+mrSpQ38EJDFc2l4gpbDXmpgyK8Y//k/Gm4LUZikF
         o1wQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779953748; x=1780558548; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T20GWQ7AAxX56WT8tx5xeyPGgn/3xota+hYuh6TNyvE=;
        b=HjaLf1dCajOakR/XLyl4MLXJpTdlmDY3d76r6oaxk9Alro6KwSXJnsxPkCIWuekmd1
         ZyK12tIMwePLnX3ZgcvB2Tyx3ip+d7dcQUdmIw1PaoxiEiG2O8KoqTBC0KEQ+lRcHzT6
         atqRa04aYI9/3xzhzZmE0tpzZLFbClU8mxVkxMEksmhf7Sx2JwMN6iTeoZGyFAqVaUwj
         yop3/C2b88fEA0iVjPW7grEqQ0y3qHpzuVMEpQsNIpdCOLZTA81kq/+Dx9HKlriFR2rW
         d6rk3Rq3rCMuKsWrh9zYemwVvUsEQUwDokb5y5JpXsTm/ND4KsIQDaIbbeh7xwLsfn7A
         NUvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779953748; x=1780558548;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=T20GWQ7AAxX56WT8tx5xeyPGgn/3xota+hYuh6TNyvE=;
        b=jL/eyr0+SDQh/Osjm1617PoTjCUhQ/6h3d1RwZUFo1/zjc4x62vyAUlmzgfH08GQuG
         tRPuU3NiENzoxYEHb9y4VFW6IKNRnGmz2VGkjdT1b2k7E3L5xDmsxVg4GUGyv94SgiVm
         utDe2Y26nLPd8kJNIWZk/YpL1jWBrgP8ODllcs63ROYyq8cTtJ6jbtAxnmm7zTIre4mW
         hGfZB8j0RSD0iK9x6MgDvjtmV0lP6K4vJAQWyWgo5eHM0VEPeE2BX3VqhEclzPLVS8+o
         UuVKUjykUk9WqWoalIfo5GHgvAmy+8PGf00CkvR9PGAGg/MibukN4GFQzcPB3gsQ45Tu
         ljqg==
X-Gm-Message-State: AOJu0YyyH99CllqnTN0zIY01XxSO13AHmuZaScGfLHb4UcSJ+lytsH0J
	lXvuUICEYtwpg3xN2iXApInXbSHbZuRhI1YYsbGljxKcW4mKhle1jJjbTGpCt7BGBfvo7IEts5u
	nmFL1bw5U4zqoadLqRBsypMVXhyQxLw45NGGkLmS3OEp5
X-Gm-Gg: Acq92OGgyUbDsmT6tVgleaQ67Eorn5owr1TRBMOL9vRQR1qaW+5rXqOlaVJk7EeIbPR
	wyiXJmVY8D2nJiqnCAWbW8FJfIg/QZe/DkBAsj7U25Af8sN8FGkbPSx1x1k3SwSzTSOCsJh6agE
	8Z0PrkEBR+Sdb9h9kz/EFI6WA/YJ4KGS8SzrA4CTrJd2XBKAiCnzi7L3CsRKuMAhQoP+Zt77pb5
	A5kac/PNe5ACCZba9GmZAc42bnkhlpm6GyqzZCOTV7K46TDrcrckvMCsljIjEuWqn2Pwc+R/tsj
	cyA7QINByMck72xCusEu40qFdC+oTvgDpBjlImTjuw0851YHWsFakN0h3NhzFLDGzNYVwPMQbfj
	S09k7
X-Received: by 2002:a05:6820:1f12:b0:696:72e9:f92e with SMTP id
 006d021491bc7-69dfa6b3709mr148717eaf.10.1779953748060; Thu, 28 May 2026
 00:35:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260518102451.417971-1-paulk@sys-base.io> <20260518102451.417971-16-paulk@sys-base.io>
In-Reply-To: <20260518102451.417971-16-paulk@sys-base.io>
From: arash golgol <arash.golgol@gmail.com>
Date: Thu, 28 May 2026 11:05:17 +0330
X-Gm-Features: AVHnY4IhmJJCXbj-tzl_ytWMhmyKPHjpmYamO2huuqsWLPnQ9-WnNbsuHTjiYbE
Message-ID: <CAMxPZkjhxJQ3ST6HrcwudkMzqwtvtVizng-PkiZd=xU4rrSxeA@mail.gmail.com>
Subject: Re: [PATCH 15/16] media: sun6i-isp: Add support for MC-centric format enumeration
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62941-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 112BC5EDC63
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Paul,

On Mon, May 18, 2026 at 2:02=E2=80=AFPM Paul Kocialkowski <paulk@sys-base.i=
o> wrote:
>
> Just make sure the provided mbus code is supported and carry on with the
> existing implementation since the pixelformat is independent from the
> mbus code.
>
> The params video node only supports a single format and does not care
> about the mbus format, but we can still report MC-centric support.
>
> Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
> ---
>  .../staging/media/sunxi/sun6i-isp/sun6i_isp_capture.c    | 9 ++++++++-
>  drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_params.c | 3 ++-
>  2 files changed, 10 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_capture.c b/=
drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_capture.c
> index 24e731bcabe9..372b9331bd6d 100644
> --- a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_capture.c
> +++ b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_capture.c
> @@ -436,8 +436,14 @@ static int sun6i_isp_capture_querycap(struct file *f=
ile, void *priv,
>  static int sun6i_isp_capture_enum_fmt(struct file *file, void *priv,
>                                       struct v4l2_fmtdesc *fmtdesc)
>  {
> +       u32 mbus_code =3D fmtdesc->mbus_code;
>         u32 index =3D fmtdesc->index;
>
> +       if (mbus_code && !sun6i_isp_proc_format_find(mbus_code))
> +               return -EINVAL;
> +
> +       /* Capture format is independent from proc format. */
> +
>         if (index >=3D ARRAY_SIZE(sun6i_isp_capture_formats))
>                 return -EINVAL;
>
> @@ -697,7 +703,8 @@ int sun6i_isp_capture_setup(struct sun6i_isp_device *=
isp_dev)
>
>         strscpy(video_dev->name, SUN6I_ISP_CAPTURE_NAME,
>                 sizeof(video_dev->name));
> -       video_dev->device_caps =3D V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STRE=
AMING;
> +       video_dev->device_caps =3D V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STRE=
AMING |
> +                                V4L2_CAP_IO_MC;
>         video_dev->vfl_dir =3D VFL_DIR_RX;
>         video_dev->release =3D video_device_release_empty;
>         video_dev->fops =3D &sun6i_isp_capture_fops;
> diff --git a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_params.c b/d=
rivers/staging/media/sunxi/sun6i-isp/sun6i_isp_params.c
> index 0cc48e2bc8c6..2622e5a07817 100644
> --- a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_params.c
> +++ b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_params.c
> @@ -531,7 +531,8 @@ int sun6i_isp_params_setup(struct sun6i_isp_device *i=
sp_dev)
>
>         strscpy(video_dev->name, SUN6I_ISP_PARAMS_NAME,
>                 sizeof(video_dev->name));
> -       video_dev->device_caps =3D V4L2_CAP_META_OUTPUT | V4L2_CAP_STREAM=
ING;
> +       video_dev->device_caps =3D V4L2_CAP_META_OUTPUT | V4L2_CAP_STREAM=
ING |
> +                                V4L2_CAP_IO_MC;
>         video_dev->vfl_dir =3D VFL_DIR_TX;
>         video_dev->release =3D video_device_release_empty;
>         video_dev->fops =3D &sun6i_isp_params_fops;
> --
> 2.54.0
>

Tested on a LicheePi Zero Dock (V3s) with the following pipeline:

ov5647 -> sun6i-mipi-csi2 -> sun6i-csi-bridge -> sun6i-isp-proc ->
sun6i-isp-capture

I verified MC-centric format enumeration on the ISP capture node with
multiple mbus codes supported by sun6i-isp-proc.

Tested-by: Arash Golgol <arash.golgol@gmail.com>

--=20
Regards,
Arash Golgol

