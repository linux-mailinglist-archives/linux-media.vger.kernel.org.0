Return-Path: <linux-media+bounces-33328-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C2D35AC32E4
	for <lists+linux-media@lfdr.de>; Sun, 25 May 2025 10:12:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5758E188C2A4
	for <lists+linux-media@lfdr.de>; Sun, 25 May 2025 08:12:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D04F41A2389;
	Sun, 25 May 2025 08:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="Oxv1u+vO"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-18.smtpout.orange.fr [80.12.242.18])
	(using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 028D713D8A4;
	Sun, 25 May 2025 08:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748160728; cv=none; b=jjZwq6Z+X6q9qWqZBk1/srCkxaeKdxIdh3af78l9qmO9PPKpGOM2qBWIVu7eWXxTPXRzgOnw1fyBcgJ1Tns9RoDxeDdoTTQBRLitnr+xb3qynxU0Wy44cxsqenpTb7cz2QULk0B5BUy2dGGrBd/Lah33ivbkWQmaslEUdifCUpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748160728; c=relaxed/simple;
	bh=sgxz6LZuMtlihxNcsf+OHQEbsujmuQRfsoCkpm1nB+k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LTvasv2Bvu4Alu/L77se/irgvh56WWRFI/Nc9vJXdep5P/qV/bEDVtf6T+0Ue0wg1QMkEpaS0/841qfDr5LJP+yxg4mfqwXew0Gf6n5d0mUhbECAMu8Ha7+qWUMHoqF4tpUPcU0biv7QdxcYj5jqKWlGLWhzhL1rqzOwNv+dP8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=Oxv1u+vO; arc=none smtp.client-ip=80.12.242.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from localhost.localdomain
 ([IPv6:2a01:cb10:785:b00:8347:f260:7456:7662])
	by smtp.orange.fr with ESMTPA
	id J6SWu3jyuMqmCJ6SWuXGnC; Sun, 25 May 2025 10:11:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1748160714;
	bh=N+pgtmqMp3jMY4j4S+MJ+ysG/AM3yFc0FScY5jqdHn0=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=Oxv1u+vOEMDGGYIIKVt/zDVhn+TOc9iuPkwoPTCdGpZr+88hgmRAmYBMXAWcUbzBm
	 n1aU4PBnjr23sTdyzUdxzPhn9SuhkMwtVch4fS6nXNfqMnc0UmLfaFjAkM4GoFAmSZ
	 EiJaUjVHq5qsg+sBtDhOUVwwj+3w+1NadVUKw5SqB9LEzqVf/Zx4xH5yeCGr506Fnb
	 B8+J8H8xDrToMSzwIaQvYx1wReDBE/0JaTcMiMAgwmy9+H36mdOhk345f8r/msZ/mF
	 TCxw/6VcFgPd5dSQf8x46+jng4Eqy2eA3YHnALSj5keGzEAtChT4QBZQYVh/FdtDv1
	 bxzMTrGH7Imow==
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 25 May 2025 10:11:54 +0200
X-ME-IP: 2a01:cb10:785:b00:8347:f260:7456:7662
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH] media: verisilicon: Use __set_bit() with local bitmaps
Date: Sun, 25 May 2025 10:11:44 +0200
Message-ID: <d2d01891c97fcd727ef508dffca10fc55d8ff145.1748160684.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The 'used' and 'new' bitmaps are local to this function, so there is no
need to use atomic access because concurrency can not happen.

Use the non-atomic __set_bit() to save a few cycles.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/media/platform/verisilicon/hantro_h264.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/verisilicon/hantro_h264.c b/drivers/media/platform/verisilicon/hantro_h264.c
index 4e9a0ecf5c13..2414782f1eb6 100644
--- a/drivers/media/platform/verisilicon/hantro_h264.c
+++ b/drivers/media/platform/verisilicon/hantro_h264.c
@@ -325,12 +325,12 @@ static void update_dpb(struct hantro_ctx *ctx)
 				continue;
 
 			*cdpb = *ndpb;
-			set_bit(j, used);
+			__set_bit(j, used);
 			break;
 		}
 
 		if (j == ARRAY_SIZE(ctx->h264_dec.dpb))
-			set_bit(i, new);
+			__set_bit(i, new);
 	}
 
 	/* For entries that could not be matched, use remaining free slots. */
@@ -349,7 +349,7 @@ static void update_dpb(struct hantro_ctx *ctx)
 
 		cdpb = &ctx->h264_dec.dpb[j];
 		*cdpb = *ndpb;
-		set_bit(j, used);
+		__set_bit(j, used);
 	}
 }
 
-- 
2.49.0


