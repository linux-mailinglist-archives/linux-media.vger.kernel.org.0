Return-Path: <linux-media+bounces-49124-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EED4CCE291
	for <lists+linux-media@lfdr.de>; Fri, 19 Dec 2025 02:40:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8BB013038143
	for <lists+linux-media@lfdr.de>; Fri, 19 Dec 2025 01:40:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32B7B23B60A;
	Fri, 19 Dec 2025 01:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AJf2hYma"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E99742376FD
	for <linux-media@vger.kernel.org>; Fri, 19 Dec 2025 01:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766108428; cv=none; b=GvHOoaUsIw8hdGPv54oUKkPWx/EihxOImKn9WZm37pt92HsEqigBAkP4PJrn64ZlME6NFVzmZjMtgEafXZXEwi+8zmpaUMR2Ks6bDkYbsxmfBEfdtcFFcs9SQaHdWd7ZyrNEPTy2uioQl7u1yUZy1LRvoXo6TiuKD0xhchyKgEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766108428; c=relaxed/simple;
	bh=RJRIAcyQjDA0Y8yZ/8Tu6N5h+KfYiqNdzVSLTNcjx6Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IksXnQQu8VNeZV9DvQ+mzRfv7s1pcKA9ko0QPb51QCjDRrG8YzrdV5gwwnVadyb/0v0TsQqaXSn0YLC8O5MVlJTcLFu8AivrHCYaR790ftN/dwuIa7KTEfSialVafCwUIMG5wOuAYkCAV3lKWyiupelHDD0Q0JgRM7scUsVFpQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AJf2hYma; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-787df0d729dso11732397b3.3
        for <linux-media@vger.kernel.org>; Thu, 18 Dec 2025 17:40:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766108426; x=1766713226; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nd7dLSH/2LNPg9M+6OkqNEaj91DJZUUxPtMRLObk/CU=;
        b=AJf2hYmae5SWOBegapNGiAnt2NfwYXGUc+47aeF+6ZzNze3mqg0NF/JyYFKRp3qfBk
         knaW09eqflwqioNNFOcD/L/ZhISLh4w8CAMTo9xKQaibwPKwoOEbp8RH7pAGjv9KtBOR
         /Kk3ZAv3cohAfvb1Lka4ByUtLxIhTPnFRSIUMJLZ6fd6Wb62ZSnLuOHWtXJcMkR5IfLJ
         UGIevTocpABMXQWSensZS33nodikxShSgnP8fzjUw5SyzT6hikZRBWz76CuFQBnourVn
         QvtwQIe68l7788PNm3y2E8uHtaAiJEk2EY7EI9sEhxhtpxpO1zHRvD4jx3kx3eW4+9yB
         2Fzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766108426; x=1766713226;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nd7dLSH/2LNPg9M+6OkqNEaj91DJZUUxPtMRLObk/CU=;
        b=jEgQbyw598d6MfYYsN844lrZXfx9RcKSTS1TFdarhedrmwMF26wJur0rtwi+8Bzc+D
         untk824pyeDNiRueaQYYg7IpZkprdi6+EvphTTAR1B2r9p6lgBtau657UW6ivvUCKF20
         cNylASyPKnGDcwAGHYKsgR70iiOL1oTrmRRATC7TteN+FBm3fnG5sCiSBFMimmOWfSBd
         m/WT2Ex/MoJFkNqCVK8bxv3o/8MV4o84G8Bzbq+3EqmSbTf6L5Uh/rq2/16JPjDkJ5Qy
         AXva+KA/yjcmUf8jtb9QCT8LMqYcKn3ibzsXiaTPyQA4Uh0BrInDswOwrW3ySValmjef
         uCIg==
X-Forwarded-Encrypted: i=1; AJvYcCXkGVCHdWUJqHLH5O5mcO3fZbBJqe45bIgNwUIWJh+/sUUKOO1l49MByVvTCpnJKNbcGRwodjyoAhg15A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxRqz+2KvQXlTx2szfJvPv1VOw8VQmXaGDJDiVoYcVaKsYCJpAd
	6ix/ACtcOHSSa8y0lEMbEjVEdHSEUjoGq0wvMKqG7t7fhHpLH9YAZnt8
