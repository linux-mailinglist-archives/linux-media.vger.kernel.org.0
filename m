Return-Path: <linux-media+bounces-4886-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BAB9884F90B
	for <lists+linux-media@lfdr.de>; Fri,  9 Feb 2024 17:01:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3D5C61F247B8
	for <lists+linux-media@lfdr.de>; Fri,  9 Feb 2024 16:01:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E67857690B;
	Fri,  9 Feb 2024 16:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="pCB6p/su"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0388976047
	for <linux-media@vger.kernel.org>; Fri,  9 Feb 2024 16:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707494482; cv=none; b=bdfvjiptyXT63ETtvTZeQ7WEo1AfKKMa6ycLfzvgTEIDR8GNIXms5fd9tb9NsFZKCoXslW8IadiIgn+1sWfbn0aJ68wbZAz1gJQRdRbKTnUnE+lqmn6bU+fHgaBlrkPUkGGT9k7ibM3EtfXcm8buUWD6Ppoxrm8R7eA5qW1zjN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707494482; c=relaxed/simple;
	bh=kRSvUDc1g8P33OgCwZQcBF7eR90soEpnIOELLAR4YDU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=iMxceP3P/bx8f28gGqzNnK+e3edTr5l9riwiOO3jARjNLzWakB9eSOHr2zJd5+X108wsHCLtdyJ8Ep77nXBXz8F+xvG3qodXYSSZ0cy3Sik8zzie9z6ftNWQW78VlcNdzhQB2yWHScLAFOQT+v4sir82eU4UfhrjNVZhPQv8RVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=pCB6p/su; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1d751bc0c15so10768435ad.2
        for <linux-media@vger.kernel.org>; Fri, 09 Feb 2024 08:01:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1707494480; x=1708099280; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SqIoJcIV0BS1J4vZSQyB7poxgeO52uakFCxg/oqBK+U=;
        b=pCB6p/sufdjTHpHDhNlHOhNlsCXiBDo67PazhXPFpPV3U6jwDRHAgJslAYfuSrFDN7
         lo9WFq98IiKo8t5HM6ov6/2S7JDvihd0bVw1/ryddweD5QziOWKvcWs01hf/ZR5pkc4A
         4JSB3lSPGB1Z7NC2G1WQ5eL+NiwhY8U82L4HxoludWmtYdAG6ooIfw6l6FZCqZwz1dFp
         xR/HFykJUkRYyOm4FmoD2qjKZFThX/92qcqYaAgu6mE5r5WabkknrZF+lFXrO0WS0HaU
         Yr119VJpQCNQSW1RqKY8uKDkOaJ6wH0npKIb3ZyLY84WM8Fg7zYx8yqX1c7CP2erFOLp
         lHtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707494480; x=1708099280;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SqIoJcIV0BS1J4vZSQyB7poxgeO52uakFCxg/oqBK+U=;
        b=Pr80jJdr3ITiGFhto1NX99npQ3bah7+R3D+FdpVp/GQWOYU8jD6Phy7ReGYORYEZG7
         RbSDap6PWUDiYufC28nYkuaknwtwm1UQLZAtR+GwGevYCllJB7AsXK5dYL0MBXMktBSy
         0JBXn2IvuwAbPXOLVYnyAngWt8ZINNBbbzD3zG+9lpHeFKG1ptd+5oNObAtmDX48BlhV
         L2on5Knu7Ijms73fFeIKd2ucVtjeF4ce3lYpowG/rKFZX5SE0Jn/Mlbatq9KHpfDHEBS
         ipZfCfUIbXwWzM1jThN87lsHSgIfRCHI87YRaPTYE0/dSRoLAkEMYHLk2jGjynSKsMMJ
         Q01w==
