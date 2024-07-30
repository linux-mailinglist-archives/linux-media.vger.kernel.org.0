Return-Path: <linux-media+bounces-15563-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EE13A9411F1
	for <lists+linux-media@lfdr.de>; Tue, 30 Jul 2024 14:33:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A6DCE2832A8
	for <lists+linux-media@lfdr.de>; Tue, 30 Jul 2024 12:33:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30C5319EEB1;
	Tue, 30 Jul 2024 12:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XsDUNq3Z"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BA491990DA;
	Tue, 30 Jul 2024 12:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722342789; cv=none; b=A6jqiakirWP/zscwaXb/jS6HewpAkH/Y3D0wGcd16jsdludqsrk6aGZXeL7tA07AoOg/kywST+hV6M6PbGHGA7vkYFgtKKCqRS47ngTZntayrMDs4l8NhEqyNozKyvMa58Pbofk5gfOOz5m0xWpWrEaGkp4gcdtBUq2b8dJuw5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722342789; c=relaxed/simple;
	bh=AheSok/set++hCKnCB869atTXJwLL5hA18wRr7jK5wM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=swe6Y2w5JjgBV1Fp3VAvKwKqtvdtw4i9vLJEF3w4xZcj5OTRkAnpVuNbaJJ3itrN6zJLhyVDhHi9a0A0vhY0b6cFULnzATNCml/ABAgXLcY7lcDD01/Mq2V6k0PXdDg5Ebf9b9/Xv80GALbcjtSBtxyq0zSgq2QaSrFQpxyyjtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XsDUNq3Z; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1fd78c165eeso36790415ad.2;
        Tue, 30 Jul 2024 05:33:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722342787; x=1722947587; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9FkvLRq3+TTTPGRtqPvtfbmioR0sEJjLCE36JfFewt8=;
        b=XsDUNq3ZBfYN9LeWdKhaBME7i0qGHx4KbyCf8f5W7eQR/y0NsInyiTGAzMgFFD8Bam
         8sqHxBNIBBLugvjOWlYEouOzlb+qAsRAp4ke6/41qatAYFpoRgG/z5/g3RvAacJDWA9+
         Yx1Dm8BRr2ug3TlubyU1yJo8HoJJ5lJkXSbv1aeizS1AV3VfwUd1waZtM797B4N06+Gu
         bzmYtvt3tE072yNqP3sAuctE7ACCpaqBEHeuprpWbWU0i9oJ9PenuL2IQn7HFVMg71di
         ldf9phFKKHgv/i07tFARrzxr1Oa9ZUdRAkbPp2AU13q6KNtYCvNYJsyuu80nCdpFm5Mf
         s36A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722342787; x=1722947587;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9FkvLRq3+TTTPGRtqPvtfbmioR0sEJjLCE36JfFewt8=;
        b=ewfV7uHCDEO9kZMcsJPcUJnUdOKA76HuG8S1ntkJZaAGTtZZnYRhRxb8Q+pBWKoCxT
         g5CJyon3N3OoDDKCFpA36e2rE9RxvrAZ+iHFEROKBHlO5xu3yrcSkeVcXgn0NQVHcQCI
         sk0Fk5IStb29tBqU3MZ7fQ2zvePK9J01I01buMHgFSb/SIHDAVsnAeDBBwKTBbr55NZ1
         UQTWU40qNrvbvxDsDMstPz5eB+Jjsg9YReebs3dub9RE/BBq37Ox80d7eyDttI8HLUrS
         b3ZNtGlZcBQ38MDRt9l1ylPXnubpwxLPeMFkEpYGiNFRnXgOJPa80sqNjjPCaUXBm0us
         yR+g==
X-Forwarded-Encrypted: i=1; AJvYcCUKPElnw9i98zIYp6uFQpls/2eGAJc+GS2Pjxug60Zj5G4sDsV9cOCzDghN6ZB5kIP5ok0pJ7bvzyhWHlBZtNfFFHrUp32D7nfaX/h+osJaLCyBxPnzTbHaTj/ZNgznTcyNhwu5wZImdFY=
X-Gm-Message-State: AOJu0YzZVcqM2c29hf2jtwnAKN+z4PtD1MSORSK0bpdg1yRj90WB0Pmh
	b4W3wKmv8BY3iVLFJ1vBfWDVtfoL6RgSvJeRURDOPdB5G7MUldWFvPSqODXR
X-Google-Smtp-Source: AGHT+IGzfeb6Lejk58aaG/mwaqMMHfi37Q4Tnfjvgm4uUDOUCRrIj44meDeRI9kyyZ6lr/fLmKFwVQ==
X-Received: by 2002:a17:902:dace:b0:1fc:3daf:8a0f with SMTP id d9443c01a7336-1ff047ddf32mr154511905ad.7.1722342787405;
        Tue, 30 Jul 2024 05:33:07 -0700 (PDT)
Received: from localhost.localdomain ([211.171.34.11])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fed7ee1263sm100885645ad.122.2024.07.30.05.33.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jul 2024 05:33:06 -0700 (PDT)
From: Kartik Kulkarni <kartik.koolks@gmail.com>
To: hdegoede@redhat.com,
	mchehab@kernel.org,
	akari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: ~lkcamp/patches@lists.sr.ht,
	helen.koike@collabora.com
Subject: [PATCH] staging: rtl8723bs: remove space after pointer
Date: Tue, 30 Jul 2024 12:33:00 +0000
Message-Id: <20240730123300.37291-1-kartik.koolks@gmail.com>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix checkpatch error "foo * bar" should be "foo *bar"
in osdep_service.h:105

Signed-off-by: Kartik Kulkarni <kartik.koolks@gmail.com>
---
Newbie to contributing to kernel code
---
---
 drivers/staging/rtl8723bs/include/osdep_service.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/include/osdep_service.h b/drivers/staging/rtl8723bs/include/osdep_service.h
index cf96b5f7a..d6d651342 100644
--- a/drivers/staging/rtl8723bs/include/osdep_service.h
+++ b/drivers/staging/rtl8723bs/include/osdep_service.h
@@ -102,7 +102,7 @@ static inline int rtw_bug_check(void *parg1, void *parg2, void *parg3, void *par
 #define MAC_ARG(x) (x)
 #endif
 
-extern void rtw_free_netdev(struct net_device * netdev);
+extern void rtw_free_netdev(struct net_device *netdev);
 
 /* Macros for handling unaligned memory accesses */
 
-- 
2.20.1