X-Gm-Gg: AY/fxX6M+AOCk5wgOaSaNtGKkxTNYQTHe7qPwIxCtW+d9UUSXBGM3RrYGr6usc5KqVM
	aBJXven5E43IGv+cSEIUZg5Pj3S/IBh0Nm7JZG2PH4DlMSXRadJNe2+AitRtQbUWNtmVZPW5YYp
	2X01s25wyybdSBY8pQzXlScM2E0jlfraWjtMmhB0j+qsGdugYvk3/+pOC0NII/cpsggWolbwv/q
	o9TweDGbNW0MXldyXlrr7syXgrgC/GeOCfpDgmJP2U7ip7+ise6ZWMCJoz0cJsOYZ3/NlO3ATnE
	hJ07GeUqZK+0Od7JaoAmu3K+J22iPhgATCYWMFbmWdTgQ6Vt78JLIjBANvB738PobuSG2IZVEFF
	fgP5nNkfC737MI3w2Xqs3D5qykYT4UfG/Gu4gdP3XfXbdifCdzUe0zso8VGfw+9ykVhPG6rJPHB
	5UP6FBG7znrzM=
X-Google-Smtp-Source: AGHT+IGj4vErXkivNcPDaKm/hE3vqzn7Jv2EbveO2FMxfRHgUcrVUKUl63HP3M4rW9y9FyxrhRxuhQ==
X-Received: by 2002:a05:690c:a8e:b0:788:182b:a79c with SMTP id 00721157ae682-78fb41309d4mr10702687b3.35.1766108425857;
        Thu, 18 Dec 2025 17:40:25 -0800 (PST)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-78fb4376692sm4362217b3.10.2025.12.18.17.40.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 17:40:22 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id BE85043916EF; Fri, 19 Dec 2025 08:40:18 +0700 (WIB)
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
Subject: [PATCH mm-hotfixes 0/4] mm kernel-doc fixes
Date: Fri, 19 Dec 2025 08:40:03 +0700
Message-ID: <20251219014006.16328-2-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1015; i=bagasdotme@gmail.com; s=Zp7juWIhw0R1; h=from:subject; bh=RJRIAcyQjDA0Y8yZ/8Tu6N5h+KfYiqNdzVSLTNcjx6Q=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDJkuq+f5OYcHL0jrEuTKWuQ97emSvy6qUm0BRWeMGLrcl J5vdHXqKGVhEONikBVTZJmUyNd0epeRyIX2tY4wc1iZQIYwcHEKwESybBn+Gdbv7z63/Pnd28sP njM2YHx0zOL4JEkuEzeHcytM7BWSJjAy7D8We+uuyDHrtsBjHzMXb9rMJcEdymbdyWQWkGkSsmk BCwA=
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Transfer-Encoding: 8bit

Hi,

Here are kernel-doc fixes for mm subsystem, based on mm-hotfixes-unstable
branch. This series is split from previous assorted kernel-doc fixes series
[1] with review trailers applied.

I'm also including textsearch fix since there's currently no maintainer
for include/linux/textsearch.h (get_maintainer.pl only shows LKML).

Enjoy!

[1]: https://lore.kernel.org/linux-fsdevel/20251215113903.46555-1-bagasdotme@gmail.com/

Bagas Sanjaya (4):
  mm: Describe @flags parameter in memalloc_flags_save()
  textsearch: Describe @list member in ts_ops search
  mm: vmalloc: Fix up vrealloc_node_align() kernel-doc macro name
  mm, kfence: Describe @slab parameter in __kfence_obj_info()

 include/linux/kfence.h     | 1 +
 include/linux/sched/mm.h   | 1 +
 include/linux/textsearch.h | 1 +
 mm/vmalloc.c               | 2 +-
 4 files changed, 4 insertions(+), 1 deletion(-)


base-commit: 980dbceadd50af9437257d8095d4a3606818e8c4
-- 
An old man doll... just what I always wanted! - Clara


