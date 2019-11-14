Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7D984FCF17
	for <lists+linux-media@lfdr.de>; Thu, 14 Nov 2019 21:04:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726953AbfKNUE2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Nov 2019 15:04:28 -0500
Received: from egyptian.birch.relay.mailchannels.net ([23.83.209.56]:60117
        "EHLO egyptian.birch.relay.mailchannels.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726444AbfKNUE1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Nov 2019 15:04:27 -0500
X-Sender-Id: dreamhost|x-authsender|brad@nextdimension.ws
Received: from relay.mailchannels.net (localhost [127.0.0.1])
        by relay.mailchannels.net (Postfix) with ESMTP id C9DF0342118;
        Thu, 14 Nov 2019 20:04:26 +0000 (UTC)
Received: from pdx1-sub0-mail-a96.g.dreamhost.com (100-96-14-250.trex.outbound.svc.cluster.local [100.96.14.250])
        (Authenticated sender: dreamhost)
        by relay.mailchannels.net (Postfix) with ESMTPA id 58A53340B63;
        Thu, 14 Nov 2019 20:04:26 +0000 (UTC)
X-Sender-Id: dreamhost|x-authsender|brad@nextdimension.ws
Received: from pdx1-sub0-mail-a96.g.dreamhost.com ([TEMPUNAVAIL].
 [64.90.62.162])
        (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384)
        by 0.0.0.0:2500 (trex/5.18.5);
        Thu, 14 Nov 2019 20:04:26 +0000
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|brad@nextdimension.ws
X-MailChannels-Auth-Id: dreamhost
X-Interest-Trail: 4e7080820c0d9159_1573761866633_362322010
X-MC-Loop-Signature: 1573761866633:1041330929
X-MC-Ingress-Time: 1573761866633
Received: from pdx1-sub0-mail-a96.g.dreamhost.com (localhost [127.0.0.1])
        by pdx1-sub0-mail-a96.g.dreamhost.com (Postfix) with ESMTP id 17B7F82603;
        Thu, 14 Nov 2019 12:04:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=nextdimension.cc; h=from
        :to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=nextdimension.cc; bh=
        Ig54AeDbQyoEUfGraaflRtXX964=; b=a+Hty1ye5GGl+1fajIx1cm/WQ/JHteFm
        bv97Iq1+1RUyxk2rrBML2WgCRgnUxOvDmTcSI8e1wDAcIhsN50/W3ciic4b53M5x
        Emaf+sEqpvL1ZgIszGk+gpw3kEUG/QK3YnUDPSzIDz7pHEEieGG1m5V9VKcC7BzH
        DlLnER+v7qw=
Received: from localhost.localdomain (67-198-57-188.static.grandenetworks.net [67.198.57.188])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: brad@nextdimension.ws)
        by pdx1-sub0-mail-a96.g.dreamhost.com (Postfix) with ESMTPSA id A260C82601;
        Thu, 14 Nov 2019 12:04:20 -0800 (PST)
X-DH-BACKEND: pdx1-sub0-mail-a96
From:   Brad Love <brad@nextdimension.cc>
To:     linux-media@vger.kernel.org
Cc:     Brad Love <brad@nextdimension.cc>
Subject: [PATCH v3 09/14] cx23885: Add analog frontend to HVR5525
Date:   Thu, 14 Nov 2019 14:04:03 -0600
Message-Id: <20191114200408.28883-10-brad@nextdimension.cc>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191114200408.28883-1-brad@nextdimension.cc>
References: <20191114200408.28883-1-brad@nextdimension.cc>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Enables the analog tuning frontend for Hauppauge HVR-5525.

Signed-off-by: Brad Love <brad@nextdimension.cc>
---
No changes

 drivers/media/pci/cx23885/cx23885-cards.c | 12 ++++++++++++
 drivers/media/pci/cx23885/cx23885-dvb.c   |  6 ++++++
 drivers/media/pci/cx23885/cx23885-video.c |  3 +++
 3 files changed, 21 insertions(+)

