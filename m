Return-Path: <linux-media+bounces-45775-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E1CEC13D3A
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 10:33:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D43CC1A6477C
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 09:32:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01B71301715;
	Tue, 28 Oct 2025 09:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A8GuF+2C"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 543BA2D4813;
	Tue, 28 Oct 2025 09:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761643929; cv=none; b=MgMqjkjveHUQk89mK1joOcSuagIL5M+gvWetUI1URHTb9YM7aS7OVmZqKBE0xxL7UPmDJPxy9qdmBhzIZd0loEd/YADfQITQpDd6ZBiEQzNwRLNteWzjxA0hcHJxBYpdSiS4n0iLGx10wl6Nv6u8TcpAxY/NeX3K1ruiOxzSO1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761643929; c=relaxed/simple;
	bh=VGec7L1K3/ls04vGgFBjzEMz/ItTRy+/HlhRqpV5zYA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ojTSu0Vn4r8rnPgNHw4V7vSUaWNXBwAtgXtaezFCMX44ZDu9/kcNtn4Gl9NkqED7ZDRUDpzOmxQcyBWKXPSEO6ej3lrCt9dG1Jwi99tFPZcMhYXWTyB21ghSbG855gy5G2DS40Y92UuqCZqjdDdgJHsIqc4mgewx1JsvXs3py1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A8GuF+2C; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD8BBC4CEE7;
	Tue, 28 Oct 2025 09:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761643925;
	bh=VGec7L1K3/ls04vGgFBjzEMz/ItTRy+/HlhRqpV5zYA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A8GuF+2C0gkg1jR1+zGVr+ql1TzwWyBiUNtHdbNYldTOUsADT8IgzVDkW2AEiWPy4
	 8i4a6idUC4IfmaWCKjCLZLDy+BO3RNCTSFJRa/q4v6Dl8gxZqQAEvE8dY2bl8mg2Hd
	 3io+Lj8zAbN+ByG1oN5O5vBhRNvNCy2iYbX2acO6YQ6lU1NuZEg7HyNSMF8bL7bG2j
	 pXi/jpy9BShw7NR3R5/37B5xirDasa352fRLMQMg+I1PKdppeEUcvusNApTlbBEm2F
	 wm4+J96spMJzxz6EGipmKJUD1jDygu9URQHTzf8fXHbAQviw2Piaeyow350Q8hhL9A
	 jA8+oPlWAOFFw==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vDg3l-000000000Rm-0xYa;
	Tue, 28 Oct 2025 10:32:09 +0100
Date: Tue, 28 Oct 2025 10:32:09 +0100
From: Johan Hovold <johan@kernel.org>
To: Nicolas Dufresne <nicolas@ndufresne.ca>
Cc: Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
	Houlong Wei <houlong.wei@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Tiffany Lin <tiffany.lin@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Hans Verkuil <hans.verkuil@cisco.com>, linux-media@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] media: mediatek: fix VPU device leaks on probe
Message-ID: <aQCNmZpOquAlL49K@hovoldconsulting.com>
References: <20250924133552.28841-1-johan@kernel.org>
 <aP91nfnpShIhXcVQ@hovoldconsulting.com>
 <ac27d9b1da68746c62c03047fd7896e2303ef1fd.camel@ndufresne.ca>
 <aQB9BIjXEOHpIy3_@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/z9wxTx+yneLrdmE"
Content-Disposition: inline
In-Reply-To: <aQB9BIjXEOHpIy3_@hovoldconsulting.com>


--/z9wxTx+yneLrdmE
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 28, 2025 at 09:21:24AM +0100, Johan Hovold wrote:
> On Mon, Oct 27, 2025 at 07:29:39PM +0000, Nicolas Dufresne wrote:
> > Le lundi 27 octobre 2025 =C3=A0 14:37 +0100, Johan Hovold a =C3=A9crit=
=C2=A0:
> > > On Wed, Sep 24, 2025 at 03:35:49PM +0200, Johan Hovold wrote:
> > > > This series fixes VPU device leaks during probe of the mdp and two =
codec
> > > > drivers.
> > > >=20
> > > > Included is also a minor documentation update to make it clear that=
 the
> > > > VPU lookup helper returns the device with an incremented refcount.
> > >=20
> > > Can these be picked up for 6.19?
> >=20
> > They are picked already, please check in the tree,
> >=20
> > https://gitlab.freedesktop.org/linux-media/media-committers/-/commits/n=
ext
>=20
> I can't seem to find them in that branch either, and they are not in
> linux-next.=20
>=20
> (I seem to have trimmed my original message too much so that the patch
> summaries were not included in my reminder. Perhaps you are thinking of
> the related mtk-mdp3 fix?)
>=20
> But I do see an incomplete attempt at a fix of the reference leak in
> that branch by someone else in commit cdd0f118ef87 ("media: mediatek:
> vcodec: Fix a reference leak in mtk_vcodec_fw_vpu_init()")
>=20
> Can that commit be dropped in favour of this series or shall I rebase on
> top of it?

Scratch that. The merged commit is correct. I'll respin this series on
top.

Johan

--/z9wxTx+yneLrdmE
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQQHbPq+cpGvN/peuzMLxc3C7H1lCAUCaQCNlQAKCRALxc3C7H1l
CNI1AP4mIpY9GNfiGHVm9Z4vAFW+glStwC22iPrdWVr53rxShgD+OHcwlYKvCt+/
P8dYWux9RIhpLNyNVx4owqhrd7Dv8go=
=J7Jh
-----END PGP SIGNATURE-----

--/z9wxTx+yneLrdmE--

