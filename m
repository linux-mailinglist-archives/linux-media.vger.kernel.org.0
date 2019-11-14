Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8D5C2FCF13
	for <lists+linux-media@lfdr.de>; Thu, 14 Nov 2019 21:04:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726881AbfKNUEX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Nov 2019 15:04:23 -0500
Received: from egyptian.birch.relay.mailchannels.net ([23.83.209.56]:11645
        "EHLO egyptian.birch.relay.mailchannels.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726755AbfKNUEX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Nov 2019 15:04:23 -0500
X-Sender-Id: dreamhost|x-authsender|brad@nextdimension.ws
Received: from relay.mailchannels.net (localhost [127.0.0.1])
        by relay.mailchannels.net (Postfix) with ESMTP id CBD335017C3;
        Thu, 14 Nov 2019 20:04:21 +0000 (UTC)
Received: from pdx1-sub0-mail-a96.g.dreamhost.com (100-96-14-250.trex.outbound.svc.cluster.local [100.96.14.250])
        (Authenticated sender: dreamhost)
        by relay.mailchannels.net (Postfix) with ESMTPA id 31046501357;
        Thu, 14 Nov 2019 20:04:21 +0000 (UTC)
X-Sender-Id: dreamhost|x-authsender|brad@nextdimension.ws
Received: from pdx1-sub0-mail-a96.g.dreamhost.com ([TEMPUNAVAIL].
 [64.90.62.162])
        (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384)
        by 0.0.0.0:2500 (trex/5.18.5);
        Thu, 14 Nov 2019 20:04:21 +0000
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|brad@nextdimension.ws
X-MailChannels-Auth-Id: dreamhost
X-Skirt-Abiding: 64c9c0b201c28dba_1573761861638_1702946322
X-MC-Loop-Signature: 1573761861638:3064973055
X-MC-Ingress-Time: 1573761861638
Received: from pdx1-sub0-mail-a96.g.dreamhost.com (localhost [127.0.0.1])
        by pdx1-sub0-mail-a96.g.dreamhost.com (Postfix) with ESMTP id DBD8B8260E;
        Thu, 14 Nov 2019 12:04:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=nextdimension.cc; h=from
        :to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=nextdimension.cc; bh=
        y4TkIV2pyQCTfs4f1qsaZwo5BQY=; b=uXYPsmifZOsNU4mL1TTv4cOkHpfb+4ED
        u5cZ5M1BEgGBlexvLI9xFBggSHGn1TNnpFOmjsSCvTUIfIU5zZ9vGe9COi+r1xuf
        BqukrRXLcgBoh1ESS5uvaunZFt5LxEN+tewwpua2vcxBskFJUhos1UT1Yzw5+kpA
        5FvBrSkLToA=
Received: from localhost.localdomain (67-198-57-188.static.grandenetworks.net [67.198.57.188])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: brad@nextdimension.ws)
        by pdx1-sub0-mail-a96.g.dreamhost.com (Postfix) with ESMTPSA id 808778260D;
        Thu, 14 Nov 2019 12:04:19 -0800 (PST)
X-DH-BACKEND: pdx1-sub0-mail-a96
From:   Brad Love <brad@nextdimension.cc>
To:     linux-media@vger.kernel.org
Cc:     Brad Love <brad@nextdimension.cc>
Subject: [PATCH v3 07/14] cx23885: Add analog frontend to Hauppauge QuadHD
Date:   Thu, 14 Nov 2019 14:04:01 -0600
Message-Id: <20191114200408.28883-8-brad@nextdimension.cc>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191114200408.28883-1-brad@nextdimension.cc>
References: <20191114200408.28883-1-brad@nextdimension.cc>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add analog tuner frontend to 888 Hauppauge QuadHD boards

Signed-off-by: Brad Love <brad@nextdimension.cc>
---
Since v2:
- Remove force_bff from ATSC QuadHD

 drivers/media/pci/cx23885/cx23885-cards.c | 31 ++++++++++++++++++++---
 drivers/media/pci/cx23885/cx23885-dvb.c   | 20 +++++++++++++++
 drivers/media/pci/cx23885/cx23885-video.c |  8 +++++-
 3 files changed, 54 insertions(+), 5 deletions(-)

