Return-Path: <linux-media+bounces-2060-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 37B3780B8A4
	for <lists+linux-media@lfdr.de>; Sun, 10 Dec 2023 04:49:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D6A411F2100B
	for <lists+linux-media@lfdr.de>; Sun, 10 Dec 2023 03:49:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADCAA17F7;
	Sun, 10 Dec 2023 03:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MVA3ncTv"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-x549.google.com (mail-pg1-x549.google.com [IPv6:2607:f8b0:4864:20::549])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2492FE
	for <linux-media@vger.kernel.org>; Sat,  9 Dec 2023 19:49:30 -0800 (PST)
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-5c1f17f0198so1440982a12.1
        for <linux-media@vger.kernel.org>; Sat, 09 Dec 2023 19:49:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1702180170; x=1702784970; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=MW0tH0tCLOPnmE9TK7jB709vE7J7udoTWRcjSJbRbzw=;
        b=MVA3ncTv2ztH8VVDR196PceGHb1j2OlSZrlL9Lw2Z9wX6UV2E/Z7XDjt5ZD7SDGkQY
         tlWHdq4lxTiyvBUAkbTmLAnlnhSqqlhFoLb51b5SdgrG3NTW42ditNtt2dquiK22e2xx
         Nw689Lh4It2U5heO9IEQmZwv3c3mM3nARmOuJMgEG3Fs+Rwa45tEbyggTQPX1s+IcwtO
         u3Wiqqvto7KipLkZsC4PQE1A8RgR5sT+O1xaA8N2w+wHjPG1xRdP1x6zOnuCs9mKTdFv
         04hbe0IOyZyj/hqPtSfyu4DtiDdktMxlvPL5bH+Fgu9pBBtlLtruM13bGr+El8lT1Frm
         WP6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702180170; x=1702784970;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MW0tH0tCLOPnmE9TK7jB709vE7J7udoTWRcjSJbRbzw=;
        b=eru9PUGmcvM3JMdJ8RQQ2SwhaWX8TRtuY5aIRbAiT8eumUos6mefWzUrQeYFKB8IDB
         8oxn/9y+fLV7K/CXoh4yGwdi43yEsnhp4wo/0zyQNU07r5XAVIgCIu7ioCQEaDVTzyW2
         9J747hKcfelnf/od7LYFy9nwMr+GKgnZvPcjaHeXyUWSdS2/grZtOD2AaQ0Y93bzZ3hN
         032nX8LwfCehN1K5xNakojlXp4UqSQsNpPUbVdzEX3ejrL5OxoJRbecvQvos4zUZESjy
         3PGuCw3Yif+FmJitzsZ/VVDzRPRI4ol8G6wxxAUSREHNGjobzanVkAgMV2UTIDsEjAYb
         Lr3A==
X-Gm-Message-State: AOJu0YwetClr3dwU7uBlo95rBQzJMQtZJeQzT7Sb1w6CnxUvm6l4hy+9
	ekul/FXZB1G+ZUv6eF28/xzGUk2Sbn8ZGQ==
X-Google-Smtp-Source: AGHT+IHLBajZsz0VxcL0CaCLjiP+JcpZ3Z6iSNDh4oLOCNKWTm9OPBX9RXcqYsgny9cLWKIkHF4CYYDwWcNIvw==
X-Received: from shakeelb.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:262e])
 (user=shakeelb job=sendgmr) by 2002:a63:7317:0:b0:5b8:fe99:152d with SMTP id
 o23-20020a637317000000b005b8fe99152dmr15385pgc.7.1702180170422; Sat, 09 Dec
 2023 19:49:30 -0800 (PST)
Date: Sun, 10 Dec 2023 03:49:28 +0000
In-Reply-To: <20231208005250.2910004-2-almasrymina@google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20231208005250.2910004-1-almasrymina@google.com> <20231208005250.2910004-2-almasrymina@google.com>
Message-ID: <20231210034928.mk4ufxqis2w3wesg@google.com>
Subject: Re: [net-next v1 01/16] net: page_pool: factor out releasing DMA from
 releasing the page
From: Shakeel Butt <shakeelb@google.com>
To: Mina Almasry <almasrymina@google.com>
Cc: Shailend Chand <shailend@google.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	bpf@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, Jeroen de Borst <jeroendb@google.com>, 
	Praveen Kaligineedi <pkaligineedi@google.com>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
	David Ahern <dsahern@kernel.org>, Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
	Shuah Khan <shuah@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>, 
	"Christian =?utf-8?B?S8O2bmln?=" <christian.koenig@amd.com>, Yunsheng Lin <linyunsheng@huawei.com>, 
	Harshitha Ramamurthy <hramamurthy@google.com>
Content-Type: text/plain; charset="us-ascii"

On Thu, Dec 07, 2023 at 04:52:32PM -0800, Mina Almasry wrote:
> From: Jakub Kicinski <kuba@kernel.org>
> 
> Releasing the DMA mapping will be useful for other types
> of pages, so factor it out. Make sure compiler inlines it,
> to avoid any regressions.
> 
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> Signed-off-by: Mina Almasry <almasrymina@google.com>
> 

Reviewed-by: Shakeel Butt <shakeelb@google.com>

