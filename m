Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CDF3BFCF1C
	for <lists+linux-media@lfdr.de>; Thu, 14 Nov 2019 21:04:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726969AbfKNUEb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Nov 2019 15:04:31 -0500
Received: from bonobo.elm.relay.mailchannels.net ([23.83.212.22]:28370 "EHLO
        bonobo.elm.relay.mailchannels.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726474AbfKNUEa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Nov 2019 15:04:30 -0500
X-Sender-Id: dreamhost|x-authsender|brad@nextdimension.ws
Received: from relay.mailchannels.net (localhost [127.0.0.1])
        by relay.mailchannels.net (Postfix) with ESMTP id A2A583C1098;
        Thu, 14 Nov 2019 20:04:29 +0000 (UTC)
Received: from pdx1-sub0-mail-a96.g.dreamhost.com (100-96-14-250.trex.outbound.svc.cluster.local [100.96.14.250])
        (Authenticated sender: dreamhost)
        by relay.mailchannels.net (Postfix) with ESMTPA id 239343C1191;
        Thu, 14 Nov 2019 20:04:29 +0000 (UTC)
X-Sender-Id: dreamhost|x-authsender|brad@nextdimension.ws
Received: from pdx1-sub0-mail-a96.g.dreamhost.com ([TEMPUNAVAIL].
 [64.90.62.162])
        (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384)
        by 0.0.0.0:2500 (trex/5.18.5);
        Thu, 14 Nov 2019 20:04:29 +0000
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|brad@nextdimension.ws
X-MailChannels-Auth-Id: dreamhost
X-Snatch-Drop: 215f3a186a4cd5e4_1573761869480_2139471512
X-MC-Loop-Signature: 1573761869480:3159481071
X-MC-Ingress-Time: 1573761869479
Received: from pdx1-sub0-mail-a96.g.dreamhost.com (localhost [127.0.0.1])
        by pdx1-sub0-mail-a96.g.dreamhost.com (Postfix) with ESMTP id C0B4982615;
        Thu, 14 Nov 2019 12:04:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=nextdimension.cc; h=from
        :to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=nextdimension.cc; bh=
        INkE9lqoAqjsaUKhb7l/WCnRpig=; b=JVrq15erri7VmVBJI/WuUfZiQQlZk5QT
        Rh7C3gLjZcxhbdmCip81xTfmi7v0fNq9F1IVySzCSuYQhglPmSQl05syJMhj8Nta
        tGnMUkPeKZLatjapOiJsxYqtNdrQhbfXH+wZKwASASXOOnnYnfJYDG5qRRrdV7xy
        YlXWv51gBgc=
Received: from localhost.localdomain (67-198-57-188.static.grandenetworks.net [67.198.57.188])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: brad@nextdimension.ws)
        by pdx1-sub0-mail-a96.g.dreamhost.com (Postfix) with ESMTPSA id 611718260D;
        Thu, 14 Nov 2019 12:04:23 -0800 (PST)
X-DH-BACKEND: pdx1-sub0-mail-a96
From:   Brad Love <brad@nextdimension.cc>
To:     linux-media@vger.kernel.org
Cc:     Brad Love <brad@nextdimension.cc>
Subject: [PATCH v3 14/14] cx25840: Register labeling, chip specific correction
Date:   Thu, 14 Nov 2019 14:04:08 -0600
Message-Id: <20191114200408.28883-15-brad@nextdimension.cc>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191114200408.28883-1-brad@nextdimension.cc>
References: <20191114200408.28883-1-brad@nextdimension.cc>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Remove vbi_regs_offset from a group of registers that are 888 specific,
include those registers names. Sources used for reference are 885 and 888
datasheets.

Add labels to some undocumented registers.

Signed-off-by: Brad Love <brad@nextdimension.cc>
---
Since v2:
- rebase

 drivers/media/i2c/cx25840/cx25840-core.c | 40 ++++++++++++------------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/drivers/media/i2c/cx25840/cx25840-core.c b/drivers/media/i2c=
/cx25840/cx25840-core.c
index 0de946fe2109..e2e935f78986 100644
--- a/drivers/media/i2c/cx25840/cx25840-core.c
+++ b/drivers/media/i2c/cx25840/cx25840-core.c
@@ -997,14 +997,14 @@ static void cx23885_initialize(struct i2c_client *c=
lient)
 	 */
 	cx25840_write4(client, 0x404, 0x0010253e);
=20
-	/* CC on  - Undocumented Register */
+	/* CC on  - VBI_LINE_CTRL3, FLD_VBI_MD_LINE12 */
 	cx25840_write(client, state->vbi_regs_offset + 0x42f, 0x66);
=20
 	/* HVR-1250 / HVR1850 DIF related */
 	/* Power everything up */
 	cx25840_write4(client, 0x130, 0x0);
=20
-	/* Undocumented */
+	/* SRC_COMB_CFG */
 	if (is_cx23888(state))
 		cx25840_write4(client, 0x454, 0x6628021F);
 	else
@@ -1486,24 +1486,24 @@ static int set_input(struct i2c_client *client,
 			cx25840_write4(client, 0x410, 0xffff0dbf);
 			cx25840_write4(client, 0x414, 0x00137d03);
=20
-			cx25840_write4(client, state->vbi_regs_offset + 0x42c,
-				       0x42600000);
-			cx25840_write4(client, state->vbi_regs_offset + 0x430,
-				       0x0000039b);
-			cx25840_write4(client, state->vbi_regs_offset + 0x438,
-				       0x00000000);
-
-			cx25840_write4(client, state->vbi_regs_offset + 0x440,
-				       0xF8E3E824);
-			cx25840_write4(client, state->vbi_regs_offset + 0x444,
-				       0x401040dc);
-			cx25840_write4(client, state->vbi_regs_offset + 0x448,
-				       0xcd3f02a0);
-			cx25840_write4(client, state->vbi_regs_offset + 0x44c,
-				       0x161f1000);
-			cx25840_write4(client, state->vbi_regs_offset + 0x450,
-				       0x00000802);
-
+			if (is_cx23888(state)) {
+				/* 888 MISC_TIM_CTRL */
+				cx25840_write4(client, 0x42c, 0x42600000);
+				/* 888 FIELD_COUNT */
+				cx25840_write4(client, 0x430, 0x0000039b);
+				/* 888 VSCALE_CTRL */
+				cx25840_write4(client, 0x438, 0x00000000);
+				/* 888 DFE_CTRL1 */
+				cx25840_write4(client, 0x440, 0xF8E3E824);
+				/* 888 DFE_CTRL2 */
+				cx25840_write4(client, 0x444, 0x401040dc);
+				/* 888 DFE_CTRL3 */
+				cx25840_write4(client, 0x448, 0xcd3f02a0);
+				/* 888 PLL_CTRL */
+				cx25840_write4(client, 0x44c, 0x161f1000);
+				/* 888 HTL_CTRL */
+				cx25840_write4(client, 0x450, 0x00000802);
+			}
 			cx25840_write4(client, 0x91c, 0x01000000);
 			cx25840_write4(client, 0x8e0, 0x03063870);
 			cx25840_write4(client, 0x8d4, 0x7FFF0024);
--=20
2.23.0

