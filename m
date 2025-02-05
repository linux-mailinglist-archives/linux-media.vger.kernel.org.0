Return-Path: <linux-media+bounces-25703-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 311EBA29CC8
	for <lists+linux-media@lfdr.de>; Wed,  5 Feb 2025 23:42:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 341741888D96
	for <lists+linux-media@lfdr.de>; Wed,  5 Feb 2025 22:42:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 196AD21B19F;
	Wed,  5 Feb 2025 22:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=apitzsch.eu header.i=@apitzsch.eu header.b="QVizhJ+k"
X-Original-To: linux-media@vger.kernel.org
Received: from www637.your-server.de (www637.your-server.de [168.119.26.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56F6E192D83
	for <linux-media@vger.kernel.org>; Wed,  5 Feb 2025 22:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.26.117
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738795333; cv=none; b=VLCR3R/VpEwt9zh1DAgXEbUT9rU6oiBZzWX2wfmRSGK2XMUuBEEVHTzyB7ax4xlF6TvgIc3Bn7/CibnAMi6b0F6Zs8sjoeB24+MojrD7xtgK6X+8sAYT/aiI2fZW+ZNvp9EvCBiWGianaQImKUjMmI7cT50a5MXN3EQVcYZQcr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738795333; c=relaxed/simple;
	bh=4mql5SVNsDOo2QYnpMLRAXuiuywoweev93lDk88oRpE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=f1y62rSd8nr6qzh4+ffHqh0J6id34z9rK1FSf6vfSdovbG4OfHRvuKoKcmNMxDwTa5uDxnQxce3OeqjsLETpxw55AdYrxZGLZ7D1B6mcr7sF+6Y9T/KoSdOe9kZApaEhUILr8cbXhrQ4Y9bhletsnrTuUWC3thH7+OCqNf8vCxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=apitzsch.eu; spf=pass smtp.mailfrom=apitzsch.eu; dkim=pass (2048-bit key) header.d=apitzsch.eu header.i=@apitzsch.eu header.b=QVizhJ+k; arc=none smtp.client-ip=168.119.26.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=apitzsch.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=apitzsch.eu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=apitzsch.eu
	; s=default2410; h=MIME-Version:Content-Transfer-Encoding:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=4mql5SVNsDOo2QYnpMLRAXuiuywoweev93lDk88oRpE=; b=QVizhJ+kcr9O/o90F40/JF4NvO
	dNJKEJsVUOD0c8Va0pEDJ+tRuR3Xikb+3vBkeWkaGNYUaI5UTCoiFAqdNL5cv7CgxOHXSTME0oA7z
	2t/pKCTRWJ5Apz9knE5h0tyz2IXVpWlqt1VBcQdeWUd/W+DElhAwPGa647KAvTJsTiP4MuGv+qfhe
	0UBxcO2nSLTzw+E4iI9rkEObh/mIXpwXM9M5/kWkU1ZMzFQMX9Q9TFf6otDjsyRDRG/k3T599seiT
	v9UA4fafacsKjlajUnPxkmsHD8igHQelxVaTQm4vbfmuGZjgXBnfnA/qaK9vOP4L9SANXJcsnkxX+
	fUgCfsIw==;
Received: from sslproxy08.your-server.de ([78.47.166.52])
	by www637.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <git@apitzsch.eu>)
	id 1tfniA-000FbC-2i;
	Wed, 05 Feb 2025 23:17:34 +0100
Received: from [92.206.120.88] (helo=framework.lan)
	by sslproxy08.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <git@apitzsch.eu>)
	id 1tfniA-00059p-2A;
	Wed, 05 Feb 2025 23:17:34 +0100
Message-ID: <85fe1a1ccfd446e98afd648ef70b82a95943c98c.camel@apitzsch.eu>
Subject: Re: [PATCH 0/2] Fix PM on imx214 error paths
From: =?ISO-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, Ricardo Ribalda <ribalda@kernel.org>
Date: Wed, 05 Feb 2025 23:17:33 +0100
In-Reply-To: <Z5HzVupCvL7LBhbC@kekkonen.localdomain>
References: <20250116114700.67468-1-sakari.ailus@linux.intel.com>
	 <2eca7df04384f81372c30f6711871a53d8063174.camel@apitzsch.eu>
	 <Z5DexPyuveWLzlJm@kekkonen.localdomain>
	 <19c569694ef2726172fced5a1a30ecab912553d8.camel@apitzsch.eu>
	 <Z5HzVupCvL7LBhbC@kekkonen.localdomain>
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
X-Virus-Scanned: Clear (ClamAV 1.0.7/27540/Wed Feb  5 10:42:02 2025)

Hi Sakari,

Am Donnerstag, dem 23.01.2025 um 07:44 +0000 schrieb Sakari Ailus:
> On Wed, Jan 22, 2025 at 10:00:54PM +0100, Andr=C3=A9 Apitzsch wrote:
> > Hi Sakari,
> >=20
> > Am Mittwoch, dem 22.01.2025 um 12:04 +0000 schrieb Sakari Ailus:
> > > Hi Andr=C3=A9,
> > >=20
> > > On Mon, Jan 20, 2025 at 08:57:39PM +0100, Andr=C3=A9 Apitzsch wrote:
> > > > Hi Sakari,
> > > >=20
> > > > Am Donnerstag, dem 16.01.2025 um 13:46 +0200 schrieb Sakari
> > > > Ailus:
> > > > > Hi Andr=C3=A9,
> > > > >=20
> > > > > I'm posting this separately as it seems to be backportable,
> > > > > your set needs to go on the top. I've pushed that to my
> > > > > "devel" branch in my git.linuxtv.org tree
> > > > > <URL:https://git.linuxtv.org/sailus/media_tree.git/>,
> > > > > please let me know if you see problems.
> > > >=20
> > > > The patches look good to me. I don't see any problems, but I
> > > > haven't tested the error paths. That's why no "Tested-by".
> > > >=20
> > > > Acked-by: Andr=C3=A9 Apitzsch <git@apitzsch.eu>
> > > >=20
> > > > Shall I send a new version of my patches rebased on yours or
> > > > can my patches be taken from your "devel" branch?
> > >=20
> > > If you're fine with the result of my rebase, there's no need to.
> > >=20
> > I'm fine with that.
>=20
> Ack, thanks!
>=20

What is missing to get your and my imx214 changes into next?

Regards,
Andr=C3=A9

