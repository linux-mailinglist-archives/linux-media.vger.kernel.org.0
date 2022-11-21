Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0E0C5631D58
	for <lists+linux-media@lfdr.de>; Mon, 21 Nov 2022 10:52:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230395AbiKUJwb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Nov 2022 04:52:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231255AbiKUJwK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Nov 2022 04:52:10 -0500
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 106A1A461;
        Mon, 21 Nov 2022 01:51:47 -0800 (PST)
Received: by mail-ed1-x52b.google.com with SMTP id z18so15437186edb.9;
        Mon, 21 Nov 2022 01:51:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dbIkFxWp7OGSzVyZhCFFdNTbMlS4Au162oVI4e0U/e8=;
        b=i0zqqyGezIfwQHSrRILCFIll7ZZUWu0GoKvsgEqVswfqBa7Mf+g6V4+TFB/LPVMK+i
         6Hky+QlMkdm52C65DwVho8nbjcG8Aw1ZhY6/70nOW4O9i7VAneMgVMBB98Xk7hmydBhi
         dCUetrS1FYeSGoBaDV3iI9c5BTQg2x1qT+Q4BARIOxMQj/fIPHTDGFuY4AXepdzajnS+
         eoQPDRh+lUIstP92yrg4PHwvWo1I1EX9vtJc60ozxICem8zxXvfW/lkFDgxAkyTJFpHJ
         Ds48n9R5pUucBCUNaz0SjITs51JRxCJZ32lvWhok/wgn040SiTpHCPoWKOKSGoS6k/vM
         tYUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dbIkFxWp7OGSzVyZhCFFdNTbMlS4Au162oVI4e0U/e8=;
        b=XpQOfIF1nRaIPqc1c65HPbLHr5zLMxg7fpWwclaB/9LT+sSfSye7KGCW5IMnSqpZkf
         54Ha/I+sJpf26qz7R+XHv+VqXQbp/VECyY0EgqLIz9zXz32BkqjgNvNUJ1LAEMmclzwe
         FN/vwqFXmfSg98GkJE3LaIjEsil5/MZv/ttJjSDP7i41HYGW0hVQkIURhwT+hqSXMx+a
         7L0xaYzljouv+n7x6Yk60GsF7/oHbSpgsPyjxNUpwvhj2OZOB0WAdOlcPrn5gwdB4Vj3
         7PGx9Rcu/kplYgPlsJi64ghadW33HhWwKEq+mHtKHT9mPOWWiFLAUzFFU6csQdnINMqO
         nn8w==
X-Gm-Message-State: ANoB5pnLNnb/zHRcaY19hEkPd3F8BjsCn5mIytuSQ/aVGBnEI0yY1F9F
        fozw9Y1jYoqc6XK1tnkS/Ks=
X-Google-Smtp-Source: AA0mqf5UmVueQ+rML91hvVDpfCRH9/Xe5Mop01dSSGY1DvZy+Z3CBmUqEesybd+1AthUHwK+D6XBtA==
X-Received: by 2002:a05:6402:6c6:b0:469:590d:ae9a with SMTP id n6-20020a05640206c600b00469590dae9amr1672214edy.277.1669024305535;
        Mon, 21 Nov 2022 01:51:45 -0800 (PST)
Received: from [192.168.178.21] (p5b0ea229.dip0.t-ipconnect.de. [91.14.162.41])
        by smtp.gmail.com with ESMTPSA id p18-20020a17090628d200b00782ee6b34f2sm4762763ejd.183.2022.11.21.01.51.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Nov 2022 01:51:44 -0800 (PST)
Message-ID: <88779a02-6b99-09e3-2ad0-396fb9b2b13f@gmail.com>
Date:   Mon, 21 Nov 2022 10:51:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [Linaro-mm-sig] [PATCH 3/5] kobject: kset_uevent_ops: make
 filter() callback take a const *
Content-Language: en-US
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org
Cc:     "Rafael J. Wysocki" <rafael@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org
References: <20221121094649.1556002-1-gregkh@linuxfoundation.org>
 <20221121094649.1556002-3-gregkh@linuxfoundation.org>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <20221121094649.1556002-3-gregkh@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 21.11.22 um 10:46 schrieb Greg Kroah-Hartman:
