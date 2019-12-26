Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 64ED012AEEF
	for <lists+linux-media@lfdr.de>; Thu, 26 Dec 2019 22:29:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726442AbfLZV3P (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Dec 2019 16:29:15 -0500
Received: from mout.kundenserver.de ([212.227.126.133]:56301 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726105AbfLZV3P (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Dec 2019 16:29:15 -0500
Received: from be1.lan ([89.245.193.48]) by mrelayeu.kundenserver.de (mreue011
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MHoAg-1ixDTT0Ezu-00EqxB; Thu, 26
 Dec 2019 22:29:13 +0100
Received: from 7eggert by be1.lan with local (Exim 4.92.2)
        (envelope-from <7eggert@online.de>)
        id 1ikagv-0002Un-FA; Thu, 26 Dec 2019 22:29:10 +0100
From:   Bodo Eggert <7eggert@gmx.de>
To:     Sean Young <sean@mess.org>, linux-media@vger.kernel.org
Cc:     Bodo Eggert <7eggert@gmx.de>
Subject: [PATCH] serial_ir: change "ignoring spike" to debug level
Date:   Thu, 26 Dec 2019 22:28:45 +0100
Message-Id: <20191226212845.9545-1-7eggert@gmx.de>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191226172937.GB24174@gofer.mess.org>
References: <20191226172937.GB24174@gofer.mess.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:N7mL9PaoJSUm4ff+6qjvkJwkx4frrlN++hs2TBgl59Jo+JDmRaC
 bfgzavFUV2WNsOVLSiC6mKyeDleiTwtxo+AuR3kIKT9abyc/5wDslUSObElXJlq+ZbOUeCC
 rct70MuMHFrxN+XoRqce1NZ0093V03wK0bpLkKL6Nq1kZWDSVd9fkBWHmc6ork6kvnKQNOO
 TkoAp+OQW00lWAMCQbvkw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:AY7VYmzZ2gI=:H35VALtiRu+u0Gi5fRfLZR
 AYA34fA+kEhLo4A/W8wVUzpo1t5nH1e7gYuOiyrGUov4XjC7cnMkIz5OB3LlXZkxmHhfbTzru
 h9jpKkE1ItRxINQgMTD864EMuuNWM0nibmx1G+YCYkpe9hUcDReYLp5lMaQ614NaKkmfSuckT
 IMxARCQmhkxVaNnMjs2VOTeDsXT6P+Ak8WBxsBViEKGGpOCsDs4sPWJUw4Eub5RQ2NKxCRXRl
 mOXWaakE8awbdJ9Ts736ViIkefl4xbrUSne311PDbBHw5NhOfNZQIfuqt2Vc94bzLdI6NgxZG
 /nQlYwLHOvODWX4QDEg6KYx1rxvnVU2GFo5hsHGf81KpyYgRdddRr9OYkEDyufIdklQImPKH5
 L9tMUs00FB/sEabI/3Vne1gkN4R/7Dkje7xl6rjEryTtirnJay+LUoRzeBhNsLv+Yg2hRgXZH
 tb1KighkgjpY+yQW4Q/FZxxUPea2BZ00YnPIJGksUfL703hNFDmNUSrpQWktciXQ0/GJpITZU
 OFc/2RU3ePfvBnv6F9gBvz/bH5iV0/B8p3LvohlByb/6jEu0FNY8bPZByqQ3ft5xa1JJ6zSD+
 tOj6QX2oB+VsPmTap75BuU86PqiJTYnQHfVJBCvFBmbaR2Qrl8p2T/JuXvzwJuVVe6vCQ6WG3
 Vru5ycx6PXlaZsvpGulfl4zrVN7VarNbLxvUhtEL9o8Xse5wl/d7mgc0ZSxrRx8SrC3tUZ9Qw
 ILzbVQOTw15n0dqn3YgL/hmXp0KAJg2l+KNGd661rF9PAla3+pAGyTgRMnzGxRvDU9D0zt+sY
 B84YJKjzaVcjnp4mfedxoNj4V1R24JNtsS1OVud/BJhGYzmI/+GlW9pz9xv+d1e2R/fnqCdaf
 oR2uY1cicAbf8ZVAyalQ==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

At least on my system with a self-made IR receiver, my kernel log is filled with:
serial_ir serial_ir.0: ignoring spike: 1 1 1419988034627194ns 1419956080709377ns

These messages happen at random and do not prevent the receiver from
working. Also I cannot change the features of the IC, therefore they are not
useful. Probably they are not useful at all.

However they fill the console, they accumulate and fill the dmesg log, by
doing this, they prevent me from seeing important message.

Signed-Off-By: Bodo Eggert <7eggert@gmx.de>
---
 drivers/media/rc/serial_ir.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/rc/serial_ir.c b/drivers/media/rc/serial_ir.c
index 7652e982173f..d77507ba0fb5 100644
--- a/drivers/media/rc/serial_ir.c
+++ b/drivers/media/rc/serial_ir.c
@@ -353,7 +353,7 @@ static irqreturn_t serial_ir_irq_handler(int i, void *blah)
 			dcd = (status & hardware[type].signal_pin) ? 1 : 0;
 
 			if (dcd == last_dcd) {
-				dev_err(&serial_ir.pdev->dev,
+				dev_dbg(&serial_ir.pdev->dev,
 					"ignoring spike: %d %d %lldns %lldns\n",
 					dcd, sense, ktime_to_ns(kt),
 					ktime_to_ns(serial_ir.lastkt));
-- 
2.24.0

