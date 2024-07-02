Return-Path: <linux-media+bounces-14548-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3882292471A
	for <lists+linux-media@lfdr.de>; Tue,  2 Jul 2024 20:13:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9A9EDB25B9E
	for <lists+linux-media@lfdr.de>; Tue,  2 Jul 2024 18:13:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D17D1C6890;
	Tue,  2 Jul 2024 18:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ywc6Kuid"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EE9A1BA898
	for <linux-media@vger.kernel.org>; Tue,  2 Jul 2024 18:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719943997; cv=none; b=PhwnCnfgORp8IfKkVPJyYdjHwFXOmQHPbf0Lb3/8Tdo/kS5TNXMHkv3udjRol+4O4bsVElJdWQysfY/GICE0KCFZhwQ2OJQD7b445fLj6fZjoOsPmoGuyiHEuKeh9zTG2h2GJJS6ulI0p4X/yfcMrR23gyHdKUtTTP/y6fKTqII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719943997; c=relaxed/simple;
	bh=dZ5A4K4s+8L22Q59UD/QvrgILE4DRA3ni7S7WDd7nDQ=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=UkohZuwFY+7MozaZo8GzYL4u0U5Pf8yDAyuOy716ov8Od+9etxl3/cHQaH557pXotJ3Jk3/BrrXhnI5QnpTt4RwfBC4VA0AQxTMLuP77uiU7d0u3JNxZk/sryF4K7R4VLU0RCuLjqwErAmpWKF2nnumfOY51NWMYRtjdgjonbdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ywc6Kuid; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1719943994;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Smma+lOxNkJ2sjLtPIjHaCfcrzFcgWURK91IfYkiyKs=;
	b=Ywc6Kuid3whLZ9g1CiC7HXGHCLtlVOt4KEQWEOJgPOIKNs+Zj/Q4Y/49vh+s3IzeP0yX2y
	Tg93BOnb46hnx1YTUHQ9QmpGUsBnpSA9EcY1QeNv7VfdfuQjHwnf+FP4zKh8tkV/0yWvkA
	2j9IqQn+EFeiQ01OCCyEvZ2lSv2671A=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-486-68K1R0_pOKeYCSPfeDHzIA-1; Tue, 02 Jul 2024 14:12:47 -0400
X-MC-Unique: 68K1R0_pOKeYCSPfeDHzIA-1
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-57d4769a15bso1270051a12.1
        for <linux-media@vger.kernel.org>; Tue, 02 Jul 2024 11:12:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719943956; x=1720548756;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Smma+lOxNkJ2sjLtPIjHaCfcrzFcgWURK91IfYkiyKs=;
        b=FejB+P+Sl1KxykQp4pgotschhNO9AsY2gyJt7/DTOjvimmeLZLc6b0rfnDUzDRXeFS
         hxq/M/GQ0iw0UYTDbhO2suHMHQ0FUjrQcDHlL4ux9AbpZy+V/oy7O9AMDNBHgK+xUDMn
         LPEIoviw7Q5oaLAUfP8Oh238hkGCRkvVMh6PGsZmbrIu5MGI0fMBXxR9AVb9o1/kyL9h
         stXqmg3V/FokEooze8SlffDesY8Ry1/XUcfK+9T+ADrvQ4B2WHZgs9zH8p1NfjEibqsm
         i73gMPtWUvqE3FS7Cb+g6QKlYkm7cyuydQzVW0gXIYK2Q6NZe7xQ5zKGhsulYOVK9u1J
         TJYQ==
