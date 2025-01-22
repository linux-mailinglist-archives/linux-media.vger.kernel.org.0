Return-Path: <linux-media+bounces-25170-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D8B7A19A12
	for <lists+linux-media@lfdr.de>; Wed, 22 Jan 2025 22:01:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 370A516A3AE
	for <lists+linux-media@lfdr.de>; Wed, 22 Jan 2025 21:01:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 112AC1C54BE;
	Wed, 22 Jan 2025 21:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=apitzsch.eu header.i=@apitzsch.eu header.b="r9s5l5Z2"
X-Original-To: linux-media@vger.kernel.org
Received: from www637.your-server.de (www637.your-server.de [168.119.26.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35AEF8F7D
	for <linux-media@vger.kernel.org>; Wed, 22 Jan 2025 21:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.26.117
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737579669; cv=none; b=u36Bojs4abyOxiBLff/ZnNcRhfD6QNEisow+2pYbQMZlfSxjY7zPiQVcYINNrNFLcNk8EkWHD5DbpfRiJ6r3jGGPQRITeSx1WuZCqnNTHuLg6o4OpARSI29oARbCGALMqblhWnXuD4pZcWisFRGl0BRkunXZCFsc1/q/DgqynKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737579669; c=relaxed/simple;
	bh=T9d6WruKNlt+XGHLaaByRZluCtxqfyY22ejvh4le/lE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=d9OFVRNofIG5+CSJmF56+YCRVEOAZxZfV9dDbJiifLgsDvLFr5TbTHLriS33+IGgc/MT42BFc9o5GFCRvmkiWn7CkqlnHWJZj/ZwqOEqkLsmrvYBSS24Xkxp437MumFDhH61K0660sGKotgsZc++WdfaXY3TBlH+LrHXX3c6/ZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=apitzsch.eu; spf=pass smtp.mailfrom=apitzsch.eu; dkim=pass (2048-bit key) header.d=apitzsch.eu header.i=@apitzsch.eu header.b=r9s5l5Z2; arc=none smtp.client-ip=168.119.26.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=apitzsch.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=apitzsch.eu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=apitzsch.eu
	; s=default2410; h=MIME-Version:Content-Transfer-Encoding:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=T9d6WruKNlt+XGHLaaByRZluCtxqfyY22ejvh4le/lE=; b=r9s5l5Z2reur8c+PecIRfnGTTm
	S/LbwxmYq6xSQpTzLMzy2HRMls+GQB0Jv7LqQwhoc6i6kqfXa28zMGP8+vOQYemNWWqaaTmhG/J18
	k2PwOJ3k3KKeeU6cmjT3mw3GYCGkWp9Hm5+a3oAlVH1KneIM31wcgk44q4+0Jic0PPujjC4CQc/cD
	E88NY+G3XdEM2H5j7jV9CPI2/nyW1dUPUFqEujqHM69ORScKBwoiPoUa3H/qnjIHsGl8hSSv0FDCQ
	g5xY8+CPG7Nfb/zvHuijGPHAG4/HmVRFYThCbV7xsJvnPhnhimHErkBC9/CPwHTrbh1GhA54IkIfq
	VE8Hj+tQ==;
Received: from sslproxy07.your-server.de ([78.47.199.104])
	by www637.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <git@apitzsch.eu>)
	id 1tahqK-000F9X-0i;
	Wed, 22 Jan 2025 22:00:56 +0100
Received: from [92.206.120.91] (helo=framework.lan)
	by sslproxy07.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <git@apitzsch.eu>)
	id 1tahqK-0000kx-0p;
	Wed, 22 Jan 2025 22:00:56 +0100
Message-ID: <19c569694ef2726172fced5a1a30ecab912553d8.camel@apitzsch.eu>
Subject: Re: [PATCH 0/2] Fix PM on imx214 error paths
From: =?ISO-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, Ricardo Ribalda <ribalda@kernel.org>
Date: Wed, 22 Jan 2025 22:00:54 +0100
In-Reply-To: <Z5DexPyuveWLzlJm@kekkonen.localdomain>
References: <20250116114700.67468-1-sakari.ailus@linux.intel.com>
	 <2eca7df04384f81372c30f6711871a53d8063174.camel@apitzsch.eu>
	 <Z5DexPyuveWLzlJm@kekkonen.localdomain>
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
X-Virus-Scanned: Clear (ClamAV 1.0.7/27526/Wed Jan 22 10:40:03 2025)

Hi Sakari,

Am Mittwoch, dem 22.01.2025 um 12:04 +0000 schrieb Sakari Ailus:
> Hi Andr=C3=A9,
>=20
> On Mon, Jan 20, 2025 at 08:57:39PM +0100, Andr=C3=A9 Apitzsch wrote:
> > Hi Sakari,
> >=20
> > Am Donnerstag, dem 16.01.2025 um 13:46 +0200 schrieb Sakari Ailus:
> > > Hi Andr=C3=A9,
> > >=20
> > > I'm posting this separately as it seems to be backportable, your
> > > set
> > > needs to go on the top. I've pushed that to my "devel" branch in
> > > my
> > > git.linuxtv.org tree
> > > <URL:https://git.linuxtv.org/sailus/media_tree.git/>,
> > > please let me know if you see problems.
> >=20
> > The patches look good to me. I don't see any problems, but I
> > haven't
> > tested the error paths. That's why no "Tested-by".
> >=20
> > Acked-by: Andr=C3=A9 Apitzsch <git@apitzsch.eu>
> >=20
> > Shall I send a new version of my patches rebased on yours or can my
> > patches be taken from your "devel" branch?
>=20
> If you're fine with the result of my rebase, there's no need to.
>=20
I'm fine with that.

Andr=C3=A9

