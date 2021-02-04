Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 244D030EDD1
	for <lists+linux-media@lfdr.de>; Thu,  4 Feb 2021 08:54:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234639AbhBDHyB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Feb 2021 02:54:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232487AbhBDHyA (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 4 Feb 2021 02:54:00 -0500
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFCB3C0613D6;
        Wed,  3 Feb 2021 23:53:19 -0800 (PST)
Received: by mail-ej1-x629.google.com with SMTP id w1so3618393ejf.11;
        Wed, 03 Feb 2021 23:53:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=J5U7ZYjn0rPv+kixT24fufumtWsmbJ865vX1gjaUF0g=;
        b=KswjM1SUYJoTfbNOQjudNoUn3epf+FgmwInfQV6P8D1wCRR3k/JPEqKz0WMeFwWl2u
         EtYRsJ0ITHV+Rn4hVd6MrPfmX+j6SEGOH7q1mPrs7m2PkRZzag7JCDeWJNhtFqzZSjxX
         bt3bMmVwLRMbqoNMBP69aDKbprQaMM07TtRNJGxLfEdSbFQgAhulGu5zstTSnL/PouTV
         z5JaLL6FOgYf14roRI0afyz3a4I8Hv4YWhX/oYfesI/sm22W0jTpjrsXSWYC1Rf+KH60
         /ApBI5MIIDz2fpAwj034PDrnzqqtBL1JXloPTCkxb7LFOusGN5A7z2ao80vvQNtjE5lO
         5Jzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:reply-to:subject:to:cc:references:from
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-transfer-encoding:content-language;
        bh=J5U7ZYjn0rPv+kixT24fufumtWsmbJ865vX1gjaUF0g=;
        b=Sxh/kL4fjkHQZTRW7YzeDUU9OzSeRPJDvwjr3mGqAiJSISA4N1e5D+rTpi2AmRbRYu
         g1mR+EL/mNdZ/gVztNwtMOxQTa3ZsrslufD9xgZTXByWOjndlAIq//SB9j18i8J8r1sA
         5jIUjzIC51VF9l5+tQhYIXINdCaH3wvzlB7yZpaKYmM1uHbXaJqVhvBJcyW7ZPCrfNaO
         lpxBA1wLyiFK9sQREkJFsY1+Ku3kIwa/8X4dwJB7EnkvFh6xd9k6yFOZw5Uz8Pl/AyU2
         V6GYh8nSxf57+L3eIRbGEsBAx8zaz8TNYSMOHDRt+v9E6gDYo0Gd6dWy5Klx+Rw9cwYA
         Iz2Q==
X-Gm-Message-State: AOAM531AhPZlVb/dmiYDGmpEP+itGeMgHXz9+oCedDhStbJcKq4+D/1G
        PWBfxoKLiofhP9ev05lh1BtfLp2HYb0=
X-Google-Smtp-Source: ABdhPJxmOioRMuyDm1Puy9HUCj+qibrAoLklBS9/vQschT6m+hlxaFoBzExrk2acsmkXA8jSOENf/g==
X-Received: by 2002:a17:907:9810:: with SMTP id ji16mr6686661ejc.394.1612425198446;
        Wed, 03 Feb 2021 23:53:18 -0800 (PST)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7? ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
        by smtp.gmail.com with ESMTPSA id p16sm2010968edw.44.2021.02.03.23.53.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Feb 2021 23:53:17 -0800 (PST)
Reply-To: christian.koenig@amd.com
Subject: Re: [Linaro-mm-sig] [PATCH 1/2] mm: replace BUG_ON in vm_insert_page
 with a return of an error
To:     Suren Baghdasaryan <surenb@google.com>,
        Daniel Vetter <daniel.vetter@ffwll.ch>
Cc:     Christoph Hellwig <hch@infradead.org>,
        Sandeep Patil <sspatil@google.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Linux MM <linux-mm@kvack.org>,
        Robin Murphy <robin.murphy@arm.com>,
        James Jones <jajones@nvidia.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Matthew Wilcox <willy@infradead.org>,
        Brian Starkey <Brian.Starkey@arm.com>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>, Minchan Kim <minchan@kernel.org>,
        John Stultz <john.stultz@linaro.org>,
        Liam Mark <lmark@codeaurora.org>,
        Chris Goldsworthy <cgoldswo@codeaurora.org>,
        Hridya Valsaraju <hridya@google.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Android Kernel Team <kernel-team@android.com>,
        =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>
References: <20210203003134.2422308-1-surenb@google.com>
 <20210203015553.GX308988@casper.infradead.org>
 <CAKMK7uHnNdjOYX5Rhj=uGMz7hSz12JhgkZJCfiqgkpjXnMfL4A@mail.gmail.com>
 <CAJuCfpG4GkVbeW=bB+Qrm5GPrZAwg0_rmyG05iwQmL7GrWAYHw@mail.gmail.com>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <96fb8d14-fd9d-c21d-fa9d-81748421c6d3@gmail.com>
Date:   Thu, 4 Feb 2021 08:53:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAJuCfpG4GkVbeW=bB+Qrm5GPrZAwg0_rmyG05iwQmL7GrWAYHw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 03.02.21 um 21:20 schrieb Suren Baghdasaryan:
> [SNIP]
> If there is a reason to set this flag other than historical use of
> carveout memory then we wanted to catch such cases and fix the drivers
> that moved to using dmabuf heaps. However maybe there are other
> reasons and if so I would be very grateful if someone could explain
> them. That would help me to come up with a better solution.

Well one major reason for this is to prevent accounting of DMA-buf pages.

So you are going in circles here and trying to circumvent an intentional 
behavior.

Daniel is right that this is the completely wrong approach and we need 
to take a step back and think about it on a higher level.

Going to replay to his mail as well.

Regards,
Christian.