diff --git a/drivers/media/pci/cx23885/cx23885-cards.c b/drivers/media/pc=
i/cx23885/cx23885-cards.c
index 8644205d3cd3..95c9c7f74ba8 100644
--- a/drivers/media/pci/cx23885/cx23885-cards.c
+++ b/drivers/media/pci/cx23885/cx23885-cards.c
@@ -757,24 +757,47 @@ struct cx23885_board cx23885_boards[] =3D {
 		} },
 	},
 	[CX23885_BOARD_HAUPPAUGE_QUADHD_DVB] =3D {
-		.name        =3D "Hauppauge WinTV-QuadHD-DVB",
+		.name         =3D "Hauppauge WinTV-QuadHD-DVB",
+		.porta        =3D CX23885_ANALOG_VIDEO,
 		.portb        =3D CX23885_MPEG_DVB,
 		.portc        =3D CX23885_MPEG_DVB,
+		.tuner_type	=3D TUNER_ABSENT,
+		.force_bff	=3D 1,
+		.input          =3D {{
+			.type   =3D CX23885_VMUX_TELEVISION,
+			.vmux   =3D	CX25840_VIN7_CH3 |
+					CX25840_VIN5_CH2 |
+					CX25840_VIN2_CH1 |
+					CX25840_DIF_ON,
+			.amux   =3D CX25840_AUDIO8,
+		} },
 	},
 	[CX23885_BOARD_HAUPPAUGE_QUADHD_DVB_885] =3D {
-		.name       =3D "Hauppauge WinTV-QuadHD-DVB(885)",
+		.name         =3D "Hauppauge WinTV-QuadHD-DVB(885)",
 		.portb        =3D CX23885_MPEG_DVB,
 		.portc        =3D CX23885_MPEG_DVB,
+		.tuner_type   =3D TUNER_ABSENT,
 	},
 	[CX23885_BOARD_HAUPPAUGE_QUADHD_ATSC] =3D {
-		.name        =3D "Hauppauge WinTV-QuadHD-ATSC",
+		.name         =3D "Hauppauge WinTV-QuadHD-ATSC",
+		.porta        =3D CX23885_ANALOG_VIDEO,
 		.portb        =3D CX23885_MPEG_DVB,
 		.portc        =3D CX23885_MPEG_DVB,
+		.tuner_type	=3D TUNER_ABSENT,
+		.input          =3D {{
+			.type   =3D CX23885_VMUX_TELEVISION,
+			.vmux   =3D	CX25840_VIN7_CH3 |
+					CX25840_VIN5_CH2 |
+					CX25840_VIN2_CH1 |
+					CX25840_DIF_ON,
+			.amux   =3D CX25840_AUDIO8,
+		} },
 	},
 	[CX23885_BOARD_HAUPPAUGE_QUADHD_ATSC_885] =3D {
-		.name       =3D "Hauppauge WinTV-QuadHD-ATSC(885)",
+		.name         =3D "Hauppauge WinTV-QuadHD-ATSC(885)",
 		.portb        =3D CX23885_MPEG_DVB,
 		.portc        =3D CX23885_MPEG_DVB,
+		.tuner_type   =3D TUNER_ABSENT,
 	},
 	[CX23885_BOARD_HAUPPAUGE_HVR1265_K4] =3D {
 		.name		=3D "Hauppauge WinTV-HVR-1265(161111)",
diff --git a/drivers/media/pci/cx23885/cx23885-dvb.c b/drivers/media/pci/=
cx23885/cx23885-dvb.c
index 4f386db33a11..590af4656828 100644
--- a/drivers/media/pci/cx23885/cx23885-dvb.c
+++ b/drivers/media/pci/cx23885/cx23885-dvb.c
@@ -2373,6 +2373,16 @@ static int dvb_register(struct cx23885_tsport *por=
t)
 				goto frontend_detach;
 			}
 			port->i2c_client_tuner =3D client_tuner;
