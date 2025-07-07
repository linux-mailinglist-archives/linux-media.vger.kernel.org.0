Return-Path: <linux-media+bounces-37015-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B45B6AFB562
	for <lists+linux-media@lfdr.de>; Mon,  7 Jul 2025 15:55:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F10063A8E3F
	for <lists+linux-media@lfdr.de>; Mon,  7 Jul 2025 13:54:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 826022BE044;
	Mon,  7 Jul 2025 13:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="DXOoGT8M"
X-Original-To: linux-media@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E974A2BDC23;
	Mon,  7 Jul 2025 13:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751896479; cv=none; b=I6Mssc78lCB9AtZLcyJBZTJ642M1MFeryEUkmdx3vXlu5szrkY0SbvCQcFxzb/jxvHQP3DaDABB9daM8pnSLzTE4GG9l9nyAl0oylPp2/nxrBkTIxVnGCX6aOgZCYoB1ItvmA1EQyZ3pH9w3JLVb58W0N09p4Ork4CKUDjrHBfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751896479; c=relaxed/simple;
	bh=2BqhwT8Nr4vG7FFUJaWUmxP9QQSwgaOjItrDKQSh2ZI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=oawGYhpTUcxsDEBB4aoHpadZrjQ6Nzd3S9fTnuWN3WkbNSdWkRn/UxctY4hewcmjCtoHcK9lPnAxrctf8C8DqzYDO0XSXYcnM6uhx1mcBDgNckLZLqmh5RYiWX5DIPGgn3dP6dkziVzWLKwov44OF1jLrhft3+l7t2SRYFKbps8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=DXOoGT8M; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4bbQhp2bbYz9snN;
	Mon,  7 Jul 2025 15:54:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1751896474; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2BqhwT8Nr4vG7FFUJaWUmxP9QQSwgaOjItrDKQSh2ZI=;
	b=DXOoGT8MhARLRaliROBmSJNijpxY/AbJ1O2N+jsG4asOTxRB2QMjWeigPRlxYJ19SFGNAB
	H78kQ3V6kMaRn5qC9e0bVKE3bg7a3N+yhqp+UwMMVZuksOuojGriUpoNOkWuPIubPoxRlF
	bQEluWwQELB92vGG+VKzOI7RB8a25NY+BsW8/tx2d4NHVok3qpujZv97NnMYg76/jCDoFf
	4/404RsQyMoxxzVQghu+dDOeTDXLU0h1x2JhTzlY+AZlShxjk5gREAu6K58ychlZUC/Cyq
	ymms1NCjYmdCo3qpHT/4vFCpMaaqbjqL3TaoXdlw779PSJQ/jiQYHvBC6klDag==
Message-ID: <7d5137a8c71c525c4e806f8ff06102d2e3a47ccc.camel@mailbox.org>
Subject: Re: [PATCH v2 7/7] drm/nouveau: Remove waitque for sched teardown
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: Danilo Krummrich <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>
Cc: Lyude Paul <lyude@redhat.com>, David Airlie <airlied@gmail.com>, Simona
 Vetter <simona@ffwll.ch>, Matthew Brost <matthew.brost@intel.com>,
 Christian =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Sumit Semwal
 <sumit.semwal@linaro.org>, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, 
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Date: Mon, 07 Jul 2025 15:54:26 +0200
In-Reply-To: <89b0a4bf-2a66-4610-93d2-8f2f096592a3@kernel.org>
References: <20250707134221.34291-2-phasta@kernel.org>
	 <20250707134221.34291-9-phasta@kernel.org>
	 <89b0a4bf-2a66-4610-93d2-8f2f096592a3@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-ID: b05b9421ee7d28b08f7
X-MBO-RS-META: kuh7iboedyuumzst34pgyixoy47xmkat

On Mon, 2025-07-07 at 15:47 +0200, Danilo Krummrich wrote:
> On 7/7/25 3:42 PM, Philipp Stanner wrote:
> > struct nouveau_sched contains a waitque needed to prevent
> > drm_sched_fini() from being called while there are still jobs
> > pending.
> > Doing so so far would have caused memory leaks.
> >=20
> > With the new memleak-free mode of operation switched on in
> > drm_sched_fini() by providing the callback
> > nouveau_sched_fence_context_kill() the waitque is not necessary
> > anymore.
> >=20
> > Remove the waitque.
> >=20
> > Signed-off-by: Philipp Stanner <phasta@kernel.org>
>=20
> Doesn't this break the driver until fixed up by the subsequent patch?
>=20

Did you mean to answer to patch 6?

Patch 6 implements the cancel_job() callback for nouveau, which makes
sure the (still existing) waitque will never block. The, now redundant,
waitque then gets removed in patch 7.


P.

