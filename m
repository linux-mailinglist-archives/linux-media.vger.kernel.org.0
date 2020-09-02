Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB2AB25B153
	for <lists+linux-media@lfdr.de>; Wed,  2 Sep 2020 18:18:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728483AbgIBQSF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Sep 2020 12:18:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:53874 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727997AbgIBQKs (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 2 Sep 2020 12:10:48 -0400
Received: from mail.kernel.org (ip5f5ad5c3.dynamic.kabel-deutschland.de [95.90.213.195])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E0CDE2151B;
        Wed,  2 Sep 2020 16:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599063046;
        bh=BhKTMtLT8tEvJO4Z3S48DHTiFHHjF37Jb/BKMjkgGYk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Ji1MZZS0aC7lXUeQvKnjJ55ugpcvz6eLJUMbd4J3HALMK1mOqDKjY75gIxevxzgEF
         u5IlznikXopH6gq8xyVvB8HfMvCa72zZn2VNR/F3+JNTjx1QrO5ahDk0QvM1skmIOR
         z/fvinToCQMx04klOMY3dbDTXZU+LNYb7aYOjcX8=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kDVLP-000t9j-LB; Wed, 02 Sep 2020 18:10:43 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 01/38] media: tda10086: cleanup symbol_rate setting logic
Date:   Wed,  2 Sep 2020 18:10:04 +0200
Message-Id: <ef0740845ec5ec9890d6e332662166f5e642c66a.1599062230.git.mchehab+huawei@kernel.org>
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

The original logic had an integer to unsigned integer
conversion, plus a float-point math. While gcc should be
able to do the match at compile time, other compilers might
not do the same. Also, those produce the following warnings
with static code analyzers:

	drivers/media/dvb-frontends/tda10086.c:300 tda10086_set_symbol_rate() warn: unsigned 'symbol_rate' is never less than zero.
	drivers/media/dvb-frontends/tda10086.c:303 tda10086_set_symbol_rate() warn: unsigned 'symbol_rate' is never less than zero.
	drivers/media/dvb-frontends/tda10086.c:306 tda10086_set_symbol_rate() warn: unsigned 'symbol_rate' is never less than zero.
	drivers/media/dvb-frontends/tda10086.c:309 tda10086_set_symbol_rate() warn: unsigned 'symbol_rate' is never less than zero.
	drivers/media/dvb-frontends/tda10086.c:312 tda10086_set_symbol_rate() warn: unsigned 'symbol_rate' is never less than zero.
	drivers/media/dvb-frontends/tda10086.c:315 tda10086_set_symbol_rate() warn: unsigned 'symbol_rate' is never less than zero.
	drivers/media/dvb-frontends/tda10086.c:318 tda10086_set_symbol_rate() warn: unsigned 'symbol_rate' is never less than zero.
	drivers/media/dvb-frontends/tda10086.c:321 tda10086_set_symbol_rate() warn: unsigned 'symbol_rate' is never less than zero.
	drivers/media/dvb-frontends/tda10086.c:324 tda10086_set_symbol_rate() warn: unsigned 'symbol_rate' is never less than zero.
	drivers/media/dvb-frontends/tda10086.c:327 tda10086_set_symbol_rate() warn: unsigned 'symbol_rate' is never less than zero.

Change the logic to declare the reference constant as unsigned
and to not use float point math.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/dvb-frontends/tda10086.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/media/dvb-frontends/tda10086.c b/drivers/media/dvb-frontends/tda10086.c
index be6b40138f6e..cdcf97664bba 100644
--- a/drivers/media/dvb-frontends/tda10086.c
+++ b/drivers/media/dvb-frontends/tda10086.c
@@ -17,7 +17,7 @@
 #include <media/dvb_frontend.h>
 #include "tda10086.h"
 
-#define SACLK 96000000
+#define SACLK 96000000U
 
 struct tda10086_state {
 	struct i2c_adapter* i2c;
@@ -297,34 +297,34 @@ static int tda10086_set_symbol_rate(struct tda10086_state *state,
 	dprintk ("%s %i\n", __func__, symbol_rate);
 
 	/* setup the decimation and anti-aliasing filters.. */
-	if (symbol_rate < (u32) (SACLK * 0.0137)) {
+	if (symbol_rate < SACLK / 10000 * 137) {
 		dfn=4;
 		afs=1;
-	} else if (symbol_rate < (u32) (SACLK * 0.0208)) {
+	} else if (symbol_rate < SACLK / 10000 * 208) {
 		dfn=4;
 		afs=0;
-	} else if (symbol_rate < (u32) (SACLK * 0.0270)) {
+	} else if (symbol_rate < SACLK / 10000 * 270) {
 		dfn=3;
 		afs=1;
-	} else if (symbol_rate < (u32) (SACLK * 0.0416)) {
+	} else if (symbol_rate < SACLK / 10000 * 416) {
 		dfn=3;
 		afs=0;
-	} else if (symbol_rate < (u32) (SACLK * 0.0550)) {
+	} else if (symbol_rate < SACLK / 10000 * 550) {
 		dfn=2;
 		afs=1;
-	} else if (symbol_rate < (u32) (SACLK * 0.0833)) {
+	} else if (symbol_rate < SACLK / 10000 * 833) {
 		dfn=2;
 		afs=0;
-	} else if (symbol_rate < (u32) (SACLK * 0.1100)) {
+	} else if (symbol_rate < SACLK / 10000 * 1100) {
 		dfn=1;
 		afs=1;
-	} else if (symbol_rate < (u32) (SACLK * 0.1666)) {
+	} else if (symbol_rate < SACLK / 10000 * 1666) {
 		dfn=1;
 		afs=0;
-	} else if (symbol_rate < (u32) (SACLK * 0.2200)) {
+	} else if (symbol_rate < SACLK / 10000 * 2200) {
 		dfn=0;
 		afs=1;
-	} else if (symbol_rate < (u32) (SACLK * 0.3333)) {
+	} else if (symbol_rate < SACLK / 10000 * 3333) {
 		dfn=0;
 		afs=0;
 	} else {
-- 
2.26.2

