Return-Path: <linux-media+bounces-62843-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4BqAB0mGFmqqnAcAu9opvQ
	(envelope-from <linux-media+bounces-62843-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 07:51:05 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 77D465DF92D
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 07:51:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5DF11303AF0E
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 05:50:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8058D2741B5;
	Wed, 27 May 2026 05:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZMUyhUHp"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9105C221FC6
	for <linux-media@vger.kernel.org>; Wed, 27 May 2026 05:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779861055; cv=pass; b=s4McfaDCjWd39YTMFDN/31mFhxHu3xvDq0y57462+x9zHKFhHB08bqZU/Ro+q9/PWWOupAMw5dbo9xj/g6euKZco3WJhPEZWex71huyYe9sbR0BIzlv0YBHZPSQvc6W2fM1SiXiR5geF+UIRFurR7pMyLgKIUBcjGEHkjSz9ZJo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779861055; c=relaxed/simple;
	bh=s8Ct4ViIMpvfSQ9jjCfWQIZvZ7lFJ0AUr1z/hkkScG0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pGezZxmBz6zVIKa/vgUQuEIpDS47RaVsZBd6UsKSyRfp4njxlKwlO8aQHTEwrE40k3iAqjr5OU7D4eJgkDTnM3qbtQNywc0oWp4Oa/+6TUhS3TQL8zH0s7/upXIhAguwm24Z9YxO7lXRQJ2b9Y1B4NmHjQ+mrONms3GE7nxgt2Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZMUyhUHp; arc=pass smtp.client-ip=209.85.161.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-69d97689903so2704414eaf.0
        for <linux-media@vger.kernel.org>; Tue, 26 May 2026 22:50:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779861051; cv=none;
        d=google.com; s=arc-20240605;
        b=fO+37PD+7ajXUt03FFMpseIkva/ftrrQGKwbj8B4v+Wejpluehiu6jocYycON2HVKc
         8/dkLer9f8ReED7bT6RgHYehqiFzNwP48p6ioRM26v2NFCwuemoiCbt8G7mbhYEC44TH
         O0UdXKiLjWbKqOFU9m3qvSUK4HYd+5CUqqBfN2QcC+xqvFjgb7OgXV66omAogjzZYjlz
         fPsHUpI+iEDilZ3JyG5xvYc5ISMctYNvZBRkpTyqz5JbrIXIpct7M9IrUKPJl8k5GElr
         2YRqiCmXV0MxNGgZsAsDP7/soAatcTbVUwCuCSA0shQtjByM20a3k32MmZG3esbL79D/
         O8GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IN/lZ1MspSWqCEdebYjVtGecjRh9KxGFTFq6UHbS1Fc=;
        fh=GP5zbwGsHIVGgxC1Fihe1L0ZnEh2ifkPL/J4fskmbDU=;
        b=ZBmXBP0G6jndvkvEynbo6+1KoKtAgJ9HDCtmcz/rXricmUOZ8+dxIXmhP/mFp7HqWG
         HTqvVHDEvAWlZH/W5NIi9NRSe+mpGmbx1cj5U1iFMbYMWlIwmuNJ2yD9ru/11BSxoLFn
         yHzP7L5Zav6kd9hC4PoUl9AFSlNgpbB46DuElq2punt1gHkaEBw/jvlVNYRxy3YnOX9r
         MU1J7LiYlv0QRCZB0ST+0KB30qoJBvy0jSpvxU5G7btzdv2wQ29KhfQC1IJVoVgVwpNv
         37yulc4ciFcBLq8OxFfVAjTvOM2IBK9kbGLmy+Fcpt6aMEw3QbxNkPuQhfeyU7obOQtT
         yIuA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779861051; x=1780465851; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IN/lZ1MspSWqCEdebYjVtGecjRh9KxGFTFq6UHbS1Fc=;
        b=ZMUyhUHpp+zPwAKPOt+FGQeaPQ1uFmOkzdG6VElf18zaWNtw2afVWClIfDVnHkHdun
         wDwCpc1HZo64s34jeAMdPSbnDPKFzrupAptXiZJGUJ4BLWfoOxQa/B4o6hbf3YfWKBDF
         /jKVNZE9A7zZ37bQhet0xRbnSx+JAie4a9qcRGWKSBr4pUkytqQ+09nxWmtb450JYdHq
         BW555fYjXCLyawd8rBl04f0g5RNWMBJuiNwmlWZJIXxmqIzQR8GeSjp23DC8Cgoa7o3t
         l13hweRz6EDnjuTfwysrVBN1UtCKF2Pv4WqGZkN5p3o6PgCKpaYqW4G6pqMN1CtAg8fQ
         V1aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779861051; x=1780465851;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IN/lZ1MspSWqCEdebYjVtGecjRh9KxGFTFq6UHbS1Fc=;
        b=c2hFWL16xTLhp/CmqiTlvVNp7tVlsdXrRZq9POy5EWiZtNaS8HM5J84xQ0cgiqa9/m
         igNc7EeULUry4ZSXCuNOrjhfXhEZ6g16pSFF7pIh7f3zAA1z3Lje0aV/0xiLWVub3VOu
         GX+DdhvUkh0tmvAESQO6W/aSVIiIyNn8Bp6GsHrOm3QU5T2ChUyFybj6cZhu08QIyPVR
         +/4EDAY6fdpjwGfgtXqbvn2WAwP5IKva3doIYGO3VIZrM3KITzKuxUC+JnIIObU15fVo
         /rjLeHbBKMR9fNveAc43QyGyVnJVXbdqVhDb5HpwBE8tED1DEnPOhaqZ3K1zj8bFGXIP
         bdgw==
X-Gm-Message-State: AOJu0Yxtw6f+NLCogp2a3s1bfp/Sw0Pe1gvCCWiRPqGn3QfvkGbCoanY
	DI6GT78kpYbg6IIMSincuuo7X9C6qLKAc8VxxYmIBctQAOnB9vuCXHDsnDC/vYB1EldD/W6j4/5
	gClfFlVm5Au4VlH1e5epj0IV4YLByJRU=
X-Gm-Gg: Acq92OHYEiXv17cjU8yOIcGLVBsWAFVGQboNd/kMLeOpXn5vqMdbWEVO0EjVMCKgMVx
	C3ICx7F3ANjOgvQVVdgObELbTBkwBmFrp2TDSZ3oo4VUC2ymuDVP/bQ/ph9MEMKe8zpnHszvXq2
	bMW7CODM7O8wDDniDdeMAq4xJ+MZfPBD5ndQoK5efHWZm3ukrLeOnSu+svfEoQAEAUomxftSdja
	/ah79tr7lNCW4ZIbyU0gGHDMmf8WtqxqC1FKqlur2MoYNOI6DvSULvgvdCLc3DMiEtx5oJqGtRR
	fe0o0U0qRnzD2mt9S/GFQ1/yQhc3rb+KScqw12N1GpEZ1wKbPDSKV4eZ6AFIT5t+USaul/6D7UT
	DgA==
X-Received: by 2002:a05:6820:8c6:b0:67d:e7c3:3c6c with SMTP id
 006d021491bc7-69d7ece5518mr11407499eaf.53.1779861051499; Tue, 26 May 2026
 22:50:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260518102451.417971-1-paulk@sys-base.io> <20260518102451.417971-11-paulk@sys-base.io>
In-Reply-To: <20260518102451.417971-11-paulk@sys-base.io>
From: arash golgol <arash.golgol@gmail.com>
Date: Wed, 27 May 2026 09:20:20 +0330
X-Gm-Features: AVHnY4KCcmkhN5ddeEl3UKGwn2lpmjAHGW1bfUh9bIDJK3bFLtCx7fk5EGqR9us
Message-ID: <CAMxPZkiKBFsPA5x6KpBajGqO5xqxD5AOd26j3uwqnQko1VzknQ@mail.gmail.com>
Subject: Re: [PATCH 10/16] media: sun6i-csi: Add support for MC-centric format enumeration
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62843-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.infradead.org,lists.linux.dev,kernel.org,gmail.com,sholland.org,linuxfoundation.org,ideasonboard.com,collabora.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arashgolgol@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 77D465DF92D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Paul,

On Mon, May 18, 2026 at 2:00=E2=80=AFPM Paul Kocialkowski <paulk@sys-base.i=
o> wrote:
>
> Use the dedicated helper to check possible pixelformats against the
> provided mbus code in order to support MC-centric format enumeration.
>
> Note that multiple pixelformats may be returned for a given mbus code.
>
> Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
> ---
>  .../sunxi/sun6i-csi/sun6i_csi_capture.c       | 38 +++++++++++++++++--
>  1 file changed, 34 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c b=
/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
> index a836fa7f081a..409c28621093 100644
> --- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
> +++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
> @@ -773,14 +773,43 @@ static int sun6i_csi_capture_querycap(struct file *=
file, void *priv,
>  static int sun6i_csi_capture_enum_fmt(struct file *file, void *priv,
>                                       struct v4l2_fmtdesc *fmtdesc)
>  {
> +       const struct sun6i_csi_capture_format *capture_format;
> +       const struct sun6i_csi_bridge_format *bridge_format;
> +       u32 mbus_code =3D fmtdesc->mbus_code;
>         u32 index =3D fmtdesc->index;
> +       unsigned int index_valid =3D 0;
> +       unsigned int i;
> +
> +       /* Video-node-centric enumeration. */
> +       if (!mbus_code) {
> +               if (index >=3D ARRAY_SIZE(sun6i_csi_capture_formats))
> +                       return -EINVAL;
> +
> +               fmtdesc->pixelformat =3D
> +                       sun6i_csi_capture_formats[index].pixelformat;
> +               return 0;
> +       }
>
> -       if (index >=3D ARRAY_SIZE(sun6i_csi_capture_formats))
> +       bridge_format =3D sun6i_csi_bridge_format_find(mbus_code);
> +       if (!bridge_format)
>                 return -EINVAL;
>
> -       fmtdesc->pixelformat =3D sun6i_csi_capture_formats[index].pixelfo=
rmat;
> +       for (i =3D 0; i < ARRAY_SIZE(sun6i_csi_capture_formats); i++) {
> +               capture_format =3D &sun6i_csi_capture_formats[i];
>
> -       return 0;
> +               if (!sun6i_csi_capture_format_check(capture_format,
> +                                                   bridge_format))
> +                       continue;
> +
> +               if (index_valid =3D=3D index) {
> +                       fmtdesc->pixelformat =3D capture_format->pixelfor=
mat;
> +                       return 0;
> +               }
> +
> +               index_valid++;
> +       }
> +
> +       return -EINVAL;
>  }
>
>  static int sun6i_csi_capture_enum_framesize(struct file *file, void *fh,
> @@ -1076,7 +1105,8 @@ int sun6i_csi_capture_setup(struct sun6i_csi_device=
 *csi_dev)
>
>         strscpy(video_dev->name, SUN6I_CSI_CAPTURE_NAME,
>                 sizeof(video_dev->name));
> -       video_dev->device_caps =3D V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STRE=
AMING;
> +       video_dev->device_caps =3D V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STRE=
AMING |
> +                                V4L2_CAP_IO_MC;
>         video_dev->vfl_dir =3D VFL_DIR_RX;
>         video_dev->release =3D video_device_release_empty;
>         video_dev->fops =3D &sun6i_csi_capture_fops;
> --
> 2.54.0
>

Tested on a LicheePi Zero Dock (V3s) with the following pipeline:

ov7670 -> sun6i-csi-bridge -> sun6i-csi-capture

I verified that mbus-code-based format enumeration works correctly
from userspace and that the reported capture formats change according
to the selected media bus format.

I could also successfully start streaming with several of the
enumerated capture formats (e.g. YUYV and BA81)

However, I could not fully validate actual format conversion behavior
(e.g. MEDIA_BUS_FMT_YUYV8_2X8 to NV12) because my OV7670 setup
currently has non-functional test patterns except for 'shifting-1'
mode.

Tested-by: Arash Golgol <arash.golgol@gmail.com>

PS:

While testing this patch I also noticed that
VIDIOC_SUBDEV_ENUM_MBUS_CODE reports duplicate entries for:
 - MEDIA_BUS_FMT_UYVY8_2X8
 - MEDIA_BUS_FMT_UYVY8_1X16
on sun6i-csi-bridge.

This appears to come from duplicate format entries being exposed by
the bridge driver.

--=20
Regards,
Arash Golgol

