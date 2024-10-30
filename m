Return-Path: <linux-media+bounces-20561-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D8FD89B5BFD
	for <lists+linux-media@lfdr.de>; Wed, 30 Oct 2024 07:48:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 696C71F24315
	for <lists+linux-media@lfdr.de>; Wed, 30 Oct 2024 06:48:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA5441D5CF9;
	Wed, 30 Oct 2024 06:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BNYqlyk6"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com [209.85.214.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5963B1D0E27;
	Wed, 30 Oct 2024 06:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730270916; cv=none; b=H8KiDluz7fLFAIsatdpGbOq4H5MF/X1S01WI+Fs57jrSPkuh2lXFrK/zLrDAyPMojcPWtediBDKqv1PvbX7MKTdN3rZJY1T5MOpZppLtfJdBiUU3UmXpOX+VSFTrYRihpcQhstK0ls2qTJslr/DW9D+ry+Zet5Jf14+6nc6eY+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730270916; c=relaxed/simple;
	bh=92RQnOORjAJsaNb2qDBDg22hmUK/J5GkQTPRwalOP1E=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=kNjy5bYkxfn7aR5R98TyZQLW3vRqmRrxQ4HBKHZ1tRkXRVFqWj5mdpd2HohaaNr6OQ0Ab4KWme+EmxZ4Fl+CF7uuhWXq6vhlqSUvtGafeKDWt6eL55XbwgL1nUSfiSchkZed1kAHjgBU/VSAJc8MhrSZw4Ey3LDcJJynUNx8KyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BNYqlyk6; arc=none smtp.client-ip=209.85.214.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f193.google.com with SMTP id d9443c01a7336-20cd76c513cso58139485ad.3;
        Tue, 29 Oct 2024 23:48:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730270914; x=1730875714; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NLH+mb52MPyjIXhx1azIc5EcwOmHKk4FSK5JYKVOnRs=;
        b=BNYqlyk6wc11Ulx0Ks/DLx8q8tXwfw+W/ZCYu6h3AsIXQNkj8j/VHqb9AwHYc+KsFP
         pzAWvRyX/FdR3fAVQrKAiwOet1gD0GXFcMsh/HEiCPch3eXiUXfQBbus3Y6Bh/iEzxLp
         vr/SXemFdDI4EYtDzvxCqFg28LAdpoDQRLLF1W6yUlb8X1ABZ+ZIZ+P68NQCuWHuHJVS
         lgaQLBVhSBGGpwhiwiUvJ9wz/BxkQDNGtRzpXeMpzpNa7JafKMyCY1nV3u01HBDswT3e
         /WFIFQDxwt+bpl9rkZMBXoEfMYl3mDz+oa31KAtFA4AjhwfMTNdTTCJsKy5gCB1BtRzu
         voxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730270914; x=1730875714;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NLH+mb52MPyjIXhx1azIc5EcwOmHKk4FSK5JYKVOnRs=;
        b=Q+Ub3htES2dK+lDpSZEyT5vIUTWoJQ0s6kN9uL84MWA97GyrMk+4yEMve+aFOIgSbo
         LjYMQww6L3+eiXlv3NUglt/B4Q1XW/rduPNNlTqhE24OU6t7T5P6+TY1Tn4oSYzDsa47
         xuOFJ5qzGtSwtXdoWRVGR3fDkYMRSYiLvF3AbL3FCbmMEOFkXa/HoDR/UG8MSl8AuMgY
         aIyMAptDqO8t3lKQx8/zLw7IICpHJMbkf5+oYJRjhi2eLWbbABXa88l/C1yB+O8DW9D/
         MHr0t3UDG5dHESSjjUe1UIJBvMJiZPCl/rY13IuNcz99tQUuoG9T7aFEbsbOoCuQnFg0
         /pVg==
X-Forwarded-Encrypted: i=1; AJvYcCWTcsSLxMXHvQmTBdGknNKDz3hxI5/RFJHDjKEmrxAqWq+g1U//DsUsxhv72QifPaL7sIY2DyDC@vger.kernel.org, AJvYcCWZ+pAVU0nRx/pCsvtSiChBGDMyviPp219Uwlkfei69stcPvH6qgNad7ADoIqoM0Givsdqm5je93n9CdXw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLCPj1BwTQX/6P+5ZjIHo5iCtliD5R5s4PLX4JKu5L9qu6D2vy
	mwarnhATUyxGuWBjndf9Cd/VT16vnmAf+0bJL0n1FyK2Sbn6j3VV
X-Google-Smtp-Source: AGHT+IGbovcA7DAuva0hpZ5aQsAvIcP9p5SceqDodQnH5kIGmYD19P1JUT1Hv70RIaRgZNs/qLZ9dw==
X-Received: by 2002:a17:902:e5cf:b0:20c:5bdc:c228 with SMTP id d9443c01a7336-210f7508efbmr27270015ad.13.1730270913549;
        Tue, 29 Oct 2024 23:48:33 -0700 (PDT)
Received: from tom-QiTianM540-A739.. ([106.39.42.118])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-210bbf43460sm75989155ad.23.2024.10.29.23.48.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 23:48:33 -0700 (PDT)
From: Qiu-ji Chen <chenqiuji666@gmail.com>
To: mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl,
	allen.lkml@gmail.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	Qiu-ji Chen <chenqiuji666@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH RESEND] drivers:media:radio: Fix atomicity violation in fmc_send_cmd()
Date: Wed, 30 Oct 2024 14:48:24 +0800
Message-Id: <20241030064824.6122-1-chenqiuji666@gmail.com>
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


