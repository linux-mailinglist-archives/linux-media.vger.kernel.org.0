Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B385825B148
	for <lists+linux-media@lfdr.de>; Wed,  2 Sep 2020 18:18:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728497AbgIBQRa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Sep 2020 12:17:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:53892 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728045AbgIBQKv (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 2 Sep 2020 12:10:51 -0400
Received: from mail.kernel.org (ip5f5ad5c3.dynamic.kabel-deutschland.de [95.90.213.195])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DAC322145D;
        Wed,  2 Sep 2020 16:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599063046;
        bh=0Hj7ZIEL0P3+LazNj3oWTUDc18jn9Tcv84+tSkI0Wtg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=VA1GN01hnAbujexln0WXKOHjK5Pa4EMpteFO/qoRPoLo700l4eXmKSgDC8ry2xvJe
         NbCw3PqKHFOy/OHBHi5tSYUBkXpBmk16gxahSRl3o9FGd0SSMMBP9faddVrPmsk4z1
         +86S5WrUxcqj1cz+be5EXucse5DHu9lzZ38p3nds=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kDVLP-000t9w-QL; Wed, 02 Sep 2020 18:10:43 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 07/38] media: tda10021: avoid casts when using symbol_rate
Date:   Wed,  2 Sep 2020 18:10:10 +0200
Message-Id: <316f5e497a02dc245953134f22cfb70aa67ccd26.1599062230.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1599062230.git.mchehab+huawei@kernel.org>
References: <cover.1599062230.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The usage of castings and float point when checking for
the setup based at the symbol_rate cause those warnings
with smatch:

	drivers/media/dvb-frontends/tda10021.c:153 tda10021_set_symbolrate() warn: unsigned 'symbolrate' is never less than zero.
	drivers/media/dvb-frontends/tda10021.c:155 tda10021_set_symbolrate() warn: unsigned 'symbolrate' is never less than zero.
	drivers/media/dvb-frontends/tda10021.c:157 tda10021_set_symbolrate() warn: unsigned 'symbolrate' is never less than zero.
	drivers/media/dvb-frontends/tda10021.c:159 tda10021_set_symbolrate() warn: unsigned 'symbolrate' is never less than zero.

While the code should work with gcc, as it will evaluate the
values into a constant before compiling, other compilers
could do otherwise. So, get rid of float pointing math on it,
avoiding the need of doing typecasts.

While here, cleanup some coding style issues at the related
code.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/dvb-frontends/tda10021.c | 38 ++++++++++++++++----------
 1 file changed, 24 insertions(+), 14 deletions(-)

diff --git a/drivers/media/dvb-frontends/tda10021.c b/drivers/media/dvb-frontends/tda10021.c
index 9fb207b41576..faa6e54b3372 100644
--- a/drivers/media/dvb-frontends/tda10021.c
+++ b/drivers/media/dvb-frontends/tda10021.c
@@ -137,26 +137,36 @@ static int tda10021_set_symbolrate (struct tda10021_state* state, u32 symbolrate
 {
 	s32 BDR;
 	s32 BDRI;
-	s16 SFIL=0;
+	s16 SFIL = 0;
 	u16 NDEC = 0;
 	u32 tmp, ratio;
 
-	if (symbolrate > XIN/2)
-		symbolrate = XIN/2;
-	if (symbolrate < 500000)
+	if (symbolrate > XIN / 2)
+		symbolrate = XIN / 2;
+	else if (symbolrate < 500000)
 		symbolrate = 500000;
 
-	if (symbolrate < XIN/16) NDEC = 1;
-	if (symbolrate < XIN/32) NDEC = 2;
-	if (symbolrate < XIN/64) NDEC = 3;
+	if (symbolrate < XIN / 16)
+		NDEC = 1;
+	if (symbolrate < XIN / 32)
+		NDEC = 2;
+	if (symbolrate < XIN / 64)
+		NDEC = 3;
 
-	if (symbolrate < (u32)(XIN/12.3)) SFIL = 1;
-	if (symbolrate < (u32)(XIN/16))	 SFIL = 0;
-	if (symbolrate < (u32)(XIN/24.6)) SFIL = 1;
-	if (symbolrate < (u32)(XIN/32))	 SFIL = 0;
-	if (symbolrate < (u32)(XIN/49.2)) SFIL = 1;
-	if (symbolrate < (u32)(XIN/64))	 SFIL = 0;
-	if (symbolrate < (u32)(XIN/98.4)) SFIL = 1;
+	if (symbolrate < XIN * 10 / 123)
+		SFIL = 1;
+	if (symbolrate < XIN * 10 / 160)
+		SFIL = 0;
+	if (symbolrate < XIN * 10 / 246)
+		SFIL = 1;
+	if (symbolrate < XIN * 10 / 320)
+		SFIL = 0;
+	if (symbolrate < XIN * 10 / 492)
+		SFIL = 1;
+	if (symbolrate < XIN * 10 / 640)
+		SFIL = 0;
+	if (symbolrate < XIN * 10 / 984)
+		SFIL = 1;
 
 	symbolrate <<= NDEC;
 	ratio = (symbolrate << 4) / FIN;
-- 
2.26.2

