Return-Path: <linux-media+bounces-51110-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 98B5AD3C55A
	for <lists+linux-media@lfdr.de>; Tue, 20 Jan 2026 11:33:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id AB9AE58A210
	for <lists+linux-media@lfdr.de>; Tue, 20 Jan 2026 10:14:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FA653DA7D1;
	Tue, 20 Jan 2026 10:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="facsDr0s"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BB2C3D7D69
	for <linux-media@vger.kernel.org>; Tue, 20 Jan 2026 10:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768904051; cv=none; b=FvQPoKzgaxcGB72vU9IR2Eyh4d0Iuo3I14l8F77exA9YenkNjMxOYWv4gQMfsnvx0snPdBcXAbXvjbQdoFiCMti46VhfOJ/mcA+HAV2/Uhq/1/mNS7b6mZsn+Qzxzrmx//jjZyyYKTmB3g6ObTV/GIMtCwoUPmAjYQHOGszC/Qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768904051; c=relaxed/simple;
	bh=MLeTGea78p/gKIOMnGu1WCYXIf3fYUvz4GZektTC/FI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Br3jZlSLexwlll8/bcY7biZhsFxVOWJ2cO58aeyRDrtTvuvjG/vwBdyHorPhXZwOtc7softTzGfTFPrkPIjGv0kRYGU+gz2xQgsCJ+JhzJITD6H/wjj15HjyQX8t4Tqtg+hdZGHpkybfkAL3+o3oVCMGux0y5MSrs4T/SCdD3YU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=facsDr0s; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-c2dd0c24e5cso1947117a12.3
        for <linux-media@vger.kernel.org>; Tue, 20 Jan 2026 02:14:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768904048; x=1769508848; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZvQIp5FHmBGUfNaNcfCnUEax+SPEcLHmvLhl4j/A+/w=;
        b=facsDr0s1HzZYTayxR3G8ORx1DwMUWhlISMn/AJDZIfERlWNKiKpM9fLXFpHPkdsl4
         n8T75MnNpBfH7cP8SMUATjA5SGX/cLPQZHP2fqVvyUlXt//pB8PqIFL8OI+flM3pCsy7
         usCR65PgkKhBtWuy+fpgPx6hs5tS+g+aknW8ZBvG4lrRTox4bg5mKJ+4QyZh40trMZhH
         pCTTmFB+zCKknnK0G17zezXctrQ7fVousRpR47f3UmRv/dQC+80y83txXRZyuOZqalqz
         Cp9spLhC/W3Cmh4onSVy0aifb9ntZsfNt2fKvHUz1HmdGnOJcwbghYaSNv3B0mmgF3hW
         ApTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768904048; x=1769508848;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZvQIp5FHmBGUfNaNcfCnUEax+SPEcLHmvLhl4j/A+/w=;
        b=xBDJqWSsj8JOOgDQy/vK0WJUlMM72X4UXPGQKA9/lWF34luy3X4vGgshy/spoFFmBX
         NCBSHkpYk0YFjPugC9pTxI9f/ata/PRYP2T4LRK7H2ALvLBVfujDqb6rVVz3K6juX76D
         v4dC/TciUGt80oDP6Hpr7tD/f0D5SM1MzIDt/CEL7x0Crx84KT6jH3Vhh7fANvXKrn2C
         mX0xS9O9Nq/U0gbfhxwNIwod9jmGaq8IGyp2SqmUANeP70Llt07VThOaUM5m9G7yXs73
         g4lYACBXW3vmkcQpiEpqPszvJoLQJ5Ap5tW702W3p4RiX133m1+KSWesnG5CapA6sVxO
         m6pQ==
X-Gm-Message-State: AOJu0YyWNZs8zFvSb1Cw54dAy4tWx9Qj+Xpmss3UDwq58XbfKCcqiewj
	Q9gprM+Cr0R/cr3YGLeMWf+dUXkNfkhYeZUakSwJcTCGqP7n3Z/TJiBQv5Otew==
X-Gm-Gg: AZuq6aLL55YKiwTzcQRbs5JiXKSR8wOuNGiY/HYwFWhhr3ftJXT7hf3n7Ax69D6eOpa
	UfhlXwoRQazzAeKrgoMJXFHYfeIvGY/k+B8WllC8dqLq/3EOGGyiJIf9OKqEIi0pq2iYddXFf32
	tPhwXRwVNbW2D1gudjjMC4GEd7rCIMmo7sK987s6iuZ76TpJaE0ufBaoTBpI0z1yswTdwqivGTF
	EajG+nysKNeC/pcRi/H9PWjk1elZNRULS2hh5l7Lf+mF97wk0gIER3SUbPIUDO1OpWHK7mSeCOr
	iyug5isi+VhG9j3hisaGjMnFH8G57pgEsZYEU/kDNMiXr8AgGhSGMn2s74figrRj1nH3B7fOUlz
	g3gTA6fdk6zFIFlB/s4uQGME27HlwKbaqhJjtoQS4hwu0832ueR+VPPBj8BHTNIVMlI91qQh7NB
	WCMh9zMr6w+pP/mTuNeiQ=
X-Received: by 2002:a17:90b:1e0b:b0:34c:f5b5:c1b6 with SMTP id 98e67ed59e1d1-35272f028a0mr13600296a91.12.1768904047607;
        Tue, 20 Jan 2026 02:14:07 -0800 (PST)
Received: from localhost.localdomain ([58.29.79.238])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-352c403b7e4sm1641035a91.6.2026.01.20.02.14.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 02:14:07 -0800 (PST)
From: Lee Yongjun <jun85566@gmail.com>
To: mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	hverkuil+cisco@kernel.org,
	Lee Yongjun <jun85566@gmail.com>
Subject: [PATCH] media: dvb-frontends: drx39xyj: Remove unused variable in drx39xxj_set_frontend
Date: Tue, 20 Jan 2026 19:13:39 +0900
Message-Id: <20260120101339.5651-1-jun85566@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The variable 'i' in drx39xxj_set_frontend() is declared within a
DJH_DEBUG ifdef block but is never used.

Detected by Cppcheck static analysis:
drivers/media/dvb-frontends/drx39xyj/drxj.c:12068:6: style: Unused variable: i [unusedVariable]

Remove the unused variable and the surrounding ifdef block to clean up
the code.

Signed-off-by: Lee Yongjun <jun85566@gmail.com>
---
 drivers/media/dvb-frontends/drx39xyj/drxj.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/media/dvb-frontends/drx39xyj/drxj.c b/drivers/media/dvb-frontends/drx39xyj/drxj.c
index 428b31e60874..071561d5561c 100644
--- a/drivers/media/dvb-frontends/drx39xyj/drxj.c
+++ b/drivers/media/dvb-frontends/drx39xyj/drxj.c
@@ -12064,9 +12064,6 @@ static int drx39xxj_read_ucblocks(struct dvb_frontend *fe, u32 *ucb)
 
 static int drx39xxj_set_frontend(struct dvb_frontend *fe)
 {
-#ifdef DJH_DEBUG
-	int i;
-#endif
 	struct dtv_frontend_properties *p = &fe->dtv_property_cache;
 	struct drx39xxj_state *state = fe->demodulator_priv;
 	struct drx_demod_instance *demod = state->demod;
-- 
2.34.1


