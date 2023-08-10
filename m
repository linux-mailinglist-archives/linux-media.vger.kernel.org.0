Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 64A7E776DB4
	for <lists+linux-media@lfdr.de>; Thu, 10 Aug 2023 03:58:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231828AbjHJB6N (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Aug 2023 21:58:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229793AbjHJB6M (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Aug 2023 21:58:12 -0400
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFC21C6
        for <linux-media@vger.kernel.org>; Wed,  9 Aug 2023 18:58:11 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-d4db57d2982so461904276.3
        for <linux-media@vger.kernel.org>; Wed, 09 Aug 2023 18:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691632691; x=1692237491;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=PF7UhYesGVhoeJAxt80bdAiasdVmkSyS3tHMUDi8SQw=;
        b=pYFgcIsw4RGjSJ6O/WDPYvQAw5gzuBsFuvmi3RCtRNsk292HSz6F6Rq0SBmGzE9+v4
         6x/jBSlOkk/J+Yh3t/KTzU3FjaGbJ1FFnGn4rCiMW1WOCebJU52pQfzMGVgw3dCLCtGh
         ibdISG2VQMfwETS3995hpQNOYOrj6xJozdLmzr81MayqFjb/03ruiIH3Glj9WZwG5EjN
         RQKnQQbvKQVhynHpODxT7SyW85JCXAEYDtyJ8SWBS0iWtFhq7fF90spF53UKp4OsuKxW
         lPcMHahFVO0cPAIAIcp3vK/wY25c3Sh6fLtdc5SiYM3yvZuHjR3wr5RO5McZK+W8FoXx
         NzaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691632691; x=1692237491;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PF7UhYesGVhoeJAxt80bdAiasdVmkSyS3tHMUDi8SQw=;
        b=Mcbx6RUbMvlxSQCgpLbmqvlNVK8z6envDWyR158UxmLUgjJQw5tCPNXGx5QChMqIcd
         6cg/6Hp6bgrlg9muv0IYLdVNUhHzB85EU9bnkTR0Uv3vFfUE4gxV7JVnHYNn0vrFidYe
         JJBPlkqHFP64l0RCLma1YdlolhHWdEpOY0KTxytF4PV7H+TAF5ttHQgb8e3SvP1lRgQV
         f0hSslIBtiwNGRjnqrAdwE4aOTyrwtI+Cd1zTsJjqUVtYp5lHXChrD8SiMuHktP6EqTF
         v0O6oJOJ2VxgkO5Wv9sWkmLyx0+SUYqRwfeq2QJxgeSTQpRNDRp8913ObjU0LBisvz/E
         e+kQ==
X-Gm-Message-State: AOJu0YxtxrUDSp8ci1jDHGuyqNwe72Rp8tPCc4fWiXMCpqY6V2elGmyg
        CcMQV+2FgfvKfPrHJvprD84g13aBjTx/bSIMRQ==
X-Google-Smtp-Source: AGHT+IGkjMr8m1EAO46mSdbpgOuU+k68iX+xxQzg7fLvTju4OvFhxMgZfxumSDV1ACjEoW/UuxWxOjwMGm+YP0pA8A==
X-Received: from almasrymina.svl.corp.google.com ([2620:15c:2c4:200:73ad:9ed5:e067:2b9b])
 (user=almasrymina job=sendgmr) by 2002:a25:d8c2:0:b0:d43:78e8:f628 with SMTP
 id p185-20020a25d8c2000000b00d4378e8f628mr17793ybg.6.1691632691163; Wed, 09
 Aug 2023 18:58:11 -0700 (PDT)
Date:   Wed,  9 Aug 2023 18:57:40 -0700
In-Reply-To: <20230810015751.3297321-1-almasrymina@google.com>
Mime-Version: 1.0
References: <20230810015751.3297321-1-almasrymina@google.com>
X-Mailer: git-send-email 2.41.0.640.ga95def55d0-goog
Message-ID: <20230810015751.3297321-5-almasrymina@google.com>
Subject: [RFC PATCH v2 04/11] memory-provider: updates to core provider API
 for devmem TCP
From:   Mina Almasry <almasrymina@google.com>
To:     netdev@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Cc:     Mina Almasry <almasrymina@google.com>,
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
        "=?UTF-8?q?Christian=20K=C3=B6nig?=" <christian.koenig@amd.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Hari Ramakrishnan <rharix@google.com>,
        Dan Williams <dan.j.williams@intel.com>,
        Andy Lutomirski <luto@kernel.org>, stephen@networkplumber.org,
        sdf@google.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Implement a few updates to Jakub's RFC memory provider[1] API to make it
suitable for device memory TCP:

1. Currently for devmem TCP the driver's netdev_rx_queue holds a
reference to the netdev_dmabuf_binding struct and needs to pass that to
the page_pool's memory provider somehow. For PoC purposes, create a
pp->mp_priv field that is set by the driver. Likely needs a better API
(likely dependent on the general memory provider API).

2. The current memory_provider API gives the memory_provider the option
to override put_page(), but tries page_pool_clear_pp_info() after the
memory provider has released the page. IMO if the page freeing is
delegated to the provider then the page_pool should not modify the
page after release_page() has been called.

[1]: https://lore.kernel.org/netdev/20230707183935.997267-1-kuba@kernel.org/

Signed-off-by: Mina Almasry <almasrymina@google.com>
---
 include/net/page_pool.h | 1 +
 net/core/page_pool.c    | 7 ++++---
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/include/net/page_pool.h b/include/net/page_pool.h
index 13ae7f668c9e..e395f82e182b 100644
--- a/include/net/page_pool.h
+++ b/include/net/page_pool.h
@@ -78,6 +78,7 @@ struct page_pool_params {
 	struct device	*dev; /* device, for DMA pre-mapping purposes */
 	struct napi_struct *napi; /* Sole consumer of pages, otherwise NULL */
 	u8		memory_provider; /* haaacks! should be user-facing */
+	void		*mp_priv; /* argument to pass to the memory provider */
 	enum dma_data_direction dma_dir; /* DMA mapping direction */
 	unsigned int	max_len; /* max DMA sync memory size */
 	unsigned int	offset;  /* DMA addr offset */
diff --git a/net/core/page_pool.c b/net/core/page_pool.c
index d50f6728e4f6..df3f431fcff3 100644
--- a/net/core/page_pool.c
+++ b/net/core/page_pool.c
@@ -241,6 +241,7 @@ static int page_pool_init(struct page_pool *pool,
 		goto free_ptr_ring;
 	}

+	pool->mp_priv = pool->p.mp_priv;
 	if (pool->mp_ops) {
 		err = pool->mp_ops->init(pool);
 		if (err) {
@@ -564,16 +565,16 @@ void page_pool_return_page(struct page_pool *pool, struct page *page)
 	else
 		__page_pool_release_page_dma(pool, page);

-	page_pool_clear_pp_info(page);
-
 	/* This may be the last page returned, releasing the pool, so
 	 * it is not safe to reference pool afterwards.
 	 */
 	count = atomic_inc_return_relaxed(&pool->pages_state_release_cnt);
 	trace_page_pool_state_release(pool, page, count);

-	if (put)
+	if (put) {
+		page_pool_clear_pp_info(page);
 		put_page(page);
+	}
 	/* An optimization would be to call __free_pages(page, pool->p.order)
 	 * knowing page is not part of page-cache (thus avoiding a
 	 * __page_cache_release() call).
--
2.41.0.640.ga95def55d0-goog
