Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4463E7863A9
	for <lists+linux-media@lfdr.de>; Thu, 24 Aug 2023 00:53:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238791AbjHWWxZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Aug 2023 18:53:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238800AbjHWWxF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Aug 2023 18:53:05 -0400
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE7F5A8
        for <linux-media@vger.kernel.org>; Wed, 23 Aug 2023 15:53:03 -0700 (PDT)
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-68bed2c786eso256587b3a.0
        for <linux-media@vger.kernel.org>; Wed, 23 Aug 2023 15:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=davidwei-uk.20221208.gappssmtp.com; s=20221208; t=1692831183; x=1693435983;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SJ/s2EmqPuWzmlnRND54rc9ryTxh75/w4MTWA7NzKQM=;
        b=W/h+9fqynP796vzOzX5cmLOv64wPQRrNayfRyhZPMzWQZyYS5fv5yxMB7rgVKhcAg6
         EgAuhzwYpJ62a0mENcW/lNuqEMPqdby6+6OWIQnz0UKJ/sUIW+KGLji9MbbOZHHtLj7I
         cXrQQ2PKPibgQ4UXsleHOogOjpLMQsP5rgMO3FXlmHgF7+r5EqCAMEBU6/6ipeiaLeBS
         QOCcUQz2wYhtqlyyCSBKi90Mea79/HUCmsU1hIWHSWvl5An1PLYHvT38m21GkUbdt9QV
         sD9lLmJTkLT2aHvz3Dyiq9seSajwk9vplFoX0Bf91JgC6oWPpp4p2plvS7gtidww1xoG
         kTGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692831183; x=1693435983;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SJ/s2EmqPuWzmlnRND54rc9ryTxh75/w4MTWA7NzKQM=;
        b=cza3aeJGcLwgvZGorrpPAiDx+C/UNqpxfFgDss0hBzA3B7M7QFyOh1ljB2BE9s9o+5
         wTEpUFoSkLtxZEByYzdMAuSJkb7ZH15wlg87gdfZGIdotcY4TRJ8x5Cv/6nUvCzIo+Ug
         pRysSJjWX9K7LFS7X4Dk3J1Xih0jKvfRvzMuowWw2z7t8SY57fn3EdVZLimLoGGeheF7
         tDSZsia/qgV9XivDPIoT4DVw09k0H0TikA/aX3XyjIJwC47IgXdpsixMCYN6kI1xVd6F
         CAdP1wpz5okVJ83A1pMF6EgFkhWmXKwhhLPzWnhzwSXpMauVBG/CtswXQt1s1I41MNU5
         WWQA==
X-Gm-Message-State: AOJu0YwQ8kvE2b1NC4VP/Carh8BsTi8Xx6BSrklMs8C2sizrKiUbGpCn
        vK1Hskjb1NjIic/HYtqpfvtMpA==
X-Google-Smtp-Source: AGHT+IFc2FokU2VLaRNZT0xsXAi+/Iv/vVSz6ILE07xsMkOT83vrWIz++UyfDE7aQXrHa+PnqgAp4g==
X-Received: by 2002:a05:6a21:6d86:b0:14b:8b51:44b0 with SMTP id wl6-20020a056a216d8600b0014b8b5144b0mr3502513pzb.37.1692831183369;
        Wed, 23 Aug 2023 15:53:03 -0700 (PDT)
Received: from ?IPV6:2a03:83e0:1156:1:1cbd:da2b:a9f2:881? ([2620:10d:c090:500::5:1af5])
        by smtp.gmail.com with ESMTPSA id i26-20020aa787da000000b0068a6972ca0esm3562076pfo.106.2023.08.23.15.53.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Aug 2023 15:53:02 -0700 (PDT)
Message-ID: <1693f35a-b01d-f67c-fb4e-7311c153df4a@davidwei.uk>
Date:   Wed, 23 Aug 2023 15:52:59 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.14.0
Subject: Re: [RFC PATCH v2 00/11] Device Memory TCP
To:     Mina Almasry <almasrymina@google.com>,
        Pavel Begunkov <asml.silence@gmail.com>
Cc:     David Ahern <dsahern@kernel.org>, netdev@vger.kernel.org,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Jesper Dangaard Brouer <hawk@kernel.org>,
        Ilias Apalodimas <ilias.apalodimas@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Hari Ramakrishnan <rharix@google.com>,
        Dan Williams <dan.j.williams@intel.com>,
        Andy Lutomirski <luto@kernel.org>, stephen@networkplumber.org,
        sdf@google.com
References: <20230810015751.3297321-1-almasrymina@google.com>
 <7dc4427f-ee99-e401-9ff8-d554999e60ca@kernel.org>
 <7889b4f8-78d9-9a0a-e2cc-aae4ed8a80fd@gmail.com>
 <CAHS8izNZ1pJAFqa-3FPiUdMWEPE_md2vP1-6t-KPT6CPbO03+g@mail.gmail.com>
From:   David Wei <dw@davidwei.uk>
In-Reply-To: <CAHS8izNZ1pJAFqa-3FPiUdMWEPE_md2vP1-6t-KPT6CPbO03+g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 17/08/2023 15:18, Mina Almasry wrote:
> On Thu, Aug 17, 2023 at 11:04 AM Pavel Begunkov <asml.silence@gmail.com> wrote:
>>
>> On 8/14/23 02:12, David Ahern wrote:
>>> On 8/9/23 7:57 PM, Mina Almasry wrote:
>>>> Changes in RFC v2:
>>>> ------------------
>> ...
>>>> ** Test Setup
>>>>
>>>> Kernel: net-next with this RFC and memory provider API cherry-picked
>>>> locally.
>>>>
>>>> Hardware: Google Cloud A3 VMs.
>>>>
>>>> NIC: GVE with header split & RSS & flow steering support.
>>>
>>> This set seems to depend on Jakub's memory provider patches and a netdev
>>> driver change which is not included. For the testing mentioned here, you
>>> must have a tree + branch with all of the patches. Is it publicly available?
>>>
>>> It would be interesting to see how well (easy) this integrates with
>>> io_uring. Besides avoiding all of the syscalls for receiving the iov and
>>> releasing the buffers back to the pool, io_uring also brings in the
>>> ability to seed a page_pool with registered buffers which provides a
>>> means to get simpler Rx ZC for host memory.
>>
>> The patchset sounds pretty interesting. I've been working with David Wei
>> (CC'ing) on io_uring zc rx (prototype polishing stage) all that is old
>> similar approaches based on allocating an rx queue. It targets host
>> memory and device memory as an extra feature, uapi is different, lifetimes
>> are managed/bound to io_uring. Completions/buffers are returned to user via
>> a separate queue instead of cmsg, and pushed back granularly to the kernel
>> via another queue. I'll leave it to David to elaborate
>>
>> It sounds like we have space for collaboration here, if not merging then
>> reusing internals as much as we can, but we'd need to look into the
>> details deeper.
>>
> 
> I'm happy to look at your implementation and collaborate on something
> that works for both use cases. Feel free to share unpolished prototype
> so I can start having a general idea if possible.

Hi I'm David and I am working with Pavel on this. We will have something to
share with you on the mailing list before the end of the week.

I'm also preparing a submission for NetDev conf. I wonder if you and others at
Google plan to present there as well? If so, then we may want to coordinate our
submissions and talks (if accepted).

Please let me know this week, thanks!

> 
>>> Overall I like the intent and possibilities for extensions, but a lot of
>>> details are missing - perhaps some are answered by seeing an end-to-end
>>> implementation.
>>
>> --
>> Pavel Begunkov
> 
> 
> 
