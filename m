Return-Path: <linux-media+bounces-27562-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ACD18A4F916
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 09:45:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 69ECA188FABE
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 08:45:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1564A1FE46B;
	Wed,  5 Mar 2025 08:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LueItAY8"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28C681A2388;
	Wed,  5 Mar 2025 08:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741164329; cv=none; b=rTk29fzGX5EVOd/SrU5/ChsAkXvPVwoitFBkuN+oehfuqjVX30QYJZ3Rh4SV/nQO3efZ+kvk/R0EH3r0U5SPCzZ5n0u8rSUCG57f9PVCqFahbqLAg+5fwARy5ig6052kHmxqzQkv3VuBU1Req4fo2bH62rpeOyU7jWb/wZr1ZBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741164329; c=relaxed/simple;
	bh=S42apcJopw6lMBL60g2IkAzYpNOxgwv2Cpr4/ENCP9k=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=dvlI9nPTP/tsfd5st14ODABJnrCbGx5Jz8+3wey6sIFNjhmto8RdDH4ohvlzzXUsx4fFXo9J97VLc73lalqfu76k6euzjT3mnn9TN+sONZbzE35GXaRJ18Eh/6aoXE6CnZUsaj/jlMmPbyRNK+nUg3ymshhoiS445eWUHAMoOkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LueItAY8; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-223959039f4so74708035ad.3;
        Wed, 05 Mar 2025 00:45:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741164327; x=1741769127; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Rqpz8NuFEKxlJYYhCortmvxtTD3Iriop0nreRrYWvRM=;
        b=LueItAY8OXTLOJY50ckuzP6gG/y/kumNa28G1UwwLMiCvnIKaq8Y98KqhNSOfND4Qh
         jrP0r7W8i3o01yZwWOsYikn/NpzO2+yn5kZNRDfH2lIG64H3gUAL+Nu1VHkeAaoxmT+d
         0DICmecoIPwWpPQK9uTAxgwDwMGqmkx0/VZKeg9ISGe4vUoXNx7qpiAye7wPmolp7Tcy
         eboSYp6J8WtZDMbdOUu9JYQC5wDe8zLWSnXgU5L5pTqUuwGFuUKdXtI64sA7BdANmVYw
         0W2lfMi95f2T6TT69nknumf0Bvib1ZESXX/XaUt1mmCWkqu1nlCsJdpBprCm7a4HsJVj
         H6jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741164327; x=1741769127;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rqpz8NuFEKxlJYYhCortmvxtTD3Iriop0nreRrYWvRM=;
        b=vgpeFTGlIc+Dam2ZXMpZDUaKX/hCB9VHX4oj5Gj3eh3kxfQ4sIyVtrmmMdg7rQU2kW
         00irWqlsOqdINTGmHNzSgduEAsYLdqy9VILgeAdANOVNLG89vRPC8b9N8j43Al/69XqP
         M6BlVx4XwKKOJ2FW40pVs1tQUi7JiEQX1Xjuc2OD9wUOGzmc1td8Ixxc4o1RcYA4q0kK
         lPwEHUHOv2HWIN81rHnhFyx5UWO7gxt1ZR6Sijsukv2OCA7KQYhGCLtriSR/g3M/9Hhq
         pCbybPzmFK2gdTmV42v8SKcGzecUO3V27YQBqDXVqdIip3YwXIbpuq31T645L1Hei+oA
         Q1rg==
X-Forwarded-Encrypted: i=1; AJvYcCX1RvwG/lmg30heyh4wjUmyrpCKGqNJoGBPBAJ2sQLV+tjArIdOeXeWZcc+5f1kscapNrBvVPaetdcc1V0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxukfevLWndxoT9ywQjiFSsTIIbyHGipVFpKuDO43E+NklH7Kkh
	rAvJauluOPRyFBXlkfMANvgugdDpUSJ8PQhMtkgfTU0UjQBVNk+TGkaX2BOI
X-Gm-Gg: ASbGncstlngoNM3tcFRQeqfR0rG0b8nvrpiyBzN7DKJfmcnuyGbEGKjB1g6iPN/a+Mx
	9VPfimI7c/wGwvPYJu+XocgnAYmZ4mpmzXi8zsBizy0y3dZzmEquupQoBMcpRD44ByVkXZykrog
	mrjUmbdT1YCizqA/Tfg8qj1gRq9XWjRP7i6WzocKkIh5ZEqJqdtaok+2Fs/GUQ9Htbzd+K/ZcAj
	nD8lfOWCqRzcQm/vCHFKsj/f7jmoZZiu6o5I1AiqLJ+oMtvFaNCz0ueAbQERE4KStfqp1rbRenj
	p09Tf5t3Z9ZJkumve7FR0GtW98TCvsvxu12EHuJA8h+XP6oqFdHy2QU6OYTHsWwGIMlCIzr2ISg
	bB+6PKfL0QBLuZc5z
X-Google-Smtp-Source: AGHT+IEmMT/Q1ZyuHiSkgiaUWON5hc3roCdGiEGL+IQ72oapCvNgtlkFvSMFcuntcc+xDBZtRtmJWQ==
X-Received: by 2002:a05:6a21:150c:b0:1f3:4581:ce85 with SMTP id adf61e73a8af0-1f3495bfeadmr5303878637.36.1741164327322;
        Wed, 05 Mar 2025 00:45:27 -0800 (PST)
Received: from hcdev-d520mt2.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-aee7dee0ba3sm11433768a12.68.2025.03.05.00.45.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 00:45:26 -0800 (PST)
From: Michael Chang <zhang971090220@gmail.com>
To: kwliu@nuvoton.com,
	kflin@nuvoton.com,
	mchehab@kernel.org,
	zhang971090220@gmail.com
Cc: linux-media@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: nuvoton: npcm-video: Prevent returning unsupported resolutions
Date: Wed,  5 Mar 2025 16:45:17 +0800
Message-Id: <20250305084517.1301054-1-zhang971090220@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

To restrict the returned resolution due to Nuvoton SoC hardware
limitations.

Signed-off-by: Michael Chang <zhang971090220@gmail.com>
---
 drivers/media/platform/nuvoton/npcm-video.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/nuvoton/npcm-video.c b/drivers/media/platform/nuvoton/npcm-video.c
index 234fdec04f74..8d6d51a674a3 100644
--- a/drivers/media/platform/nuvoton/npcm-video.c
+++ b/drivers/media/platform/nuvoton/npcm-video.c
@@ -578,7 +578,7 @@ static unsigned int npcm_video_hres(struct npcm_video *video)
 	regmap_read(gfxi, HVCNTL, &hvcntl);
 	apb_hor_res = (((hvcnth & HVCNTH_MASK) << 8) + (hvcntl & HVCNTL_MASK) + 1);
 
-	return apb_hor_res;
+	return (apb_hor_res > MAX_WIDTH) ? MAX_WIDTH : apb_hor_res;
 }
 
 static unsigned int npcm_video_vres(struct npcm_video *video)
@@ -591,7 +591,7 @@ static unsigned int npcm_video_vres(struct npcm_video *video)
 
 	apb_ver_res = (((vvcnth & VVCNTH_MASK) << 8) + (vvcntl & VVCNTL_MASK));
 
-	return apb_ver_res;
+	return (apb_ver_res > MAX_HEIGHT) ? MAX_HEIGHT : apb_ver_res;
 }
 
 static int npcm_video_capres(struct npcm_video *video, unsigned int hor_res,
-- 
2.34.1


