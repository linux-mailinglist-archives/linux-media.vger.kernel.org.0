Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2695418BE63
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2020 18:42:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728502AbgCSRmM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Mar 2020 13:42:12 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:46203 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727034AbgCSRmL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Mar 2020 13:42:11 -0400
Received: from mail.cetitecgmbh.com ([87.190.42.90]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1My2lr-1jUarK0WI3-00zSSI; Thu, 19 Mar 2020 18:41:57 +0100
Received: from pflvmailgateway.corp.cetitec.com (unknown [127.0.0.1])
        by mail.cetitecgmbh.com (Postfix) with ESMTP id 5F4FE65021B;
        Thu, 19 Mar 2020 17:41:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at cetitec.com
Received: from mail.cetitecgmbh.com ([127.0.0.1])
        by pflvmailgateway.corp.cetitec.com (pflvmailgateway.corp.cetitec.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id wtU9-tNDMU4H; Thu, 19 Mar 2020 18:41:54 +0100 (CET)
Received: from pfwsexchange.corp.cetitec.com (unknown [10.10.1.99])
        by mail.cetitecgmbh.com (Postfix) with ESMTPS id 00D3364C8E4;
        Thu, 19 Mar 2020 18:41:54 +0100 (CET)
Received: from pflmari.corp.cetitec.com (10.8.5.52) by
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Thu, 19 Mar 2020 18:41:54 +0100
Received: by pflmari.corp.cetitec.com (Postfix, from userid 1000)
        id 5F2298050C; Thu, 19 Mar 2020 18:41:53 +0100 (CET)
Date:   Thu, 19 Mar 2020 18:41:53 +0100
From:   Alex Riesen <alexander.riesen@cetitec.com>
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
CC:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        "Laurent Pinchart" <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        <devel@driverdev.osuosl.org>, <linux-media@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>
Subject: [PATCH v2 03/10] media: adv748x: reduce amount of code for bitwise
 modifications of device registers
Message-ID: <099ebaa317156ec8edab973d0445851337139e6b.1584639664.git.alexander.riesen@cetitec.com>
Mail-Followup-To: Alex Riesen <alexander.riesen@cetitec.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        devel@driverdev.osuosl.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
References: <cover.1584639664.git.alexander.riesen@cetitec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <cover.1584639664.git.alexander.riesen@cetitec.com>
X-Originating-IP: [10.8.5.52]
X-ClientProxiedBy: PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) To
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99)
X-EsetResult: clean, is OK
X-EsetId: 37303A290D7F536A6D7762
X-Provags-ID: V03:K1:Lan9zbrXsfUeiLiyEBxUzKs+DF48vJgH5RZc2v4RDjol17Z2Ybd
 Xo28m5CLhLW10tqp+gYFHAgvec2Iktp2/MG7aVguxo0zj54EhAq4xoB1eR1wQnu+pS1c/iQ
 ejQQ8yVxQCpQexy2kUK4wneWSog0UO4vtAOKD8ZNmJ1yojdnB27kA38qQLxNJaf6lC8+zi1
 kHSx4twmFT98fidqoXhew==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:nG39rkiYiDU=:4GQ0TdIw2cZ8vFEYYqv/yE
 DoJpx5aWxVJ8+E59oez+pNMDscm80eKy2DiUo6RI4nh1zIfkLzXLExgwg/BdtkXoaavyaSIAc
 Dvg58unyoOhaNm34mmtglAB5seRE/4Pz/S/0WZqFhKSWkbv8XhAZ3iU2IpyBPxYDU2jt6HJ4a
 c9yXdmB9U1POk/M76uCIZCQRP7rVe6HWHK+eFDZuUfiURvtaIOr61gwXMEtUYkqnghM+xB/vN
 bhK+CZkTtUMG5zoay5vzGev3jHvTlnqEUHoYufkbXdBr4Pr8oeTPB7cW8CBr2JIdd+XtlOwh6
 FWJTSEFlcE/33sDNJ4sItDDbXp4ORZv3Ll1cIESZaKpT5VWLQXJvaC0wiXGWTG87UFvJySU21
 pBEmuYyPJKi6bJbXNz/+dl+dMfjKQbugTxIY5hF7HQzIGm7Dn15llvSDEWNgNSESM3YE8jaeL
 Fe3SStaie1ADUFSIutxouPmQhgM91UfaSMMcz2FsdNN4ktI5AEjb0Ubwzfjpm4oB5HWyBxYDe
 1TIiwJctDvVgl8VOR+QuLG1QVxwQ2dyOGETLnp3l7nG8OPO3zjZhIDjDsOBjSuWfFgNGXKUs3
 x0+QhHOBV5Z+gYBftsYEY0kCMmobUvrQiAT9oCTCdjxNJXk4DvBI7CW/q89AsRkEf+A26C4z3
 htAvS7AWHIX8eNntVI4SSlheJSqnwYFwwJRSGNEIkixi3Y2MSe7pHwYh5bBkaEmr2YF6qMu5N
 lr+cqstoBPbE5a5aWauGnfgT2mBsUZ/fjlPKtlnhOxCPd1r8B2fIBq43Fi15/DnVMUnl425gk
 cbOXwNMMjRmgleSpkhjz8yFs9NPOmna8+BKK0ZPzLbXN5JT93JbzBGpWimu5L2UIaNpOUYO
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The regmap provides a convenient utility for this.

