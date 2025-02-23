Return-Path: <linux-media+bounces-26745-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9724AA411D4
	for <lists+linux-media@lfdr.de>; Sun, 23 Feb 2025 22:12:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 897B4173E21
	for <lists+linux-media@lfdr.de>; Sun, 23 Feb 2025 21:12:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DECF123FC6B;
	Sun, 23 Feb 2025 21:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mfZwxSW5"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE8E118C039;
	Sun, 23 Feb 2025 21:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740345138; cv=none; b=nLLJniK9a+2iQ2B6/Y2S3YJFXU2NTBj4pRyBOREx02tFkzWPJoG/bCNovuULC0VjWuDoc5sC/eO8x2OkGQlvnDhltz4EaX0bIuFiLV7esThcQDpuiAKGCirm7K6kPoeHmOsPcWvZ9Yn2yzCDfQChuFTyc6BRx1kqww2ymA/4NBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740345138; c=relaxed/simple;
	bh=rNNIUkC9BUfduMrG/HNisV8iEBRixRXLZsMHW8mqSbs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qQ19q0upm1ziDGbD83AqcqrrKMKiHw/M6PGkyMLRJcUM+tNekCHfQvWlpMHvey47GdvAgdTc8oZX3BIYYk1SDn3M5daMPAomGDY4cc2w/nQbaQi1Oq3z7aOlaRFOPDnIoUk3yketJatgeAGWQkCXmIejUqR5erJ95VjuNFK4PrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mfZwxSW5; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-520af4b872bso909182e0c.2;
        Sun, 23 Feb 2025 13:12:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740345133; x=1740949933; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bEkuOQC4KaUmGRayr/G0NKl4Sr1/JpDw8UFbys7bamg=;
        b=mfZwxSW5LuokOjJ7BIZlOyX6r3XN3G7Fsst81MHXByeM8osF/6h2ERQrMHi6fq+x3v
         6B9tfs5288KKu1AKnw56zWCGUj4U1UAqpo/1KdhZNIOPvvBdOtjURxDSc1il/zk1mXt8
         TMUzmkhIs8DEpRH4qlA3YMNTJ1O4UTM5O6WYicF0lLrQ068PMTy4en6RR3RGQF0emJmY
         W5hD33EymNfklVnqRxLlBplCVzVBw2uT/foJYnT+7P0QKOoqRBCfim831Kk9yipV7htU
         taU7nrBXP49M4VWaMKAeztpDVV5PlSslR/1Ach6oOqBonjhBj2Q6bV2G25K2YzbIN4ke
         EKYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740345133; x=1740949933;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bEkuOQC4KaUmGRayr/G0NKl4Sr1/JpDw8UFbys7bamg=;
        b=u7a5oHTqS9fJjZt+uxKCLVBbI1d6nZ+vwHlNFwDn3L8vzntn9UQ1W6YJJx/jr1P+ut
         2iObG04JgIeY9gLaHu5gstHBXNOKVgk3/sEE02egvPMwxcjobtYa3DMFmBex30v5jdaE
         drgwA7r98/a/9DltfAFVHGxQE7l83xvlvTqXHDHzcStF838nqPPvUpKURVTD+cyq6/Wq
         gT0AksAfDzoMHWNi4zy4aOerjJTJ2mS8a/J1wCFuSZ+C2hws0VMjoB+8lQ43Afhjpwox
         eZEhQOMzmSp28U/LD7khgYNPw4E0VbIDdtlca0c4q+l2PGDp7sm0f7+D2g68heiLZZXf
         sC5A==
X-Forwarded-Encrypted: i=1; AJvYcCUzrWOD34kZIfR0P8R0Symjpl5YNAAjzCghsjzJ4YiP6B95zoSqXXa79jJSyPvLAjtu71mkmVCM0Vz3@vger.kernel.org, AJvYcCVAfuBX/cakqEbmgfRgqtlRWlJGkJoCZePM1QryVFHTId3/5V2RVXdsNxovuUrexXpaaJPgyQy2hl0VHZaA@vger.kernel.org, AJvYcCVeeUWrgCZ9NIk2EoGUMoJrtM5EoG8MwYRT28bL6UVZ1Ohk5YeSxgM57LyFMyZRyGC6VDZV8rx6P5FhrTouZjd6UY0=@vger.kernel.org, AJvYcCW8cVgeoWVFIr9be1s3K5pAQUqL7f5TOU14IbTGj2xaAH1wz5bTz/yE8beuibXgVfXIFY2fDQabffGPj84=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFlLejttdVcEy3QzqUKvLMcgGTqHuoGGACvhoWq3XDD0pPKFzE
	SPFZHi3//M61+Pk9EqxkHBeuBKysXhMKY73yhq8AovkAqs/MnKpxqDEvEvO+Lit3nwAL5oejhEC
	t/WjI/cmvbn3dRxW/Wfs/7Mdnb6k=
X-Gm-Gg: ASbGncshza8mlhnT+RvTi5aG7xG8tVqCOhx3ZVqJWjIwRAlyLnlPIsXMeouhWblMCXU
	2H7TTk6zOiY9WWLx5OqcKOzLYfORCU6oPT8+m8fqpOmAxntbT2jcsCiL9QgOCZ91/AIOzeodhYq
	X5M0LSHg1APRcEQTJ3wNxr/2D483LNZ1ECo7uCFX4l
X-Google-Smtp-Source: AGHT+IH/PaBFvaKmTFkJmjZxggUGCmcmIkH/7HQYfOldrkh2mI4nX9kTZfzuSEaxG9TJ6WYxovtUdxGk/U3wrLmh5wY=
X-Received: by 2002:a05:6122:3903:b0:520:3465:7302 with SMTP id
 71dfb90a1353d-521ee2a27c3mr5526233e0c.5.1740345133618; Sun, 23 Feb 2025
 13:12:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250221155532.576759-1-tommaso.merciai.xr@bp.renesas.com> <20250221155532.576759-3-tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <20250221155532.576759-3-tommaso.merciai.xr@bp.renesas.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Sun, 23 Feb 2025 21:11:47 +0000
X-Gm-Features: AWEUYZmCzrsfA0UfzLomEKReTQqdM-O3HHhbBv3dNv7PWwcF37b1E9mbFQiElx4
Message-ID: <CA+V-a8vvPm8hGM9Um80ah_L_Rzogmt69UXuKW1T7dMjgYm76TA@mail.gmail.com>
Subject: Re: [PATCH v2 02/18] media: dt-bindings: renesas,rzg2l-csi2: Document
 Renesas RZ/G3E CSI-2 block
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org, 
	linux-media@vger.kernel.org, biju.das.jz@bp.renesas.com, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Tommaso,

Thank you for the patch.

On Fri, Feb 21, 2025 at 4:04=E2=80=AFPM Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
>
> Document the CSI-2 block which is part of CRU found in Renesas RZ/G3E
> SoC.
>
> The CSI-2 block on the RZ/G3E SoC is identical to one found on the
> RZ/V2H(P) SoC.
>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> ---
>  .../devicetree/bindings/media/renesas,rzg2l-csi2.yaml          | 3 +++
>  1 file changed, 3 insertions(+)
>
As pointed by Laurent, with below added to resets description,

- description:
      CRU_CMN_RSTB reset terminal (except for RZ/V2H(P) and RZ/G3E) or
      D-PHY reset (for RZ/V2H(P) and RZ/G3E).

Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar


> diff --git a/Documentation/devicetree/bindings/media/renesas,rzg2l-csi2.y=
aml b/Documentation/devicetree/bindings/media/renesas,rzg2l-csi2.yaml
> index 1d7784e8af16..9b7ed86ef14b 100644
> --- a/Documentation/devicetree/bindings/media/renesas,rzg2l-csi2.yaml
> +++ b/Documentation/devicetree/bindings/media/renesas,rzg2l-csi2.yaml
> @@ -24,6 +24,9 @@ properties:
>                - renesas,r9a07g044-csi2 # RZ/G2{L,LC}
>                - renesas,r9a07g054-csi2 # RZ/V2L
>            - const: renesas,rzg2l-csi2
> +      - items:
> +          - const: renesas,r9a09g047-csi2 # RZ/G3E
> +          - const: renesas,r9a09g057-csi2
>        - const: renesas,r9a09g057-csi2 # RZ/V2H(P)
>
>    reg:
> --
> 2.34.1
>
>

