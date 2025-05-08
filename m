Return-Path: <linux-media+bounces-32061-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 26AB6AB05C2
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 00:00:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 766DD4E6910
	for <lists+linux-media@lfdr.de>; Thu,  8 May 2025 22:00:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BDB0224AFE;
	Thu,  8 May 2025 22:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gutgaRnf"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 301CC202C5C;
	Thu,  8 May 2025 22:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746741621; cv=none; b=ShnZlMtJb908ZF5fSxSZF55q3dNwH6OmKVtbpl1Esgr4zxNiplPT1N+CvqkC/1m8UXWapr3TRmetQi6ITArJl62VfmAsx0JOa5a9r2RgisK9zrdhscqkfOODRWgF/K5Cv/UAeEPhLq6fPsxy8z2eHcNiJzDaGnBubWbV5LJfFxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746741621; c=relaxed/simple;
	bh=KVvgX9Sz//6c92uZjhQoPSnIEHvJqDAnUBmUV/6XQAg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o7536Uy7yeJvEGvLOs5xRFBqWHGNHS36AuJqDndbfK6ZBDi1+QlkDSV91ydTQmEULO/9jInoKu9r9Uj4Qw/NQOJEitstv3BqnoBaA9lrM32xyOuzoGfJ7fq53acCXrcELrMRZBqdpgOjo0wPJPDSsp3lCzhfFRNWmdRxrNoUZ2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gutgaRnf; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-440685d6afcso16129675e9.0;
        Thu, 08 May 2025 15:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746741618; x=1747346418; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jFPptVlWELbngFMrThLLYDU5tK5YqcQQHLUB6h2bqos=;
        b=gutgaRnf5Qc+LAZCULIrIpdVDJH2TEmuP3+Gh7Z+2XopBIhU8pmxY64u2zJduP9+wH
         Y6HL4RnI5Y5qq1KZ/43jJZPFbE8DmFJX2JsuFGBJEJEVoWQLl5k7snTI5PmjVg/ruA2r
         oZdAniWueKygKm35f/JjwcAYfo4fjY7vjXqM3XzKjE1bvVXMZGyS3evNADZGbmRQzXg2
         o8OrRz8toe889rojHunhUDvJmed7YyKs9I47ZCiJncYhWdYUo58mwjRxyfoeKCZA1E2g
         pHxInrWoa2DYxJ7RN8CUSKCBifqtqtkDvNp8MfXxMfy77r+/89BxBuLaeOUQVQnfNXsz
         3zEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746741618; x=1747346418;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jFPptVlWELbngFMrThLLYDU5tK5YqcQQHLUB6h2bqos=;
        b=YsxYANGbj71b6G9iASuugV0TvXy4TC5uZa7ZJcTd+WpJVX8Jz7sbmSoAyguHhOvtQj
         wxHpragEPc7FNubH3TvdVd9MbyOCBEtvNNm9GXzwT/eggqyAMjIwu+QvzZnn18A7C5pL
         xgHOTQn1gMl2uoHbcrGlnlxHdzgUOBdAVvCtehwQ+s6dVz85nrDKWfh7rEXrALMZGvZa
         j+9T1Nc/qNweSZIN0J2K4J9BOYjeAWaHobQofD4MdavJMHxSTDVKfwws2xiwMymZ8Eht
         4xP39vZnURfcsb5YFuqeojLzxRZAk4aPU7Giikl1wUJ/n4vHbHmEVjl0N65BsQH4S6bH
         ghgw==
X-Forwarded-Encrypted: i=1; AJvYcCVEyo8w/JMhJGyX/iCZ3bfNRfiktDgeHZPbNbyDfTXvtLy7ROr3QfXFSAH38bCXn426lK9FOp2U4PfZ@vger.kernel.org, AJvYcCWY6WkPH/kiENfHDBX6J22fSTy18Qef39YpxCgeJjR3HTwnIds7RDl7MTExVczpMAZjtR7BRz6n9VT/MMw=@vger.kernel.org, AJvYcCWnUmnAW3IyEug36AroYKoLQmh9LnGTr9O5T6lc/nt5XC4zzvW4fMpjxd83dmT7yjO9iq51cXcXKNVXPiI=@vger.kernel.org, AJvYcCXPMUhWHNL2VzyLB/V5NmodmJ6l8DeVDYpwgwmqAExRny6FPPa5txPq5MhMolxlzNVVRx5jvm6FXiSJs39N@vger.kernel.org
X-Gm-Message-State: AOJu0YzIY4GNJ7HfdnW9qjve3gMozpSFhrdM1bh73SgHMhNJUMm7JDQm
	29pG5WVdSpxidQc6iSUfUy1wt2kaoJVcEjqvrFDoswve8TZDhjx8kaD48A==
X-Gm-Gg: ASbGncvSgZfviQMu2XV8FVb+lFXwR+EzCCG7sR2grlvj8mxDfwdHiv9y2H88EB/iU31
	6b3oKQu2xO6QdSgOMxwBY4ZdWeCNBJiwLnNFggW5TO9dZJx7LdJQJFtXdsKxHj8QxGxsE15giAQ
	Y7nRuNi5k9woYC106SrTddRdM3ikdS9vbzBUBoFLTdk1MkKHoeGm3EtSGs88v9vxsUfzlj1kbBJ
	jCJk8QOlVEEM6Bwwhn1TyqmKaDAxcLmknRvi6rX/z5OcMlzbZSm6Tk9Z/zaQntogDZ7NYEK+u9R
	VwGoyNVG9lQbDKUmlltXp7NCrOgMAzTeg43iCLA7qDAMBHkySFGgs/4UuZZukG7BT05IsgkVnX8
	GtVqrn73pvaAhE+RcEsvghCER5POfq/99N3Ofcg==
