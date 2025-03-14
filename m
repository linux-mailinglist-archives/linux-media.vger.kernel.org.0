Return-Path: <linux-media+bounces-28241-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 72B45A614E7
	for <lists+linux-media@lfdr.de>; Fri, 14 Mar 2025 16:31:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 223931B63D33
	for <lists+linux-media@lfdr.de>; Fri, 14 Mar 2025 15:30:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 947032040AD;
	Fri, 14 Mar 2025 15:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FaqGJdA9"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4514820371B;
	Fri, 14 Mar 2025 15:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741966196; cv=none; b=WQSgr6PVattnPfficcIWRMg44G3E42cpgqpdPp/4T4sPaSi6Zdo//bbt+FCKjzkL8EpOalpkcvhEPfQTi89KiKkYywvTn7T+VObRbwIHf6exyu3yXhv1uz7wACEIGb9NWVcbznbrqWaZmDJ88yicRKUW0IRezJVGqT+L9rKK0mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741966196; c=relaxed/simple;
	bh=yUOy+L9Ctomd5isY62yQF2ankxUxe03Hv9fx76BjX4A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NgDYSdyBURJu11NmLybH6emqVHdJxmz5IBwpC/JcmXull3AWIOQWKXD2Hb4vqur/ucnv0qO/T9akMSlyFc48QrmX8DYeHXBMy9sW/US6o33lL4R0sx/vbQ2T+mTCTWpRPoxgvdMSUiPBGsAi2EO9JuG6FuRexDKAp/8h1bl11k4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FaqGJdA9; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-30bee1cb370so23673031fa.1;
        Fri, 14 Mar 2025 08:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741966191; x=1742570991; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BuH1mlog415eNldUnRz1fZTPFld846wd4tkcoX0egoA=;
        b=FaqGJdA9B1r1eVwm4N8nBCH6vij2McyloQu04j5I2hriZ9HCd5BrrO2MExOWCO24tj
         IDcdWQhSAJc23QlXRtBjxMUhCBrUANsphtscVjzZnu/v9kQx8Zy9otQ07tdz4l626Iil
         om+T02LZ/XkQnOAduVq4XEErgm+pKbgQy4rfJ4g+NZPT5BL1X6ESVrYXZ4OTkv3ssmAW
         0rNwR74rcDDusk9emWlfYnLnRRt+TO+V2c40kGtkc9pImOW5tCPDGGRrRMDQZ/WwkXGn
         8QlrNN/FQ0dWXrF0lQAIZ75dLZh8TwUNwQqIbSbitBNtgGI2rbcJFh9s97yvNEyBfQ7n
         DUXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741966191; x=1742570991;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BuH1mlog415eNldUnRz1fZTPFld846wd4tkcoX0egoA=;
        b=ATXgFEBV53qMV3qNuDVXQ8R3vGajvsNdEDedBOS3DCzlsD+AzUfeMlHORkd7CAZqnX
         MrAwCg4fjpLEQjsNKmUGvoeqTs2fcc95GFI8aO0wiSjbJfIECd7Rq5A+Xb+e0yE6qYMt
         YopCza+9AVe4MDHA/ea5ORgNamKOZOAstQ06Izco4jxiuDuxVcqwEKvkiVGAc+JtSqn9
         U+ue2vd37stZivn6f9Wl6gUTPgJjhaqyCJXGcrgTvubJ3T5HgDFvRZB8sP3uqN+1wRCu
         dqUFdmhdjoN7Tz+QfG8vNiC8NGL6r+2Bk4qNrM+mn5lWUTKxoZw1NhIrmOcKwHY0Y0PH
         l6AA==
X-Forwarded-Encrypted: i=1; AJvYcCU8JDl8sZcLK4mgkp4gVJCAGHEjiTF0REGdXd+T9m/ZO/qUlBylr0GW7fzCNRxOA7bvZRCLFV4sVS0oLto=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFIF5FLklBay4TFzlLFDnSVM00y3sEYFksNbIYZZ0omcsqLPmi
	hfQ/nGl3F4Rx4idc3/RZGUfsvkXV7z1G40Yeb/ZYyr51rM/M1Q/+jfcFXRAC/Kg=
