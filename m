Return-Path: <linux-media+bounces-30316-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 43E0FA8B4FD
	for <lists+linux-media@lfdr.de>; Wed, 16 Apr 2025 11:16:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BCF621902DD6
	for <lists+linux-media@lfdr.de>; Wed, 16 Apr 2025 09:16:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 559F71F4C99;
	Wed, 16 Apr 2025 09:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="ab8eFglI"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E421D22FF39
	for <linux-media@vger.kernel.org>; Wed, 16 Apr 2025 09:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744794958; cv=none; b=KdZpoI3KcGsIAj35T7+gP+zmMHRvxAYr9jMr7XkE8BX0EPuXfDZFXEfDcPafKv4COsvCbru6mzD74eYAHXdrmBHiHcppiU+V+dTbK5ocb8EyXPjsLLtCquXdwdSCXmzxtf4w/wggkeuTmQffw/HJaveujYMFBHr8sy+I7GjwZkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744794958; c=relaxed/simple;
	bh=1jHIOOPieLnRILd4lZy39O0DX2LnEwLbdwgkbhKbSfg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kdDG3ry5eFLX7JUIxdQCqj1vBf1ml7CSs21Gk5scfqJj8JE2GDa2jtG24uMy3X5mHqGTrp/A22QWzJPb0PwCpATTPhsjhaFS+i+1b1KeRy9p4UiPWl6qcSXwMFqEXlQYf/fyi6DMsv0jeePuaNU2NY+k7CQzKlDFPkfrpO2ylp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=ab8eFglI; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ac73723b2d5so1291817466b.3
        for <linux-media@vger.kernel.org>; Wed, 16 Apr 2025 02:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1744794955; x=1745399755; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IzhnoFqnW97ZWcB8cV008PI+qdwCPI2w8UehlUonwcU=;
        b=ab8eFglIxB4MP2kiYdFdgygnMqzEPLKV+sY81chamAebWUWtagv4Wrmn+qR9mPtYmO
         uYgbFO/YXNVteS1NZOKaL/qkCGnqZpg3w4PtzuYrBW+Ja+LFwineQAy6kwJOYCvTQ0xF
         RyF9igcUsgk+ijpMowOfUi2SObCkkdKddLVBA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744794955; x=1745399755;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IzhnoFqnW97ZWcB8cV008PI+qdwCPI2w8UehlUonwcU=;
        b=gfohF7Yf2Kjigsr1MzdtGJXGcWUvd6/390cW2jshCKmFQcQsM0ux0pwEh5Jb83j0MJ
         F1iZVPLoEJ1pOxfZnMa8H8zwrAkEKfVxJy2L4115qk/L86BCxCTLM/vQ2PlrxHldongL
         VFRGVh8I0ER0qHI5tONXMT4ukhXisj/0gsDOWbcLmbD4Cwc/5+XYC3PVI5Ie2WL+kWrH
         3Xx2t1MVfH5CkLf3rf8oz7JlnIxpFzd8eJkiRJtfFPjEqJX5usPkOoQAmhT7WTn57Lau
         OxeaJyRSaPED1t4un+X44nf9nyDYCbOkFPJeci5s1qR7YfFnoJlAcAY1xJn0gexE/ak8
         ES1g==
X-Forwarded-Encrypted: i=1; AJvYcCX4GgxlblB4JEWCvErVX8UaYNIaPNqSY7iw1gwY0k2ETea9iI3DJkgehrxXOveDY/uBqOTg5rosXky6wA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwOjILBt95rOH8oZAnW8IWVTBKSukZEDXwH1NrlfnM7JSvA7XLz
	9+kmr0EBCBNmU1p1LMm4wo6I/hyO8HGQyQisXqSXV8HFlkEJ5LFbQPe1MrKIWuE=
