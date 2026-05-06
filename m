Return-Path: <linux-media+bounces-60570-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mJ89NT4T+2lLWQMAu9opvQ
	(envelope-from <linux-media+bounces-60570-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 12:09:02 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BE7A4D924B
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 12:09:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 61DA9300D476
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2026 10:08:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CF223F23DD;
	Wed,  6 May 2026 10:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oFkGu383"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 852F336308F;
	Wed,  6 May 2026 10:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778062108; cv=none; b=q6Bv4Tn/QNkDoGu41Ta3ehteAQl+/7KoaeSpFdjhm/J4F6AQPv+Rmt08wJUbOB2nszE3i5wqDXmkiaF1o+hn+Ut80RYrYWcmtFuOA9537N+Lof9ZdYsZXtzVBR/Q05bc5FSEIGTtC134Tg2BwG2aI8HWbLr00rWxrVMXV1aTCrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778062108; c=relaxed/simple;
	bh=nZfzghg9raBxGwuKMfOIWHSA+G1JIUmQ1fcBxRlBfWg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X4qxCxkqymZeOgt4oyasKMtGkzB8mU5H8YqrQMX5W4bDZ9bH5DBNSmOT3Nc1d7jnlDyGMS0QNTCl/LfhBFcV6M1/twr5+7l/1S/LoOsqJMplFsFyBGsgZSkI00zDHql0zzYglt+aNdwekcN1wiaXAKM8R5Z6SXLeSBDxjd4T+sU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oFkGu383; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B330C2BCB8;
	Wed,  6 May 2026 10:08:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778062107;
	bh=nZfzghg9raBxGwuKMfOIWHSA+G1JIUmQ1fcBxRlBfWg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oFkGu383UAaW75R93fVSjEMMqQxImk1WhOeGq3XmlMxt3RERxCCOKdijAT1RgWjwe
	 NFjFSQngx3fbEzsXhnmCnXPtSylbKo9eCMB+/LRQuBa0CcExkEyZWs0RgjPaXMuwhl
	 eJ59DOUK79ncDdnxtDrKxY6BhzuUfjrhrspnaSoR/WmLGuGYOIBOZEwcsEbn+2fKQq
	 xC+abC70rOGVB21uZSMyBO7wohlbnIoDcgGfIUdfxOX0zV+m58rS2m8QXHy61U92i+
	 wPkQx+daa9KbhlV/w/3PvD+t9QVJi4QwlKwjXeZ+uD8foC+z9XaE5Tp+z5L7dEB0MX
	 a3qn6yw6o+Yjw==
Date: Wed, 6 May 2026 12:08:24 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Ketil Johnsen <ketil.johnsen@arm.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
	"T.J. Mercier" <tjmercier@google.com>, Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
	Boris Brezillon <boris.brezillon@collabora.com>, Steven Price <steven.price@arm.com>, 
	Liviu Dudau <liviu.dudau@arm.com>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Alice Ryhl <aliceryhl@google.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Florent Tomasin <florent.tomasin@arm.com>
Subject: Re: [PATCH 4/8] drm/panthor: Add support for protected memory
 allocation in panthor
Message-ID: <20260506-energetic-azure-pig-2b6ec4@houat>
References: <20260505140516.1372388-1-ketil.johnsen@arm.com>
 <20260505140516.1372388-5-ketil.johnsen@arm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="bm3tokjqjresnbu6"
Content-Disposition: inline
In-Reply-To: <20260505140516.1372388-5-ketil.johnsen@arm.com>
X-Rspamd-Queue-Id: 1BE7A4D924B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60570-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	FREEMAIL_CC(0.00)[gmail.com,ffwll.ch,linux.intel.com,suse.de,lwn.net,linuxfoundation.org,linaro.org,collabora.com,arm.com,google.com,amd.com,lists.freedesktop.org,vger.kernel.org,lists.linaro.org,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mripard@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]


--bm3tokjqjresnbu6
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 4/8] drm/panthor: Add support for protected memory
 allocation in panthor
MIME-Version: 1.0

Hi,

On Tue, May 05, 2026 at 04:05:10PM +0200, Ketil Johnsen wrote:
> From: Florent Tomasin <florent.tomasin@arm.com>
>=20
> This patch allows Panthor to allocate buffer objects from a
> protected heap. The Panthor driver should be seen as a consumer
> of the heap and not an exporter.
>=20
> Protected memory buffers needed by the Panthor driver:
> - On CSF FW load, the Panthor driver must allocate a protected
>   buffer object to hold data to use by the FW when in protected
>   mode. This protected buffer object is owned by the device
>   and does not belong to a process.
> - On CSG creation, the Panthor driver must allocate a protected
>   suspend buffer object for the FW to store data when suspending
>   the CSG while in protected mode. The kernel owns this allocation
>   and does not allow user space mapping. The format of the data
>   in this buffer is only known by the FW and does not need to be
>   shared with other entities.
>=20
> The driver will retrieve the protected heap using the name of the
> heap provided to the driver as module parameter.

I know it's what dma_heap_find asks for, but I wonder if it wouldn't be
better in the device tree and lookup through the device node? heaps are
going to have a node anyway, right?

This would allow you to have a default that works and not mess to much
with the kernel parameters that aren't always easy to change for
end-users.

Maxime

--bm3tokjqjresnbu6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCafsTGAAKCRAnX84Zoj2+
dscNAYCT5tPA6wlA50913tROdb0/8GBVIaNWCZzIVCmmtw6XdanUV+Ek43qdrnbM
nAndNMcBgJJ8V9DZNE2zzCU0FXXXjTfOFOjGy0zdjmyQH3dGoy80XCbxq4XUI4fe
u8+zbKdHWA==
=zppB
-----END PGP SIGNATURE-----

--bm3tokjqjresnbu6--

