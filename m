Return-Path: <linux-media+bounces-45160-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 4209ABF8944
	for <lists+linux-media@lfdr.de>; Tue, 21 Oct 2025 22:08:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 584AD4FBD46
	for <lists+linux-media@lfdr.de>; Tue, 21 Oct 2025 20:08:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BC8127990A;
	Tue, 21 Oct 2025 20:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=apitzsch.eu header.i=@apitzsch.eu header.b="njuoKusr"
X-Original-To: linux-media@vger.kernel.org
Received: from www637.your-server.de (www637.your-server.de [168.119.26.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5916D1A3029;
	Tue, 21 Oct 2025 20:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.26.117
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761077295; cv=none; b=cRG47bdNoOTSeUr1FJRbV9QBjT3Imv+8DJM9Mj7lKScEMJ06myq2lm8KVjS9hjKp94gPj3ikRZEVt3kdpOx4ifyPXfMwtZDplXxS1ysChBTySM0H+ef1lUtwTKR83o2n/kwHoiF56gXRcnCkqzs4Tz7yMrenbBuKYyjzFJKW0Tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761077295; c=relaxed/simple;
	bh=TUB/VZTmJJXD0FPrRlFoDDfruAv+34ZNsor9AkJ/vdw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=r18+jeQ/PMMtWWLEcUP1MTmmwvvF715AxiG8uKCobXPS4vAIDsQxpCGSD1hIMJ8LKDNQNhIeeEMiRYQvDe9QoaoykXfiOi9ttwvD0KzdwRie1oIvUTbTcqRHp+gqDnIwXGpuEm4dSnYgmw/EMb3TYmGmiHtZvSAYXTlJZhaIKQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=apitzsch.eu; spf=pass smtp.mailfrom=apitzsch.eu; dkim=pass (2048-bit key) header.d=apitzsch.eu header.i=@apitzsch.eu header.b=njuoKusr; arc=none smtp.client-ip=168.119.26.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=apitzsch.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=apitzsch.eu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=apitzsch.eu
	; s=default2410; h=MIME-Version:Content-Transfer-Encoding:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=TUB/VZTmJJXD0FPrRlFoDDfruAv+34ZNsor9AkJ/vdw=; b=njuoKusrNZnb2b26Cv3hUOX5rN
	RafPZjMwxeQJGBXwBicwjIgXRIO+udGSQNrEKUFdQjilRP15uiUF53rePm1/L1Qq1M2hcf+68hQ9U
	LhkjiVce0iH6DsJDQ6FA8Mqs3q/4HSDPumXF+ohz7yVSikKmiLrJ/uyELT2aZUTr6FCfbliOLOjhX
	ygcfPhoqUlv0fUwXRkpiTtBZgygsjadRrptNBToDGoksRn9Y6p8g/6XmFa2Mo8BXn8Onn1CtGa+LI
	XSfQ+nc49fB/zirjkWHaxQGZNGW7uRaKZLx6IjOj8wn9Er12sWznjFeCnKDsPdWeFVZf+dDvvyQDr
	T/7F4p+A==;
Received: from sslproxy07.your-server.de ([78.47.199.104])
	by www637.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <git@apitzsch.eu>)
	id 1vBIeO-000JfS-1f;
	Tue, 21 Oct 2025 22:08:08 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy07.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <git@apitzsch.eu>)
	id 1vBIeO-0002CK-0M;
	Tue, 21 Oct 2025 22:08:08 +0200
Message-ID: <2232bf5e29f04b3af7ceb5f5d2a9edda295691f9.camel@apitzsch.eu>
Subject: Re: [PATCH v2 0/8] media: i2c: dw9719: add DT compatible and
 DW9718S support
From: =?ISO-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Mauro Carvalho Chehab
	 <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org, Daniel Scally <djrscally@gmail.com>, 
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, Val Packett
	 <val@packett.cool>
Date: Tue, 21 Oct 2025 22:08:06 +0200
In-Reply-To: <aPc2PoGa8mTx7KT1@kekkonen.localdomain>
References: <20250920-dw9719-v2-0-028cdaa156e5@apitzsch.eu>
	 <790fd7d05fa03f788f0a628a99b2e127db824207.camel@apitzsch.eu>
	 <750398e8-1781-47be-bccd-e2679a58d449@kernel.org>
	 <aPc2PoGa8mTx7KT1@kekkonen.localdomain>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.1 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Virus-Scanned: Clear (ClamAV 1.0.9/27799/Tue Oct 21 11:30:25 2025)

Hi Sakari,

Am Dienstag, dem 21.10.2025 um 10:29 +0300 schrieb Sakari Ailus:
> Hi Krzysztof, Andr=C3=A9,
>=20
> On Mon, Oct 20, 2025 at 10:45:51PM +0200, Krzysztof Kozlowski wrote:
> > On 20/10/2025 22:40, Andr=C3=A9 Apitzsch wrote:
> > > > =C2=A0.../bindings/media/i2c/dongwoon,dw9719.yaml=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 88
> > > > +++++++++++++++++
> > > > =C2=A0drivers/media/i2c/dw9719.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 110
> > > > +++++++++++++++++----
> > > > =C2=A02 files changed, 178 insertions(+), 20 deletions(-)
> > > > ---
> > > > base-commit: 846bd2225ec3cfa8be046655e02b9457ed41973e
> > > > change-id: 20250709-dw9719-8a8822efc1b1
> > > >=20
> > >=20
> > > Gentle ping.
> >=20
> > Please apply the patch and run checkpatch. Probably you received
> > checkpatch warnings from media patchwork, no?
>=20
> I've fixed it this time while applying it.

Thanks.

It seems you forgot to add the R-b tag from Rob [1] while applying the
patch [2].

Best regards,
Andr=C3=A9


[1] https://lore.kernel.org/linux-media/175857272737.1273170.82545299091209=
57681.robh@kernel.org/
[2] https://git.linuxtv.org/sailus/media_tree.git/commit/?id=3Dab8656612129=
46413ae4eecb3dddc5e98c9d0a3d

