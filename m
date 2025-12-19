Return-Path: <linux-media+bounces-49121-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 18F81CCE27D
	for <lists+linux-media@lfdr.de>; Fri, 19 Dec 2025 02:40:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 54E8330303B0
	for <lists+linux-media@lfdr.de>; Fri, 19 Dec 2025 01:40:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 613D923535E;
	Fri, 19 Dec 2025 01:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GxXqGn7P"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B1E01F5834
	for <linux-media@vger.kernel.org>; Fri, 19 Dec 2025 01:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766108425; cv=none; b=hPx3QzbI0AK8HSrV6s3Jkbra5qzSVlcxBanlHqVGG6mbr9RQgWddoePqEFBpyKa4ZcRhxSqWthB3oZf5rIbCz96b9brsI+FgDPKZhM9VynlXOomVq+TUx1YpXsej2uryZFO/euJuKl2in8/KGjpGOITeGjBUy/XYt+ThWXB+yFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766108425; c=relaxed/simple;
	bh=eU57T2ZpTrhAT3InMTPZqCoWbG3clhbzONj6eMsT294=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Yl++WIGu4z3sv7ZadGqT/k1LSt371RrBJw9BgKSu5LO8pdk+Rj+5aqbfqxEOMW9SfCLs/g9F8QGiBQ/ek8kcMt3hH91ta5BerWV+xe9Bu57VFyGIxFC/fzlvsPEN56vv4B+FQg3vOImfvS0vX2wBiJZgDVKLI/UtfAcAeVKE5Cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GxXqGn7P; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-78fb5764382so2113847b3.0
        for <linux-media@vger.kernel.org>; Thu, 18 Dec 2025 17:40:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766108423; x=1766713223; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zWU/939i2tSCrFcjT+226pu70w6qgHLxJ5V3Gj7ooMY=;
        b=GxXqGn7Pn2gayvtw0XFMwG5Ncg7YGo6GQxgL+crs7Cz0WADV/OXwhxXqg+CWdW7jtv
         /geEeTP11bKs3jO8ykKWLGwya2I2y34aEwiKxwZAhqIaMQ+vYHyexZBDq/Db4mEm8bbo
         YNFkRaQvnCW4GxkdCfHr44rqEWCuw35sRsR14psQZOWrjmL+9WnvwDDktcRtfYvVw7ck
         JgaQXOmkpAAyEzdbNlz54gExpugo8mzA3QoJXEYhS3bmez8XHwvCA4+4syujjR87gWk/
         xZb2yQ2BnUx3Ma05V3JevK+DSHZS++uwQlo3MMha9bdt+EdStte8H32pYdH00SmR/2tX
         PkVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766108423; x=1766713223;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zWU/939i2tSCrFcjT+226pu70w6qgHLxJ5V3Gj7ooMY=;
        b=YUPLWYrrMOix1z7RfElv6jKB6vB9KuP2M0TLwxjhbHPRTSSmU3azyyx9jPyIjci+R4
         1TfAZbyFD5BIW4twhZ3GojhFONlkr4/d1+zwfjqvMeWtBYbIhTisGyEc0Kljk9oLNKzE
         3oDfDuO9/rRnL3xlShApTFd0u/DBcGJATEIUVoxmelYIquz6cIz5+cF302C9JudHyb0k
         UjrhdS3eTqGWJRL3c4so820HTiz73pgLk5psFO6tJXvaNpAwjH1PdUU8xuDLGpa2IhT9
         3kVlkzpmE1d3m+iv+gD5oLS9zH4tDJ1y+E8V6/usCmifZsDh/nngcc06N1u2rGOGS/m6
         Mkug==
X-Forwarded-Encrypted: i=1; AJvYcCVYJEyVkjw1wck0hMyrSlDw3aWzgqHmL4e9CROjyDhQtGgU1Pv5g4hb9s6AwMIoOG7aXj0QCNEUogtYiw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3SIRfJ09FX2mdx1WK6V2CoQRwo9kNIG3gNdnRgpyZosLkqjfR
	zenIwBGAyBT7y8+tqHbffB82ROQHCrAD6asj/d5vvLCdXQTpCiAqC8oz
