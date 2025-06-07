Return-Path: <linux-media+bounces-34301-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1088AAD102A
	for <lists+linux-media@lfdr.de>; Sat,  7 Jun 2025 23:43:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D3D2C188B2A8
	for <lists+linux-media@lfdr.de>; Sat,  7 Jun 2025 21:44:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14799218AC7;
	Sat,  7 Jun 2025 21:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mailoo.org header.i=@mailoo.org header.b="aEbKIoQO"
X-Original-To: linux-media@vger.kernel.org
Received: from mailo.com (msg-2.mailo.com [213.182.54.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF9401C84B6;
	Sat,  7 Jun 2025 21:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.182.54.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749332621; cv=none; b=T7J2mxZCVuj4xKFU+JJtUQjqBrfccVPGFKITWpO9TLcVp4BYfLZGeFNfmFwvAKTdAtoWZIrWjpVyFezDM14ccL3iHJ/cr8XWoTUwu/wFLs3X88fP4FnZm+jezi8Dv0d3HnAUWLgMsCSwMDUGOc3QcDwI/tnnKs6A9ICOGaELPK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749332621; c=relaxed/simple;
	bh=xI/OvOkoISAXRncaDWVm0qhOdTlzYGDe6owbkI0AdPE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZJ2CwC1l/3TJHn4NbeDBnpSdzhp0HkYNwE8ieBjtwYs1MamLmmLnfetozEJhiRriGb2uVMslWdlEohTARPJEAFJ/4XKo4mCsyaWJ5RSHtxMzWppas2u1J929fTZ1aH442yMUS92XwvV/ZH7M7HzbsQIJpVfXdEQrBv8G4GFgq0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mailoo.org; spf=pass smtp.mailfrom=mailoo.org; dkim=pass (1024-bit key) header.d=mailoo.org header.i=@mailoo.org header.b=aEbKIoQO; arc=none smtp.client-ip=213.182.54.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mailoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailoo.org
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailoo.org; s=mailo;
	t=1749332607; bh=xI/OvOkoISAXRncaDWVm0qhOdTlzYGDe6owbkI0AdPE=;
	h=X-EA-Auth:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=aEbKIoQO+l7C7MLt9a6SuB590DT46JFza4bQskV6NSOnACnFw81MauRawk2w4VwmZ
	 /edbHScs3xZ106G02Pys8xBJEg6kcYH92+wTl3/JqKRRxTSb6Z6AEfmIDXNL4ghWJk
	 ovF8eARkJWcLrWHhH0aAjYqG/4KCPWffCDVPRvqY=
Received: by b221-6.in.mailobj.net [192.168.90.26] with ESMTP
	via ip-22.mailoo.org [213.182.54.22]
	Sat,  7 Jun 2025 23:43:26 +0200 (CEST)
X-EA-Auth: tcnuv6EiHZjbchC6kmH0/Ii7nnvOoLM4TEin+CbKNq8wrSTgu1rvm6JumEmT79Enp2m+k7dPzaxOaWT47optlAuYenc93FDrPejq6nJgMP8=
Message-ID: <e73d676ba1901437d471a2a633e94a07b19a3e05.camel@mailoo.org>
Subject: Re: [PATCH v4 2/4] media: qcom: camss: Add support for MSM8939
From: Vincent Knecht <vincent.knecht@mailoo.org>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Robert Foss	
 <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, Bryan O'Donoghue	
 <bryan.odonoghue@linaro.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,  Bjorn Andersson
 <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 =?ISO-8859-1?Q?Andr=E9?= Apitzsch
	 <git@apitzsch.eu>, phone-devel@vger.kernel.org, 
	~postmarketos/upstreaming@lists.sr.ht
Date: Sat, 07 Jun 2025 23:43:26 +0200
In-Reply-To: <877a72fa-cdae-4a66-9991-5ea86ef76aac@linaro.org>
References: <20250602-camss-8x39-vbif-v4-0-32c277d8f9bf@mailoo.org>
	 <20250602-camss-8x39-vbif-v4-2-32c277d8f9bf@mailoo.org>
	 <877a72fa-cdae-4a66-9991-5ea86ef76aac@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42app2) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Le vendredi 06 juin 2025 =C3=A0 13:59 +0300, Vladimir Zapolskiy a =C3=A9cri=
t=C2=A0:
> Hello Vincent.
>=20
> On 6/2/25 20:27, Vincent Knecht via B4 Relay wrote:
> > From: Vincent Knecht <vincent.knecht@mailoo.org>
> >=20
> > The camera subsystem for the MSM8939 is the same as MSM8916 except with
> > 3 CSID instead of 2, and some higher clock rates.
> >=20
> > As a quirk, this SoC needs writing values to 2 VFE VBIF registers
> > (see downstream msm8939-camera.dtsi vbif-{regs,settings} properties).
> > This fixes black stripes across sensor and garbage in CSID TPG outputs.
> >=20
> > Add support for the MSM8939 camera subsystem.
> >=20
> > Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> > Signed-off-by: Vincent Knecht <vincent.knecht@mailoo.org>
>=20
> There was a preceding and partially reviewed changeset published on
> linux-media [1] before v1 of the MSM8939 platform support in CAMSS,
> due to a merge conflict this platform changeset should be rebased IMHO.
>=20
> [1] https://lore.kernel.org/all/20250513142353.2572563-4-vladimir.zapolsk=
iy@linaro.org/
>=20
> --
> Best wishes,
> Vladimir

Thank you, I'll look into it



