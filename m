Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1D6D42F18C
	for <lists+linux-media@lfdr.de>; Fri, 15 Oct 2021 14:57:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236523AbhJOM7K (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Oct 2021 08:59:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234376AbhJOM7K (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Oct 2021 08:59:10 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 951E0C061570
        for <linux-media@vger.kernel.org>; Fri, 15 Oct 2021 05:57:03 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id o20so26428761wro.3
        for <linux-media@vger.kernel.org>; Fri, 15 Oct 2021 05:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=K7gsPVJQCeXWBCpGF1GEldNyINPbSWQ/6+B1Ys661c0=;
        b=OQSqAFiO1RiBCo88BhlVSFgFriYtTV8A8ce2Y/2Qi4T2reSk69E8oMuIdy2aRraIoG
         ZeBtE3v4/0DXAQ6wMRifwwM1usHHRD9DcqG3nmq7ffyQpX5eCXZcj+8yHYzv7r9aSwok
         69VXp2VyL5TiT6VILFZfy7lZ63MtE8yQK8CdKI0ksf8CWgWLRk9I/s5jh+GMJFP0DYrm
         xxSb/xaJqB9rXDC3kObrNN9xZezArb34+l4DB51VJbMvlNBABGTIsA9wked1Yb6TjYaf
         yjpdntpvp1y2nPMPn/zX4mqIalekeT6rqeFL2NaBCCJySioU3l2OUClL/zAxPYtTU6Jz
         Hb7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=K7gsPVJQCeXWBCpGF1GEldNyINPbSWQ/6+B1Ys661c0=;
        b=PfrpPSU8Mx3MhF0d30G5jLkcHeknt/VDzFkkCjA4g0+1BAUDX/QsyaXTt7gBTC4EZw
         3WzgdGDyMrBhuZwwbV+DPbUEmKiiWOYpw6RGWh3HxIyLu7yyBcI5hcFckYlzMTzBrMEe
         qMoIt7LOCwnHYqXM6FbO/KAk22Ht77jZYyl8gt0SmugCiiIH43bjgY6xym+gUPkbnNKM
         TB47REmNE87243MDMdU41PkLerV9OnfKq+YVxy7EooFLvjcCUyQ8mhdeahDJkeFhFdwx
         T3SXyfe/ERHFfzCsYi15NXpDFdIAsgkMGyOiPL+HPtIf9upaxW6v9qsaLD+lB+lXQkjR
         14Kw==
X-Gm-Message-State: AOAM531sl+DiyLitqHiXofdQlg9eWfFsuzxYju7Xn9H0k0B1rdOkeU+Q
        Ubn/1//BCSjDEZkVVMCzydNyJ12qd4E=
X-Google-Smtp-Source: ABdhPJwgXwn4QWqlTUa6s1tP3zFbUDUMWqnUk/1eYpk4nau0DzaixRIZbgKH9ZBimALoiJg5ZK+kWg==
X-Received: by 2002:a5d:59ae:: with SMTP id p14mr14312983wrr.76.1634302622203;
        Fri, 15 Oct 2021 05:57:02 -0700 (PDT)
Received: from ?IPv6:2a02:8109:333f:edd8:ffec:a915:d03e:f264? ([2a02:8109:333f:edd8:ffec:a915:d03e:f264])
        by smtp.gmail.com with ESMTPSA id w5sm4767366wra.87.2021.10.15.05.57.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Oct 2021 05:57:01 -0700 (PDT)
Subject: Re: [Linaro-mm-sig] [PATCH 2/2] dma-buf: Fix dma_resv_test_signaled.
To:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
        dri-devel@lists.freedesktop.org
Cc:     linaro-mm-sig@lists.linaro.org, intel-gfx@lists.freedesktop.org,
        linux-media@vger.kernel.org
References: <20211015115720.79958-1-maarten.lankhorst@linux.intel.com>
 <20211015115720.79958-3-maarten.lankhorst@linux.intel.com>
 <ebf0714c-2f49-a0ad-1861-16394ade468d@amd.com>
 <9b7e43bb-e175-0aff-2cc1-cc10236fe8e5@linux.intel.com>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <06fa85f5-3664-4da4-bde8-6d7d2f199251@gmail.com>
Date:   Fri, 15 Oct 2021 14:56:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <9b7e43bb-e175-0aff-2cc1-cc10236fe8e5@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



Am 15.10.21 um 14:52 schrieb Maarten Lankhorst:
> Op 15-10-2021 om 14:07 schreef Christian König:
>> Am 15.10.21 um 13:57 schrieb Maarten Lankhorst:
>>> Commit 7fa828cb9265 ("dma-buf: use new iterator in dma_resv_test_signaled")
>>> accidentally forgot to test whether the dma-buf is actually signaled, breaking
>>> pretty much everything depending on it.
>> NAK, the dma_resv_for_each_fence_unlocked() returns only unsignaled fences. So the code is correct as it is.
> That seems like it might cause some unexpected behavior when that function is called with one of the fence locks held, if it calls dma_fence_signal().
>
> Could it be changed to only test the signaled bit, in which case this patch would still be useful?

That's exactly what I suggested as well, but Daniel was against that 
because of concerns around barriers.

> Or at least add some lockdep annotations, that fence->lock might be taken. So any hangs would at least be easy to spot with lockdep.

That should be trivial doable.

Christian.

>
> ~Maarten
>
> _______________________________________________
> Linaro-mm-sig mailing list
> Linaro-mm-sig@lists.linaro.org
> https://lists.linaro.org/mailman/listinfo/linaro-mm-sig

