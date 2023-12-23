Return-Path: <linux-media+bounces-2940-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6093281D2DF
	for <lists+linux-media@lfdr.de>; Sat, 23 Dec 2023 08:23:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8BE3F1C22445
	for <lists+linux-media@lfdr.de>; Sat, 23 Dec 2023 07:23:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 676C67484;
	Sat, 23 Dec 2023 07:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Csb/Gc1I"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F1726ABF;
	Sat, 23 Dec 2023 07:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-3bb82d1d9d6so1584458b6e.3;
        Fri, 22 Dec 2023 23:22:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703316173; x=1703920973; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sNfo77EiD377cQ7ylz3OMNqhiLCn7Bf56izU6yp9keU=;
        b=Csb/Gc1I9l+P2WFlFDHN9nQ8cVv7MN1AS3Fsp2pz9ijvNjnAyRTtTWxmk664w667YP
         OvZQUldjCYGmNyblGpqjGUFaTdOlG3uMuSqPT1tE6wY+b1wDgKBd66mJpnyCEyozo057
         UaVGetBm7ySZsqWIB5vLXMngZc7CEFJ4cntvJTsWCMz6nKKC3cvTm4z12GJQNPcBbHcW
         hJR0NgMRcmTOZP1HNM6fMX/VYf1U3/kfAyDn9m5KhNUE2+cvQrtZa31bBgkpvi615UqQ
         kIRK4Dvsi5OAHOMNGPx0O02lfPkKk4tsyqsl46hGCgXfMXnIzRbiwbx2+VXF81xmZt5A
         RVtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703316173; x=1703920973;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sNfo77EiD377cQ7ylz3OMNqhiLCn7Bf56izU6yp9keU=;
        b=aYMv2/ikZYVkDkJnTdPZgmDw9215OgVuG2tqtnSwZV1USbpalwykX1YbYjDeSMBnGN
         lKh0XeE4T3+CSPuwa4NxukiS5/SOjWxMCQxg1lPTQFm+8xjot1uYaKznbZftIZyRplk7
         W1MUf8io7zFiTyIUNiTMQnXkLy/Twi0Vu8O3mpafztp9+7ER3dgBAePSVhW+YDDY8eTp
         Wr72RIFXeuV10Y8J/HnwFdIq0RcDGMAvmeL7U/pno+cFUsyBRi1ishTfGjlI3UhlosPy
         /77PKlR6uE6Z5/qUJcT4t+ewJLuiZK/9TGw3gbTEWrV//tPsY8kKPxVnCGydydLLTnwy
         Feww==
X-Gm-Message-State: AOJu0YyZE9R384WH95/AvXVa9NVdk3rJLrrHfAYtHj6zKVwH3kxLNWRu
	Ecj5OIEJroj50fvUXiSghn8=
X-Google-Smtp-Source: AGHT+IFF55fkH3MfEXKsaer9jFXCaeNRv3FjwluAYkN+PJH68bnw13o1BXJrd+HUY1f+AsGNJCeqqQ==
X-Received: by 2002:a05:6808:318b:b0:3b8:b063:6ba9 with SMTP id cd11-20020a056808318b00b003b8b0636ba9mr3481308oib.88.1703316173647;
        Fri, 22 Dec 2023 23:22:53 -0800 (PST)
Received: from localhost.localdomain ([2400:1a00:b060:2b26:f462:e3d9:c28:4c99])
        by smtp.gmail.com with ESMTPSA id kt3-20020a056a004ba300b006d9723c0373sm4241378pfb.33.2023.12.22.23.22.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Dec 2023 23:22:53 -0800 (PST)
From: Dipendra Khadka <kdipendra88@gmail.com>
To: hdegoede@redhat.com,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org,
	hpa@redhat.com
Cc: Dipendra Khadka <kdipendra88@gmail.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH] staging: media/atomisp/pci/runtime/rmgr/src: Fix spelling mistakes in rmgr_vbuf.c
Date: Sat, 23 Dec 2023 13:07:45 +0545
Message-Id: <20231223072245.81630-1-kdipendra88@gmail.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

codespell reported following spelling mistake
in rmgr_vbuf.cas below:

'''
./runtime/rmgr/src/rmgr_vbuf.c:201: succes ==> success
./runtime/rmgr/src/rmgr_vbuf.c:211: succes ==> success
./runtime/rmgr/src/rmgr_vbuf.c:215: succes ==> success
'''
This patch fixes these spelling mistakes.
It is good to use variable name that gives
proper meaning and spelling error free.

Signed-off-by: Dipendra Khadka <kdipendra88@gmail.com>
---
 .../staging/media/atomisp/pci/runtime/rmgr/src/rmgr_vbuf.c  | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/runtime/rmgr/src/rmgr_vbuf.c b/drivers/staging/media/atomisp/pci/runtime/rmgr/src/rmgr_vbuf.c
index 2e07dab8bf51..1f24db77fe38 100644
--- a/drivers/staging/media/atomisp/pci/runtime/rmgr/src/rmgr_vbuf.c
+++ b/drivers/staging/media/atomisp/pci/runtime/rmgr/src/rmgr_vbuf.c
@@ -198,7 +198,7 @@ void rmgr_push_handle(struct ia_css_rmgr_vbuf_pool *pool,
 		      struct ia_css_rmgr_vbuf_handle **handle)
 {
 	u32 i;
-	bool succes = false;
+	bool success = false;
 
 	assert(pool);
 	assert(pool->recycle);
@@ -208,11 +208,11 @@ void rmgr_push_handle(struct ia_css_rmgr_vbuf_pool *pool,
 		if (!pool->handles[i]) {
 			ia_css_rmgr_refcount_retain_vbuf(handle);
 			pool->handles[i] = *handle;
-			succes = true;
+			success = true;
 			break;
 		}
 	}
-	assert(succes);
+	assert(success);
 }
 
 /*
-- 
2.39.2 (Apple Git-143)


