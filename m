Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 384AA10A06B
	for <lists+linux-media@lfdr.de>; Tue, 26 Nov 2019 15:36:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727088AbfKZOgi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Nov 2019 09:36:38 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:35472 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726049AbfKZOgi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Nov 2019 09:36:38 -0500
Received: by mail-wr1-f67.google.com with SMTP id s5so22716062wrw.2
        for <linux-media@vger.kernel.org>; Tue, 26 Nov 2019 06:36:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=p00g6V9Bama/EwveZj3ADq9UrHHz6k97X5GwWWgTLik=;
        b=Ip2kAGO8rTjqdgbz2O4kGbl8LdkKyzbHFIySPm8ADDbhg8vxYr3ImVIhj1+1O2WJtx
         CTuP/vsDYXxJALiIgZf1UHWNa/Z8z+oA9H9QW70Tim+1+wLNu5NgCdFsiQXFLfnlXlqs
         zHnqfW/fB9fBUeJ8P2/oIhrVl+pUhVcXrxKh0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=p00g6V9Bama/EwveZj3ADq9UrHHz6k97X5GwWWgTLik=;
        b=k1gO9J3j6ilr7puwUCItykvyFj43yA7xfstaMNmkovYjqKYfeu3IB0s10DWP1BbwiH
         3YBAkGKdQMlhKjBpYdqYejRrJdFzEjhMSqVq/d9g2k9XA2AFEGvXBzZwEF6S3xzhD+OW
         jqRGO4RLcRbfCbLvtjfvQmTtqQ1eBXYFq4hXu36+26J1ObMVXSJMpIjOHOumkITOFHcP
         aOSQpWIBnchl+bOnkn+ZzT9iQOybuyVFiOEjjF2EoivfWnyxlCuknj6QXP9mkw6mg1bn
         VwNMKyM0WFu3im/4ii2lgD7kQ2Bwg2hLALYaCe0vfFALmQWAGlmCaifo1VST07vDgCld
         6J9Q==
X-Gm-Message-State: APjAAAWAfbPzcSbSd35FZXfrPFVyFEWGlp3YTzh+cSIT9MmoWeCuxcPP
        91XzXdH2+fsf61eX0znWP+kmHQ==
X-Google-Smtp-Source: APXvYqw8HQ/k4LCGgSsKbBNHYzWHkOmHPyD+okzuX1cbn03mpFVw5eQaubupR/Gs5k0rar/3fSLlDg==
X-Received: by 2002:adf:f103:: with SMTP id r3mr1153440wro.295.1574778996104;
        Tue, 26 Nov 2019 06:36:36 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net. [212.51.149.96])
        by smtp.gmail.com with ESMTPSA id f67sm3369469wme.16.2019.11.26.06.36.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2019 06:36:35 -0800 (PST)
Date:   Tue, 26 Nov 2019 15:36:33 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc:     dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        Daniel Vetter <daniel.vetter@intel.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH] udmabuf: Remove deleted map/unmap handlers.
Message-ID: <20191126143633.GX29965@phenom.ffwll.local>
References: <20191126142516.630200-1-maarten.lankhorst@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191126142516.630200-1-maarten.lankhorst@linux.intel.com>
X-Operating-System: Linux phenom 5.3.0-2-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Nov 26, 2019 at 03:25:16PM +0100, Maarten Lankhorst wrote:
> Commit 7f0de8d80816 ("dma-buf: Drop dma_buf_k(un)map") removed map/unmap
> handlers, but they still existed in udmabuf. Remove them there as well
> 
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Fixes: 7f0de8d80816 ("dma-buf: Drop dma_buf_k(un)map")
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: Daniel Vetter <daniel.vetter@intel.com>
> Cc: linux-media@vger.kernel.org
> Cc: linaro-mm-sig@lists.linaro.org
> Cc: dri-devel@lists.freedesktop.org

/me puts on brown paper bag

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/dma-buf/udmabuf.c | 16 ----------------
>  1 file changed, 16 deletions(-)
> 
> diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
> index 9635897458a0..9de539c1def4 100644
> --- a/drivers/dma-buf/udmabuf.c
> +++ b/drivers/dma-buf/udmabuf.c
> @@ -93,26 +93,10 @@ static void release_udmabuf(struct dma_buf *buf)
>  	kfree(ubuf);
>  }
>  
> -static void *kmap_udmabuf(struct dma_buf *buf, unsigned long page_num)
> -{
> -	struct udmabuf *ubuf = buf->priv;
> -	struct page *page = ubuf->pages[page_num];
> -
> -	return kmap(page);
> -}
> -
> -static void kunmap_udmabuf(struct dma_buf *buf, unsigned long page_num,
> -			   void *vaddr)
> -{
> -	kunmap(vaddr);
> -}
> -
>  static const struct dma_buf_ops udmabuf_ops = {
>  	.map_dma_buf	  = map_udmabuf,
>  	.unmap_dma_buf	  = unmap_udmabuf,
>  	.release	  = release_udmabuf,
> -	.map		  = kmap_udmabuf,
> -	.unmap		  = kunmap_udmabuf,
>  	.mmap		  = mmap_udmabuf,
>  };
>  
> -- 
> 2.24.0
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
