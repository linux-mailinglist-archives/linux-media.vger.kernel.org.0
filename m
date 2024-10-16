Return-Path: <linux-media+bounces-19733-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E2E479A05BE
	for <lists+linux-media@lfdr.de>; Wed, 16 Oct 2024 11:38:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A4DE328330C
	for <lists+linux-media@lfdr.de>; Wed, 16 Oct 2024 09:38:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C258205E20;
	Wed, 16 Oct 2024 09:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="S5zGfKSg"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D741E205E35
	for <linux-media@vger.kernel.org>; Wed, 16 Oct 2024 09:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729071491; cv=none; b=N8c712GV94KMCHzJ1guUrqv3CkLL0nH+Qh89KAlJb0nxbcqb9TBZL05Tw06jMfPyKvLKCcBxe9LZtIb3zpWhh1KaDooTbCtjrsWL+dQrCJYLyxQDYQP5yaVG0x+vaIQA++7Eq/1sDCqFd0dKvIP6yuQKZ0R6J1y3it71UT9ZaeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729071491; c=relaxed/simple;
	bh=h+MEcmZigNmxpEFSrj+58A1sCwmjB2v6r7R7JjK9bdo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eCWx6m1mV1Nab5fne1+8bG7Y46so0IxVNH9cv579LUS3IpV75H8HTj6WMDUB9HhqkSeTj7sPV+JIm7JgNKmYq7m7ULVePUDSSLQu21YDxIqGfoiKnihwswKcGoPzz1lSkpYfcYKpwr2ZBQJvB7lDyi63xzv8tKYN6Y6vRIVllNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=S5zGfKSg; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-37d5689eea8so3093411f8f.1
        for <linux-media@vger.kernel.org>; Wed, 16 Oct 2024 02:38:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1729071488; x=1729676288; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UZPkSRw8N7EZUKHZCzOf4+8lB74dOv5D7QVgwukvOt8=;
        b=S5zGfKSgSVKWuELW5I32XzG+5qWMU5lo/3+zvKH+THt/+ITW1WTZHAFPqr8lljYd7c
         tQF/Q5UvTRqaMiAuftHwvK3Ypr7OPbSRIl+dcG/WcZAUMa/xjxUaKi5wfwucCT+wCe2s
         QxTVnmK+zA1nFoQqAlnJ694deGQ/gPVkfLhA+HzhIyWZrkeg3BTsePd3GtDSI7kenmuc
         ypbimeb4ZtUpdqWa4P3n+SQC14/LoeA3w/CJPdI5eS7mLHAx/EgLM/oLavh/tLDS6O3T
         dl9u7g/a5P7cXZ6Bd1oLvuQhejHaR210WZPHzAYzG9dNIvL6P8VTZjHK3XirtEjrIZto
         3MBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729071488; x=1729676288;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UZPkSRw8N7EZUKHZCzOf4+8lB74dOv5D7QVgwukvOt8=;
        b=wr0gkhJVei391VL0UrOhKTPeimRhptQnERpq8eT+kW6Dafvtn5hce8Unp7Lv7gHHcg
         HdJIphk3lhJqLbVQwAN1e6mMTY8PprugsaNGIEdo+OGm5dmxLw9QUh6VBzk7UynDardT
         DprOASONEShIrcAHSsI0/hix3SC7AAeKVnehIKmTPUXbNseT/JOkDiHdC+Iudi3zDe9f
         OP5jxeVQL+eI9ZS50MWMblOQ5vNwgI/XBNxQQQdYUGZWZh7b005MtVlN2G+z8tUqsblX
         z13F4PtVL03yedFNI3e0g9Sz7BUobkZpb37I7yeHxVXBhsYULQQPOvmFXXqQxoOD8u07
         7wgw==