X-Forwarded-Encrypted: i=1; AJvYcCUDkzleaEkxabo+q00Ut2tvQOKHnd/7L98FHcQSum6/qRUC9EGcQTHG3c+E9p+Ym0RHiVS7+lBkTRym0+4zqv14CV2L5CR5S5afZgg=
X-Gm-Message-State: AOJu0YzitgUYJDWYPXxQduMpB2gz1vHKvZ+QyQL4GdT5jNQYQeqNJMCt
	JlCmcMPKM7oO+yl10DL2mD0He3nMUsuHRzD/9czinjTo719+n3GtQ4sXDX8i2eSBfvX+mTiCgde
	9H85FINWZz5FiZS7nwI611FI66Ny3aYqv8qdo6o8J8CjWNHt6k+Y/IuPUSzL09Nh+9rRF
X-Received: by 2002:a17:906:4fc3:b0:a75:4723:b3b3 with SMTP id a640c23a62f3a-a754723b43fmr159155966b.44.1719943956175;
        Tue, 02 Jul 2024 11:12:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFKG8sHrBThte5IKIBR9OazUD/PriuYdyoTDPiLGQBNmGvws+HBNC4quv4/Et80AnwbM71zvw==
X-Received: by 2002:a17:906:4fc3:b0:a75:4723:b3b3 with SMTP id a640c23a62f3a-a754723b43fmr159154866b.44.1719943955716;
        Tue, 02 Jul 2024 11:12:35 -0700 (PDT)
