Return-Path: <linux-media+bounces-25005-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A732A1738D
	for <lists+linux-media@lfdr.de>; Mon, 20 Jan 2025 21:19:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A6EC9169915
	for <lists+linux-media@lfdr.de>; Mon, 20 Jan 2025 20:19:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F3471EE7A7;
	Mon, 20 Jan 2025 20:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=apitzsch.eu header.i=@apitzsch.eu header.b="sBzwCZVg"
X-Original-To: linux-media@vger.kernel.org
Received: from www637.your-server.de (www637.your-server.de [168.119.26.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F47D155A52
	for <linux-media@vger.kernel.org>; Mon, 20 Jan 2025 20:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.26.117
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737404391; cv=none; b=n3Q7Wu1VfW2ZQR7pYJmXZcn0XbompPfzGcIEG9i4an511msRMtlkR2ElR3Bvpnd3lDiIfVZu5zNCJBKYH0d7c2qhJQRR3M/BSR89JwFGhI6Y9Y3HISixPXM7tA1diBZxQW1m51+0nniyhalqTPajl5HzI08ADr1cVnouXXPd8DI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737404391; c=relaxed/simple;
	bh=sbY/FOoe7QDrUGAzL///BuvPaf58gYM2pkpSza1OLiw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=T3fgaczqE+ghusOYs37Mgo+hW78xCP6raDP1qdJ96ZcgIUHA7+URRYwxiW8Z3xSJTMcdeGtDsm9l1fMo3EoWgpesGIM1A/R0mlR2R2NU9IgSuYfDaiQPveaekBSVLFE3mLTcgVSBZuHgGD2oD92hf5UtMja0pI06hok2FWtWyiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=apitzsch.eu; spf=pass smtp.mailfrom=apitzsch.eu; dkim=pass (2048-bit key) header.d=apitzsch.eu header.i=@apitzsch.eu header.b=sBzwCZVg; arc=none smtp.client-ip=168.119.26.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=apitzsch.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=apitzsch.eu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=apitzsch.eu
	; s=default2410; h=MIME-Version:Content-Transfer-Encoding:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=sbY/FOoe7QDrUGAzL///BuvPaf58gYM2pkpSza1OLiw=; b=sBzwCZVg0G3dcWKnrfWspxDz3L
	SmLiOl7TWCAy3r/9+dIu2d2nSnlI8l9apOPE08ziGlMfRI+sAmlIxEtCfGpTQ3JQNWKhvMyhSSZq8
	bYeM1X9P6Ac4p93RL5D8nPNROnhX4sjSzBkUOy9cLiD2bwm7QIOue1oMHLxAUajCO9emmgXErdejx
	baMft6QYi97PViicsM79cuUNrkQeCbCi8gR4CXheytZE52ADZKL0YUo2n8lXMvpYFRugIRMIn9MbI
	j5y7ZVUPtdzJS7HirrAG+4+otPIiL93CnAaenijWSRI3D7lnlbg1t+gDnqdJwh1iiwHJ0hQSQN2vN
	+kQzNNNw==;
Received: from sslproxy05.your-server.de ([78.46.172.2])
	by www637.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <git@apitzsch.eu>)
	id 1tZxu1-000CeF-1I;
	Mon, 20 Jan 2025 20:57:41 +0100
Received: from [92.206.120.91] (helo=framework.lan)
	by sslproxy05.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <git@apitzsch.eu>)
	id 1tZxu1-0000QY-0d;
	Mon, 20 Jan 2025 20:57:41 +0100
Message-ID: <2eca7df04384f81372c30f6711871a53d8063174.camel@apitzsch.eu>
Subject: Re: [PATCH 0/2] Fix PM on imx214 error paths
From: =?ISO-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Cc: Ricardo Ribalda <ribalda@kernel.org>
Date: Mon, 20 Jan 2025 20:57:39 +0100
In-Reply-To: <20250116114700.67468-1-sakari.ailus@linux.intel.com>
References: <20250116114700.67468-1-sakari.ailus@linux.intel.com>
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
X-Virus-Scanned: Clear (ClamAV 1.0.7/27524/Mon Jan 20 10:37:47 2025)

Hi Sakari,

Am Donnerstag, dem 16.01.2025 um 13:46 +0200 schrieb Sakari Ailus:
> Hi Andr=C3=A9,
>=20
> I'm posting this separately as it seems to be backportable, your set
> needs to go on the top. I've pushed that to my "devel" branch in my
> git.linuxtv.org tree
> <URL:https://git.linuxtv.org/sailus/media_tree.git/>,
> please let me know if you see problems.

The patches look good to me. I don't see any problems, but I haven't
tested the error paths. That's why no "Tested-by".

Acked-by: Andr=C3=A9 Apitzsch <git@apitzsch.eu>

Shall I send a new version of my patches rebased on yours or can my
patches be taken from your "devel" branch?

Regards,
Andr=C3=A9

>=20
> Sakari Ailus (2):
> =C2=A0 Revert "media: imx214: Fix the error handling in imx214_probe()"
> =C2=A0 media: i2c: imx214: Rectify probe error handling related to runtim=
e
> PM
>=20
> =C2=A0drivers/media/i2c/imx214.c | 25 +++++++++++++++----------
> =C2=A01 file changed, 15 insertions(+), 10 deletions(-)
>=20