X-Gm-Gg: ASbGncvCs9zoWayvHwL+j7cmyYucY9Qq54nh1O6y88tdLIG9gs3MgA6B2L+1iNzjoaI
	+hRBGV4yYxahjPLol9+jd+F/vO9QYNxkqF7NDx3xEUZSDAu4CT7JPIn7aC7eV3Q2Vx5paCIdmTp
	MPe6cK/ts5kU2y39F3hnzJC9zNDtExTZpeXcpG8yYEYVOgj6Je9wD80icDDvnj8g2MqRL4rIU28
	SvOyVJfmAwSJEGPHegE9DRhbbYbA76svdoXZ3+mYI+rSYD7+EWHk3cbfHVIlUVuOXvroCFA+lD7
	9NzuDVTgXNklDyChW2oYgAO1mb9Vbw2SAULtKEdalnAu8r6lsjJPQyWk6Kh6vYTsBwUL
X-Google-Smtp-Source: AGHT+IHEFM1Sw/Ll/yUngaFm30qGrYLFpIsHGFudFrTmpkSEWFxduSeAZd2+Vr9wBAlkwwJxR9l6Wg==
X-Received: by 2002:a05:651c:b06:b0:308:e5e8:9d4c with SMTP id 38308e7fff4ca-30c4a8d9084mr11110871fa.28.1741966191369;
        Fri, 14 Mar 2025 08:29:51 -0700 (PDT)
Received: from skhimich.dev.yadro.com (avpn02.yadro.com. [89.207.88.245])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30c3f0e99f6sm6253581fa.37.2025.03.14.08.29.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 08:29:49 -0700 (PDT)
From: Sergey Khimich <serghox@gmail.com>
To: linux-media@vger.kernel.org
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-kernel@vger.kernel.org,
	Vladimir Yakovlev <vovchkir@gmail.com>,
	Maksim Turok <turok.m7@gmail.com>
Subject: [PATCH 04/18] media: coda: Add check result after reset
Date: Fri, 14 Mar 2025 18:29:25 +0300
Message-Id: <20250314152939.2759573-5-serghox@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20250314152939.2759573-1-serghox@gmail.com>
References: <20250314152939.2759573-1-serghox@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Vladimir Yakovlev <vovchkir@gmail.com>

Check result after reset IP block and disable all clocks if return
error.

Co-developed-by: Sergey Khimich <serghox@gmail.com>
Signed-off-by: Sergey Khimich <serghox@gmail.com>
Signed-off-by: Vladimir Yakovlev <vovchkir@gmail.com>
---
 drivers/media/platform/chips-media/coda/coda-common.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/chips-media/coda/coda-common.c b/drivers/media/platform/chips-media/coda/coda-common.c
index c39ba4fba547..64ba17d8adfb 100644
--- a/drivers/media/platform/chips-media/coda/coda-common.c
+++ b/drivers/media/platform/chips-media/coda/coda-common.c
@@ -2793,7 +2793,9 @@ static int coda_hw_init(struct coda_dev *dev)
 	if (ret)
 		goto err_clk_ahb;
 
-	reset_control_reset(dev->rstc);
+	ret = reset_control_reset(dev->rstc);
+	if (ret)
+		goto err_reset;
 
 	/*
 	 * Copy the first CODA_ISRAM_SIZE in the internal SRAM.
@@ -2872,6 +2874,8 @@ static int coda_hw_init(struct coda_dev *dev)
 
 	return 0;
 
+err_reset:
+	clk_disable_unprepare(dev->clk_ahb);
 err_clk_ahb:
 	clk_disable_unprepare(dev->clk_per);
 err_clk_per:
-- 
2.30.2


