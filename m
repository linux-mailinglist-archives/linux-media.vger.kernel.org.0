Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 314927865DE
	for <lists+linux-media@lfdr.de>; Thu, 24 Aug 2023 05:36:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235523AbjHXDgL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Aug 2023 23:36:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239626AbjHXDfm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Aug 2023 23:35:42 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFAA310F0
        for <linux-media@vger.kernel.org>; Wed, 23 Aug 2023 20:35:40 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4D465619B5
        for <linux-media@vger.kernel.org>; Thu, 24 Aug 2023 03:35:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA5CEC433C8;
        Thu, 24 Aug 2023 03:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692848139;
        bh=sbR7aCuEj5eVbg6IJIuBs2lOlk3UoQ5wAtQPtb6P5QM=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=jdrlxtOciSK86Gccra7HgdQaq1QwQaIOy9bYBMypzD2OXPxtnudOXVnhXuK1985n8
         UAPnVephZah7ctxQWK0qv55AyqQNHsotbvD5W9/+CDoLhIXfMZsL3gaS9chfJLew7C
         uqbrT81BNoO1nfWEWunMj73EWmXxCYS2pTX/MaikwKnonlvDpbbCvrbeBpBqPoFqxj
         Qcf+p93aXmJfe1DjqP9nGzh0imagLIKRa2w5NWjsaq6CZ2okUFAkQdI6V6ZD4EESuH
         39OVMRQ7P0ZQzP7SQHJTwOVtquxT+/nKulB+/vQtftoNRKH/dTlF63SfdIZlS/qYFt
         aVM59Q8oQY+YA==
Message-ID: <84bd646f-0e83-63ff-7374-822ad328af0e@kernel.org>
Date:   Wed, 23 Aug 2023 20:35:38 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.14.0
Subject: Re: [RFC PATCH v2 00/11] Device Memory TCP
Content-Language: en-US
To:     David Wei <dw@davidwei.uk>, Mina Almasry <almasrymina@google.com>,
        Pavel Begunkov <asml.silence@gmail.com>
Cc:     netdev@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
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
 <1693f35a-b01d-f67c-fb4e-7311c153df4a@davidwei.uk>
From:   David Ahern <dsahern@kernel.org>
In-Reply-To: <1693f35a-b01d-f67c-fb4e-7311c153df4a@davidwei.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 8/23/23 3:52 PM, David Wei wrote:
> I'm also preparing a submission for NetDev conf. I wonder if you and others at
> Google plan to present there as well? If so, then we may want to coordinate our
> submissions and talks (if accepted).

personally, I see them as related but separate topics. Mina's proposal
as infra that io_uring builds on. Both are interesting and needed
discussions.