Received: from ?IPV6:2001:1c00:2a07:3a01:e7a9:b143:57e6:261b? (2001-1c00-2a07-3a01-e7a9-b143-57e6-261b.cable.dynamic.v6.ziggo.nl. [2001:1c00:2a07:3a01:e7a9:b143:57e6:261b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a72aaf1d201sm435898066b.9.2024.07.02.11.12.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jul 2024 11:12:35 -0700 (PDT)
Message-ID: <198f10eb-d1f1-474b-8a4e-2b2236fff8b2@redhat.com>
Date: Tue, 2 Jul 2024 20:12:34 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL] media: atomisp: Changes for 6.10-1
From: Hans de Goede <hdegoede@redhat.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-staging@lists.linux.dev, Kate Hsuan <hpa@redhat.com>,
 "kieran.bingham@ideasonboard.com" <kieran.bingham@ideasonboard.com>
References: <43245a4b-1e5a-4d27-876b-853a67b0ad28@redhat.com>
Content-Language: en-US
In-Reply-To: <43245a4b-1e5a-4d27-876b-853a67b0ad28@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Note the Subject is wrong, this is for 6.11, not 6.10 ...

On 7/2/24 8:11 PM, Hans de Goede wrote:
> Hi Mauro, Hans,
> 
> Here is a first round of atomisp changes for 6.11.
> 
> Highlights:
> - Update driver for the atomisp firmware now being available in linux-firmware
> - Couple of cleanups from Andy Shevchenko
> - Bunch of spelling fixes
> 
> Regards,
> 
> Hans
> 
> 
> The following changes since commit a0157b5aa34eb43ec4c5510f9c260bbb03be937e:
> 
>   media: venus: fix use after free in vdec_close (2024-06-30 11:22:44 +0200)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux.git tags/media-atomisp-6.11-1
> 
> for you to fetch changes up to 841c19674e180f58b3dd34f991672cce09dfaf39:
> 
>   media: atomisp: Fix spelling mistakes in sh_css_sp.c (2024-07-02 12:39:37 +0200)
> 
> ----------------------------------------------------------------
> atomisp staging driver changes for 6.11-1
> 
> Highlights:
> - Update driver for the atomisp firmware now being available in linux-firmware
> - Couple of cleanups from Andy Shevchenko
> - Bunch of spelling fixes
> 
> ----------------------------------------------------------------
> Andy Shevchenko (3):
>       media: atomisp: Clean up unused macros from math_support.h
>       media: atomisp: Replace COMPILATION_ERROR_IF() by static_assert()
>       media: atomisp: Remove unused GPIO related defines and APIs
> 
> Colin Ian King (1):
>       media: atomisp: Fix spelling mistake "pipline" -> "pipeline"
> 
> Hans de Goede (5):
>       media: atomisp: Remove unused mipicsi_flag module parameter
>       media: atomisp: Remove firmware_name module parameter
>       media: atomisp: Prefix firmware paths with "intel/ipu/"
>       media: atomisp: Update TODO
>       media: atomisp: csi2-bridge: Add DMI quirk for OV5693 on Xiaomi Mipad2
> 
> Roshan Khatri (5):
>       media: atomisp: Fix spelling mistake in sh_css_internal.h
>       media: atomisp: Fix spelling mistake in ia_css_eed1_8.host.c
>       media: atomisp: Fix spelling mistake in hmm_bo.c
>       media: atomisp: Fix spelling mistake in ia_css_debug.c
>       media: atomisp: Fix spelling mistakes in sh_css_sp.c
> 
>  drivers/staging/media/atomisp/TODO                 |  31 +-----
>  drivers/staging/media/atomisp/pci/atomisp_common.h |   1 -
>  .../media/atomisp/pci/atomisp_csi2_bridge.c        |  14 +++
>  drivers/staging/media/atomisp/pci/atomisp_ioctl.c  |   2 +-
>  drivers/staging/media/atomisp/pci/atomisp_v4l2.c   |  37 +++----
>  .../base/circbuf/interface/ia_css_circbuf_comm.h   |   6 ++
>  .../pci/camera/util/interface/ia_css_util.h        |  11 ---
>  .../media/atomisp/pci/camera/util/src/util.c       |  25 +++--
>  .../staging/media/atomisp/pci/gpio_block_defs.h    |  17 ----
>  .../atomisp/pci/hive_isp_css_common/gpio_global.h  |  23 -----
>  .../pci/hive_isp_css_common/host/gpio_local.h      |  21 ----
>  .../pci/hive_isp_css_common/host/gpio_private.h    |   9 +-
>  .../pci/hive_isp_css_include/assert_support.h      |  23 -----
>  .../media/atomisp/pci/hive_isp_css_include/gpio.h  |  46 ---------
>  .../pci/hive_isp_css_include/host/gpio_public.h    |  46 ---------
>  .../pci/hive_isp_css_include/math_support.h        | 110 +--------------------
>  .../pci/hive_isp_css_include/type_support.h        |   5 +-
>  drivers/staging/media/atomisp/pci/hmm/hmm_bo.c     |   4 +-
>  drivers/staging/media/atomisp/pci/ia_css_3a.h      |   5 +
>  drivers/staging/media/atomisp/pci/ia_css_dvs.h     |   4 +
>  .../staging/media/atomisp/pci/ia_css_metadata.h    |   4 +
>  drivers/staging/media/atomisp/pci/ia_css_types.h   |   2 +
>  .../pci/isp/kernels/eed1_8/ia_css_eed1_8.host.c    |   2 +-
>  .../pci/isp/kernels/xnr/xnr_3.0/ia_css_xnr3.host.c |   6 +-
>  .../media/atomisp/pci/runtime/binary/src/binary.c  |   2 -
>  .../atomisp/pci/runtime/debug/src/ia_css_debug.c   |   4 +-
>  .../runtime/spctrl/interface/ia_css_spctrl_comm.h  |   4 +
>  drivers/staging/media/atomisp/pci/sh_css.c         |  48 +--------
>  drivers/staging/media/atomisp/pci/sh_css_frac.h    |   4 +-
>  .../staging/media/atomisp/pci/sh_css_internal.h    |  19 +++-
>  drivers/staging/media/atomisp/pci/sh_css_sp.c      |  24 ++---
>  31 files changed, 118 insertions(+), 441 deletions(-)
>  delete mode 100644 drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gpio_local.h
>  delete mode 100644 drivers/staging/media/atomisp/pci/hive_isp_css_include/gpio.h
>  delete mode 100644 drivers/staging/media/atomisp/pci/hive_isp_css_include/host/gpio_public.h


