Return-Path: <linux-media+bounces-37114-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D467AFCE26
	for <lists+linux-media@lfdr.de>; Tue,  8 Jul 2025 16:48:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 96BA1188B338
	for <lists+linux-media@lfdr.de>; Tue,  8 Jul 2025 14:46:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D27B218EA1;
	Tue,  8 Jul 2025 14:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="R6vTkFSn"
X-Original-To: linux-media@vger.kernel.org
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB1192DFF3F;
	Tue,  8 Jul 2025 14:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751985917; cv=none; b=XEKYaL0S4EYQVMqxKYGjcqHN1bmFhNjEkN0y0K5SRnS6+jQc6nITkEpr2NeYZl7tGAsqVr32HhtmxuVhhzEq+nTYpzjFDwq7QD1+h0F2CSzcGQkWhKeqmlXdPl2teufyHa+496E8+pDkL9GmbAxjwbb5XD0X9CqpVmALSfPz2HI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751985917; c=relaxed/simple;
	bh=u25jV0reS/3tEx0F0x715/FxyR/a64F4CgdnsSo65OI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bcym/OWGPOAcfpyogdyB2kCkQDeCAo93P5wrbzZ68p3uUAhGAAR/h+8UtVMKJWr0RkBkQt27izasRldaQeS675roh30dYeSqrWfYSk/n/eBsHGptaX4HidbgdC23NwaEaaea8O33KIK55YymO7chStFXdlkfzs7ETpDItb1GciM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=fail (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=R6vTkFSn reason="signature verification failed"; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 7D52940E0221;
	Tue,  8 Jul 2025 14:45:05 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=fail (4096-bit key)
	reason="fail (body has been altered)" header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id yxsqRW0PZ2Xo; Tue,  8 Jul 2025 14:45:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1751985901; bh=OR5nb2I3t4IhUMz0U4gpskt/BrUAd7by/O20+56zPxY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R6vTkFSnqHn4S/r87nkVBIuHSxbjT9AtIAYneVu+aRg6ioPlgfIQaOohTmqcuwcWr
	 WDl+X14pxsE7phpxXY5HWBSGxN43MeTdqAy3sw6e0tztHrGwKlOUPIaW4qibXsDhaD
	 tDOnv4o3ZDkkUTTzRyzDAEb6J4lvJn7sAyvwQ+796UhGXHYp5HSSjkePHPe8CeCRiw
	 LtQZdFvCnRmS3HtVF8Wssrgz84tEsZr6BNUyhElrrZUqKz4SI/UoNqrxYUD8nLTqDs
	 bHUpG1HZH7Xi5EhSNJHBv4m2YoHFkz3jgfxJeGin2C5oLPZUSgNKcu/5QntZq6/Cbf
	 GVYYrVEao2qKqsIJaRTypNtZZb3XFPaMUX2OH3PHrS1dcHN7/+HQdgQF7n7QO1/OHt
	 Ye4qM+VkPpEihIzs1tAzYKVimUVfmVDMZjJTnHj8SvqTYiu7d5SIOnvzsGI2ReOGA8
	 oakzG3+EOl9/C7ARyXMmUZJkDy/Jqsex8IK6PL/N204f5rByTTjjFjsxHFbIdYOL5s
	 AO0ucYuE6LFHoMHZgii8n1RNtqEZgNCN6/+mNCLxVGcSNWyTQq5N9qd0Lx3DHPEH9m
	 V6HhYVuPgaSOG/UMNbYKEYyhq4bglwr4P3sKbvB1qyiSH+UdavQi/3eRBoLIuwS94O
	 ddvveiogLkKBNuID8cudfdLw=
Received: from zn.tnic (p57969c58.dip0.t-ipconnect.de [87.150.156.88])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 1A1A540E0218;
	Tue,  8 Jul 2025 14:44:44 +0000 (UTC)
Date: Tue, 8 Jul 2025 16:44:37 +0200
From: Borislav Petkov <bp@alien8.de>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: christian.koenig@amd.com, asrivats@redhat.com,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	airlied@gmail.com, simona@ffwll.ch, jean-christophe@guillain.net,
	superm1@kernel.org, satadru@gmail.com,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	Bert Karwatzki <spasswolf@web.de>,
	Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org, stable@vger.kernel.org
Subject: Re: [PATCH v3] drm/framebuffer: Acquire internal references on GEM
 handles
Message-ID: <20250708144437.GBaG0u1c4E6aV5ekTH@fat_crate.local>
References: <20250707131224.249496-1-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250707131224.249496-1-tzimmermann@suse.de>
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 07, 2025 at 03:11:55PM +0200, Thomas Zimmermann wrote:
> Acquire GEM handles in drm_framebuffer_init() and release them in
> the corresponding drm_framebuffer_cleanup(). Ties the handle's
> lifetime to the framebuffer. Not all GEM buffer objects have GEM
> handles. If not set, no refcounting takes place. This is the case
> for some fbdev emulation. This is not a problem as these GEM objects
> do not use dma-bufs and drivers will not release them while fbdev
> emulation is running. Framebuffer flags keep a bit per color plane
> of which the framebuffer holds a GEM handle reference.
>=20
> As all drivers use drm_framebuffer_init(), they will now all hold
> dma-buf references as fixed in commit 5307dce878d4 ("drm/gem: Acquire
> references on GEM handles for framebuffers").
>=20
> In the GEM framebuffer helpers, restore the original ref counting
> on buffer objects. As the helpers for handle refcounting are now
> no longer called from outside the DRM core, unexport the symbols.
>=20
> v3:
> - don't mix internal flags with mode flags (Christian)
> v2:
> - track framebuffer handle refs by flag
> - drop gma500 cleanup (Christian)
>=20
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: 5307dce878d4 ("drm/gem: Acquire references on GEM handles for fr=
amebuffers")
> Reported-by: Bert Karwatzki <spasswolf@web.de>
> Closes: https://lore.kernel.org/dri-devel/20250703115915.3096-1-spasswo=
lf@web.de/
> Tested-by: Bert Karwatzki <spasswolf@web.de>
> Tested-by: Mario Limonciello <superm1@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Anusha Srivatsa <asrivats@redhat.com>
> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> Cc: linux-media@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linaro-mm-sig@lists.linaro.org
> Cc: <stable@vger.kernel.org>
> ---
>  drivers/gpu/drm/drm_framebuffer.c            | 31 ++++++++++++++--
>  drivers/gpu/drm/drm_gem.c                    | 38 ++++++++++++--------
>  drivers/gpu/drm/drm_gem_framebuffer_helper.c | 16 ++++-----
>  drivers/gpu/drm/drm_internal.h               |  2 +-
>  include/drm/drm_framebuffer.h                |  7 ++++
>  5 files changed, 68 insertions(+), 26 deletions(-)

Thanks, that fixes it:

Reported-by: Borislav Petkov (AMD) <bp@alien8.de>
Tested-by: Borislav Petkov (AMD) <bp@alien8.de>

--=20
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

