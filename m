Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D33A712DE5E
	for <lists+linux-media@lfdr.de>; Wed,  1 Jan 2020 10:39:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725890AbgAAJjp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Jan 2020 04:39:45 -0500
Received: from gofer.mess.org ([88.97.38.141]:49147 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725862AbgAAJjo (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 1 Jan 2020 04:39:44 -0500
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 73E4F11A004; Wed,  1 Jan 2020 09:39:42 +0000 (GMT)
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Subject: [PATCH 4/4] media: dib0090: incorrect format specifier detected by clang
Date:   Wed,  1 Jan 2020 09:39:42 +0000
Message-Id: <20200101093942.15865-4-sean@mess.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200101093942.15865-1-sean@mess.org>
References: <20200101093942.15865-1-sean@mess.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

drivers/media/dvb-frontends/dib0090.c:1751:67: warning: format specifies type 'short' but the argument has type 'u8' (aka 'unsigned char') [-Wformat]
                        dprintk("BB Offset Cal, BBreg=%hd,Offset=%hd,Value Set=%hd\n", state->dc->addr, state->adc_diff, state->step);
                                                      ~~~                              ^~~~~~~~~~~~~~~
                                                      %hhu
drivers/media/dvb-frontends/dib0090.c:30:22: note: expanded from macro 'dprintk'
                       __func__, ##arg);                                \
                                   ^~~
drivers/media/dvb-frontends/dib0090.c:1751:101: warning: format specifies type 'short' but the argument has type 's8' (aka 'signed char') [-Wformat]
                        dprintk("BB Offset Cal, BBreg=%hd,Offset=%hd,Value Set=%hd\n", state->dc->addr, state->adc_diff, state->step);
                                                                               ~~~                                       ^~~~~~~~~~~
                                                                               %hhd
drivers/media/dvb-frontends/dib0090.c:30:22: note: expanded from macro 'dprintk'
                       __func__, ##arg);                                \
                                   ^~~

Signed-off-by: Sean Young <sean@mess.org>
---
 drivers/media/dvb-frontends/dib0090.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/dvb-frontends/dib0090.c b/drivers/media/dvb-frontends/dib0090.c
index d13d2e81f8c9..52af1cf82d94 100644
--- a/drivers/media/dvb-frontends/dib0090.c
+++ b/drivers/media/dvb-frontends/dib0090.c
@@ -1748,7 +1748,7 @@ static int dib0090_dc_offset_calibration(struct dib0090_state *state, enum front
 			}
 
 			dib0090_set_trim(state);
-			dprintk("BB Offset Cal, BBreg=%hd,Offset=%hd,Value Set=%hd\n", state->dc->addr, state->adc_diff, state->step);
+			dprintk("BB Offset Cal, BBreg=%u,Offset=%d,Value Set=%d\n", state->dc->addr, state->adc_diff, state->step);
 
 			state->dc++;
 			if (state->dc->addr == 0)	/* done */
-- 
2.24.1

