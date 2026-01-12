Return-Path: <linux-media+bounces-50386-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 58020D10ACE
	for <lists+linux-media@lfdr.de>; Mon, 12 Jan 2026 07:05:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3EE5130443D4
	for <lists+linux-media@lfdr.de>; Mon, 12 Jan 2026 06:05:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87C4630F958;
	Mon, 12 Jan 2026 06:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="SWmrm/JO"
X-Original-To: linux-media@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18E161A9F91;
	Mon, 12 Jan 2026 06:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768197906; cv=none; b=o8dVsBBV7kE+C1WASm/BY4Hvh0s3j17/PH1kJh/c7FNqgBukBatQwEPSO3caLpyPJdxA79U9piB+Krj3YjTAPK5X+ZSrb8DQH+Bxs90MZ+99EZY8dPqc5Po9vm1w2vkfz7XHJecCibx6Ja9JHkNyoVFnGl7BgW3gG/6GayyfXjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768197906; c=relaxed/simple;
	bh=oWZRHVuPZ/UoAEXeU9badtNseqa8lQAPcGS8rhOIOhY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MBbQQEzygrgk2Nba5sRBg80UytL8joaevlU/WAeNoL3QHjimNGGXkGg8Up6xd0vmD8+m2/5dh7D4X7eK3c3avnBbgIkKkXcSo/e9ZtilLpM7Pl+Dr+V+upY3/oB26rW1oY+j/EDmmNFooyuSujFPjEdDac/OMPDy/sbd7joAMhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=SWmrm/JO; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=X0
	PDlgeJlACZ3tF0WNbqpXVnAKE4aClyo46RDml+B/o=; b=SWmrm/JOu83zWgB97o
	ra1B2NKAM/UWEC3XxrEtNDR5tFDup5kURKR87sjUrApeVaaB1iJEyy3+ZMVeRRbR
	i0AjES3BeW771nHc37CuSj8rt+Lj6wrIq+bKmEQtqhfDwkQuz7EWirwTbyALgabg
	OxuheZXWAd3knkyuajW28jw5E=
Received: from outlook.com (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wD3N0DZjmRpV3pJFw--.78S2;
	Mon, 12 Jan 2026 14:04:10 +0800 (CST)
From: Holden Hsu <holden_hsu@163.com>
To: mchehab@kernel.org
Cc: gregkh@linuxfoundation.org,
	sammy@parkour.is,
	holden_hsu@163.com,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: drxd: fix typos in TODO comment
Date: Sun, 11 Jan 2026 22:03:53 -0800
Message-ID: <20260112060353.10826-1-holden_hsu@163.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3N0DZjmRpV3pJFw--.78S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7JFW5uFWkGF47tFW7tr1UZFb_yoWfJrc_Gw
	1UCrWxXrn0kFZ0ya1Y9r1Svr92kFWUuFn3Ga1YgrnxCFW8ZF15ZFn2gFy5Ary5ua17Crs0
	kF1Fg3yS9FsFkjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUU5kuDUUUUU==
X-CM-SenderInfo: xkrovv5qbk23i6rwjhhfrp/xtbC-BpNH2lkjtqz3wAA3B

Fix "forthese" to "for these" and "egisters" to "registers"
in the TODO comment to improve readability.

Signed-off-by: Holden Hsu <holden_hsu@163.com>
---
 drivers/media/dvb-frontends/drxd_hard.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/dvb-frontends/drxd_hard.c b/drivers/media/dvb-frontends/drxd_hard.c
index 6a531937f..cc2e823b1 100644
--- a/drivers/media/dvb-frontends/drxd_hard.c
+++ b/drivers/media/dvb-frontends/drxd_hard.c
@@ -1048,7 +1048,7 @@ static int AtomicReadBlock(struct drxd_state *state,
 
 	do {
 		/* Instruct HI to read n bytes */
-		/* TODO use proper names forthese egisters */
+		/* TODO: use proper names for these registers */
 		status = Write16(state, HI_RA_RAM_SRV_CFG_KEY__A, (HI_TR_FUNC_ADDR & 0xFFFF), 0);
 		if (status < 0)
 			break;
-- 
2.43.0


