Return-Path: <linux-media+bounces-25072-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A2A0A18731
	for <lists+linux-media@lfdr.de>; Tue, 21 Jan 2025 22:18:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1C00F3A65EA
	for <lists+linux-media@lfdr.de>; Tue, 21 Jan 2025 21:16:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 268AA1F91C4;
	Tue, 21 Jan 2025 21:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="dcavbgJ/"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE85F1F8679
	for <linux-media@vger.kernel.org>; Tue, 21 Jan 2025 21:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737494100; cv=none; b=cb5g7Vb8E1M8ubin6p2kCW3sfJ3O2ROrGeQ+AwbQuyswc1Gev0PbQLDvQJ7ZgQK8733oxA1PW4m/hsCTsbYDu9RYvPm00YnmmP9klq0wwwSvmaKTNvooC40Lljh9zNhAq9UYEiL8OVz4UQDmB4/NMBGR9a9bwGErOdfS97KaShk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737494100; c=relaxed/simple;
	bh=zrzukfd2RSwrlmdRmszMLWOu2Hr/r69/z88bNUjZyEc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dqAa319gWIyIk/mOwIydyeRG23fBGbfAQGUj0NSBSkadEPkWW1y2LykNdWeXgMKr4wa5HzbZ1UeyW1B7q5XcNadII2Y4FevGl51+M3M4rd8/V4FD6FQLWxeODvR2RGIWAtIrLS9nIwWLUrAwcEzokM6qkR6O0778O3+cAqXj7yA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=dcavbgJ/; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6d896be3992so44492406d6.1
        for <linux-media@vger.kernel.org>; Tue, 21 Jan 2025 13:14:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1737494098; x=1738098898; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1rVEk0Dr4duA7/mRQLTXbAYgAr33LOipnA2cEKQfgjg=;
        b=dcavbgJ/PlCBN+f2NFcb/sRWK/nA90h2sFl2NXgxHquL54tapS9LM6zbb7MPtbITjG
         SYRLne3FFGDhORp4OiGpNxfis3Xg4CSGHHnVbnsQc8254BJw0OOu6mo7x7NEVrMVagpv
         AIfkLmo8oSdiez2aFk7QgZ6oS2rxhG7/qdcyE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737494098; x=1738098898;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1rVEk0Dr4duA7/mRQLTXbAYgAr33LOipnA2cEKQfgjg=;
        b=HS6pYycXziGe2hyHZkpnBBtLeJZktOgOMPcFLVZj8CVOwjTCbdGYyCWwlb/9+AtKnN
         U/LHfXcFb1V2ogRSMfnOnd3/N5a/0Riw9CUY30VHrDj8qKSSzB3k0iX9p8rftSIddq7E
         EZd2+Xxa2F1KYt/e531L2Thhz6tkq/dsTT94yvMdwKGWVMiR8H39g0TDK2zc5xplTTXV
         KSKzJS+0keuiWPV5nfAf3z2bz00zoNCe6VCDYA/AEuBpQqDfung9Y5F3XLGVGojPxf7f
         07Cwui4XSWL3MMW8zT9gt+3dtTozLAjRQ8taiZ3hHPiJhJ79AMSWEfMNdj1lqyuhijBz
         d9vA==
X-Forwarded-Encrypted: i=1; AJvYcCVZa5XYpk/mPpRKnNiEXxnWjdtatecINDaguIH4+rxCNbPKA7bdl8XFsTUaKqfH+o3rFERMHHQKq61fsg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwFPh5NYraj530/1jCKKC7xOTirudf7qrhdjjUZ7DmaBgM6bvs3
	EO6ZtWlQjWQBVK6G4xsUVB7ajU781Y3HJkbxuqYfYnRmkUP3dhMbeoCaopZPWg==
X-Gm-Gg: ASbGncumBW/S8x0Ixw56umtgmoYy1I5H1nHMfBlJzMphatvSg5QQflTOa54lkWEvhk3
	TaFc1J/wnMhO+Lijs42eMtFXqrxCOIduuQa/syq6e12dQX0JAo/LAXZCq6f7Sn5l71+aJr5EtVl
	ZmamGcJlJk2YFDP+93p16CI71Q29cl5DB8hw8IgOwGrPgdQYDD7teTqakr8Y760+5Z5C9bWVz5r
	wfqE0jbg98dKdqSUZfp5Q5hWuM8dcBUDAIHeNznaTOI78uwNC5adaoVzQNW5TdFRz6S8RwPPWDW
	cFl8vVGqxip2ypWFKmULySPoI62yQ18izjrwBLWeGTZBzUovfA==
