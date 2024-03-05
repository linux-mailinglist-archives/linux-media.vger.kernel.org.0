Return-Path: <linux-media+bounces-6390-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F5B58712C1
	for <lists+linux-media@lfdr.de>; Tue,  5 Mar 2024 03:03:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A1DE51C212D7
	for <lists+linux-media@lfdr.de>; Tue,  5 Mar 2024 02:03:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F373D18C36;
	Tue,  5 Mar 2024 02:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NcqkfsWx"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B576418AED
	for <linux-media@vger.kernel.org>; Tue,  5 Mar 2024 02:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709604126; cv=none; b=J5BRxw/o59g+/dZEhCUB8WgGil/Fg4GrDxM8gvE0uSHiFRS6PQm5oWFhLCXeXqj/4xPJc4bVJztqlETvKzWokGyRYBnkM/6LxYaGx+gNcbVapkfTfnT8bIvB5EYHKTDYYqImloEbh62XrY9DsEOZzdNF3nBc40Aeu4mKoT9FW+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709604126; c=relaxed/simple;
	bh=j/IwFTAQYqvdz7NJGn1fdITXlRNyG53+OSdMfig6/Ik=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=X9KVBB/JcB7A7ob/l5uZLuhQF+AWjTjwwKjFKKbegsLIhXdC73ybmHQxRGQ/KRXNsRHNL7LZafTJcFRQzbd5OO0Qpxr0FMI1APcdlOc87yOFKqRgEAFKTJ6PcsdIFGS0GqTV6rz7PyjfdAZoLj4hDZJzh4UV+01gqUC2QSzUjBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NcqkfsWx; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-dd0ae66422fso225388276.0
        for <linux-media@vger.kernel.org>; Mon, 04 Mar 2024 18:02:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1709604124; x=1710208924; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=G9Y5Scp28ZqCYcu39ok93LJAzx/1WlCB4rvVWoIV5aE=;
        b=NcqkfsWxY92T8H72Q9KWic205+OP/btpDnXvreJr99ioZjxLcpxGPAPeHdA8VbxZ9N
         yOWwBMB60bBDxr3ekQV5X8SGGpELD4G3vBDA9jgtIz6weGM8jItW6iJVoHzDFibxE4Ho
         2FO3BL6ft8GdJ0PfeY/82lad8Oqt9ta1nWdW7mHZqasIaVAwwvCGlcgAcQ3pM2QjkzsI
         caL/oV9hEk+9QotKVpWtwdvXnJjmY5XTTjQ+besky1m+C4CTf8HPr34KflMzuDOkATIx
         eVMO29Wh/O5oamxGbEsuEt2k6QfaXNNU5L1HcHA/21lrfFSdKPFmxK9GRqgVa7TCA/8X
         ZyLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709604124; x=1710208924;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G9Y5Scp28ZqCYcu39ok93LJAzx/1WlCB4rvVWoIV5aE=;
        b=HpZkxfjqLc6hJg9pIRj14NX2RaP58teSdYtguqu3RnGICGwtsffoNYNqHQOEjOKv/Z
         zDXRGXy5PyNwqCtp2MZ8kXrGt0qRfrJP6/N5bTUq0RkO0D2pcL7IT//Zl6DbKS4DXsuP
         S5kzsCtSlUk+MS7RFEB0yjIWRExhJMR/jDM9spvyo0j42BtEuQkcYMvnK7rDm5b2glZg
         pKGgrJfHlxis31/HFQQi1gAjnYJZTuChQi77EynD16rq5h+MPDS1unviJCYRVxlg+Wd3
         qj2pm25G4qZNZgyx/CbqnTvgLGEQBbfnVryDGGWbKo9GPJdheMa0HVimqJkVFhhO7cR/
         dgyA==
X-Forwarded-Encrypted: i=1; AJvYcCXYz1nBfQz1RiNl55NCUiwwcO0ZpT+rKOF6L9LhtwD7nSu5yNfKo9A+4+Adtf1LoVub1Kb2PO4e8FrBUzSPyO96HTgDVTPT4iYp5RI=
X-Gm-Message-State: AOJu0YxBvtoheV04ul3GV6DavTPMrS+RNB9T5Hf2UCZ3kKT0RbgUMbvz
	4px6zWh1gyNPZUO1OtXKGnze4AJzS0zrXSyL43vgDePEiOsU/MT73GiXCFIOfrTU6X5743Dp9Vr
	Q7ld4MI18PpxGMXBJa8RBBw==
