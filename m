Return-Path: <linux-media+bounces-57652-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eOTCOkWdymmg+QUAu9opvQ
	(envelope-from <linux-media+bounces-57652-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 17:56:53 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A345D35E41D
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 17:56:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F16A4302A1AB
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 15:51:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A881374E73;
	Mon, 30 Mar 2026 15:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EURFnuaN"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 173F3374185
	for <linux-media@vger.kernel.org>; Mon, 30 Mar 2026 15:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774885907; cv=pass; b=qr9G4m0PXJwBXbjkpjlEN/2Baq1TtiyXmpl9sFc/1RBt6oN/EISfAWcPU1QwBZC4ZyjmZe9TpPoCrKguHyDPax/TDbFe1CgCgQbz7ZeJlf9D3eDU7F7Du2IfXixTZtp7+nvjCsh/exX5B5PFLTeGRYIA6rarp74uBfFlFa6TcHQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774885907; c=relaxed/simple;
	bh=MEXzZl9zYo7dl9SxQcq1eH2lWQCMdjTITE9iYPn2xDE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KVaT1U8HEe0xcJxgoJZmQP2KoDRIWOla5vZsng4s9qfNUTjBAo3wNriajrfGp9giNCuL6kKqXVQLgyyC1h5ctdlFiacka/CAZSUQi7oNCLNbO/bIn+tItuRwRGQ6v9tMILA9qrp42gndVLdC/3LCEIPsWkU7W2bzyQ/k3LNxQc0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EURFnuaN; arc=pass smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-43cf7683a28so880978f8f.2
        for <linux-media@vger.kernel.org>; Mon, 30 Mar 2026 08:51:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774885903; cv=none;
        d=google.com; s=arc-20240605;
        b=Nh8WLVjQmOu2iY9lnCmUdt+1ffMQR3K7z1leck97G5mazmQuFmMz9R8gHv1CZq49vT
         r1fBM08yno5XNfkN0JxI4qNNJTqxyN6ocLWHWuMDTrBRvn7J8sf9J8ANJgIsl81TS4mv
         9JZnLJn0yF/MGf1ZGZqteM6jeprGiHimp6rzAQsR5ViynhA2bY6isxOniBEw+yWK0Fc5
         GnCGty8dDe1cpE9YUB64fgEoaMMvUPRXa+KST5RLvi1gICkXUJm5CUMlEc40Wrh06vLS
         XiFerenbywnFGM6Ys1/tjpTuhkvw+35jXX1wT/AGV/TIPkaP9NYfRO8u8kZ15Pnl1IDN
         4fgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cXaIcPsqvcDWr494pHn/UVT9pyr634NTh1L5DdSP0OA=;
        fh=EyehCfeNgvYDPMAUp6zj4aInpk6MHH1zYqeu040lzOI=;
        b=Fcl32zp8pWfXV/D5LsBFQabCotJ60XUT+ct8dZLPICWTEtzEM01iMcsBc8hrMJo88l
         P7/VrXWMI2AYhOopJz9tnpRSL+PHJJ3x6DLCdChl18AFuVh+v+xmfzo+dAn7x2CIFvVb
         R/isOfffgRJK/qRfm2I20pxfd5W6x5xBnc8G2sevtgbwT0DdwKRGrxzRdRkcxBCuftCN
         UhlUvMXqqR/l+IBCRHQT4ZaGVi7Q35huSVUceBNok36xqT3Bj5xVJUWzE2/IbeB7u7oa
         BfYhSxFdyqGePbAUkdkyXbUwqB+LHRSDbVD8iC+UQU3S7Y5Tv7EVKwjvx5UUBYyCxUqU
         KgKg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774885903; x=1775490703; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cXaIcPsqvcDWr494pHn/UVT9pyr634NTh1L5DdSP0OA=;
        b=EURFnuaNjsL0RRuFkdRfetcQH621KtICTlEcgGPqklzVlcMuvK+7ZWxdC+V+kqWNyN
         GMhIMxq/M+bSLREoehDk4B9Mfz5XvH83+SS+Xoavgs54paSpanqXBfqEkeksXtot10jH
         BVbgzDOi3LZW1xqtNXSS0D2Yznp7MUmuK3DqxlSCGXQ3/iQQoAlgAefB9fO9dmC2kOAX
         BfcrvL1olC/xOaJR8epK/DHXdUhZjhaYjNyGHgY6DT6L46oj5w/L/ZeVAAbK1eTRhfeZ
         qPQhseKUoVy+RLQYMAUqLa4rJ4FxIDre2JEcZ+xV3pL9pV2MarLoUgkomDZIlBtlKl1x
         +2tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774885903; x=1775490703;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cXaIcPsqvcDWr494pHn/UVT9pyr634NTh1L5DdSP0OA=;
        b=fVc/cIwJ2XY7BSTLceCpKwndRiFEfd/q0nJxevKT0k7mai2mc7EV+y/KwDDFW91FQY
         hpCuy27GEqiqcanxM7bRQ5z9zZxzKghSaHGAmhteFSM74/1AYfp04WsWQqEoNcF2EH/b
         YckfJzfrPWm6IGkPx2DYau7MPvh8k2cggEDhkJLlofyTrnG1M7Ekqh4kmXwJ4CBCjEx+
         tr9HqzVhI2GrPONWUhFgkH9NcpkDCjBsE+mPTBz0Gc9GkuzYQLg/aEqQpcK14wOjDFNW
         bKpFXD04dK6PKCBO7oTiaYLjc+aSyApmvGIvY4XR0NeGsCdX6npmYS0aLSfgXtJq7ivt
         xj3Q==
X-Forwarded-Encrypted: i=1; AJvYcCUVgfMWaIWOPEmWnHu3rzdwThzcywcfh58Ui0vEI8TzXCsQreA8lvc5ESlzY0kfc29mD2jmYl0hiQaE6Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyH5L2XiOlhXngyD57CH8e7QrAfLZA5LBsjhAERSmMs3TiCTPvP
	45y5UnKJ9fkVgEbtTw+HFu6/Q/zEWLBLbss1NJz/Uy6rpYTXh8nupC3u7sW9oufuCCN1kNIBbK3
	BG3wpme1EaIM+4voaDf7QfRl02VSy9mM=
X-Gm-Gg: ATEYQzzNaXT7uHLKjzvBkgNbEXFcWlhhqJk5LSwJI7OMHdCZSd/lMaNVsEyLQjlVSGv
	YSlluczrfKgfvPQ9nay5YUgOKqZwuGXI1jTSRGYR4hzV2DdJwRXNzuK3TSYpfsKBTBxPN2A6iNV
	AG8Kz9iMMbSAs6FqCz4eTQLqAZNHxYV8jyC5tMfJPN23EqvXWSyRpMzZq/QaBb2uaFNKqyzvH4R
	7NkhOY0SJNy26uvSEzhQu3l/zrJxPBzHwven11bpjZS/A5QiEZBFOI1FN2xJ0lRh/h7yMVGGjK2
	XCv2hDS2KBDzbuf5TtB84caxsekClK2z1W9xWxNqMC2JU5CZev46skdzusAoE1xL0hZK6A==
X-Received: by 2002:a05:6000:2f87:b0:43c:ff58:35c8 with SMTP id
 ffacd0b85a97d-43cff58375fmr8080335f8f.28.1774885903245; Mon, 30 Mar 2026
 08:51:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260327-b4-cru-rework-v1-0-3b7d0430f538@ideasonboard.com> <20260327-b4-cru-rework-v1-1-3b7d0430f538@ideasonboard.com>
In-Reply-To: <20260327-b4-cru-rework-v1-1-3b7d0430f538@ideasonboard.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 30 Mar 2026 16:51:17 +0100
X-Gm-Features: AQROBzAQZjNwjpdVDrkveGXGjVD9jBNGNwrMZvK6vhHbZvqMcgOnf3rHRqmwidE
Message-ID: <CA+V-a8vYWH0NULkJtiLgxbeZayQ3V98JrCeeG9QYfXQ2W1jXDQ@mail.gmail.com>
Subject: Re: [PATCH 01/14] media: rzg2l-cru: Skip ICnMC configuration when
 ICnSVC is used
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, 
	Daniel Scally <dan.scally@ideasonboard.com>, =?UTF-8?B?QmFybmFiw6FzIFDFkWN6ZQ==?= <pobrn@protonmail.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
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
	TAGGED_FROM(0.00)[bounces-57652-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[kernel.org,ideasonboard.com,bp.renesas.com,linux.intel.com,protonmail.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-media,renesas,cisco];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,ideasonboard.com:email]
X-Rspamd-Queue-Id: A345D35E41D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 27, 2026 at 5:19=E2=80=AFPM Jacopo Mondi
<jacopo.mondi@ideasonboard.com> wrote:
>
> From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
>
> When the CRU is configured to use ICnSVC for virtual channel mapping,
> as on the RZ/{G3E, V2H/P} SoC, the ICnMC register must not be
> programmed.
>
> Return early after setting up ICnSVC to avoid overriding the ICnMC
> register, which is not applicable in this mode.
>
> This prevents unintended register programming when ICnSVC is enabled.
>
> Fixes: 3c5ca0a48bb0 ("media: rzg2l-cru: Drop function pointer to configur=
e CSI")
> Cc: stable@vger.kernel.org
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> [Rework to not break image format programming]
> Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
> ---
>  .../media/platform/renesas/rzg2l-cru/rzg2l-cru-regs.h   |  1 +
>  drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c  | 17 +++++++++++=
------
>  2 files changed, 12 insertions(+), 6 deletions(-)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru-regs.h b/=
drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru-regs.h
> index a5a57369ef0e..10e62f2646d0 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru-regs.h
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru-regs.h
> @@ -60,6 +60,7 @@
>  #define ICnMC_CSCTHR                   BIT(5)
>  #define ICnMC_INF(x)                   ((x) << 16)
>  #define ICnMC_VCSEL(x)                 ((x) << 22)
> +#define ICnMC_VCSEL_MASK               GENMASK(23, 22)
>  #define ICnMC_INF_MASK                 GENMASK(21, 16)
>
>  #define ICnMS_IA                       BIT(2)
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/dri=
vers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> index 162e2ace6931..6aea7c244df1 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> @@ -262,19 +262,24 @@ static void rzg2l_cru_csi2_setup(struct rzg2l_cru_d=
ev *cru,
>                                  u8 csi_vc)
>  {
>         const struct rzg2l_cru_info *info =3D cru->info;
> -       u32 icnmc =3D ICnMC_INF(ip_fmt->datatype);
> +       u32 icnmc =3D rzg2l_cru_read(cru, info->image_conv) & ~(ICnMC_INF=
_MASK |
> +                                                             ICnMC_VCSEL=
_MASK);
> +       icnmc |=3D ICnMC_INF(ip_fmt->datatype);
>
> +       /*
> +        * VC filtering goes through SVC register on G3E/V2H.
> +        *
> +        * FIXME: virtual channel filtering is likely broken and only VC=
=3D0
> +        * works.
> +        */
>         if (cru->info->regs[ICnSVC]) {
>                 rzg2l_cru_write(cru, ICnSVCNUM, csi_vc);
>                 rzg2l_cru_write(cru, ICnSVC, ICnSVC_SVC0(0) | ICnSVC_SVC1=
(1) |
>                                 ICnSVC_SVC2(2) | ICnSVC_SVC3(3));
> +       } else {
> +               icnmc |=3D ICnMC_VCSEL(csi_vc);
>         }
>
> -       icnmc |=3D rzg2l_cru_read(cru, info->image_conv) & ~ICnMC_INF_MAS=
K;
> -
> -       /* Set virtual channel CSI2 */
> -       icnmc |=3D ICnMC_VCSEL(csi_vc);
> -
>         rzg2l_cru_write(cru, info->image_conv, icnmc);
>  }
>
>
> --
> 2.53.0
>
>

