Return-Path: <linux-media+bounces-24354-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 30602A0470B
	for <lists+linux-media@lfdr.de>; Tue,  7 Jan 2025 17:49:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9C467188812D
	for <lists+linux-media@lfdr.de>; Tue,  7 Jan 2025 16:48:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B25291E25EB;
	Tue,  7 Jan 2025 16:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=emfend.at header.i=@emfend.at header.b="YHqeYWAE"
X-Original-To: linux-media@vger.kernel.org
Received: from lx20.hoststar.hosting (lx20.hoststar.hosting [168.119.41.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DBC3197558;
	Tue,  7 Jan 2025 16:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.41.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736268522; cv=none; b=XEdtKVKFVI+lhjwdlsWS6rIJCLPGxgaw0iJT+/cSjHUXWVei/qBmOImJKTe6lwg5q6637g8z2ELJQufUAStdoyEPCyiHTbxTfNQC4mHuX5o0cjPap39u+y4pXQYe4r0Zxo6mv12lo5nXwVzvxzSGRqgsrryIfDVTyGCUbm6yxaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736268522; c=relaxed/simple;
	bh=79/3xnhQlFqk+Yma/zbktmzNzj8u8pRjnBD6ncjAVFI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=dK9DAftk522riaRExnhLm6ydzhRRg0Ra7u0k6ipoa6rjPT3LE0yg/JFun+cbDIAvNzQURFrO+kd14dUsu+Ox44JEIR7bYJ95awpHQ6xlg1C3ThIl25hkcTT1UyPuRJ0ygiNi9R6/iZzjLEbTiojVBzANBgM+ywl8r7/Wu6sjzx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emfend.at; spf=pass smtp.mailfrom=emfend.at; dkim=pass (1024-bit key) header.d=emfend.at header.i=@emfend.at header.b=YHqeYWAE; arc=none smtp.client-ip=168.119.41.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emfend.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=emfend.at
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=emfend.at;
	 s=mail; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:
	To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=AlKbI33AAqrTvqU6EB5bajlXyKa6yxPlR8EiYF/v/z8=; b=YHqeYWAEnSKrQjx/h5uMHmgVp6
	+H3CQWzsCjijNp+pUqdr4Fnhfon94FMResI3yRkJL/g/MIf9dzYTAkyl3jwYf+vRe/466aHemANL8
	ZBb1y11Roa1EHpaUo58sgSlOgh26BsavnM06xdhyWKBokR9E+EbMAV46WJ22FeXy/Ofo=;
Received: from 194-208-208-245.tele.net ([194.208.208.245]:55823 helo=localhost.localdomain)
	by lx20.hoststar.hosting with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <matthias.fend@emfend.at>)
	id 1tVC6v-0056pg-5J; Tue, 07 Jan 2025 17:07:17 +0100
From: Matthias Fend <matthias.fend@emfend.at>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: m.felsch@pengutronix.de,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: tc358746: add support for 8/10/12/14-bit RAW Bayer formats
Date: Tue,  7 Jan 2025 17:07:00 +0100
Message-Id: <20250107160702.641703-1-matthias.fend@emfend.at>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: 
X-Spam-Bar: 
X-Spam-Report: 

The TC358746 supports RAW formats with 8, 10, 12, and 14-bit depths. Since
pixel data is transported transparently without modifying the pixel
arrangement, all Bayer patterns (RGGB, BGGR, GRBG, GBRG) are supported.

Signed-off-by: Matthias Fend <matthias.fend@emfend.at>
---
 drivers/media/i2c/tc358746.c | 27 ++++++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/tc358746.c b/drivers/media/i2c/tc358746.c
index 389582420ba7..5eccd4ffd84d 100644
--- a/drivers/media/i2c/tc358746.c
+++ b/drivers/media/i2c/tc358746.c
@@ -202,6 +202,15 @@ enum {
 	PDFORMAT_YUV444,
 };
 
+#define TC358746_FORMAT_RAW(_bpp, _code)		\
+{							\
+	.code = _code,					\
+	.bus_width = _bpp,				\
+	.bpp = _bpp,					\
+	.pdformat = PDFORMAT_RAW##_bpp,			\
+	.pdataf = PDATAF_MODE0, /* don't care */	\
+}
+
 /* Check tc358746_src_mbus_code() if you add new formats */
 static const struct tc358746_format tc358746_formats[] = {
 	{
@@ -230,7 +239,23 @@ static const struct tc358746_format tc358746_formats[] = {
 		.bpp = 20,
 		.pdformat = PDFORMAT_YUV422_10BIT,
 		.pdataf = PDATAF_MODE0, /* don't care */
-	}
+	},
+	TC358746_FORMAT_RAW(8, MEDIA_BUS_FMT_SBGGR8_1X8),
+	TC358746_FORMAT_RAW(8, MEDIA_BUS_FMT_SGBRG8_1X8),
+	TC358746_FORMAT_RAW(8, MEDIA_BUS_FMT_SGRBG8_1X8),
+	TC358746_FORMAT_RAW(8, MEDIA_BUS_FMT_SRGGB8_1X8),
+	TC358746_FORMAT_RAW(10, MEDIA_BUS_FMT_SBGGR10_1X10),
+	TC358746_FORMAT_RAW(10, MEDIA_BUS_FMT_SGBRG10_1X10),
+	TC358746_FORMAT_RAW(10, MEDIA_BUS_FMT_SGRBG10_1X10),
+	TC358746_FORMAT_RAW(10, MEDIA_BUS_FMT_SRGGB10_1X10),
+	TC358746_FORMAT_RAW(12, MEDIA_BUS_FMT_SBGGR12_1X12),
+	TC358746_FORMAT_RAW(12, MEDIA_BUS_FMT_SGBRG12_1X12),
+	TC358746_FORMAT_RAW(12, MEDIA_BUS_FMT_SGRBG12_1X12),
+	TC358746_FORMAT_RAW(12, MEDIA_BUS_FMT_SRGGB12_1X12),
+	TC358746_FORMAT_RAW(14, MEDIA_BUS_FMT_SBGGR14_1X14),
+	TC358746_FORMAT_RAW(14, MEDIA_BUS_FMT_SGBRG14_1X14),
+	TC358746_FORMAT_RAW(14, MEDIA_BUS_FMT_SGRBG14_1X14),
+	TC358746_FORMAT_RAW(14, MEDIA_BUS_FMT_SRGGB14_1X14),
 };
 
 /* Get n-th format for pad */
-- 
2.34.1


