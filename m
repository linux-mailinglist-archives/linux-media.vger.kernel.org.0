Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 52EEB77FD7B
	for <lists+linux-media@lfdr.de>; Thu, 17 Aug 2023 20:05:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354146AbjHQSEk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Aug 2023 14:04:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354139AbjHQSE1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Aug 2023 14:04:27 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AFE519A1;
        Thu, 17 Aug 2023 11:04:26 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-52889bc61b6so95376a12.0;
        Thu, 17 Aug 2023 11:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692295465; x=1692900265;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UxvCrw/069KltoPZkQIYth4BBOJdgJ8sNaI0SyyMDnM=;
        b=LlNp+0S95wa2DHWIhxZumDFmianXTCRMJjOitpuiuyKYp0AAZb4zHQT8ZXqFwgTr3M
         TAcGjKr7A/7LbmvxCY8pqvLWzcywa017/uoZ3dhPRVfKQBpxe2Rx4JQVzmQMUv/lluNQ
         8t/PjmueudVyVsA4+vkTHFn9Wg1EnP9GTqy6bCt1AIDvGSTkLDX8uzmkFWqf6cdFJtPf
         KRm02KV0hef2hr/xa3gZ+j3wmJGjbj9dQaAlasQmWzrxH3IJ5JCWJI2/kGrxl9CivxpV
         AvKdmfKLPT+4igVvanygECsKarn9iz35Qwe/ar6m/vTrTtCGRNAG2OY42t5fatoyv1PR
         bXLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692295465; x=1692900265;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UxvCrw/069KltoPZkQIYth4BBOJdgJ8sNaI0SyyMDnM=;
        b=JhsFPpmYOuj4rYlE4N7b7MtGbrs0UOyyoUx/1bTrk8QwjNM8sQQvhEKDUnCtLIFRjP
         dY6N+XWk4gTdEIs5/N2eUTHwlH/MIVHfJPpAhDoeuZaZxS4Gcb8IKUavge67hSu9oRW6
         d1FuIXUx9mEXgnHnUUHidq316zlLklnxKsZ3fJq821CGg7hU7XQBSOhJXBeCaoHCRQ+s
         xYknktqvERx6kD+ctmMhGQMFRh//7qX4SR5IKGDWkg6HModTy0OjDgAYKUUX5JvOHT+e
         /+Ngdx+JgorUFfFBHh8Wg+phL47o6IyrFAMVabF1ZKz4hDXWWJAhGYBzSWWs8YjtCCwL
         nRmg==
X-Gm-Message-State: AOJu0YzyqJMlqryaVNhyuAu+NLcsWYOFRdj4Scdnyu72wBTPT9C4MKKr
        vAk5H1TEcRxq6bAYA/GiHSk=
X-Google-Smtp-Source: AGHT+IG0Woy+0POxg4sPHGGIdfrc456TaHlsCCBtEoEEY8ldQE+9Fdkgkm7V8IaZV79Aen7WtSv5Lw==
X-Received: by 2002:a17:906:8a72:b0:99c:6692:7f76 with SMTP id hy18-20020a1709068a7200b0099c66927f76mr153247ejc.16.1692295464443;
        Thu, 17 Aug 2023 11:04:24 -0700 (PDT)
Received: from [192.168.8.100] ([148.252.129.159])
        by smtp.gmail.com with ESMTPSA id h6-20020a1709063c0600b0099b921de301sm27628ejg.159.2023.08.17.11.04.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Aug 2023 11:04:23 -0700 (PDT)
Message-ID: <7889b4f8-78d9-9a0a-e2cc-aae4ed8a80fd@gmail.com>
Date:   Thu, 17 Aug 2023 19:00:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 00/11] Device Memory TCP
Content-Language: en-US
To:     David Ahern <dsahern@kernel.org>,
        Mina Almasry <almasrymina@google.com>, netdev@vger.kernel.org,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc:     "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Jesper Dangaard Brouer <hawk@kernel.org>,
        Ilias Apalodimas <ilias.apalodimas@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Hari Ramakrishnan <rharix@google.com>,
        Dan Williams <dan.j.williams@intel.com>,
        Andy Lutomirski <luto@kernel.org>, stephen@networkplumber.org,
        sdf@google.com, David Wei <dw@davidwei.uk>
References: <20230810015751.3297321-1-almasrymina@google.com>
 <7dc4427f-ee99-e401-9ff8-d554999e60ca@kernel.org>
From:   Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <7dc4427f-ee99-e401-9ff8-d554999e60ca@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 8/14/23 02:12, David Ahern wrote:
> On 8/9/23 7:57 PM, Mina Almasry wrote:
>> Changes in RFC v2:
>> ------------------
...
>> ** Test Setup
>>
>> Kernel: net-next with this RFC and memory provider API cherry-picked
>> locally.
>>
>> Hardware: Google Cloud A3 VMs.
>>
>> NIC: GVE with header split & RSS & flow steering support.
> 
> This set seems to depend on Jakub's memory provider patches and a netdev
> driver change which is not included. For the testing mentioned here, you
> must have a tree + branch with all of the patches. Is it publicly available?
> 
> It would be interesting to see how well (easy) this integrates with
> io_uring. Besides avoiding all of the syscalls for receiving the iov and
> releasing the buffers back to the pool, io_uring also brings in the
> ability to seed a page_pool with registered buffers which provides a
> means to get simpler Rx ZC for host memory.

The patchset sounds pretty interesting. I've been working with David Wei
(CC'ing) on io_uring zc rx (prototype polishing stage) all that is old
similar approaches based on allocating an rx queue. It targets host
memory and device memory as an extra feature, uapi is different, lifetimes
are managed/bound to io_uring. Completions/buffers are returned to user via
a separate queue instead of cmsg, and pushed back granularly to the kernel
via another queue. I'll leave it to David to elaborate

It sounds like we have space for collaboration here, if not merging then
reusing internals as much as we can, but we'd need to look into the
details deeper.

> Overall I like the intent and possibilities for extensions, but a lot of
> details are missing - perhaps some are answered by seeing an end-to-end
> implementation.

-- 
Pavel Begunkov