Signed-off-by: Alexander Riesen <alexander.riesen@cetitec.com>
---
 drivers/media/i2c/adv748x/adv748x-core.c |  6 ++++++
 drivers/media/i2c/adv748x/adv748x.h      | 15 ++++++++++++---
 2 files changed, 18 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/adv748x/adv748x-core.c b/drivers/media/i2c/adv748x/adv748x-core.c
index 345f009de121..36164a254d7b 100644
--- a/drivers/media/i2c/adv748x/adv748x-core.c
+++ b/drivers/media/i2c/adv748x/adv748x-core.c
@@ -133,6 +133,12 @@ static int adv748x_write_check(struct adv748x_state *state, u8 page, u8 reg,
 	return *error;
 }
 
+int adv748x_update_bits(struct adv748x_state *state, u8 page, u8 reg, u8 mask,
+			u8 value)
+{
+	return regmap_update_bits(state->regmap[page], reg, mask, value);
+}
+
 /* adv748x_write_block(): Write raw data with a maximum of I2C_SMBUS_BLOCK_MAX
  * size to one or more registers.
  *
diff --git a/drivers/media/i2c/adv748x/adv748x.h b/drivers/media/i2c/adv748x/adv748x.h
index 09aab4138c3f..c5245464fffc 100644
--- a/drivers/media/i2c/adv748x/adv748x.h
+++ b/drivers/media/i2c/adv748x/adv748x.h
@@ -393,25 +393,34 @@ int adv748x_write(struct adv748x_state *state, u8 page, u8 reg, u8 value);
 int adv748x_write_block(struct adv748x_state *state, int client_page,
 			unsigned int init_reg, const void *val,
 			size_t val_len);
+int adv748x_update_bits(struct adv748x_state *state, u8 page, u8 reg,
+			u8 mask, u8 value);
 
 #define io_read(s, r) adv748x_read(s, ADV748X_PAGE_IO, r)
 #define io_write(s, r, v) adv748x_write(s, ADV748X_PAGE_IO, r, v)
-#define io_clrset(s, r, m, v) io_write(s, r, (io_read(s, r) & ~(m)) | (v))
+#define io_clrset(s, r, m, v) adv748x_update_bits(s, ADV748X_PAGE_IO, r, m, v)
+#define io_update(s, r, m, v) adv748x_update_bits(s, ADV748X_PAGE_IO, r, m, v)
 
 #define hdmi_read(s, r) adv748x_read(s, ADV748X_PAGE_HDMI, r)
 #define hdmi_read16(s, r, m) (((hdmi_read(s, r) << 8) | hdmi_read(s, (r)+1)) & (m))
 #define hdmi_write(s, r, v) adv748x_write(s, ADV748X_PAGE_HDMI, r, v)
+#define hdmi_update(s, r, m, v) \
+	adv748x_update_bits(s, ADV748X_PAGE_HDMI, r, m, v)
+
+#define dpll_read(s, r) adv748x_read(s, ADV748X_PAGE_DPLL, r)
+#define dpll_update(s, r, m, v) \
+	adv748x_update_bits(s, ADV748X_PAGE_DPLL, r, m, v)
 
 #define repeater_read(s, r) adv748x_read(s, ADV748X_PAGE_REPEATER, r)
 #define repeater_write(s, r, v) adv748x_write(s, ADV748X_PAGE_REPEATER, r, v)
 
 #define sdp_read(s, r) adv748x_read(s, ADV748X_PAGE_SDP, r)
 #define sdp_write(s, r, v) adv748x_write(s, ADV748X_PAGE_SDP, r, v)
-#define sdp_clrset(s, r, m, v) sdp_write(s, r, (sdp_read(s, r) & ~(m)) | (v))
+#define sdp_clrset(s, r, m, v) adv748x_update_bits(s, ADV748X_PAGE_SDP, r, m, v)
 
 #define cp_read(s, r) adv748x_read(s, ADV748X_PAGE_CP, r)
 #define cp_write(s, r, v) adv748x_write(s, ADV748X_PAGE_CP, r, v)
-#define cp_clrset(s, r, m, v) cp_write(s, r, (cp_read(s, r) & ~(m)) | (v))
+#define cp_clrset(s, r, m, v) adv748x_update_bits(s, ADV748X_PAGE_CP, r, m, v)
 
 #define tx_read(t, r) adv748x_read(t->state, t->page, r)
 #define tx_write(t, r, v) adv748x_write(t->state, t->page, r, v)
-- 
2.25.1.25.g9ecbe7eb18


