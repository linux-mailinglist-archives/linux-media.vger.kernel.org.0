Return-Path: <linux-media+bounces-36629-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 16B32AF6392
	for <lists+linux-media@lfdr.de>; Wed,  2 Jul 2025 22:55:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 38D7E1C424D0
	for <lists+linux-media@lfdr.de>; Wed,  2 Jul 2025 20:56:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 750232E03E5;
	Wed,  2 Jul 2025 20:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=apitzsch.eu header.i=@apitzsch.eu header.b="M7Imxov9"
X-Original-To: linux-media@vger.kernel.org
Received: from www637.your-server.de (www637.your-server.de [168.119.26.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 575A42DE6FD;
	Wed,  2 Jul 2025 20:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.26.117
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751489737; cv=none; b=omL7AR226gMaSCRV/wpyWrLtkUaw9oMXe/QNjQ20jKovlJafe3n0Mv+/iGsGhVoXmxhXTXsArAR5PqYWhKcD86RXiteZPzumHD6SkzoRHcacqryCgYnFxcUOkAgbt4x25VL+rFnPgn6txL450c+hM9XbCxvtPXDHiE1TNFPzrUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751489737; c=relaxed/simple;
	bh=jMqNUzCzdviSMaixKOdDfxxH8LW66AFo7krUQNRNHeI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=vDK8Pm91Kh1DBZhyg2MLDCU5ez0Vi/RpJ192XpI+L+Ya7JiPPoy5vmwZ/Mx9rL48AwyR6Ysa7nzyKSBjKq9H+kFKyb33/IXzeJxhJd9Nnsa/7IrO0qK2sFGIuH5rt+RdOssvppWlGfWOYpJjx7mEwtnSfTg3VcskY3DyfWJXizo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=apitzsch.eu; spf=pass smtp.mailfrom=apitzsch.eu; dkim=pass (2048-bit key) header.d=apitzsch.eu header.i=@apitzsch.eu header.b=M7Imxov9; arc=none smtp.client-ip=168.119.26.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=apitzsch.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=apitzsch.eu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=apitzsch.eu
	; s=default2410; h=MIME-Version:Content-Transfer-Encoding:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=jMqNUzCzdviSMaixKOdDfxxH8LW66AFo7krUQNRNHeI=; b=M7Imxov9Ftjj1N+R6ItFyHHOBO
	3Jfb6H1RyvVQ+6aTwKoPc/yv0bEGaj1s5chIR7785vj3Rfc0wfX5f2McFnQlzAkuwKIlFPniSMmVm
	PhlVklY4zGfE9NCL8sAyYWV/XKO2m2wwPtQ7ingNcnDArspO6/FV2Z5Ku7Tgfrby4u3F0yqyYG7B8
	VuRBE3BvmPIoYKF8z2WpZLdYTQZUblE1xG/9L4hMa1gOnHc8lK1BpgXmYIE07WUGOSLOOmOitTJhv
	UKqjJ2KuMmVzk0F79Wtc1YJBzS+lRh9BVH0vC8DQTLHVu/Epx01k/jqvJvorhnfIBdUaYt1WGWZZ5
	/XLFABiQ==;
Received: from sslproxy08.your-server.de ([78.47.166.52])
	by www637.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <git@apitzsch.eu>)
	id 1uX47U-0003SF-2m;
	Wed, 02 Jul 2025 22:31:52 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy08.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <git@apitzsch.eu>)
	id 1uX47V-000Hyo-0Q;
	Wed, 02 Jul 2025 22:31:52 +0200
Message-ID: <a64eddca62e9ab72eefe2bf347f4633550965433.camel@apitzsch.eu>
Subject: Re: [PATCH 1/5] media: dt-bindings: i2c: add DW9719/DW9718S VCM
 binding
From: =?ISO-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>
To: Krzysztof Kozlowski <krzk@kernel.org>, Sakari Ailus
	 <sakari.ailus@linux.intel.com>
Cc: Val Packett <val@packett.cool>, Daniel Scally <djrscally@gmail.com>, 
 Mauro Carvalho Chehab
	 <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Wed, 02 Jul 2025 22:31:51 +0200
In-Reply-To: <e6daacbf-2cfe-4489-942d-037b542143d4@kernel.org>
References: <20250210082035.8670-1-val@packett.cool>
	 <20250210082035.8670-2-val@packett.cool>
	 <c2ff273a-bac5-4fa3-8339-ab722c9e63bf@kernel.org>
	 <Z6nWp3bpoiqpvpS-@kekkonen.localdomain>
	 <e6daacbf-2cfe-4489-942d-037b542143d4@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Virus-Scanned: Clear (ClamAV 1.0.7/27687/Wed Jul  2 10:35:26 2025)

Hi Krzysztof, hi Sakari,

Am Montag, dem 10.02.2025 um 12:04 +0100 schrieb Krzysztof Kozlowski:
> On 10/02/2025 11:36, Sakari Ailus wrote:
> > Hi Krzysztof,
> >=20
> > On Mon, Feb 10, 2025 at 09:29:25AM +0100, Krzysztof Kozlowski
> > wrote:
> > > > +=C2=A0 dongwoon,vcm-freq:
> > > > +=C2=A0=C2=A0=C2=A0 description:
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 The switching frequency for the voi=
ce coil motor.
> > >=20
> > > Frequency is in Hertz, so use proper property unit suffix. BTW,
> > > you cannot add incorrect properties post-factum based on already
> > > accepted ACPI driver. This would be nice bypass of review, right?
> >=20
> > What's actually configured here is the divisor (10 MHz clock,
> > divisor seems to be value + 2). It's similar to existing
> > Documentation/devicetree/bindings/media/i2c/dongwoon,dw9768.yaml .
> > I prefer this as it's much easier to use that in a driver (think of
> > having values like 1428571 in DT, too).
>=20
>=20
> Sure, but then this should be renamed to match purpose and
> description rephrased.
>=20

What would be a better name for the property?

Best regards,
Andr=C3=A9

> >=20
> > >=20
> > > > +=C2=A0=C2=A0=C2=A0 $ref: /schemas/types.yaml#/definitions/uint32
>=20
>=20
> And this would stay + constraints.
>=20
>=20
> Best regards,
> Krzysztof