+
+			/* we only attach tuner for analog on the 888 version */
+			if (dev->board =3D=3D CX23885_BOARD_HAUPPAUGE_QUADHD_DVB) {
+				pr_info("%s(): QUADHD_DVB analog setup\n",
+					__func__);
+				dev->ts1.analog_fe.tuner_priv =3D client_tuner;
+				memcpy(&dev->ts1.analog_fe.ops.tuner_ops,
+				       &fe0->dvb.frontend->ops.tuner_ops,
+				       sizeof(struct dvb_tuner_ops));
+			}
 			break;
=20
 		/* port c - terrestrial/cable */
@@ -2462,6 +2472,16 @@ static int dvb_register(struct cx23885_tsport *por=
t)
 				goto frontend_detach;
 			}
 			port->i2c_client_tuner =3D client_tuner;
+
+			/* we only attach tuner for analog on the 888 version */
+			if (dev->board =3D=3D CX23885_BOARD_HAUPPAUGE_QUADHD_ATSC) {
+				pr_info("%s(): QUADHD_ATSC analog setup\n",
+					__func__);
+				dev->ts1.analog_fe.tuner_priv =3D client_tuner;
+				memcpy(&dev->ts1.analog_fe.ops.tuner_ops,
+				       &fe0->dvb.frontend->ops.tuner_ops,
+				       sizeof(struct dvb_tuner_ops));
+			}
 			break;
=20
 		/* port c - terrestrial/cable */
diff --git a/drivers/media/pci/cx23885/cx23885-video.c b/drivers/media/pc=
i/cx23885/cx23885-video.c
index 8098b15493de..3331d6833769 100644
--- a/drivers/media/pci/cx23885/cx23885-video.c
+++ b/drivers/media/pci/cx23885/cx23885-video.c
@@ -253,6 +253,8 @@ static int cx23885_video_mux(struct cx23885_dev *dev,=
 unsigned int input)
 		(dev->board =3D=3D CX23885_BOARD_HAUPPAUGE_HVR1255) ||
 		(dev->board =3D=3D CX23885_BOARD_HAUPPAUGE_HVR1255_22111) ||
 		(dev->board =3D=3D CX23885_BOARD_HAUPPAUGE_HVR1265_K4) ||
+		(dev->board =3D=3D CX23885_BOARD_HAUPPAUGE_QUADHD_ATSC) ||
+		(dev->board =3D=3D CX23885_BOARD_HAUPPAUGE_QUADHD_DVB) ||
 		(dev->board =3D=3D CX23885_BOARD_HAUPPAUGE_HVR1850) ||
 		(dev->board =3D=3D CX23885_BOARD_MYGICA_X8507) ||
 		(dev->board =3D=3D CX23885_BOARD_AVERMEDIA_HC81R) ||
@@ -995,7 +997,9 @@ static int cx23885_set_freq_via_ops(struct cx23885_de=
v *dev,
 	if ((dev->board =3D=3D CX23885_BOARD_HAUPPAUGE_HVR1850) ||
 	    (dev->board =3D=3D CX23885_BOARD_HAUPPAUGE_HVR1255) ||
 	    (dev->board =3D=3D CX23885_BOARD_HAUPPAUGE_HVR1255_22111) ||
-	    (dev->board =3D=3D CX23885_BOARD_HAUPPAUGE_HVR1265_K4))
+	    (dev->board =3D=3D CX23885_BOARD_HAUPPAUGE_HVR1265_K4) ||
+	    (dev->board =3D=3D CX23885_BOARD_HAUPPAUGE_QUADHD_DVB) ||
+	    (dev->board =3D=3D CX23885_BOARD_HAUPPAUGE_QUADHD_ATSC))
 		fe =3D &dev->ts1.analog_fe;
=20
 	if (fe && fe->ops.tuner_ops.set_analog_params) {
@@ -1026,6 +1030,8 @@ int cx23885_set_frequency(struct file *file, void *=
priv,
 	case CX23885_BOARD_HAUPPAUGE_HVR1255_22111:
 	case CX23885_BOARD_HAUPPAUGE_HVR1265_K4:
 	case CX23885_BOARD_HAUPPAUGE_HVR1850:
+	case CX23885_BOARD_HAUPPAUGE_QUADHD_DVB:
+	case CX23885_BOARD_HAUPPAUGE_QUADHD_ATSC:
 		ret =3D cx23885_set_freq_via_ops(dev, f);
 		break;
 	default:
--=20
2.23.0