X-Google-Smtp-Source: AGHT+IEWVOX8ecOfPBAQKvSAdDi7mXxA37voW2PjP2/k7/WW1wkAZw+RIjB2g4prAu6X3Z9fh0hm2+1kWtRsqaYHTQ==
X-Received: from almasrymina.svl.corp.google.com ([2620:15c:2c4:200:b614:914c:63cd:3830])
 (user=almasrymina job=sendgmr) by 2002:a25:690d:0:b0:dcc:5463:49a8 with SMTP
 id e13-20020a25690d000000b00dcc546349a8mr245459ybc.6.1709604123917; Mon, 04
 Mar 2024 18:02:03 -0800 (PST)
Date: Mon,  4 Mar 2024 18:01:38 -0800
In-Reply-To: <20240305020153.2787423-1-almasrymina@google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240305020153.2787423-1-almasrymina@google.com>
X-Mailer: git-send-email 2.44.0.rc1.240.g4c46232300-goog
Message-ID: <20240305020153.2787423-4-almasrymina@google.com>
Subject: [RFC PATCH net-next v6 03/15] net: page_pool: factor out page_pool
 recycle check
From: Mina Almasry <almasrymina@google.com>
To: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-alpha@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org
Cc: Mina Almasry <almasrymina@google.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, Richard Henderson <richard.henderson@linaro.org>, 
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>, 
	Andreas Larsson <andreas@gaisler.com>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Arnd Bergmann <arnd@arndb.de>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, David Ahern <dsahern@kernel.org>, 
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>, Shuah Khan <shuah@kernel.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, 
	"=?UTF-8?q?Christian=20K=C3=B6nig?=" <christian.koenig@amd.com>, Pavel Begunkov <asml.silence@gmail.com>, 
	David Wei <dw@davidwei.uk>, Jason Gunthorpe <jgg@ziepe.ca>, Yunsheng Lin <linyunsheng@huawei.com>, 
	Shailend Chand <shailend@google.com>, Harshitha Ramamurthy <hramamurthy@google.com>, 
	Shakeel Butt <shakeelb@google.com>, Jeroen de Borst <jeroendb@google.com>, 
	Praveen Kaligineedi <pkaligineedi@google.com>
Content-Type: text/plain; charset="UTF-8"

The check is duplicated in 2 places, factor it out into a common helper.

Signed-off-by: Mina Almasry <almasrymina@google.com>
---
 net/core/page_pool.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/net/core/page_pool.c b/net/core/page_pool.c
index 8776fcad064a..fe9de4ecce94 100644
--- a/net/core/page_pool.c
+++ b/net/core/page_pool.c
@@ -684,6 +684,11 @@ static bool page_pool_recycle_in_cache(struct page *page,
 	return true;
 }
 
+static bool __page_pool_page_can_be_recycled(const struct page *page)
+{
+	return page_ref_count(page) == 1 && !page_is_pfmemalloc(page);
+}
+
 /* If the page refcnt == 1, this will try to recycle the page.
  * if PP_FLAG_DMA_SYNC_DEV is set, we'll try to sync the DMA area for
  * the configured size min(dma_sync_size, pool->max_len).
@@ -705,7 +710,7 @@ __page_pool_put_page(struct page_pool *pool, struct page *page,
 	 * page is NOT reusable when allocated when system is under
 	 * some pressure. (page_is_pfmemalloc)
 	 */
-	if (likely(page_ref_count(page) == 1 && !page_is_pfmemalloc(page))) {
+	if (likely(__page_pool_page_can_be_recycled(page))) {
 		/* Read barrier done in page_ref_count / READ_ONCE */
 
 		if (pool->p.flags & PP_FLAG_DMA_SYNC_DEV)
@@ -820,7 +825,7 @@ static struct page *page_pool_drain_frag(struct page_pool *pool,
 	if (likely(page_pool_unref_page(page, drain_count)))
 		return NULL;
 
-	if (page_ref_count(page) == 1 && !page_is_pfmemalloc(page)) {
+	if (__page_pool_page_can_be_recycled(page)) {
 		if (pool->p.flags & PP_FLAG_DMA_SYNC_DEV)
 			page_pool_dma_sync_for_device(pool, page, -1);
 
-- 
2.44.0.rc1.240.g4c46232300-goog


