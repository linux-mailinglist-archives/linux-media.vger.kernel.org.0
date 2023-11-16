Return-Path: <linux-media+bounces-438-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 839E57EDFC8
	for <lists+linux-media@lfdr.de>; Thu, 16 Nov 2023 12:26:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3D780280F54
	for <lists+linux-media@lfdr.de>; Thu, 16 Nov 2023 11:26:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13E472E413;
	Thu, 16 Nov 2023 11:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LKXPr3po"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9718E189
	for <linux-media@vger.kernel.org>; Thu, 16 Nov 2023 03:26:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700133988;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xhfIum68/LfGGlKZxKOpUyUVoYt3PypwKYYqLYNBIe4=;
	b=LKXPr3poCS0Jvwqk31sYxbtX4gHmsXQ3+H40DISKO50Nw/5togLZ4lN4mw2tZan/tG2eVV
	KVz8sT1jSe/FivlukqSx7fLktEbrzfA9mXZb5oTTrGkVnBvIjJ0QREVE/rDoUwUecIJm7e
	E8QZPQzmYGerQJbzB7C220J6lXfVBtA=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-5-OzPXISLEOHyf1yttwF9l6Q-1; Thu, 16 Nov 2023 06:26:27 -0500
X-MC-Unique: OzPXISLEOHyf1yttwF9l6Q-1
Received: by mail-lj1-f198.google.com with SMTP id 38308e7fff4ca-2c73f8300c9so5986361fa.1
        for <linux-media@vger.kernel.org>; Thu, 16 Nov 2023 03:26:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700133985; x=1700738785;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xhfIum68/LfGGlKZxKOpUyUVoYt3PypwKYYqLYNBIe4=;
        b=wb5Hr9xg88PJXwZTCTNgt1QWhe6cLNiGwCQQ8QQdbommMu+UM25n1aAnuue0eNCbE3
         kkLfsbEakm09zx9sd8a78Xor50kuZp/vJxZWKgzs341BXmvqfXtNnmf91rRwUK21EACZ
         XaAg1oRZfbv/8uJ/TvkT3IAE8ELKN/MJZ0/hawF0I+91i+XlhF7K2aWxP5D70NWIbmBj
         SyaW/nhlrQXruZme2M442PwSVWQRguE+kyLOKYv4XHAkYE7VBfOCVu+bJwH8upL5+XNk
         PVPHrxHcBJjXkS0l400GnShJI81lw43msEH6lRdJfvAckYdiaX3mihwBmJ2kDOxrMLVz
         sJhw==
X-Gm-Message-State: AOJu0YyiVieiYdwLnNfj+85958qjP5bCa93mXusvgEPGjF3kqt5gGLNk
	W5RSuz/dg3ohBwgEPB1c45S05P9CrTPI1lKSw2B0Z8xrPC9rvTyRObq+tqTgEYchUeFrw1j7mNH
	vdAZ8h+4VtEuWgpfJiLV8hYQ=
X-Received: by 2002:a2e:a4cb:0:b0:2c5:5926:de52 with SMTP id p11-20020a2ea4cb000000b002c55926de52mr5121267ljm.53.1700133985734;
        Thu, 16 Nov 2023 03:26:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEJnR2iDTGVBiyLONW/q3XfA8jLqJYND8GKOCtotFp7WUFdUTultF747i6hHAkQad7D5Wm1Ng==
X-Received: by 2002:a2e:a4cb:0:b0:2c5:5926:de52 with SMTP id p11-20020a2ea4cb000000b002c55926de52mr5121250ljm.53.1700133985429;
        Thu, 16 Nov 2023 03:26:25 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id k42-20020a05600c1caa00b003feae747ff2sm3302601wms.35.2023.11.16.03.26.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Nov 2023 03:26:25 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de
Cc: linux-fbdev@vger.kernel.org, Andy Walls <awalls@md.metrocast.net>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Subject: Re: [PATCH 20/32] media/ivtvfb: Initialize fb_ops to fbdev
 I/O-memory helpers
In-Reply-To: <20231115102954.7102-21-tzimmermann@suse.de>
References: <20231115102954.7102-1-tzimmermann@suse.de>
 <20231115102954.7102-21-tzimmermann@suse.de>
Date: Thu, 16 Nov 2023 12:26:24 +0100
Message-ID: <87y1ey2b33.fsf@minerva.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Initialize the instance of struct fb_ops with fbdev initializer
> macros for framebuffers in I/O address space. This explictily sets
> the read/write, draw and mmap callbacks to the correct default
> implementation.
>
> Fbdev drivers sometimes rely on the callbacks being NULL for a
> default implementation to be invoked; hence requireing the I/O
> helpers to be built in any case. Setting all callbacks in all
> drivers explicitly will allow to make the I/O helpers optional.
> This benefits systems that do not use these functions.
>
> Set the callbacks via macros. No functional changes.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Andy Walls <awalls@md.metrocast.net>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: linux-media@vger.kernel.org
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat


