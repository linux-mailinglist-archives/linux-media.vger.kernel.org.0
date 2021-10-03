Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E24E41FEE1
	for <lists+linux-media@lfdr.de>; Sun,  3 Oct 2021 02:13:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234309AbhJCAPQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 2 Oct 2021 20:15:16 -0400
Received: from wrqvnhvw.outbound-mail.sendgrid.net ([149.72.32.137]:11572 "EHLO
        wrqvnhvw.outbound-mail.sendgrid.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233697AbhJCAPQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 2 Oct 2021 20:15:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cottsay.net;
        h=from:subject:in-reply-to:references:mime-version:to:cc:
        content-transfer-encoding:content-type;
        s=s1; bh=LpP8wk4laekFSa7aKJ0z2VfwCi2feFKel84rpmp0qV4=;
        b=USif4zEmvLnhkMTEu49+bKhat872hNIno1Nn5XDfTaDU+vjzqnD93ww1+yoW+scLUZJC
        Yc7KKdcgD2GJMdwYq7yAd7iGmca+uqp10U3tFnGcsN6lcxZx97gbai46Wpu54ADCMWZeMr
        X48xh9fDdyPS6x5eo25JCy8rNwa1LPtThNtMEYPdoPZRgtSmceApsl3nTaMX0Ho8Hkf2+x
        9JO5jAozECZD2Hqri2XckcoIAopyw6XdNufHUiYJ19xAOXZPJNn18DUDlg639y1cYG5spb
        YzLyhKHHhRzT0uXX8zpqM3+tyCao04XVJXdOJaSzgd6Iac4IiDc4PKAbEU2tuguQ==
Received: by filterdrecv-64fcb979b9-stcmh with SMTP id filterdrecv-64fcb979b9-stcmh-1-6158F47A-23
        2021-10-03 00:08:26.809286527 +0000 UTC m=+1642246.153692030
Received: from cottsay-server.delphi.cottsay.net (unknown)
        by ismtpd0049p1las1.sendgrid.net (SG) with ESMTP
        id vX_a12BUQz6nyux4UgMd7A
        Sun, 03 Oct 2021 00:08:26.647 +0000 (UTC)
Received: from cottsay-lenovo.delphi.cottsay.net (cottsay-lenovo.delphi.cottsay.net [172.16.8.31])
        by cottsay-server.delphi.cottsay.net (Postfix) with ESMTPSA id 1341B3C00D6;
        Sat,  2 Oct 2021 17:08:26 -0700 (PDT)
From:   Scott K Logan <logans@cottsay.net>
Subject: [PATCH 1/1] media: saa7134: Add support for Leadtek WinFast HDTV200 H
Date:   Sun, 03 Oct 2021 00:08:26 +0000 (UTC)
Message-Id: <20211003000644.734529-2-logans@cottsay.net>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211003000644.734529-1-logans@cottsay.net>
References: <20211003000644.734529-1-logans@cottsay.net>
MIME-Version: 1.0
X-SG-EID: =?us-ascii?Q?v4Qh49l2kwszIc8ZaCpP76AQaq=2F9O0v3P=2FmBhAlry1T=2FzVhHBJ8w+hDrqxBvdA?=
 =?us-ascii?Q?KU3ehgFPlGwC1hR8j2nf+OmOM56FjGF57E1GhEo?=
 =?us-ascii?Q?+1ZOuqV9UKlswY4jzO=2FoG4PGnVUe1kYaTmcYoLX?=
 =?us-ascii?Q?Dz2CzQcLd4omCGIPFQWBlcy=2F39omh1v5oEMQrU7?=
 =?us-ascii?Q?L4innOqvSI0g1WGhdQVRg+hvoQ9npXwinFprSvm?=
 =?us-ascii?Q?AWUeGfvUoyplRIivAW82+hSfnzIa52Eyd4d6ds?=
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-media@vger.kernel.org
Cc:     Scott K Logan <logans@cottsay.net>
X-Entity-ID: 4JzoG0JXdcXknftrbeCa4w==
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=us-ascii
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Similar configuration to Kworld PC150-U.

Tested: Composite, S-Video, NTSC, ATSC
Unsupported: IR remote

Signed-off-by: Scott K Logan <logans@cottsay.net>
---
 drivers/media/pci/saa7134/saa7134-cards.c | 53 +++++++++++++++++++++++
 drivers/media/pci/saa7134/saa7134-dvb.c   | 29 +++++++++++++
 drivers/media/pci/saa7134/saa7134.h       |  1 +
 3 files changed, 83 insertions(+)

diff --git a/drivers/media/pci/saa7134/saa7134-cards.c b/drivers/media/pci/saa7134/saa7134-cards.c
index ce449c941171..0d82a4b27d5b 100644
--- a/drivers/media/pci/saa7134/saa7134-cards.c
+++ b/drivers/media/pci/saa7134/saa7134-cards.c
@@ -5765,6 +5765,33 @@ struct saa7134_board saa7134_boards[] = {
 			.gpio = 0x0200000,
 		},
 	},
