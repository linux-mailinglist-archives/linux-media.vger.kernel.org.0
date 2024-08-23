Return-Path: <linux-media+bounces-16679-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BFD0E95D875
	for <lists+linux-media@lfdr.de>; Fri, 23 Aug 2024 23:32:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 744A62861C0
	for <lists+linux-media@lfdr.de>; Fri, 23 Aug 2024 21:32:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DF941C86F2;
	Fri, 23 Aug 2024 21:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nfraprado@collabora.com header.b="V/k1CnhR"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BEA214A4D2;
	Fri, 23 Aug 2024 21:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724448712; cv=pass; b=IKwJBcE56rBQY0m5wfwSpQe0xEpgXXP4EoN1oNN8tjjhcrXsCGTLHe1GMNf3UhTYV32NHxpLna+EdHxcPcHtShu3W/hPDIr8wh3Ydg7X4ND7FWoZS2/PvnrdQReIrU81e4CR1r01f6FmOXIhxgZB1FJjF3cv1XQeGzSS4wwu4lQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724448712; c=relaxed/simple;
	bh=3bkyyUjY2Pbb+FztdZS+odXwwyjnMvjhxfTrjcbVF2c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=C5F7thYkQsVEeR6lP9QBmdCids7l1NYOxcpwPffAyfNMlGuexA9oQ0IWwpGmokBPwY/H1A+6pocwWQAPlj8oPBRpZZRJI2LDZiIvd4PS8Rw4YCGezEkY93leAjMfDugqgnmqgqoiCjWcUjiKfdvHqtLv4RmWlt9Q+zxISLsfauo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nfraprado@collabora.com header.b=V/k1CnhR; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Delivered-To: angelogioacchino.delregno@collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1724448701; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Ac6dohFSVTSb5jp/QnPySydG6kjkUzo0sGuP3UOGb11G57D+AEYLxpD3X929KUm7gsS5u/pXD+xn5trxYqyAgqiTnD4wnUvWw7p2/Q0VpGXUZiUi1wXGz+vf4yeJ6KJAQWS7wTh97JWZzDG9Vt6rTuStZ0xAkdUaEgB8WTV6qdg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1724448701; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=NiqObwJqOFQxxCp3toVLk+SJJNTrxf9JSKeAtkXKv6s=; 
	b=hLZQ42cR9JfM/18fzWL7SMfNS6+0OgS5znoUwfPclE+LXCM7TETmoETG0i5lbRxK1j97bCGFxf6rLErrYGtFZsRHLv6E8CbYTPYK6C/RotlH8ujHXOygisn5BRNvfjXw5Ofd15z0SwNZL1DrefEXNC3urR1vZOsKR/f5jfbTlSI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nfraprado@collabora.com;
	dmarc=pass header.from=<nfraprado@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1724448701;
	s=zohomail; d=collabora.com; i=nfraprado@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=NiqObwJqOFQxxCp3toVLk+SJJNTrxf9JSKeAtkXKv6s=;
	b=V/k1CnhR7y3DRjfko5tGFoSGjKoHNh03fgq1Y75G4OnTLXu7oiUbg4DMtpE1PItL
	vqqiNz+IaXQqncnRcyI1Dt0qXguEfrZEP18x2wkK7NUmRlT6K9ivdm5m97rt+WAdE4c
	zbeRucBk7k9MnLOCQpIw+8O6gloeZHhBX0sNGa7k=
Received: by mx.zohomail.com with SMTPS id 1724448700243697.4534880773641;
	Fri, 23 Aug 2024 14:31:40 -0700 (PDT)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Fri, 23 Aug 2024 17:31:22 -0400
Subject: [PATCH 2/4] media: platform: mtk-mdp3: Remove useless variadic
 arguments from macros
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240823-mdp3-comp-cleanups-v1-2-1f8c1395ecd3@collabora.com>
References: <20240823-mdp3-comp-cleanups-v1-0-1f8c1395ecd3@collabora.com>
In-Reply-To: <20240823-mdp3-comp-cleanups-v1-0-1f8c1395ecd3@collabora.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: kernel@collabora.com, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
X-Mailer: b4 0.14.1
X-ZohoMailClient: External

A few macros declare variadic arguments even though the underlying
functions don't support them. Remove them.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.h | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.h b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.h
index 3e5d2da1c807..5bcd7f8c6edf 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.h
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.h
@@ -9,16 +9,16 @@
 
 #include "mtk-mdp3-cmdq.h"
 
-#define MM_REG_WRITE_MASK(cmd, id, base, ofst, val, mask, ...)	\
+#define MM_REG_WRITE_MASK(cmd, id, base, ofst, val, mask)	\
 	cmdq_pkt_write_mask(&((cmd)->pkt), id,			\
-		(base) + (ofst), (val), (mask), ##__VA_ARGS__)
+		(base) + (ofst), (val), (mask))
 
-#define MM_REG_WRITE(cmd, id, base, ofst, val, mask, ...)	\
+#define MM_REG_WRITE(cmd, id, base, ofst, val, mask)		\
 do {								\
 	typeof(mask) (m) = (mask);				\
 	MM_REG_WRITE_MASK(cmd, id, base, ofst, val,		\
 		(((m) & (ofst##_MASK)) == (ofst##_MASK)) ?	\
-			(0xffffffff) : (m), ##__VA_ARGS__);	\
+			(0xffffffff) : (m));			\
 } while (0)
 
 #define MM_REG_WAIT(cmd, evt)					\
@@ -49,19 +49,19 @@ do {								\
 	cmdq_pkt_set_event(&((c)->pkt), (e));			\
 } while (0)
 
-#define MM_REG_POLL_MASK(cmd, id, base, ofst, val, _mask, ...)	\
+#define MM_REG_POLL_MASK(cmd, id, base, ofst, val, _mask)	\
 do {								\
 	typeof(_mask) (_m) = (_mask);				\
 	cmdq_pkt_poll_mask(&((cmd)->pkt), id,			\
-		(base) + (ofst), (val), (_m), ##__VA_ARGS__);	\
+		(base) + (ofst), (val), (_m));			\
 } while (0)
 
-#define MM_REG_POLL(cmd, id, base, ofst, val, mask, ...)	\
+#define MM_REG_POLL(cmd, id, base, ofst, val, mask)		\
 do {								\
 	typeof(mask) (m) = (mask);				\
 	MM_REG_POLL_MASK((cmd), id, base, ofst, val,		\
 		(((m) & (ofst##_MASK)) == (ofst##_MASK)) ?	\
-			(0xffffffff) : (m), ##__VA_ARGS__);	\
+			(0xffffffff) : (m));			\
 } while (0)
 
 enum mtk_mdp_comp_id {

-- 
2.46.0


