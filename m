Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8FE9126C975
	for <lists+linux-media@lfdr.de>; Wed, 16 Sep 2020 21:09:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727751AbgIPTJ2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Sep 2020 15:09:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727356AbgIPRoZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Sep 2020 13:44:25 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4882FC061356;
        Wed, 16 Sep 2020 08:31:35 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id r7so10924982ejs.11;
        Wed, 16 Sep 2020 08:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=FFVIMLw/qCsSLnB7Hf2n5qox/a9OEmYxxlddH5dk/ng=;
        b=NonqZq3rUzQcLEzLa0eBBE1h+gfBuDVn6anZ5i79FdEzJ+JYlB5SF7WfWfG3Mqvcrz
         mpBRMc8amwyC7GvLim/gZecRiJ0vOCz1yEPW5AGY5gdgIiAxVnKaz6+8cQWgOOE1JBWo
         umZ7lUC4fu6kdAIr/pLSd3uACF3Leq/HOcTZ1qLED+2Dh1I4zZFDqYA3g7QkB/mkQbHh
         cq+zcHmwJnCTpRvWYKWZ+sW6FV/DqDnOPIEaE1u4XZmMa77U6nIxauuufDzKAfmeZ6Cl
         CnFDeB1TboTcq3DxTXjkmIxcdUlTEg1NlZE99ETZER7DASL0l92c2vwTdrneuKiaL0fS
         h6UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:reply-to:subject:to:cc:references:from
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-transfer-encoding:content-language;
        bh=FFVIMLw/qCsSLnB7Hf2n5qox/a9OEmYxxlddH5dk/ng=;
        b=swWJmTWlJn5fxdz9nnCIa8Fe7F3PfxegyeIVlYFpR94AF4UnI0RuTUE4HlRLFhqDt+
         TiaYyxM/kEVDVQCLwsRLpPXJ85NZAt3SO67a6x2woEIrvA8IRNRbFsvKGCo30ThQUqe2
         m5qjlC2RTKhn0IwhSOe2ku6z9mfPum6g2K4lLxclUQ6kUjsZyJVNDwxbhD259F06t0tZ
         CwuZBXpNy3nqHznryOIuAcQtnH/5+pb1jum4xp/ejOAEAWW6E91T6zepg/aTxgHFvlbn
         +eUUDO6iUZNk5LtiLRDJDJokwA3ucE5qdo9kfnI+MEw0hhZtwdRihamPZTeqnQdqSgZr
         jYZA==
X-Gm-Message-State: AOAM532ITPC2UYgbveIDfCazGgPsW4V52xJMflL53Gw4We6pXZ86Xm4Y
        scMKp9qQL0q5wrD5o+YL0g+2Mk+7CJU=
X-Google-Smtp-Source: ABdhPJx8ArZnxCH5L/M6w2OQ/SkKcPuPpgnzuN/T5LBMYwHsyZz643N/8p/J/r8TnQEqdpzY+GTdEQ==
X-Received: by 2002:a17:906:d965:: with SMTP id rp5mr25015415ejb.364.1600270293644;
        Wed, 16 Sep 2020 08:31:33 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7? ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
        by smtp.gmail.com with ESMTPSA id lo25sm12877150ejb.53.2020.09.16.08.31.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2020 08:31:33 -0700 (PDT)
Reply-To: christian.koenig@amd.com
Subject: Re: [Linaro-mm-sig] Changing vma->vm_file in dma_buf_mmap()
To:     Daniel Vetter <daniel@ffwll.ch>,
        =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Cc:     Linux MM <linux-mm@kvack.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>, Jason Gunthorpe <jgg@ziepe.ca>,
        Andrew Morton <akpm@linux-foundation.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>
References: <20200914132920.59183-1-christian.koenig@amd.com>
 <40cd26ae-b855-4627-5a13-4dcea5d622f6@gmail.com>
 <20200914140632.GD1221970@ziepe.ca>
 <9302e4e0-0ff0-8b00-ada1-85feefb49e88@gmail.com>
 <20200916095359.GD438822@phenom.ffwll.local> <20200916140710.GA8409@ziepe.ca>
 <8db2474f-ecb7-0e17-5f5b-145708fe44d5@amd.com>
 <CAKMK7uFdwrT3HACPh3ADAKvhXJ-Hf3dExZmgJVAQ1KKjSai_0w@mail.gmail.com>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <aa953b09-53b1-104b-dc4b-156ad8a75e62@gmail.com>
Date:   Wed, 16 Sep 2020 17:31:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAKMK7uFdwrT3HACPh3ADAKvhXJ-Hf3dExZmgJVAQ1KKjSai_0w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 16.09.20 um 17:24 schrieb Daniel Vetter:
> On Wed, Sep 16, 2020 at 4:14 PM Christian König
> <christian.koenig@amd.com> wrote:
>> Am 16.09.20 um 16:07 schrieb Jason Gunthorpe:
>>> On Wed, Sep 16, 2020 at 11:53:59AM +0200, Daniel Vetter wrote:
>>>
>>>> But within the driver, we generally need thousands of these, and that
>>>> tends to bring fd exhaustion problems with it. That's why all the private
>>>> buffer objects which aren't shared with other process or other drivers are
>>>> handles only valid for a specific fd instance of the drm chardev (each
>>>> open gets their own namespace), and only for ioctls done on that chardev.
>>>> And for mmap we assign fake (but unique across all open fd on it) offsets
>>>> within the overall chardev. Hence all the pgoff mangling and re-mangling.
>>> Are they still unique struct files? Just without a fdno?
>> Yes, exactly.
> Not entirely, since dma-buf happened after drm chardev, so for that
> historical reason the underlying struct file is shared, since it's the
> drm chardev. But since that's per-device we don't have a problem in
> practice with different vm_ops, since those are also per-device. But
> yeah we could fish out some entirely hidden per-object struct file if
> that's required for some mm internal reasons.

Hui? Ok that is just the handling in i915, isn't it?

As far as I know we create an unique struct file for each DMA-buf.

Regards,
Christian.


> -Daniel
>
>>>> Hence why we'd like to be able to forward aliasing mappings and adjust the
>>>> file and pgoff, while hopefully everything keeps working. I thought this
>>>> would work, but Christian noticed it doesn't really.
>>> It seems reasonable to me that the dma buf should be the owner of the
>>> VMA, otherwise like you say, there is a big mess attaching the custom
>>> vma ops and what not to the proper dma buf.
>>>
>>> I don't see anything obviously against this in mmap_region() - why did
>>> Chritian notice it doesn't really work?
>> To clarify I think this might work.
>>
>> I just had the same "Is that legal?", "What about security?", etc..
>> questions you raised as well.
>>
>> It seems like a source of trouble so I thought better ask somebody more
>> familiar with that.
>>
>> Christian.
>>
>>> Jason
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>
>