X-Google-Smtp-Source: AGHT+IG3AYYCZjpiyNF33eGBd2NOxkGCG27jymfzWyrn6MCB6Fm4BvoruhYdcOJFuQliiCx3Ju+NDA==
X-Received: by 2002:a05:600c:5027:b0:440:8fcd:cf16 with SMTP id 5b1f17b1804b1-442d6d6b6f7mr7776095e9.19.1746741618205;
        Thu, 08 May 2025 15:00:18 -0700 (PDT)
Received: from orome (p200300e41f281b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442d14e6d74sm41174815e9.21.2025.05.08.15.00.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 15:00:17 -0700 (PDT)
Date: Fri, 9 May 2025 00:00:15 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: webgeek1234@gmail.com
Cc: Hans Verkuil <hverkuil@xs4all.nl>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v4 0/4] Tegra CEC Updates
Message-ID: <almxxsmr2ppjisqyzufqkbkekx3pab6cdtnlbdf4epe77eidvs@s4qv7s5udnhq>
References: <20250413-tegra-cec-v4-0-b6337b66ccad@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="3epgod7wk6jifceo"
Content-Disposition: inline
In-Reply-To: <20250413-tegra-cec-v4-0-b6337b66ccad@gmail.com>


--3epgod7wk6jifceo
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 0/4] Tegra CEC Updates
MIME-Version: 1.0

On Sun, Apr 13, 2025 at 02:35:31PM -0500, Aaron Kling via B4 Relay wrote:
> This series updates Tegra hdmi cec support to be usable out of the box
> on Tegra210 through Tegra194.
>=20
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---
> Changes in v4:
> - Fix review comment on patch 1
> - Link to v3: https://lore.kernel.org/r/20250409-tegra-cec-v3-0-91640131d=
fa2@gmail.com
>=20
> Changes in v3:
> - Update patch 1 to fix lint warnings
> - Link to v2: https://lore.kernel.org/r/20250408-tegra-cec-v2-0-2f004fdf8=
4e8@gmail.com
>=20
> Changes in v2:
> - Dropped patch 2, per request
> - Added change to declare fallback compatibles instead, as per request
> - Update patch 1 to allow fallback compatibles
> - Link to v1: https://lore.kernel.org/r/20250407-tegra-cec-v1-0-e25dd9577=
b5f@gmail.com
>=20
> ---
> Aaron Kling (4):
>       media: dt-bindings: Document Tegra186 and Tegra194 cec
>       arm64: tegra: Add fallback cec compatibles
>       arm64: tegra: Add CEC controller on Tegra210
>       arm64: tegra: Wire up cec to devkits
>=20
>  .../devicetree/bindings/media/cec/nvidia,tegra114-cec.yaml | 14 ++++++++=
++----
>  arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts         |  6 ++++++
>  .../boot/dts/nvidia/tegra186-p3509-0000+p3636-0001.dts     |  6 ++++++
>  arch/arm64/boot/dts/nvidia/tegra186.dtsi                   |  2 +-
>  arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts         |  6 ++++++
>  arch/arm64/boot/dts/nvidia/tegra194-p3509-0000.dtsi        |  6 ++++++
>  arch/arm64/boot/dts/nvidia/tegra194.dtsi                   |  2 +-
>  arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts         |  6 ++++++
>  arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts         |  6 ++++++
>  arch/arm64/boot/dts/nvidia/tegra210.dtsi                   |  9 +++++++++
>  10 files changed, 57 insertions(+), 6 deletions(-)
> ---
> base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
> change-id: 20250407-tegra-cec-7e3a7bef456f
>=20
> Best regards,
> --=20
> Aaron Kling <webgeek1234@gmail.com>

Applied, thanks.

Thierry

--3epgod7wk6jifceo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmgdKW8ACgkQ3SOs138+
s6GYeA//XE2vyZqqYpifD0khPD5xG3gxB1YfHHKl0Y7ZSyvHLFJizd+hzzjUH9N/
5vnczfETsqCuDvNZVlHJpjgCuM8ClyWY672WjZepl9doioFOp+tVi4PwknqLnHCy
YYgyU6JK315UK7ktYxhWe6oInbFtZSUXRW/a1j3HJRAmpiNp2OToNcMFWFTDNuvn
g2fxSEgTDfVEFpMhMVGc2iaCClGw7py7xk0mTaHo++FY8/kSH1GVybcwHDmFNHGk
Z/0oOnZ2L7Lxjn+9QV8eWTZpIOYLN6Y+YlmFvaP+XfMSMw/MiaUWxhbSP1E8QAI6
ANPd1/avzIcIqpbRqsBoB3AZxP67kWTjM9cMBMo5lADGmKGXdEONVkleT6VJ9XPs
kC6pPuicSTCpon6HyGDyQ4CL/P78aMD+sDc1nYMtX1Qjo7zEzr/vPZ+WY2FLUMR7
o2WLBdcp/bGVntyOqFU4C8JuXANU51W89nUHIdcUd4R00E7bzO9PYdE3xvXdr7GN
3EeR3VbzKve8IqJs7hQL6VWBh9EwS1vPei/bg/Ma0MFk2U6Cut8DF3emqdDYh1em
0X89IwEJCivye8EITGngb9k+uSqoVCQkOTnILgw0uzchzU8frEEe1YLQfoeGCYcY
hAtxWHR9pHV/t4L6L+oabd1lEkZWzVezDMWw7lSNnZhtnEFeVM0=
=1WMA
-----END PGP SIGNATURE-----

--3epgod7wk6jifceo--

