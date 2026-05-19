Return-Path: <linux-media+bounces-62142-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QAyNK/xhDGpXggUAu9opvQ
	(envelope-from <linux-media+bounces-62142-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 15:13:32 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3228E57F5F7
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 15:13:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D00A33075203
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 13:05:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EE433403F6;
	Tue, 19 May 2026 13:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f9dY94Yf"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3587E3403F9
	for <linux-media@vger.kernel.org>; Tue, 19 May 2026 13:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779195916; cv=pass; b=uyPsthfmzA8+xpf1y1dKv5EvO0DV0+bxCya+Grmte0zkHVk3TVkMH6pTBFt98SX582t8JIzbAIQMqlqRBOD08zewsAvrd37KO1Q0vy9hIcOZQZLzD1KS4rekbksr2qbLnELK1ojJ7y6dlECBkjYtyneho4Cb2JTDfA1CS/TVfms=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779195916; c=relaxed/simple;
	bh=iaGZMeTECKLgSkXvhPAEh2PSUA5sCaWUAcRY8LGcVek=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gBeN5qENp8moA+2MFuK4HT4UB79d2ycJnyxPs1/44G6JjqnJnHvuZ1TbPrvZ05igtjuW4PJ4BVX7x1y86+9F+gqAy2/qjt9YWO/noEhm4SySXWcaBHnrIfgJVGbZxIEZCBsgH/S2HmI1M610OoL4Z6+f6B7AxNHStAZGVal4MLU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f9dY94Yf; arc=pass smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-7dbd23bc684so1857814a34.2
        for <linux-media@vger.kernel.org>; Tue, 19 May 2026 06:05:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779195914; cv=none;
        d=google.com; s=arc-20240605;
        b=bpTl+HT9ciFyVdPcKeLKRc6g0OGxfBH6MzO5VfYXGhpuNyRAlMRS5j80wwW+SGomrN
         iWOCTD4e15KMmcW98d9RNrda44e6/V7bf7EqAssdKDp1hgxfqqCTOP7yrpi/l4duwGDQ
         DMgbKVvpPk21LPktU021AWo7YvyW+EDQAlh1pGUPO5OkEYIHyWNaTzeBQUV8cwOOwIdz
         yiQASyklEJVQlEjGv79oV0o06TCkKPyr8lrcr4GUka/JM3f75TFqXiBPPN/vxqKOQGd7
         fyoaHQI4sE8JszqjPuuaUyN3YzYao2QmL6iVmvOACjWtI5ek3cjR8GaF8LaXu5ELTCAR
         BjwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TjyeZ+mSATOr/oLHbZdmIDYIxgcfoHII5fmcydeHYjc=;
        fh=Q8TJw6UbfIGfygnydji4hxLBTxRgcBS0NV3ysrIx6aM=;
        b=A2ImPSfZ9Lo+yLtdKNJoh9L5sYtJgOBx4FOyf2qSUyhTweMB1Nj/zn8mR+CYne9NML
         ACZsICYx6M0sNU0tTodMbo3ylg3C+bgnI0PBfxfA3y3Nnf2gInxK46liqHou0KZzHLIN
         fTZ5V6O46HgbkAX0uA8msT15kVsFFTyiiSYc2m95c/mfjMRs175EljOwhJ8ag7eI07AE
         RnukSIRmOctAOWtF4ix+X3uEgc9geLrxy2YHjqkfTWHEe8cmF8tHv1Jk554nMAu8QkGV
         hU3MSL8KKBjaDLlWAc3HuQUclxElzoa0OQkp7XKC/qSGjCs4fy688IjcvFQTtFR3FczL
         vS6Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779195914; x=1779800714; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TjyeZ+mSATOr/oLHbZdmIDYIxgcfoHII5fmcydeHYjc=;
        b=f9dY94YfPV6xzUBEpSIYvLRVOkNNmpoXIWmggyBiGkCaQckXoH/YmKlRPAvRSKCBEL
         Xp1XxRgJpFFTIjVlcB2j/znmnYMDkrBXxz0/Q/m0ZWiPufTxp1Bc7Or54xxMo6mBcGj1
         zrrzONEpH3em8VZ3Pu3TmmurStVt8CPQM8LloHADQSZ7HxhroyUO50YHZ2NXt9fMQCY2
         TeS2jiWs5R5KZhF2Zm5ESW80cP9hDw8v3rquImaylb4Kukj+wUg5egpndM4drYh+Gs2C
         OaCYQ1oo2lG0fi25405DErU89s5BTVG//pRuHJcklToMD1FsTa1ptvcb+VfdLJm9neE6
         1CRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779195914; x=1779800714;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TjyeZ+mSATOr/oLHbZdmIDYIxgcfoHII5fmcydeHYjc=;
        b=rTkgb04DUpA+mFBqkO5cp4Pz4bFSOLRPvfMh3O/y/BvrwkNSOtgfQDO/EJaXrxdfQH
         w8tRigyxcJexc2AN35wh2sxB9XuP8Yr7B0WT2sDvrxz9JobqvpZon7u1LGxSQL4spKo1
         pL/5xkDiPbmj38Ajdyd4BBZHrBqYNaaSXiLcR5VmCZVSV3DqEX9z27wggz0sBulSObLb
         yCY0JAga4oB5k9vHTAJW6LmVAtHRrzIH9sDNlHjv6DKGp30NtxlyEGKlZkkHxSyx6uEs
         3da0oDyAD9d4DkiSkTA9qmZ/ifmxbG5Nyxsz0KGpVQQ0bIQPNJ+h/RNiMcJmQ8N6fnIE
         3pDQ==
X-Forwarded-Encrypted: i=1; AFNElJ/y5Z4vaZbBVwiEwybDa8l//YtQZUgKyrlWvEDkAh0f+oynx/H0Sj3wa694lUvWKvfQursidrmECdvj+g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwBffrD7w0c17bR3w/YJyNOlL0nuC9gYGF3k42jNdYJeXxD8ShP
	sGH3FJp+jGhNzdAXFczbcceEcflwBxF6qMcMeLIwO9M9yVdwDrP2FVFZDwTLcxqnt1ZbYOLJPwW
	krPfk2NQ9X/feXZQB+Y5ZJx459A0iOrGK/PJyXaQs2dZaZAA=
X-Gm-Gg: Acq92OEDqBxdh7tfLWWvT7mMyQppqqGnjo6G3leek1DJf5VnpQn6B1228OvnPhDYcUW
	V/qXgFnt67ebqKMDq31KJwBJ+WKSIleZaY71wwGzhQfPtC+rGgta4GYF/fVEC/fI1S9jiTMOGHp
	Dh9SBrTkRtU+O7E7WkhYanEpon6d7X6bmHdNiJubY3Ks8JDKTgzQjQWDd/QliTGdlAB/SMMKRvS
	ik2TD1Z4cKZPPcyzahAhsu2Mey08yYKv/+KDxrxCLOVVvFhONIYjytOguYGPgpTnqtmYLUJzybD
	yd5Ww7pG4A==
X-Received: by 2002:a9d:454c:0:b0:7e5:b3f6:c6ad with SMTP id
 46e09a7af769-7e5b3f6dde6mr1978777a34.4.1779195914046; Tue, 19 May 2026
 06:05:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260429143743.50743-1-mikhail.v.gavrilov@gmail.com>
In-Reply-To: <20260429143743.50743-1-mikhail.v.gavrilov@gmail.com>
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Date: Tue, 19 May 2026 18:05:00 +0500
X-Gm-Features: AVHnY4KCjg5xnLKDTpF_UzV8orViAi1sRvhjRQeLBblOdok117UByI2OEfFaxHs
Message-ID: <CABXGCsM_YJ+UY86yFJF-jBcbQXRoc0qnSw0saaGWnaSYWG0mmQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: fix recursive ww_mutex acquire in amdgpu_devcoredump_format
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org, Alex Deucher <alexander.deucher@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sumit Semwal <sumit.semwal@linaro.org>, 
	Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>, linux-media@vger.kernel.org, 
	linaro-mm-sig@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-62142-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,amd.com,gmail.com,ffwll.ch,linaro.org,lists.linaro.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mikhailvgavrilov@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 3228E57F5F7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 29, 2026 at 7:37=E2=80=AFPM Mikhail Gavrilov
<mikhail.v.gavrilov@gmail.com> wrote:
>
> When dumping IB contents from a hung job, amdgpu_devcoredump_format()
> acquires the VM root PD's reservation lock via amdgpu_vm_lock_by_pasid()
> and then, for each IB referenced by the job, calls amdgpu_bo_reserve()
> on the BO that backs the IB.  Both reservations are taken on
> reservation_ww_class_mutex objects but neither uses a ww_acquire_ctx,
> which trips lockdep:
>
>   WARNING: possible recursive locking detected
>   --------------------------------------------
>   kworker/u128:0 is trying to acquire lock:
>   ffff88838b16e1f0 (reservation_ww_class_mutex){+.+.}-{4:4},
>     at: amdgpu_devcoredump_format+0x1594/0x23f0 [amdgpu]
>
>   but task is already holding lock:
>   ffff8882f82681f0 (reservation_ww_class_mutex){+.+.}-{4:4},
>     at: amdgpu_devcoredump_format+0x1594/0x23f0 [amdgpu]
>
>    Possible unsafe locking scenario:
>          CPU0
>          ----
>     lock(reservation_ww_class_mutex);
>     lock(reservation_ww_class_mutex);
>
>    *** DEADLOCK ***
>    May be due to missing lock nesting notation
>
>   Workqueue: events_unbound amdgpu_devcoredump_deferred_work [amdgpu]
>   Call Trace:
>    __ww_mutex_lock.constprop.0
>    ww_mutex_lock
>    amdgpu_bo_reserve
>    amdgpu_devcoredump_format+0x1594 [amdgpu]
>    amdgpu_devcoredump_deferred_work+0xea [amdgpu]
>    process_one_work
>    worker_thread
>    kthread
>

Friendly ping. Pierre-Eric, Christian, Alex =E2=80=94 any thoughts on this =
fix?

Happy to spin a v2 with any review feedback. One thing I'm aware of:
the `Cc: stable@vger.kernel.org # 7.1` tag is probably unnecessary
since the regression only landed in 7.1-rc1 and the fix will reach 7.1
final naturally via drm-fixes; I can drop it in v2 if preferred.

--=20
Best Regards,
Mike Gavrilov.

