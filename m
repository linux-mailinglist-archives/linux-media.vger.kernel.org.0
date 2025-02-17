Return-Path: <linux-media+bounces-26235-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 47CD9A38B73
	for <lists+linux-media@lfdr.de>; Mon, 17 Feb 2025 19:45:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 67C98188F4DC
	for <lists+linux-media@lfdr.de>; Mon, 17 Feb 2025 18:45:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAEDE236455;
	Mon, 17 Feb 2025 18:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="rZjlHNrw"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5CEF22A1E6
	for <linux-media@vger.kernel.org>; Mon, 17 Feb 2025 18:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739817923; cv=none; b=Lxsh2Lc5n1sCLW8J853puFBOrZYtesj+I1d6eSu85tyDpC88m/gSG78ryCNql6iSdaAW/h/z1ind793S8aXCnPgo790enI4dGex0a/YBSQt8EteNWVbyzu9gZ9Mlkafb0vh+2xAQoJ0m7f3ft9ZdNPekROXNkGC/nMJV3dvZIxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739817923; c=relaxed/simple;
	bh=LzTuepUtd8P/x0Dhdu8adn7QZcKomrDCsoqReLgD7+w=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=uFkRrcYPCUGTRaw1R0Fu37EoXgbLd7Toy9KpPeP+kdI4EXO/bYCD0FduJZeNEDPWB7RdA+vBLC3IIH4nWG7gd8ZTXebKUUqbC1INqZE1Kqm+PNlS5mWp76K5Knv4ox9UG6ShKcuOy+NCZljE1RBgMhBJgn7d6vDP4Z0mytlxiy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=rZjlHNrw; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6e660740061so42947866d6.3
        for <linux-media@vger.kernel.org>; Mon, 17 Feb 2025 10:45:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1739817920; x=1740422720; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6L6CLEKqcPrRJhrzPfeseJlwds1PXfz2BxfcoLKD2Oc=;
        b=rZjlHNrwBnniP0HnHM9aipkMlrQ7LHVywmUvQl27tDnHcGFoC9epcoF+2JVPhisGDt
         30x0Hn1WNRN3VO683q9o/p93xT7+k0sgTvKtlcFUqqyDFa+tT6w4eaBWqouYgxdnJfU5
         l6NmT2Wvi12pOIA7+sP8D+1rXjSUOaxk0Mbk41+b9uvHgqZ8HFAQaLMxMQEB6vrWz5VI
         lTyVZyjYGhC4Q8pIZh/Zsoc0tnQCRdjXNHsFPZ+VPFWIQsxzjgpxgdnjydtHDfHoXMm2
         XWcPoI6CpCDcXZfKVwZiozUOi9PS4BomavjTPjkusmovkVve+01K36eLarxJ22JLZhrc
         6iYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739817920; x=1740422720;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6L6CLEKqcPrRJhrzPfeseJlwds1PXfz2BxfcoLKD2Oc=;
        b=P61fHleQM56wb/7ZJUU4UuYsxI1nButSLPwzNuEv3ekLCVOS8DVZybkjaYFkSF56qs
         X1mS++gmIyQzp9Ib9MXrrXsv31gj5NsJ6mity7UAMa4cHnKPcCu0+DL4mb34pXjNwhky
         GZsBcvvwdrCSJdycKIou/DryhGerD/wKA+zFpGSXgZqVVRAWQyG17sU1i1JDZBm6emRO
         sfcSlAUSetOCsEhbZM1LMOOE59Jl5UR/C6Q6kJgULSq7GH+w+b8P/kUCNjyiVw/hiPSN
         atwT4R57ybNQDqtJAZ8dvN9y4dPUzTy5rO++fE0QzoFXi1fEclYNXKo+aPJUxvyYAhNp
         2pyQ==
X-Forwarded-Encrypted: i=1; AJvYcCW54c8Vh6+JXJ9L/MPW27w63YG5/G5gW3RgQJSe/D1gkm4HZ+JA+3bppDWHKPFnjQbONjNwOYA3rF0ZPg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxiBYTJE1jKKb85Gq3utftB+xFQKUHPv6aj11Z+jUBWfJ3Ulyg1
	S0QYEPHebQlTXkRYM7ARoOb9rCePusAh2HBAZu7u6VN5MB/qCbpQMZ/fTUgsPIM=
