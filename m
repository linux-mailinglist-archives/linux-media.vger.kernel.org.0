Return-Path: <linux-media+bounces-65471-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id X4/9BEKGOmoY/AcAu9opvQ
	(envelope-from <linux-media+bounces-65471-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 23 Jun 2026 15:12:34 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BD0F6B7593
	for <lists+linux-media@lfdr.de>; Tue, 23 Jun 2026 15:12:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=redhat.com header.s=mimecast20190719 header.b=fXAqNfbZ;
	dkim=pass header.d=redhat.com header.s=google header.b=Oy1F+KBi;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65471-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65471-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=redhat.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3753030BBC33
	for <lists+linux-media@lfdr.de>; Tue, 23 Jun 2026 13:08:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91DCB2E0901;
	Tue, 23 Jun 2026 13:08:50 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFED22D97B7
	for <linux-media@vger.kernel.org>; Tue, 23 Jun 2026 13:08:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782220128; cv=none; b=beMgoctUahYDQiJJZLY69cpcKT9lCQsLyjaZKeHrtS8PA281fOX/LEB1qO/BR2BM0Xr41FdVgtezX49HzFelN5eMdT3bcSUqpCev484dJ6TRw23hE0GEBmB6X2klOqIczuXBal0SPysYObqnhfhPrZgKDx85QOroMMW85/9WPEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782220128; c=relaxed/simple;
	bh=xhV+fQg4GhL+/RFHqkId8dIHE/BQEiUCFDOj1bTyuBw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Ym8zW5nTglgmMd5w5utB3AWMmjTcuIOVxjRepV/k3D8uH5JohM0dm9nLw4imAKSpAyAHQThiL327BjKTBgEa9BkUyYaLgR9SmTlVBhqrwJmz7uqtARNFWzc3o96JfU/12lFB/2VxbJM7GUzHS4vfuWSY+ml14n+WuStFo5VX0Uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fXAqNfbZ; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Oy1F+KBi; arc=none smtp.client-ip=170.10.129.124
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782220124;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xhV+fQg4GhL+/RFHqkId8dIHE/BQEiUCFDOj1bTyuBw=;
	b=fXAqNfbZf3USQhnBeSYhQRNCDLmD0E3ign2KF6Q/6e7aWgX4xYBXtpKVNJXIIqC9pSKoj4
	W2JWXFEseIFhhAOtdqvMpcpdBnuscDKA4A2Vmh9M3hn+fL9FDpo4Swv6ZM6DDxEbkBguki
	7NIzqhdItWoXzZfhgMYhKJjcZaEWWfA=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-621-kFLjpe4LP9qhe3fENHGE5A-1; Tue, 23 Jun 2026 09:08:43 -0400
X-MC-Unique: kFLjpe4LP9qhe3fENHGE5A-1
X-Mimecast-MFC-AGG-ID: kFLjpe4LP9qhe3fENHGE5A_1782220122
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-c0853e3bd08so413924966b.0
        for <linux-media@vger.kernel.org>; Tue, 23 Jun 2026 06:08:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1782220122; x=1782824922; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xhV+fQg4GhL+/RFHqkId8dIHE/BQEiUCFDOj1bTyuBw=;
        b=Oy1F+KBigSJSJKc3smSHeKgzYmz5agbu3a/115IOAUEXfOFKEFK/nY4HbTkVmMNGfY
         TTVtyR5JINe/5ON1UzpmfhN2q6NoduNd5ZpZt6CK51/8VarBJSAp8mHRlj/5hN9STuio
         kJx0Rdmo7juo1T1YmAGYEiNNAlx9I1ZTzo5+mguLPIw+0nCE+zBVcdA0KFgrPvwrv6aE
         ovlNkL13pYHQjKtR4ix3tezvbJPHv4zKrLzD6oS7p1TwAXcCdVYbHc3KxLM+H5v6P6rZ
         b9MjZx7xfS7liHLGT2xr8tXuFXGZDausg+biRlu42QQoRLARjMD5blCPkAMYxyjNjfO0
         Z5gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782220122; x=1782824922;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xhV+fQg4GhL+/RFHqkId8dIHE/BQEiUCFDOj1bTyuBw=;
        b=BDrcShCm6/5AD5JW1bxJHvm1j5zca8l5Wk+jh2O+3ZmAmmkzH8DO6nCd2rnqVdLaUk
         CbP0MqIMic0sJNdCiq/UF6DMAsffPnmnGaQZjBNd0kq9sr3cV3LVukobWdopxwTfXpeZ
         n0H8Kx8FjwYmcvkM8YKnDm09+xp5RRCllpPhk7P/P+Hwv1PvZ3fbgPNO4ybAFhUygsYv
         JKMIe30DvBdCmjxlHlMnAPfDL28u7NVPobfAtBlLnYU+d0yNXct+e9nF/bbyRb68kP8K
         cQ6BK//e+g4q8K4fy2ahxckFX8Ntc7Uh4l2gC3Y+Cz6MFPnwub+U5H6zRFMP0fBNLk/A
         fu2w==
X-Gm-Message-State: AOJu0YxQNzKtsBBXckU9AmHweaqF1pVRGsdO26lH5uQPZV51dDTgea8s
	cH7JXOv+Cm4BPqIy/iFOGw4EA2vgVttUJDc8AnxjaLAx4dUFo3EhvDZnIwT+S8tHgoTI2cqaQL0
	SJRMntJtCE/59ZxCS5zSWI71J/wUj74VW1Pn5TFgpapfnJy30gjt4qsWK4crQU7n5
X-Gm-Gg: AfdE7ckWG2/yDSh4WkSuHfOp5sAROCDwCoIB6Hu+8j2o797yxVlYg1av5EcpR/bh6wL
	MxqqzjyarAlksTSBCGisNouAq23A8vP3n5snNjo2MjyXi1ShPbmnyRee2J9402CdXHBh6LpaOex
	/8iJd9CHBbf1pE1eVM/oVyWoQGUWOn08udRblg/kk/10ZEco/xz9CxEuMX319pEcHoMmzqhjQ+F
	7CSZFzEBX/lq8uriS7soDGZa3cqUm/NZXERxxFjHk+MAF4EuQRvHM9Su4CKtgrI5gauHJY9SV9A
	X1S/gYA/enu+zxFDCqZozHbXv/oeuCnmVW8VszrYGr1F4eLAxWUHxANsLZPWRzhg0aShAPL41RS
	ig0orJk6ho7qQxoYI+XXzd1DlRV9OVrWoiDww
X-Received: by 2002:a17:907:c0f:b0:bfb:13b8:2ac4 with SMTP id a640c23a62f3a-c0c643a9322mr732716066b.13.1782220122297;
        Tue, 23 Jun 2026 06:08:42 -0700 (PDT)
X-Received: by 2002:a17:907:c0f:b0:bfb:13b8:2ac4 with SMTP id a640c23a62f3a-c0c643a9322mr732709866b.13.1782220121644;
        Tue, 23 Jun 2026 06:08:41 -0700 (PDT)
Received: from [10.32.64.70] (nat-pool-muc-t.redhat.com. [149.14.88.26])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c616175c2sm511061966b.61.2026.06.23.06.08.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 06:08:40 -0700 (PDT)
Message-ID: <bf8dbb798406303e0fdf75a596e36ab8fb85aa0d.camel@redhat.com>
Subject: Re: [PATCH] dma-fence: use correct callback in
 dma_fence_timeline_name()
From: "pstanner@redhat.com" <pstanner@redhat.com>
To: Tvrtko Ursulin <tursulin@igalia.com>, Christian =?ISO-8859-1?Q?K=F6nig?=
	 <christian.koenig@amd.com>, =?ISO-8859-1?Q?Andr=E9?= Draszik
	 <andre.draszik@linaro.org>, Sumit Semwal <sumit.semwal@linaro.org>, Tvrtko
 Ursulin <tvrtko.ursulin@igalia.com>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, Peter Griffin
	 <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, Juan
 Yescas <jyescas@google.com>, kernel-team@android.com
Date: Tue, 23 Jun 2026 15:08:39 +0200
In-Reply-To: <27f54324-94ac-4bbc-ba58-642a314197d7@igalia.com>
References: <20260618-linux-drm_crtc_fix-v1-1-801f29c9853d@linaro.org>
	 <099959fa-3a41-4166-8c10-4e5c2b9fdf19@amd.com>
	 <27f54324-94ac-4bbc-ba58-642a314197d7@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.1 (3.60.1-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	FROM_DN_EQ_ADDR(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-65471-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[pstanner@redhat.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:tursulin@igalia.com,m:christian.koenig@amd.com,m:andre.draszik@linaro.org,m:sumit.semwal@linaro.org,m:tvrtko.ursulin@igalia.com,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linaro-mm-sig@lists.linaro.org,m:linux-kernel@vger.kernel.org,m:peter.griffin@linaro.org,m:tudor.ambarus@linaro.org,m:jyescas@google.com,m:kernel-team@android.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[redhat.com:+];
	FROM_NEQ_ENVFROM(0.00)[pstanner@redhat.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,vger.kernel.org:from_smtp,ursulin.net:email,amd.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linaro.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5BD0F6B7593

On Thu, 2026-06-18 at 20:30 +0200, Tvrtko Ursulin wrote:
>=20
> On 18/06/2026 14:46, Christian K=C3=B6nig wrote:
> > On 6/18/26 14:00, Andr=C3=A9 Draszik wrote:
> > > dma_fence_timeline_name() is a wrapper around
> > > dma_fence_ops::get_timeline_name(). Since the blamed commit below, it
> > > calls an incorrect callback.
> > >=20
> > > Update it to restore functionality by calling the intended callback.
> > >=20
> > > Fixes: 62918542b7bf ("dma-fence: Fix sparse warnings due __rcu annota=
tions")
> > > Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>

Reviewed-by: Philipp Stanner <phasta@kernel.org>

> > I'm like 99% sure we had that already fixed weeks ago, but somehow it l=
ooks like that was never merged to drm-misc-fixes.

I'm also very sure that we had shot that bug down not too long in the
past.

> >=20
> > Anyway Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
>=20
> I was also perplexed and took me some digging to realise what had happene=
d.
>=20
> The copy-and-paste bug was indeed originally fixed in:
>=20
> commit 033559473dd3b55558b535aa37b8848c207b5cbb
> Author:=C2=A0 =C2=A0 =C2=A0Akash Goel <akash.goel@arm.com>
> AuthorDate: Tue Oct 21 17:09:51 2025 +0100
> Commit:=C2=A0 =C2=A0 =C2=A0Tvrtko Ursulin <tursulin@ursulin.net>
> CommitDate: Fri Oct 24 16:56:37 2025 +0100
>=20
> =C2=A0=C2=A0 =C2=A0 dma-fence: Fix safe access wrapper to call timeline n=
ame method
>=20
>=20
> But waaay before that I sent a fix for something else which touched=20
> those lines not noticing the copy-and-paste, fixing a different issue.=
=20
> That one however was not merged until earlier this year:
>=20
> commit 62918542b7bf08860a60ebbde7654486e0ac0776
> Author:=C2=A0 =C2=A0 =C2=A0Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> AuthorDate: Mon Jun 16 16:59:52 2025 +0100
> Commit:=C2=A0 =C2=A0 =C2=A0Christian K=C3=B6nig <christian.koenig@amd.com=
>
> CommitDate: Mon Feb 9 14:05:20 2026 +0100
>=20
> =C2=A0=C2=A0 =C2=A0 dma-fence: Fix sparse warnings due __rcu annotations
>=20
> Notice the authored vs commited dates.
>=20
> I guess it was a silent conflict which overwrote the earlier fix and=20
> restore the copy-and-paste bug.

silent conflict? If that can happen with our git workflow, how is it
that we don't see things like that more often?


P.


