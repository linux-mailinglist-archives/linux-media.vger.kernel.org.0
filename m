Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C82C358BCE5
	for <lists+linux-media@lfdr.de>; Sun,  7 Aug 2022 22:26:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231237AbiHGUZ6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 7 Aug 2022 16:25:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230386AbiHGUZ5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 7 Aug 2022 16:25:57 -0400
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAB5364C4;
        Sun,  7 Aug 2022 13:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1659903953; x=1691439953;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=eQ5vUTIVjFaJOW49JpDtCqaTs+jr2jaJBCrYgnxt4dI=;
  b=N5EVe6SWkfIjMBYqNx9tkukCc/lPhO+mzjPh/cSqxKf4hP1wa5WrfskT
   AA0Sc2CNxrgSaTwnShlmB/AEXz7WnnpKDF0QkO7Ska/ltxnXJDC9dCjO/
   EwQz28V+6HG7DZeWgrs6LNtdDtBgySnPcZBvCE74AS9LZUaHdLhFu+5qs
   M=;
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
  by alexa-out.qualcomm.com with ESMTP; 07 Aug 2022 13:25:52 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg09-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2022 13:25:52 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Sun, 7 Aug 2022 13:25:51 -0700
Received: from [10.216.42.249] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Sun, 7 Aug 2022
 13:25:48 -0700
Message-ID: <62afe47a-1a50-80ef-400d-8c238f1cb332@quicinc.com>
Date:   Mon, 8 Aug 2022 01:55:45 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [Freedreno] [PATCH 1/3] dma-buf: Add ioctl to query mmap info
Content-Language: en-US
To:     Rob Clark <robdclark@gmail.com>, <dri-devel@lists.freedesktop.org>
CC:     Rob Clark <robdclark@chromium.org>,
        =?UTF-8?B?SsOpcsO0bWUgUG91aWxsZXI=?= <jerome.pouiller@silabs.com>,
        open list <linux-kernel@vger.kernel.org>,
        =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        <freedreno@lists.freedesktop.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>
References: <20220729170744.1301044-1-robdclark@gmail.com>
 <20220729170744.1301044-2-robdclark@gmail.com>
From:   Akhil P Oommen <quic_akhilpo@quicinc.com>
In-Reply-To: <20220729170744.1301044-2-robdclark@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 7/29/2022 10:37 PM, Rob Clark wrote:
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
Is there a typo here? BM -> VM ?

-Akhil.
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

