Return-Path: <linux-media+bounces-24547-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 368A2A08045
	for <lists+linux-media@lfdr.de>; Thu,  9 Jan 2025 19:56:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 683BE3A8952
	for <lists+linux-media@lfdr.de>; Thu,  9 Jan 2025 18:56:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72F4F1A83F0;
	Thu,  9 Jan 2025 18:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=apitzsch.eu header.i=@apitzsch.eu header.b="0BdtBPXO"
X-Original-To: linux-media@vger.kernel.org
Received: from www637.your-server.de (www637.your-server.de [168.119.26.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F4019995B;
	Thu,  9 Jan 2025 18:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.26.117
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736448984; cv=none; b=uyPHOGOeX6IxlX1Yzw4Gj+CVat1HHGKjHipkgZVf78RLrSmATSxRzMmevg5J2Sv/LZHHA0GaHOzFaK+8KM6shjR/OgEUrnPo8tegoO8A0j1MbAge28Zje2xTRTAI6wkhrthKQ9JSOKcPUowJ6KpF3Gx5yQEwo8sSqB26c/z1VL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736448984; c=relaxed/simple;
	bh=6ZDyJ0vINuLFSE+rRlsnMLVlZPniCfxeVpaCzcHQduM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NoZz1YG5wkpANgb+ONVqRyVCjFMSfy2XAsbf4BekB2Fju9vMRpTF7dGKzoUGCUqSbup7SfvFquhGAXtDo1gdKF1/4b1lnrpE7ILmOkF8ocgGRomjfDYXMNXPnA9bk4XbEhmBxmTbUIeVODpbuNs7APqCxHTun2qVav/SPokPbqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=apitzsch.eu; spf=pass smtp.mailfrom=apitzsch.eu; dkim=pass (2048-bit key) header.d=apitzsch.eu header.i=@apitzsch.eu header.b=0BdtBPXO; arc=none smtp.client-ip=168.119.26.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=apitzsch.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=apitzsch.eu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=apitzsch.eu
	; s=default2410; h=MIME-Version:Content-Transfer-Encoding:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=6ZDyJ0vINuLFSE+rRlsnMLVlZPniCfxeVpaCzcHQduM=; b=0BdtBPXOwPhF9AOalm/Tg2/XI7
	CcgGjKRuhFX+EECO4G+M9dPUmqKZA3AF6IMEVHla7GoYwXE1sBaKdIOKMcAePPXCRDgu4f9CymixM
	8sMjW3x91ZDibqswnPP64xe6a0rj0sCFw4CYeCO81lSAXLugA/QXjtstz6KsDuxxdTc7JyKdEvCFX
	EzrABFr6aopzaEQkBRx9gNPZI0mCOONCQ43DYnCa6LSJjOro0b/5k8yRr/BMxspsCaI7qrjarf3tQ
	poa4awWAjs89dVJIs+eNXSM1uMpXXj0ZmRyHngsItOgD6BblDP8nd42JI9m2hRNyfGmDWTlHF7Ku/
	6Rrv5LIg==;
Received: from sslproxy04.your-server.de ([78.46.152.42])
	by www637.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <git@apitzsch.eu>)
	id 1tVxhY-000H6z-0s;
	Thu, 09 Jan 2025 19:56:16 +0100
Received: from [77.64.252.250] (helo=framework.lan)
	by sslproxy04.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <git@apitzsch.eu>)
	id 1tVxhX-000NvO-3C;
	Thu, 09 Jan 2025 19:56:16 +0100
Message-ID: <40ee8a0b289c19a5420dc38cf7dfdf1756ecffb0.camel@apitzsch.eu>
Subject: Re: [PATCH v6 12/13] media: i2c: imx214: Fix clock handling on
 probe error or remove
From: =?ISO-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Ricardo Ribalda <ribalda@kernel.org>, Mauro Carvalho Chehab	
 <mchehab@kernel.org>, ~postmarketos/upstreaming@lists.sr.ht, 
	phone-devel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Dave Stevenson
 <dave.stevenson@raspberrypi.com>,  Vincent Knecht
 <vincent.knecht@mailoo.org>, Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 09 Jan 2025 19:56:14 +0100
In-Reply-To: <Z3-P__hmxn2uCd_t@kekkonen.localdomain>
References: <20241220-imx214-v6-0-d90a185d82e5@apitzsch.eu>
	 <20241220-imx214-v6-12-d90a185d82e5@apitzsch.eu>
	 <Z35mt_ViYmrJLKZb@kekkonen.localdomain>
	 <97f7de9efc16f01b29f98dc888329db33715275c.camel@apitzsch.eu>
	 <Z3-P__hmxn2uCd_t@kekkonen.localdomain>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Authenticated-Sender: andre@apitzsch.eu
X-Virus-Scanned: Clear (ClamAV 1.0.7/27513/Thu Jan  9 10:53:02 2025)

Hi Sakari,

Am Donnerstag, dem 09.01.2025 um 08:59 +0000 schrieb Sakari Ailus:
> Hi Andr=C3=A9,
>=20
> On Wed, Jan 08, 2025 at 10:46:51PM +0100, Andr=C3=A9 Apitzsch wrote:
> > Hi Sakari,
> >=20
> > Am Mittwoch, dem 08.01.2025 um 11:51 +0000 schrieb Sakari Ailus:
> > > Hi Andr=C3=A9,
> > >=20
> > > Thanks for the update.
> > >=20
> > > On Fri, Dec 20, 2024 at 02:26:11PM +0100, Andr=C3=A9 Apitzsch via B4
> > > Relay
> > > wrote:
> > > > From: Andr=C3=A9 Apitzsch <git@apitzsch.eu>
> > > >=20
> > > > The driver should disable or unprepare the clock on probe error
> > > > and
> > > > on
> > > > removing the module.
> > > >=20
> > > > Remove regulator_bulk_disable(), because it is called by
> > > > imx214_power_off().
> > > >=20
> > > > Acked-by: Ricardo Ribalda <ribalda@chromium.org>
> > > > Signed-off-by: Andr=C3=A9 Apitzsch <git@apitzsch.eu>
> > >=20
> > > This and the next one appear to be bugfixes. I think it'd be
> > > reasonable to backport them. Any idea where this got broken, for
> > > the
> > > Fixes: tag?
> > > The bug fixed by the last patch was probably introduced with the
> > > driver?
> > >=20
> >=20
> > I think both, the missing imx214_power_off() and the wrong link
> > frequency where introduced with
> > > 436190596241 ("media: imx214: Add imx214 camera sensor driver")
> >=20
> > The first one could also be considered as a fix for the incomplete
> > > 9bc92332cc3f ("media: imx214: Fix the error handling in
> > > imx214_probe()")
>=20
> This one seems to have missed review. :-(
>=20
> >=20
> > Shall I submit a new version with the Fixes: tag?
>=20
> I checked the fix again and it seems the problem isn't as simple:
> pm_runtime_idle() call leads to powering the device off. It needs to
> either be resumed first or the call to imx214_power_off() be omitted.
>=20
> I tried to find a good example but the few I found are buggy. :-(
> Getting runtime PM right is just hard. I'll drop the last patch and
> post another to address the problem (plus the intended example
> drivers) if you're fine with that.
>=20

Fine by me. Go ahead.

Regards,
Andr=C3=A9

