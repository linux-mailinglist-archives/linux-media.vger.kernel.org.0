Return-Path: <linux-media+bounces-25862-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E1C1A2E0B7
	for <lists+linux-media@lfdr.de>; Sun,  9 Feb 2025 22:01:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 586173A5474
	for <lists+linux-media@lfdr.de>; Sun,  9 Feb 2025 21:01:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD5AB231A56;
	Sun,  9 Feb 2025 21:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=apitzsch.eu header.i=@apitzsch.eu header.b="sRgHRuqD"
X-Original-To: linux-media@vger.kernel.org
Received: from www637.your-server.de (www637.your-server.de [168.119.26.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1D5E230D2A;
	Sun,  9 Feb 2025 21:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.26.117
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739134902; cv=none; b=h0tJMeNmA7HwpFfKwgnve16cP4dMUVLrJjf2wxqw6avzL1gI184SQJ3UVSXOO8BBULMFSzy1Vj9qqKYF7XDip0w9y0JW6XM06k1S+GQTOzarAmTK58mHVQr6UvgY+vdV6FrMt6/zszdefk3aBzLHNrj1SzBtemMfA116RkIOltY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739134902; c=relaxed/simple;
	bh=YW8BrEcFZGZunDWeCJaDA2yHjRVW0c0c5+iUiSNODZk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hK2NLsZflJfOncYtW8ldsbrIn1Z2jhpJFrZIGNhJOMr5iFX4oigWc0g1N87kCRa3tlwnOjMx3JAw/Nxwd4h9bylTmMOa3agQfzNHKNB6fekYcmzcvXEwECB2+DQVJ9irblNMuAgSsUYiQlp/PV0MIjQv1DPj9YpGVjFMYhXSS8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=apitzsch.eu; spf=pass smtp.mailfrom=apitzsch.eu; dkim=pass (2048-bit key) header.d=apitzsch.eu header.i=@apitzsch.eu header.b=sRgHRuqD; arc=none smtp.client-ip=168.119.26.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=apitzsch.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=apitzsch.eu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=apitzsch.eu
	; s=default2410; h=MIME-Version:Content-Transfer-Encoding:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=YW8BrEcFZGZunDWeCJaDA2yHjRVW0c0c5+iUiSNODZk=; b=sRgHRuqDLv6ldG+iTvBwJRFpSc
	nRtD6OKenKdbbsgRTGzCt5hDWmJAfawUpnm+ldNj03zpFe93ylrNLqiXiQI0S4yeGoLeqF5nd2us2
	/qqikdcqOBcjw6/FJTLlQCJGS/a8yvCYlKTp3GvEESPMPl1LJMAnz40BjzYufOZ7y6ohxEerQiO4g
	LcHRLwtil4ijRaWtIluQc7ddSOei2xbV5qcWaS5LW0KS4LT5cTgS3O83sDS2WhUaO1SpG1TOj0r2Y
	iN1+X2taWovxIJfJRE9BS9Al3Fcs632fTvPMI0TgApirYXfXPdcYotNZd4gpreENlfif2yE20fTa5
	x6TcEmdA==;
Received: from sslproxy05.your-server.de ([78.46.172.2])
	by www637.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <git@apitzsch.eu>)
	id 1thEQj-000PpG-13;
	Sun, 09 Feb 2025 22:01:29 +0100
Received: from [92.206.120.88] (helo=framework.lan)
	by sslproxy05.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <git@apitzsch.eu>)
	id 1thEQj-000MLj-09;
	Sun, 09 Feb 2025 22:01:29 +0100
Message-ID: <3746957a5fd44c125152bc25033dee7d4f189663.camel@apitzsch.eu>
Subject: Re: [PATCH v2] media: dw9719: Add of_match table
From: =?ISO-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: Daniel Scally <djrscally@gmail.com>, Sakari Ailus	
 <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Sun, 09 Feb 2025 22:01:27 +0100
In-Reply-To: <Z6i5puujYD5sJ64n@valkosipuli.retiisi.eu>
References: <20250208-dw9761dts-v2-1-c038f8a2fb94@apitzsch.eu>
	 <Z6i5puujYD5sJ64n@valkosipuli.retiisi.eu>
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
X-Virus-Scanned: Clear (ClamAV 1.0.7/27544/Sun Feb  9 10:31:33 2025)

Hi,

Am Sonntag, dem 09.02.2025 um 14:20 +0000 schrieb Sakari Ailus:
> Hi Andr=C3=A9,
>=20
> On Sat, Feb 08, 2025 at 12:13:49PM +0100, Andr=C3=A9 Apitzsch via B4 Rela=
y
> wrote:
> > From: Andr=C3=A9 Apitzsch <git@apitzsch.eu>
> >=20
> > Add of_match table for "dongwoon,dw9719" and "dongwoon,dw9761"
> > compatible string. This fixes automatic driver loading when using a
> > device-tree, and if built as a module like major linux
> > distributions do.
> >=20
> > Signed-off-by: Andr=C3=A9 Apitzsch <git@apitzsch.eu>
>=20
> How about the DT bindings?
>=20
> The configuration should be documented, too. See e.g. for an example
> Documentation/devicetree/bindings/media/i2c/dongwoon,dw9768.yaml .
>=20

I was hoping, I could add it, when using the binding in a device tree.
I'll prepare a new version that also has a DT bindings patch.

Regards,
Andr=C3=A9

