Return-Path: <linux-media+bounces-55230-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KBbCIoF6sGnLjgIAu9opvQ
	(envelope-from <linux-media+bounces-55230-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 21:09:37 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DDE00257612
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 21:09:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A0F7832226FE
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 20:06:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3926E3E2759;
	Tue, 10 Mar 2026 20:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EY1ZSqZV"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7B7F3E8C41
	for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 20:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773173188; cv=none; b=kBPoZRsL0PPFfM1CBa8TtBzMSfGr9/vWNCXt9ak3rgY6EyqeosvUHdhEKH4Fl0mMPw4y9PkHLx0XdGqMNM0J7kuh9CaO8gWHKHVMkH6AF8FfsqhH4Cg2avBOKPZ+UBxyXS81HMettq65OvWNOUwA3OQ28opGy7UCzPNoSLC7XR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773173188; c=relaxed/simple;
	bh=T2a2fDI+lpfSbpuOM83tDaRUsM8l7LwGUzwFcjl1mvQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AXJMwaX9P9YELhdTfqQ6qbCDjcexcw/LL0Ogm9YyJNF38STZe5kilSZQosNkPcfsLbg7S78AcAs222ilCybsAhWPiKLMgmWKgLsYxz0jl4pXUZ60JXPA10qvxTc3i80I/UVODQV77r57dT8ihdMfcy6JRBmS7L3hu3eLp+PuAcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EY1ZSqZV; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-829ac8d56c5so3915659b3a.3
        for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 13:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773173186; x=1773777986; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Cqt8CNmVHlobpg7w55yWqsOaWHWtGYPmo0BwNs9xzs=;
        b=EY1ZSqZVsBCAb8yoTv5Ro9tbbJ85U8wJ7rMaYZN6RFEv44YiQZ8MnnSeQBFiV4jjyL
         kFMmZf33bS1P+gg5/bs9gzWzsv6soRyNNHZr4yS9ZMpLCZCdzMqtfeC/Hgpy4X3fJUQN
         kdvCDyTvs8NmC+qUPElxzg3pkNLJ7wlnyARHjCvYaQcL95wb2bQQCeHJQR+V08I6ExGO
         BoOkC78d3OTqWbFvUjxbI2RlaV1qRHovEfgn7Xv/OdOFbStjruIodWOIypjZKsD65eM+
         wRQlxOsUQ56vcGsRLoqNF3S5ku1Q8JfNeqSWwM6e/CIBqWSxC+gpPK3mKIb84vE4/iVR
         IGag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773173186; x=1773777986;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7Cqt8CNmVHlobpg7w55yWqsOaWHWtGYPmo0BwNs9xzs=;
        b=AJ8reZrIrEMpPdpLsqW3ykTV/90QTedPGv6eywU5wOrHHJd9cZdm0BVVA9+fxrkRjr
         Nz24AMg5NvTEB4y+wP89lHfGl4bYndpA3gsNieOCZzoaippbyAErKpFcc+ZbB9bzmjZj
         K3FthKTG8ZueWZtLjC/mWYFkxXZre4pYwL3fFKZpCNL6Tbs4NH7PBTa/trzsgPz08can
         DwIppddCBBWhhyIn0i/R189kmDmerNl8RHNjRoTAe4KzwdyDWLxlh62TXX2twKhkLE3m
         2l1w2RECBI8/3ZdfY1c/6uBu1qoJ1e220bbdWJ8vzckd4DLJ1p//U+Vc+f7m+kEy7hlh
         25fA==
X-Forwarded-Encrypted: i=1; AJvYcCU4MeFS86f983DUNIXS7fI9Zk8FsOLKvy0TVLNDC3XdnafEm3HJCe7Nk79c5WvoKzuI9zSBvhNC3vkbsQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyReS61/xIDxGmEkvfTUVw3VndseU95SwHzK2HAQHRrEkxEoPS3
	UxYl2LPcAEm0zbZV16f5dO7Mu1OtNZvshAyizIE255ha/6UF562vSbjG
X-Gm-Gg: ATEYQzyqGJQuhjvkWlSoYs8JgeMf3plG61pqYLe/9BtftLdk4Oja2DPSAypgdXdeMCf
	RnCAgQVOtoT5CfxTQD1Z64F4lwadJ8bfYKldmnDMOktom8IIf3CB4tD0D9EQyoVId2L44uEm7Yb
	ZsZorbVwDZXcsqrnCBiCiLMP2d4Ehduna2y0kGL3s0DXTXoAK1rNaCN9tJKPDKgYaRkGe+v5JK8
	ieFe7OpeSmGdHKQ+3JE7ebZG1lxwue3gkUF2RSc2PsarLMpQAvSfiyulvycE/oxY7ALr4pRxwMR
	U1g8YvtpR5qFYJNP4XKDCwJjn3GQmYYoB1IrkYusWZK/Nm4jdrlXAMYaM7M4FgrWU0Pemtq0pTg
	XJRyWUYonOICP26eDw7eVjsFvKLqsuXBg/M+/wnXp6cAJjvOjtguPFnvM2nsvp/VjNUFSi9zZaG
	a8gjbrIqTlAOvc2cp/sdbOXigeGW/Gvf1X66FgpY01FBsYc241
X-Received: by 2002:a05:6a00:13a5:b0:824:374a:1424 with SMTP id d2e1a72fcca58-829f71b3f03mr122810b3a.58.1773173186006;
        Tue, 10 Mar 2026 13:06:26 -0700 (PDT)
Received: from hu-ckantibh-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829f6dc2d0asm101660b3a.13.2026.03.10.13.06.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 13:06:25 -0700 (PDT)
From: Sanjay Chitroda <sanjayembeddedse@gmail.com>
X-Google-Original-From: Sanjay Chitroda <sanjayembedded@gmail.com>
To: jic23@kernel.org,
	m.tretter@pengutronix.de,
	mchehab@kernel.org,
	p.zabel@pengutronix.de,
	tiffany.lin@mediatek.com,
	andrew-ct.chen@mediatek.com,
	yunfei.dong@mediatek.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org,
	pure.logic@nexus-software.ie
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	kernel@pengutronix.de,
	kees@kernel.org,
	nabijaczleweli@nabijaczleweli.xyz,
	marcelo.schmitt1@gmail.com,
	maudspierings@gocontroll.com,
	hverkuil+cisco@kernel.org,
	ribalda@chromium.org,
	straube.linux@gmail.com,
	dan.carpenter@linaro.org,
	lukagejak5@gmail.com,
	ethantidmore06@gmail.com,
	samasth.norway.ananda@oracle.com,
	karanja99erick@gmail.com,
	s9430939@naver.com,
	tglx@kernel.org,
	mingo@kernel.org,
	sun.jian.kdev@gmail.com,
	weibu@redadmin.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	sanjayembeddedse@gmail.com,
	skhan@linuxfoundation.org
Subject: [PATCH 5/7] media: chips-media: coda: simplify cleanup using __free
Date: Wed, 11 Mar 2026 01:35:11 +0530
Message-Id: <20260310200513.2162018-6-sanjayembedded@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260310200513.2162018-1-sanjayembedded@gmail.com>
References: <20260310200513.2162018-1-sanjayembedded@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: DDE00257612
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55230-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FREEMAIL_TO(0.00)[kernel.org,pengutronix.de,mediatek.com,gmail.com,collabora.com,linuxfoundation.org,nexus-software.ie];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[baylibre.com,analog.com,kernel.org,pengutronix.de,nabijaczleweli.xyz,gmail.com,gocontroll.com,chromium.org,linaro.org,oracle.com,naver.com,redadmin.org,vger.kernel.org,lists.infradead.org,lists.linaro.org,lists.linux.dev,linuxfoundation.org];
	RCPT_COUNT_TWELVE(0.00)[43];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[sanjayembeddedse@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

From: Sanjay Chitroda <sanjayembeddedse@gmail.com>

Replace manual cleanup logic with __free attribute from cleanup.h. This
removes explicit kfree() calls and simplifies the error handling paths.

No functional change intended for kmalloc()/kzalloc_obj().

Signed-off-by: Sanjay Chitroda <sanjayembeddedse@gmail.com>
---
 .../platform/chips-media/coda/coda-bit.c      |  4 +-
 .../platform/chips-media/coda/coda-jpeg.c     | 39 +++++++------------
 2 files changed, 16 insertions(+), 27 deletions(-)

diff --git a/drivers/media/platform/chips-media/coda/coda-bit.c b/drivers/media/platform/chips-media/coda/coda-bit.c
index b0559303c40f..958e245d0698 100644
--- a/drivers/media/platform/chips-media/coda/coda-bit.c
+++ b/drivers/media/platform/chips-media/coda/coda-bit.c
@@ -183,19 +183,17 @@ static void coda_kfifo_sync_to_device_write(struct coda_ctx *ctx)
 
 static int coda_h264_bitstream_pad(struct coda_ctx *ctx, u32 size)
 {
-	unsigned char *buf;
 	u32 n;
 
 	if (size < 6)
 		size = 6;
 
-	buf = kmalloc(size, GFP_KERNEL);
+	unsigned char *buf __free(kfree) = kmalloc(size, GFP_KERNEL);
 	if (!buf)
 		return -ENOMEM;
 
 	coda_h264_filler_nal(size, buf);
 	n = kfifo_in(&ctx->bitstream_fifo, buf, size);
-	kfree(buf);
 
 	return (n < size) ? -ENOSPC : 0;
 }
diff --git a/drivers/media/platform/chips-media/coda/coda-jpeg.c b/drivers/media/platform/chips-media/coda/coda-jpeg.c
index 835225383aa1..11f2800014e5 100644
--- a/drivers/media/platform/chips-media/coda/coda-jpeg.c
+++ b/drivers/media/platform/chips-media/coda/coda-jpeg.c
@@ -584,16 +584,15 @@ static int coda9_jpeg_gen_enc_huff_tab(struct coda_ctx *ctx, int tab_num,
 {
 	int i, j, k, lastk, si, code, maxsymbol;
 	const u8 *bits, *huffval;
-	struct {
-		int size[256];
-		int code[256];
-	} *huff;
 	static const unsigned char *huff_tabs[4] = {
 		luma_dc, luma_ac, chroma_dc, chroma_ac,
 	};
 	int ret = -EINVAL;
 
-	huff = kzalloc_obj(*huff);
+	struct {
+		int size[256];
+		int code[256];
+	} *huff __free(kfree) = kzalloc_obj(*huff);
 	if (!huff)
 		return -ENOMEM;
 
@@ -607,7 +606,7 @@ static int coda9_jpeg_gen_enc_huff_tab(struct coda_ctx *ctx, int tab_num,
 	for (i = 1; i <= 16; i++) {
 		j = bits[i - 1];
 		if (k + j > maxsymbol)
-			goto out;
+			return ret;
 		while (j--)
 			huff->size[k++] = i;
 	}
@@ -623,7 +622,7 @@ static int coda9_jpeg_gen_enc_huff_tab(struct coda_ctx *ctx, int tab_num,
 			code++;
 		}
 		if (code >= (1 << si))
-			goto out;
+			return ret;
 		code <<= 1;
 		si++;
 	}
@@ -632,15 +631,12 @@ static int coda9_jpeg_gen_enc_huff_tab(struct coda_ctx *ctx, int tab_num,
 	for (k = 0; k < lastk; k++) {
 		i = huffval[k];
 		if (i >= maxsymbol || ehufsi[i])
-			goto out;
+			return ret;
 		ehufco[i] = huff->code[k];
 		ehufsi[i] = huff->size[k];
 	}
 
-	ret = 0;
-out:
-	kfree(huff);
-	return ret;
+	return 0;
 }
 
 #define DC_TABLE_INDEX0		    0
@@ -715,15 +711,14 @@ static int coda9_jpeg_gen_dec_huff_tab(struct coda_ctx *ctx, int tab_num)
 
 static int coda9_jpeg_load_huff_tab(struct coda_ctx *ctx)
 {
-	struct {
-		int size[4][256];
-		int code[4][256];
-	} *huff;
 	u32 *huff_data;
 	int i, j;
 	int ret;
 
-	huff = kzalloc_obj(*huff);
+	struct {
+		int size[4][256];
+		int code[4][256];
+	} *huff __free(kfree) = kzalloc_obj(*huff);
 	if (!huff)
 		return -ENOMEM;
 
@@ -732,7 +727,7 @@ static int coda9_jpeg_load_huff_tab(struct coda_ctx *ctx)
 		ret = coda9_jpeg_gen_enc_huff_tab(ctx, i, huff->size[i],
 						  huff->code[i]);
 		if (ret)
-			goto out;
+			return ret;
 	}
 
 	if (!ctx->params.jpeg_huff_data) {
@@ -740,8 +735,7 @@ static int coda9_jpeg_load_huff_tab(struct coda_ctx *ctx)
 			kzalloc(sizeof(u32) * CODA9_JPEG_ENC_HUFF_DATA_SIZE,
 				GFP_KERNEL);
 		if (!ctx->params.jpeg_huff_data) {
-			ret = -ENOMEM;
-			goto out;
+			return -ENOMEM;
 		}
 	}
 	huff_data = ctx->params.jpeg_huff_data;
@@ -765,10 +759,7 @@ static int coda9_jpeg_load_huff_tab(struct coda_ctx *ctx)
 		}
 	}
 
-	ret = 0;
-out:
-	kfree(huff);
-	return ret;
+	return 0;
 }
 
 static void coda9_jpeg_write_huff_tab(struct coda_ctx *ctx)
-- 
2.34.1


