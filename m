Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 994165AF4B2
	for <lists+linux-media@lfdr.de>; Tue,  6 Sep 2022 21:47:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229616AbiIFTrD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Sep 2022 15:47:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229609AbiIFTrA (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 6 Sep 2022 15:47:00 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 179D280EB7
        for <linux-media@vger.kernel.org>; Tue,  6 Sep 2022 12:46:52 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id az27so17009409wrb.6
        for <linux-media@vger.kernel.org>; Tue, 06 Sep 2022 12:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date;
        bh=bqv4iAd1mha/jCj0gsDylHCagZEixO6XwXeJh7bhmjc=;
        b=NOyba92itqhhR/PpT3mpwNTiRuKPnJapzGo69+6nqHs39ugWnmJIcQdoc8PxAppiEe
         Nhqo0BS1I2PQjWxAv660Zg3oA2AeRIsQXadSeWz8/QN+hKxVKwerxPyju8jl7Tf1WzGl
         cAlMn1PiLddYyVHh0KGDxNdvkyeMTC7j4JKXE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date;
        bh=bqv4iAd1mha/jCj0gsDylHCagZEixO6XwXeJh7bhmjc=;
        b=iyi/4+iiul5cggugSOqp7rb8CVxGrjliKm/0kWj3viAkhWhRkME/FNbVAEqyaCstIn
         Z++gIYy+5PJbfaKp8YoOk4hpuL0KI60PWWk/Id2KHsAY1oS1P2IFKjTRx2HPFvH9vmJ0
         itPc81k9N8Ey8LUo3RVsnkTZzCYAG3LEqcQ8/UaZJNKo7k3wDF/zw9+0VrtGQUAH+7s+
         kOfajxU+xU8uJb0qAQTYztA5a5IeFeVNua/skqG4x50LgEklF0hBg/ZgxQl2lUCDIqeX
         wxUQgORIVq1hVOU6wKT63hZMSZNogPStZM/2q0rQ/pPGUsnTwPZrIUf4+BL0+lH4tkmC
         x2uQ==
X-Gm-Message-State: ACgBeo0Hi0uxTIXDE152Ao0iYgTbDDKoa1GpvvJCY32geLvLC+vE37lh
        QnAF++yNHdfxV+xk/nRXrgWWWA==
X-Google-Smtp-Source: AA6agR6T7vwwOwFPSx9Y+6VkmPyGEeXPD3TVawQvk4BRuNrP/PJ8qNADqn/aJdfgkNiIYFdT3OynxQ==
X-Received: by 2002:a5d:5a06:0:b0:226:d25e:b4ee with SMTP id bq6-20020a5d5a06000000b00226d25eb4eemr47055wrb.280.1662493610556;
        Tue, 06 Sep 2022 12:46:50 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net. [212.51.149.33])
        by smtp.gmail.com with ESMTPSA id z15-20020a5d654f000000b002211fc70174sm16324064wrv.99.2022.09.06.12.46.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Sep 2022 12:46:50 -0700 (PDT)
Date:   Tue, 6 Sep 2022 21:46:48 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Rob Clark <robdclark@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Rob Clark <robdclark@chromium.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        =?iso-8859-1?B?Suly9G1l?= Pouiller <jerome.pouiller@silabs.com>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [Linaro-mm-sig] [PATCH v2 1/3] dma-buf: Add ioctl to query mmap
 info
Message-ID: <YxejqOuHTjoO/iXg@phenom.ffwll.local>
Mail-Followup-To: Rob Clark <robdclark@gmail.com>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Rob Clark <robdclark@chromium.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        =?iso-8859-1?B?Suly9G1l?= Pouiller <jerome.pouiller@silabs.com>,
        "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20220801170459.1593706-1-robdclark@gmail.com>
 <20220801170459.1593706-2-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220801170459.1593706-2-robdclark@gmail.com>
X-Operating-System: Linux phenom 5.18.0-4-amd64 
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_INVALID,
        DKIM_SIGNED,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,T_SCC_BODY_TEXT_LINE,
        T_SPF_TEMPERROR autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Aug 01, 2022 at 10:04:55AM -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> This is a fairly narrowly focused interface, providing a way for a VMM
> in userspace to tell the guest kernel what pgprot settings to use when
> mapping a buffer to guest userspace.
> 
> For buffers that get mapped into guest userspace, virglrenderer returns
> a dma-buf fd to the VMM (crosvm or qemu).  In addition to mapping the
> pages into the guest VM, it needs to report to drm/virtio in the guest
> the cache settings to use for guest userspace.  In particular, on some
> architectures, creating aliased mappings with different cache attributes
> is frowned upon, so it is important that the guest mappings have the
> same cache attributes as any potential host mappings.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
> v2. fix compiler warning

I think I bikeshedded this on irc already, here for the record too.

- this wont work for buffers which do change the mapping when they move
  (ttm can do that). And cros does make noises about discrete gpus I've
  heard, this matters even for you :-)
- I'm pretty sure this will put is even more onto the nasty people list
  that dma-api folks maintain, especially with passing this all to
  userspace
