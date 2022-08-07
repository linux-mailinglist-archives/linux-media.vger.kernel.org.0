Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B644B58BBD0
	for <lists+linux-media@lfdr.de>; Sun,  7 Aug 2022 18:09:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233928AbiHGQJn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 7 Aug 2022 12:09:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233135AbiHGQJm (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 7 Aug 2022 12:09:42 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97FF0A462;
        Sun,  7 Aug 2022 09:09:40 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id m4so12634642ejr.3;
        Sun, 07 Aug 2022 09:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=kfa6rkgDz6nn/pdEUYBNKDa4YqJiKITb3f8OdRtzvmk=;
        b=COXRpdfLeS6/eF9rAZR77z4MCuaK1+JKWGBD5kceZ0kJ4DchZJT725v+jCGmSJ2imB
         y4LN5N4cEput2dmnjPpZCBYcshfj1bs6YZZGHxlscSVTNzWVaENtU7E4kmIpbVVltmxT
         aQR3xi0sFHgRyzSUKNZpdZSBzbY1h2hGdEnQL8xZFEG5MuIqRLMHqwmsW4LTGQAJbbqR
         AMgWQCf4vme8WZ6+QAduQY1FuWKGKZdhHldfKg9FgkriLIxratMMFGJYpcQyxffBS5lV
         klJLgyjrydzzporrpp+caJV3uKT77YXMDjWuOvl1b7gggzDYCfyawoTvo8nU4h4lU114
         y/Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=kfa6rkgDz6nn/pdEUYBNKDa4YqJiKITb3f8OdRtzvmk=;
        b=mmL5Uwo8IHjIIhQyb35F2Bsk8RXQUM3BjB3oOWffmNmv2JD11dKjapFRx64utFFLXV
         Dzl/tonlBQAhhp1t2UEnTmIRaDsk53gB8y3QCFpLma2+y9sW7Kbrl3Dmt0ec+bcJ+z7o
         xE+e3pchfhxFg3/dBiWzb/YLoKJD4qoR8jluXzcC6HmuYCa4EHhM2Q3AzGVLRNxDZsot
         0AtKUtsB8uBV/cSgQe3FfvLkVOg66sc0UfoNzIL4ihlbBXXG1s0bntGlcod67fXLqu24
         yfzwUIDkHxgvXz86FimiUNsqMH2VG1zE+YyJvund+bVANQwbyQ4Na8LoqcfoWRCbSe84
         fTcA==
X-Gm-Message-State: ACgBeo0xPQKTJ08HfLx3+JHneskU6+Ur7m0u44ts5h/Z6BkJZCh6qUjt
        72HO/VyNeLWrRy7lE9GRntk=
X-Google-Smtp-Source: AA6agR63DksStqDlJzPXUBqN0Z2rFKAzOT4xKMjjaRhnc3EuWCBYaX7QAw6Iot6h6qj8HoZIIlqggw==
X-Received: by 2002:a17:907:6d15:b0:730:da23:5b5c with SMTP id sa21-20020a1709076d1500b00730da235b5cmr10391598ejc.325.1659888579044;
        Sun, 07 Aug 2022 09:09:39 -0700 (PDT)
Received: from ?IPV6:2a02:908:1256:79a0:f019:ef7b:173c:a9d2? ([2a02:908:1256:79a0:f019:ef7b:173c:a9d2])
        by smtp.gmail.com with ESMTPSA id gj6-20020a170907740600b0072b31307a79sm3984470ejc.60.2022.08.07.09.09.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Aug 2022 09:09:38 -0700 (PDT)
Message-ID: <3d2083aa-fc6c-6875-3daf-e5abe45fb762@gmail.com>
Date:   Sun, 7 Aug 2022 18:09:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [Linaro-mm-sig] [PATCH 1/3] dma-buf: Add ioctl to query mmap info
Content-Language: en-US
To:     Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     freedreno@lists.freedesktop.org,
        Rob Clark <robdclark@chromium.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
        =?UTF-8?B?SsOpcsO0bWUgUG91aWxsZXI=?= <jerome.pouiller@silabs.com>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20220729170744.1301044-1-robdclark@gmail.com>
 <20220729170744.1301044-2-robdclark@gmail.com>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <20220729170744.1301044-2-robdclark@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 29.07.22 um 19:07 schrieb Rob Clark:
> From: Rob Clark <robdclark@chromium.org>
>
> This is a fairly narrowly focused interface, providing a way for a VMM
> in userspace to tell the guest kernel what pgprot settings to use when
> mapping a buffer to guest userspace.
>
> For buffers that get mapped into guest userspace, virglrenderer returns
> a dma-buf fd to the VMM (crosvm or qemu).

Wow, wait a second. Who is giving whom the DMA-buf fd here?

My last status was that this design was illegal and couldn't be 
implemented because it requires internal knowledge only the exporting 
driver can have.

@Daniel has anything changed on that is or my status still valid?

Regards,
Christian.

>    In addition to mapping the
> pages into the guest VM, it needs to report to drm/virtio in the guest
> the cache settings to use for guest userspace.  In particular, on some
> architectures, creating aliased mappings with different cache attributes
> is frowned upon, so it is important that the guest mappings have the
> same cache attributes as any potential host mappings.
>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>   drivers/dma-buf/dma-buf.c    | 26 ++++++++++++++++++++++++++
>   include/linux/dma-buf.h      |  7 +++++++
>   include/uapi/linux/dma-buf.h | 28 ++++++++++++++++++++++++++++
>   3 files changed, 61 insertions(+)
>
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index 32f55640890c..d02d6c2a3b49 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -326,6 +326,29 @@ static long dma_buf_set_name(struct dma_buf *dmabuf, const char __user *buf)
>   	return 0;
>   }
>   
> +static long dma_buf_info(struct dma_buf *dmabuf, const void __user *uarg)
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
>   static long dma_buf_ioctl(struct file *file,
>   			  unsigned int cmd, unsigned long arg)
>   {
> @@ -369,6 +392,9 @@ static long dma_buf_ioctl(struct file *file,
>   	case DMA_BUF_SET_NAME_B:
>   		return dma_buf_set_name(dmabuf, (const char __user *)arg);
>   
> +	case DMA_BUF_IOCTL_INFO:
> +		return dma_buf_info(dmabuf, (const void __user *)arg);
> +
>   	default:
>   		return -ENOTTY;
>   	}
> diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
> index 71731796c8c3..6f4de64a5937 100644
> --- a/include/linux/dma-buf.h
> +++ b/include/linux/dma-buf.h
> @@ -283,6 +283,13 @@ struct dma_buf_ops {
>   	 */
>   	int (*mmap)(struct dma_buf *, struct vm_area_struct *vma);
>   
> +	/**
> +	 * @mmap_info:
> +	 *
> +	 * Return mmapping info for the buffer.  See DMA_BUF_INFO_VM_PROT.
> +	 */
> +	int (*mmap_info)(struct dma_buf *);
> +
>   	int (*vmap)(struct dma_buf *dmabuf, struct iosys_map *map);
>   	void (*vunmap)(struct dma_buf *dmabuf, struct iosys_map *map);
>   };
> diff --git a/include/uapi/linux/dma-buf.h b/include/uapi/linux/dma-buf.h
> index b1523cb8ab30..a41adac0f46a 100644
> --- a/include/uapi/linux/dma-buf.h
> +++ b/include/uapi/linux/dma-buf.h
> @@ -85,6 +85,32 @@ struct dma_buf_sync {
>   
>   #define DMA_BUF_NAME_LEN	32
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
>   #define DMA_BUF_BASE		'b'
>   #define DMA_BUF_IOCTL_SYNC	_IOW(DMA_BUF_BASE, 0, struct dma_buf_sync)
>   
> @@ -95,4 +121,6 @@ struct dma_buf_sync {
>   #define DMA_BUF_SET_NAME_A	_IOW(DMA_BUF_BASE, 1, __u32)
>   #define DMA_BUF_SET_NAME_B	_IOW(DMA_BUF_BASE, 1, __u64)
>   
> +#define DMA_BUF_IOCTL_INFO	_IOWR(DMA_BUF_BASE, 2, struct dma_buf_info)
> +
>   #endif

