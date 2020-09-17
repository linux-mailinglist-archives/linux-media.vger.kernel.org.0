Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8BC3B26DB36
	for <lists+linux-media@lfdr.de>; Thu, 17 Sep 2020 14:12:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726874AbgIQMLs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Sep 2020 08:11:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726740AbgIQMFC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Sep 2020 08:05:02 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1826DC06174A;
        Thu, 17 Sep 2020 05:03:56 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id j11so2973125ejk.0;
        Thu, 17 Sep 2020 05:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=4IJg+4CZG5b0foFWn90FskEpijf8EknkkB/FydWSevk=;
        b=SHAudCosEoaJOlkj1OVOjFQm0Y2jdQloxoQK1u5ghFaOZNsqVQcaReGEzOO22+/PoG
         e+zmIJbfaxRDJn6F1W66FvvVqDnIsGGL6MnPxsZh8q19Odhf0uffGcPV6JlO9CSgYMj5
         QkbbrYxjVMjJru3LbVs2G9zuGLrpFenz8DlODuTJz87bSSJz05S7gbQDzrFDLzCPv/kp
         GJP8rX03ZnSiOdHNJDp+lHa+bInML9gW2trO21lhdxxYzkvRIn4jvoVv1FHWfSG5mPzM
         jBvCQfiVTBMNHksmujp+0ZgfYbsewbmHSE9bb1GJlNVIVWAigb+EHj3/Od4EcoLFVcPO
         dmXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:reply-to:subject:to:cc:references:from
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-transfer-encoding:content-language;
        bh=4IJg+4CZG5b0foFWn90FskEpijf8EknkkB/FydWSevk=;
        b=DjGvivlZuEOrCd6fLM7wcsX7oCPeC6HAy4Tps7VRcAWxKdlt7uMVi/6wgZsa/3FL0i
         knknYh9Lw8PnCJqpK8YN4S7mSXhctzM2a2fqCsIRC+E/l5LhuXMEahefFn+bra6A5Fte
         maqJFwJaFR7oQgUJoQB+sBfj/5zuWJA5t6QESE65KZgKR2kosGHhfcOkNdDsoz0tU57e
         5K7E63hwDYM8lLABfrpZro4x3fPrFxikXbbKB5H5hgkRD7KXP95gFQwKy6YGxKKUq2ba
         XUDEORhQNy0ciw55EuhS8Qf+n54HTO25/YquTGZP3Tn254D3USPGNwsBgep2n6cUm+pS
         3tMw==
X-Gm-Message-State: AOAM531T4InK8RYmyBS6QhKEg6xByA15uyUPp4ITMxOPgsLyKJAQjkoP
        TD32VCz/SdQVATRyGAY5hLqmfcgwXSM=
X-Google-Smtp-Source: ABdhPJxQ/GtwTry9ihPN5KEPP052Fm0uzzwbkUZn/afLWALJ8NH4ADJ6T2No/Zdu/rqor4uEEJWmkA==
X-Received: by 2002:a17:906:d14e:: with SMTP id br14mr28329723ejb.299.1600344233035;
        Thu, 17 Sep 2020 05:03:53 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7? ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
        by smtp.gmail.com with ESMTPSA id o3sm16325516edt.79.2020.09.17.05.03.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2020 05:03:50 -0700 (PDT)
Reply-To: christian.koenig@amd.com
Subject: Re: [Linaro-mm-sig] Changing vma->vm_file in dma_buf_mmap()
To:     Jason Gunthorpe <jgg@ziepe.ca>, Daniel Vetter <daniel@ffwll.ch>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>, Linux MM <linux-mm@kvack.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>
References: <20200914140632.GD1221970@ziepe.ca>
 <9302e4e0-0ff0-8b00-ada1-85feefb49e88@gmail.com>
 <20200916095359.GD438822@phenom.ffwll.local> <20200916140710.GA8409@ziepe.ca>
 <8db2474f-ecb7-0e17-5f5b-145708fe44d5@amd.com>
 <CAKMK7uFdwrT3HACPh3ADAKvhXJ-Hf3dExZmgJVAQ1KKjSai_0w@mail.gmail.com>
 <aa953b09-53b1-104b-dc4b-156ad8a75e62@gmail.com>
 <CAKMK7uHJNRzCJfWVSmMrLmGXE0qo+OCXiMd+zPTOkeG2pnVrmQ@mail.gmail.com>
 <8d8693db-a3f0-4f5f-3e32-57d23ca620f8@amd.com>
 <CAKMK7uE=UqZD3PVC8XZAXrgGH-VsUF_-YQD3MLV8KK1kpxO4yQ@mail.gmail.com>
 <20200917113110.GE8409@ziepe.ca>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <6fd74b84-959c-8b3b-c27b-e9fbf66396c7@gmail.com>
Date:   Thu, 17 Sep 2020 14:03:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200917113110.GE8409@ziepe.ca>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 17.09.20 um 13:31 schrieb Jason Gunthorpe:
> On Thu, Sep 17, 2020 at 10:09:12AM +0200, Daniel Vetter wrote:
>
>> Yeah, but it doesn't work when forwarding from the drm chardev to the
>> dma-buf on the importer side, since you'd need a ton of different
>> address spaces. And you still rely on the core code picking up your
>> pgoff mangling, which feels about as risky to me as the vma file
>> pointer wrangling - if it's not consistently applied the reverse map
>> is toast and unmap_mapping_range doesn't work correctly for our needs.
> I would think the pgoff has to be translated at the same time the
> vm->vm_file is changed?
>
> The owner of the dma_buf should have one virtual address space and FD,
> all its dma bufs should be linked to it, and all pgoffs translated to
> that space.

Yeah, that is exactly like amdgpu is doing it.

Going to document that somehow when I'm done with TTM cleanups.

Christian.

>
> Jason
> _______________________________________________
> Linaro-mm-sig mailing list
> Linaro-mm-sig@lists.linaro.org
> https://lists.linaro.org/mailman/listinfo/linaro-mm-sig

