Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7576E28AFC8
	for <lists+linux-media@lfdr.de>; Mon, 12 Oct 2020 10:13:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729055AbgJLINS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Oct 2020 04:13:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728956AbgJLINR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Oct 2020 04:13:17 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40CA6C0613CE;
        Mon, 12 Oct 2020 01:13:17 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id u8so21984253ejg.1;
        Mon, 12 Oct 2020 01:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=ISkqozpSXsD9a8Oh/2Mwcyva57KxR87dIuzCIf+AzK4=;
        b=vLxLC2ao0L4Ivfe+BPwXRED7H586V1sSXEIbMF9LfxQwxO+Zj65QHw9YpnzzpNF+5s
         pe0SgL866UCiUr5PMln2kM/rXsQAiQwxm9xqBa1r/w5BcshC+iOmiozfO7Z4u6AwQfAz
         Vfx3PqBr4wY4D9HosTE8Wp76eUyQkFEjvjbUBNXO9p/9oGzOrrNit+i1xQ8rB5QbDjQs
         F9Ihv4Bw7KG4xGNRxT0nbSDmdL/1EJi1xqf/gG4FNU+OUu4iG+9rU7nADfRhvp4+8AAf
         HcdDZZMKxxCfFS+tSPVctDoJoYUswL6SPs0UcCi3bxYvLZGbno5o1HYN8rV+tCw9Xic+
         UV3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:reply-to:subject:to:cc:references:from
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-transfer-encoding:content-language;
        bh=ISkqozpSXsD9a8Oh/2Mwcyva57KxR87dIuzCIf+AzK4=;
        b=SN0wvtpqevJXriN9ZTkbSGFlqaZMvIyfOLM1sFttaRoSxXuKBPS7fMtbgVpOixb3Ii
         32MQqoI5xRq7KMvClsix5DqmK2EcKBwg/TwQXP+rAlARJx0b2PEo+Y7dZvXeKWrtLqTA
         AH1G4AM78QVF6q08BFKZylWZTxyKZ+rJfx5dIyAsqlQ65heUajn8D8YmSCzb3LRbpRjy
         Er8OUk6hEmpouax1PHJ/rfE/GwaXvzRvZMgICCxNdXImR11H9FTcsMKJDVaiJZVFBCNM
         IqL7VUyTChOKBVqKcI1uJzBBXZFJbTZBv/G4NxA24UawWtfs0Pd+BeyNWvX9g31vLqxU
         STaA==
X-Gm-Message-State: AOAM531LLyo51G3OpftYA3a2H0QaKmbiMKVNt6NsoUHr6KaBDmV8gSNL
        O/j5f8Hg/fM+IYX/XVbLAxg=
X-Google-Smtp-Source: ABdhPJyESr76MyJXr7Jw9FX0sBn+vlDp7RU85Q8VgP3nIl7qNvty4ksx+a/gWI8+0WMbFKdXmfr7Ow==
X-Received: by 2002:a17:906:4e06:: with SMTP id z6mr28073702eju.370.1602490395918;
        Mon, 12 Oct 2020 01:13:15 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7? ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
        by smtp.gmail.com with ESMTPSA id p16sm10218325ejz.103.2020.10.12.01.13.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2020 01:13:15 -0700 (PDT)
Reply-To: christian.koenig@amd.com
Subject: Re: [PATCH 1/6] mm: mmap: fix fput in error path
To:     Jason Gunthorpe <jgg@ziepe.ca>,
        Andrew Morton <akpm@linux-foundation.org>
Cc:     linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, chris@chris-wilson.co.uk,
        airlied@redhat.com, daniel@ffwll.ch, sumit.semwal@linaro.org,
        willy@infradead.org, jhubbard@nvidia.com,
        Miaohe Lin <linmiaohe@huawei.com>
References: <20201009150342.1979-1-christian.koenig@amd.com>
 <20201009150420.450833e3830b9d39a2385dd9@linux-foundation.org>
 <20201009222509.GC5177@ziepe.ca>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <666ef8f3-6299-3c0b-6ebb-04e957a115a1@gmail.com>
Date:   Mon, 12 Oct 2020 10:13:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201009222509.GC5177@ziepe.ca>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 10.10.20 um 00:25 schrieb Jason Gunthorpe:
> On Fri, Oct 09, 2020 at 03:04:20PM -0700, Andrew Morton wrote:
>> On Fri,  9 Oct 2020 17:03:37 +0200 "Christian König" <ckoenig.leichtzumerken@gmail.com> wrote:
>>
>>> Patch "495c10cc1c0c CHROMIUM: dma-buf: restore args..."
>>> adds a workaround for a bug in mmap_region.
>>>
>>> As the comment states ->mmap() callback can change
>>> vma->vm_file and so we might call fput() on the wrong file.
>>>
>>> Revert the workaround and proper fix this in mmap_region.
>>>
>> Doesn't this patch series address the same thing as
>> https://lkml.kernel.org/r/20200916090733.31427-1-linmiaohe@huawei.com?
> Same basic issue, looks like both of these patches should be combined
> to plug it fully.

Yes, agree completely.

It's a different error path, but we need to fix both occasions.

Christian.

>
> Jason

