Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5BACEE01BF
	for <lists+linux-media@lfdr.de>; Tue, 22 Oct 2019 12:13:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731732AbfJVKNw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Oct 2019 06:13:52 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:36809 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729567AbfJVKNw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Oct 2019 06:13:52 -0400
Received: by mail-wr1-f68.google.com with SMTP id w18so16829990wrt.3
        for <linux-media@vger.kernel.org>; Tue, 22 Oct 2019 03:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=pK9/rY/JZgPtRY4Q4j81Qucr1STrAEbOo1Ua7jFI9zM=;
        b=LGjnViclLbVNZGFF0p/oLHPt94cTigJ/L5fMYnxWxXyMQCNoVZSmcGE9LL1m5oAsCX
         r8MRhpUvvy5RnWhHlSkmqlArjjq8RNll8e0slVKF/Eey7fufF6ppKFcm5oQ7z5WuCbk6
         0N3VWtIxIV+7uxjOvyHvyk4/lx4OW0Zx/SqnA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to:user-agent;
        bh=pK9/rY/JZgPtRY4Q4j81Qucr1STrAEbOo1Ua7jFI9zM=;
        b=kqz+egOb+5rU7WULNDKc46IiX0of9UH1bm39VJSuw7PDl/qV30jdMIY+DEhzjaNTLE
         pQLp4EelFy4dIDQ5cxVPyQ48/Ao+iT+ZDif9LLQFrnUc7AayRJuOJ48S5VfWqK0X3qgq
         eGsSO9P4HM+3pO6zTrr7feSJ2FlHzm1iUQXt11esXdp1Wg6GcOTLRzwXzu02lQ+05OX/
         52skV6Xzzqvptt/wVRehCqE5jAQEgbevESwZVciUfXmyC8a5ELBD1ByOyCcH0a7HdHEs
         +GC3OLFw0nWPAlHxQ/vnV2cl+pKSAAxImsSn7W1CqNcR75Y6hG2Qk9kkFCbv/s7PO8ew
         uzEg==
X-Gm-Message-State: APjAAAVtece12wd5cm3EwI7/DTefBDtbViCwyYvA2YDHFEXESqDN3+FV
        NjannWgBsaK0LUG38PD4YEBCSg==
X-Google-Smtp-Source: APXvYqw6ghqyuE8x3VkynzKoxx3WrxUDpro08Ye4Q9v5HIS3EGVk6GwJaisS9N/lXuI15PCZStok+g==
X-Received: by 2002:a5d:54c7:: with SMTP id x7mr2005783wrv.99.1571739230027;
        Tue, 22 Oct 2019 03:13:50 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net. [212.51.149.96])
        by smtp.gmail.com with ESMTPSA id t13sm24712080wra.70.2019.10.22.03.13.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2019 03:13:49 -0700 (PDT)
Date:   Tue, 22 Oct 2019 12:13:47 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Christian =?iso-8859-1?Q?K=F6nig?= 
        <ckoenig.leichtzumerken@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, sumit.semwal@linaro.org,
        linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org,
        intel-gfx@lists.freedesktop.org, daniel@ffwll.ch
Subject: Re: [PATCH 2/4] dma-buf: stop using the dmabuf->lock so much
Message-ID: <20191022101347.GJ11828@phenom.ffwll.local>
References: <20191021111524.14793-1-christian.koenig@amd.com>
 <20191021111524.14793-2-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191021111524.14793-2-christian.koenig@amd.com>
X-Operating-System: Linux phenom 5.2.0-2-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Oct 21, 2019 at 01:15:22PM +0200, Christian König wrote:
> The attachment list is now protected by the dma_resv object.
> So we can drop holding this lock to allow concurrent attach
> and detach operations.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>  drivers/dma-buf/dma-buf.c | 16 ----------------
>  1 file changed, 16 deletions(-)
> 
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index 753be84b5fd6..c736e67ae1a1 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -685,8 +685,6 @@ dma_buf_dynamic_attach(struct dma_buf *dmabuf, struct device *dev,
>  	attach->dmabuf = dmabuf;
>  	attach->dynamic_mapping = dynamic_mapping;
>  
> -	mutex_lock(&dmabuf->lock);
> -
>  	if (dmabuf->ops->attach) {
>  		ret = dmabuf->ops->attach(dmabuf, attach);
>  		if (ret)
> @@ -696,8 +694,6 @@ dma_buf_dynamic_attach(struct dma_buf *dmabuf, struct device *dev,
>  	list_add(&attach->node, &dmabuf->attachments);
>  	dma_resv_unlock(dmabuf->resv);
>  
> -	mutex_unlock(&dmabuf->lock);

This changes the rules, now ->attach/->detach and the list manipulation
aren't done under the same lock anymore. I don't think this matters, but
imo good to mention in the commit message.

> -
>  	/* When either the importer or the exporter can't handle dynamic
>  	 * mappings we cache the mapping here to avoid issues with the
>  	 * reservation object lock.
> @@ -726,7 +722,6 @@ dma_buf_dynamic_attach(struct dma_buf *dmabuf, struct device *dev,
>  
>  err_attach:
>  	kfree(attach);
> -	mutex_unlock(&dmabuf->lock);
>  	return ERR_PTR(ret);
>  
>  err_unlock:
> @@ -776,14 +771,12 @@ void dma_buf_detach(struct dma_buf *dmabuf, struct dma_buf_attachment *attach)
>  			dma_resv_unlock(attach->dmabuf->resv);
>  	}
>  
> -	mutex_lock(&dmabuf->lock);
>  	dma_resv_lock(dmabuf->resv, NULL);
>  	list_del(&attach->node);
>  	dma_resv_unlock(dmabuf->resv);
>  	if (dmabuf->ops->detach)
>  		dmabuf->ops->detach(dmabuf, attach);
>  
> -	mutex_unlock(&dmabuf->lock);
>  	kfree(attach);
>  }
>  EXPORT_SYMBOL_GPL(dma_buf_detach);
> @@ -1247,14 +1240,6 @@ static int dma_buf_debug_show(struct seq_file *s, void *unused)
>  		   "size", "flags", "mode", "count", "ino");
>  
>  	list_for_each_entry(buf_obj, &db_list.head, list_node) {
> -		ret = mutex_lock_interruptible(&buf_obj->lock);
> -
> -		if (ret) {
> -			seq_puts(s,
> -				 "\tERROR locking buffer object: skipping\n");
> -			continue;
> -		}
> -

This will mildly conflict with the revised version of patch 1 (since the
dma_resv_lock needs to be here).

With both nits addressed:

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

>  		seq_printf(s, "%08zu\t%08x\t%08x\t%08ld\t%s\t%08lu\t%s\n",
>  				buf_obj->size,
>  				buf_obj->file->f_flags, buf_obj->file->f_mode,
> @@ -1307,7 +1292,6 @@ static int dma_buf_debug_show(struct seq_file *s, void *unused)
>  
>  		count++;
>  		size += buf_obj->size;
> -		mutex_unlock(&buf_obj->lock);
>  	}
>  
>  	seq_printf(s, "\nTotal %d objects, %zu bytes\n", count, size);
> -- 
> 2.17.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
