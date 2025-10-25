Return-Path: <linux-media+bounces-45544-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 52F3DC09066
	for <lists+linux-media@lfdr.de>; Sat, 25 Oct 2025 14:41:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E4B3F4E6794
	for <lists+linux-media@lfdr.de>; Sat, 25 Oct 2025 12:41:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51EDE2FBE18;
	Sat, 25 Oct 2025 12:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yj9VtxGr"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com [209.85.214.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16A46154BF5
	for <linux-media@vger.kernel.org>; Sat, 25 Oct 2025 12:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761396083; cv=none; b=h+YJnh0hp+DQzNpbm3Xnmk8wU+Cx/9SoAaaTEWKAOB0CnIvGl/VZCbR0HATl/kPbDjZUNK8dy2e7Vtby+Vh6U8Wy6uTfIje8Xg2KX7EhLxNK3dMWDD7iPsNDMBVgCc3UcoT6hnzLUuElCz07InCZfqiydy+UerZFEr6IYu2iHJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761396083; c=relaxed/simple;
	bh=DbhyxMxq4lUaU8IP69H+5X/6jxTC3W56/g+TqGuwKpA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cowmOS+uvwMRe3C7Bcy0votKI4XkWrb6DnceA7KwchLsgOQ25g8Tpgr98XOMFTfauzL7CAK8yWj0JECRMXMUE7CCurplvYz8RguI5o3fseowFBcgVC3Hou5IEabtrg9c9lTostk7meo5vyqPKPMcqQ6QiMNsdLvaL0k7r0x/6GE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yj9VtxGr; arc=none smtp.client-ip=209.85.214.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f193.google.com with SMTP id d9443c01a7336-273a0aeed57so46667295ad.1
        for <linux-media@vger.kernel.org>; Sat, 25 Oct 2025 05:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761396081; x=1762000881; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wmZntVTHHXX7vvT4or3/vlXQkt3zScSQQ5D3QkdreyU=;
        b=Yj9VtxGr6qS+aC8sOnV7DzsafLrQb0Mdd6O41N1Byx/wFjvHqyVSiKh9yMKfJhesog
         HivT9S53UOw6WQNjv1gyXwVAfzHhn5fhXD8Cm+25y+frUoUPFOl4plJNrTvVnqrW5WjF
         dNjLinUNuuPHE9TXW1q5Us6sh3GxyXZOHUVSxt0s2HPwpCt+5CbkVH6B7uEWNwaRBBnp
         Ts93w9gPIN9dF31MwqAaykUD7g67CHJJmYVDpJhkOOtE4GYhDIrDQ6Z5iRMjAsiynq0z
         tjxapjKdPSaevagsmn3GajANGwkzI1sUFnu4DBDXrGxhjmQxmq/Y1Ea02XGXyxO/GETE
         GGaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761396081; x=1762000881;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wmZntVTHHXX7vvT4or3/vlXQkt3zScSQQ5D3QkdreyU=;
        b=X8pnV2FRmTXa87fQOIRWIoIzaCjlqnywIGxosPyYrMfbb5mt9PIRwZa2MIIBYS2wY2
         j/LNC6UrtrQf2T4aXJnCY8Ii3suwA68JPj2QsQKFC98EeEKa7IRCZWebQG9PbzEwMjZ7
         vxSD1QkH+y1dOho1XKtzTjtkGyNNWJ2YbjjXIzq1y8TTT7kL4/P4JYUC/kQsCQT0Vl2/
         +rRr7w/gdrPBPvg4bIcY07p9nKgA+O+Jn8zQpdysHwfRAmJA7kpJWFiRZ37dYFPPyoVv
         NZUlgg4ZzWP9JWHj66JjyCaALjbWrhxrR0S6dqswxRf79XjKWUHXpp8LvFJU61s9pb1F
         Hpvg==