diff --git a/drivers/media/pci/cx23885/cx23885-cards.c b/drivers/media/pc=
i/cx23885/cx23885-cards.c
index 916fa8987f8b..aa4b1150a860 100644
--- a/drivers/media/pci/cx23885/cx23885-cards.c
+++ b/drivers/media/pci/cx23885/cx23885-cards.c
@@ -703,8 +703,19 @@ struct cx23885_board cx23885_boards[] =3D {
 	},
 	[CX23885_BOARD_HAUPPAUGE_HVR5525] =3D {
 		.name		=3D "Hauppauge WinTV-HVR5525",
+		.porta		=3D CX23885_ANALOG_VIDEO,
 		.portb		=3D CX23885_MPEG_DVB,
 		.portc		=3D CX23885_MPEG_DVB,
+		.tuner_type	=3D TUNER_ABSENT,
+		.force_bff	=3D 1,
+		.input		=3D {{
+			.type	=3D CX23885_VMUX_TELEVISION,
+			.vmux	=3D	CX25840_VIN7_CH3 |
+					CX25840_VIN5_CH2 |
+					CX25840_VIN2_CH1 |
+					CX25840_DIF_ON,
+			.amux   =3D CX25840_AUDIO8,
+		} },
 	},
 	[CX23885_BOARD_VIEWCAST_260E] =3D {
 		.name		=3D "ViewCast 260e",
@@ -2356,6 +2367,7 @@ void cx23885_card_setup(struct cx23885_dev *dev)
 	case CX23885_BOARD_HAUPPAUGE_QUADHD_ATSC:
 	case CX23885_BOARD_HAUPPAUGE_HVR1270:
 	case CX23885_BOARD_HAUPPAUGE_HVR1850:
+	case CX23885_BOARD_HAUPPAUGE_HVR5525:
 	case CX23885_BOARD_MYGICA_X8506:
 	case CX23885_BOARD_MAGICPRO_PROHDTVE2:
 	case CX23885_BOARD_HAUPPAUGE_HVR1290:
diff --git a/drivers/media/pci/cx23885/cx23885-dvb.c b/drivers/media/pci/=
cx23885/cx23885-dvb.c
index 37dc13b052a3..e8812589a6a3 100644
--- a/drivers/media/pci/cx23885/cx23885-dvb.c
+++ b/drivers/media/pci/cx23885/cx23885-dvb.c
@@ -2320,6 +2320,12 @@ static int dvb_register(struct cx23885_tsport *por=
t)
 				goto frontend_detach;
 			}
 			port->i2c_client_tuner =3D client_tuner;
+
+			dev->ts1.analog_fe.tuner_priv =3D client_tuner;
+			memcpy(&dev->ts1.analog_fe.ops.tuner_ops,
+			       &fe0->dvb.frontend->ops.tuner_ops,
+			       sizeof(struct dvb_tuner_ops));
+
 			break;
 		}
 		break;
diff --git a/drivers/media/pci/cx23885/cx23885-video.c b/drivers/media/pc=
i/cx23885/cx23885-video.c
index 3331d6833769..e2062a0c4cf7 100644
--- a/drivers/media/pci/cx23885/cx23885-video.c
+++ b/drivers/media/pci/cx23885/cx23885-video.c
@@ -256,6 +256,7 @@ static int cx23885_video_mux(struct cx23885_dev *dev,=
 unsigned int input)
 		(dev->board =3D=3D CX23885_BOARD_HAUPPAUGE_QUADHD_ATSC) ||
 		(dev->board =3D=3D CX23885_BOARD_HAUPPAUGE_QUADHD_DVB) ||
 		(dev->board =3D=3D CX23885_BOARD_HAUPPAUGE_HVR1850) ||
+		(dev->board =3D=3D CX23885_BOARD_HAUPPAUGE_HVR5525) ||
 		(dev->board =3D=3D CX23885_BOARD_MYGICA_X8507) ||
 		(dev->board =3D=3D CX23885_BOARD_AVERMEDIA_HC81R) ||
 		(dev->board =3D=3D CX23885_BOARD_VIEWCAST_260E) ||
@@ -998,6 +999,7 @@ static int cx23885_set_freq_via_ops(struct cx23885_de=
v *dev,
 	    (dev->board =3D=3D CX23885_BOARD_HAUPPAUGE_HVR1255) ||
 	    (dev->board =3D=3D CX23885_BOARD_HAUPPAUGE_HVR1255_22111) ||
 	    (dev->board =3D=3D CX23885_BOARD_HAUPPAUGE_HVR1265_K4) ||
+	    (dev->board =3D=3D CX23885_BOARD_HAUPPAUGE_HVR5525) ||
 	    (dev->board =3D=3D CX23885_BOARD_HAUPPAUGE_QUADHD_DVB) ||
 	    (dev->board =3D=3D CX23885_BOARD_HAUPPAUGE_QUADHD_ATSC))
 		fe =3D &dev->ts1.analog_fe;
@@ -1030,6 +1032,7 @@ int cx23885_set_frequency(struct file *file, void *=
priv,
 	case CX23885_BOARD_HAUPPAUGE_HVR1255_22111:
 	case CX23885_BOARD_HAUPPAUGE_HVR1265_K4:
 	case CX23885_BOARD_HAUPPAUGE_HVR1850:
+	case CX23885_BOARD_HAUPPAUGE_HVR5525:
 	case CX23885_BOARD_HAUPPAUGE_QUADHD_DVB:
 	case CX23885_BOARD_HAUPPAUGE_QUADHD_ATSC:
 		ret =3D cx23885_set_freq_via_ops(dev, f);
--=20
2.23.0

