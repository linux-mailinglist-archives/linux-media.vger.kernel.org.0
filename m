Return-Path: <linux-media+bounces-25109-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F1E54A18D8F
	for <lists+linux-media@lfdr.de>; Wed, 22 Jan 2025 09:23:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BCCEC3A5357
	for <lists+linux-media@lfdr.de>; Wed, 22 Jan 2025 08:23:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 370711C4A17;
	Wed, 22 Jan 2025 08:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FP2zlS8Z"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8E7C1C3C14
	for <linux-media@vger.kernel.org>; Wed, 22 Jan 2025 08:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737534222; cv=none; b=NhbmapS4VgC3k6G3lr9Jd3tgfcoTbEQy5/8EqfkdwOiPRDWSHBQc85gETh7J2DGo+HWQgkARwn2bqWeSSGUgV8Ei780i7zq5nKMFDfCwRiNsJlQlUzb1tHTFp2VGToE4fcOF6HMKmWzvOmsdlKFjRTeV1yzZEBdWvEsLk2X4aSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737534222; c=relaxed/simple;
	bh=PVGSHSfPlnas+VY5S2g7YHsLUR35+wqex29yMzLsqw0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BNLsIkjCrWRKYuOWA/dg8xL6N0IqDERB4CWy0xptC3neZv9QmLp96aHQwRuGcoRbz1eIWNNuXJ3aYFoibg9ALoKhov6dUXtuEr3eGn51a1FQNfbprjJ5vhIoZg1qPu3wTHeRF/qMCalbJmIEzlzgw/yUp5/96FoKw6iJgdBfhnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FP2zlS8Z; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737534219;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PVGSHSfPlnas+VY5S2g7YHsLUR35+wqex29yMzLsqw0=;
	b=FP2zlS8Zi2T2pERHFuecwCHhJPZq7u96sUCaLgryC/RllO8MEyb/KRhq/Ac5tqhStQnEHF
	sYi/42az9uwPdaLEQC+MCeNpNtuz5o3kLdIFZyScylqVymvhhjPMC9xleqnbzsTaElHf2c
	uMryhuRcXCHAn83MCiCRfJYj124pwyA=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-694-e_wErjf6MseY7pMsZvVf9A-1; Wed, 22 Jan 2025 03:23:38 -0500
X-MC-Unique: e_wErjf6MseY7pMsZvVf9A-1
X-Mimecast-MFC-AGG-ID: e_wErjf6MseY7pMsZvVf9A
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-2f550d28f7dso12272791a91.3
        for <linux-media@vger.kernel.org>; Wed, 22 Jan 2025 00:23:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737534217; x=1738139017;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PVGSHSfPlnas+VY5S2g7YHsLUR35+wqex29yMzLsqw0=;
        b=UXmkSw80sEx/bGsbPvXDpsmv7X249eZOIUY3acuYg/ZQ+h6t4B+b+MxEFu3KiCOkGP
         8y7B5k+G/IefFt3I/q5VNfF7KFA4qrDE2Dr9YHKS4/NG3TBWxerNktpW04xujawP4Q/a
         Rl5OwVutOrC01ZBxKMoCaV15QGpHUg9IJOB0J7vNaxwkaxj7wSxPqARPtw1TIKJ+uiBB
         b/xX9SA5Hl7+be7nhYgL/H54a2QpmWgTR5CpCsnbWe90tHNqhJMx/Vz8nBDLz6f8n7gR
         8gPCVsQqufo7an7wm+GbFrv4y8136buOgHLAUjGXHvYmn2qsLT6Re0xIhDjQdzi8H2iP
         C0ig==
X-Forwarded-Encrypted: i=1; AJvYcCXCdp2t3enktHTyxrLRWqTzcbsNbzCoI1hG6xhZ9shNA5WNvuGFQee0opMJSi3KmXuLtlqSRI3S8hhqQg==@vger.kernel.org
X-Gm-Message-State: AOJu0YywTli4ZuELEyfV01OAtTvQ/d34M7+lbrbX0vTS+2cBC9Bw7ZTf
	0+SEwlakfFn8NWTSI6fvhglRxwp+sPRBk56Qbx0WuJPoPMIgM2HWilgkECwjeQ9SV3ZGWtcj7/F
	clqhuq1MJ9d2TCyfIMu5ZeVbrOiYDf3W0cLd8WmKbHo2kryOwSZuomOsnmOyU
