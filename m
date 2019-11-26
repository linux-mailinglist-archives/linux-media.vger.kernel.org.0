Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 48C26109CA3
	for <lists+linux-media@lfdr.de>; Tue, 26 Nov 2019 11:54:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727938AbfKZKyy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Nov 2019 05:54:54 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:47056 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727919AbfKZKyx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Nov 2019 05:54:53 -0500
Received: by mail-wr1-f68.google.com with SMTP id z7so18436137wrl.13
        for <linux-media@vger.kernel.org>; Tue, 26 Nov 2019 02:54:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=0m2aIhtiBled0Rier5l0ndzlr2Gepz/S9qpk6DhIAfk=;
        b=H72nIzOOdIFUycAlN3KTFm1PNpG0WIxnp1c1QKmWXGSzn+l8m2zJZIpgqZHKTfnVj9
         uyZzc+y/gLUch5vBzIb7M6QjwwvnnSzOrafZIIlbde2z81m53lKsTWHMHiwfklNHcQPa
         XYAhPjnC8CEk68oBHqLXbplYwwhg/qjwJxoS4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=0m2aIhtiBled0Rier5l0ndzlr2Gepz/S9qpk6DhIAfk=;
        b=GSjIYF4tBzydi914aQcWJqufUgo4Y5EkqAX/Rh0VnfHyMLSHwboUeEFE6cFCD8uwgz
         C8Y/nK2FPkkmA4w1iy9rNiN2udfvCWMkKZr9nhpyAMg0FWwXXdWpEXm/CmrkAnl6Cd17
         4x0WW53+i2XsJP5VkYjk9fXe9VN6iHQWugM8hm8kXmJivB3o6cl9gNT4itf78L3YhG11
         HUjQRUv7lsRgbefPVLVioGEfZ53Uc+VvrbAgduBeXQZszIfQf9bUoCgFfhlrHozuAGQJ
         n9dlB+E0TohnZYBFquLcGpyiJvVXlPhBIA3A2zod+J3Idm8z28RUKe2yOlm3yRFRAAmr
         k4kg==
X-Gm-Message-State: APjAAAV+oSOGoXktKhTj9D6OyIoFAKmPE0PvK6iGxg2t1xvDt0jaTXBP
        cW0Mg7dlAJgZf2HjH3Y2YT9OL72uros=
X-Google-Smtp-Source: APXvYqw2gpCez7KPdk4MsgX35uNVq4zbeJB++ioWP7G+2byVIAVs0drRL1YXoZ9d5vA/Sb0+8pTpuA==
X-Received: by 2002:a5d:522e:: with SMTP id i14mr39752974wra.27.1574765691638;
        Tue, 26 Nov 2019 02:54:51 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net. [212.51.149.96])
        by smtp.gmail.com with ESMTPSA id w10sm2539028wmd.26.2019.11.26.02.54.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2019 02:54:50 -0800 (PST)
Date:   Tue, 26 Nov 2019 11:54:48 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     DRI Development <dri-devel@lists.freedesktop.org>
Cc:     Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH 15/15] dma-buf: Remove kernel map/unmap hooks
Message-ID: <20191126105448.GT29965@phenom.ffwll.local>
References: <20191118103536.17675-1-daniel.vetter@ffwll.ch>
 <20191118103536.17675-16-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191118103536.17675-16-daniel.vetter@ffwll.ch>
X-Operating-System: Linux phenom 5.3.0-2-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Nov 18, 2019 at 11:35:36AM +0100, Daniel Vetter wrote:
> All implementations are gone now.
> 
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: linux-media@vger.kernel.org
> Cc: linaro-mm-sig@lists.linaro.org

Applied the final two patches of this series now too.
-Daniel

> ---
>  include/linux/dma-buf.h | 25 -------------------------
>  1 file changed, 25 deletions(-)
> 
> diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
> index 7feb9c3805ae..abf5459a5b9d 100644
> --- a/include/linux/dma-buf.h
> +++ b/include/linux/dma-buf.h
> @@ -249,31 +249,6 @@ struct dma_buf_ops {
>  	 */
>  	int (*mmap)(struct dma_buf *, struct vm_area_struct *vma);
>  
> -	/**
> -	 * @map:
> -	 *
> -	 * Maps a page from the buffer into kernel address space. The page is
> -	 * specified by offset into the buffer in PAGE_SIZE units.
> -	 *
> -	 * This callback is optional.
> -	 *
> -	 * Returns:
> -	 *
> -	 * Virtual address pointer where requested page can be accessed. NULL
> -	 * on error or when this function is unimplemented by the exporter.
> -	 */
> -	void *(*map)(struct dma_buf *, unsigned long);
> -
> -	/**
> -	 * @unmap:
> -	 *
> -	 * Unmaps a page from the buffer. Page offset and address pointer should
> -	 * be the same as the one passed to and returned by matching call to map.
> -	 *
> -	 * This callback is optional.
> -	 */
> -	void (*unmap)(struct dma_buf *, unsigned long, void *);
> -
>  	void *(*vmap)(struct dma_buf *);
>  	void (*vunmap)(struct dma_buf *, void *vaddr);
>  };
> -- 
> 2.24.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