+	[SAA7134_BOARD_LEADTEK_WINFAST_HDTV200_H] = {
+		.name           = "Leadtek Winfast HDTV200 H",
+		.audio_clock    = 0x00187de7,
+		.tuner_type     = TUNER_PHILIPS_TDA8290,
+		.radio_type     = UNSET,
+		.tuner_addr     = ADDR_UNSET,
+		.radio_addr     = ADDR_UNSET,
+		.mpeg           = SAA7134_MPEG_DVB,
+		.ts_type        = SAA7134_MPEG_TS_PARALLEL,
+		.gpiomask       = 0x00200700,
+		.inputs         = { {
+			.type = SAA7134_INPUT_TV,
+			.vmux = 1,
+			.amux = TV,
+			.gpio = 0x00000300,
+		}, {
+			.type = SAA7134_INPUT_COMPOSITE,
+			.vmux = 3,
+			.amux = LINE1,
+			.gpio = 0x00200300,
+		}, {
+			.type = SAA7134_INPUT_SVIDEO,
+			.vmux = 8,
+			.amux = LINE1,
+			.gpio = 0x00200300,
+		} },
+	},
 };
 
 const unsigned int saa7134_bcount = ARRAY_SIZE(saa7134_boards);
@@ -7040,6 +7067,12 @@ struct pci_device_id saa7134_pci_tbl[] = {
 		.subvendor    = 0x1779, /* V One Multimedia PTE Ltd */
 		.subdevice    = 0x13cf,
 		.driver_data  = SAA7134_BOARD_SNAZIO_TVPVR_PRO,
+	}, {
+		.vendor       = PCI_VENDOR_ID_PHILIPS,
+		.device       = PCI_DEVICE_ID_PHILIPS_SAA7133,
+		.subvendor    = 0x107d,
+		.subdevice    = 0x6f2e,
+		.driver_data  = SAA7134_BOARD_LEADTEK_WINFAST_HDTV200_H,
 	}, {
 		/* --- boards without eeprom + subsystem ID --- */
 		.vendor       = PCI_VENDOR_ID_PHILIPS,
@@ -7245,6 +7278,22 @@ static int saa7134_kworld_pc150u_toggle_agc(struct saa7134_dev *dev,
 	return 0;
 }
 
+static int saa7134_leadtek_hdtv200h_toggle_agc(struct saa7134_dev *dev,
+					       enum tda18271_mode mode)
+{
+	switch (mode) {
+	case TDA18271_ANALOG:
+		saa7134_set_gpio(dev, 10, 0);
+		break;
+	case TDA18271_DIGITAL:
+		saa7134_set_gpio(dev, 10, 1);
+		break;
+	default:
+		return -EINVAL;
+	}
+	return 0;
+}
+
 static int saa7134_tda8290_18271_callback(struct saa7134_dev *dev,
 					  int command, int arg)
 {
@@ -7264,6 +7313,9 @@ static int saa7134_tda8290_18271_callback(struct saa7134_dev *dev,
 		case SAA7134_BOARD_KWORLD_PC150U:
 			ret = saa7134_kworld_pc150u_toggle_agc(dev, arg);
 			break;
+		case SAA7134_BOARD_LEADTEK_WINFAST_HDTV200_H:
+			ret = saa7134_leadtek_hdtv200h_toggle_agc(dev, arg);
+			break;
 		default:
 			break;
 		}
@@ -7287,6 +7339,7 @@ static int saa7134_tda8290_callback(struct saa7134_dev *dev,
 	case SAA7134_BOARD_KWORLD_PCI_SBTVD_FULLSEG:
 	case SAA7134_BOARD_KWORLD_PC150U:
 	case SAA7134_BOARD_MAGICPRO_PROHDTV_PRO2:
+	case SAA7134_BOARD_LEADTEK_WINFAST_HDTV200_H:
 		/* tda8290 + tda18271 */
 		ret = saa7134_tda8290_18271_callback(dev, command, arg);
 		break;
diff --git a/drivers/media/pci/saa7134/saa7134-dvb.c b/drivers/media/pci/saa7134/saa7134-dvb.c
index f359cd5c006a..41950e424660 100644
--- a/drivers/media/pci/saa7134/saa7134-dvb.c
+++ b/drivers/media/pci/saa7134/saa7134-dvb.c
@@ -1189,6 +1189,22 @@ static struct s5h1411_config kworld_s5h1411_config = {
 		S5H1411_MPEGTIMING_CONTINUOUS_NONINVERTING_CLOCK,
 };
 
+static struct tda18271_config hdtv200h_tda18271_config = {
+	.gate    = TDA18271_GATE_ANALOG,
+	.config  = 3	/* Use tuner callback for AGC */
+};
+
+static struct s5h1411_config hdtv200h_s5h1411_config = {
+	.output_mode   = S5H1411_PARALLEL_OUTPUT,
+	.gpio          = S5H1411_GPIO_OFF,
+	.qam_if        = S5H1411_IF_4000,
+	.vsb_if        = S5H1411_IF_3250,
+	.inversion     = S5H1411_INVERSION_ON,
+	.status_mode   = S5H1411_DEMODLOCKING,
+	.mpeg_timing   =
+		S5H1411_MPEGTIMING_CONTINUOUS_NONINVERTING_CLOCK,
+};
+
 
 /* ==================================================================
  * Core code
@@ -1854,6 +1870,19 @@ static int dvb_init(struct saa7134_dev *dev)
 					__func__);
 		}
 		break;
+	case SAA7134_BOARD_LEADTEK_WINFAST_HDTV200_H:
+		fe0->dvb.frontend = dvb_attach(s5h1411_attach,
+					       &hdtv200h_s5h1411_config,
+					       &dev->i2c_adap);
+		if (fe0->dvb.frontend != NULL) {
+			dvb_attach(tda829x_attach, fe0->dvb.frontend,
+				   &dev->i2c_adap, 0x4b,
+				   &tda829x_no_probe);
+			dvb_attach(tda18271_attach, fe0->dvb.frontend,
+				   0x60, &dev->i2c_adap,
+				   &hdtv200h_tda18271_config);
+		}
+		break;
 	default:
 		pr_warn("Huh? unknown DVB card?\n");
 		break;
diff --git a/drivers/media/pci/saa7134/saa7134.h b/drivers/media/pci/saa7134/saa7134.h
index d29499cd7370..49fe0f6bacba 100644
--- a/drivers/media/pci/saa7134/saa7134.h
+++ b/drivers/media/pci/saa7134/saa7134.h
@@ -328,6 +328,7 @@ struct saa7134_card_ir {
 #define SAA7134_BOARD_AVERMEDIA_505         194
 #define SAA7134_BOARD_LEADTEK_WINFAST_TV2100_FM 195
 #define SAA7134_BOARD_SNAZIO_TVPVR_PRO      196
+#define SAA7134_BOARD_LEADTEK_WINFAST_HDTV200_H 197
 
 #define SAA7134_MAXBOARDS 32
 #define SAA7134_INPUT_MAX 8
-- 
2.31.1