X-Forwarded-Encrypted: i=1; AJvYcCXQ5iGb4U8RMNzzM1VO94TwfE3Awl1rJEnKOo+LSobGPEpeI9A3pKh3LnlOUHYlvP7PUodVLYp9aFjA3Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwqdVJYpjWxCvWl1foHnJlF4qu7HyE6VqjpXRr2fJdKx3p4V8Eu
	bE8yFB0qhjSqL+IjynI8EZSwn6wM35m01lqHsgJ3PQIIZQ289EAplZcd
X-Gm-Gg: ASbGncsS81F8fqEWiN5aBwZRn2AweEfu0UaLOaO/u3AxnJ9wY3Ri55PbVcQJJO1tMk8
	OmtWdnfClAuWTOYMR2SCtCp1XBTp2IZBaY6KPWWyI3B7p+9qwODCdHMuk8r/MH56i/Pq7syC7Gj
	v+1HP230tur5Zb0ELJHLtJ7C/N26P/U7Vl6YiaA6mU52Cqd3cL6sk+ustKsJV7FYH3H4wkwvCI7
	yupj20JdDTFa8QHh+d/hkLwoTZKlpKHBIPTjOl37Bsbb45/++dAiebKrplpXTf09H55tMk4Pg6y
	9l/NBGhvg9xp9ddHyG7Nmwj9S/2fGd7xvRs6xITLap+h4XCftv61YszXkC/VxWBDhyIpvG6xq0f
	KnDxk6oR7JUiHyGg8sztIlghY4WYJNPOLJJsDPfb0u1U903VRr0C2ahoTJKQL/0LT17hS4i54Wl
	8Ho+r/T8c=
X-Google-Smtp-Source: AGHT+IHzNs/eLQNOngxeYDWlhwSANW/kUwt/EM86jh34NmnaHE0YhhBpGRAv70D0RhfuygrVqhJNRg==
X-Received: by 2002:a17:902:d547:b0:273:ef4c:60f3 with SMTP id d9443c01a7336-29489d70d8bmr73531765ad.4.1761396081179;
        Sat, 25 Oct 2025 05:41:21 -0700 (PDT)
Received: from Ubuntu24.. ([157.32.121.71])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498e42f5csm22263395ad.104.2025.10.25.05.41.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Oct 2025 05:41:20 -0700 (PDT)
From: Shrikant Raskar <raskar.shree97@gmail.com>
To: hverkuil@kernel.org,
	mchehab@kernel.org
Cc: skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	Shrikant Raskar <raskar.shree97@gmail.com>
Subject: [RFC PATCH v2] media: saa6588: Remove dprintk macro and use v4l2_info()
Date: Sat, 25 Oct 2025 18:11:07 +0530
Message-ID: <20251025124107.4921-1-raskar.shree97@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The existing 'dprintk' macro used an unwrapped 'if' statement which was
flagged by checkpatch, but instead of wrapping it, the debug handling
can be simplified.

This patch removes the 'dprintk' macro entirely and replaces all its
usages with v4l2_info() helper. The unused 'PREFIX' macro is also
removed.

Signed-off-by: Shrikant Raskar <raskar.shree97@gmail.com>
---
Changelog:
Changes since v2:
- Removed dprintk macro
- Replaced 'dprintk' with v4l2_info(). 
- Removed PREFIX macro.

Link to v1:
https://lore.kernel.org/all/20250923175927.4380-1-raskar.shree97@gmail.com/
---
 drivers/media/i2c/saa6588.c | 27 +++++++++++++--------------
 1 file changed, 13 insertions(+), 14 deletions(-)

diff --git a/drivers/media/i2c/saa6588.c b/drivers/media/i2c/saa6588.c
index fb09e4560d8a..d2cb85a2d226 100644
--- a/drivers/media/i2c/saa6588.c
+++ b/drivers/media/i2c/saa6588.c
@@ -49,8 +49,6 @@ MODULE_LICENSE("GPL");
 /* ---------------------------------------------------------------------- */
 
 #define UNSET       (-1U)
