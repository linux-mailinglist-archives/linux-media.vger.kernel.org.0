Return-Path: <linux-media+bounces-41792-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 182F5B44D26
	for <lists+linux-media@lfdr.de>; Fri,  5 Sep 2025 07:19:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D1D8C580BAA
	for <lists+linux-media@lfdr.de>; Fri,  5 Sep 2025 05:19:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 867562749F0;
	Fri,  5 Sep 2025 05:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M59+WIdf"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AF7C23BCE7;
	Fri,  5 Sep 2025 05:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757049516; cv=none; b=ZtX9lJDWw0Fjg+KwD3gR88UwQD2TWNlcTvtSMiEkuAow31+UbgxKPSTQogQXKCMC9QQYXfKLHYgKQH7Xufv+Ps6wQaIENxEMi82a6sMZvMXLCP7PRRh/28almKCvDJr2uT1tZITO+uGUU4mPs3+X2eByOv4AqUEZLNHdHxkRM40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757049516; c=relaxed/simple;
	bh=ScGC2AGxune2zMROJkc2Y7d2nJN6a9O2fdhGyhiHV+E=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Zhb4BszE+galK35GdSbHDH0KNqKtRxWJdlGoclOcxUw5FJpFb0koEmCejNU5ove2erzZ0RUx8/G7csTUuG77W5ftzJTreeNI12olyluZnEVzkOVLFIfE00hjLXbT8ykKJsv0CglcV6MqJAzNj0rChFn4lGGS5I5vZTad7ozjfVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M59+WIdf; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2445806e03cso23720125ad.1;
        Thu, 04 Sep 2025 22:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757049515; x=1757654315; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JhZxxIT+0dKegKeNthBk/Eo+TTCf9vyu6d/7qCKUzow=;
        b=M59+WIdfM7yj9qVVkgZZX+AVOT4KrTltT2rKQg0Wm3mwICur5fAUgJcnY+foFEQNvi
         I4IXBs5R7GmYZMzlYiGstxypFwEBuE2BSq5fqmTVJf7kpk9mj/4QsG9hetfG6CZhZPs7
         1LdYPOaI7sRvhwzm1w8mI4sPl4SOwXD7VNjCoKSdZ6trwHBwGxydDpWH8aIDdfwuO/47
         juWbl5wpdwTw0OnJTTDn00V5dWH/yp4dlNxIVUtxXWgmuevrsapianpX3iosWoXyckcR
         kg6blPobG+srIgw4TgyMQo7UFHH1RGHJTVj54Nack1CBKJ7jNkuCURoKHEMLPqZSrjAW
         8ecw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757049515; x=1757654315;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JhZxxIT+0dKegKeNthBk/Eo+TTCf9vyu6d/7qCKUzow=;
        b=FZph1M6x/qV276tuEt/QsAsY8HyHEPsgJs1vkGS/NqFFxCVV4SPjNh0WGq3zwSC5Ec
         qooCIgY42gqHW8XzZyAu0+CtXnfuxVpeUhfdrV62pMe7BrO78b29JizN0C/2hyHQqgs9
         L/CY6zL9k1CGCgmQVm2NPR1mWqoBVy+HvRzObU8+3szSVX02iFZ7UwK/stt4EnZEP86g
         c2Bmsz/1d3JCJLqkVHJN5UH8JuMdjYeoVQD7ERYnv5+YxpDlo5Ct2k5M5Gil14imi5fD
         xjEnt7pWHSkVrIP47JKx2vhSj02XIFzaHvj/s/KLC9cVAGv2NdRlTdQGIAG/HKlX1Mqj
         5Zxw==
X-Forwarded-Encrypted: i=1; AJvYcCVzwoyA5ykc2BX3Brp2IuQH+3hurSXU0uA4HXxMLlYFOF9wbTiZby5o37DwE4+cygrpCHo+JAuG@vger.kernel.org, AJvYcCXTbpGuHoOh95KkcG4wYwrVtBow6+PigSUvck9wNagCHifn3YBlxb7sht6bjmeOLxl9/559DaFd0fI8VB4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzNKq9qVXCoZjBLX2k4IVXctGPdys2h7EqHcC1gNoj9rnoNpWV0
	LiDrY97uw2wZvHxnk7OFJeZjgylBquAS9Y9d0wT/ebtVMSooavBZaeaL