X-Gm-Gg: AY/fxX6lH2jVjUPm7TQTZVn3brXI+4a1ooHc5KdJB7w5eUobJ2qIlWgrvMb4Q+6Xg0O
	y1wBFnNb6nGCshxgRjxJAGVl4gnZVLq97hOmewiOX7vQp33cAmJ3qvqt5NNaRiEsVVwcdoaXhDU
	5p2uUMr7oD6bRwnMDfIxGUjSnf3mSxIKug+fyMI3j20+8FAtC0ACkqB2vod0BiMtGrOMtvCajtb
	zbk06Fbv6q4R0loTUPSwcSJyAeMM37TiRKJ5gohfmaVg4AktwYSwUSkUQkQLHUr6jXtGEhXQqwq
	YBrZ/sUK0LOyntvy0zr4/Tim8TEyc2PCV88qCEHyzBKewt78HzqlsoArDrae6KEKnQ62h3TW66r
	ZtuQDoQtxDenfUqUT+k9X/HuOnhW7pfl1Xk/Fke4gxq9hgXM345jaTuFmgsDff4LMe9/P1S/RHS
	idgox4yYyPkp4=
X-Google-Smtp-Source: AGHT+IGs2tukAAuVEYuoyvWSAIB55Pm8uLOrTuzGSfqj+LUZLTOqGV1IGLSl8HlgwDUbktyFC3gpDw==
X-Received: by 2002:a05:690e:2508:b0:644:60d9:7509 with SMTP id 956f58d0204a3-6466a91f1abmr672663d50.89.1766108423013;
        Thu, 18 Dec 2025 17:40:23 -0800 (PST)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6466a9219ecsm521431d50.13.2025.12.18.17.40.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 17:40:22 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id F36A8400AC5A; Fri, 19 Dec 2025 08:40:18 +0700 (WIB)
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
Subject: [PATCH mm-hotfixes 1/4] mm: Describe @flags parameter in memalloc_flags_save()
Date: Fri, 19 Dec 2025 08:40:04 +0700
Message-ID: <20251219014006.16328-3-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251219014006.16328-2-bagasdotme@gmail.com>
References: <20251219014006.16328-2-bagasdotme@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1052; i=bagasdotme@gmail.com; s=Zp7juWIhw0R1; h=from:subject; bh=eU57T2ZpTrhAT3InMTPZqCoWbG3clhbzONj6eMsT294=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDJkuqxfNrogMCI4/WrDUaoO+3RymE3bV6Q+sNzRe2pcud Lf809ZTHaUsDGJcDLJiiiyTEvmaTu8yErnQvtYRZg4rE8gQBi5OAZiInxTDf4cMXcuuCb+M7mxc JlueWqmSuHnp9SdZCbMLqzXbzJpYIhkZLuu3a+wR9BT+vXnhUY+bUZ9Zb5hPXcn0objE7/XDOj0 HJgA=
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Transfer-Encoding: 8bit

Sphinx reports kernel-doc warning:

WARNING: ./include/linux/sched/mm.h:332 function parameter 'flags' not described in 'memalloc_flags_save'

Describe @flags to fix it.

Fixes: 3f6d5e6a468d02 ("mm: introduce memalloc_flags_{save,restore}")
Acked-by: David Hildenbrand (Red Hat) <david@kernel.org>
Acked-by: Harry Yoo <harry.yoo@oracle.com>
Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 include/linux/sched/mm.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/sched/mm.h b/include/linux/sched/mm.h
index 0e1d73955fa511..95d0040df58413 100644
--- a/include/linux/sched/mm.h
+++ b/include/linux/sched/mm.h
@@ -325,6 +325,7 @@ static inline void might_alloc(gfp_t gfp_mask)
 
 /**
  * memalloc_flags_save - Add a PF_* flag to current->flags, save old value
+ * @flags: Flags to add.
  *
  * This allows PF_* flags to be conveniently added, irrespective of current
  * value, and then the old version restored with memalloc_flags_restore().
-- 
An old man doll... just what I always wanted! - Clara


