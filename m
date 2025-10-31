Return-Path: <linux-media+bounces-46080-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 754C2C25BB5
	for <lists+linux-media@lfdr.de>; Fri, 31 Oct 2025 16:01:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 2D7694F850B
	for <lists+linux-media@lfdr.de>; Fri, 31 Oct 2025 14:58:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E3FA1F130A;
	Fri, 31 Oct 2025 14:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="GPKDZ4Ji"
X-Original-To: linux-media@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48307192B84;
	Fri, 31 Oct 2025 14:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761922082; cv=none; b=t+YWSXTEj+97zrobfxvjO8VOGwPZcA8wjRxOXyZqYMy6cz7E6zw79XSfx0+nbB00wXkNRWFuczstxSMAivGqEXT4HReR9I4fAlSxbP+tG3vBEOFnidwMTGtXKxz38PJ88o5iI54UYrrW4Xpon3+Xd5DUSvhLd7nlV0G7uQ22IJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761922082; c=relaxed/simple;
	bh=wUbU0LdBSZ9qpL5qWJVMd119J9mcG2Lz3LJ8hYUx95A=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=p0+yGrPUw6Ojlk4K96XDURH9fdQVRwChSv+5O2WGVdFOYiieJ7li4HosQOm9uRFtZavzo1K2nXv9vIGo7WvS+APycgKuFB2plDBXl3+MkrpBPpRTkoHIw7YM3G4nsHNd3rMJci6OUBwhobm4NSEKH7FrP2BEtBNEKbJAnHrsEgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=GPKDZ4Ji; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4cykFd5Ty1z9t6Q;
	Fri, 31 Oct 2025 15:41:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1761921701; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=r7oF0pHiTKfHggDqHbs4XCDSzjGm+M2FdqzdYufdWyg=;
	b=GPKDZ4JixaBKjXl2cX9I1oyUFn+2gT1Mvzzfp+dtw61j63t1VKbr4wE/3DL7lHcmGtms1L
	WYLpHlKRysiK/+AcAOIE/Lc2UcB50ZdPWhASbd33rwMQ8BXpZmtRQcbn9n0NzpFbnF1khc
	A5ehcjerpzth4q8Q3Be+aJIzdcM9+QqZfRgdXgttIevy5WsSUHNyzyEjzej2Lh7UD8nUNk
	EvRXRqtQ+VVlDQ2XO4NMVOXK7sr2Pl8xUHlh0UnyzkLt0a36mYR/idiWnlnmQsBGguYH67
	eNqtW8UV2otQBr9uK9A4mF9IRvWhv+0LAwWwCqgr6XUSdJ4Nhws9I+SedACoHw==
Message-ID: <3006a63b5e38f3d3bfd07047fa8e8ed2e9d2a93d.camel@mailbox.org>
Subject: Re: [PATCH v3] drm/sched: Add warning for removing hack in
 drm_sched_fini()
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: Pierre-Eric Pelloux-Prayer <pierre-eric@damsy.net>, Philipp Stanner
 <phasta@kernel.org>, Matthew Brost <matthew.brost@intel.com>, Danilo
 Krummrich <dakr@kernel.org>, Christian =?ISO-8859-1?Q?K=F6nig?=
 <ckoenig.leichtzumerken@gmail.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org
Date: Fri, 31 Oct 2025 15:41:38 +0100
In-Reply-To: <ebc028f2-3d2d-4f42-a667-df7d6c2b7eb0@damsy.net>
References: <20251023123429.139848-2-phasta@kernel.org>
	 <ebc028f2-3d2d-4f42-a667-df7d6c2b7eb0@damsy.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-META: ozkjknk9jqrgne35isjct51z4rm7d7ye
X-MBO-RS-ID: 718dfa83b9c480413cf

On Fri, 2025-10-31 at 15:10 +0100, Pierre-Eric Pelloux-Prayer wrote:
> Hi Philipp,
>=20
> Le 23/10/2025 =C3=A0 14:34, Philipp Stanner a =C3=A9crit=C2=A0:
> > The assembled developers agreed at the X.Org Developers Conference 2025
> > that the hack added for amdgpu in drm_sched_fini() shall be removed. It
> > shouldn't be needed by amdgpu anymore.
> >=20
> > As it's unclear whether all drivers really follow the life time rule of
> > entities having to be torn down before their scheduler, it is reasonabl=
e
> > to warn for a while before removing the hack.
> >=20
> > Add a warning in drm_sched_fini() that fires if an entity is still
> > active.
> >=20
> > Signed-off-by: Philipp Stanner <phasta@kernel.org>

[=E2=80=A6]

>=20
> The patch is Acked-by: Pierre-Eric Pelloux-Prayer=20
> <pierre-eric.pelloux-prayer@amd.com>

Pushed to drm-misc-next, thanks.

For the future: b4 / maintainer-tools wasn't able to automatically
harvest your Acked-by. Would be helpful if you have the A-b on a single
line without line break and without other content in the future

Have a nice weekend,
P.

>=20
> Thanks.
>=20
>=20
> > =C2=A0=C2=A0		spin_unlock(&rq->lock);
> > =C2=A0=C2=A0		kfree(sched->sched_rq[i]);
> > =C2=A0=C2=A0	}


