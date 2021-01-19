Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB6752FC4E7
	for <lists+linux-media@lfdr.de>; Wed, 20 Jan 2021 00:39:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729544AbhASXho (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Jan 2021 18:37:44 -0500
Received: from gofer.mess.org ([88.97.38.141]:39537 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390177AbhASODi (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Jan 2021 09:03:38 -0500
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 1FF36C63BE; Tue, 19 Jan 2021 14:02:54 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
        t=1611064974; bh=MzOFy3xF2IZEEugnuO1Xh8BroOvhVLH+oNSRwzgeang=;
        h=Date:From:To:Cc:Subject:From;
        b=aRjAbLgyEynARxwOXeWyP6zsod8GKKQ9nh12xChHbdq7C9mXGnQZ4sbpsxd5h3AEm
         JeaMFoAHffINtQpwyAXdHV5y5xY2CftqfNuCqVk2Agbit466J1vJE7GwHh9mRpSlUC
         A+tJV2s2bfdPBqEwaom1XryElt6uTpSI3J8pSix6qcGGcaY8JcpTM2SzClqoHZ7DjU
         ZBeHCk7LihWE1TyiH1FU5QEA7VE9PkQMBWpwEL/wipDIZ6jtysqObU7LEefxf0zaQT
         yAaTJAGJx/hgGh7upT1vS/7ApSJjUe0f4GNmSZ0Ep7v2g/9gbA6mcEUH7UyTnjxeMU
         +bc7/mwEnGEpg==
Date:   Tue, 19 Jan 2021 14:02:53 +0000
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Cc:     =?utf-8?B?5oWV5Yas5Lqu?= <mudongliangabcd@gmail.com>,
        anant.thazhemadam@gmail.com,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
        Dmitry Vyukov <dvyukov@google.com>
Subject: [PATCH] media: mceusb: sanity check for prescaler value
Message-ID: <20210119140253.GA18758@gofer.mess.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

A prescaler larger than 8 would mean the carrier is at most 152Hz,
which does not make sense for IR carriers.

Reported-by: syzbot+6d31bf169a8265204b8d@syzkaller.appspotmail.com
Signed-off-by: Sean Young <sean@mess.org>
---
 drivers/media/rc/mceusb.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/media/rc/mceusb.c b/drivers/media/rc/mceusb.c
index c8d63673e131..5642595a057e 100644
--- a/drivers/media/rc/mceusb.c
+++ b/drivers/media/rc/mceusb.c
@@ -701,11 +701,18 @@ static void mceusb_dev_printdata(struct mceusb_dev *ir, u8 *buf, int buf_len,
 				data[0], data[1]);
 			break;
 		case MCE_RSP_EQIRCFS:
+			if (!data[0] && !data[1]) {
+				dev_dbg(dev, "%s: no carrier", inout);
+				break;
+			}
+			// prescaler should make sense
+			if (data[0] > 8)
+				break;
 			period = DIV_ROUND_CLOSEST((1U << data[0] * 2) *
 						   (data[1] + 1), 10);
 			if (!period)
 				break;
-			carrier = (1000 * 1000) / period;
+			carrier = USEC_PER_SEC / period;
 			dev_dbg(dev, "%s carrier of %u Hz (period %uus)",
 				 inout, carrier, period);
 			break;
-- 
2.29.2

