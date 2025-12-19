Return-Path: <linux-media+bounces-49125-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FDE1CCE2A6
	for <lists+linux-media@lfdr.de>; Fri, 19 Dec 2025 02:41:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A1DDA3075674
	for <lists+linux-media@lfdr.de>; Fri, 19 Dec 2025 01:40:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3591D240611;
	Fri, 19 Dec 2025 01:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zv96cKTH"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B880F23B63F
	for <linux-media@vger.kernel.org>; Fri, 19 Dec 2025 01:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766108429; cv=none; b=P5x6oIPDCF0mWqgFjuWfMvLvAZj6or4dL/Ws809Hvoh964aw0o8c307VDLzvRWJsONTyjF1MafGnKSBEFQrsHAlhT4i9OhY5xfZYqwKIMc2doEt2jtqV/DO/LjLscbHPNDLW8UJKJSjuApDuxx/19qAQnhVDWTj1Rx2+ejNcClo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766108429; c=relaxed/simple;
	bh=1tOY86lhWOCbSHsqmK/tuDEilXGPwKXl/15tM3wSixs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HVK3bQeT/5yoj2cmdyrsdsrkcey4kIhducZNHhLNkEcK31qq5p3NIXHPxXtiVvocZw3BALLNdqZ+4hgBHF/XnJ0HIMTJe9yvognWrKBK6Ul6DbV7Yo6+RLRNteEMXEYdf8Gpkn3HRfokTEGhmbklVgVUj2sXX6RygobNXn5jICY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zv96cKTH; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-78a712cfbc0so12656347b3.1
        for <linux-media@vger.kernel.org>; Thu, 18 Dec 2025 17:40:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766108427; x=1766713227; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TWXueLrhDneeDmCGizpSHzMSgAg8yMgxTmeT/qXEn+I=;
        b=Zv96cKTHyxG1sr9vKQHDE746Cg2X1eauRvRjAbTEba4QHES2rQXkSktMihWRM3Jyel
         zwA4TtLBd5utw5Sq6yapWtmXJ/pRGLuFlaK2waOYZua78nq2SwkIqGNKr1b9Z1a4Qr6U
         ORN0u+ksJHe1msHJzFEhdku5ddJ9XcGGmPxK9KqFbieK+Otbzfhr+Ei8yOwkaoTzuvks
         rTQKxH6rox0tfidB+WWo+Dm1kkLYaziiQRCn42OiVrpa3u6Oh3y+JTtTLdDCuW1OP6Es
         1FBYiYOOWO2F7AHoBf/WVey//cKeA6U9Nunb1mgvNai+asZXK3+EFNwEq+UMVDA6RbhE
         A9FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766108427; x=1766713227;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TWXueLrhDneeDmCGizpSHzMSgAg8yMgxTmeT/qXEn+I=;
        b=o5BYHVF3DkTAb/CjjNfzcOwrWlxB789OsNjnpQ6iAVQorWUxxUTXaKT48IDrfdzIT7
         VPpyu/QJznZ/YaC4YRoUVIrwQt8WYsk2n83+XTuRuXV82ARcfqyapta08jyGC+PpwCBP
         W7QuqC4BjNZW0Jzp2qDp2ZHPchkdldNN6VGVuxE82W4xAEYKnaKvlqCGxyM8p+YYC8XD
         TPA8/7Y6jjv9H81bScnZMFANDISkjEwKFBzqvKS9UAd72c1l6bbjagPG0KCupBpIW2Jb
         cyeLQFF4S9gUsdUwIiz8C5ISDcjsndYwURe91AzHUwRgsFc3UAdS3s2k/EjYNMFsKH1+
         SplQ==
X-Forwarded-Encrypted: i=1; AJvYcCVx1NSVzLwIKcFPpGb6tCv9NRWGgnhS2Rtt9y6BeW9noczxCOGuCCMq23drFFeDPZu1F8yE/XLkl2fPhw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxMp2YHLQjtXOV7hGxptxb1J1zZlR6vPP2NbgRMPhV/sabe2c3j
	DRYMFpRmRZhJxsAD1I7/rSHzDqUU+HanYhWML3pRxI+rStiVKGmTikU+
