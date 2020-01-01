Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A5E3312DE5B
	for <lists+linux-media@lfdr.de>; Wed,  1 Jan 2020 10:39:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725872AbgAAJjn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Jan 2020 04:39:43 -0500
Received: from gofer.mess.org ([88.97.38.141]:39187 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725787AbgAAJjn (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 1 Jan 2020 04:39:43 -0500
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 42D2411A002; Wed,  1 Jan 2020 09:39:42 +0000 (GMT)
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Subject: [PATCH 2/4] media: dib7000p: incorrect format specifier detected by clang
Date:   Wed,  1 Jan 2020 09:39:40 +0000
Message-Id: <20200101093942.15865-2-sean@mess.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200101093942.15865-1-sean@mess.org>
References: <20200101093942.15865-1-sean@mess.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

drivers/media/dvb-frontends/dib7000p.c:918:37: warning: format specifies type 'short' but the argument has type 'u8' (aka 'unsigned char') [-Wformat]
                dprintk("SPLIT %p: %hd\n", demod, agc_split);
                                   ~~~            ^~~~~~~~~
                                   %hhu

Signed-off-by: Sean Young <sean@mess.org>
---
 drivers/media/dvb-frontends/dib7000p.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/dvb-frontends/dib7000p.c b/drivers/media/dvb-frontends/dib7000p.c
index 0d22c700016d..0a7790c4bad3 100644
--- a/drivers/media/dvb-frontends/dib7000p.c
+++ b/drivers/media/dvb-frontends/dib7000p.c
@@ -915,7 +915,7 @@ static int dib7000p_agc_startup(struct dvb_frontend *demod)
 
 		dib7000p_restart_agc(state);
 
-		dprintk("SPLIT %p: %hd\n", demod, agc_split);
+		dprintk("SPLIT %p: %u\n", demod, agc_split);
 
 		(*agc_state)++;
 		ret = 5;
-- 
2.24.1

