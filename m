Return-Path: <linux-media+bounces-10612-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 171A38B9A3D
	for <lists+linux-media@lfdr.de>; Thu,  2 May 2024 13:51:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 39D9D1C20F95
	for <lists+linux-media@lfdr.de>; Thu,  2 May 2024 11:51:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62DE96A03F;
	Thu,  2 May 2024 11:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Xd+HPEDX";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Lhg5NcZr";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Xd+HPEDX";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Lhg5NcZr"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E98A524B8;
	Thu,  2 May 2024 11:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714650680; cv=none; b=j2a4W10C8dJfjnwOExv3wT1T1yyMWknd2GA51+7Rii8e5dQ54inQzPl+qZm1cbf2Hv7XH+FdbRJPOxFDJjBo20KNF+a2N3jKyRo95nWFq2sfiEmDC7CbfDUEG/ZKPtgG4LZ0RVAU3RNklVJM8KZBXXA72BGo6RW+ZDpOBdW92sA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714650680; c=relaxed/simple;
	bh=RdFvovwC6J72B9lO/iQNWZ93woVFpoxGo4KbUlr2sv0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k227Cky0mqonEiZKM6X6gcH2tT1YZMQJlgJ2Eij55AEgI420egsOf6+v0Kp2IqLa+C1tmnk1mKV7SFqF2ZyoZDlMaDWI1BMJmuW5sk+wBGvXyPLqy93qD2XBn3zfd2tm25kxMhazkbjH1L2+ueMrWnhU/cBlZTtS6RNvqgIg2hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Xd+HPEDX; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Lhg5NcZr; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Xd+HPEDX; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Lhg5NcZr; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id F07D1352A6;
	Thu,  2 May 2024 11:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1714650677; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=lPWunjgtsKUH55Qaz+CsOmKx+6A+ecZXDefV0fnDOcU=;
	b=Xd+HPEDXYWCpl85h0ivgG/ZauB6HNfnICHwZMHiDC3eqKMeOAwYTQqltnt0nVwh5FDOLa/
	I4nq/QR0BPt2d1tr8uK458zCsqZVlHl8q13iC79Dw0r79LI2WEHLs82FYsoDfDdlWqB9qP
	g7F9HQvaBHN7D2GEwh+4v7XTvYSSYuM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1714650677;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=lPWunjgtsKUH55Qaz+CsOmKx+6A+ecZXDefV0fnDOcU=;
	b=Lhg5NcZrDqHHhF8f90P1bD6AV1TyswcbexUnvSdYnGIR8cEOn1prBCtW4Ukk+709lH4PG0
	LNlcHLpac6ivJqBw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Xd+HPEDX;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Lhg5NcZr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1714650677; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=lPWunjgtsKUH55Qaz+CsOmKx+6A+ecZXDefV0fnDOcU=;
	b=Xd+HPEDXYWCpl85h0ivgG/ZauB6HNfnICHwZMHiDC3eqKMeOAwYTQqltnt0nVwh5FDOLa/
	I4nq/QR0BPt2d1tr8uK458zCsqZVlHl8q13iC79Dw0r79LI2WEHLs82FYsoDfDdlWqB9qP
	g7F9HQvaBHN7D2GEwh+4v7XTvYSSYuM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1714650677;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=lPWunjgtsKUH55Qaz+CsOmKx+6A+ecZXDefV0fnDOcU=;
	b=Lhg5NcZrDqHHhF8f90P1bD6AV1TyswcbexUnvSdYnGIR8cEOn1prBCtW4Ukk+709lH4PG0
	LNlcHLpac6ivJqBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7D3AD13957;
	Thu,  2 May 2024 11:51:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id xsETHTR+M2YdLQAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Thu, 02 May 2024 11:51:16 +0000
Message-ID: <84a5f7b6-d20a-4c69-83a8-d8394fea2b68@suse.de>
Date: Thu, 2 May 2024 13:51:16 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] drm: Fix dma_resv deadlock at drm object pin time
To: =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>,
 Qiang Yu <yuq825@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian Koenig= <christian.koenig@amd.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Zack Rusin <zack.rusin@broadcom.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org,
 lima@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