- follow_pte() can figure this out internally in the kernel and kvm is
  already using this, and I think doing this all internally with mmu
  notifier and what not to make sure it all stays in sync is the right
  approach. So your kvm/whatever combo should be able to figure out wth
  it's supposed to be doing.

I think if you make this a virtio special case like we've done with the
magic uuid stuff, then that would make sense. Making it a full dma-buf
interface doesn't imo.

Cheers, Daniel

> 
>  drivers/dma-buf/dma-buf.c    | 26 ++++++++++++++++++++++++++
>  include/linux/dma-buf.h      |  7 +++++++
>  include/uapi/linux/dma-buf.h | 28 ++++++++++++++++++++++++++++
>  3 files changed, 61 insertions(+)
> 
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index 32f55640890c..87c52f080274 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -326,6 +326,29 @@ static long dma_buf_set_name(struct dma_buf *dmabuf, const char __user *buf)
>  	return 0;
>  }
>  
> +static long dma_buf_info(struct dma_buf *dmabuf, void __user *uarg)
> +{
> +	struct dma_buf_info arg;
> +
> +	if (copy_from_user(&arg, uarg, sizeof(arg)))
> +		return -EFAULT;
> +
> +	switch (arg.param) {
> +	case DMA_BUF_INFO_VM_PROT:
> +		if (!dmabuf->ops->mmap_info)
> +			return -ENOSYS;
> +		arg.value = dmabuf->ops->mmap_info(dmabuf);
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	if (copy_to_user(uarg, &arg, sizeof(arg)))
> +		return -EFAULT;
> +
> +	return 0;
> +}
> +
>  static long dma_buf_ioctl(struct file *file,
>  			  unsigned int cmd, unsigned long arg)
>  {
> @@ -369,6 +392,9 @@ static long dma_buf_ioctl(struct file *file,
>  	case DMA_BUF_SET_NAME_B:
>  		return dma_buf_set_name(dmabuf, (const char __user *)arg);
>  
> +	case DMA_BUF_IOCTL_INFO:
> +		return dma_buf_info(dmabuf, (void __user *)arg);
> +
>  	default:
>  		return -ENOTTY;
>  	}
> diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
> index 71731796c8c3..6f4de64a5937 100644
> --- a/include/linux/dma-buf.h
> +++ b/include/linux/dma-buf.h
> @@ -283,6 +283,13 @@ struct dma_buf_ops {
>  	 */
>  	int (*mmap)(struct dma_buf *, struct vm_area_struct *vma);
>  
> +	/**
> +	 * @mmap_info:
> +	 *
> +	 * Return mmapping info for the buffer.  See DMA_BUF_INFO_VM_PROT.
> +	 */
> +	int (*mmap_info)(struct dma_buf *);
> +
>  	int (*vmap)(struct dma_buf *dmabuf, struct iosys_map *map);
>  	void (*vunmap)(struct dma_buf *dmabuf, struct iosys_map *map);
>  };
> diff --git a/include/uapi/linux/dma-buf.h b/include/uapi/linux/dma-buf.h
> index b1523cb8ab30..a41adac0f46a 100644
> --- a/include/uapi/linux/dma-buf.h
> +++ b/include/uapi/linux/dma-buf.h
> @@ -85,6 +85,32 @@ struct dma_buf_sync {
>  
>  #define DMA_BUF_NAME_LEN	32
>  
> +
> +/**
> + * struct dma_buf_info - Query info about the buffer.
> + */
> +struct dma_buf_info {
> +
> +#define DMA_BUF_INFO_VM_PROT      1
> +#  define DMA_BUF_VM_PROT_WC      0
> +#  define DMA_BUF_VM_PROT_CACHED  1
> +
> +	/**
> +	 * @param: Which param to query
> +	 *
> +	 * DMA_BUF_INFO_BM_PROT:
> +	 *     Query the access permissions of userspace mmap's of this buffer.
> +	 *     Returns one of DMA_BUF_VM_PROT_x
> +	 */
> +	__u32 param;
> +	__u32 pad;
> +
> +	/**
> +	 * @value: Return value of the query.
> +	 */
> +	__u64 value;
> +};
> +
>  #define DMA_BUF_BASE		'b'
>  #define DMA_BUF_IOCTL_SYNC	_IOW(DMA_BUF_BASE, 0, struct dma_buf_sync)
>  
> @@ -95,4 +121,6 @@ struct dma_buf_sync {
>  #define DMA_BUF_SET_NAME_A	_IOW(DMA_BUF_BASE, 1, __u32)
>  #define DMA_BUF_SET_NAME_B	_IOW(DMA_BUF_BASE, 1, __u64)
>  
> +#define DMA_BUF_IOCTL_INFO	_IOWR(DMA_BUF_BASE, 2, struct dma_buf_info)
> +
>  #endif
> -- 
> 2.36.1
> 
> _______________________________________________
> Linaro-mm-sig mailing list -- linaro-mm-sig@lists.linaro.org
> To unsubscribe send an email to linaro-mm-sig-leave@lists.linaro.org

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
