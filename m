Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DF90818D44E
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2020 17:24:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727457AbgCTQYM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 20 Mar 2020 12:24:12 -0400
Received: from mout.kundenserver.de ([217.72.192.74]:52771 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726983AbgCTQYM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 20 Mar 2020 12:24:12 -0400
Received: from mail.cetitecgmbh.com ([87.190.42.90]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MVvGt-1io0113eBp-00RsLc for <linux-media@vger.kernel.org>; Fri, 20 Mar
 2020 17:24:10 +0100
Received: from pflvmailgateway.corp.cetitec.com (unknown [127.0.0.1])
        by mail.cetitecgmbh.com (Postfix) with ESMTP id A5240650374
        for <linux-media@vger.kernel.org>; Fri, 20 Mar 2020 16:24:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at cetitec.com
Received: from mail.cetitecgmbh.com ([127.0.0.1])
        by pflvmailgateway.corp.cetitec.com (pflvmailgateway.corp.cetitec.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id iDywV2UNy74p for <linux-media@vger.kernel.org>;
        Fri, 20 Mar 2020 17:24:10 +0100 (CET)
Received: from pfwsexchange.corp.cetitec.com (unknown [10.10.1.99])
        by mail.cetitecgmbh.com (Postfix) with ESMTPS id 48B7264CEE2
        for <linux-media@vger.kernel.org>; Fri, 20 Mar 2020 17:24:10 +0100 (CET)
Received: from pflmari.corp.cetitec.com (10.8.5.41) by
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Fri, 20 Mar 2020 17:24:10 +0100
Received: by pflmari.corp.cetitec.com (Postfix, from userid 1000)
        id 2255B80500; Fri, 20 Mar 2020 17:11:46 +0100 (CET)
Date:   Fri, 20 Mar 2020 17:11:46 +0100
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
Subject: [PATCH v3 03/11] media: adv748x: reduce amount of code for bitwise
 modifications of device registers
Message-ID: <88950969b1d16ff5fcd1b3458356c4cf5a9e6cff.1584720678.git.alexander.riesen@cetitec.com>
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
References: <cover.1584720678.git.alexander.riesen@cetitec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <cover.1584720678.git.alexander.riesen@cetitec.com>
X-Originating-IP: [10.8.5.41]
X-ClientProxiedBy: PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) To
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99)
X-EsetResult: clean, is OK
X-EsetId: 37303A290D7F536A6D7662
X-Provags-ID: V03:K1:LxFPcbuLqsRvpDdNxSa1jziYj7+PKy9v2tgWJGjkFh6RCF+d0n0
 sGIedEokKHKzsTZ6idnCxSkkI5SzdZQZAOsyj4CbCj5AESuh1zMXcD+dUsu8DeSg4B9UiWE
 Yt2I2TrUHBvb0LtCZLsvh0qdQRkebkivjwHrHoBoRoTQY+In/zjwF4sYkoHV8LtThA/o6Rg
 EbHv856Po7oPsJVmI4RSQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:KRz75mnzqNk=:VcLaQjraZ0P+K6hbX7Z3Rg
 p98hyOZTK2kN9s6Hp1GPjZkpLf45Nc5wQy0EKqTf/lP5utUULCQT9j+azhjZqcIPNpuxbP0pE
 xJPKjk6+21iW5CCMyMPn0f6uFXP8MiLUcPNbtVqza9fkpufXn6zQzGnA1w/dOZunLUbVQ8TPF
 5+O+nSXsQ64g3zEDmiP9BOBG0lEkf9gHF8zo9lSU8dvS3WJgYVdbwyXtZcaU8hKUgRbGd70ps
 hHHuxoVy6y3Eg7vXrLOmTFZTLVp62kk3Wjq4/2K6ya5siDWKJkJOF63NYZMbQv3d/atQB+T6Y
 AEfOZ8TEQqvSUqj9gqrQ+XMgImjOM/ca/YqFy8uBHFjNncacGFSFEaUgBFo61LF0XqOsufAOH
 KUmwF3jJMGtHST/N7kMIDFIRz6E85JiHjINqgjNABD47n0RzeWFRwLmU2VyntFw97pwJz4MFc
 vaVRyJqPmgpOhuM0HIoopDMzHk13QKZliLqab7lvXzaDAkz+HGk8dL0MXZO2LK4FNpKFhlZ95
 MJbWIloSZz42wvd7eL5Ycv4L340wR5Fg29ZkAPkGePNNAUnXBP8H0i5oG1s2KRMAPU02AFcR3
 Q90hJktmwMiLyXT2qUwVLaY7rWQ59OH86EwZj5N1rySrqwZY8ijLffRI8JlsOc8CK/LGuF+JE
 +oYk/ENuCxTmLjC+W/Sh5XwPTmhhdkg1IT+b0fOUR8uRSM4B1EhfT/AATLxrsSR9t5gwXMRY5
 7cNPyeDxYzMAm9NhapNLodcXtozLaoefiy6JMZ7Jw/T0KXtXCz1V0nip/WBn1IkixYD72Bjel
 d9bEb4yP355kkKA77ZorSAsh1C7eAoVuWzn6RsRb+i9Lj53hM2l1coCe+124IaFEd5TXSRL
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The regmap provides a convenient utility for this.
The hdmi_* and dpll_* register modification macros added for symmetry
with the existing operations (io_*, sdp_*).

Signed-off-by: Alexander Riesen <alexander.riesen@cetitec.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

--
v3: remove _update name in favor of existing _clrset
---
 drivers/media/i2c/adv748x/adv748x-core.c |  6 ++++++
 drivers/media/i2c/adv748x/adv748x.h      | 14 +++++++++++---
 2 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/adv748x/adv748x-core.c b/drivers/media/i2c/adv748x/adv748x-core.c
index 5c59aad319d1..8580e6624276 100644
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
index 09aab4138c3f..0a9d78c2870b 100644
--- a/drivers/media/i2c/adv748x/adv748x.h
+++ b/drivers/media/i2c/adv748x/adv748x.h
@@ -393,25 +393,33 @@ int adv748x_write(struct adv748x_state *state, u8 page, u8 reg, u8 value);
 int adv748x_write_block(struct adv748x_state *state, int client_page,
 			unsigned int init_reg, const void *val,
 			size_t val_len);
+int adv748x_update_bits(struct adv748x_state *state, u8 page, u8 reg,
+			u8 mask, u8 value);
 
 #define io_read(s, r) adv748x_read(s, ADV748X_PAGE_IO, r)
 #define io_write(s, r, v) adv748x_write(s, ADV748X_PAGE_IO, r, v)
-#define io_clrset(s, r, m, v) io_write(s, r, (io_read(s, r) & ~(m)) | (v))
+#define io_clrset(s, r, m, v) adv748x_update_bits(s, ADV748X_PAGE_IO, r, m, v)
 
 #define hdmi_read(s, r) adv748x_read(s, ADV748X_PAGE_HDMI, r)
 #define hdmi_read16(s, r, m) (((hdmi_read(s, r) << 8) | hdmi_read(s, (r)+1)) & (m))
 #define hdmi_write(s, r, v) adv748x_write(s, ADV748X_PAGE_HDMI, r, v)
+#define hdmi_clrset(s, r, m, v) \
+	adv748x_update_bits(s, ADV748X_PAGE_HDMI, r, m, v)
+
+#define dpll_read(s, r) adv748x_read(s, ADV748X_PAGE_DPLL, r)
+#define dpll_clrset(s, r, m, v) \
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


