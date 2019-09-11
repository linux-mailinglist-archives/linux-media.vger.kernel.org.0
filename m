Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 937CEB0330
	for <lists+linux-media@lfdr.de>; Wed, 11 Sep 2019 19:57:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729817AbfIKR5M (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Sep 2019 13:57:12 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:44109 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729675AbfIKR5M (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Sep 2019 13:57:12 -0400
Received: by mail-wr1-f65.google.com with SMTP id k6so13450339wrn.11
        for <linux-media@vger.kernel.org>; Wed, 11 Sep 2019 10:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2XFKGbRuzuAun/n0YzYs2TPQyNPWwk2EqCWy97FLIR8=;
        b=cVOt96pQhMH5O+NdbpfyC8t6tumPQzB9Emn32nY01mRs1xE+4Rnh8aqLhYmEqzEWhJ
         g0ggkMpBI/qBZUyajest1SXYv5akclNkj9v8Wqrbnc48MFsnaAoVzdwENg+ha6w7Uo1m
         3OeaAHqClSRzvuvsc9wyBEQCv8wJULCr+P/7KeGUL/kx2GAIDuqqDzyVCVHI+FW6eTi7
         t1iIeyzYD3KsarR+QuFmBFyEFUYb7aagWYx9Qgyz3UmWhLWgbMn7nMJgqqjx5Bg5xJNW
         IYNZHb5YBRamJ6vJ21PKK1sAR4rhcWdJMAEmlkKF1VZE3xPDW4WJEAPMD0MkGBEJdb4m
         4twA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2XFKGbRuzuAun/n0YzYs2TPQyNPWwk2EqCWy97FLIR8=;
        b=efsWNnFcg1dFjnBszAVF+3FttTKkeAo0U7awPeHrIZUIQzHhTd8KT+G4i8GSOOnjOQ
         tb23YO/PA/OZYEhEUk6UsvAoRmTKOZ0n/LSJKt1Fa0OBKB4+KFEI3EpEAt81m9tP/PIs
         HgHqRdAWUkbnFOhHrIQq71uahfFeyQ23xVlDS5xZfoQCUTCbNvDGUqP1LzcBa4VmdenC
         sBM6mb2Gb8OSJZtdj2Yym4RXvgYcw7QVJhfjCoyRtgHAybEKy4dJZIXsSPADoe3tmLjJ
         wxqmhidAk9SukbB51gAQoDf0Brj0GW6FbDQOOceZzzwEP2pgXPN3UUJPQc7rvOKSKniQ
         9gnw==
X-Gm-Message-State: APjAAAVDxhGgGAzSwTYD0aWRhxDIOzHaBuyBR+y0NpOTkfyjb5dk4/VS
        quWs5xLhaDu29OLd0CCCSzKUeeq/
X-Google-Smtp-Source: APXvYqxbnujWQ5xu9J8kTSfmRBeVWQri4x1PORkY0r+zpXUkXvjGqxa2JOjq1ieybfCK41vSGU4niA==
X-Received: by 2002:adf:f607:: with SMTP id t7mr30406703wrp.60.1568224629885;
        Wed, 11 Sep 2019 10:57:09 -0700 (PDT)
Received: from tool.localnet (180.151.117.91.dynamic.reverse-mundo-r.com. [91.117.151.180])
        by smtp.googlemail.com with ESMTPSA id o14sm12826625wrw.11.2019.09.11.10.57.08
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2019 10:57:09 -0700 (PDT)
From:   Daniel Gonzalez Cabanelas <dgcbueu@gmail.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH] media: cx88: Add support for NotOnlyTV LV3H card
Date:   Wed, 11 Sep 2019 19:57:06 +0200
Message-ID: <2015555.oeIbV09UUN@tool>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add support for the PCI hybrid card NotOnlyTV LV3H. This card consists of:
- A/V Controller: Conexant CX-23883
- Tuner: Xceive XC3028L
- DVB-T Decoder: Zarlink ZL10353

This patch adds support for DVB-T,  Analog TV, FM radio, composite and S-video inputs.
The IR input isn't supported.

Since the PCI subsystem ID (14f1:8852) is the same as the Geniatech X8000-MT, but they are
different boards, the card is only supported via insmod option: 
options cx88xx card=91

For the record this is the eeprom dump, useful if someone wanted to implement the card 
auto detection:

07 ff ff ff f1 14 52 88 04 04 32 55 f8 00 a2 02
a1 00 40 63 06 11 44 30 03 df 40 80 00 20 00 73
3c 10 00 00 00 00 ff ff ff ff ff ff ff ff ff ff
ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
ff ff ff ff ff ff ff ff ff ff ff ff ff ff a0 00

Signed-off-by: Daniel Gonzalez Cabanelas <dgcbueu@gmail.com>
---
 drivers/media/pci/cx88/cx88-cards.c | 43 +++++++++++++++++++++++++++++
 drivers/media/pci/cx88/cx88-dvb.c   |  1 +
 drivers/media/pci/cx88/cx88.h       |  1 +
 3 files changed, 45 insertions(+)

diff --git a/drivers/media/pci/cx88/cx88-cards.c b/drivers/media/pci/cx88/cx88-cards.c
index 3cd87626c..5a76bb760 100644
--- a/drivers/media/pci/cx88/cx88-cards.c
+++ b/drivers/media/pci/cx88/cx88-cards.c
@@ -1781,6 +1781,41 @@ static const struct cx88_board cx88_boards[] = {
 		},
 		.mpeg           = CX88_MPEG_DVB,
 	},