X-Forwarded-Encrypted: i=1; AJvYcCUohk6L8LQy9yhSHFsvJwzBbrL/OqwyNZ9IqyavJwBcwH38NUoaWM3KXaZ5TRQaKcaw3drWfgZPjgPTqg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzSZDLZFcaWzHgFqW611XImI5KEQrG38R+3bXGaUGKrHuADBFmA
	HLdVsXIhHK0ZzJ2RSbcvylCIzUCGooVDiGTwoObUGGasxcQd/k/W6GwvaZaV+Pc=
X-Google-Smtp-Source: AGHT+IFaXuasAjjx44bpxuqZ8S1oc+w6FXNhb+zFCAtNzZoVeffBTNdwY+uuoM8/6KNVbIFcADc++Q==
X-Received: by 2002:adf:fac8:0:b0:37c:d179:2f77 with SMTP id ffacd0b85a97d-37d86ba820cmr2258041f8f.12.1729071488142;
        Wed, 16 Oct 2024 02:38:08 -0700 (PDT)
Received: from localhost (p200300f65f19e3002f38cf427133ca7b.dip0.t-ipconnect.de. [2003:f6:5f19:e300:2f38:cf42:7133:ca7b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d7fbf80a4sm3835755f8f.87.2024.10.16.02.38.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 02:38:07 -0700 (PDT)
Date: Wed, 16 Oct 2024 11:38:06 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Dikshita Agarwal <quic_dikshita@quicinc.com>
Cc: Vikash Garodia <quic_vgarodia@quicinc.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Hans Verkuil <hverkuil@xs4all.nl>, Sebastian Fricke <sebastian.fricke@collabora.com>, 
	linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 02/28] media: iris: add platform driver for iris video
 device
Message-ID: <r7p4glfxjkcecm7fi4qkl3utn3damrun6lfzkmn5wddcd7pxq7@fpav7mavmckn>
References: <20241014-qcom-video-iris-v4-v4-0-c5eaa4e9ab9e@quicinc.com>
 <20241014-qcom-video-iris-v4-v4-2-c5eaa4e9ab9e@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="t3bnbnmmxipdv62h"
Content-Disposition: inline
In-Reply-To: <20241014-qcom-video-iris-v4-v4-2-c5eaa4e9ab9e@quicinc.com>


--t3bnbnmmxipdv62h
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v4 02/28] media: iris: add platform driver for iris video
 device
MIME-Version: 1.0

Hello,

On Mon, Oct 14, 2024 at 02:37:23PM +0530, Dikshita Agarwal wrote:
> +static struct platform_driver qcom_iris_driver = {
> +	.probe = iris_probe,
> +	.remove_new = iris_remove,
> +	.driver = {
> +		.name = "qcom-iris",
> +		.of_match_table = iris_dt_match,
> +	},
> +};

After commit 0edb555a65d1 ("platform: Make platform_driver::remove()
return void") .remove() is (again) the right callback to implement for
platform drivers. Please just drop "_new".

Best regards
Uwe

--t3bnbnmmxipdv62h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmcPiXwACgkQj4D7WH0S
/k5/KwgAp235pPg3oX2oGlC0FlS9z/orTLt3I7bY9W3m398FCaVaZnSveecT+4gz
3JKoQvZYCzyliPr+texSdfLYuTXDZYo4PDnADU4Gi1HoWPwegFuE5otOC9Z3Z6PS
ZXAb5iiLIqmVNQyA9QuOMl87cQS1B01C+eodPJHCc5jiEkRtbfM0zfgjgvM0BGDg
R586IwHliDuZwtCZEHUNOnxYLnl6AMLcuXlClSL/hatrOVKF5bP2NopyUEvUZe4P
1wXQCSbacfoBk3p0nyEO5MyDUzFzfxaE9jnAPqt7/sFBQOGrMVE2NSbMCXkgZgfJ
7odao0LkCFyDuFDjGCHRpU3k1vZD+A==
=J7sX
-----END PGP SIGNATURE-----

--t3bnbnmmxipdv62h--

