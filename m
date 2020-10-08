Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FB132873CE
	for <lists+linux-media@lfdr.de>; Thu,  8 Oct 2020 14:06:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728969AbgJHMGj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Oct 2020 08:06:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725802AbgJHMGi (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 8 Oct 2020 08:06:38 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 330A2C061755;
        Thu,  8 Oct 2020 05:06:38 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id p15so7733790ejm.7;
        Thu, 08 Oct 2020 05:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=gXjtIH7dAAJciFaXwreITvtgTALD51vwZB1L5IfZhnE=;
        b=Wq2WSf3zZJQ4BBWUyL5VGwtoZDmet7UNRDliIwTtTITSFkUFE2pgG2EMtfEmspaGl6
         +m2CoVlv02bMP1hxzUoyUNhgZjl8NrvIIqXcia7ZmK4CA9GryMFrLSG2lUWywThFUIq6
         tNfjA3+nOv3TtLpTW9TZPEmf15u89ALe5wbq4diXDRilHBVlSh+r/21c6hsb0CgqExO4
         xtaT3keqIu6jGCcMXo3qUHpkmv4Hr+ZL2htSqgViDoz+PCYz0iQLvBdzxfon/1ze4E30
         pvZP7kv3HFJ0vTwpgzc8DWMf7WcD5KxYm7hBIC2JML8nVpte6otZd4CW11o/EpcGz0ub
         iqvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:reply-to:subject:to:cc:references:from
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-transfer-encoding:content-language;
        bh=gXjtIH7dAAJciFaXwreITvtgTALD51vwZB1L5IfZhnE=;
        b=m2imGFfP1Ds9XTglek0qFauIJvztezpk9EW4G67DVHtRNeuuOltZsvbgLZohPWwKOG
         VoYyilUVfk8XMF+hecBm0WiMs/T2Bz0zHqwquTGdbHHQZut+pbRx8VN1pCCplrBz4UYM
         +T+ETDOx2QI5jEgEZm7mGHImenMgzvkBOBmfbnLao4nYmWPSSNE8bagG89FU8fLt3CNU
         blopsnq7LGVySrhU25UzjaudeVDrgBOo00CYjTMYfrKyXyTf7ZRLHG8LsJiIDs6yyEmY
         Sh5Qo3sW462H8zKe+bu3q2QCQBb6QJXW02LZsjxk0Zy2sz8dzp9brD3nUtbl53GuCyp7
         QSaA==
X-Gm-Message-State: AOAM5331q+yXrSWjXSLsmtCvhEM4c/3Eycw0qYzdnCRs9kl2IrQ/nHK2
        iQn0rlODW7BQwZBPweKyx3uU2YaJH5U=
X-Google-Smtp-Source: ABdhPJx6xc2xxF8cIvrcp9+s773JObUPxs9e5wJpF3CyCr5TW/ZXQKvGUYmaCfo2bUuLtvDCAuZ3ig==
X-Received: by 2002:a17:906:b004:: with SMTP id v4mr8779129ejy.156.1602158796801;
        Thu, 08 Oct 2020 05:06:36 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7? ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
        by smtp.gmail.com with ESMTPSA id bu23sm3843061edb.69.2020.10.08.05.06.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2020 05:06:36 -0700 (PDT)
Reply-To: christian.koenig@amd.com
Subject: Re: [PATCH 1/4] mm: introduce vma_set_file function v2
To:     Matthew Wilcox <willy@infradead.org>
Cc:     linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, chris@chris-wilson.co.uk,
        airlied@redhat.com, akpm@linux-foundation.org, daniel@ffwll.ch,
        sumit.semwal@linaro.org
References: <20201008112342.9394-1-christian.koenig@amd.com>
 <20201008113937.GB20115@casper.infradead.org>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <41323971-7869-ed09-6181-99a567dc6d7b@gmail.com>
Date:   Thu, 8 Oct 2020 14:06:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201008113937.GB20115@casper.infradead.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 08.10.20 um 13:39 schrieb Matthew Wilcox:
> On Thu, Oct 08, 2020 at 01:23:39PM +0200, Christian König wrote:
>>   drivers/dma-buf/dma-buf.c                  | 16 +++++-----------
>>   drivers/gpu/drm/etnaviv/etnaviv_gem.c      |  4 +---
>>   drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c |  3 +--
>>   drivers/gpu/drm/i915/gem/i915_gem_mman.c   |  4 ++--
>>   drivers/gpu/drm/msm/msm_gem.c              |  4 +---
>>   drivers/gpu/drm/omapdrm/omap_gem.c         |  3 +--
>>   drivers/gpu/drm/vgem/vgem_drv.c            |  3 +--
>>   drivers/staging/android/ashmem.c           |  5 ++---
> ...
>> +++ b/mm/mmap.c
>> @@ -136,6 +136,22 @@ void vma_set_page_prot(struct vm_area_struct *vma)
>>   	WRITE_ONCE(vma->vm_page_prot, vm_page_prot);
>>   }
>>   
>> +/*
>> + * Change backing file, only valid to use during initial VMA setup.
>> + */
>> +struct file *vma_set_file(struct vm_area_struct *vma, struct file *file)
>> +{
>> +	if (file)
>> +	        get_file(file);
>> +
>> +	swap(vma->vm_file, file);
>> +
>> +	if (file)
>> +		fput(file);
>> +
>> +	return file;
>> +}
>> +
> These users are all potentially modules.  You need an EXPORT_SYMBOL()?

Oh, good point. Yeah I totally missed that. The initial DMA-buf use case 
was not inside a module.

Thanks,
Christian.


