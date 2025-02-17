Return-Path: <linux-media+bounces-26224-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D2B9A388D2
	for <lists+linux-media@lfdr.de>; Mon, 17 Feb 2025 17:09:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3895E166D15
	for <lists+linux-media@lfdr.de>; Mon, 17 Feb 2025 16:03:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E7E7225404;
	Mon, 17 Feb 2025 16:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="DVyNJSKa"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF02F2248B4
	for <linux-media@vger.kernel.org>; Mon, 17 Feb 2025 16:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739808161; cv=none; b=ofXap8qGi84XS1rLjylUZuTEWYxNyew6mXXVLWRJ4kWRrgWrE5QFzgqKY7NOhQbUMs0nx0wbuP6+ukwAN2UPceTXrJ9q07kXnz3hWwyTLnpK71K+Q2xZX6YAbkPa0fA5D2I/ucmgJUlrTTFTiiAzQTbu9dzEtzxH450X3djn1DY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739808161; c=relaxed/simple;
	bh=/3Qp84YbWUafghDw2nrA7UlUdWsylk9smJ3CGsp5eoo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L5IHxkcM5F6Vw/hP8K4D0TWoXm93WsAUfKXwhx6kRw9giUUjPJU2S93g+QyC/DgMW7uD9vR7F7BL1x0rxN8cEqZB+k0+b+t8A8+OSxZstXaCisnriyRV42UCxjgSe8m4sztI7yS3Yg3uxt68CsKEIFAafgHzO40QZt9gIdQSxiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=DVyNJSKa; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43984e9cc90so6220055e9.1
        for <linux-media@vger.kernel.org>; Mon, 17 Feb 2025 08:02:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1739808158; x=1740412958; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=43jaqScBOTTKMVVM/pAEA4ORlDlz298tH89aK7G/qzQ=;
        b=DVyNJSKaUPBbNlm8QECV3cLuv2mObwjMLZ+O5Akr+ytrXz9coZPTjr4nc4X6Kst7dJ
         2Ha7eMhFY1AZx60hkSE1wENBfI0OJsC3QFllqBEoWYpTVVeiP4gJNvNYDrpqeI6Ho9G8
         0vmuzFPKQUuJV6ArXaZniX6RBCFM/p8X/YeIM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739808158; x=1740412958;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=43jaqScBOTTKMVVM/pAEA4ORlDlz298tH89aK7G/qzQ=;
        b=kqS4e+2H75TAh5LifhJC5AERGpyPc8CaLVUiZLzke35Ekr9s5jcLIMQvvPUxEBM5ae
         mph24kD5D9dO/ZNd+1LQ+F28Xny4CRhidzgXc/iK1yyniWbfp7shFcykpl01VaRQ/vWg
         /fyIXP0XBMbbaBJ2etZMaKvsTIIg1suUQXC2kJ/pwZPe8cu1GNmvaUhHVXgAETrogPsA
         b6RuxV3Yd41hLBUpQK2yab2aDTOSQmdzfSAe6CVvnc5hlfP0EcBFdNhbfN/J8lltkQ5D
         Kgtir0ezuXSlZftnpilmNQYLsJsbnn5Fo84ac9pDmTosCfLVLLyIyQ5w6NHfwPxR1TDW
         8kOQ==
X-Forwarded-Encrypted: i=1; AJvYcCVPgqY36qtJc3xR8kis6r9FJYQZoDxym7KXO91+ocaKw9lUmbVuBIZAXAQuGI4dMkE+pfF6J1XJXExA6g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzbXq4+E5LgBRjoh7k7Oi5R14XAgAoNEqHiH8ixePZneQoNbgU6
	jtpMB3Iryel9cGd9v8xkdjOahK4MC7KtttPZUiSogWe8PdMaRCYrhbShyAYgjUyDYBsnrlMP4QW
	W
X-Gm-Gg: ASbGncte3zGmOEeHyBrJh+cbppRjqP9JLj5zeOXy8NxwI9kHRsuoAPQ7RljC7YaUeN1
	OI+RHqt8KcZIcTi3gqHi9Uo9yZpzVipFFgVWL9eQTuTNiyOiuZXUwH+SZFXBDoR6WH30UtxIZFW
	6D7t0UZNUPPbYnjkX/6M3MGtqnN64ZW560kC+bvQcNAa8mZH9laq4EH8wY+zePYndsGnsvJ9u39
	lR0vBgtyEfSDwJnBIcn0mp6gQP9S5lMs6+/yw2c3uRzJUwOc/Ei/vSLc4juilco+v7eWH6Q1988
	OJ6nzYw7l3NKKljVkXZ+a/fmbls=
X-Google-Smtp-Source: AGHT+IE8p/f7NWuxULy0RX/iH0m4yLEHHpOnki67v1mwiYaFNEagW21xEE3gux9AX/k9Qh9uiKXEuw==
X-Received: by 2002:a5d:5f4e:0:b0:38f:2a99:b8e with SMTP id ffacd0b85a97d-38f339d85femr9481489f8f.4.1739808157513;
        Mon, 17 Feb 2025 08:02:37 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f25a0fa1esm12476884f8f.100.2025.02.17.08.02.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 08:02:36 -0800 (PST)
Date: Mon, 17 Feb 2025 17:02:34 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc: sumit.semwal@linaro.org, tzimmermann@suse.de, simona@ffwll.ch,
	dmitry.osipenko@collabora.com, tvrtko.ursulin@igalia.com,
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH 1/4] dma-buf: fix incorrect dma-fence documentation
Message-ID: <Z7NdmkEPYRhYi0Ax@phenom.ffwll.local>
References: <20250211163109.12200-1-christian.koenig@amd.com>
 <20250211163109.12200-2-christian.koenig@amd.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250211163109.12200-2-christian.koenig@amd.com>
X-Operating-System: Linux phenom 6.12.11-amd64 

On Tue, Feb 11, 2025 at 05:31:06PM +0100, Christian König wrote:
> There isn't much worse than documentation giving an incorrect advise.
> Grabbing a spinlock while interrupts are disabled usually means that you
> must also disable interrupts for all other uses of this spinlock.
> 
> Otherwise really hard to debug issues can occur. So fix that invalid
> documentation.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>

Oops :-/

Reviewed-by: Simona Vetter <simona.vetter@ffwll.ch>

> ---
>  include/linux/dma-fence.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
> index e7ad819962e3..e230af0d123f 100644
> --- a/include/linux/dma-fence.h
> +++ b/include/linux/dma-fence.h
> @@ -169,8 +169,8 @@ struct dma_fence_ops {
>  	 * implementation know that there is another driver waiting on the
>  	 * signal (ie. hw->sw case).
>  	 *
> -	 * This function can be called from atomic context, but not
> -	 * from irq context, so normal spinlocks can be used.
> +	 * This is called with irq's disabled, so only spinlocks which also
> +	 * disable irq's can be used.
>  	 *
>  	 * A return value of false indicates the fence already passed,
>  	 * or some failure occurred that made it impossible to enable
> -- 
> 2.34.1
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