> The filter() callback in struct kset_uevent_ops does not modify the
> kobject passed into it, so make the pointer const to enforce this
> restriction.  When doing so, fix up all existing filter() callbacks to
> have the correct signature to preserve the build.
>
> Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: "Christian König" <christian.koenig@amd.com>
> Cc: linux-media@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linaro-mm-sig@lists.linaro.org
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Acked-by: Christian König <christian.koenig@amd.com> for the changes to 
the DMA-buf subsystem.

> ---
>   drivers/base/bus.c                    | 2 +-
>   drivers/base/core.c                   | 4 ++--
>   drivers/dma-buf/dma-buf-sysfs-stats.c | 2 +-
>   include/linux/kobject.h               | 2 +-
>   kernel/params.c                       | 2 +-
>   5 files changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/base/bus.c b/drivers/base/bus.c
> index 7ca47e5b3c1f..4ec6dbab73be 100644
> --- a/drivers/base/bus.c
> +++ b/drivers/base/bus.c
> @@ -163,7 +163,7 @@ static struct kobj_type bus_ktype = {
>   	.release	= bus_release,
>   };
>   
> -static int bus_uevent_filter(struct kobject *kobj)
> +static int bus_uevent_filter(const struct kobject *kobj)
>   {
>   	const struct kobj_type *ktype = get_ktype(kobj);
>   
> diff --git a/drivers/base/core.c b/drivers/base/core.c
> index a79b99ecf4d8..005a2b092f3e 100644
> --- a/drivers/base/core.c
> +++ b/drivers/base/core.c
> @@ -2362,12 +2362,12 @@ static struct kobj_type device_ktype = {
>   };
>   
>   
> -static int dev_uevent_filter(struct kobject *kobj)
> +static int dev_uevent_filter(const struct kobject *kobj)
>   {
>   	const struct kobj_type *ktype = get_ktype(kobj);
>   
>   	if (ktype == &device_ktype) {
> -		struct device *dev = kobj_to_dev(kobj);
> +		const struct device *dev = kobj_to_dev(kobj);
>   		if (dev->bus)
>   			return 1;
>   		if (dev->class)
> diff --git a/drivers/dma-buf/dma-buf-sysfs-stats.c b/drivers/dma-buf/dma-buf-sysfs-stats.c
> index 2bba0babcb62..f69d68122b9b 100644
> --- a/drivers/dma-buf/dma-buf-sysfs-stats.c
> +++ b/drivers/dma-buf/dma-buf-sysfs-stats.c
> @@ -132,7 +132,7 @@ void dma_buf_stats_teardown(struct dma_buf *dmabuf)
>   
>   
>   /* Statistics files do not need to send uevents. */
> -static int dmabuf_sysfs_uevent_filter(struct kobject *kobj)
> +static int dmabuf_sysfs_uevent_filter(const struct kobject *kobj)
>   {
>   	return 0;
>   }
> diff --git a/include/linux/kobject.h b/include/linux/kobject.h
> index 5a2d58e10bf5..640f59d4b3de 100644
> --- a/include/linux/kobject.h
> +++ b/include/linux/kobject.h
> @@ -135,7 +135,7 @@ struct kobj_uevent_env {
>   };
>   
>   struct kset_uevent_ops {
> -	int (* const filter)(struct kobject *kobj);
> +	int (* const filter)(const struct kobject *kobj);
>   	const char *(* const name)(struct kobject *kobj);
>   	int (* const uevent)(struct kobject *kobj, struct kobj_uevent_env *env);
>   };
> diff --git a/kernel/params.c b/kernel/params.c
> index 5b92310425c5..d2237209ceda 100644
> --- a/kernel/params.c
> +++ b/kernel/params.c
> @@ -926,7 +926,7 @@ static const struct sysfs_ops module_sysfs_ops = {
>   	.store = module_attr_store,
>   };
>   
> -static int uevent_filter(struct kobject *kobj)
> +static int uevent_filter(const struct kobject *kobj)
>   {
>   	const struct kobj_type *ktype = get_ktype(kobj);
>   