X-Gm-Gg: ASbGncsMmL7hJ2KJTq6NMxTDtWd2TNEy8pE+kxdB31gSwwpJsiqHf0z7VT6NPa17KU7
	O29mpL/M/4Jcr3lpBB+0fg6PECSuB9ijGezUEusTln9aHUQ64p3ln14VcA0i1N7RfSYQpjd3KVJ
	mfRAHPfqqfR3wGQ1OoCZcq47XFqeoH5f1Fu8PMqoiVB0JDwREvSWujCXYx5+nyyXU1Xbw54j2wF
	uUv5hoVBtwe0UVINE3G3H1PKLhUA+dGYBLPi65e2+uQZ2AOCiJmXSKfgZBNjylvdfC5x70F/n9T
	f2D8SWz34J8LScgX5vMxxT3afTPnLDpXYs4tnkqxH6rghFxL8P9Z
X-Google-Smtp-Source: AGHT+IE2LhmPOEWL2QBw0Z5wzYlEqe3D92PMKPrwDxClILzG2RD6atPvXiMciXmIdgmf/8PElhtnPw==
X-Received: by 2002:a17:907:7203:b0:ac3:413b:69c7 with SMTP id a640c23a62f3a-acb42b738b3mr82289066b.39.1744794954916;
        Wed, 16 Apr 2025 02:15:54 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb3cdda638sm92484666b.66.2025.04.16.02.15.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 02:15:54 -0700 (PDT)
Date: Wed, 16 Apr 2025 11:15:52 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: Simona Vetter <simona.vetter@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>, simona@ffwll.ch,
	airlied@gmail.com, asrivats@redhat.com, andyshrk@163.com,
	mripard@kernel.org, maarten.lankhorst@linux.intel.com,
	dri-devel@lists.freedesktop.org,
	Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH] drm/gem: Internally test import_attach for imported
 objects
Message-ID: <Z_91SGKoCbkC1k9R@phenom.ffwll.local>
References: <20250415092057.63172-1-tzimmermann@suse.de>
 <e2e82102-eb9f-4eb6-8ac3-6122ed7fcf28@amd.com>
 <48ab9b82-0d26-4d7c-88b0-feab9762b128@suse.de>
 <b924ffa7-99c0-42f1-9170-069e92299021@amd.com>
 <ddb93e8d-7716-47b3-b06c-0bf862d9c32b@suse.de>
 <ac0aba3d-ec77-4f6b-9ac1-f6077519f30d@amd.com>
 <Z_5a3ckZiY-fINNW@phenom.ffwll.local>
 <5a1b160f-0ea4-4c31-b777-b8ab81b6c394@amd.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5a1b160f-0ea4-4c31-b777-b8ab81b6c394@amd.com>
X-Operating-System: Linux phenom 6.12.17-amd64 

On Tue, Apr 15, 2025 at 03:57:11PM +0200, Christian König wrote:
> Am 15.04.25 um 15:10 schrieb Simona Vetter:
> >> This is for devices who only want to do a vmap of the buffer, isn't it?
> > ... it's for the vmap only case, where you might not even have a struct
> > device. Or definitely not a reasonable one, like maybe a faux_bus device
> > or some device on a bus that really doesn't do dma (e.g. spi or i2c), and
> > where hence dma_buf_map_attachment is just something you never ever want
> > to do.
> 
> Even in that case I would still suggest to at least create an attachment to let the exporter know that somebody is doing something with it's buffer.
> 
> That is also important for move notification since you can't do those without an attachment.
> 
> BTW: What is keeping a vmap alive after dropping the reservation lock? There is no pinning whatsoever as far as I can see.

dma_buf_vmap should also pin, or something will go wrong very badly. And
that also can tell the exporter what exactly the buffer is used for
(kernel cpu access). I really don't think we should mix that up with
device access as a dma_buf_attachment.
-Sima

> 
> > I think we might want to transform obj->import_attach into a union or
> > tagged pointer or something like that, which can cover both cases. And
> > maybe a drm_gem_bo_imported_dma_buf() helper that gives you the dma_buf no
> > matter what if it's imported, or NULL if it's allocated on that
> > drm_device?
> 
> Yeah, I had the same idea before as well. Just didn't know if that was something worth looking into.
> 
> Regards,
> Christian.
> 
> >
> > Cheers, Sima

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

