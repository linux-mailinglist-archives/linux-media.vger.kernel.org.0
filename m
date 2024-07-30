Return-Path: <linux-media+bounces-15549-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 20CCD940C67
	for <lists+linux-media@lfdr.de>; Tue, 30 Jul 2024 10:56:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B0123B28C7F
	for <lists+linux-media@lfdr.de>; Tue, 30 Jul 2024 08:56:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE096193084;
	Tue, 30 Jul 2024 08:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="ed3Fpw9x"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5CF01922C1
	for <linux-media@vger.kernel.org>; Tue, 30 Jul 2024 08:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722329797; cv=none; b=RggXi6U27Jhw+Nfz3DxzilSEugtxxvowsLNGHvjq4nBlDhseJgmb622y9qrKlkU1irvZXMLodnP1AO/3P/oou/aGObgQjAdZLZWIPxSrx9RwHSTDgIPMs6E5URU6tfPASVhDi0tKr4zLHv5AF+m9l2UNflK5D6P6TH2Y2JUkTMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722329797; c=relaxed/simple;
	bh=WNHEC9BtnjIe6KLwcXkm0yvicK8UGyiSQ2HxvUk5PR4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KpjSp7TVF3i9idHZEUN625BhCwkVjhNZXGiC8xGjMXiCn1D7P3iBJB41eWP2BStiPvs6Qw1Cy9IreLc0d2PRpSnAHH1FbInMXddj136Ouyl/qyuJOLC9mKuPK8dcQr2hkSqqGqHw0FR6gxNjPeTVg2wxwbMIl+plMS/XaMEbKuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=ed3Fpw9x; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-368633ca4ffso450084f8f.0
        for <linux-media@vger.kernel.org>; Tue, 30 Jul 2024 01:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1722329794; x=1722934594; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WgtHQjzcSzhXJxDV9mdj343ETcHxolzhEYRr9t1Zx5Q=;
        b=ed3Fpw9xUqguqmpLVNWMmlewhJVoAg32RidI+mb68i9BDLA56F55EOj1FWLakSP90K
         5mli1L3xd03HdpqPWanZNI8xePg+8E/CtDBjnty1y39++wC0ei4+MOz9I320rG8Hbs3C
         85N6pa+k/hjA4c/W9CttiBN7LPn8+L1Bl8JYA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722329794; x=1722934594;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WgtHQjzcSzhXJxDV9mdj343ETcHxolzhEYRr9t1Zx5Q=;
        b=kvRUfYs0pcJhyHs3xAukQRjsfvah3t8kZ9SLB82za7e6eLIYZs4H9nGdCk1Gz3qIfy
         H7U7p6J89FK/YtYjf/Y0kF+ODUdM66Ud4qmQs1yJj3meSY1/RlKNVH43aJRacHHIBvjS
         czZQZ9xnoeg71cTtn5U4v1NwWMuciC63MGh7NZawhszvT3aKjGdhkqBdtTVv2M3ME24X
         QCqgRH5oFSVKmDzgFhS8jeTPxdGXJkUqNNvy9xk4rWFTN1posesZkJKIh0N5sxcYL9G5
         26NZTJkjB507dfW9hBwlrrllKJSvNe/EeadeNNyxKLdqULc/ZLvZI9AvhV3DAPUaHtWd
         A3Fw==
X-Forwarded-Encrypted: i=1; AJvYcCW94a9x/1PXuaRybutTThVAvGAvCQlAEkz1KNBAfuKddcetCaOrn7UMi6PkhoiiXr7sW9xv4/IZ8Zr1AQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxiutrEwr/ceT7qZevq1G8JROAXHHSv+dBghRgD2/80LeSAygGZ
	0TQsmS92zw0CThThxEFuH4k38U1XxtTt2DCeEn9q7IJoxYgV3h7OX4c+3Jb5dn4=
X-Google-Smtp-Source: AGHT+IHIY4OWsp+8at+vnJLgPPIkNjmZcLBJITV+uKHf3I0BGxZGznhKnrOaDTRFuZSQOzI7tUwvqA==
X-Received: by 2002:a5d:5f53:0:b0:368:aa2:2b4e with SMTP id ffacd0b85a97d-36b34d23accmr6470380f8f.4.1722329794226;
        Tue, 30 Jul 2024 01:56:34 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36b367c028bsm14070438f8f.24.2024.07.30.01.56.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jul 2024 01:56:33 -0700 (PDT)
Date: Tue, 30 Jul 2024 10:56:31 +0200
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Huan Yang <link@vivo.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>,
	"T.J. Mercier" <tjmercier@google.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
	opensource.kernel@vivo.com
Subject: Re: [PATCH v2 0/5] Introduce DMA_HEAP_ALLOC_AND_READ_FILE heap flag
Message-ID: <Zqiqv7fomIp1IPS_@phenom.ffwll.local>
Mail-Followup-To: Huan Yang <link@vivo.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>,
	"T.J. Mercier" <tjmercier@google.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
	opensource.kernel@vivo.com
References: <20240730075755.10941-1-link@vivo.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240730075755.10941-1-link@vivo.com>
X-Operating-System: Linux phenom 6.9.7-amd64 

On Tue, Jul 30, 2024 at 03:57:44PM +0800, Huan Yang wrote:
> UDMA-BUF step:
>   1. memfd_create
>   2. open file(buffer/direct)
>   3. udmabuf create
>   4. mmap memfd
>   5. read file into memfd vaddr

Yeah this is really slow and the worst way to do it. You absolutely want
to start _all_ the io before you start creating the dma-buf, ideally with
everything running in parallel. But just starting the direct I/O with
async and then creating the umdabuf should be a lot faster and avoid
needlessly serialization operations.

The other issue is that the mmap has some overhead, but might not be too
bad.
-Sima
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