+	[CX88_BOARD_NOTONLYTV_LV3H] = {
+		.name           = "NotOnlyTV LV3H",
+		.tuner_type     = TUNER_XC2028,
+		.radio_type     = UNSET,
+		.tuner_addr     = 0x61,
+		.radio_addr     = ADDR_UNSET,
+		/* if gpio1:bit9 is enabled, DVB-T won't work */
+
+		.input          = { {
+			.type   = CX88_VMUX_TELEVISION,
+			.vmux   = 0,
+			.gpio0  = 0x0000,
+			.gpio1  = 0xa141,
+			.gpio2  = 0x0000,
+		}, {
+			.type   = CX88_VMUX_COMPOSITE1,
+			.vmux   = 1,
+			.gpio0  = 0x0000,
+			.gpio1  = 0xa161,
+			.gpio2  = 0x0000,
+		}, {
+			.type   = CX88_VMUX_SVIDEO,
+			.vmux   = 2,
+			.gpio0  = 0x0000,
+			.gpio1  = 0xa161,
+			.gpio2  = 0x0000,
+		} },
+		.radio = {
+			.type   = CX88_RADIO,
+			.gpio0  = 0x0000,
+			.gpio1  = 0xa141,
+			.gpio2  = 0x0000,
+		},
+		.mpeg           = CX88_MPEG_DVB,
+	},
 	[CX88_BOARD_DVICO_FUSIONHDTV_DVB_T_PRO] = {
 		.name           = "DViCO FusionHDTV DVB-T PRO",
 		.tuner_type     = TUNER_XC2028,
@@ -2654,6 +2689,7 @@ static const struct cx88_subid cx88_subids[] = {
 		.subdevice = 0x6f18,
 		.card      = CX88_BOARD_WINFAST_TV2000_XP_GLOBAL,
 	}, {
+		/* Also NotOnlyTV LV3H (version 1.11 is silkscreened on the board) */
 		.subvendor = 0x14f1,
 		.subdevice = 0x8852,
 		.card      = CX88_BOARD_GENIATECH_X8000_MT,
@@ -3121,6 +3157,7 @@ static int cx88_xc2028_tuner_callback(struct cx88_core *core,
 	case CX88_BOARD_DVICO_FUSIONHDTV_DVB_T_PRO:
 	case CX88_BOARD_DVICO_FUSIONHDTV_5_PCI_NANO:
 		return cx88_dvico_xc2028_callback(core, command, arg);
+	case CX88_BOARD_NOTONLYTV_LV3H:
 	case CX88_BOARD_WINFAST_TV2000_XP_GLOBAL:
 	case CX88_BOARD_WINFAST_DTV1800H:
 		return cx88_xc3028_winfast1800h_callback(core, command, arg);
@@ -3322,6 +3359,7 @@ static void cx88_card_setup_pre_i2c(struct cx88_core *core)
 		udelay(1000);
 		break;
 
+	case CX88_BOARD_NOTONLYTV_LV3H:
 	case CX88_BOARD_WINFAST_TV2000_XP_GLOBAL:
 	case CX88_BOARD_WINFAST_DTV1800H:
 		cx88_xc3028_winfast1800h_callback(core, XC2028_TUNER_RESET, 0);
@@ -3378,6 +3416,11 @@ void cx88_setup_xc3028(struct cx88_core *core, struct xc2028_ctrl *ctl)
 		 */
 		ctl->disable_power_mgmt = 1;
 		break;
+	case CX88_BOARD_NOTONLYTV_LV3H:
+		ctl->demod			= XC3028_FE_ZARLINK456;
+		ctl->fname			= XC3028L_DEFAULT_FIRMWARE;
+		ctl->read_not_reliable	= 1;
+		break;
 	case CX88_BOARD_WINFAST_TV2000_XP_GLOBAL:
 	case CX88_BOARD_PROLINK_PV_GLOBAL_XTREME:
 	case CX88_BOARD_PROLINK_PV_8000GT:
diff --git a/drivers/media/pci/cx88/cx88-dvb.c b/drivers/media/pci/cx88/cx88-dvb.c
index 0292d0947..202ff9e8c 100644
--- a/drivers/media/pci/cx88/cx88-dvb.c
+++ b/drivers/media/pci/cx88/cx88-dvb.c
@@ -1378,6 +1378,7 @@ static int dvb_register(struct cx8802_dev *dev)
 				fe->ops.tuner_ops.set_config(fe, &ctl);
 		}
 		break;
+	case CX88_BOARD_NOTONLYTV_LV3H:
 	case CX88_BOARD_PINNACLE_HYBRID_PCTV:
 	case CX88_BOARD_WINFAST_DTV1800H:
 		fe0->dvb.frontend = dvb_attach(zl10353_attach,
diff --git a/drivers/media/pci/cx88/cx88.h b/drivers/media/pci/cx88/cx88.h
index 744a22328..ce4acf6de 100644
--- a/drivers/media/pci/cx88/cx88.h
+++ b/drivers/media/pci/cx88/cx88.h
@@ -228,6 +228,7 @@ extern const struct sram_channel cx88_sram_channels[];
 #define CX88_BOARD_WINFAST_DTV1800H_XC4000 88
 #define CX88_BOARD_WINFAST_TV2000_XP_GLOBAL_6F36 89
 #define CX88_BOARD_WINFAST_TV2000_XP_GLOBAL_6F43 90
+#define CX88_BOARD_NOTONLYTV_LV3H          91
 
 enum cx88_itype {
 	CX88_VMUX_COMPOSITE1 = 1,
-- 
2.23.0




