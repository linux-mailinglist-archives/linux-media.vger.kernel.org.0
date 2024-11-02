Return-Path: <linux-media+bounces-20718-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48C739BA061
	for <lists+linux-media@lfdr.de>; Sat,  2 Nov 2024 14:17:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 62A5A1C21430
	for <lists+linux-media@lfdr.de>; Sat,  2 Nov 2024 13:17:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 602BE18A947;
	Sat,  2 Nov 2024 13:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c0h6gQEM"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0E6C1E515;
	Sat,  2 Nov 2024 13:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730553423; cv=none; b=oxvEwt4tJk++xR+0Myu2ExoD/nas12WzHUyjZQLAO4J3EFkSZxfUInFo6lgrXV7rrRkimg6LK+pueHBYnv4N2OfYq9/5fv9U9zUah+gjB+hVZJxIXf50bVPBoJ3QKg3qNOA5bPVtAiNGvdU4AWlZR8q8MM/Qfr6z6ujoAF7HfvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730553423; c=relaxed/simple;
	bh=m7HZYLDFS5CEPm06FIwHTt0tQLxBAUAMPV9pgMT+j+4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nz3f9efQK8Z5KE6+N6GdjYGqNdT6svlJvhH1lij+siFwlilF6AC7Xa4Zg1uwqppF+0x5Ww/BXaqdf/CMVSONgbTF0W6fbyM4ci1cuAkXjmBGhxOEI7GtrFg17BKpzH23qp5O7qorgM5H2gcUZXxsUObzN1uFYDeM5OoItw7RGho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c0h6gQEM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDA01C4CED0;
	Sat,  2 Nov 2024 13:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730553423;
	bh=m7HZYLDFS5CEPm06FIwHTt0tQLxBAUAMPV9pgMT+j+4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c0h6gQEMlYTK7v9/q1tzsOryUAZJt5P6B6maeM11aSGcTw218PJ1HD4NsfpZD6O8R
	 dmvl6IvFyprJP/XFIeW8RgLwacuvUgzKeHzyVj0F3sBGmBMfjLSMRbcmxVZljEKDFH
	 YeOyYieDBFw/gQDTbAzZh+aOU1yqhOH54Ddnv+VtE5PBM2LyqEGNAMitcX5hUxjSYP
	 QWfBivo0Y5xhIRoztZMXW/3z1yk8TCdsuEgPlgiiXRN6eZs0PFkcxWPsM/PvEGZum2
	 RHLimyzV3opF5QmbQJsisgBrpVGpaekrq2lsrzLvtwEmE7hCBOSA/MYhGAW2sJTvx5
	 FMMooRvuaQPOw==
Date: Sat, 2 Nov 2024 14:16:59 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: =?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/3] media: dt-bindings: media: camss: Add
 qcom,msm8953-camss binding
Message-ID: <kdqobcodlotegbpn4l7n7htyvlvrcdyhdgz3f65ngli5agfc76@va2eels3r7nf>
References: <20241102-camss-msm8953-v2-0-837310e4541c@mainlining.org>
 <20241102-camss-msm8953-v2-2-837310e4541c@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241102-camss-msm8953-v2-2-837310e4541c@mainlining.org>

On Sat, Nov 02, 2024 at 02:32:29AM +0100, Barnab=C3=A1s Cz=C3=A9m=C3=A1n wr=
ote:
> Add bindings for qcom,msm8953-camss in order to support the camera
> subsystem for MSM8953/SDM450/SDM632.
>=20

Also:

A nit, subject: drop second/last, redundant "binding". The
"dt-bindings" prefix is already stating that these are bindings.
See also:
https://elixir.bootlin.com/linux/v6.7-rc8/source/Documentation/devicetree/b=
indings/submitting-patches.rst#L18

Best regards,
Krzysztof


