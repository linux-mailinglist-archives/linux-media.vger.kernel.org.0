Return-Path: <linux-media+bounces-62569-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cKU5OHQUEGryTAYAu9opvQ
	(envelope-from <linux-media+bounces-62569-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 10:31:48 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CDB65B09E2
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 10:31:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DEB2E3018585
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 08:31:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7CA93769E0;
	Fri, 22 May 2026 08:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WF+MjT8R"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDA31371CE0
	for <linux-media@vger.kernel.org>; Fri, 22 May 2026 08:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779438699; cv=pass; b=Jk2glBEnpf0+UCYo8JdoXz4emy7OCmFFhMg/rk8eg13aP/GT/tnQeNT1n5mtk+dgKuqlE5aByUBi+3xJW+sHK3VnfxOcvTDVWWqdni1bf7POq8FBKTytDkVBstFEeP1zcgdbbYbBxw6uNB3A1KTEt2nM7oDLflt46Pve6zFtMbM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779438699; c=relaxed/simple;
	bh=efXhO9JMDuOv34dwkURyUnlAdGMbT3N9I2G2ixD4iws=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KULlQaBSTIeiNAmd9u2XVRj6S8qjKTvVL7AgJLX9uqsnxpuIHn/OwVwlZb2JSoCHfanCLdJDegKS5I0UoyPOpT25j1IEQtZr6m3mctA9HPiwF0hHVucomDSJgA5xXq9DjuEdVbYpwpWClhe/9Yr0rpiVOmqt9AP4OJxFS+LIvkw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WF+MjT8R; arc=pass smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-7dea20cf21aso6502793a34.1
        for <linux-media@vger.kernel.org>; Fri, 22 May 2026 01:31:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779438696; cv=none;
        d=google.com; s=arc-20240605;
        b=c6mr/4xCFAFROjcJOvujkxzumtaPFVy8PyAqs3UM0eVngH4dspXyKgN4Oy3bXd0OYq
         iwY4Mw1nIHmViam1thMEeFw2cyxTHOYWfG+qkVq+VJbGeB4896eshmOiYQDmefj4ppQo
         bRFvRYmWxQgz/ltOpFU1PcMZ79dc/W4PYeRZehItpl3Kyfq+gPLG2EzUl7745Q6/hxvO
         pf/aetf1w2Yv8y896uBkDLWnk64vjBrw2fy9xxjG+GLJSXAX9aDjggdXxuRhjK4QJbO7
         d+kLrYepNJuffA+WATi73y2M3J0J/5Z0kzZgWT7XiQQiU3EhWBn4w2hh3veyU7tWY8e7
         rjtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9ThiWo7n+RoKO5Fmewf5eOm/6gdGdTn6HMevgFDP/mU=;
        fh=pZ6rABJsQ8bQ2lhNp9Tg4x7YifLFNfDSB6ydmGGIBcg=;
        b=PUU8cDA1ST/CFiZnSaov8ll7G1jjMVGT8rZ/hTvqLbyU95Xo4rVqFKx7K6BvpHzIC2
         HNAGzWvkrxoAnNI/hkb39ljl5Yv8dNkQDbXmkmANJW0CWhJ9hqDJ555kPXFePjbvmfaI
         6/FMNOB2OduKUfW4ECduN0pJi84GiB0KmByKDfo547FA3maA1xp0K34XqPxU7aBaPyfl
         4DtzmaqH4SjBcXmsmZQWll+B0GOu4N52a2tjrUgE1mpz2n72S0+4luN+ygBLvJGL6KQy
         TNvOfgVyZTKfwg/DPO1+EKL/63g7RGNbX9jKMjpZVY7HR+Tj97g51SxdAtzQKcxXSCGx
         OgMw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779438696; x=1780043496; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9ThiWo7n+RoKO5Fmewf5eOm/6gdGdTn6HMevgFDP/mU=;
        b=WF+MjT8R46LFU/tz8j1ZThIITIe5WKySoZvXuR57J1kyGGLXe2ZcRv3az3BXDYTsGI
         No844Yflu+HskMrbfpbIp8LNeCwBz662Wi2mX6PdkRA0mtqnW29wbKTK9uhqGR1ZOyBA
         3KKNESi7hWr9kjjfEsBB7yIVKU06uCvDX7LE+2vVItj0jXCNOSxw6AnSiXuFPasfSODV
         4We54uxCG1+HxLUexZtdB36p+7sHVPCHwsbvEJ3AJY4PuRb6D/9ReURcGvTBRE6LGFy9
         NBaD9VR2tcRbwVQ96RBV3PnJQzYQhst1Qq0HBddpTASTyv4YDsmNRbjdGBm8IMDcRv7O
         cA0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779438696; x=1780043496;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9ThiWo7n+RoKO5Fmewf5eOm/6gdGdTn6HMevgFDP/mU=;
        b=pgjg7sIaChH7uAE80qsv4ROxkqLNF4sVqZqbfT1WsaANC/gleoeMOJu34fH/KOe1dQ
         c88u/7XcewqDwG8pAMBEQCg/XxQhlYnGB1OOyzoJ/u5a/PaphN+Dz1BasxlBPKa9E0Z5
         ENhKexB4tKLYl44RQmXl3GEpkTsSk1tlEgj/+KAEgo7skQPUwKWma/cTQ6rdxz+LvaFj
         oImGZH2Ush+icRNRfdIjGsH2vdh34ahSLAWdCHnTDXdeHPij6gjWkMt5JlCAebh6/9IN
         AvAmmLp/dnNZTl8tJTHGecWztRlVTJoiSC1TEPQP123K4mubLtj8Uae1i/gmsCN7xSCC
         v48g==
X-Forwarded-Encrypted: i=1; AFNElJ8AUfEYaANWSxQ2RNGoRK5Ly99srF0ts6FJjMB5Arf8WsZB1hbM6T5KIQ703pmHNguUt++UqtK+ONE3fQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9QK9pAgZbaJjsmvS22Cp3POeTrEeWdymVj3lepMxQV6+IS5hS
	LeEihtR/LW6Cc5nsitXTPnWpFgPD7SFigHqw29Fa+/1CGVqHzEv2/H0MobLj0MgIzBXp2mjTebW
	V7BLErOFC5W3Zbu/yJHkG2IRkXfhF+SE=
X-Gm-Gg: Acq92OHVPpUz4TnZ46w4BOY1zsUwqplviIkFFBXjMqpgVyy4rkYYgKZs9njL/QQSNM9
	Jo41Sk3P9rMiqvyQ53ghIb+F5LvchR7lPIMOX+i/Y/0U5E23E1w9L6xlohr8BjgVM2r5A4hZiuF
	70mauzPhrFUsFSE6r5sB70hZvU6/R8+HVzts5jJR568CDViySg+lXtR75qCmpzuE5B75IM0HjbS
	2UEJKCmkkPK2cvxB1UYGiIvpkEWLbDJMIWlJMKol8gbJXU6aoPBsbXVsxqIdf6QaPyAD7Q34FSx
	zxStcqLUzA==
X-Received: by 2002:a05:6830:4707:b0:7d7:570b:6800 with SMTP id
 46e09a7af769-7e5feef54dbmr1560827a34.23.1779438695670; Fri, 22 May 2026
 01:31:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260521104335.28978-1-mikhail.v.gavrilov@gmail.com>
 <20260521150841.20625-1-mikhail.v.gavrilov@gmail.com> <20260521150841.20625-3-mikhail.v.gavrilov@gmail.com>
 <55aee3e4-9003-4694-b0fa-277a8c2bbbc4@amd.com>
In-Reply-To: <55aee3e4-9003-4694-b0fa-277a8c2bbbc4@amd.com>
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Date: Fri, 22 May 2026 13:31:23 +0500
X-Gm-Features: AVHnY4LSbTM-4tTWAVOgrISJCrLtgJ-GyODBgDohHuk9RVR7oadaYTWLeSuLNrM
Message-ID: <CABXGCsPPY3qX7Ad-a7==nmA5R7aejCTCrmWYpn-9OQQU=1eMMA@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] drm/amdgpu: fix recursive ww_mutex acquire in amdgpu_devcoredump_format
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, Alex Deucher <alexander.deucher@amd.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
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
	TAGGED_FROM(0.00)[bounces-62569-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,amd.com,gmail.com,ffwll.ch,linaro.org,lists.linaro.org];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mikhailvgavrilov@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 5CDB65B09E2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Thanks for the review. v6 will:

 - trim the commit message: drop the reproducer paragraph, keep just
   the problem description and the solution
 - move the IB dumping into its own function
 - replace the break-based flow inside drm_exec_until_all_locked() with
   goto error handling, and drop the now-superfluous `locked` variable
 - not call drm_exec_fini() in the locking helper on the error path

One thing I'd like to confirm before respinning =E2=80=94 the !mapping case=
 in
the locking loop:

mapping =3D amdgpu_vm_bo_lookup_mapping(vm, pfn);
if (!mapping)
    continue;

You commented "That's also an error, it could be that we just want to
print the IB start address in that case."

My reading: a missing mapping is not fatal to the whole dump. For that
IB there is simply nothing to lock, so the locking loop should move on
to the next IB, and the content loop then still emits the
"IB #N 0x<addr> <dw>" header with no body (it already does this via
goto output_ib_content). The dump continues for the remaining IBs.

So in the locking loop I'd keep `continue` for !mapping, and reserve
goto-abort only for real errors (drm_exec_lock_obj() failure, VM not
found). Is that what you intended, or should a missing mapping abort
the whole IB dump?

--=20
Thanks,
Mike.

