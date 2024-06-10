Return-Path: <linux-media+bounces-12810-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6971F901C9E
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2024 10:13:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0EF821F238AE
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2024 08:13:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF8C278B50;
	Mon, 10 Jun 2024 08:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dg7yR/D8"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D163762CD;
	Mon, 10 Jun 2024 08:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718007045; cv=none; b=rUrv8x73qn+HAA/TzUZgPOKTUf+qG8DZlbkcKsuNEdDmzYc7375KDcXlLncECHXW1TJ3WK4SAowJ+Qglh4ikJHoOlxqs+ES7NXv7Nw/UWNIPv65irye6RKmc6XqbDME43LlGKAhcOyv3DNmAeAf03b5H5hH7Pmx7rRRLZHgViAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718007045; c=relaxed/simple;
	bh=UOMEKD+/rXv06IzA8JzvuiR+fcWZSD0LAA1sKQ13LYI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=d8jpZgMmZlCJL7wOXnaxi97+MG93xb8cYJ/ZOq3+EM06uUcwdkBWTZkI1oVGhX67+1EmNUzPi7JXoYQRGevJMung+rU+54uUVEXDWsNmyEhq/OW6vPoGSW3BxVoQFnLm5NKimcYma0d5Q5mvSzbpBIezw2+2BnQ7g0VTgurGvg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dg7yR/D8; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-42172ed3597so14576715e9.0;
        Mon, 10 Jun 2024 01:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718007042; x=1718611842; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i3rRW6PLOdb5jutY0sw45veXa+Cwa7eQVOOlVuiRgRE=;
        b=Dg7yR/D8+QfHUCBh8lcmLoOBgn8oufcZsXwT8P9h2L8SuurWQdoV2IyO0Y0CAzwk6W
         8AGidrMU8n2tsGc5nZQXeKIZ8ZbFDvNZWN8GbY6rFHVSzAE/r4JC3ZNvxUGBlaLoXCtW
         E1DaHpM5Efa3hNtG7QyXjM7vtD5MKGPKTw4hky88nqWhaFLadJYkncfMN9eJAxV/XJM2
         uYH0ACFGsqzqGUEkifPY2rRdRt/r1O1LqX6MLGUtANaVlannkEDIxbRji5mryAtSawRA
         1WHb/s0qJRlrWbmpmKq4+zI9ekyPwJCX8/5jCRLBQ30dGqesqUlqw1o1PHcBuEnaFrWC
         vsxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718007042; x=1718611842;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i3rRW6PLOdb5jutY0sw45veXa+Cwa7eQVOOlVuiRgRE=;
        b=t4ApxhrLM/QjCBSutJ3wMd1RHJ6muIwE6nIx4lVstBgZz5czIkDFmdjbIuyQ8fGfpZ
         3xRNb+jBbsEV4g0FBCVz17GZx7WKyCOsoJGLhCM3xVFCEcjzykOkIIJHskfyLVlYYoLa
         PLUeCB00wLvUCQRdet2Hsnaa4HBt78Ddhm1q8b/6TnTPFTFRU4AMOKv36T7cMrccywN4
         hDBomvRSwIF/r7XCNbYVI7e48mnqpL85UnoI4/CDJJvu8rMcLvL/KV5UstRMA8jS1+Rq
         TZSPe3W5UTWw9pXku5WTcQ1rKLfGo79MaiY7aqKIZECEWO1KufmlGm6mZDkxdycQuWDb
         eVFA==
X-Forwarded-Encrypted: i=1; AJvYcCUiRPfdkTHv++rQLkyZwrLNga1FBFYFS186/X3ky0Hst+n0BeEtrsNtmUKpJTNEo/emH+sRROpMmNxXeb2bmQrPa/oyny1opbMxWIHQ+1Fd3qPgpV7rO9RYVwRCZllQJZ5t3cw/5M4keMw=
X-Gm-Message-State: AOJu0YwbRuTIfHiA8pkyCxBR9eWlk8oSMACMoofB0/OtnPW5glmGHUVG
	H/lpOqOQO+X5mq76ldr5XRjDMFX7/OVvdDJGgAZkjyznabrbUjTO
X-Google-Smtp-Source: AGHT+IH46Udk2mJ+VtuXY5m+KV0PPkYqL1Il62EA1ZVniFiyeqncvc/q2NF4vPNaW32+43lJekzO+A==
X-Received: by 2002:a05:600c:1d28:b0:421:811b:b83e with SMTP id 5b1f17b1804b1-421811bba6bmr33341635e9.13.1718007041867;
        Mon, 10 Jun 2024 01:10:41 -0700 (PDT)
Received: from tom-HP-ZBook-Fury-15-G7-Mobile-Workstation.station (net-188-217-58-5.cust.vodafonedsl.it. [188.217.58.5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-421e91c47b4sm18021315e9.35.2024.06.10.01.10.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jun 2024 01:10:41 -0700 (PDT)
From: Tommaso Merciai <tomm.merciai@gmail.com>
To: 
Cc: linuxfancy@googlegroups.com,
	sakari.ailus@linux.intel.com,
	martin.hecht@avnet.eu,
	tomm.merciai@gmail.com,
	michael.roeder@avnet.eu,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/5] media: i2c: alvium: rename acquisition frame rate enable reg
Date: Mon, 10 Jun 2024 10:10:31 +0200
Message-Id: <20240610081034.1195523-3-tomm.merciai@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240610081034.1195523-1-tomm.merciai@gmail.com>
References: <20240610081034.1195523-1-tomm.merciai@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Aquisition frame rate enable reg have a very long name let's reduce this
with an abbreviation.

Signed-off-by: Tommaso Merciai <tomm.merciai@gmail.com>
---
 drivers/media/i2c/alvium-csi2.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/alvium-csi2.h b/drivers/media/i2c/alvium-csi2.h
index ed712ad44899..978af44f76c7 100644
--- a/drivers/media/i2c/alvium-csi2.h
+++ b/drivers/media/i2c/alvium-csi2.h
@@ -63,7 +63,7 @@
 #define REG_BCRM_ACQUISITION_FRAME_RATE_MIN_R		REG_BCRM_V4L2_64BIT(0x0098)
 #define REG_BCRM_ACQUISITION_FRAME_RATE_MAX_R		REG_BCRM_V4L2_64BIT(0x00a0)
 #define REG_BCRM_ACQUISITION_FRAME_RATE_INC_R		REG_BCRM_V4L2_64BIT(0x00a8)
-#define REG_BCRM_ACQUISITION_FRAME_RATE_ENABLE_RW	REG_BCRM_V4L2_8BIT(0x00b0)
+#define REG_BCRM_ACQUISITION_FRAME_RATE_EN_RW		REG_BCRM_V4L2_8BIT(0x00b0)
 
 #define REG_BCRM_FRAME_START_TRIGGER_MODE_RW		REG_BCRM_V4L2_8BIT(0x00b4)
 #define REG_BCRM_FRAME_START_TRIGGER_SOURCE_RW		REG_BCRM_V4L2_8BIT(0x00b8)
-- 
2.34.1