X-Forwarded-Encrypted: i=1; AJvYcCUG9iNh8QVRrxEb+9bkjIo9oLoxUhruR7bN2bIJrh6p2znsZp8zYyTVuocfKQbT9cM18nPAFrJJ0lYh7BuPBxsIpSLMOBjR86yqcwI=
X-Gm-Message-State: AOJu0Ywqde1SkDhgBP5wLZx5zGavSbnfupcY3YXsb1ZdphiDVmkZVEh2
	T1BJLquMyGdzwvJPsamVwNfG+4xmYv9GmCzHH/UjtEPtoiC5P1CtryvweUvEAMOVSvzRcTYHr1P
	3
X-Google-Smtp-Source: AGHT+IHCxiwdq1AqyICEWgcxOd8oL2fEzv3LOmLoXYFg9YH6feEbBZ8B+k56z1ZqW0vKl49eSmixBQ==
X-Received: by 2002:a17:90a:a405:b0:296:c78e:c0bc with SMTP id y5-20020a17090aa40500b00296c78ec0bcmr2217128pjp.9.1707494480384;
        Fri, 09 Feb 2024 08:01:20 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXysckvy8ylEXjkzNR3bgCqJX9vpGRerf6U0c9/vp2sCWJ4U9dlzXQOH3xBl6oKHYqSDoFTEDbsPiTLWr9CHpS3JzllCvM8enB/h4k=
Received: from nicolas-tpx395.localdomain ([2606:6d00:11:3354::7a9])
        by smtp.gmail.com with ESMTPSA id pf12-20020a056214498c00b0068c8be959a0sm933976qvb.111.2024.02.09.08.01.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Feb 2024 08:01:19 -0800 (PST)
Message-ID: <f381fcc8a3daa88d822969d014eef5309fb6e3bf.camel@ndufresne.ca>
Subject: Re: [PATCHv2 2/2] media: atomisp: don't use sizeof(NULL)
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Linux Media Mailing List
	 <linux-media@vger.kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>
Date: Fri, 09 Feb 2024 11:01:18 -0500
In-Reply-To: <30f42c75-5a36-4ed0-90af-77764308f267@xs4all.nl>
References: <30f42c75-5a36-4ed0-90af-77764308f267@xs4all.nl>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual; keydata=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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.3 (3.50.3-1.fc39) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Le vendredi 02 f=C3=A9vrier 2024 =C3=A0 11:17 +0100, Hans Verkuil a =C3=A9c=
rit=C2=A0:
> Check the size of another pointer instead of NULL. This fixes this
> smatch warning:
>=20
> drivers/staging/media/atomisp/pci/sh_css.c:3609 ia_css_pipe_enqueue_buffe=
r() warn: sizeof(NUMBER)?
>=20
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Fixes: ad85094b293e ("Revert "media: staging: atomisp: Remove driver"")

You sent v2 the same day. Please have a look at my comment in the v1.

cheers,
Nicolas

> ---
> Changes since v1: replace NULL by void *, that's better than using a poin=
ter variable.
> ---
>  drivers/staging/media/atomisp/pci/sh_css.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging=
/media/atomisp/pci/sh_css.c
> index 1d1fbda75da1..938a4ea89c59 100644
> --- a/drivers/staging/media/atomisp/pci/sh_css.c
> +++ b/drivers/staging/media/atomisp/pci/sh_css.c
> @@ -3606,7 +3606,7 @@ ia_css_pipe_enqueue_buffer(struct ia_css_pipe *pipe=
,
>=20
>  	assert(pipeline || pipe_id =3D=3D IA_CSS_PIPE_ID_COPY);
>=20
> -	assert(sizeof(NULL) <=3D sizeof(ddr_buffer.kernel_ptr));
> +	assert(sizeof(void *) <=3D sizeof(ddr_buffer.kernel_ptr));
>  	ddr_buffer.kernel_ptr =3D HOST_ADDRESS(NULL);
>  	ddr_buffer.cookie_ptr =3D buffer->driver_cookie;
>  	ddr_buffer.timing_data =3D buffer->timing_data;


