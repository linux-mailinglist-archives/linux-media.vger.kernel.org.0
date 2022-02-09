Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E8E64AF44E
	for <lists+linux-media@lfdr.de>; Wed,  9 Feb 2022 15:42:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235168AbiBIOmt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Feb 2022 09:42:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235156AbiBIOms (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Feb 2022 09:42:48 -0500
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B13A7C0613CA
        for <linux-media@vger.kernel.org>; Wed,  9 Feb 2022 06:42:50 -0800 (PST)
Received: by mail-ed1-x52e.google.com with SMTP id cn6so5517970edb.5
        for <linux-media@vger.kernel.org>; Wed, 09 Feb 2022 06:42:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=LQZSYMviOXU46IrK/WW3TYqqEQdPNThwvuJaW7Mm9Nc=;
        b=VSO0NVVWJlw32DWMYNVjoy8yhHXWr2O2kXDw+INIS3xZ6yOUFSQexAXcjb5QY689vl
         QGluNByx9hJEioPOvvovKESE+1sFve9DQ1DrNp4zlq55Uq82+0C90vrFws0clXbe4ft8
         0BfDxrw/nS3YP6fxu94lr9FREDTUsJ5VeKalnC3tyc+MEw0L7v+G5RxZH+CbstCEtR5g
         5qMWWrzsQE4UrLDWnPTz2+dLJVebCEf/3rX8f06MSzP64QmnxY3zFjufttf4owmvQAro
         Rlr/KZcFPb3mlbcyDd9sNo2EsCpSAx1GeEvxVABW5z/SuJUS6loQuT1au5UhehWQ5J1t
         +TCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=LQZSYMviOXU46IrK/WW3TYqqEQdPNThwvuJaW7Mm9Nc=;
        b=Eega6ZF4YqzWIf9atggf2AqWlT0B8zB+SIi6d4fairHrVzEZniQcdszxtQ8hscOuWV
         FANFMzAG6rfbeMawlyTMKuKJ4++wkrfzKdWA1p+Yyc6+iu7GA/pVn9Hoef94Zj0VkgA0
         DMpSxAX0fG9QQlSeuyTiDgFvvX90orW1E/P77UaRATP45fo9gD0XxD997IXAydJWkfw9
         kG8g9ErMbK3SieCe7AWoPkQU+wV8+uowyyExpJi6XjFQZvEpU+xnocbbweU8WX0Oe4S+
         2xpEgp3lYQbhIixnlElwivExvx/AP387lz0pHdF0wGakGOWwAxLzSYSYwT3nyhKuA8H+
         7qGA==
X-Gm-Message-State: AOAM5310xiLIH4mFuyzcc/36iJjecehJPfk10bacUrT4vvzTqnhyO1jM
        /c/riq8EXn+w8T/e0nReR48=
X-Google-Smtp-Source: ABdhPJyizq11JRyFdw+580WCuNoex9CCHlTUfmQPX0ns6bRJjIP7UVCkVtsFpM6wRyUYfhDQqOneNA==
X-Received: by 2002:a05:6402:60f:: with SMTP id n15mr2779654edv.316.1644417769244;
        Wed, 09 Feb 2022 06:42:49 -0800 (PST)
Received: from ?IPV6:2a02:908:1252:fb60:575:1502:6989:b456? ([2a02:908:1252:fb60:575:1502:6989:b456])
        by smtp.gmail.com with ESMTPSA id ee23sm6369953edb.19.2022.02.09.06.42.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Feb 2022 06:42:48 -0800 (PST)
Message-ID: <97918c8e-6b88-ade5-0dd5-6de01f4f41c3@gmail.com>
Date:   Wed, 9 Feb 2022 15:42:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 3/6] dma-buf: Warn about dma_fence_chain container rules
 v2
Content-Language: en-US
To:     =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= 
        <thomas.hellstrom@linux.intel.com>, sumit.semwal@linaro.org,
        daniel.vetter@ffwll.ch, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
References: <20220204100429.2049-1-christian.koenig@amd.com>
 <20220204100429.2049-4-christian.koenig@amd.com>
 <b384ad5f76da0009dd49965769bcddbc0395111a.camel@linux.intel.com>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <b384ad5f76da0009dd49965769bcddbc0395111a.camel@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 09.02.22 um 15:02 schrieb Thomas Hellström:
> On Fri, 2022-02-04 at 11:04 +0100, Christian König wrote:
>> Chaining of dma_fence_chain objects is only allowed through the prev
>> fence and not through the contained fence.
>>
>> Warn about that when we create a dma_fence_chain.
>>
>> v2: fix comment style
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>> Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> It looks like this blows up in generic drm code...
>
> https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_22201/shard-skl10/igt@syncobj_timeline@transfer-timeline-point.html

Thanks for the notice.  Going to take a look.

I'm wondering why the last CI report I've got didn't showed that.

Christian.

>
> /Thomas
>
>

