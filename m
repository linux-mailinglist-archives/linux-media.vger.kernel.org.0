Return-Path: <linux-media+bounces-18672-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BEB48988084
	for <lists+linux-media@lfdr.de>; Fri, 27 Sep 2024 10:39:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 760231F2262C
	for <lists+linux-media@lfdr.de>; Fri, 27 Sep 2024 08:39:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC3EE189B8C;
	Fri, 27 Sep 2024 08:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BbVa78MD"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com [209.85.214.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB5FF17A597;
	Fri, 27 Sep 2024 08:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727426356; cv=none; b=OmGlTzt/lCB+82Am4Z3qmjZW4H9ZMTEmcAokMipGcYe22afrk3jFNZg5/ftG41qq7pazk2vvaZPFOxlaQBQm61bZs/mMNHnmkzJdG4VZi8noF/1gyLutdQec35cFXLQpgQcPNexcJdHtvc89WDoeWBp5MJjIRfpUgar/os8yadU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727426356; c=relaxed/simple;
	bh=92RQnOORjAJsaNb2qDBDg22hmUK/J5GkQTPRwalOP1E=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=YP7L8QkWd0FYFbv8v3z8srT+2OQiddP5XLWjrHVudG4WHrDYj7eagP6I+R/LECOsso/HBh3QRFtCYhwcq36t08Y1g+1cecvLJ5yk/s3rrZ7mc3KhST7xI1QaIIBdZDNwT9rUnzG2JPevo0CMmhAXUiG9dYpVMbQJwxvdIMbdXUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BbVa78MD; arc=none smtp.client-ip=209.85.214.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f193.google.com with SMTP id d9443c01a7336-20afdad26f5so24090825ad.1;
        Fri, 27 Sep 2024 01:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727426354; x=1728031154; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NLH+mb52MPyjIXhx1azIc5EcwOmHKk4FSK5JYKVOnRs=;
        b=BbVa78MDsE3wT8EcDZMByZcV7ncxjtZrE/4cL7+3e/kKDX7ASJ3nXv0Hx0Xfy6cwaH
         B3PfnSOrja7KHi6PA644sV3/zTy5PQmRrM3Y+RIMAAd5GMrHASHd3MNQsB7zOVGS8P4l
         8p7cMAl7JFQ3CIuj3Y/icElwm+PUFY/DlOsAiJCM+yvnFLh/Wnvpc7AjmcJO/u2UCNmo
         YCUnPqwFeGt0tgPvxJEPABtXphN6w9rjunSjmr6FdxG+VowIkfh/J65Q+dq72DY5LsP4
         jrOFj53psqKZUUBEOyoblXmNHxAMTxlPJ6Px2zw5z9P1d7l0bD6k41NX1q8ICgMIE6cq
         4MGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727426354; x=1728031154;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NLH+mb52MPyjIXhx1azIc5EcwOmHKk4FSK5JYKVOnRs=;
        b=kpxNXxMpeEanxunessjnMUUU67noj+YdE/ds9zSBHwWYZeoNS/F49BaxiDRU4jwsee
         wqoEqALarAUbBheuXHx9gBvboTdoJ85EqFg4qpYnP1mb55NQsr689cv2f/GR5KC5t9u7
         +NfWNU0ISE9AOhRh6fzlyitj0eVqqA4ixhALG1fF2yLL/88U9IChhEaj5eEpjj0J4n0F
         m/9yYqx2hUPSOL/SFxXGGSlVx82+1mNZYW4xUiAZ1k3paHBOfCgmuclmOaYzsKd7PyXT
         OG76YWkHF6H9UWYn2iSe63byxb32UL49j+Nfs0QwD7wy7Lki2XM1jX8savXsRtYX/Hbk
         FReA==
