Return-Path: <linux-media+bounces-49122-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BE38ECCE282
	for <lists+linux-media@lfdr.de>; Fri, 19 Dec 2025 02:40:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CC06B302E5A1
	for <lists+linux-media@lfdr.de>; Fri, 19 Dec 2025 01:40:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B327E23B628;
	Fri, 19 Dec 2025 01:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OhWTZk+E"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 976FB22154B
	for <linux-media@vger.kernel.org>; Fri, 19 Dec 2025 01:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766108427; cv=none; b=U8wk6i+q2xq4wK/KXaCZEJsazGYmTKCG7s6tBC06exztyURr3zyjgePE34/0cXp5xcHfRNKCGUMq+yVDL/hCLjEio4GJrHbckiPKXy8hb3et6h34OZHxkCEsQffUpEUye8I19Xu49V7seHucfs2rSGyKIsnX7g+jqj3ocSKmq+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766108427; c=relaxed/simple;
	bh=V7JnR2C4dn0LioMgl7WguO8w6hFl8CYJrTRxC+i2SGY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IcMEG318Jh35lFYyQU/H+IuFZu+in0695+4tofveDnNozPJKpABmCAIkFYmB7Ne4d2mEqQMwM1Qipza/xVjgACJhd0JNtB/xwEbXUU+bY4cXFk531oCpOPN+NJeerw129X7XIgZZmhUYWakDiPJSkzvfs9LEpD1Iw6w+QB713GM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OhWTZk+E; arc=none smtp.client-ip=74.125.224.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-644798bb299so1189452d50.3
        for <linux-media@vger.kernel.org>; Thu, 18 Dec 2025 17:40:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766108424; x=1766713224; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lXujcQG4d4pSPfLnwY7QQ/B3L24bc/JbXH3UhT7rcLI=;
        b=OhWTZk+EDMoZvWOsKPwowUQyHRDXqyID+nWljsEhN/voHIXARskSPTdaUOmQQoaAzs
         07xa5wkwrbyzVFqEeChAsfXo+OCKJE7DrU/Ej+b45TGKHgKLwFgogzMc0MWXHjcp1zuC
         zds7FKhvFcO9LwDUfae25dL1QQPEsnKTK4PrtnRET8M6P1yzmJAtyZuTAqBqXWOhuPDK
         iGXtueQWGLFVuZ27AiC8ASophQBpGfLL4QnA/aQOj36LLLQigISGdU5dGRozNiYGhSAT
         eIdhe7zK1DMpAo0X23mcbSrlliWlx3FZq6RVHAY8UqHWavbOb+MgD3UZbcGdB9hU/Ib7
         HApA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766108424; x=1766713224;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lXujcQG4d4pSPfLnwY7QQ/B3L24bc/JbXH3UhT7rcLI=;
        b=HGmHv1GAXkC1tRuHNvxyLqgATbNu8tCqr3B3arQF+QnxkkiofKXy1B72Ok4FJXpqpp
         Q8ZrEwmWxJK1RQRwyizTnv06sJR4KPqr37y5NLokF0P0UBKggLlZE/Y50+9g+ykQt0ZQ
         KOsWPMxUjwXOnBqeBC4EBD468LN/y+Y2hgRRqN0AKVPqNA+V53+ad/mE+S59xlaei/xc
         XPiTTOYAWdur/LE/jBPABjnOmywoNARJrAfxb6noggw37m/RXpFqkzA3dl0fijSMqJmB
         UQgeTyuTU5lCN5IORmOQniIQ407o0+MUXw93z8m0xMaM2EhqdoaD51p4xxUhMjAdfWRu
         ufhA==
X-Forwarded-Encrypted: i=1; AJvYcCUf9CEsF+nPx3/CifH6StWiTyOvPLKrgsf+gbrescl2T7Q8Vx4UB76ZlesU1V5R8EE16T5ImWGZPJGtiw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxip+ewAj5q16ceo+MRxG1DGgvFZ6vZ8pq9MkbKeNiFo4laMnJb
	dH6ZxUew9skWQn1PKRPq9Io9qULNTB/yqcv/S2jYBMMmiTaHC4hpqkSi
