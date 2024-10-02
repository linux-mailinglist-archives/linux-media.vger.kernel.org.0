Return-Path: <linux-media+bounces-18968-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A40398CEE4
	for <lists+linux-media@lfdr.de>; Wed,  2 Oct 2024 10:38:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C21C8B212D9
	for <lists+linux-media@lfdr.de>; Wed,  2 Oct 2024 08:38:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8B6A195F3B;
	Wed,  2 Oct 2024 08:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="p80H3rt6"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 980BE46BA;
	Wed,  2 Oct 2024 08:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727858299; cv=none; b=rrpRji+reDA3qcepeNlke+fWFz1fA8aTp+t3WIUL26VqmCXDzJj3ICuMDn0Q12rTndKAf/l6Zj83HD6BcOcz4QuExQvZkLW6FpImCQIw7Ty4WrDsyZ5HuaPmH17vYIWeM4OTG9y2nP4VpaBWgOPJamG7mTFgeEDK216myRi3798=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727858299; c=relaxed/simple;
	bh=PapsXDbscE5g+CTsH3TMd8PdEDw+5StvLgt1r7y4e2E=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VWHOzioEBwBTiOL1LAjPutypVZtNN3R6cmSGuPh34WmqupSWcP4bACqr3tRDGbGJ2SO/RJP8QbPD4bvVeZF4LGHl+QJdWmYF5pO8cBNTuy9v+pYKp9W/ov9FFUgVnQcRWosSWddRMCkoOcyvukLV5wM/GSn72FYeIAMIRYWpUsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=p80H3rt6; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1727858295;
	bh=PapsXDbscE5g+CTsH3TMd8PdEDw+5StvLgt1r7y4e2E=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=p80H3rt6J4/GSbs8bgUfR5T35tiZ1xTuCBrNO7xrn5z5McLQS5NLBZQpyMvM3AJOU
	 qJ8prqHbXBGhTaydK63dfTz2bVcfZ1sYS7mZ28DuWNpxUBEz9xBppAv9OwqR345MlF
	 B5JJ/RkJBW+j6K7sD6xcjTZbLBsJauDxVTBliEpl4Ufon4QdgdLWj0HPZdeGJZeAzr
	 7YB78MYC0VvdKGH1xfCVpO5eTqaXzHU8BvRlQYx7+zRMAHXNyfepAljngqCMPcuS85
	 Eieb475kQF23qy6QIUcFZiSl79fhHZzB39iJrXBqtXXl7C4Mtdev7k5M4BA8NjnIUe
	 BJn3kuwD4tbBA==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2720C17E1082;
	Wed,  2 Oct 2024 10:38:15 +0200 (CEST)
Date: Wed, 2 Oct 2024 10:38:09 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Sumit Semwal
 <sumit.semwal@linaro.org>, Christian =?UTF-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v8 1/5] drm/panthor: introduce job cycle and timestamp
 accounting
Message-ID: <20241002103809.26d34ee0@collabora.com>
In-Reply-To: <20240923230912.2207320-2-adrian.larumbe@collabora.com>
References: <20240923230912.2207320-1-adrian.larumbe@collabora.com>
	<20240923230912.2207320-2-adrian.larumbe@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 24 Sep 2024 00:06:21 +0100
Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com> wrote:

> +static u32 calc_profiling_ringbuf_num_slots(struct panthor_device *ptdev,
> +				       u32 cs_ringbuf_size)
> +{
> +	u32 min_profiled_job_instrs =3D U32_MAX;
> +	u32 last_flag =3D fls(PANTHOR_DEVICE_PROFILING_ALL);
> +
> +	/*
> +	 * We want to calculate the minimum size of a profiled job's CS,
> +	 * because since they need additional instructions for the sampling
> +	 * of performance metrics, they might take up further slots in
> +	 * the queue's ringbuffer. This means we might not need as many job
> +	 * slots for keeping track of their profiling information. What we
> +	 * need is the maximum number of slots we should allocate to this end,
> +	 * which matches the maximum number of profiled jobs we can place
> +	 * simultaneously in the queue's ring buffer.
> +	 * That has to be calculated separately for every single job profiling
> +	 * flag, but not in the case job profiling is disabled, since unprofiled
> +	 * jobs don't need to keep track of this at all.
> +	 */
> +	for (u32 i =3D 0; i < last_flag; i++) {
> +		if (BIT(i) & PANTHOR_DEVICE_PROFILING_ALL)

I'll get rid of this check when applying, as suggested by Steve. Steve,
with this modification do you want me to add your R-b?

BTW, I've also fixed a bunch of checkpatch errors/warnings, so you
might want to run checkpatch --strict next time.

> +			min_profiled_job_instrs =3D
> +				min(min_profiled_job_instrs, calc_job_credits(BIT(i)));
> +	}
> +
> +	return DIV_ROUND_UP(cs_ringbuf_size, min_profiled_job_instrs * sizeof(u=
64));
> +}

