Return-Path: <linux-media+bounces-62667-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2Da5Mn0uEWqPiQYAu9opvQ
	(envelope-from <linux-media+bounces-62667-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 23 May 2026 06:35:09 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id C3C525BD1F9
	for <lists+linux-media@lfdr.de>; Sat, 23 May 2026 06:35:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B60093006210
	for <lists+linux-media@lfdr.de>; Sat, 23 May 2026 04:35:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07E562E6CCD;
	Sat, 23 May 2026 04:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YrKS58Zs"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 158DA1B6D1A
	for <linux-media@vger.kernel.org>; Sat, 23 May 2026 04:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779510903; cv=pass; b=CrMReVr4uR6LBvjL6cCej6dDA2RfzZ067M5IBhrEsVP4IETYC2voxmRap+Y4E4yjJYjfxx8qjCbFGy+pPNI1b3IdHS4U3QOM5gKfL8KcnttrMD5YEdxPWs5O1+E33Q3uP1T2h9zm9LTIWBmyoPdW04LY1sFifd556mfUn5uPC5k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779510903; c=relaxed/simple;
	bh=jpTwqZr/Q5gQVOlqJ0S2yDPGDJKQkPbLyOemLlhRRsQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lRZjxiyLLVLq68i5N/8VmMbCcqnUFXuo5d2D+si6UQHK6UcN71N6O6/VGQNhFeBlYg69b8/GBVoOl8fzK/teTMTwp69l5N4grLY1W52rbqTkt8ar0XwghcYlLsztSRSpet8uOvUdzFCkeaY5LjlEBE8Hd1YefRWjcW9ugBeXxCc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YrKS58Zs; arc=pass smtp.client-ip=209.85.160.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-43587e63a8eso5235887fac.0
        for <linux-media@vger.kernel.org>; Fri, 22 May 2026 21:35:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779510901; cv=none;
        d=google.com; s=arc-20240605;
        b=l0KCqGlLGI/JDaE+5jbo7c4sVwn3dRaUPJgv69TDwnNsCGbDriHPhB5hvc3gc1ZOtQ
         zTtpA4yB94dU4E0foK8iaRwuvcyf5JnV//tGqbpa/QNHmLxdS/wSLssKAQt6vZshUxeK
         gAgUnwmqT9z55fguRV25e77o+F7nrevcp+cPr6HezoK5s9tbJJiYzqhyjUsnT+nE98+w
         g24w0j3Qnw0e0drr2Rr4NoV3NxR1ldr5F9X7MVPktpMmzSIyAbjq1Sn/931Xah3F8/hI
         N5utWi2bGNMhVQ5I4Ck1Pv7jmJv1oZ6ELbMNaSvooo8hFDC17YHkZ+xZn0LsSd4WhXKL
         j7Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Vjwen8pW+3nbnlCQULsmeNoF69s54+b6PcjKCfFeltM=;
        fh=GP5zbwGsHIVGgxC1Fihe1L0ZnEh2ifkPL/J4fskmbDU=;
        b=hlo25U9CxBZMw5vn8v5tr68WCpV5zHxVGMoD+UiuqijZ66qAuD+WmDplgAvvmw8o2Q
         /rZchVL0HWZzYInMLNDJRgtilBaupoaC/jBwCGArRP5fTMNzvWFDhUa5QIlicCqa4MzD
         4Nox7aBzU78vKuclwA2itqr7qJGDDJs6TvWYOkwJ2Dh+fAraOx5Tewm95XVnf96hQnkU
         MLy+7j2o+debc13PuLVpjU7omG0fsH00+5UdvW0OZ4j0zo3toxPZL25gsTa1WsC2KWKi
         Nu2JNhcgS0e8OP5sAmabFpULEqx+tXNVewyeFehJkerQcZtIakTMEPTNoQUelnOIWiu1
         Q6+g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779510901; x=1780115701; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vjwen8pW+3nbnlCQULsmeNoF69s54+b6PcjKCfFeltM=;
        b=YrKS58ZsGaMPI9BEz7ak6uh2znp2ACP+nX2N2Zo8U4M+/6uiu3fcxRLxe7Avp12CAq
         9wfcPHtljJOGQxrCAAOkwT4ZZZcMwqcusvtBzKBtKAHlDm8mNjh742/4SK1vHuD28TBl
         V4W9zJCgXzaCBF6F/8vSVw4dJRQ1Btja7Oa/BMeRaW0P/kaul950QrseynpLyaQtyWac
         gvZchSAr020Y92Nr3bMQH2BrjlWYOuoT4tQIDt8OgnkRQ7+rTBxn/+Qk67I0CRtMjTbN
         7HrB32POdQbyfLJOpYDGy/9yDyFDvqfBLiKicaYuBB3xu0qrdDlyB5NwSI3XkrexmphP
         nivg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779510901; x=1780115701;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Vjwen8pW+3nbnlCQULsmeNoF69s54+b6PcjKCfFeltM=;
        b=k5nQl3FLOlCk4WLVq1ikfDh5puOUxkKC8s1R5ciDiR5jy1XNMhuzXvR7X0wdEWDBX3
         r+zmAhpaQYYspWbeasJ/d/kcRFNrqu0XY4ZJtIeV6M1TacWblwYFvXmRM1FRWhwRjmcL
         wjkibzZ/PKtpu1XaC72slkT3jQnqg9vR8j/PuWCCbES67/vSb2apSx5goJ1pLxm9XIRk
         22CoyJ41dpUXXuIBFD+yeL76yk1vuAxp3JNKn/2p6PJH1PNn5Y48veovGlLIntfLR3Hc
         YXV/YN8U9Hg/+Bk7PoagKm4cNS2LMxVYxLXQrSDskww/0eIDTSAP2cyUrmKmtMiKyX3j
         jWOg==
X-Gm-Message-State: AOJu0YzaW2OXifBpGB/Af0wQ751aVZ2tuhfUUC9pEC6X1lEe4lXZCiSw
	YRmHTsMQR25qod7dBEXEzV4nhb+tG3zaaDTr8sARrFGiTn4ivPbTPdnIZ98yT1anHGr2OxO2s5N
	nPT/1Nq+bxZT4ApGyZ2gNSBQVlpi7ASM=
X-Gm-Gg: Acq92OGF7QQwp8wukHgFcjGzmGCf7sBc0AyRXHOx3O/45FS3rI4efHm/kmdgx1rggFd
	hj/ymYj+vNT81YF5Xpiezpx9Tjd2Jgaa1N4KW5fKt4RK54i9mDmLRAy2/9jUPaAbpxQdII+EzNK
	brB2Vf0DhSRD/cZge81XKUwKpYSc+Ym6h/ZB08RSEX75y2QYcmORPTI2m7OEtM1shjma9Jgfi+M
	ZwUBGzM412qgBDbeuLibZr2KxCnJV9tJz3q5kIA51L1Sa7fxN8ahogB//GwD3519YoVDlxMFzEI
	OSfNNQnF8/fbAD1lJVTl7Grl5GJOQBG5hX5Kmx6ufUog9ZbHzH8eqB7WEk2YwuP7xg==
X-Received: by 2002:a05:6820:1527:b0:67e:16b4:aa13 with SMTP id
 006d021491bc7-69d7ed3ddb2mr3655129eaf.58.1779510900956; Fri, 22 May 2026
 21:35:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260518102451.417971-1-paulk@sys-base.io> <20260518102451.417971-17-paulk@sys-base.io>
In-Reply-To: <20260518102451.417971-17-paulk@sys-base.io>
From: arash golgol <arash.golgol@gmail.com>
Date: Sat, 23 May 2026 08:04:50 +0330
X-Gm-Features: AVHnY4JvnA7ojDWW97GlknLev-z2MRzqG6cGTuP_DqdsaaWX-ot3wdOD3pLiTkg
Message-ID: <CAMxPZkgODpNgaFAnaQQNum79VQyt9nV7LpEk6WZqpcqnKgUiGw@mail.gmail.com>
Subject: Re: [PATCH 16/16] media: sun6i-isp: Add support for frame size enumeration
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62667-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: C3C525BD1F9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Paul,

On Mon, May 18, 2026 at 2:02=E2=80=AFPM Paul Kocialkowski <paulk@sys-base.i=
o> wrote:
>
> This implements the enum_framesizes operation, which reports support for
> even sizes.
>
> Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
> ---
>  .../media/sunxi/sun6i-isp/sun6i_isp_capture.c | 22 +++++++++++++++++++
>  1 file changed, 22 insertions(+)
>
> diff --git a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_capture.c b/=
drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_capture.c
> index 372b9331bd6d..e638ec32c7cd 100644
> --- a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_capture.c
> +++ b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_capture.c
> @@ -452,6 +452,26 @@ static int sun6i_isp_capture_enum_fmt(struct file *f=
ile, void *priv,
>         return 0;
>  }
>
> +static int sun6i_isp_capture_enum_framesizes(struct file *file, void *fh=
,
> +                                            struct v4l2_frmsizeenum *frm=
size)
> +{
> +       if (frmsize->index)
> +               return -EINVAL;
> +
> +       if (!sun6i_isp_capture_format_find(frmsize->pixel_format))
> +               return -EINVAL;
> +
> +       frmsize->type =3D V4L2_FRMSIZE_TYPE_STEPWISE;
> +       frmsize->stepwise.min_width =3D SUN6I_ISP_CAPTURE_WIDTH_MIN;
> +       frmsize->stepwise.max_width =3D SUN6I_ISP_CAPTURE_WIDTH_MAX;
> +       frmsize->stepwise.min_height =3D SUN6I_ISP_CAPTURE_HEIGHT_MIN;
> +       frmsize->stepwise.max_height =3D SUN6I_ISP_CAPTURE_HEIGHT_MAX;
> +       frmsize->stepwise.step_width =3D 2;
> +       frmsize->stepwise.step_height =3D 2;
> +
> +       return 0;
> +}
> +
>  static int sun6i_isp_capture_g_fmt(struct file *file, void *priv,
>                                    struct v4l2_format *format)
>  {
> @@ -522,6 +542,8 @@ static const struct v4l2_ioctl_ops sun6i_isp_capture_=
ioctl_ops =3D {
>         .vidioc_s_fmt_vid_cap           =3D sun6i_isp_capture_s_fmt,
>         .vidioc_try_fmt_vid_cap         =3D sun6i_isp_capture_try_fmt,
>
> +       .vidioc_enum_framesizes         =3D sun6i_isp_capture_enum_frames=
izes,
> +
>         .vidioc_enum_input              =3D sun6i_isp_capture_enum_input,
>         .vidioc_g_input                 =3D sun6i_isp_capture_g_input,
>         .vidioc_s_input                 =3D sun6i_isp_capture_s_input,
> --
> 2.54.0
>

Tested on a LicheePi Zero Dock (V3s) with the ov5647 camera setup.

The enum_framesizes implementation behaves as expected and reports the
supported even frame sizes correctly.

Tested-by: Arash Golgol <arash.golgol@gmail.com>
Reviewed-by: Arash Golgol <arash.golgol@gmail.com>

--=20
Regards,
Arash Golgol