X-Gm-Gg: AY/fxX7SIrc8PLvBdhVvwPCJYkOeMXpj9bHkPwtjM9qdhoeHSQfjeD0g0qhQMgL0G4n
	KdFVgc3kg4vO/WRTjnJZt6NyAC/T5PtVd8X9FsHkglGYpxGhOpCye4H1KZJTDUD6ksKN91r2/oh
	mDzWmGR9hroHgngcdTRFutAw3auxuBa7qJXy5bpm+SNT64PzTC3swG/ovjNYMuXtB/F+VG/u9im
	pvmj1O/I1qNn++7bG2TIesuRWU0NDiJkbopWqE/E9qkZGb4wezq7uUnAt5uN9YWgGKRvn00Bal6
	E/n/BDuCLGUZI+uXlA1QuLlVXq9mpFN80WJwv7M0X3tZlZRfC8oGhCuAuYqHDGnBqJBCR4OWpN1
	XOn02QahvpoeotgYIei8nZKs5u5D7RR2IYeBQFP6HCuHaF+Vr1vGo7YSJl/8qToya9As60TNx4K
	IAXBNDVp8yBbU=
X-Google-Smtp-Source: AGHT+IEkhnBkI2xTy6+krjkg4oy487XdWneFBVKVRcd59MnMtD1xOFax36K9/qEz+okpBApxnUzeXg==
X-Received: by 2002:a05:690e:4102:b0:646:5127:9cde with SMTP id 956f58d0204a3-6466a8345d6mr1205460d50.14.1766108424525;
        Thu, 18 Dec 2025 17:40:24 -0800 (PST)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6466a92d91esm515295d50.18.2025.12.18.17.40.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 17:40:22 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id 5E2A74001B63; Fri, 19 Dec 2025 08:40:19 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Linux Media <linux-media@vger.kernel.org>,
	Linux DRI Development <dri-devel@lists.freedesktop.org>,
	linaro-mm-sig@lists.linaro.org
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Alexander Potapenko <glider@google.com>,
	Marco Elver <elver@google.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	"David Hildenbrand (Red Hat)" <david@kernel.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	Max Kellermann <max.kellermann@ionos.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	"Nysal Jan K.A." <nysal@linux.ibm.com>,
	Kent Overstreet <kent.overstreet@linux.dev>,
	Vitaly Wool <vitaly.wool@konsulko.se>,
	Harry Yoo <harry.yoo@oracle.com>,
	Mao Zhu <zhumao001@208suo.com>,
	Shaomin Deng <dengshaomin@cdjrlc.com>,
	Charles Han <hanchunchao@inspur.com>,
	Jilin Yuan <yuanjilin@cdjrlc.com>,
	Swaraj Gaikwad <swarajgaikwad1925@gmail.com>,
	George Anthony Vernon <contact@gvernon.com>
Subject: [PATCH mm-hotfixes 4/4] mm, kfence: Describe @slab parameter in __kfence_obj_info()
Date: Fri, 19 Dec 2025 08:40:07 +0700
Message-ID: <20251219014006.16328-6-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251219014006.16328-2-bagasdotme@gmail.com>
References: <20251219014006.16328-2-bagasdotme@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=993; i=bagasdotme@gmail.com; s=Zp7juWIhw0R1; h=from:subject; bh=V7JnR2C4dn0LioMgl7WguO8w6hFl8CYJrTRxC+i2SGY=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDJkuqxc7T7vRwlFjGfXAJPPZEb6MmU3nPfJK+S1u/Pfr2 nAoY83ujlIWBjEuBlkxRZZJiXxNp3cZiVxoX+sIM4eVCWQIAxenAEzExpSRYbVy1V+uKhNfl31d 3tY/1yd5qPVxrz/kbjrv6KwU7VU7PzP8la6Z2vvv9mRZvSKz/YeLxOqYTjn7fuPIvP55y5Tuc40 LOAA=
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Transfer-Encoding: 8bit

Sphinx reports kernel-doc warning:

WARNING: ./include/linux/kfence.h:220 function parameter 'slab' not described in '__kfence_obj_info'

Fix it by describing @slab parameter.

Fixes: 2dfe63e61cc31e ("mm, kfence: support kmem_dump_obj() for KFENCE objects")
Acked-by: Marco Elver <elver@google.com>
Acked-by: David Hildenbrand (Red Hat) <david@kernel.org>
Acked-by: Harry Yoo <harry.yoo@oracle.com>
Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 include/linux/kfence.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/kfence.h b/include/linux/kfence.h
index 0ad1ddbb8b996a..e5822f6e7f2794 100644
--- a/include/linux/kfence.h
+++ b/include/linux/kfence.h
@@ -211,6 +211,7 @@ struct kmem_obj_info;
  * __kfence_obj_info() - fill kmem_obj_info struct
  * @kpp: kmem_obj_info to be filled
  * @object: the object
+ * @slab: the slab
  *
  * Return:
  * * false - not a KFENCE object
-- 
An old man doll... just what I always wanted! - Clara