-#define PREFIX      "saa6588: "
-#define dprintk     if (debug) printk
 
 struct saa6588 {
 	struct v4l2_subdev sd;
@@ -144,14 +142,14 @@ static bool block_from_buf(struct saa6588 *s, unsigned char *buf)
 
 	if (s->rd_index == s->wr_index) {
 		if (debug > 2)
-			dprintk(PREFIX "Read: buffer empty.\n");
+			v4l2_info(&s->sd, "Read: buffer empty.\n");
 		return false;
 	}
 
 	if (debug > 2) {
-		dprintk(PREFIX "Read: ");
+		v4l2_info(&s->sd, "Read: ");
 		for (i = s->rd_index; i < s->rd_index + 3; i++)
-			dprintk("0x%02x ", s->buffer[i]);
+			v4l2_info(&s->sd, "0x%02x ", s->buffer[i]);
 	}
 
 	memcpy(buf, &s->buffer[s->rd_index], 3);
@@ -162,7 +160,7 @@ static bool block_from_buf(struct saa6588 *s, unsigned char *buf)
 	s->block_count--;
 
 	if (debug > 2)
-		dprintk("%d blocks total.\n", s->block_count);
+		v4l2_info(&s->sd, "%d blocks total.\n", s->block_count);
 
 	return true;
 }
@@ -222,11 +220,11 @@ static void block_to_buf(struct saa6588 *s, unsigned char *blockbuf)
 	unsigned int i;
 
 	if (debug > 3)
-		dprintk(PREFIX "New block: ");
+		v4l2_info(&s->sd, "New block: ");
 
 	for (i = 0; i < 3; ++i) {
 		if (debug > 3)
-			dprintk("0x%02x ", blockbuf[i]);
+			v4l2_info(&s->sd, "0x%02x ", blockbuf[i]);
 		s->buffer[s->wr_index] = blockbuf[i];
 		s->wr_index++;
 	}
@@ -242,7 +240,7 @@ static void block_to_buf(struct saa6588 *s, unsigned char *blockbuf)
 		s->block_count++;
 
 	if (debug > 3)
-		dprintk("%d blocks total.\n", s->block_count);
+		v4l2_info(&s->sd, "%d blocks total.\n", s->block_count);
 }
 
 static void saa6588_i2c_poll(struct saa6588 *s)
@@ -257,7 +255,7 @@ static void saa6588_i2c_poll(struct saa6588 *s)
 	   SAA6588 returns garbage otherwise. */
 	if (6 != i2c_master_recv(client, &tmpbuf[0], 6)) {
 		if (debug > 1)
-			dprintk(PREFIX "read error!\n");
+			v4l2_info(&s->sd, "read error!\n");
 		return;
 	}
 
@@ -267,7 +265,7 @@ static void saa6588_i2c_poll(struct saa6588 *s)
 	blocknum = tmpbuf[0] >> 5;
 	if (blocknum == s->last_blocknum) {
 		if (debug > 3)
-			dprintk("Saw block %d again.\n", blocknum);
+			v4l2_info(&s->sd, "Saw block %d again.\n", blocknum);
 		return;
 	}
 
@@ -370,12 +368,13 @@ static void saa6588_configure(struct saa6588 *s)
 		break;
 	}
 
-	dprintk(PREFIX "writing: 0w=0x%02x 1w=0x%02x 2w=0x%02x\n",
-		buf[0], buf[1], buf[2]);
+	if (debug)
+		v4l2_info(&s->sd, "writing: 0w=0x%02x 1w=0x%02x 2w=0x%02x\n",
+			buf[0], buf[1], buf[2]);
 
 	rc = i2c_master_send(client, buf, 3);
 	if (rc != 3)
-		printk(PREFIX "i2c i/o error: rc == %d (should be 3)\n", rc);
+		v4l2_info(&s->sd, "i2c i/o error: rc == %d (should be 3)\n", rc);
 }
 
 /* ---------------------------------------------------------------------- */

base-commit: 6fab32bb6508abbb8b7b1c5498e44f0c32320ed5
-- 
2.43.0


