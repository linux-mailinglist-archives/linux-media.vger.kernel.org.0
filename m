Return-Path: <linux-media+bounces-61618-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WLAdOVcTBmpQegIAu9opvQ
	(envelope-from <linux-media+bounces-61618-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2026 20:24:23 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F7F3545D8D
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2026 20:24:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 36A2B3036489
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2026 18:24:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D788D2D836D;
	Thu, 14 May 2026 18:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GEQ9FWOd"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C874A392C4F
	for <linux-media@vger.kernel.org>; Thu, 14 May 2026 18:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778783050; cv=pass; b=sKVmzW1e1fq6lbWLrAOCT5yezJeGVS/11WtwGMXk6KINbBfX+xGYAEhV6mAYdPhrQxGumWJeHFVJd//8c0jGjI3VD2EBdFJmAkyyLEIfdng441akkQpLQ0AX3xaeNN90vz08mh6nZ4C/kfQcnnmq6C/sPhxpsZZ/KidCaPGbtXg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778783050; c=relaxed/simple;
	bh=9veWAcJ/+PFKL41Z/d8kjAk/DdanyTvoGd/4QrH+tAc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tL8fQsKcM7B1VKP3j/QTXxRSEzCXRSCbGt9Z5Fq8FowAI0xR+hy0yWoD+NTR7mQsiUsmXW0QwO7eecA8QIydWjOL1c85pn1AMY4P9kxpJhuPDnT/pBLAtSrEJQ1DyNkFeqDd4DpfYpvfxvy31w7jm7X/0lw73aZG0wVZTS8MU+0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GEQ9FWOd; arc=pass smtp.client-ip=74.125.224.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-65dbe04fc1bso7047871d50.1
        for <linux-media@vger.kernel.org>; Thu, 14 May 2026 11:24:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778783047; cv=none;
        d=google.com; s=arc-20240605;
        b=D/RuF1gjfEHJs8g3qFgRZNfwUl+yjn3/bJijsP3wXJRTYFRoMoxaGiljFgrxFFjadG
         iLHEVhZSMgUOBmGyi/aNfM+0mTFYifLAK8YeuNLB+DWiAn+U3/Swgq3X8yKcQd3CNiBY
         Cm3VsvT2J0CkjlDMijD4Y611ipwpjDE3BoJo2rMmJRmA04LzavGQvyKYIQnpeykH54iM
         JwjKiQce6WO5aK6lD0cmnMN5A1DOBqwSnQgmcc40rmGAtneXthv1gyL5TPpxI0HPfELd
         yGMHJPUxOCdXnCLvdxPtNOSqVdXhEF7r/lHPbQKgQPaxAoIZzeWrCugkLqRV9WowCLq7
         tz0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PBR7fsLisJgUG1XY+0ZPkiM5XuKRe9INIYxO9y9PY40=;
        fh=glIp+tMNtv2NniSJrfjPAT5UZVytmRYeBwpPzIpfp78=;
        b=l0LCUzwuK2UCOyWREW1QDW8y9bPw2AbFMAOU4tSFNydOm4gchzW7LsAV7tS6Zu40Fu
         vUpyvb6BXglW8ot06Kt4uPWX1QGHaapG4BBZ7J3JD+nsLk7DYqsZPHuW1rWxlVF/VeIu
         ZXWR7+1Hg6+wDvyVXdz28w+43/6nQnGpl2zrGqAZaIm7pbv7yq89Y3F2eKQXWO/+xKBl
         FH+VSxebAlEpVB+n3GQFf2PvFuDWxab9QdVGc2gMjSh5HSThkKDH9E2MDZODzeVDHHNf
         n/CJ9l6uhZ6Bt5ynPlZw9o+201Zkwz3oPjppWvn4E2WvNOrX1DKKPK9D1uY8P9cOd1GU
         /p1Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778783047; x=1779387847; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PBR7fsLisJgUG1XY+0ZPkiM5XuKRe9INIYxO9y9PY40=;
        b=GEQ9FWOdEh1zoOmhdU6SaPFtqzYPHPXLU0l8JrwV5hd2GHOlhYWiF2POPBCTFKUtag
         JNwsPblfG4HfjJDPIfklY/al2gJm24qTHsdWu8kVL7OI5k5Us85RR+wiYB7lQfAgU4NY
         FnFa6FRtxd+8E8aEznb0UNoxmE8sJxPdNF2dxKm1LBkvKpLQfEYIJtwHkMujm+lC/yfW
         w19yqA9iOXPe8IvzKFlo5X65Whribt/9PamVNFYCdFCwx+fCk80g0KzDMts0+wrtP/m3
         1sHBE3OrbzjbhtA2q5MGIFo8uvaeNKSZHmY7KoUeBh6eB99krqYPRmHHu7hADh6XyLRi
         a8NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778783047; x=1779387847;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PBR7fsLisJgUG1XY+0ZPkiM5XuKRe9INIYxO9y9PY40=;
        b=fhE/rf7Mc+t8vfYb0sPQxfttRo4LFJKuKlyBW3YNGBmD8oSNJ2jrqPjXhYaAKjJH/N
         VRrpoNE0sL7wPzrDeuFn5KX7M59e73zJgxVpvsbkOw7GyVZg3m5uECMcFb1Q8ktuOIlo
         7BGQymzapn9+GxYNCfGjpoyiZraezsP2INJZA85Mnxbx9uIxHOx0kV18q4OqD20k1vLW
         yq1x4k1TqZkqNPDCGR2COV5VyXF6USKRJmT7xrUTx2ecyVTD/w1Dz1sLU8pl5Ti7ahZb
         HxKeQoZflML3MTdZ6f+v/ZQOrrFGajX8ZJBUoZaqx7qYlh5CAoZ0h3qjNbDpG5Y2atUG
         1drA==
X-Forwarded-Encrypted: i=1; AFNElJ/WQbMxnfudK3xDeFTcb605bxVEgx1cHyz3kY4/foV4GJyIyfq/B16DDNWIkIIqTtLyeh/ff/gkkhOaPA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxX2YOjTgISh89/0BIObub+17ijxyk0aHqzb+m1/9rGbs51ngpR
	1CebI+l1idzAidmr0Mratna2lLmuFou8RlaJsnjEynqTCcgPK03j1siIelctl4UT8Va2X6zihho
	HX7eDlfZ5RvtNeutbP4hGNKZ/E5x3zAQ=
X-Gm-Gg: Acq92OEkytynnhRMRj5/hiLrO3WtC5fifIQf5AjlCLOJTvB4tEb8YIWDIDXiU7AwIZf
	BrzKqMQB/TnSnfB7BTjfJIHWmnspwHux4W0C+aUOTV/0bcnHhpT6T6sPjADkSdE5uyWq+KWpOky
	qYMa+YWoJfzWM7FFa5jvOeGphJnCsjh6/RY23YsKkJl48/Jv4zrF7PM0VVEAFMnO8gnxXLv8Vu3
	4Zyg5/Si6hnjoNIyQBo+ED8Z+w1wW+OLzWTzJUw2NXTyYuNoIDZ4+GQfM1a76W9f149XLzTG7yx
	IIykPsAi/aJNImX7XJIvp8SVBCvgp7zHde+EFataMVUc448sflUmCqiWrHh/r2Faiaft92xThEw
	iGQdFfGTP
X-Received: by 2002:a05:690c:112:b0:7bd:7e01:8d89 with SMTP id
 00721157ae682-7c95b824705mr4431567b3.24.1778783046617; Thu, 14 May 2026
 11:24:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260513-panthor-guard-refactor-v1-0-f2d8c15a97ce@collabora.com> <20260513-panthor-guard-refactor-v1-2-f2d8c15a97ce@collabora.com>
In-Reply-To: <20260513-panthor-guard-refactor-v1-2-f2d8c15a97ce@collabora.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Thu, 14 May 2026 11:23:55 -0700
X-Gm-Features: AVHnY4IvIwW933CTc4ZbukSnI54Tqb3-T6psAY7x90fXnGSxacMBnoW5RGKAorw
Message-ID: <CAPaKu7QmB8s0J60O2Bpqn9P9Xi0mKH_8Xog_843AHa8wfEBNjA@mail.gmail.com>
Subject: Re: [PATCH 2/6] dma-resv: Define guards for context-less dma_resv locks
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
	Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 5F7F3545D8D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-61618-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[arm.com,linaro.org,amd.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org,lists.linaro.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[olvaffe@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Wed, May 13, 2026 at 10:09=E2=80=AFAM Boris Brezillon
<boris.brezillon@collabora.com> wrote:
>
> When used without a context, dma_resv are no different from regular
> locks. Define guards so we can use the guard-syntactic sugars for
> explicit/implicit scoped locks.
>
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Chia-I Wu <olvaffe@gmail.com>
> ---
>  include/linux/dma-resv.h | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
> index c5ab6fd9ebe8..e559b1811ca3 100644
> --- a/include/linux/dma-resv.h
> +++ b/include/linux/dma-resv.h
> @@ -40,6 +40,7 @@
>  #define _LINUX_RESERVATION_H
>
>  #include <linux/ww_mutex.h>
> +#include <linux/cleanup.h>
>  #include <linux/dma-fence.h>
>  #include <linux/slab.h>
>  #include <linux/seqlock.h>
> @@ -484,4 +485,8 @@ void dma_resv_set_deadline(struct dma_resv *obj, enum=
 dma_resv_usage usage,
>  bool dma_resv_test_signaled(struct dma_resv *obj, enum dma_resv_usage us=
age);
>  void dma_resv_describe(struct dma_resv *obj, struct seq_file *seq);
>
> +DEFINE_GUARD(dma_resv, struct dma_resv *, dma_resv_lock(_T, NULL), dma_r=
esv_unlock(_T));
> +DEFINE_GUARD_COND(dma_resv, _intr, dma_resv_lock_interruptible(_T, NULL)=
, !_RET);
> +DEFINE_GUARD_COND(dma_resv, _try, dma_resv_trylock(_T));
> +
>  #endif /* _LINUX_RESERVATION_H */
>
> --
> 2.54.0
>

