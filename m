Return-Path: <linux-media+bounces-29438-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 47AF3A7CE74
	for <lists+linux-media@lfdr.de>; Sun,  6 Apr 2025 16:43:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 02F1D188C761
	for <lists+linux-media@lfdr.de>; Sun,  6 Apr 2025 14:43:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1064219302;
	Sun,  6 Apr 2025 14:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hf3gx/dY"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 026E41E871;
	Sun,  6 Apr 2025 14:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743950611; cv=none; b=JlfeJCxj25JlEnP2hI79z3ViCF9Q1FGn+J8eCiV7FoD+jFQxUIQj/ilszbiYkUCW/KzR8+nPKp9ecivAhcXQJhkoZY7EqbclI1z6Qn3LpY022JSU9AGYKqWaop7pwZqgLwKQUOe03ldBk6oGImNGscEhzmrldwAIGv4BLyqyCgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743950611; c=relaxed/simple;
	bh=ZrDLaVqNjEamxChowvjj/WuCkkOsyZ1przBRWBbwp24=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WFKNxWtGXiJtMDs6lGMapce2GTUtFgwSzO/tAsWCV7A4G2oRdyXk9AohjlPdj15QWwPbBldQJZX9jQE8gmntiVCCOnXBUZi7ChiYjsIeTQmVniYg3gPIg+TGv806pY54cMi4PP3Wk3A4GnBag1PKCfkmoousIxuIaEpI2ASEvug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hf3gx/dY; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-730517040a9so3968455b3a.0;
        Sun, 06 Apr 2025 07:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743950609; x=1744555409; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WdobnYSCTE78QqweiiGn675VY/sYpHVhEsu2M/NCVgA=;
        b=hf3gx/dYGle1wFn7v3zNHfl4Rp0J3tPhDK/KjT5Br08dDyCuUEEup9cqa87nwERojk
         /mukYTBesbWvyWe/thpXXWS5QVdW3zeTf4SzSXhpq0WTyodKOB4Kp7RdoMantsPIHfAC
         lpu/0UF1GLXMibylTsrXXqJYMHl5tPI5XJLDLRkwuiGH0a6ojGdUufCdgHNGbrsa8Tv/
         DSK1tCE8/lh+6vJOHZB3c0ubTDxsZSz/Zbwgb/Ruqj7N3Qiolsn8z3MLvsnWI1x92eYY
         C4pud11ILvhGg9d6QvXJpRVqviblP2U98s2SOLQjimQcqVDX+D8JjA+sv9a1nIw5vdo7
         xYxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743950609; x=1744555409;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WdobnYSCTE78QqweiiGn675VY/sYpHVhEsu2M/NCVgA=;
        b=gqHEoQD//hL3Ht0jwh36VUEpyIjfHlloXBNYm7XNTP5oRTn5aStKRanZa2q/nx8Nb3
         Dxk1GEvPuYcxELbaDAWT8REPUKv8dT46rN8zSYpsmJ2GOjHS6UykLVCc8bVl+31rXQ+r
         pwNvcxSpKFjpzzRL0EJ/uhl7frFR1ilqyVLHsaR4Uf9qW6kK40ADvPzTxRKYMrlR5XKx
         AraXDBxq9EMSVeTfMqew0WOaIKhBwQLRCTRUNltadBX8mJzVDJefk0xEUF4O0/x5vIE6
         PHfFxjo/obIs2UntUK4vZ0W+Ywb6U/MNAw9c4yALssygyZXfFMk4ptCQxLMea0s+laWx
         aIqA==
X-Forwarded-Encrypted: i=1; AJvYcCUvgnGVQGDO3nbNWmOXA1SspfuLkIeJFQLGkrWKP0HSxkQrR5zy2AuLlHtibtKEhjtudrHQVXoicRYq3zc=@vger.kernel.org, AJvYcCV6G2mWJ7F96p1RERAxHaB/NyYNmoI7rXVRaQ+02jwPP6arbPnYzJhpbtlhpGoiMxXB+waZKSYzCjGGUDY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyCVhDGcNc3L2RYdUh4GB/H2E+CAaJ4xPaaYdH4VGHECpRUynyo
	EiLp2183DCt6e3U5oYnf4ktmVzZa3WlFBND2/YFnzEJGlu2m/9iapfJTe8A6
X-Gm-Gg: ASbGncvCwL7zMfOt5JJrMsf/TD1Aj2LPmNQhjhz2n5TaZ0o4fBdTs6uNudgDkK7bNL1
	NeP4PzUpqqXIFC9Ut6V7mKeQRZiTkw1IfnXk/YWT3y0JetDSRgPD50qdLnZOMh1MqN82Fyo6NIY
	JINVQLOWa1H6JIxl3K//vxFIHi9d8npfDEv1q4tcHrbDLUukdIA+oP8CC2N/nidufauwlNPPrI0
	33DBRYubuU+oT/AOjkC8sO+Y4IfxSMymgmepVkulmdKjY+PoIR86Xyke6Wh+ZBALJm3OPv2xebW
	NKKjtVGv3ExvUPcdHwb19Btb5Uje6P0OA8b0CrflvAXQpyVHN1ZDUp+Z3hO7QNwxgFc5
X-Google-Smtp-Source: AGHT+IEDNZOBGCAOLggyB+ZkdxXOadqAyEbVhtde8FAn5W4eYDFkomDXnU0E0VunzK0C0hDDpNU1bg==
X-Received: by 2002:a05:6a00:1902:b0:736:5753:12fd with SMTP id d2e1a72fcca58-739e47dbb37mr14005531b3a.4.1743950609030;
        Sun, 06 Apr 2025 07:43:29 -0700 (PDT)
Received: from tech-Alienware-m15-R6.. ([223.185.134.10])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739d97f1c4bsm6729152b3a.70.2025.04.06.07.43.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 07:43:28 -0700 (PDT)
From: Sunny Patel <nueralspacetech@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sunny Patel <nueralspacetech@gmail.com>
Subject: [PATCH] media: i2c: ov13858: Enable clock frequency macro
Date: Sun,  6 Apr 2025 20:13:22 +0530
Message-ID: <20250406144322.88464-1-nueralspacetech@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Defines a macro `OV13858_MCLK` for the clock frequency (19200000 Hz).
Replaces the hardcoded clock frequency value in the probe function.

Signed-off-by: Sunny Patel <nueralspacetech@gmail.com>
---
 drivers/media/i2c/ov13858.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov13858.c b/drivers/media/i2c/ov13858.c
index 7a3fc1d28514..a1242a90cdc9 100644
--- a/drivers/media/i2c/ov13858.c
+++ b/drivers/media/i2c/ov13858.c
@@ -21,6 +21,8 @@
 #define OV13858_REG_SOFTWARE_RST	0x0103
 #define OV13858_SOFTWARE_RST		0x01
 
+#define OV13858_MCLK				19200000
+
 /* PLL1 generates PCLK and MIPI_PHY_CLK */
 #define OV13858_REG_PLL1_CTRL_0		0x0300
 #define OV13858_REG_PLL1_CTRL_1		0x0301
@@ -1664,7 +1666,7 @@ static int ov13858_probe(struct i2c_client *client)
 	u32 val = 0;
 
 	device_property_read_u32(&client->dev, "clock-frequency", &val);
-	if (val != 19200000)
+	if (val != OV13858_MCLK)
 		return -EINVAL;
 
 	ov13858 = devm_kzalloc(&client->dev, sizeof(*ov13858), GFP_KERNEL);
-- 
2.43.0


