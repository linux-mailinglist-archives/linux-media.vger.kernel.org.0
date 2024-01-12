Return-Path: <linux-media+bounces-3646-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B949182C06B
	for <lists+linux-media@lfdr.de>; Fri, 12 Jan 2024 14:05:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C0A001C21A9E
	for <lists+linux-media@lfdr.de>; Fri, 12 Jan 2024 13:05:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 616316BB4E;
	Fri, 12 Jan 2024 13:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="QE71sB4R"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6805C5EE9D
	for <linux-media@vger.kernel.org>; Fri, 12 Jan 2024 13:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a28f12a12e5so186043166b.0
        for <linux-media@vger.kernel.org>; Fri, 12 Jan 2024 05:05:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1705064704; x=1705669504; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vAbZchzI0iGmOu/a8rn2udlF7BOKYbAuYwZzGRVm3BU=;
        b=QE71sB4RJERL0Ay0Ag1hgcz2N5lqJJw4T4UF4KmtUF2evhZdTLw/dXZbPtg/W2RpnW
         C/HfQSB+wEV/eMXnIxfXOTElk6au68pdzcYBUQeZTRslrAakLmLOBOd+ZGafZrH+RvrV
         7klPbIOCmfocPEfO9fM9OQCgMeryHPqBB40rc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705064704; x=1705669504;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vAbZchzI0iGmOu/a8rn2udlF7BOKYbAuYwZzGRVm3BU=;
        b=dRowWCqSUZwUKuGKAPAbKX+HBCGfpiVmI0dcF0rwTeYeZtbm+3Sv35mKHrSf1t6Dz+
         7Z4Wts4fBi/iU76J0PicUN3PZKdgo8FR2auJoDqorKqTV82OKZL7r6HQlxwjcXk6aaJN
         lLMUCgA0BksfSwVPZ1JyxqGVB0SqMEBANlYPuSwQdABRMJMycuYvLKmgZzHpF5PnJ3c1
         w7mGBztKZWOdqlPEuDNYs7or+P5OdJhDfSNMlK4TRS/JmbAyMao3+AexqZha+7kNAx1A
         k9HJPffGOjCLFTg3SrMFuuJx1ecqLIGnxuFSz2Kt0B100Wuhi4l4DCzeembBh0PLA4Ea
         QX4A==
X-Gm-Message-State: AOJu0Yx9digVfhg5z6ETNVSnhFdsa5KSzPn9UJYwDrXs8v99vLul1K5F
	Yx8iUu8kywfIxj7qBDsXHhToUufN4cG1dmGhncneqZmtAf4=
X-Google-Smtp-Source: AGHT+IFtm6FukgWCJmvMOWGIQAQ4rW/HJgSEIzEjtdiyxsAnvXu1fGEvnNuGMsdglBVovqejvpW9Xg==
X-Received: by 2002:a17:907:720e:b0:a2b:d12c:ee42 with SMTP id dr14-20020a170907720e00b00a2bd12cee42mr1179501ejc.0.1705064704572;
        Fri, 12 Jan 2024 05:05:04 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id z19-20020a1709060ad300b00a2687065e28sm1761878ejf.45.2024.01.12.05.05.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jan 2024 05:05:04 -0800 (PST)
Date: Fri, 12 Jan 2024 14:05:02 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: dri-devel@lists.freedesktop.org, patches@lists.linux.dev,
	Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	linaro-mm-sig@lists.linaro.org
Subject: Re: [Linaro-mm-sig] [PATCH] dma-buf/dma-resv: fix spelling
Message-ID: <ZaE4_l8PzXx9Isjp@phenom.ffwll.local>
References: <20240111041202.32011-1-rdunlap@infradead.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240111041202.32011-1-rdunlap@infradead.org>
X-Operating-System: Linux phenom 6.5.0-4-amd64 

On Wed, Jan 10, 2024 at 08:11:55PM -0800, Randy Dunlap wrote:
> Fix spelling mistakes as reported by codespell.
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: linux-media@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: Christian König <christian.koenig@amd.com>
> Cc: linaro-mm-sig@lists.linaro.org

Both dma-buf spell fixes applied to drm-misc-next, thanks!
-Sima
> ---
>  drivers/dma-buf/dma-resv.c |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff -- a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
> --- a/drivers/dma-buf/dma-resv.c
> +++ b/drivers/dma-buf/dma-resv.c
> @@ -405,7 +405,7 @@ static void dma_resv_iter_walk_unlocked(
>   *
>   * Beware that the iterator can be restarted.  Code which accumulates statistics
>   * or similar needs to check for this with dma_resv_iter_is_restarted(). For
> - * this reason prefer the locked dma_resv_iter_first() whenver possible.
> + * this reason prefer the locked dma_resv_iter_first() whenever possible.
>   *
>   * Returns the first fence from an unlocked dma_resv obj.
>   */
> @@ -428,7 +428,7 @@ EXPORT_SYMBOL(dma_resv_iter_first_unlock
>   *
>   * Beware that the iterator can be restarted.  Code which accumulates statistics
>   * or similar needs to check for this with dma_resv_iter_is_restarted(). For
> - * this reason prefer the locked dma_resv_iter_next() whenver possible.
> + * this reason prefer the locked dma_resv_iter_next() whenever possible.
>   *
>   * Returns the next fence from an unlocked dma_resv obj.
>   */
> _______________________________________________
> Linaro-mm-sig mailing list -- linaro-mm-sig@lists.linaro.org
> To unsubscribe send an email to linaro-mm-sig-leave@lists.linaro.org

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

