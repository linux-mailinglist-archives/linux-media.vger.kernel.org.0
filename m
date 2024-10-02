Return-Path: <linux-media+bounces-18985-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B21E98D09E
	for <lists+linux-media@lfdr.de>; Wed,  2 Oct 2024 11:58:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CBC56B22DEA
	for <lists+linux-media@lfdr.de>; Wed,  2 Oct 2024 09:58:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5A331E411F;
	Wed,  2 Oct 2024 09:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Ke2ig3SH"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DB3D13D51B;
	Wed,  2 Oct 2024 09:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727863100; cv=none; b=DLqK3kFFdDLa62YnKSlvvWxaGL9eCoeKf434D8L5lvoi80DXHKPaCRqHAkqqqg/obmBKqyTciugM5IPC/uYf4R7xv6Kh1I4pBl9kUw+cxnnl3d3YIzMCMN9JQ8ooEdteR/Esd+SHB25AGSLuB6/NXx4CYXds32DTM1dhc/IFghY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727863100; c=relaxed/simple;
	bh=1Wu8gz7SNzE9dXIwLl9sRnsY2wkdlQOxuOY5+fjdyqI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=n4Hl51Dx2WAiARKBxio1kEX+PaDaAFyV9hsZ2x4mn15vWVEmkLM0yj2chhRTeTmC87yfa9aUn8/JK6G6YYgpWXjXbLLeDE4zcdK/MH3y1LJ2QUOjOU7GjSxseuRyre6uSNbRZi81Qcw3i2euR8Rr4Irc99w/k/o5dgquRjEyYGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Ke2ig3SH; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1727863096;
	bh=1Wu8gz7SNzE9dXIwLl9sRnsY2wkdlQOxuOY5+fjdyqI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Ke2ig3SHS7s7dXwARMfmB9XJ61pBF6kaCdZg5QrB9Srd46sNo/Bb5iXZkEajhb7vX
	 nikfkWpPbE6Hqki5JbKTVWFfNLZxdXO/z7GQegFFisR6xYw4pVx7fHAC6JE8Qd3MnC
	 wjqX/CtSlqnuOZXDy5Rm+65uEuDvQG+cclV1wLjuvqGtDcuBgHnRKEvuHakTTOeDTd
	 1JEY1bWlNj/VBozV7XDbap1gp5CC/0JvZO2MyC69F13QQkn8xXy8hbtqhmTcnx//EE
	 xUWDI/hNe+t3DLHVzoThxtsQs0xmdYu/WzK0Ii9bi7iPCm6veGb09NPWTfmRvblERQ
	 E8jV36Akd5VxQ==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 14B1C17E120E;
	Wed,  2 Oct 2024 11:58:16 +0200 (CEST)
Date: Wed, 2 Oct 2024 11:58:10 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>, Steven
 Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Sumit Semwal
 <sumit.semwal@linaro.org>, Christian =?UTF-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v8 0/5] Support fdinfo runtime and memory stats on
 Panthor
Message-ID: <20241002115810.32cbde0c@collabora.com>
In-Reply-To: <877caqvorq.fsf@intel.com>
References: <20240923230912.2207320-1-adrian.larumbe@collabora.com>
	<20241002105715.18ec024c@collabora.com>
	<877caqvorq.fsf@intel.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 02 Oct 2024 12:26:49 +0300
Jani Nikula <jani.nikula@linux.intel.com> wrote:

> On Wed, 02 Oct 2024, Boris Brezillon <boris.brezillon@collabora.com> wrote:
> > Queued to drm-misc-next after applying the few modifications I
> > mentioned. Also added Steve's ack (given on IRC) on the first patch.  
> 
> Can we have the drm-tip rebuild conflict resolution too, please?

Oops, sorry. Should be good now.

> 
> diff --cc drivers/gpu/drm/panthor/panthor_drv.c
> index c520f156e2d7,f9b93f84d611..000000000000
> --- a/drivers/gpu/drm/panthor/panthor_drv.c
> +++ b/drivers/gpu/drm/panthor/panthor_drv.c
> @@@ -1383,7 -1476,7 +1476,11 @@@ static const struct file_operations pan
>         .read = drm_read,
>         .llseek = noop_llseek,
>         .mmap = panthor_mmap,
> ++<<<<<<< HEAD
>  +      .fop_flags = FOP_UNSIGNED_OFFSET,
> ++=======
> +       .show_fdinfo = drm_show_fdinfo,
> ++>>>>>>> drm-misc/drm-misc-next  
>   };
>   
>   #ifdef CONFIG_DEBUG_FS

