Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E2B54616C3
	for <lists+linux-media@lfdr.de>; Mon, 29 Nov 2021 14:38:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233913AbhK2Nlk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 Nov 2021 08:41:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237899AbhK2Njk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 Nov 2021 08:39:40 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F22A2C08EC69
        for <linux-media@vger.kernel.org>; Mon, 29 Nov 2021 04:19:13 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id q3so13485044wru.5
        for <linux-media@vger.kernel.org>; Mon, 29 Nov 2021 04:19:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=XcU3cZ675oLKAA0YDtoMQZs1c0pmDDKNznpl0CDHRnI=;
        b=gX559nvoo9EME4Wn9UQ4zSsuXCKTgh0cVjLmxYmXWIkRJA+z/RlsJm2wtBy/1umRn5
         31kRXBXD9FVypfX/Km1XoIYo/rhU1dnX5ppZmSuXy/Sqvvzte8dXh49gu429ZfFOroyA
         Nc9zK+eZBemQI9BLB/bVvXbejK6+yo8Ry1PS6uyrpvzuobkYKcQTT6o1gkZDYduyvjfI
         zsfsspYl034R6M7cey6xrtRAA/A5yO7/gPhIIB0ZvC3m9GbpQ+N1EwKDmKjdz2QPkBTZ
         poFsH+/1WSOGeq7w6s2fayp7snttEkHa9iF6FaF0bgYA3PTi15XaLoRw32j/te8mVu47
         N7ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=XcU3cZ675oLKAA0YDtoMQZs1c0pmDDKNznpl0CDHRnI=;
        b=PPrMO9Zx1lwdr2Bi821C7UwRRhT6Tl7Wj0xjVD6gua6Ne4WzcrbvTxyAPflrbZTCxi
         eXLjFqXFqGnU6ANGjEVJ4XuaRO/0S3G2cpvXVEhbLpQt5wxHYVX5QC06BwO+AZ7ZTXSH
         bkNapaCta3ecvG5ogiAI/AhxqnPZRpHz6XnEvoS+14ctne89rlzGpLKIN6OFtk590WFI
         VodUbzb47F//U7MFr576fPcgDjiRNqzOgWLeYTil031QxNSZJHIrUjWCiVAvIS21hqVr
         Cp0Choie0nrwnbXcqxWuZ1/QzCo0Wmct0FdaqaDpKeLcpQ8Qq/RXzySuOOSiyloor4/f
         2exg==
X-Gm-Message-State: AOAM533e9oZwe1TbQiFGF46BsOmjzK1vRyvschUITLSfBMd6M/uFuQZe
        ucQ1K2IlXON8O9T9SPcExMYXG9v/sLc=
X-Google-Smtp-Source: ABdhPJxeWD8FcZ//PIfnggOqDMEQt5eKAjwzpuVJLP0oB3ZURw8HM3SiJfb5aEeWqkmgNST850wj9Q==
X-Received: by 2002:a5d:5008:: with SMTP id e8mr33182089wrt.83.1638188352670;
        Mon, 29 Nov 2021 04:19:12 -0800 (PST)
Received: from [192.168.178.21] (p57b0b77b.dip0.t-ipconnect.de. [87.176.183.123])
        by smtp.gmail.com with ESMTPSA id n13sm13965341wrt.44.2021.11.29.04.19.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Nov 2021 04:19:12 -0800 (PST)
Subject: Re: [PATCH 22/26] dma-buf: add enum dma_resv_usage
To:     Daniel Vetter <daniel@ffwll.ch>
Cc:     sumit.semwal@linaro.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
References: <20211123142111.3885-1-christian.koenig@amd.com>
 <20211123142111.3885-23-christian.koenig@amd.com>
 <YZ+y+Uwo809qtvs5@phenom.ffwll.local>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <1e45687c-23ee-03da-abb8-da4a5f9d2872@gmail.com>
Date:   Mon, 29 Nov 2021 13:19:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YZ+y+Uwo809qtvs5@phenom.ffwll.local>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 25.11.21 um 16:59 schrieb Daniel Vetter:
> [SNIP]
>> + *
>> + * For example when asking for WRITE fences then the KERNEL fences are returned
>> + * as well. Similar when asked for READ fences then both WRITE and KERNEL
>> + * fences are returned as well.
>> + */
>> +enum dma_resv_usage {
>> +	/**
>> +	 * @DMA_RESV_USAGE_KERNEL: For in kernel memory management only.
>> +	 *
>> +	 * This should only be used for things like copying or clearing memory
>> +	 * with a DMA hardware engine for the purpose of kernel memory
>> +	 * management.
>> +	 *
>> +         * Drivers *always* need to wait for those fences before accessing the
>> +	 * resource protected by the dma_resv object. The only exception for
>> +	 * that is when the resource is known to be locked down in place by
>> +	 * pinning it previously.
> Should dma_buf_pin also do the wait for kernel fences? I think that would
> also ba e bit clearer semantics in the dma-buf patch which does these
> waits for us.
>
> Or should dma_buf_pin be pipelined and it's up to callers to wait? For kms
> that's definitely the semantics we want, but it's a bit playing with fire
> situation, so maybe dma-buf should get the more idiot proof semantics?

Yeah, good question. I've already added a wait after mapping an 
attachment for static importers.

But for dynamic importers I'm not sure what we want to do. On the one 
hand waiting for moves to finish is certainly the more defensive 
approach on the other hand when you have a dynamic importer you 
absolutely need to handle those dependencies correctly anyway.

Regards,
Christian.
