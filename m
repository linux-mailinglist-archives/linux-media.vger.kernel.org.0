Return-Path: <linux-media+bounces-24534-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C8CB3A07897
	for <lists+linux-media@lfdr.de>; Thu,  9 Jan 2025 15:07:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 074E33A44DD
	for <lists+linux-media@lfdr.de>; Thu,  9 Jan 2025 14:07:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3766721A437;
	Thu,  9 Jan 2025 14:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="pRSqPvf0"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1934C217658
	for <linux-media@vger.kernel.org>; Thu,  9 Jan 2025 14:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736431622; cv=none; b=MfbpheCahUjBFptDfxNV28tXE/HDUZd/e6vwpXfvk5vt7eSPLZQknpFKKTXQAzqPOzmJHhEc8e8/FQ32UF0ZYvZR5/gvPdcYXfrLpM1wHuRksRKuFUT679JZYloaGR2bbryZrB6sX2CzRnOvOxASe0t/IG+4JOjYA7XDHwNbZho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736431622; c=relaxed/simple;
	bh=Ym1yDocfM13GAXNnJN+26yjZUBZZ3aFj68yIdbE9lfY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WfA3IHVpZX62CyJtwN9Y4h+DsXTqg313FRlZZYd5z4cSvaS1QKBf/YStYM4Y0ywCBJjWW7hlGbWxYgbyAp5hbudMG+djYiJttvt4G4zFDGG3sjryXpqSl/OtNCforNfDbcEoG/66CqtZx06KRlgDDu6UrSBapfDmdHwQ2HGNDs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=pRSqPvf0; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7b700c13edaso49213585a.3
        for <linux-media@vger.kernel.org>; Thu, 09 Jan 2025 06:07:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1736431620; x=1737036420; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=bywW9vMeiiYOYy2QNzu7ZKqXWuFCGn5oBIdbY0P2hyg=;
        b=pRSqPvf0JjzAAh42MC3kLlu9ZH8Yx9NH5Iqvr5cdeKRBKwK+6W/r3T0K7WTKUUTRbD
         vNgCDwhcMQNSGN/SiIb+OhMsRvmAXr1p1o/+45OEdnmVvNuj44BNgkP+y/motY7lMUay
         x71WWsExf9DMToEjzy6UApIVeBSQySwc32AUEjF5VJ+PVeLhDLaUcK7GW1UetNN0I71B
         omEtUTugBw1G1PayiX28W95IDPo5HraRLByFyyH5Km5ZruZq2PiywaznhaksvYl1QJ8+
         yIQbQCE5e+6KOys+daNY+HlbgjYUfln9zCw8ZIoS6NcB7RLll0TyNQSNfjYPHxMHneqx
         SXwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736431620; x=1737036420;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bywW9vMeiiYOYy2QNzu7ZKqXWuFCGn5oBIdbY0P2hyg=;
        b=w20ayx1UadrnMc/VlRLiT991K2U+7ZfA+BUPfC28SA8Y4NDH+iK4oX9Oz0mPxgOzyd
         QCpvTU+rKC5STnvnR1ASSshvpAZzzMC2T6g1SvVzikBw5CzXGuRj85GPjdNdbDNcp8xy
         /fy1ubxQte14y59NGIgvvWw4LqePiPrzMwHUrc9/azLcmRgb0Ez3z7nE252o/OUvfLjR
         Nbld0JsXQVHP2yQtgb+uEC/qjm15NSdNmLplGHIpujjyieW/yiRDxJYvO3fn5Si5W3TA
         /Gl6anLdK+/2MRa6UPfzs11gOPetgHFQWnX6WJc+qvw7ZUqt7TFi0iEzuM4bGU8MkPxX
         1Xew==
X-Forwarded-Encrypted: i=1; AJvYcCVQlZ+CXbgSbLJBtaxmr7sidJxwCtwXangy/8tGuJx3uxXOk0NIfwT2utsTY3GE4dmR+SE0sIffudpbvQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxJN/AU5XzwyU/jSYWYV+wj/mY8bAMxbZ7ILyAF2F0XUujFhuj7
	Rr+lPFacukhmftnS234HgnZkMAp094hhQMWCbW8tgJ2PElffnMlXpS3+Y1nkDm4=
X-Gm-Gg: ASbGncsviDW9y4I0OaADegtNi4dxzqx2PI7SUfIqHvD65/kSsWEOGvDIyD/EMplGc3e
	ZrRJGcWvhEdhWBKuFBm/jOntoHNFJWb6FqoGPLWC+/0ROWXzN66SLftOi1D9OiFbS6zRj9eSzin
	AQME8zMG14bvaYfMSom+bYmxJT7hlK5es5A0NmregVpZtp3krt/aeR4frkhnVPFdZ6PnQn74KI6
	X0UHtSekCRFWpMtvZGpsHXkQjgeXnceLNoBo32pG9m35rnOFBM077obww==
X-Google-Smtp-Source: AGHT+IEscSxY4Do3TXZ6G7JOMUAekHEsOUeBZGyyHfF7ljBFczTdIIJ78AZHYR6zSk6tQnyqAKAV5A==
X-Received: by 2002:a05:620a:414a:b0:7b6:dddb:b88 with SMTP id af79cd13be357-7bcd976277dmr964450385a.38.1736431620006;
        Thu, 09 Jan 2025 06:07:00 -0800 (PST)
