Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CF5847834E9
	for <lists+linux-media@lfdr.de>; Mon, 21 Aug 2023 23:31:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229992AbjHUVbg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Aug 2023 17:31:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229912AbjHUVbf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Aug 2023 17:31:35 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BEB1D9
        for <linux-media@vger.kernel.org>; Mon, 21 Aug 2023 14:31:34 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D6A1163945
        for <linux-media@vger.kernel.org>; Mon, 21 Aug 2023 21:31:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49769C433C8;
        Mon, 21 Aug 2023 21:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692653493;
        bh=f+5vIkFIYt/8Mb/mujh4SFMIbfRUdpUkiEbCCcgQey4=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=uOH/c7Cm5Rj2zzi8T2hnq1fA5rHGQwcEWMLtruTqRSm1AdiYs5Or+9GUPkP7VDMuQ
         mC8ga+ui9bOtPFXioDSxy6ujay5hhhXjCL+aTqkUQsulxO0Imrb9PWjHaGFZRnKog0
         PfCGhMhzqVai5l8pqpsmFp4JbejO1V21MKno2vsM0DYI6blpniXULPz9UuDHD1QQ76
         MvtPPWd7AJp6lxrnkpUcQrU1ndyvX18oTWU7WArUpX32/greQt5nOgptXAbCy1hkiN
         tAmNqSqzj29Oj4ByPme63yri6omOAPwCiivBVLjoOHliMzD703yYrybgVZXpCqpE9q
         p9aVFUoDuj3vQ==
Date:   Mon, 21 Aug 2023 14:31:31 -0700
From:   Jakub Kicinski <kuba@kernel.org>
To:     Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Cc:     David Ahern <dsahern@kernel.org>,
        Jesper Dangaard Brouer <jbrouer@redhat.com>,
        brouer@redhat.com, Mina Almasry <almasrymina@google.com>,
        netdev@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Paolo Abeni <pabeni@redhat.com>,
        Jesper Dangaard Brouer <hawk@kernel.org>,
        Ilias Apalodimas <ilias.apalodimas@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Hari Ramakrishnan <rharix@google.com>,
        Dan Williams <dan.j.williams@intel.com>,
        Andy Lutomirski <luto@kernel.org>, stephen@networkplumber.org,
        sdf@google.com
Subject: Re: [RFC PATCH v2 06/11] page-pool: add device memory support
Message-ID: <20230821143131.47de8f8f@kernel.org>
In-Reply-To: <CAF=yD-+wXynvcntVccUAM2+PAumZbRE9E6f3MS6X6qkGrG7_Ow@mail.gmail.com>
References: <20230810015751.3297321-1-almasrymina@google.com>
        <20230810015751.3297321-7-almasrymina@google.com>
        <6adafb5d-0bc5-cb9a-5232-6836ab7e77e6@redhat.com>
        <CAF=yD-L0ajGVrexnOVvvhC-A7vw6XP9tq5T3HCDTjQMS0mXdTQ@mail.gmail.com>
        <8f4d276e-470d-6ce8-85d5-a6c08fa22147@redhat.com>
        <4f19143d-5975-05d4-3697-0218ed2881c6@kernel.org>
        <CAF=yD-+wXynvcntVccUAM2+PAumZbRE9E6f3MS6X6qkGrG7_Ow@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, 19 Aug 2023 12:12:16 -0400 Willem de Bruijn wrote:
> :-) For the record, there is a prior version that added a separate type.
> 
> I did not like the churn it brought and asked for this.

It does end up looking cleaner that I personally expected, FWIW.

> > Use of the LSB (or bits depending on alignment expectations) is a common
> > trick and already done in quite a few places in the networking stack.
> > This trick is essential to any realistic change here to incorporate gpu
> > memory; way too much code will have unnecessary churn without it.

We'll end up needing the LSB trick either way, right? The only question
is whether the "if" is part of page pool or the caller of page pool.

Having seen zctap I'm afraid if we push this out of pp every provider
will end up re-implementing page pool's recycling/caching functionality
:(

Maybe we need to "fork" the API? The device memory "ifs" are only needed
for data pages. Which means that we can retain a faster, "if-less" API
for headers and XDP. Or is that too much duplication?
