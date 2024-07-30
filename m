Return-Path: <linux-media+bounces-15545-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 64494940BE3
	for <lists+linux-media@lfdr.de>; Tue, 30 Jul 2024 10:40:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 95B201C21225
	for <lists+linux-media@lfdr.de>; Tue, 30 Jul 2024 08:40:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5A431922DF;
	Tue, 30 Jul 2024 08:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="XelrdWHH"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0296192B77
	for <linux-media@vger.kernel.org>; Tue, 30 Jul 2024 08:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722328786; cv=none; b=U+SHDrqOlyaCuTsD/iHu7V62km4Ah2BhwrnAof6p+a0SFl/oedqAn5vq0ZdKvZVEKA8KObeQ/3qwJrh0QIw50yPpuVu5/wEFKd4lysTQu/4rionWIUII2Fcefqyz4sIFqqXOnJxIYSi5htQPymi4OLBnym7dvs8dGq9uL++EYjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722328786; c=relaxed/simple;
	bh=kTu9doBZt17ufnEj4X2OBn7FIA74WVGbMzi0N6M0EMc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uyx6TfZKC8yFIL76ex3gtrCDDnh9bwx3QbI+oHLWzegjcZ4h5z1lqbgTZI3mR43W/mXB96z7Yv1KGENu2utrauqcxc7n8SFwPrzMAxufRf5HKPoE88mDfHXTMIFZjaPDwTjK6e+hGJ7reyuJltcEnPkMRptfOUyDOEcKtmLnBNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=XelrdWHH; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4280ac10b7cso496545e9.3
        for <linux-media@vger.kernel.org>; Tue, 30 Jul 2024 01:39:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1722328782; x=1722933582; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mMbXMLPxdHgp8aCQRIwbUSynHwaJsa3HFc5CrwRM3iA=;
        b=XelrdWHH+uYvNHKjZ3MM+99XQNv15LjimBh/N1wgnqqsX51on9OjdL6SFX3ZSR0H04
         g3KmBZ2y7yjuMuhCzpO8V304Vg0XHfuMMSn2bM+x84aUnVZxrtYZQ8lxK28R4nBoEg5b
         ytfoSarRSMErLaubvDEl47NzkKO9inUyUgWtM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722328782; x=1722933582;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mMbXMLPxdHgp8aCQRIwbUSynHwaJsa3HFc5CrwRM3iA=;
        b=uLhBMT0jhfkLJkDYXdHEZxVHH0ydNuqHCcuO6ap1z8CL0yMvHGLTRcKbLZbUN0PP2W
         CgU76iDt8YjsucSWpkm5cC7RRpAC1hiyMDMEi4/nMCsfwtxW+RwULSY97wAN5syJj2I1
         jr3Fq9dZv5kFeupY8SOapM35AdcHyeN38LC1h85gavalLtdpAvVc2lsnZYyf0GLEE/Hy
         w00cmVpMDZIa4S77lcMY4bU2spXkiDm8qYD2lr4mICW/VKN/3VxEI4aSkq6zK0tjf3ky
         TM4gEtUcxszRVU0QGq7q2fQ4prX681WRDmEWcbHtiROaKFuU+rl206AwP+MBan1YA8jV
         j2jg==
X-Gm-Message-State: AOJu0YzZzZim09UN8BuDM4OtO3cRs/8VBURSQ6QpZBmE9FIgEvxNJp+E
	gIC7G+b5o4JuMMbAQlo//pPutUHVcucy4tzP1kuv1ZRKGfjz1CeiEh+p/Gm4wqA=
X-Google-Smtp-Source: AGHT+IGdFjY0cCQvq3hH977T/VIttQHVhMME0vlMsCLSRfvyDCHXoJ2M6IjFVm/zP4wBbIdXQrKJMQ==
X-Received: by 2002:a05:600c:1387:b0:426:6fc0:5910 with SMTP id 5b1f17b1804b1-428054feb50mr74046665e9.1.1722328782058;
        Tue, 30 Jul 2024 01:39:42 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4281a5d10acsm79712725e9.24.2024.07.30.01.39.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jul 2024 01:39:41 -0700 (PDT)
Date: Tue, 30 Jul 2024 10:39:39 +0200
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Zenghui Yu <yuzenghui@huawei.com>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org, sumit.semwal@linaro.org,
	benjamin.gaignard@collabora.com, Brian.Starkey@arm.com,
	jstultz@google.com, tjmercier@google.com, shuah@kernel.org,
	daniel.vetter@ffwll.ch, wanghaibin.wang@huawei.com
Subject: Re: [PATCH] MAINTAINERS: Add selftests to DMA-BUF HEAPS FRAMEWORK
 entry
Message-ID: <Zqimyx_jEi5ne6GB@phenom.ffwll.local>
Mail-Followup-To: Zenghui Yu <yuzenghui@huawei.com>,
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org, sumit.semwal@linaro.org,
	benjamin.gaignard@collabora.com, Brian.Starkey@arm.com,
	jstultz@google.com, tjmercier@google.com, shuah@kernel.org,
	wanghaibin.wang@huawei.com
References: <20240729081202.937-1-yuzenghui@huawei.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240729081202.937-1-yuzenghui@huawei.com>
X-Operating-System: Linux phenom 6.9.7-amd64 

On Mon, Jul 29, 2024 at 04:12:02PM +0800, Zenghui Yu wrote:
> Include dmabuf-heaps selftests in the correct entry so that updates to it
> can be sent to the right place.
> 
> Signed-off-by: Zenghui Yu <yuzenghui@huawei.com>

Applied to drm-misc-next, thanks for your patch.
-Sima

> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 42decde38320..b7f24c9fb0e2 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -6660,6 +6660,7 @@ F:	drivers/dma-buf/dma-heap.c
>  F:	drivers/dma-buf/heaps/*
>  F:	include/linux/dma-heap.h
>  F:	include/uapi/linux/dma-heap.h
> +F:	tools/testing/selftests/dmabuf-heaps/
>  
>  DMC FREQUENCY DRIVER FOR SAMSUNG EXYNOS5422
>  M:	Lukasz Luba <lukasz.luba@arm.com>
> -- 
> 2.33.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

