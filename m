Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E7CE12B294
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2019 12:56:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726803AbfE0K4U (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 May 2019 06:56:20 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:43916 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725814AbfE0K4U (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 May 2019 06:56:20 -0400
Received: by mail-wr1-f67.google.com with SMTP id l17so8081189wrm.10;
        Mon, 27 May 2019 03:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=NgHnGCvNMHq7295bMMDORWVKD+vXnKaZP5KT2iaVdZY=;
        b=ZrQz6UlCjgLs4qFfhveSbG2qWpgslRMdcumRBd1vZyrGyK3X62/ebExfdZS9qaSW3b
         lUTRdvKC+MGVqkWr8SFd5tHgkcJqEww0wh2gHwn0RGLqJMHOHPSZ94EhIyhhDzzseQeU
         XdMPNhi6IqzLtvgzV1wLx3VVj7K0Pj7qakXufLIAmlJKHGqLW5zMPZM5UvNBftzzevgX
         j73eFMJulT+quE4aAi6YwXwKD2CjuLO2L7goUm35tzmlcxdQxURFLsk/Zn8ECR27thJ9
         4dxqHq24XvragiBP5vB1zJocE0E89M4bEkRsQ2EOqdjdJWblwZu8uCmv6gS9Zl5V7ZV+
         mu/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:reply-to:subject:to:cc:references:from
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-transfer-encoding:content-language;
        bh=NgHnGCvNMHq7295bMMDORWVKD+vXnKaZP5KT2iaVdZY=;
        b=hbgUE32PnC7qB7ozE0xvlkwX5E/84SLSpi2BUMPHpOWOETx9efPANiSzerQB/dHmTP
         bXCazF1dGBmWRC1eDZt43866z85nOwj9CzZa4wt2KUt28ktStxp49+t5j4x44qDFSiNW
         vUqfoV9aypDFX4DZvm4Gkh/aC4dXi5E5AheIHM/Bwk0haGU/4povT2SRbHB+aVVFTI6c
         GKls5xFEvFDRPBNrm3BRKuuw7wxlqGAXFf/3u72O3ui6immzRjTI6/vXKm2n6Z2O3Ov9
         rkLeBiFnqICXT8a3PANvoeoND9jhbsMff8sFgM8gvvhyPpPZE/vpUZ2iZWfD6eTYPm3M
         42mg==
X-Gm-Message-State: APjAAAVs6E1q6H1OhhoEWrb0pHKR2CaxMaEu9WE+xnDySzU2nlgO8Xxs
        ylWZpM5naGXAwtwT1ErsIXK7IW4D
X-Google-Smtp-Source: APXvYqx8kZRC7ah5RK8wi+cmUjWfiwmMDV79Lnhar/TOLTyXGvi8+Fn5qTph5amrQFkilVRQv57vaA==
X-Received: by 2002:a5d:688f:: with SMTP id h15mr14307927wru.44.1558954577790;
        Mon, 27 May 2019 03:56:17 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7? ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
        by smtp.gmail.com with ESMTPSA id y18sm12197618wmd.29.2019.05.27.03.56.16
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 May 2019 03:56:17 -0700 (PDT)
Reply-To: christian.koenig@amd.com
Subject: Re: [PATCH 02/12] dma-buf: add dma_buf_(un)map_attachment_locked
 variants v3
To:     Hillf Danton <hdanton@sina.com>,
        =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Cc:     linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, amd-gfx@lists.freedesktop.org,
        sumit.semwal@linaro.org, linux-media@vger.kernel.org
References: <20190416183841.1577-1-christian.koenig@amd.com>
 <20190416183841.1577-3-christian.koenig@amd.com>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <76bc8afb-8797-9057-ccb5-2d4f788d2f9e@gmail.com>
Date:   Mon, 27 May 2019 12:56:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190416183841.1577-3-christian.koenig@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Thanks for the comments, but you are looking at a completely outdated 
patchset.

If you are interested in the newest one please ping me and I'm going to 
CC you when I send out the next version.

Christian.

Am 25.05.19 um 03:04 schrieb Hillf Danton:
> On Tue, 16 Apr 2019 20:38:31 +0200 Christian König wrote:
>> Add function variants which can be called with the reservation lock
>> already held.
>>
>> v2: reordered, add lockdep asserts, fix kerneldoc
>> v3: rebased on sgt caching
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> ---
>>   drivers/dma-buf/dma-buf.c | 63 +++++++++++++++++++++++++++++++++++++++
>>   include/linux/dma-buf.h   |  5 ++++
>>   2 files changed, 68 insertions(+)
>>
>> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
>> index 65161a82d4d5..ef480e5fb239 100644
>> --- a/drivers/dma-buf/dma-buf.c
>> +++ b/drivers/dma-buf/dma-buf.c
>> @@ -623,6 +623,43 @@ void dma_buf_detach(struct dma_buf *dmabuf, struct dma_buf_attachment *attach)
>>   }
>>   EXPORT_SYMBOL_GPL(dma_buf_detach);
>>   
>> +/**
>> + * dma_buf_map_attachment_locked - Maps the buffer into _device_ address space
>> + * with the reservation lock held. Is a wrapper for map_dma_buf() of the
> Something is missing; seems to be s/of the/of the dma_buf_ops./
>> + *
>> + * Returns the scatterlist table of the attachment;
>> + * dma_buf_ops.
> Oh it is sitting here!
>
>> + * @attach:	[in]	attachment whose scatterlist is to be returned
>> + * @direction:	[in]	direction of DMA transfer
>> + *
>> + * Returns sg_table containing the scatterlist to be returned; returns ERR_PTR
>> + * on error. May return -EINTR if it is interrupted by a signal.
>> + *
> EINTR looks impossible in the code.
>
>> + * A mapping must be unmapped by using dma_buf_unmap_attachment_locked(). Note
>> + * that the underlying backing storage is pinned for as long as a mapping
>> + * exists, therefore users/importers should not hold onto a mapping for undue
>> + * amounts of time.
>> + */
>> +struct sg_table *
>> +dma_buf_map_attachment_locked(struct dma_buf_attachment *attach,
>> +			      enum dma_data_direction direction)
>> +{
>> +	struct sg_table *sg_table;
>> +
>> +	might_sleep();
>> +	reservation_object_assert_held(attach->dmabuf->resv);
>> +
>> +	if (attach->sgt)
>> +		return attach->sgt;
>> +
>> +	sg_table = attach->dmabuf->ops->map_dma_buf(attach, direction);
>> +	if (!sg_table)
>> +		sg_table = ERR_PTR(-ENOMEM);
>> +
>> +	return sg_table;
>> +}
>> +EXPORT_SYMBOL_GPL(dma_buf_map_attachment_locked);
>> +
> Best Regards
> Hillf
>
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx

