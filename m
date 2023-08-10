Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 25D97777DB8
	for <lists+linux-media@lfdr.de>; Thu, 10 Aug 2023 18:09:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233002AbjHJQI7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Aug 2023 12:08:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236612AbjHJQIo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Aug 2023 12:08:44 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0502F46AE
        for <linux-media@vger.kernel.org>; Thu, 10 Aug 2023 09:07:26 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1bbc64f9a91so9669335ad.0
        for <linux-media@vger.kernel.org>; Thu, 10 Aug 2023 09:07:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1691683619; x=1692288419;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Bkl7A8nIZ4dLxOcY6GpHpFtX+viPmkaZX3wq6XxPfxg=;
        b=JL9PB5YetmewwFt4dDybaPdzwmRNljhoEiaIvSyobmvxBnbUSrib0/OLZrInyO+/1c
         WxEb27kvGab0U19ny3qjovhvp4KPMhmrM2Jqtl/Sybe5g/zIKFpOOF62rMgIkHHf4UbB
         VKhhEHQLs4ges87nYRT9ch0zp7xExv1gT874o21HXlD6fq1w4HfWb5w6aIB4k6n17BS6
         sHwCkyxjqIF/8NI5kQBcfC3SRO7xYSESm9CyKct1e2y0kTPD1OEFcZVOieF6bi0mgKVN
         nkDDYLgPl8A0tzyRQn+5DPmETmTTMEvWVvuuyb3zFt2rluHyUxJ0uPc6WGGARgxW4JyZ
         JPcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691683619; x=1692288419;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Bkl7A8nIZ4dLxOcY6GpHpFtX+viPmkaZX3wq6XxPfxg=;
        b=ZdUm5nRQJ1cELDoANw06gbx2hyf6KUrV4Kf5H0pznR7hsBgRwVrJaUgB2ijAvBRkI0
         egVYm946vni+9MsxeeMCnY2NYBevGgFb9AFilHcHfdvjxMW6pYHwo4MMR1i5neiisCAx
         btWW4rep9I0VQAU4ZiMHkQhdm9F2nnqCDFBLE0Y/UoQt1yZLpS6G4uO4bZ1a24pvCKZX
         bcGIb+EBLsNUNwXZxklJmtPtq+rrjtGmILg5yIrkvA69RoO5anNQM1EfSTRwDcJbmsnN
         9O9+us+MxCsQB7YSLKZB1rJ7cflXmQdXvc04n5dxQcxxfQdX9f83YUJVuUvtwaRccQ++
         cMQg==
X-Gm-Message-State: AOJu0YwHQfT8UC4NjOZHcQsXyGWqePrcK5QuMWnk1ebblGGvyMbsXNFI
        cthXOk35IPImqV1d7DCv+jlstA==
X-Google-Smtp-Source: AGHT+IF4hyqWBe3EdaSGly2P8UCzQ7nDhJe1xj0NdzWbJpW3WsvHw4tGYB8oXfKwdLOgDTGQE6RMzw==
X-Received: by 2002:a17:903:182:b0:1bb:ed65:5e0d with SMTP id z2-20020a170903018200b001bbed655e0dmr3656999plg.56.1691683619216;
        Thu, 10 Aug 2023 09:06:59 -0700 (PDT)
Received: from ziepe.ca ([206.223.160.26])
        by smtp.gmail.com with ESMTPSA id j16-20020a170902da9000b001b8a1a25e6asm1955107plx.128.2023.08.10.09.06.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Aug 2023 09:06:57 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
        (envelope-from <jgg@ziepe.ca>)
        id 1qU8Bc-005Glp-95;
        Thu, 10 Aug 2023 13:06:56 -0300
Date:   Thu, 10 Aug 2023 13:06:56 -0300
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc:     Mina Almasry <almasrymina@google.com>, netdev@vger.kernel.org,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Jesper Dangaard Brouer <hawk@kernel.org>,
        Ilias Apalodimas <ilias.apalodimas@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        David Ahern <dsahern@kernel.org>,
        Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Hari Ramakrishnan <rharix@google.com>,
        Dan Williams <dan.j.williams@intel.com>,
        Andy Lutomirski <luto@kernel.org>, stephen@networkplumber.org,
        sdf@google.com
Subject: Re: [RFC PATCH v2 00/11] Device Memory TCP
Message-ID: <ZNULIDzuVVyfyMq2@ziepe.ca>
References: <20230810015751.3297321-1-almasrymina@google.com>
 <1009bd5b-d577-ca7b-8eff-192ee89ad67d@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1009bd5b-d577-ca7b-8eff-192ee89ad67d@amd.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Aug 10, 2023 at 12:29:08PM +0200, Christian König wrote:
> Am 10.08.23 um 03:57 schrieb Mina Almasry:
> > Changes in RFC v2:
> > ------------------
> > 
> > The sticking point in RFC v1[1] was the dma-buf pages approach we used to
> > deliver the device memory to the TCP stack. RFC v2 is a proof-of-concept
> > that attempts to resolve this by implementing scatterlist support in the
> > networking stack, such that we can import the dma-buf scatterlist
> > directly.
> 
> Impressive work, I didn't thought that this would be possible that "easily".
> 
> Please note that we have considered replacing scatterlists with simple
> arrays of DMA-addresses in the DMA-buf framework to avoid people trying to
> access the struct page inside the scatterlist.
> 
> It might be a good idea to push for that first before this here is finally
> implemented.
> 
> GPU drivers already convert the scatterlist used to arrays of DMA-addresses
> as soon as they get them. This leaves RDMA and V4L as the other two main
> users which would need to be converted.

Oh that would be a nightmare for RDMA.

We need a standard based way to have scalable lists of DMA addresses :(

> > 2. Netlink API (Patch 1 & 2).
> 
> How does netlink manage the lifetime of objects?

And access control..

Jason
