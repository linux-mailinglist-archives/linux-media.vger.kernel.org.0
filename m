Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DBEE218BE6B
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2020 18:42:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728637AbgCSRmV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Mar 2020 13:42:21 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:54921 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727034AbgCSRmT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Mar 2020 13:42:19 -0400
Received: from mail.cetitecgmbh.com ([87.190.42.90]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MdNHa-1jo2sj1L96-00ZRRu; Thu, 19 Mar 2020 18:42:01 +0100
Received: from pflvmailgateway.corp.cetitec.com (unknown [127.0.0.1])
        by mail.cetitecgmbh.com (Postfix) with ESMTP id E9A1C65021B;
        Thu, 19 Mar 2020 17:42:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at cetitec.com
Received: from mail.cetitecgmbh.com ([127.0.0.1])
        by pflvmailgateway.corp.cetitec.com (pflvmailgateway.corp.cetitec.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 8esBAehby7dE; Thu, 19 Mar 2020 18:42:00 +0100 (CET)
Received: from pfwsexchange.corp.cetitec.com (unknown [10.10.1.99])
        by mail.cetitecgmbh.com (Postfix) with ESMTPS id 8689A64C8E4;
        Thu, 19 Mar 2020 18:42:00 +0100 (CET)
Received: from pflmari.corp.cetitec.com (10.8.5.52) by
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Thu, 19 Mar 2020 18:42:00 +0100
Received: by pflmari.corp.cetitec.com (Postfix, from userid 1000)
        id E2EBF8050C; Thu, 19 Mar 2020 18:41:59 +0100 (CET)
Date:   Thu, 19 Mar 2020 18:41:59 +0100
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
Subject: [PATCH v2 04/10] media: adv748x: add definitions for audio output
 related registers
Message-ID: <d4e559cfedc57c8f3364fbe9ac29e2b50e2e4095.1584639664.git.alexander.riesen@cetitec.com>
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
X-Provags-ID: V03:K1:Vo2K/VTMWkVdhVMtQeeghLxtti+GBh6O4hQNukVvpokfadoHVTp
 tuP0189+9O2UgdrJciVhWaGC+vxjxxDNytLpolbUOn2Hy0+LULvCfW6TxcRhwv2Qd3/GT+O
 uHBHNWbY0cG8Zaag4orBKqhprPq9+gGO4WzxmcEUsWIhKJXI1/rsn1u/lRiYFEgO51rRLMH
 FrEnl8xbB9k41JdgSwX/w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:1vv3pqTA6GE=:VZsglhE509dfDsP0MfGu89
 zkdQf3UsyVEutDa0us3kySvAb/DEMcbWhuxdzvNuQ/qiMcPUxJ0zvG0FjcJY00fi050cum63u
 Ip8djaE28Eq6zmKYAQAorvIhy9SAaCFaFotlWHR0givUzb8ti5rKQ2CYrOP3gDKMyRtecpCw2
 nCvLHBjO8Dj/ysYHyKLYnlFXilKPY2tLkMDlynTISKndrDDslcx499f7XvWPATTWBUFUhqJK7
 NQnOfXHoQTuiolNsbQ7wEYwfy/OHcReAdzkIC1NCEy6sOEg3XquklkflFFEZfKto1dJ97q/ds
 wM4EXUTDBmdmUBv7yBFN3uR1kPHib8247OvPPlsW5WvJ87WbbokKsg70TxJdddMtGi7rWV9Kk
 RhLb1JCqK2Bs19wLMkCaM4cJ7KH+k739rgMHaTYfaNqboEc0dcE3J/vgD0tN+Rsqq6hGc65/5
 DHai2bKEnmCXzZk7OIlO5/NZWlUbVjxCC9Nf+XpgllGVim3JlusKa0rI0RGEzUb6c88CdsSDY
 fKO/ZY4zEoWPDT+Dwi2siZGOmqdCGABDYGF/TXMSZveHoD7M6AeHf5bTBkYqvlgU25zCbH3ag
 KfsGwVCb1mNFBOhe2syIf+oP0fg1YN5Zdubc7kJNHIetQHnSfGqNWJjcrdSJcQNMaknR7KRCO
 1s5azany6QSAL0fEil6R9U/6ylOGR5HbRQJ+k2lx3kNIYY3zWmgQ4gnFg+M3Tk7n2FOFFrsGs
 KYAas9pQhR7TygyTFnAXMQk9CxoICkZl6Bxfwilr6vS4WW7f2GlPXnpZao5YHuFLReLW4/AZU
 OtYtWQ2va4Q71MRpqXUFeve1ckAXGdRXZ1Uj5hiqk9JcGnL6BAXaN9kflHOUAywqgvQE1m/
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Signed-off-by: Alexander Riesen <alexander.riesen@cetitec.com>
---
 drivers/media/i2c/adv748x/adv748x.h | 32 +++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/media/i2c/adv748x/adv748x.h b/drivers/media/i2c/adv748x/adv748x.h
index c5245464fffc..7bc1bb0b3756 100644
--- a/drivers/media/i2c/adv748x/adv748x.h
+++ b/drivers/media/i2c/adv748x/adv748x.h
@@ -226,6 +226,11 @@ struct adv748x_state {
 
 #define ADV748X_IO_VID_STD		0x05
 
+#define ADV748X_IO_PAD_CONTROLS		0x0e
+#define ADV748X_IO_PAD_CONTROLS_TRI_AUD	BIT(5)
+#define ADV748X_IO_PAD_CONTROLS_PDN_AUD	BIT(1)
+#define ADV748X_IO_PAD_CONTROLS1	0x1d
+
 #define ADV748X_IO_10			0x10	/* io_reg_10 */
 #define ADV748X_IO_10_CSI4_EN		BIT(7)
 #define ADV748X_IO_10_CSI1_EN		BIT(6)
@@ -248,7 +253,21 @@ struct adv748x_state {
 #define ADV748X_IO_REG_FF		0xff
 #define ADV748X_IO_REG_FF_MAIN_RESET	0xff
 
+/* DPLL Map */
+#define ADV748X_DPLL_MCLK_FS		0xb5
+#define ADV748X_DPLL_MCLK_FS_N_MASK	GENMASK(2, 0)
+
 /* HDMI RX Map */
+#define ADV748X_HDMI_I2S		0x03	/* I2S mode and width */
+#define ADV748X_HDMI_I2SBITWIDTH_MASK	GENMASK(4, 0)
+#define ADV748X_HDMI_I2SOUTMODE_SHIFT	5
+#define ADV748X_HDMI_I2SOUTMODE_MASK	\
+	GENMASK(6, ADV748X_HDMI_I2SOUTMODE_SHIFT)
+#define ADV748X_I2SOUTMODE_I2S 0
+#define ADV748X_I2SOUTMODE_RIGHT_J 1
+#define ADV748X_I2SOUTMODE_LEFT_J 2
+#define ADV748X_I2SOUTMODE_SPDIF 3
+
 #define ADV748X_HDMI_LW1		0x07	/* line width_1 */
 #define ADV748X_HDMI_LW1_VERT_FILTER	BIT(7)
 #define ADV748X_HDMI_LW1_DE_REGEN	BIT(5)
@@ -260,6 +279,16 @@ struct adv748x_state {
 #define ADV748X_HDMI_F1H1		0x0b	/* field1 height_1 */
 #define ADV748X_HDMI_F1H1_INTERLACED	BIT(5)
 
+#define ADV748X_HDMI_MUTE_CTRL		0x1a
+#define ADV748X_HDMI_MUTE_CTRL_MUTE_AUDIO BIT(4)
+#define ADV748X_HDMI_MUTE_CTRL_WAIT_UNMUTE_MASK	GENMASK(3, 1)
+#define ADV748X_HDMI_MUTE_CTRL_NOT_AUTO_UNMUTE	BIT(0)
+
+#define ADV748X_HDMI_AUDIO_MUTE_SPEED	0x0f
+#define ADV748X_HDMI_AUDIO_MUTE_SPEED_MASK	GENMASK(4, 0)
+#define ADV748X_MAN_AUDIO_DL_BYPASS BIT(7)
+#define ADV748X_AUDIO_DELAY_LINE_BYPASS BIT(6)
+
 #define ADV748X_HDMI_HFRONT_PORCH	0x20	/* hsync_front_porch_1 */
 #define ADV748X_HDMI_HFRONT_PORCH_MASK	0x1fff
 
@@ -281,6 +310,9 @@ struct adv748x_state {
 #define ADV748X_HDMI_TMDS_1		0x51	/* hdmi_reg_51 */
 #define ADV748X_HDMI_TMDS_2		0x52	/* hdmi_reg_52 */
 
+#define ADV748X_HDMI_REG_6D		0x6d	/* hdmi_reg_6d */
+#define ADV748X_I2S_TDM_MODE_ENABLE BIT(7)
+
 /* HDMI RX Repeater Map */
 #define ADV748X_REPEATER_EDID_SZ	0x70	/* primary_edid_size */
 #define ADV748X_REPEATER_EDID_SZ_SHIFT	4
-- 
2.25.1.25.g9ecbe7eb18