Received: from nicolas-tpx395.localdomain ([2606:6d00:15:862e::7a9])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7bce327bb28sm69478785a.64.2025.01.09.06.06.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 06:06:59 -0800 (PST)
Message-ID: <c67ebf846d19086586b00d1d79252c8296a704b5.camel@ndufresne.ca>
Subject: Re: [V1,00/12] Enable jpeg enc & dec multi-hardwares for MT8196
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: "kyrie.wu" <kyrie.wu@mediatek.com>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>,  Mauro Carvalho Chehab	 <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger	
 <matthias.bgg@gmail.com>, Tzung-Bi Shih <tzungbi@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>,  Bin Liu <bin.liu@mediatek.com>,
 kyrie wu <kyrie.wu@mediatek.corp-partner.google.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Date: Thu, 09 Jan 2025 09:06:58 -0500
In-Reply-To: <20250109133513.20151-1-kyrie.wu@mediatek.com>
References: <20250109133513.20151-1-kyrie.wu@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2 (3.54.2-1.fc41) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


Hi,

Le jeudi 09 janvier 2025 =C3=A0 21:35 +0800, kyrie.wu a =C3=A9crit=C2=A0:
> This series adds support for mt8196 multi-hardwares jpeg enc & dec,
> by first adding mt8196 jpegdec and jpegenc compatible to install
> kernel driver. Add smmu setting to support smmu and iommu at the
> same time.
> Secondly refactor buffer and clock setting to support multi-hw jpeg
> working.
> Lastly, fix some bugs, including resolution change handleing, stop
> streaming sw flow and others.
>=20
> This series has been tested with MT8196 tast test.
> Encoding and decoding worked for this chip.
>=20
> Patches 1-3 Adds jpeg encoder and decoder compatible.
> Patches 4 add jpeg smmu sid setting.
> Patches 5 fix jpeg hw count setting to support different chips.
> Patches 6 refactor jpeg buffer payload setting to handle buffer
> size bug while resolution changed.
> Patches 7 reconstruct jpeg dst buffer layout.
> Patches 8 fix multi-core stop streaming flow
> Patches 9 refactor multi-core clk suspend/resume setting
> Patches 10 fix decoding buffer number setting timing issue
> Patches 11 refactor decoding resolution change operation
> Patches 12 fix remove buffer operation
>=20
> ---
> This series patches dependent on:
> [1]
> https://patchwork.kernel.org/project/linux-mediatek/patch/20240808092555.=
12999-1-jianhua.lin@mediatek.com/
>=20
> kyrie.wu (11):

would you mind fixing the --author in your configuration, write your name
instead of your user name. UT8 is allowed, many people will use a ASCI spel=
ling
(some approximation) and then add their real name in parenthesis.

regards,
Nicolas

>   dt-bindings: mediatek: Add mediatek, mt8196-jpgdec compatible
>   dt-bindings: mediatek: Add mediatek, mt8196-jpgenc compatible
>   media: mediatek: jpeg: add jpeg compatible
>   media: mediatek: jpeg: add jpeg smmu sid setting
>   media: mediatek: jpeg: fix jpeg hw count setting
>   media: mediatek: jpeg: refactor jpeg buffer payload setting
>   media: mediatek: jpeg: refactor jpeg dst buffer layout
>   media: mediatek: jpeg: fix stop streaming flow for multi-core
>   media: mediatek: jpeg: refactor multi-core clk suspend and resume
>     setting
>   media: mediatek: jpeg: fix decoding buffer number setting timing issue
>   media: mediatek: jpeg: refactor decoding resolution change operation
>   media: mediatek: jpeg: fix remove buffer operation for multi-core
>=20
>  ....yaml =3D> mediatek,multi-core-jpegdec.yaml} |  10 +-
>  ....yaml =3D> mediatek,multi-core-jpegenc.yaml} |  10 +-
>  .../platform/mediatek/jpeg/mtk_jpeg_core.c    | 126 ++++++++++++------
>  .../platform/mediatek/jpeg/mtk_jpeg_core.h    |  17 ++-
>  .../platform/mediatek/jpeg/mtk_jpeg_dec_hw.c  | 116 +++++++++++++++-
>  .../platform/mediatek/jpeg/mtk_jpeg_dec_hw.h  |   4 +
>  .../platform/mediatek/jpeg/mtk_jpeg_enc_hw.c  | 113 +++++++++++++++-
>  .../platform/mediatek/jpeg/mtk_jpeg_enc_hw.h  |   4 +
>  8 files changed, 343 insertions(+), 57 deletions(-)
>  rename Documentation/devicetree/bindings/media/{mediatek,mt8195-jpegdec.=
yaml =3D> mediatek,multi-core-jpegdec.yaml} (95%)
>  rename Documentation/devicetree/bindings/media/{mediatek,mt8195-jpegenc.=
yaml =3D> mediatek,multi-core-jpegenc.yaml} (94%)
>=20