X-Gm-Gg: ASbGnctwcZaFAxMDzbNFsqik8Thx8rUWsDfkuIff2YLK2/xvcMOWXGmbNEw/lyg0Hxu
	BNlaZOQhvmz18HeARSFdEqGAJHDeV16fQmMyzKcVPbSUGCHB8t3k4Sb5GhtWh3zaITfn9oKjoEy
	VieJxF5O9yPD/gDSP91MOmRP2t2A0Zod6QculBE9w/wsAoLve0+YkvVFAc7F+obOkT6h3j52Khv
	7Pzm5cQorG/a/Xpsspwd/07cR3rfAXC24jJsj4trVun9Sf+CSfhQc/dGM2Xs3JfJ7yW+oejVdBW
	CosYrowYc48iNv4t/y0CJCWwsRPrXaWTydDNv72XtvHg7W3ePraumMWGM8GnhCXLGrHvEn8gLmb
	OZkouIu3doEHGh8rZp90t1SzOmGjjFeps1lJnuFbcs2Ng7KRBc58C/89aYgMr
X-Google-Smtp-Source: AGHT+IEWHQovoGSU+TCkw/LxMDsaqcm+NM3zYxivw3ZtxGRxYR4UAjK16bGucWPy85cu7NGNivm1Iw==
X-Received: by 2002:a17:903:1a0e:b0:246:cf6a:f00f with SMTP id d9443c01a7336-24944a9b4b4mr314118315ad.31.1757049514686;
        Thu, 04 Sep 2025 22:18:34 -0700 (PDT)
Received: from name2965-Precision-7820-Tower.. ([121.185.186.233])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24cb01df2c0sm45193765ad.86.2025.09.04.22.18.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 22:18:34 -0700 (PDT)
From: Jeongjun Park <aha310510@gmail.com>
To: dwlsalmeida@gmail.com,
	mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	syzbot+1d9c0edea5907af239e0@syzkaller.appspotmail.com,
	Jeongjun Park <aha310510@gmail.com>
Subject: [PATCH v3] media: vidtv: initialize local pointers upon transfer of memory ownership
Date: Fri,  5 Sep 2025 14:18:16 +0900
Message-Id: <20250905051816.4027814-1-aha310510@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

vidtv_channel_si_init() creates a temporary list (program, service, event)
and ownership of the memory itself is transferred to the PAT/SDT/EIT
tables through vidtv_psi_pat_program_assign(),
vidtv_psi_sdt_service_assign(), vidtv_psi_eit_event_assign().

The problem here is that the local pointer where the memory ownership
transfer was completed is not initialized to NULL. This causes the
vidtv_psi_pmt_create_sec_for_each_pat_entry() function to fail, and
in the flow that jumps to free_eit, the memory that was freed by
vidtv_psi_*_table_destroy() can be accessed again by
vidtv_psi_*_event_destroy() due to the uninitialized local pointer, so it
is freed once again.

Therefore, to prevent use-after-free and double-free vulnerability,
local pointers must be initialized to NULL when transferring memory
ownership.

Cc: <stable@vger.kernel.org>
Reported-by: syzbot+1d9c0edea5907af239e0@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=1d9c0edea5907af239e0
Fixes: 3be8037960bc ("media: vidtv: add error checks")
Signed-off-by: Jeongjun Park <aha310510@gmail.com>
---
v3: Improved patch description wording
- Link to v2: https://lore.kernel.org/all/20250904054000.3848107-1-aha310510@gmail.com/
v2: Improved patch description wording and CC stable mailing list
- Link to v1: https://lore.kernel.org/all/20250822065849.1145572-1-aha310510@gmail.com/
---
 drivers/media/test-drivers/vidtv/vidtv_channel.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/test-drivers/vidtv/vidtv_channel.c b/drivers/media/test-drivers/vidtv/vidtv_channel.c
index f3023e91b3eb..3541155c6fc6 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_channel.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_channel.c
@@ -461,12 +461,15 @@ int vidtv_channel_si_init(struct vidtv_mux *m)
 
 	/* assemble all programs and assign to PAT */
 	vidtv_psi_pat_program_assign(m->si.pat, programs);
+	programs = NULL;
 
 	/* assemble all services and assign to SDT */
 	vidtv_psi_sdt_service_assign(m->si.sdt, services);
+	services = NULL;
 
 	/* assemble all events and assign to EIT */
 	vidtv_psi_eit_event_assign(m->si.eit, events);
+	events = NULL;
 
 	m->si.pmt_secs = vidtv_psi_pmt_create_sec_for_each_pat_entry(m->si.pat,
 								     m->pcr_pid);
--

