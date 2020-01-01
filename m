Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9B80E12DE5D
	for <lists+linux-media@lfdr.de>; Wed,  1 Jan 2020 10:39:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725877AbgAAJjo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Jan 2020 04:39:44 -0500
Received: from gofer.mess.org ([88.97.38.141]:50569 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725851AbgAAJjn (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 1 Jan 2020 04:39:43 -0500
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 599EC11A003; Wed,  1 Jan 2020 09:39:42 +0000 (GMT)
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Subject: [PATCH 3/4] media: dib0070: incorrect format specifiers detected by clang
Date:   Wed,  1 Jan 2020 09:39:41 +0000
Message-Id: <20200101093942.15865-3-sean@mess.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200101093942.15865-1-sean@mess.org>
References: <20200101093942.15865-1-sean@mess.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

drivers/media/dvb-frontends/dib0070.c:192:52: warning: format specifies type 'short' but the argument has type 's8' (aka 'signed char') [-Wformat]
                dprintk("CAPTRIM=%hd; ADC = %hd (ADC) & %dmV\n", state->captrim, adc, (u32) adc*(u32)1800/(u32)1024);
                                 ~~~                             ^~~~~~~~~~~~~~
                                 %hhd
drivers/media/dvb-frontends/dib0070.c:30:22: note: expanded from macro 'dprintk'
                       __func__, ##arg);                                \
                                   ^~~
drivers/media/dvb-frontends/dib0070.c:203:59: warning: format specifies type 'short' but the argument has type 's8' (aka 'signed char') [-Wformat]
                        dprintk("CAPTRIM=%hd is closer to target (%hd/%hd)\n", state->captrim, adc, state->adc_diff);
                                         ~~~                                   ^~~~~~~~~~~~~~
                                         %hhd
drivers/media/dvb-frontends/dib0070.c:30:22: note: expanded from macro 'dprintk'
                       __func__, ##arg);                                \
                                   ^~~
drivers/media/dvb-frontends/dib0070.c:367:46: warning: format specifies type 'short' but the argument has type 'u8' (aka 'unsigned char') [-Wformat]
                dprintk("Tuning for Band: %hd (%d kHz)\n", band, freq);
                                          ~~~              ^~~~
                                          %hhu
drivers/media/dvb-frontends/dib0070.c:30:22: note: expanded from macro 'dprintk'
                       __func__, ##arg);                                \
                                   ^~~
drivers/media/dvb-frontends/dib0070.c:445:39: warning: format specifies type 'short' but the argument has type 'u8' (aka 'unsigned char') [-Wformat]
                        dprintk("REFDIV: %hd, FREF: %d\n", REFDIV, FREF);
                                         ~~~               ^~~~~~
                                         %hhu
drivers/media/dvb-frontends/dib0070.c:30:22: note: expanded from macro 'dprintk'
                       __func__, ##arg);                                \
                                   ^~~
drivers/media/dvb-frontends/dib0070.c:447:57: warning: format specifies type 'short' but the argument has type 'u8' (aka 'unsigned char') [-Wformat]
                        dprintk("Num: %hd, Den: %hd, SD: %hd\n", (u16) Rest, Den, (state->lo4 >> 12) & 0x1);
                                                ~~~                          ^~~
                                                %hhu
drivers/media/dvb-frontends/dib0070.c:30:22: note: expanded from macro 'dprintk'
                       __func__, ##arg);                                \
                                   ^~~
drivers/media/dvb-frontends/dib0070.c:447:62: warning: format specifies type 'short' but the argument has type 'int' [-Wformat]
                        dprintk("Num: %hd, Den: %hd, SD: %hd\n", (u16) Rest, Den, (state->lo4 >> 12) & 0x1);
                                                         ~~~                      ^~~~~~~~~~~~~~~~~~~~~~~~
                                                         %d
drivers/media/dvb-frontends/dib0070.c:30:22: note: expanded from macro 'dprintk'
                       __func__, ##arg);                                \
                                   ^~~
drivers/media/dvb-frontends/dib0070.c:448:33: warning: format specifies type 'short' but the argument has type 'u8' (aka 'unsigned char') [-Wformat]
                        dprintk("HFDIV code: %hd\n", state->current_tune_table_index->hfdiv);
                                             ~~~     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                                             %hhu
drivers/media/dvb-frontends/dib0070.c:30:22: note: expanded from macro 'dprintk'
                       __func__, ##arg);                                \
                                   ^~~
drivers/media/dvb-frontends/dib0070.c:449:27: warning: format specifies type 'short' but the argument has type 'u8' (aka 'unsigned char') [-Wformat]
                        dprintk("VCO = %hd\n", state->current_tune_table_index->vco_band);
                                       ~~~     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                                       %hhu
drivers/media/dvb-frontends/dib0070.c:30:22: note: expanded from macro 'dprintk'
                       __func__, ##arg);                                \
                                   ^~~
drivers/media/dvb-frontends/dib0070.c:450:40: warning: format specifies type 'short' but the argument has type 'u8' (aka 'unsigned char') [-Wformat]
                        dprintk("VCOF: ((%hd*%d) << 1))\n", state->current_tune_table_index->vco_multi, freq);
                                         ~~~                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                                         %hhu
drivers/media/dvb-frontends/dib0070.c:30:22: note: expanded from macro 'dprintk'
                       __func__, ##arg);                                \
                                   ^~~

Signed-off-by: Sean Young <sean@mess.org>
---
 drivers/media/dvb-frontends/dib0070.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/media/dvb-frontends/dib0070.c b/drivers/media/dvb-frontends/dib0070.c
index 3b26f61785d8..740050922d14 100644
--- a/drivers/media/dvb-frontends/dib0070.c
+++ b/drivers/media/dvb-frontends/dib0070.c
@@ -189,7 +189,7 @@ static int dib0070_captrim(struct dib0070_state *state, enum frontend_tune_state
 
 		adc = dib0070_read_reg(state, 0x19);
 
-		dprintk("CAPTRIM=%hd; ADC = %hd (ADC) & %dmV\n", state->captrim, adc, (u32) adc*(u32)1800/(u32)1024);
+		dprintk("CAPTRIM=%d; ADC = %hd (ADC) & %dmV\n", state->captrim, adc, (u32)adc * (u32)1800 / (u32)1024);
 
 		if (adc >= 400) {
 			adc -= 400;
@@ -200,7 +200,7 @@ static int dib0070_captrim(struct dib0070_state *state, enum frontend_tune_state
 		}
 
 		if (adc < state->adc_diff) {
-			dprintk("CAPTRIM=%hd is closer to target (%hd/%hd)\n", state->captrim, adc, state->adc_diff);
+			dprintk("CAPTRIM=%d is closer to target (%hd/%hd)\n", state->captrim, adc, state->adc_diff);
 			state->adc_diff = adc;
 			state->fcaptrim = state->captrim;
 		}
@@ -364,7 +364,7 @@ static int dib0070_tune_digital(struct dvb_frontend *fe)
 	}
 
 	if (*tune_state == CT_TUNER_START) {
-		dprintk("Tuning for Band: %hd (%d kHz)\n", band, freq);
+		dprintk("Tuning for Band: %d (%d kHz)\n", band, freq);
 		if (state->current_rf != freq) {
 			u8 REFDIV;
 			u32 FBDiv, Rest, FREF, VCOF_kHz;
@@ -442,12 +442,12 @@ static int dib0070_tune_digital(struct dvb_frontend *fe)
 			dib0070_write_reg(state, 0x20,
 				0x0040 | 0x0020 | 0x0010 | 0x0008 | 0x0002 | 0x0001 | state->current_tune_table_index->tuner_enable);
 
-			dprintk("REFDIV: %hd, FREF: %d\n", REFDIV, FREF);
+			dprintk("REFDIV: %u, FREF: %d\n", REFDIV, FREF);
 			dprintk("FBDIV: %d, Rest: %d\n", FBDiv, Rest);
-			dprintk("Num: %hd, Den: %hd, SD: %hd\n", (u16) Rest, Den, (state->lo4 >> 12) & 0x1);
-			dprintk("HFDIV code: %hd\n", state->current_tune_table_index->hfdiv);
-			dprintk("VCO = %hd\n", state->current_tune_table_index->vco_band);
-			dprintk("VCOF: ((%hd*%d) << 1))\n", state->current_tune_table_index->vco_multi, freq);
+			dprintk("Num: %u, Den: %u, SD: %d\n", (u16)Rest, Den, (state->lo4 >> 12) & 0x1);
+			dprintk("HFDIV code: %u\n", state->current_tune_table_index->hfdiv);
+			dprintk("VCO = %u\n", state->current_tune_table_index->vco_band);
+			dprintk("VCOF: ((%u*%d) << 1))\n", state->current_tune_table_index->vco_multi, freq);
 
 			*tune_state = CT_TUNER_STEP_0;
 		} else { /* we are already tuned to this frequency - the configuration is correct  */
-- 
2.24.1

