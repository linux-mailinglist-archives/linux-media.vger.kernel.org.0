Return-Path: <linux-media+bounces-42734-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8805FB8725B
	for <lists+linux-media@lfdr.de>; Thu, 18 Sep 2025 23:31:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 47E057E5373
	for <lists+linux-media@lfdr.de>; Thu, 18 Sep 2025 21:31:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7082B2ED85D;
	Thu, 18 Sep 2025 21:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=apitzsch.eu header.i=@apitzsch.eu header.b="tUKiFPM1"
X-Original-To: linux-media@vger.kernel.org
Received: from www637.your-server.de (www637.your-server.de [168.119.26.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19D8B86342;
	Thu, 18 Sep 2025 21:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.26.117
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758231094; cv=none; b=ntPhaEmlPV5psGgnjCcf5Sd1VTWI2O4hq7Zk65RBylTYlgGjdbKxr06RCr7fNGc7yRrpLwtqL8CoPA0RSaVcl0AQeREeMyB3iuMUKCT+XUH5oJqo2AD2Zb4vj/JbM/0BtGgF7j43atUCU3rfay9ESjoHhQeb5lP8nVJbmBFpGiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758231094; c=relaxed/simple;
	bh=XRP3BRzw4PTthp+BvbIBnXlgMbZK3cuX60MpXQlz+jo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=B/SMyjn1AnkgtjbZZG4MoEGDw/0PlNhIjrarZTotSZqIxQxyXFzXoVUYzr84saee2ALUpstILjbkUVt5HxxqFw+Wy1cPcklLjdUAKPWwEg1yA9zE0NGTnFMzBBnGmTvnV1JSoQAaCOS+FfeSx1Lv6id2gx1qjCDPAhmi/uLDvvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=apitzsch.eu; spf=pass smtp.mailfrom=apitzsch.eu; dkim=pass (2048-bit key) header.d=apitzsch.eu header.i=@apitzsch.eu header.b=tUKiFPM1; arc=none smtp.client-ip=168.119.26.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=apitzsch.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=apitzsch.eu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=apitzsch.eu
	; s=default2410; h=MIME-Version:Content-Transfer-Encoding:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=9k36Yx116Uyq432ZKnjyvbWAnWv4qokj8porc2uvnG8=; b=tUKiFPM1F4JeTCYVBYkZfj96MR
	fTvSJnfCrD6bBIxqjd0x7PpdFVR2X6+pToTsTfLGYgHPO3eHpJzpKA6HUZ/oJnKAcj2BQR0/tEBVE
	TvDymarobfc5gMHoss9dIT1tZCGPMlBnDsAMOK/UoII2e0Y6I36e/P+LkWd5LRveTzKQXIyrmCYO0
	QZJzkFOAnd2mM5aVTAGia5O/7WljdJo91SdrgkBaBAI+4UEYf1uGqQWlKri/pkSCVTbdKOmnbWzAC
	VXZr4AK/HNN1FWcGuz0dnLnFdl20ZWgke4BAscqHl/JgL4srI/69dTMtMY+W9K6WQDw9Pgjx8SPIV
	9T213Bcw==;
Received: from sslproxy07.your-server.de ([78.47.199.104])
	by www637.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <git@apitzsch.eu>)
	id 1uzMDo-0003xr-1L;
	Thu, 18 Sep 2025 23:31:20 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy07.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <git@apitzsch.eu>)
	id 1uzMDn-000NGJ-1l;
	Thu, 18 Sep 2025 23:31:19 +0200
Message-ID: <048dd9a2d3257ddea4e4223b023bde9747469083.camel@apitzsch.eu>
Subject: Re: [PATCH 7/7] media: i2c: dw9719: Fix power on/off sequence
From: =?ISO-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, Val Packett
 <val@packett.cool>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, 	devicetree@vger.kernel.org, Daniel Scally
 <djrscally@gmail.com>, 	~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org, 	linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Thu, 18 Sep 2025 23:31:18 +0200
In-Reply-To: <aMqI-lElZsWV-Hrl@kekkonen.localdomain>
References: <20250817-dw9719-v1-0-426f46c69a5a@apitzsch.eu>
	 <20250817-dw9719-v1-7-426f46c69a5a@apitzsch.eu>
	 <aKLZ39IzI_azrDIu@kekkonen.localdomain>
	 <550f28a9aa82a28beb35fd3490dbe08928ba9eed.camel@apitzsch.eu>
	 <fad5cb33-0e7c-499b-bad7-bbdacca8076a@packett.cool>
	 <aMqI-lElZsWV-Hrl@kekkonen.localdomain>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.0 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Virus-Scanned: Clear (ClamAV 1.0.9/27766/Thu Sep 18 10:27:50 2025)

Hi Sakari,

Am Mittwoch, dem 17.09.2025 um 13:10 +0300 schrieb Sakari Ailus:
> Hi Andr=C3=A9, Val,
>=20
> On Tue, Sep 16, 2025 at 05:08:44PM -0300, Val Packett wrote:
> >=20
> > On 9/15/25 5:48 PM, Andr=C3=A9 Apitzsch wrote:
> > > Hi Sakari,
> > >=20
> > > @Val, please see below.
> > >=20
> > > Am Montag, dem 18.08.2025 um 07:44 +0000 schrieb Sakari Ailus:
> > > > Hi Andr=C3=A9,
> > > >=20
> > > > On Sun, Aug 17, 2025 at 07:09:26PM +0200, Andr=C3=A9 Apitzsch via B=
4
> > > > Relay wrote:
> > > > > =C2=A0=C2=A0	u64 val;
> > > > > =C2=A0=C2=A0	int ret;
> > > > > =C2=A0=C2=A0	int err;
> > > > > @@ -109,13 +116,15 @@ static int dw9719_power_up(struct
> > > > > dw9719_device *dw9719, bool detect)
> > > > > =C2=A0=C2=A0	if (ret)
> > > > > =C2=A0=C2=A0		return ret;
> > > > > -	/* Jiggle SCL pin to wake up device */
> > > > > -	reg_pwr =3D (dw9719->model =3D=3D DW9718S) ? DW9718S_PD :
> > > > > DW9719_CONTROL;
> > > > > -	cci_write(dw9719->regmap, reg_pwr, DW9719_SHUTDOWN,
> > > > > &ret);
> > > > > -	fsleep(100);
> > > > > +	/*
> > > > > +	 * Need 100us to transition from SHUTDOWN to
> > > > > STANDBY.
> > > > > +	 * Jiggle the SCL pin to wake up the device (even
> > > > > when the
> > > > > regulator
> > > > > +	 * is shared) and wait double the time to be sure,
> > > > > then
> > > > > retry the write.
> > > > Why double? Isn't the datasheet correct when it comes to the
> > > > power-on sequence?
> > > >=20
> > > I haven't noticed any problems during power-up of DW9761.
> > > However, according to the commit message, there seems be an issue
> > > with DW9718S. But I don't own the device and cannot test it.
> > >=20
> > > Maybe Val can provided some additional information.
> >=20
> > I haven't had access to the datasheet for the DW9718S, so this was
> > all deduced experimentally. By "to be sure" I meant that I
> > literally raised the timeout "just in case", not based on actual
> > issues.
> >=20
> > The actually important change was expecting the failure on the
> > write and not erroring out.
>=20
> Ack.
>=20
> Andr=C3=A9: could you add this information to the comment as well?

Could you clarify which information.

Best regards,
Andr=C3=A9

