Return-Path: <linux-media+bounces-41951-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD8FEB483DA
	for <lists+linux-media@lfdr.de>; Mon,  8 Sep 2025 08:05:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0840717A738
	for <lists+linux-media@lfdr.de>; Mon,  8 Sep 2025 06:05:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67E8C225788;
	Mon,  8 Sep 2025 06:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=apitzsch.eu header.i=@apitzsch.eu header.b="ZSggGL9x"
X-Original-To: linux-media@vger.kernel.org
Received: from www637.your-server.de (www637.your-server.de [168.119.26.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6476E258A;
	Mon,  8 Sep 2025 06:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.26.117
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757311530; cv=none; b=H/1muxZdA6gX9C30XqsU8DXBYtU6eiFnv+c8fk4HhbiOzLlSuEyBvPrnP3SMb8Kz3OSvppfg/cmzzBpa6z+FHU6B4LjgBoy8JD6mXfcu/W6xWRSw1vm/2f9ay9ikTjEf1pC5l5KkjRjHOzmfk21JyY0e57PyiDkvMWyXN0Y/LGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757311530; c=relaxed/simple;
	bh=VEj+FcIjH8vMApuTrrOGRDhfsgKnPwgJ+AclFliyyyI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kCIwhxg1PhJgNB/XnCco/KDUtf4PkDu11LOueo9ScWkhXTx1j8az5WWhhFaFUnjmpwPZd/TXCOk9R5buAVsem8YmXyZTFKi2L/Dpj9BqdHrfYZxwDV/+4qdMdtVLnyY8WZhkVVos0LldVmsqpAjCpwU8tuZc9Ob5etOSingPLps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=apitzsch.eu; spf=pass smtp.mailfrom=apitzsch.eu; dkim=pass (2048-bit key) header.d=apitzsch.eu header.i=@apitzsch.eu header.b=ZSggGL9x; arc=none smtp.client-ip=168.119.26.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=apitzsch.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=apitzsch.eu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=apitzsch.eu
	; s=default2410; h=MIME-Version:Content-Transfer-Encoding:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=CfsdsKfiWnNioTv736ibRPWjiInLASEhVaU5adm2kiY=; b=ZSggGL9x2fLao5yLUtulafVKEw
	h2NETSUQYUi9xVEGccBOKY5ciDpfyeg585vJ96Dp3uDiYMvMlmKK1NJ3DaJtTEKyV8uTzKitJ4oRq
	yCxj/32EsoD9A3Seir6AXttsrv1Gw262ZQTD0menkt1+AkZ1cPweBvFgJz2RxozcTK50Dd82b0aIV
	jvKWKbv+a5QvpRtXCuU+ogeGTTh/oNBgULCi3U6N7Sl7Njc5nI/H97/0UQlHvhC5awKOeQhihQ95u
	juAeP9+rBj5jEmc4SDqpmAe9q83bcYTRNco+whefTqD4OVfuk5HRN5oTJH2duaTuT6jRWPVbwTbL7
	bwgQg0QQ==;
Received: from sslproxy07.your-server.de ([78.47.199.104])
	by www637.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <git@apitzsch.eu>)
	id 1uvUfb-000Ed4-28;
	Mon, 08 Sep 2025 07:44:03 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy07.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <git@apitzsch.eu>)
	id 1uvUfa-00088z-25;
	Mon, 08 Sep 2025 07:44:03 +0200
Message-ID: <6d875165ae2867fb0a49c19bdf18c0d948c783d3.camel@apitzsch.eu>
Subject: Re: [PATCH 0/4] Add CAMSS support for MSM8939
From: =?ISO-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Robert Foss	
 <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, Vladimir Zapolskiy	
 <vladimir.zapolskiy@linaro.org>, Mauro Carvalho Chehab
 <mchehab@kernel.org>,  Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,  Bjorn Andersson
 <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Vincent Knecht
	 <vincent.knecht@mailoo.org>
Date: Mon, 08 Sep 2025 07:44:01 +0200
In-Reply-To: <e0e1827f-aa8b-4337-b26c-dc2ac43e0e2a@linaro.org>
References: <20250908-camss-8x39-vbif-v1-0-f198c9fd0d4d@apitzsch.eu>
	 <e0e1827f-aa8b-4337-b26c-dc2ac43e0e2a@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Virus-Scanned: Clear (ClamAV 1.0.9/27756/Sun Sep  7 10:26:39 2025)

Hi Bryan,

Am Montag, dem 08.09.2025 um 05:51 +0100 schrieb Bryan O'Donoghue:
> On 07/09/2025 23:04, Andr=C3=A9 Apitzsch via B4 Relay wrote:
> > (This series resumes [1].)
>=20
> Thank you for following up on this.
>=20
> Could you give a brief synopsis what changed between this series and
> the previous series ?

As Vincent seems currently quite busy I took over the series. Because
of that I assumed I had to reset the revision number.

At the end of the cover letter you can find what changed since the
previous submission (v5 by Vincent), but I will add it here again in
more details.

- Patch 1 (bindings) (previously patch 3):
  - Make the order of {reg, clock, interrupt} items the same as in 8916
    + append additional items
  - update isp node unit address
  - Drop R-b tag
- Patch 2 (previously patch 1): no change
- Patch 3 (previously patch 2): no change
- Patch 4 (dts):
  - Make the order of {reg, clock, interrupt} items the same as in 8916
    + append additional items
  - update isp node unit address
  - Drop R-b tag

Best regards,
Andr=C3=A9

>=20
> > [1]
> > https://lore.kernel.org/all/20250613-camss-8x39-vbif-v5-0-a002301a7730@=
mailoo.org/
> Good series submission style would have something in the coverletter
> like.
>=20
> "Here is my awesome series of patches which do X
>=20
> v2:
> - Fixed everything wise and benevolent kernel community asked for
>=20
> v1:
> - Enabled cool stuff
> "
>=20
> I recall we were pretty close to picking these patches up previously
> so thank you for re-upping your effort.
>=20
> A brief bit of guidance on what if anything changed from your last=20
> submission is appreciated and good practice so that we can review and
> apply quicker.
>=20
> ---
> bod

