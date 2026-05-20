Return-Path: <linux-media+bounces-62219-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4NGeMRRsDWrgxAUAu9opvQ
	(envelope-from <linux-media+bounces-62219-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 10:08:52 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 489C85896BB
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 10:08:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 806BA3085BF1
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 08:07:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1EDC3A5428;
	Wed, 20 May 2026 08:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aLAI5Lge"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A83A37107E
	for <linux-media@vger.kernel.org>; Wed, 20 May 2026 08:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779264443; cv=pass; b=pFhd/zMPk8uec4lfrtwXxsQVENpAUUOD9ajdl7QVhgkztGwUrBV/j4Om+l2jM8tkxgiGsiP95l3m2eCZ0Ytwya1b1YZEfV4Fuwri7s5QqCP8Ywbi0DZsZ0O+lXXI+W5EPwkBFTQ4ZL3znZhYk3fr+CjI8MPYd2y1Ei1hbI9nCck=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779264443; c=relaxed/simple;
	bh=QIY7kxVOO0O3K5PTYsFqKN58Au9Ry/1rwDJltP+Zpt4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=suc8G168Enau0lR86GMVtope/98B0tNOXJ38doVD/BiulBIradd9bFV0hf2Lml63xhGPZpwkJShB44w2+e9pRRdlS10EKGgTjpCwz113s1qspg2JpnzBK7Gd4lKmaY1nMDC0bXmtjS+YS4aLcfhx2F+8I325zXqzepzXPF62Mw4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aLAI5Lge; arc=pass smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-7dca5f64e86so3831378a34.0
        for <linux-media@vger.kernel.org>; Wed, 20 May 2026 01:07:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779264441; cv=none;
        d=google.com; s=arc-20240605;
        b=SurCf9yFzK1U2M02dZMFYK4m802qzmZiLciQoVf64/wuFSt7nmiEB+LbjnPvxdftF/
         q+N73UF/m4dDZfyHKXc+RhCm3T3DHYdaFs8/DmACVcrLHY2/IAZA0MV5RjI92k8j7AzX
         6UauBsZGXygQnh41som6ZaiPyUzli0xdnKW0e+l69gCw12hVGOQApOs4rVltpqTIVUHc
         mQ6lnHlS8YW7eD1DyKTWu4jP3nOpj7rCtT6JQt4rYXYLDQu18wWAw8ibjM8FnngzCa1D
         l8FbzqXeXIzybM4+n0UIKDPj304C6nWc/9uOcbTdxiKwNNVA/TwRxMyCFLJ4cPruI/op
         FOhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ytey4qORX2TbyVZpIBqgx3oRXsMx32wxQcpaf7l+9+M=;
        fh=aJvVCraiUiodX/tUbjbCsukDBmHloo5dfiyx3J9u4Ww=;
        b=NxRXvqRHBfR95W+SAbSYNOGso3W+8VhYCt5UwysoiiZBxKKODk8tL+fHpEWFC+Pc4Z
         +/jpzp0fDAqYVXe7FyzsXKIifLmWjZ1hGMULToWVRkoibyYp3uVpX5j7xX3XruEgpD39
         GYOIWjYvY9bVWAkX7PHrZCtDC8VjxLrhzjgz1u6EWgRXvyQjmI9IocrwJSe0AltFscid
         XW9In0PPlb013Yerj9POsy01O/9/lTWhOx5hGJchA+qo51/7XI+8q5VnJiULRHnwN2uX
         Li3vlyWE7E3eNgBV69xIQV4WUylTNG+kaP9f4fBDydhksZH0YU1zE+0L44pxF8ELAmPN
         1ONQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779264441; x=1779869241; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ytey4qORX2TbyVZpIBqgx3oRXsMx32wxQcpaf7l+9+M=;
        b=aLAI5LgeOkuj7FTEYQ+nps5qoT6ViFBQsZ+pdctCGuzqFXbxeJKXe1bwPtOncDTwB1
         rdM4PUmfmgcdakzzcb/kzR758V7RYCyLc9jNvA/QJEDBHpiq9Tpl0XUdEKerY8qlTMk8
         +HZcRsOCbHvmsl0gpdQIdeHLLQJ93d58oya9TW7THgf6JVNm7scD6sePgTpm1EwuwU8p
         AIvJXzAdA/hEfXyLFfCt+BYb3+yQc9/97AiEGiWyvvlBb5pALWlABgWuniuXEevAuk8+
         o2lF+pC7oRDRPxb+DvCdmiMe8IdEAVLSOmkhB5MLvhZXeqOxIJhkucFvkYrqF1Q4MnxA
         rRmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779264441; x=1779869241;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ytey4qORX2TbyVZpIBqgx3oRXsMx32wxQcpaf7l+9+M=;
        b=kqinq33dUZsNSaMCJcou2Oa9pjYwmdzwkDk4NiGoKrXyt7VTwYxMsqOE4woFS0WdGH
         WKZCNsJD/x/aB4ZigaIfsDsUB9lc9+D0AP7ehQhzUAMoe7aonkBUuIQeGVS0YwjgwUf/
         o/oZqP4I9Hp+0F7Eqn0Eio5pbrTY2eLXf0IP8es3u0e9bxh3dtpvSbgDCHYn2qTW7iLQ
         KTNNvBKaH34omC7h/EDkAcpZbgn81+aDfsvR0qXXO3RFA4cx11PPJMJcYCf1awaZ99S3
         Xx5X3+mQiXgqXRrjR5g9hQjRnOSmO7O2ziX7FyIj2zBuPwp/l+64WQ2jJtdvnLQVHbLo
         MRTg==
X-Forwarded-Encrypted: i=1; AFNElJ+M3/guUW35zO4u5xal9AM/DPWc/PA5McEGU8sCZuZAWDp2XanIJY7pAo9pSNG8mOsKKPD6XtdqrKV6eA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzSc3CzaiCgWLjYzFqAsWAVf1NdFa82IJPaHBeojCV8/aRQIvnR
	B9+G6+BKCQHEfST2Q2vev1DBR+6HEsF6Nc03fnykgFyVpZU0seNK/hi53u6VM2oUy9vgFGyOyT3
	2kaJ4YW3gZNPL4N5ixbtzVdtn4eVhvfE=
X-Gm-Gg: Acq92OEgs8QT/UrzH3PrP6yAm2yGszFwydeqydHvIxwg9b4EB+8OlVbRWtEQ58sg9ez
	W5/KP78n4/g3G4EqYQ7z2YH1cKsdLy5eo6JzzoT8wl3muGekiTI2yskYU33F1zuAAkdZ8vESrVY
	yJ/ECjNctoH9TXmDktNCoBWU7dZ/JdlAvLZo4+fzxt43jrXV15mOdeMpTCajO2FkQyVYLlpDfu6
	kHSloA8J+aYh1wQ9fKJ7drpoI0njK7XPUA3gJLyQCl++RP/sq+wsPK1vnIIHaZRxfK47WmEBWzp
	AwARGnaDlQ==
X-Received: by 2002:a05:6830:928:b0:7dc:e08d:d9ec with SMTP id
 46e09a7af769-7e4f2b24e30mr16828017a34.15.1779264440957; Wed, 20 May 2026
 01:07:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260429143743.50743-1-mikhail.v.gavrilov@gmail.com>
 <20260519161541.19994-1-mikhail.v.gavrilov@gmail.com> <45bbcc75-f852-46c2-bcff-8cacb9413376@amd.com>
In-Reply-To: <45bbcc75-f852-46c2-bcff-8cacb9413376@amd.com>
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Date: Wed, 20 May 2026 13:07:09 +0500
X-Gm-Features: AVHnY4LjCbKcTkLs9-x5er23_LG6HLKFdPJe4uy4QSmttSvQ2RTUpYxe2TP8aBU
Message-ID: <CABXGCsPRY+jk_ArYMOXqNTw31W95FBgNzqFq0_pvi3paYR=KDQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm/amdgpu: fix recursive ww_mutex acquire in amdgpu_devcoredump_format
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, Alex Deucher <alexander.deucher@amd.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sumit Semwal <sumit.semwal@linaro.org>, 
	Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>, linux-media@vger.kernel.org, 
	linaro-mm-sig@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62219-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,mail.gmail.com:mid,amd.com:email]
X-Rspamd-Queue-Id: 489C85896BB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, May 20, 2026 at 12:08=E2=80=AFPM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> That whole infrastructure is superflous. You just need to modify amdgpu_v=
m_lock_by_pasid() to take a drm_exec object to lock the root BO.
>

Christian, modifying amdgpu_vm_lock_by_pasid() to take a drm_exec turns
out to also require converting its other caller, amdgpu_vm_handle_fault(),
to drm_exec =E2=80=94 most of the diff is that conversion, not the helper i=
tself.

I can:
 (a) convert both in a 2-patch series (handle_fault becomes
     drm_exec_init + drm_exec_until_all_locked + drm_exec_fini, ~30 lines),
     or
 (b) keep the loop inside amdgpu_vm_lock_by_pasid() so handle_fault stays
     a one-liner =E2=80=94 but then the devcoredump caller can't add the IB=
 BOs
     to the same ticket, which is the whole point.

(a) seems unavoidable if we want one helper. Is that what you had in mind,
or did you intend something lighter =E2=80=94 e.g. a separate
amdgpu_vm_lock_by_pasid_exec() leaving handle_fault untouched?

--=20
Best Regards,
Mike Gavrilov.