X-Gm-Gg: AY/fxX4/pRlAkk2kjHSsQkKAiimSJoqr1VXYLsW6Bxxxbuxto6wWnoyllZWKDalCYLx
	09w3dVZybU1Vgqh35blJKnsBCnKRYnKvijMS3XW+PC1xdaaKBHnlWD9BL8xRLiVswTJ2Q6Zz5jX
	MvndNVcjF2zQA/GRO3tJGj7bdfkT1vbtXLO+/oNHiGTfYPs5AZxbyLblC/ELnZDFdi9lQEt+Gid
	JBjPGRusCoXmpo82RbpJAC1p+eMmIXzqxvzPUTPj43BwXwVx1pm3NNfpUSb63OJHL0rHJiajeDo
	2g3/8v7Fq1jVjYOikUVbEub/NejbDaUcGSwi5/5ZrkygdhjllV2Gi809rlBwl/NPcggDURHWW++
	v2ZCe5wjf4TzTJ7Gl0RGLlldZwJJTmnw0Z2rFqnX7qIveSBOMJnevS3i2kTh3inug+FQKoDwsOo
	IRlpNSKUvQ0qYAdBFhNRE+Zw==
X-Google-Smtp-Source: AGHT+IH3p9ADp/oHBdoztOVSqKQjC9Vqk5imr82sTyt1OVvJnxpaC916KbcOtyFMgx08q9d2A6awgA==
X-Received: by 2002:a05:690e:1a20:b0:63e:145f:a4bd with SMTP id 956f58d0204a3-6466a849f02mr942310d50.22.1766108426712;
        Thu, 18 Dec 2025 17:40:26 -0800 (PST)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-78fb43782bfsm4425717b3.5.2025.12.18.17.40.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 17:40:22 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id 27D7F4001B5F; Fri, 19 Dec 2025 08:40:18 +0700 (WIB)
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
	George Anthony Vernon <contact@gvernon.com>,
	Thomas Graf <tgraf@suug.ch>,
	"David S. Miller" <davem@davemloft.net>
Subject: [PATCH mm-hotfixes 2/4] textsearch: Describe @list member in ts_ops search
Date: Fri, 19 Dec 2025 08:40:05 +0700
Message-ID: <20251219014006.16328-4-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251219014006.16328-2-bagasdotme@gmail.com>
References: <20251219014006.16328-2-bagasdotme@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=896; i=bagasdotme@gmail.com; s=Zp7juWIhw0R1; h=from:subject; bh=1tOY86lhWOCbSHsqmK/tuDEilXGPwKXl/15tM3wSixs=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDJkuqxc3vZ90ZFcEw8Rtxid2Hom5f4yhYqXFcq57N+59L vj0bM6pRR2lLAxiXAyyYooskxL5mk7vMhK50L7WEWYOKxPIEAYuTgGYiNE2RobF7lMmi/C/YzPS 7fCZWpbXxTBf8soDN/VTbIlqj6/Ud19jZGjc83oDg/Gns/PlE4ouzVAQWMm0aaeV5R+r5y+cjA4 wf+EFAA==
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Transfer-Encoding: 8bit

Sphinx reports kernel-doc warning:

WARNING: ./include/linux/textsearch.h:49 struct member 'list' not described in 'ts_ops'

Describe @list member to fix it.

Cc: Thomas Graf <tgraf@suug.ch>
Cc: "David S. Miller" <davem@davemloft.net>
Fixes: 2de4ff7bd658c9 ("[LIB]: Textsearch infrastructure.")
Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 include/linux/textsearch.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/textsearch.h b/include/linux/textsearch.h
index 6673e4d4ac2e1b..4933777404d618 100644
--- a/include/linux/textsearch.h
+++ b/include/linux/textsearch.h
@@ -35,6 +35,7 @@ struct ts_state
  * @get_pattern: return head of pattern
  * @get_pattern_len: return length of pattern
  * @owner: module reference to algorithm
+ * @list: list to search
  */
 struct ts_ops
 {
-- 
An old man doll... just what I always wanted! - Clara