References: <20240501065650.2809530-1-adrian.larumbe@collabora.com>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
Autocrypt: addr=tzimmermann@suse.de; keydata=
 xsBNBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAHNJ1Rob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPsLAjgQTAQgAOAIb
 AwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftODH
 AAoJEGgNwR1TC3ojx1wH/0hKGWugiqDgLNXLRD/4TfHBEKmxIrmfu9Z5t7vwUKfwhFL6hqvo
 lXPJJKQpQ2z8+X2vZm/slsLn7J1yjrOsoJhKABDi+3QWWSGkaGwRJAdPVVyJMfJRNNNIKwVb
 U6B1BkX2XDKDGffF4TxlOpSQzdtNI/9gleOoUA8+jy8knnDYzjBNOZqLG2FuTdicBXblz0Mf
 vg41gd9kCwYXDnD91rJU8tzylXv03E75NCaTxTM+FBXPmsAVYQ4GYhhgFt8S2UWMoaaABLDe
 7l5FdnLdDEcbmd8uLU2CaG4W2cLrUaI4jz2XbkcPQkqTQ3EB67hYkjiEE6Zy3ggOitiQGcqp
 j//OwE0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRHUE9eosYb
 T6XMryR9hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgTRjP+qbU6
 3Y0xnQN29UGDbYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+RdhgATnWW
 GKdDegUR5BkDfDg5O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zbehDda8lv
 hFXodNFMAgTLJlLuDYOGLK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r12+lqdsA
 EQEAAcLAdgQYAQgAIAIbDBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftOH6AAoJEGgNwR1T
 C3ojVSkIALpAPkIJPQoURPb1VWjh34l0HlglmYHvZszJWTXYwavHR8+k6Baa6H7ufXNQtThR
 yIxJrQLW6rV5lm7TjhffEhxVCn37+cg0zZ3j7zIsSS0rx/aMwi6VhFJA5hfn3T0TtrijKP4A
 SAQO9xD1Zk9/61JWk8OysuIh7MXkl0fxbRKWE93XeQBhIJHQfnc+YBLprdnxR446Sh8Wn/2D
 Ya8cavuWf2zrB6cZurs048xe0UbSW5AOSo4V9M0jzYI4nZqTmPxYyXbm30Kvmz0rYVRaitYJ
 4kyYYMhuULvrJDMjZRvaNe52tkKAvMevcGdt38H4KSVXAylqyQOW5zvPc4/sq9c=
In-Reply-To: <20240501065650.2809530-1-adrian.larumbe@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-6.50 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	DWL_DNSWL_MED(-2.00)[suse.de:dkim];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[collabora.com,gmail.com,linux.intel.com,kernel.org,ffwll.ch,arm.com,linaro.org,amd.com,broadcom.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: F07D1352A6
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Score: -6.50

Hi,

ignoring my r-b on patch 1, I'd like to rethink the current patches in 
general.

I think drm_gem_shmem_pin() should become the locked version of _pin(), 
so that drm_gem_shmem_object_pin() can call it directly. The existing 
_pin_unlocked() would not be needed any longer. Same for the _unpin() 
functions. This change would also fix the consistency with the semantics 
of the shmem _vmap() functions, which never take reservation locks.

There are only two external callers of drm_gem_shmem_pin(): the test 
case and panthor. These assume that drm_gem_shmem_pin() acquires the 
reservation lock. The test case should likely call drm_gem_pin() 
instead. That would acquire the reservation lock and the test would 
validate that shmem's pin helper integrates well into the overall GEM 
framework. The way panthor uses drm_gem_shmem_pin() looks wrong to me. 
For now, it could receive a wrapper that takes the lock and that's it.

Best regards
Thomas

Am 01.05.24 um 08:55 schrieb Adrián Larumbe:
> This is v3 of https://lore.kernel.org/dri-devel/20240424090429.57de7d1c@collabora.com/
>
> The goal of this patch series is fixing a deadlock upon locking the dma reservation
> of a DRM gem object when pinning it, at a prime import operation.
>
> Changes from v2:
>   - Removed comment explaining reason why an already-locked
> pin function replaced the locked variant inside Panfrost's
> object pin callback.
>   - Moved already-assigned attachment warning into generic
> already-locked gem object pin function
>
> Adrián Larumbe (2):
>    drm/panfrost: Fix dma_resv deadlock at drm object pin time
>    drm/gem-shmem: Add import attachment warning to locked pin function
>
>   drivers/gpu/drm/drm_gem_shmem_helper.c  | 2 ++
>   drivers/gpu/drm/lima/lima_gem.c         | 2 +-
>   drivers/gpu/drm/panfrost/panfrost_gem.c | 2 +-
>   3 files changed, 4 insertions(+), 2 deletions(-)
>
>
> base-commit: 75b68f22e39aafb22f3d8e3071e1aba73560788c

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)


