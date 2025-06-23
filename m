Return-Path: <linux-media+bounces-35696-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AD9C3AE4BFE
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 19:35:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8ABE2189E16A
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 17:35:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0E8E2D29CA;
	Mon, 23 Jun 2025 17:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=apitzsch.eu header.i=@apitzsch.eu header.b="G1Uv5dqB"
X-Original-To: linux-media@vger.kernel.org
Received: from www637.your-server.de (www637.your-server.de [168.119.26.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B11D82C15BE;
	Mon, 23 Jun 2025 17:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.26.117
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750700132; cv=none; b=XmC12LqUOuu3Qh+tMtfHUQXvGs7pSC/nEtXEx61x/uRyQJBUYlZOETCSZ9n0T52dHml+B/Jg6Kxl4qmtiZvewgRiRRZjf+rg/gLECUs16ifZRwWzhvgdXMyo+t0qDc4fqK+T4NbaQ8w/GLEiKUXgsp+ynNmYBYqX6gTDhMHtu2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750700132; c=relaxed/simple;
	bh=mGFD+TEQmheZhWqHvHH/h1FUuzjuW8fcVIkD9mNsloo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YKmmfYZsyHxEqmhMs++ja71Fs9z6xks1SFfKfWZxN4sa6oVOGgfkDsl59gRA4aiejS5inomk6zp2t67DkorPAkpLrYMP1zqR1VijK2PTleiCCcrJCWBT34HIFijx7Vi4JdpHQ+B86GJePIn70KkIv85hOt1Px7z503/h8f50bWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=apitzsch.eu; spf=pass smtp.mailfrom=apitzsch.eu; dkim=pass (2048-bit key) header.d=apitzsch.eu header.i=@apitzsch.eu header.b=G1Uv5dqB; arc=none smtp.client-ip=168.119.26.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=apitzsch.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=apitzsch.eu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=apitzsch.eu
	; s=default2410; h=MIME-Version:Content-Transfer-Encoding:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=mGFD+TEQmheZhWqHvHH/h1FUuzjuW8fcVIkD9mNsloo=; b=G1Uv5dqB5EuWkcfS4CSlHkTc4G
	3IwxfpnGtWhHQxIrHjkqdFul2xigJfuo+PMSnRonHmQMif3Il9vFKBt4F/hUDuEjhYhgIg4d/w3s2
	fbqq0TlaafplRZ02zoi6d8bIrst/zs6h1AQ6xpGtUBrKXR0Z6uDraQVohKkAkKaScAhod7xiVOCdq
	QMV8z5VzxTmiLUCh8YJX8hBr+EUeupmu/oLYCrjKAK5qviCIhoyrrv3sqsSB/6Hg73teOqqFqcibo
	L2JRnF3fBcjq9Al2+WOMvwgDP116B7EsvYbl+yzxKL0WAQcmUxQO4QxzUHbbhtL+uvuOI0RcUghxt
	3jhPTARA==;
Received: from sslproxy08.your-server.de ([78.47.166.52])
	by www637.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <git@apitzsch.eu>)
	id 1uTl4c-0005Et-0z;
	Mon, 23 Jun 2025 19:35:14 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy08.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <git@apitzsch.eu>)
	id 1uTl4b-0001FO-22;
	Mon, 23 Jun 2025 19:35:13 +0200
Message-ID: <c243b93675f8136e30abb7608b58badf4b1ada35.camel@apitzsch.eu>
Subject: Re: [PATCH RESEND v4 0/5] media: i2c: imx214: Add support for more
 clock frequencies
From: =?ISO-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Ricardo Ribalda <ribalda@kernel.org>, Mauro Carvalho Chehab
	 <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Shawn Guo
	 <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, Laurent Pinchart
	 <laurent.pinchart@ideasonboard.com>, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, Ricardo Ribalda
	 <ribalda@chromium.org>, Conor Dooley <conor.dooley@microchip.com>
Date: Mon, 23 Jun 2025 19:35:12 +0200
In-Reply-To: <aFk-yTSOqzmEW1sz@kekkonen.localdomain>
References: <20250621-imx214_ccs_pll-v4-0-12178e5eb989@apitzsch.eu>
	 <aFj5QnPBO0We5SBQ@kekkonen.localdomain>
	 <46a681a84a7493e2d0a6d3a4eedb6c86ccd9903f.camel@apitzsch.eu>
	 <aFk-yTSOqzmEW1sz@kekkonen.localdomain>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Virus-Scanned: Clear (ClamAV 1.0.7/27678/Mon Jun 23 10:34:34 2025)

Hi Sakari,

Am Montag, dem 23.06.2025 um 11:47 +0000 schrieb Sakari Ailus:
> Hi Andr=C3=A9,
>=20
> On Mon, Jun 23, 2025 at 01:34:03PM +0200, Andr=C3=A9 Apitzsch wrote:
> > Hi Sakari,
> >=20
> > Am Montag, dem 23.06.2025 um 06:50 +0000 schrieb Sakari Ailus:
> > > Hi Andr=C3=A9,
> > >=20
> > > On Sat, Jun 21, 2025 at 11:37:24AM +0200, Andr=C3=A9 Apitzsch via B4
> > > Relay
> > > wrote:
> > > > The imx214 driver currently supports only a 24 MHz external
> > > > clock.
> > > > But
> > > > there are devices, like Qualcomm-MSM8916-based phones, which
> > > > cannot
> > > > provide this frequency. To make the sensor usable by those
> > > > devices,
> > > > add
> > > > support for additional clock frequencies.
> > > >=20
> > > > This series supersedes
> > > > https://lore.kernel.org/linux-media/20250308-imx214_clk_freq-v1-0-4=
67a4c083c35@apitzsch.eu/
> > >=20
> > > Is there a difference in this set from the v4 you posted
> > > previously?
> >=20
> > There is no difference to the v4 posted previously. This is a
> > resend because there was no activity in the original v4.
>=20
> It's not useful to resend patches, especially those that already have
> been merged somewhere. Please ping people instead.

I wasn't aware that patches already had been merged. Maybe I missed it,
when checking=C2=A0https://git.linuxtv.org/sailus/media_tree.git
Next time I'll ping.

Best regards,
Andr=C3=A9

