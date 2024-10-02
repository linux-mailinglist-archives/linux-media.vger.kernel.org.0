Return-Path: <linux-media+bounces-18969-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3041898CEF9
	for <lists+linux-media@lfdr.de>; Wed,  2 Oct 2024 10:40:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D71361F22D91
	for <lists+linux-media@lfdr.de>; Wed,  2 Oct 2024 08:40:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3967D195FE3;
	Wed,  2 Oct 2024 08:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="K5w+4ymg"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6F9B46BA;
	Wed,  2 Oct 2024 08:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727858415; cv=none; b=d7qXlNTN8h6fw5ajK/dlJmYnqyE/ua4AboMh1XEYREFOZdfovrea9Hof/QdpLlUo8ymODP9sCONccFcPQyIqGZzIAMsYVgCpfkhOWcxjHwMuHBXhFiz4tNf22fDqj9zbWbxpJbusdFJa8uSLTZP7zuenhpvGX6WgVzSozf210h8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727858415; c=relaxed/simple;
	bh=E072KCVh6LJlFj0HOPume94KTKRPv9XY7u/cVyvRPyk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NgO9Y7Bofv8ESUS2R9Y2xcSmC8IS35Fs+APURph3WPoCaBXfq9NvgyeMlkduSTgbGvPp3Fw+QjGFSfq19GBtH5OeTYL5kHah+WQAdqZT9T5faryAg2oj67Zmsf8VVDecJ4dTmEmTOrUGq15XRKwHsmtr6PS2/6TEg2zhUgdKdTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=K5w+4ymg; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1727858412;
	bh=E072KCVh6LJlFj0HOPume94KTKRPv9XY7u/cVyvRPyk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=K5w+4ymg5N/PtfoggMLxoOi2zwnyqYQDZxpNXfK7Ykat4b91VXf4SFFPU0CP3EywD
	 hLmHQhTLebP8IiogDgNFfWgSY0rqES4sfbkVChT2IMg5Cj2B9JQ+J1PCLw7zDm18jV
	 3Y0OXSQeNypck3HB4aNJNjw/n6WYrBWZbELFyJwOjeK8MsIh4cPRIPt4oQMezs+wU4
	 w/BwDIA1IX2+Y05VZXHzBGCCU6AYEbB2Yy+F9UGCIMG1PJu7yEVmSyBQkbACeP/4nn
	 UNMmYsaK79A6F1Fz0x6s1yRoK2rIbmpBBDsh8pVxDR5/zr7yKyBQkGk0zy5y2EyaX3
	 rNhgIE81/h+yg==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7F26A17E1082;
	Wed,  2 Oct 2024 10:40:11 +0200 (CEST)
Date: Wed, 2 Oct 2024 10:40:06 +0200
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
Subject: Re: [PATCH v8 3/5] drm/panthor: add DRM fdinfo support
Message-ID: <20241002104006.5e2f744b@collabora.com>
In-Reply-To: <20240923230912.2207320-4-adrian.larumbe@collabora.com>
References: <20240923230912.2207320-1-adrian.larumbe@collabora.com>
	<20240923230912.2207320-4-adrian.larumbe@collabora.com>
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

On Tue, 24 Sep 2024 00:06:23 +0100
Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com> wrote:

> +static void update_fdinfo_stats(struct panthor_job *job)
> +{
> +	struct panthor_group *group =3D job->group;
> +	struct panthor_queue *queue =3D group->queues[job->queue_idx];
> +	struct panthor_gpu_usage *fdinfo =3D &group->fdinfo.data;
> +	struct panthor_job_profiling_data *times;
> +
> +	times =3D (struct panthor_job_profiling_data *)
> +		((unsigned long) queue->profiling.slots->kmap +
> +		 (job->profiling.slot * sizeof(struct panthor_job_profiling_data)));

The casting done here is a bit of a mess, so I replaced it by:

	struct panthor_job_profiling_data *slots =3D queue->profiling.slots->kmap;
	struct panthor_job_profiling_data *data =3D &slots[job->profiling.slot];

> +
> +	mutex_lock(&group->fdinfo.lock);
> +	if (job->profiling.mask & PANTHOR_DEVICE_PROFILING_CYCLES)
> +		fdinfo->cycles +=3D times->cycles.after - times->cycles.before;
> +	if (job->profiling.mask & PANTHOR_DEVICE_PROFILING_TIMESTAMP)
> +		fdinfo->time +=3D times->time.after - times->time.before;
> +	mutex_unlock(&group->fdinfo.lock);
> +}