X-Forwarded-Encrypted: i=1; AJvYcCUqCA/PH1KCGPsgb1D1WC+Basc2H0SyrzrUubqrGfVgYgEAEs9VGNTnfL0QOz/TwIzpcNZp1lOsNpVtREY=@vger.kernel.org, AJvYcCWWo2n8rK3wYDPmzGjSB00hWNKmiHZQQya3lepep4CMr3fSVeENRKDVnum7vSwmbW5js9148Cux@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7k5zXLPyh3LW+kvVVatuDaW9FfiNAFTS6V8CrzHJBWH4V5OAo
	GEtNAt5P0MYpHd2a8zib1yha7R/3IMFixedlwS01uFmc6FSW5oMYSObSZoEt9XNE4w==
X-Google-Smtp-Source: AGHT+IGCsiNRL8D++wZZcakGR4RpsXKuis0FJ3wkBnjIimX+d6oBcz/yejgeM2DrBMWfYCsLhkGoww==
X-Received: by 2002:a17:902:d2ce:b0:206:cc29:e4f7 with SMTP id d9443c01a7336-20b3776e0f3mr41452075ad.34.1727426354025;
        Fri, 27 Sep 2024 01:39:14 -0700 (PDT)
Received: from tom-QiTianM540-A739.. ([106.39.42.164])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20b37db0272sm9482975ad.114.2024.09.27.01.39.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Sep 2024 01:39:13 -0700 (PDT)
From: Qiu-ji Chen <chenqiuji666@gmail.com>
To: mchehab@kernel.org,
	allen.lkml@gmail.com,
	hverkuil-cisco@xs4all.nl
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	Qiu-ji Chen <chenqiuji666@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] drivers:media:radio: Fix atomicity violation in fmc_send_cmd()
Date: Fri, 27 Sep 2024 16:39:02 +0800
Message-Id: <20240927083902.7088-1-chenqiuji666@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Atomicity violation occurs when the fmc_send_cmd() function is executed 
simultaneously with the modification of the fmdev->resp_skb value. 
Consider a scenario where, after passing the validity check within the 
function, a non-null fmdev->resp_skb variable is assigned a null value. 
This results in an invalid fmdev->resp_skb variable passing the validity 
check. As seen in the later part of the function, skb = fmdev->resp_skb; 
when the invalid fmdev->resp_skb passes the check, a null pointer 
dereference error may occur at line 478, evt_hdr = (void *)skb->data;

To address this issue, it is recommended to include the validity check of 
fmdev->resp_skb within the locked section of the function. This 
modification ensures that the value of fmdev->resp_skb does not change 
during the validation process, thereby maintaining its validity.

This possible bug is found by an experimental static analysis tool
developed by our team. This tool analyzes the locking APIs
to extract function pairs that can be concurrently executed, and then
analyzes the instructions in the paired functions to identify possible
concurrency bugs including data races and atomicity violations.

Fixes: e8454ff7b9a4 ("[media] drivers:media:radio: wl128x: FM Driver Common sources")
Cc: stable@vger.kernel.org
Signed-off-by: Qiu-ji Chen <chenqiuji666@gmail.com>
---
 drivers/media/radio/wl128x/fmdrv_common.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/radio/wl128x/fmdrv_common.c b/drivers/media/radio/wl128x/fmdrv_common.c
index 3d36f323a8f8..4d032436691c 100644
--- a/drivers/media/radio/wl128x/fmdrv_common.c
+++ b/drivers/media/radio/wl128x/fmdrv_common.c
@@ -466,11 +466,12 @@ int fmc_send_cmd(struct fmdev *fmdev, u8 fm_op, u16 type, void *payload,
 			   jiffies_to_msecs(FM_DRV_TX_TIMEOUT) / 1000);
 		return -ETIMEDOUT;
 	}
+	spin_lock_irqsave(&fmdev->resp_skb_lock, flags);
 	if (!fmdev->resp_skb) {
+		spin_unlock_irqrestore(&fmdev->resp_skb_lock, flags);
 		fmerr("Response SKB is missing\n");
 		return -EFAULT;
 	}
-	spin_lock_irqsave(&fmdev->resp_skb_lock, flags);
 	skb = fmdev->resp_skb;
 	fmdev->resp_skb = NULL;
 	spin_unlock_irqrestore(&fmdev->resp_skb_lock, flags);
-- 
2.34.1