X-Gm-Gg: ASbGncsDoijGs+5/wtIU2F+APmY5sy5kgR8ZxP72mn4qmNLzP5kfkF+ePXz+r2UiJZQ
	CD+yK3HS/f4s9W0Rt4e4Twp6SkomUjNJo4Oi6WFJZZ7T/aS7G/O0qLrdEFL8kgDR9E20VDO4KDL
	7ibInb7vePb8OaHjFwjhYkiZUut6RP0Jpkav1ryXIZulU5BbFHsSyzt+RKmEsrI2TF3XhUvGTBR
	qh2zxvFzXBMdybA7+FySs+4Tf+klar55SDP56JzEH3lIkTuZcfScFbaHQRRlHTB776BdxI+9Oh+
	8vbHJlt1lL1vPk58mq3f
X-Google-Smtp-Source: AGHT+IGNdl7vF080sQ0ioTe7+4SN17jK4snwRBjBnucmBNF6nJHjI5dIs2Whm+kD76Bwzk4VXdCbEw==
X-Received: by 2002:a05:6214:1bce:b0:6e6:6711:d7f1 with SMTP id 6a1803df08f44-6e66cc865b6mr166508596d6.8.1739817919179;
        Mon, 17 Feb 2025 10:45:19 -0800 (PST)
Received: from ?IPv6:2606:6d00:11:e976::5ac? ([2606:6d00:11:e976::5ac])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-471f0bfe304sm14136191cf.55.2025.02.17.10.45.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 10:45:18 -0800 (PST)
Message-ID: <f257832e823d23c8324a9eaf7890dd4b6d50a6f0.camel@ndufresne.ca>
Subject: Re: [PATCH] media: mediatek: vcodec: Enable HEVC main still picture
 decode
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Nathan Hebert <nhebert@chromium.org>, Yunfei Dong
 <yunfei.dong@mediatek.com>,  Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Date: Mon, 17 Feb 2025 13:45:17 -0500
In-Reply-To: <20250211-enable_hevc_still_picture-v1-1-0c06c0c9add2@chromium.org>
References: 
	<20250211-enable_hevc_still_picture-v1-1-0c06c0c9add2@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Nathan,

Le mardi 11 f=C3=A9vrier 2025 =C3=A0 16:34 -0800, Nathan Hebert a =C3=A9cri=
t=C2=A0:
> Mediatek devices that support HEVC also support the main still picture
> profile, but today, the main still picture profile is excluded.
>=20
> This removes the skip mask for HEVC, and enables the main still
> picture profile decoding.
>=20
> Signed-off-by: Nathan Hebert <nhebert@chromium.org>
> ---
> On Mediatek devices that support HEVC decoding, HEVC Main Still Picture
> profile is also supported by the SOC and firmware. However, this
> capability is turned off in the vcodec driver.
>=20
> This removes the code that disables HEVC Main Still Picture profile
> decoding. Validation of the decoder has been done via V4L2-backed
> Android CTS tests on an MT8196 device.

While its nice to know that you are working on upcoming SoC, we need
confirmation that this is working on all the upstream stateless
decoders supported: 8183, 8186, 8192, 8195. Ideally testing on 8188,
which I can see has merged support without the linux-firmware file to
go with it.

I'll wait for that and Yunfei's ack before picking it. Yunfei, please
fix the situation with 8188 in linux-firmware, and CC me.

regards,
Nicolas

> ---
> =C2=A0.../media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless=
.c=C2=A0=C2=A0 | 2 --
> =C2=A01 file changed, 2 deletions(-)
>=20
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_de=
c_stateless.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_d=
ec_stateless.c
> index afa224da0f41..d873159b9b30 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_state=
less.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_state=
less.c
> @@ -152,8 +152,6 @@ static const struct mtk_stateless_control mtk_statele=
ss_controls[] =3D {
> =C2=A0			.id =3D V4L2_CID_MPEG_VIDEO_HEVC_PROFILE,
> =C2=A0			.def =3D V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN,
> =C2=A0			.max =3D V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10,
> -			.menu_skip_mask =3D
> -				BIT(V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE),
> =C2=A0		},
> =C2=A0		.codec_type =3D V4L2_PIX_FMT_HEVC_SLICE,
> =C2=A0	},
>=20
> ---
> base-commit: ffd294d346d185b70e28b1a28abe367bbfe53c04
> change-id: 20250211-enable_hevc_still_picture-26b35eb08270
>=20
> Best regards,


