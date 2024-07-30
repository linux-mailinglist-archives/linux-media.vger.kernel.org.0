Return-Path: <linux-media+bounces-15564-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DBB09411F7
	for <lists+linux-media@lfdr.de>; Tue, 30 Jul 2024 14:34:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F0BEE1F24235
	for <lists+linux-media@lfdr.de>; Tue, 30 Jul 2024 12:34:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D678F19F499;
	Tue, 30 Jul 2024 12:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NkjMfEvZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0027C19EEB1;
	Tue, 30 Jul 2024 12:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722342878; cv=none; b=JvUpMEVgi7sAsw3/TshmwILB58bKHdRU9c5+B+LLKo4jIknQn96sa2r0Sx3bJ4AhSPqFohQ7aSXRrGk9i2OREzbz1h1JHKJNcKwzBMUXTMgxH8uDXNMVgft6SPrE8kWyTImovx/6sYTKm4mc9l26ZnkK7f6YuSmirtbDNJ+QwWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722342878; c=relaxed/simple;
	bh=AheSok/set++hCKnCB869atTXJwLL5hA18wRr7jK5wM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=It2DZIV3a4JIEbMFRGiJLZAyqTArVWq8HLr5NX9xSOWW/fHG2W//5viuah673nUfmTKrlrGwNOPO2HLJcoYoYSFnwPsAshQxbIcTt2rXYXUSr9ANh/kAtkZGTSAAL/U/GDIORFH+fnrMKxcKhnyT2JtpYVNL/Wv7B7SWPjMO5AI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NkjMfEvZ; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-70d1c655141so3113560b3a.1;
        Tue, 30 Jul 2024 05:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722342875; x=1722947675; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9FkvLRq3+TTTPGRtqPvtfbmioR0sEJjLCE36JfFewt8=;
        b=NkjMfEvZpVTf9UHvOgMtz3Hssc+eitH4F0+OLo3IO54/zZQd8L0yo5QrcPbu+t6X6g
         UiP7n+SSCFFiAujvL6GzgKnQLi386Bg1dR1pshFMZDj4M/G+SSehELmNbspfxebciuWN
         zRxHFCn1JboRh0nLSXSs8PjlCgykl5SKSYPVt+x6krHKRTlqOQkjHcUpRYxJuSKU1v21
         Dws3QuwdCJ6iAJiZS20GhCsrmPISHGZ9uNrpJfD+J1uwuQJxmqaziL+PBwR6BDqk6Ks1
         gZOc61J6SV2NlSVpmK4H3CJCPU4j6ykXzJoroNILMkeuMVzvFQrFcmGMWCFEoCGNEFSk
         v00Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722342875; x=1722947675;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9FkvLRq3+TTTPGRtqPvtfbmioR0sEJjLCE36JfFewt8=;
        b=ci06oop7iOej7VAELP76I/eDj8kQluKo3odzfsW+dT7eYIvdTT4yQVbXQf0Ue3h6Ag
         qKzqAtNQjCls8WsHQ7c54/A28RHuFVjqHeRnt0/4P6vDPquxt6mcKlk6tTJXa//eC2fV
         WVE55Hm7SihPGnTdRfMiYRsXiOusqFVjGcvJH7NzE5Vi+BcxOSEf442v1lL+hS+f4f8E
         ivu7d0k88iKBQdkFW/+186Lw+Sp2kb+bD7Szq3qBRuQgl/omSfHw+XKrGxIu2ZWRiw0z
         4QuTnU5FY+DOhocpzk04sHspDPLevp+y3QeLROdJMMYeBmKJ0MmSRBoE3+NwMBIYlDPk
         IMXw==
X-Forwarded-Encrypted: i=1; AJvYcCUqdlaWw6/1I9v1Rb+J6qn+Vobi846dh8n5F/7694q331YrIs2vG0PnzdJjiueaVLSH6upBKwhLKjlnmkEWaa635Whm+zcQSQKKuch2VchdEfJ6XAeVmwx11jjvsPh9ULNLFpUhSUbpUzA=
X-Gm-Message-State: AOJu0YxDjLVJ7aEdwlVtXhhSgND1yFIakdWxk4A8vhTcAfLWC5D+BIFx
	W/R/xOB5BpccSg86MKIXP/oltYvRuIwxHoaK4Tze7zFAny82ffdNl6nW2MNX
X-Google-Smtp-Source: AGHT+IFvi3GdNcRIqS1egTY+BzvncDXNjUQwpDv4dZG9nbzXHJ4oUtfATQIpv9400XAbcO3JW46ZTg==
X-Received: by 2002:a05:6a21:7892:b0:1c0:ed80:6e69 with SMTP id adf61e73a8af0-1c4a13a35fdmr9106158637.39.1722342875290;
        Tue, 30 Jul 2024 05:34:35 -0700 (PDT)
Received: from localhost.localdomain ([211.171.34.11])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cf28ca1058sm10511890a91.31.2024.07.30.05.34.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jul 2024 05:34:34 -0700 (PDT)
From: Kartik Kulkarni <kartik.koolks@gmail.com>
To: hdegoede@redhat.com,
	mchehab@kernel.org,
	akari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: ~lkcamp/patches@lists.sr.ht,
	helen.koike@collabora.com,
	kartik.koolks@gmail.com
Subject: [PATCH] staging: rtl8723bs: remove space after pointer
Date: Tue, 30 Jul 2024 12:34:27 +0000
Message-Id: <20240730123427.37339-1-kartik.koolks@gmail.com>
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