X-Gm-Gg: ASbGncvtOOtgH3nevYZcYNiBozpKRu4V7zK7IdKtkvYOarkXXOJHmvS4u1u/njjXu7+
	UBT+whH/z4bW/Z7nVrFG71fHSwlnRaklzjwHJX6Ia1e+rJYjATfo9oFNs6Js2UZ5bxHCtB2C64Y
	++rpcdMKS6tRmsTuycu50bnyNkl3eF0jDb4itrLG7NXvhOondY1ODFj/NGWPyFxyrNP7rS/A+m9
	9E3J/D0yW1VYU9KA2Fqy6bX/qR9MLd2iBAGX1bRtYHEuks93UVpqZRbrm15f81YmDpCHTcZai+X
	mq2ThxWW5cSXATjS8l0t
X-Received: by 2002:a05:6a00:1813:b0:729:cc5:fa42 with SMTP id d2e1a72fcca58-72dafbaa1c1mr31265262b3a.20.1737534216909;
        Wed, 22 Jan 2025 00:23:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFtQffHib0TFRrC5PxTtGere1N52BNH4TNwO/Y7PEoMr4v6BhKhGRaCupmrztVvUK6BJxfN7g==
X-Received: by 2002:a05:6a00:1813:b0:729:cc5:fa42 with SMTP id d2e1a72fcca58-72dafbaa1c1mr31265233b3a.20.1737534216564;
        Wed, 22 Jan 2025 00:23:36 -0800 (PST)
Received: from [10.200.68.91] (nat-pool-muc-u.redhat.com. [149.14.88.27])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72dabaa8948sm10413476b3a.164.2025.01.22.00.23.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2025 00:23:36 -0800 (PST)
Message-ID: <9329836ce71a24360abc568498dc7e4ea059cd87.camel@redhat.com>
Subject: Re: [PATCH v2 0/3] drm/sched: Documentation and refcount
 improvements
From: Philipp Stanner <pstanner@redhat.com>
To: Philipp Stanner <phasta@kernel.org>, Matthew Brost
 <matthew.brost@intel.com>,  Danilo Krummrich <dakr@kernel.org>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>,  Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>,  Simona Vetter <simona@ffwll.ch>, Sumit Semwal
 <sumit.semwal@linaro.org>, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Date: Wed, 22 Jan 2025 09:23:23 +0100
In-Reply-To: <20250121151544.44949-2-phasta@kernel.org>
References: <20250121151544.44949-2-phasta@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, 2025-01-21 at 16:15 +0100, Philipp Stanner wrote:
> Changes in v2:
> =C2=A0 - Document what run_job() is allowed to return. (Tvrtko)
> =C2=A0 - Delete confusing comment about putting the fence. (Danilo)
> =C2=A0 - Apply Danilo's RB to patch 1.
> =C2=A0 - Delete info about job recovery for entities in patch 3. (Danilo,
> me)
> =C2=A0 - Set the term "ring" as fix term for both HW rings and FW rings. =
A
> =C2=A0=C2=A0=C2=A0 ring shall always be the thingy on the CPU ;) (Danilo)

s/CPU/GPU

obviously.

P.


> =C2=A0 - Many (all) other comments improvements in patch 3. (Danilo)
>=20
> This is as series succeeding my previous patch [1].
>=20
> I recognized that we are still referring to a non-existing function
> and
> a deprecated one in the callback docu. We should probably also point
> out
> the important distinction between hardware and firmware schedulers
> more
> cleanly.
>=20
> Please give me feedback, especially on the RFC comments in patch3.
>=20
> (This series still fires docu-build-warnings. I want to gather
> feedback
> on the opion questions first and will solve them in v2.)
>=20
> Thank you,
> Philipp
>=20
> [1]
> https://lore.kernel.org/all/20241220124515.93169-2-phasta@kernel.org/
>=20
> Philipp Stanner (3):
> =C2=A0 drm/sched: Document run_job() refcount hazard
> =C2=A0 drm/sched: Adjust outdated docu for run_job()
> =C2=A0 drm/sched: Update timedout_job()'s documentation
>=20
> =C2=A0drivers/gpu/drm/scheduler/sched_main.c |=C2=A0=C2=A0 5 +-
> =C2=A0include/drm/gpu_scheduler.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 106 ++++++++++++++++-------
> --
> =C2=A02 files changed, 71 insertions(+), 40 deletions(-)
>=20


