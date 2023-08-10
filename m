Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A32C7780E3
	for <lists+linux-media@lfdr.de>; Thu, 10 Aug 2023 20:58:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234609AbjHJS6j (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Aug 2023 14:58:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234216AbjHJS6i (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Aug 2023 14:58:38 -0400
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com [IPv6:2607:f8b0:4864:20::731])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B19426BC
        for <linux-media@vger.kernel.org>; Thu, 10 Aug 2023 11:58:38 -0700 (PDT)
Received: by mail-qk1-x731.google.com with SMTP id af79cd13be357-76c93abeb83so92338285a.0
        for <linux-media@vger.kernel.org>; Thu, 10 Aug 2023 11:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1691693917; x=1692298717;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vsyCys9Hf/cc75Fnr2tkebJ8N3paAQId+bMwmSwTxOY=;
        b=g7OHqXPvz9lvXEVQRoNwlIAWD3U3BVaszpP9c4VQfzVew2oR11nq/PKW4heanyaoI/
         6U1ByG/45vFJbE5DUQK46T0mZDn420p1KqetFU1Z18z/8O5hDYyqEsV4csvPtuJ2bet6
         1RxzlwHsoV2+r3lXpMpY6ykdbSzAT6VjZ+V5X6VkUFV99iOC2KYVAIoeBEBlG3YVzTQz
         vS4gAb3eK7oGEslty93LfhmwSi/0ADON52kge07ftO7YW0FKmIbCJA8WiZ1fMmfSqNHf
         VI/hzMwm7iLFsjCcH0TZhUWnPdUw27o0Osbe3rMLkjrT06iA2SeB0AEsvvsggfsmS6gI
         MZog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691693917; x=1692298717;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vsyCys9Hf/cc75Fnr2tkebJ8N3paAQId+bMwmSwTxOY=;
        b=P6a7RMGiNqa3qYp4rqW7gs3TgRsGD1ns0upPHCV8HQHTu9QcWcGn2qxDdb3TymdMdy
         q1HkwE5Ub5+/iQilKIoIq/kmVcGRg6pSM7igBjmzxJlhTt8+RoRZgfvAqzFUosodmUWO
         FnwoYhTrMVkWcU7DBfIITvKIunGwVn4O9gaIzzug57rMBOwLod7RGKIOxS21S+Bp7ZLw
         IZsnJnHycwIhq7lJrzl9hdGMISgON/AFQbSFU4itT9UmDsDoefcQ04VmfZM910ZSzAHF
         DYr3YR8DY8zDkFA39Tnr2aOelcounOUBMTxL/HC05ZJWSyBxqCA1hNDpHNJNaL1NTRVZ
         kU0A==
X-Gm-Message-State: AOJu0Yy0DOH/3BdxHntSmp60bAuABHhB9BDadgZLCZOMG2wdHr6l06u+
        VS8NFZoTOmwLJnvI21PJiSSWIA==
X-Google-Smtp-Source: AGHT+IG2wYwwESDSTMeata50KjIGSTDd5oFZ54ICUMsQbCPWTAM07sDaAobSCA1IWHJxW0hVcjfxmQ==
X-Received: by 2002:a05:620a:4148:b0:76c:bc4b:92b9 with SMTP id k8-20020a05620a414800b0076cbc4b92b9mr3903660qko.11.1691693917177;
        Thu, 10 Aug 2023 11:58:37 -0700 (PDT)
Received: from ziepe.ca ([206.223.160.26])
        by smtp.gmail.com with ESMTPSA id x8-20020a05620a14a800b0076cc0a6e127sm677945qkj.116.2023.08.10.11.58.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Aug 2023 11:58:36 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
        (envelope-from <jgg@ziepe.ca>)
        id 1qUArj-005Ifq-Qt;
        Thu, 10 Aug 2023 15:58:35 -0300
Date:   Thu, 10 Aug 2023 15:58:35 -0300
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Mina Almasry <almasrymina@google.com>
Cc:     Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        netdev@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
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
Message-ID: <ZNUzW3X3P0JvL4nI@ziepe.ca>
References: <20230810015751.3297321-1-almasrymina@google.com>
 <1009bd5b-d577-ca7b-8eff-192ee89ad67d@amd.com>
 <CAHS8izPrOcrJpE1ysCM7rwHhBMPvj0vQwzfOyVqdxsVux8oMww@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHS8izPrOcrJpE1ysCM7rwHhBMPvj0vQwzfOyVqdxsVux8oMww@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Aug 10, 2023 at 11:44:53AM -0700, Mina Almasry wrote:

> Someone will correct me if I'm wrong but I'm not sure netlink itself
> will do (sufficient) access control. However I meant for the netlink
> API to bind dma-bufs to be a CAP_NET_ADMIN API, and I forgot to add
> this check in this proof-of-concept, sorry. I'll add a CAP_NET_ADMIN
> check in netdev_bind_dmabuf_to_queue() in the next iteration.

Can some other process that does not have the netlink fd manage to
recv packets that were stored into the dmabuf?

Jason
