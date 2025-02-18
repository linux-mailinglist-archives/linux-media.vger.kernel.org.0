Return-Path: <linux-media+bounces-26244-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 755AFA39025
	for <lists+linux-media@lfdr.de>; Tue, 18 Feb 2025 02:08:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 49E381718F9
	for <lists+linux-media@lfdr.de>; Tue, 18 Feb 2025 01:08:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A169C383A2;
	Tue, 18 Feb 2025 01:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="I6aW0j/Q"
X-Original-To: linux-media@vger.kernel.org
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CDB818E20;
	Tue, 18 Feb 2025 01:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739840872; cv=none; b=Cpsw0UJyWIiwlOHZ1wC9M3hVnrReFsgs2VvoOAgix9NVKcoja1Byv5311OS0MQ8p0kbxm0e4fiQ8I13FOcbxopTAagNn8EEJ0JqDQMr3Ts2DCYRagT9oF2/QL458ic5y5nlTBSjt34v/Az5HFLeZWrdVJ+LO3MPP49vEAjAvxGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739840872; c=relaxed/simple;
	bh=uj40kfo5LTXmVRg+URNHrrqgZztW7N+flpz//iXaH54=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VfcfdJZ5qB53NHsX8b4wCcsjNxXxYS8FIW6yRsjpU/fi2AwDR4n9PKhWr2CeheZl6XSRPgvTR6bUEWkWrHjU9ZkoipB2cm1RxDVlR3DT4izGGN91Z9fOg98MPV8MfcHchRmQuHnkS9FvOTTb+x0ZFT4HmMgPFzjJ+qT5IypQ8M4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=I6aW0j/Q; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1739840868;
	bh=uj40kfo5LTXmVRg+URNHrrqgZztW7N+flpz//iXaH54=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=I6aW0j/Q7wosLhgwWVgS2ECPPxJu0Jz5eA+x22jBTYj9oIDxRj0FBplmhlWK8By0V
	 cs53Kda7flynNbNsRNveiFnXSyouKwqp6kKuUiYHNkxHMQtJQOppXaT41G5fbUhGvF
	 nqP9xFALQGgh4jMBFpedK0oE4DYmcS/nghS32kdsni7oVy2DYHgNj6bVuRC8czWgef
	 Qok189hdfmtVLn3cIH+ytCjNyMt81Zeht6hDfg02nqyLLi8/2NbRTIstrGNChAVJpy
	 FCpsFwNlmLu9sJ4dqQCdUcbO3tU/o+hn2NutXREhRWOzEHi+2oymvBxf4ppsW5CdXS
	 W2pCgR5F49Nmg==
Received: from [192.168.68.112] (ppp118-210-165-49.adl-adc-lon-bras34.tpg.internode.on.net [118.210.165.49])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id DA66B759DD;
	Tue, 18 Feb 2025 09:07:46 +0800 (AWST)
Message-ID: <a8ff6545da9dceb2b745e6301e1f997ba97776fe.camel@codeconstruct.com.au>
Subject: Re: [PATCH v6] media: dt-bindings: aspeed,video-engine: Convert to
 json schema
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Jammy Huang <jammy_huang@aspeedtech.com>, "eajames@linux.ibm.com"
 <eajames@linux.ibm.com>, "mchehab@kernel.org" <mchehab@kernel.org>, 
 "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>,  "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "joel@jms.id.au" <joel@jms.id.au>, "andrew@aj.id.au" <andrew@aj.id.au>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, 
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
 <linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Date: Tue, 18 Feb 2025 11:37:46 +1030
In-Reply-To: <TYZPR06MB656841B1071626B0B684B49AF1FB2@TYZPR06MB6568.apcprd06.prod.outlook.com>
References: <20250213015338.3243171-1-jammy_huang@aspeedtech.com>
	 <31c7189bc04ed8c5cce463951b717bed6a2ccf9a.camel@codeconstruct.com.au>
	 <TYZPR06MB656841B1071626B0B684B49AF1FB2@TYZPR06MB6568.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2025-02-17 at 02:11 +0000, Jammy Huang wrote:
> Hi Andrew,
>=20
> Thanks for your feedback, please find my explanation below.
>=20
> >=20
> > On Thu, 2025-02-13 at 09:53 +0800, Jammy Huang wrote:
> > > Convert aspeed-video.txt to yaml format.
> > > Update aspeed-video.txt to aspeed,video-engine.yaml in MAINTAINER fil=
e.
> > >=20
> > > Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
> > >=20
...
> > > +
> > > +required:
> > > +=C2=A0 - compatible
> > > +=C2=A0 - reg
> > > +=C2=A0 - clocks
> > > +=C2=A0 - clock-names
> > > +=C2=A0 - interrupts
> >=20
> > This should list `resets` as well, as that wasn't optional in the text =
binding.
> >=20
> 'resets' is not listed as required here is because ASPEED handle reset in=
 the clock driver
> in ast2600/ast2500/..., etc. So I keep this part identical as previous as=
peed-video.txt.

It's not identical though. The text binding listed the _optional_
properties, while the yaml binding lists the _required_ properties. The
reset property appears in neither list across two binding definitions,
but it has to be in one or the other for consistency.

However, it sounds like the text binding was not accurate, and this is
reflected in the video nodes in the SoC DTSIs. The yaml binding
definition at least matches that reality.

Andrew