X-Google-Smtp-Source: AGHT+IH+AfjXa1HWP93h0DvJI7kSSGAfNsF6+75hu7mgbzlxXWv7+fIY3EtnqV1a4Imfwy4GAdj7Jg==
X-Received: by 2002:a05:6214:762:b0:6d8:7ed4:3364 with SMTP id 6a1803df08f44-6e1b2168b97mr263725776d6.3.1737494097728;
        Tue, 21 Jan 2025 13:14:57 -0800 (PST)
Received: from denia.c.googlers.com (172.174.245.35.bc.googleusercontent.com. [35.245.174.172])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e1afc28f84sm54790186d6.63.2025.01.21.13.14.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2025 13:14:56 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 21 Jan 2025 21:14:50 +0000
Subject: [PATCH 1/4] media: nuvoton: Fix reference handling of ece_pdev
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250121-nuvoton-v1-1-1ea4f0cdbda2@chromium.org>
References: <20250121-nuvoton-v1-0-1ea4f0cdbda2@chromium.org>
In-Reply-To: <20250121-nuvoton-v1-0-1ea4f0cdbda2@chromium.org>
To: Joseph Liu <kwliu@nuvoton.com>, Marvin Lin <kflin@nuvoton.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: Marvin Lin <milkfafa@gmail.com>, linux-media@vger.kernel.org, 
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>, stable@vger.kernel.org
X-Mailer: b4 0.13.0

When we obtain a reference to of a platform_device, we need to release
it via put_device.

Found by cocci:
./platform/nuvoton/npcm-video.c:1677:3-9: ERROR: missing put_device; call of_find_device_by_node on line 1667, but without a corresponding object release within this function.
./platform/nuvoton/npcm-video.c:1684:3-9: ERROR: missing put_device; call of_find_device_by_node on line 1667, but without a corresponding object release within this function.
./platform/nuvoton/npcm-video.c:1690:3-9: ERROR: missing put_device; call of_find_device_by_node on line 1667, but without a corresponding object release within this function.
./platform/nuvoton/npcm-video.c:1694:1-7: ERROR: missing put_device; call of_find_device_by_node on line 1667, but without a corresponding object release within this function.

Cc: stable@vger.kernel.org
Fixes: 46c15a4ff1f4 ("media: nuvoton: Add driver for NPCM video capture and encoding engine")
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/nuvoton/npcm-video.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/nuvoton/npcm-video.c b/drivers/media/platform/nuvoton/npcm-video.c
index 024cd8ee1709..7b4c23dbe709 100644
--- a/drivers/media/platform/nuvoton/npcm-video.c
+++ b/drivers/media/platform/nuvoton/npcm-video.c
@@ -1673,6 +1673,7 @@ static int npcm_video_ece_init(struct npcm_video *video)
 
 		regs = devm_platform_ioremap_resource(ece_pdev, 0);
 		if (IS_ERR(regs)) {
+			put_device(&ece_pdev->dev);
 			dev_err(dev, "Failed to parse ECE reg in DTS\n");
 			return PTR_ERR(regs);
 		}
@@ -1680,11 +1681,13 @@ static int npcm_video_ece_init(struct npcm_video *video)
 		video->ece.regmap = devm_regmap_init_mmio(dev, regs,
 							  &npcm_video_ece_regmap_cfg);
 		if (IS_ERR(video->ece.regmap)) {
+			put_device(&ece_pdev->dev);
 			dev_err(dev, "Failed to initialize ECE regmap\n");
 			return PTR_ERR(video->ece.regmap);
 		}
 
 		video->ece.reset = devm_reset_control_get(&ece_pdev->dev, NULL);
+		put_device(&ece_pdev->dev);
 		if (IS_ERR(video->ece.reset)) {
 			dev_err(dev, "Failed to get ECE reset control in DTS\n");
 			return PTR_ERR(video->ece.reset);

-- 
2.48.0.rc2.279.g1de40edade-goog


