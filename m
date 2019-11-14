Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CFCE8FCF18
	for <lists+linux-media@lfdr.de>; Thu, 14 Nov 2019 21:04:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726549AbfKNUE3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Nov 2019 15:04:29 -0500
Received: from egyptian.birch.relay.mailchannels.net ([23.83.209.56]:10211
        "EHLO egyptian.birch.relay.mailchannels.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726894AbfKNUE1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Nov 2019 15:04:27 -0500
X-Sender-Id: dreamhost|x-authsender|brad@nextdimension.ws
Received: from relay.mailchannels.net (localhost [127.0.0.1])
        by relay.mailchannels.net (Postfix) with ESMTP id 650C22197B;
        Thu, 14 Nov 2019 20:04:26 +0000 (UTC)
Received: from pdx1-sub0-mail-a96.g.dreamhost.com (100-96-6-183.trex.outbound.svc.cluster.local [100.96.6.183])
        (Authenticated sender: dreamhost)
        by relay.mailchannels.net (Postfix) with ESMTPA id BB17121F37;
        Thu, 14 Nov 2019 20:04:25 +0000 (UTC)
X-Sender-Id: dreamhost|x-authsender|brad@nextdimension.ws
Received: from pdx1-sub0-mail-a96.g.dreamhost.com ([TEMPUNAVAIL].
 [64.90.62.162])
        (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384)
        by 0.0.0.0:2500 (trex/5.18.5);
        Thu, 14 Nov 2019 20:04:26 +0000
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|brad@nextdimension.ws
X-MailChannels-Auth-Id: dreamhost
X-Average-Chief: 698886be4d820127_1573761866181_468827110
X-MC-Loop-Signature: 1573761866181:1722058548
X-MC-Ingress-Time: 1573761866181
Received: from pdx1-sub0-mail-a96.g.dreamhost.com (localhost [127.0.0.1])
        by pdx1-sub0-mail-a96.g.dreamhost.com (Postfix) with ESMTP id 793A7825D5;
        Thu, 14 Nov 2019 12:04:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=nextdimension.cc; h=from
        :to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=nextdimension.cc; bh=
        DXiWayWSueQHl/FTbdKBnLM4Yzk=; b=PZ8w8jPYrMe02G6c5Zor+1+03QbqEtk/
        6iJVhh98R2t3MMA2j8jzmfr6wTMDT+qwdS2anNu/ORDSefl/z5dYB0LQWX7ooOOG
        vi2nLXH3zHwFs7ChuF73eOplsiujj8qjZzznmeCQK9q2oY57ra2A5X4qiEFBWFw7
        9PcRXYx9vJY=
Received: from localhost.localdomain (67-198-57-188.static.grandenetworks.net [67.198.57.188])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: brad@nextdimension.ws)
        by pdx1-sub0-mail-a96.g.dreamhost.com (Postfix) with ESMTPSA id 0CFC682601;
        Thu, 14 Nov 2019 12:04:19 -0800 (PST)
X-DH-BACKEND: pdx1-sub0-mail-a96
From:   Brad Love <brad@nextdimension.cc>
To:     linux-media@vger.kernel.org
Cc:     Brad Love <brad@nextdimension.cc>
Subject: [PATCH v3 08/14] cx23885: Add analog frontend to 1265_K4
Date:   Thu, 14 Nov 2019 14:04:02 -0600
Message-Id: <20191114200408.28883-9-brad@nextdimension.cc>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191114200408.28883-1-brad@nextdimension.cc>
References: <20191114200408.28883-1-brad@nextdimension.cc>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Enables the analog tuning frontend for Hauppauge HVR-1265_K4.

Signed-off-by: Brad Love <brad@nextdimension.cc>
---
Since v2:
- Remove force_bff from ATSC 1264_K4

 drivers/media/pci/cx23885/cx23885-cards.c | 8 +++++++-
 drivers/media/pci/cx23885/cx23885-dvb.c   | 5 +++++
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/media/pci/cx23885/cx23885-cards.c b/drivers/media/pc=
i/cx23885/cx23885-cards.c
index 95c9c7f74ba8..916fa8987f8b 100644
--- a/drivers/media/pci/cx23885/cx23885-cards.c
+++ b/drivers/media/pci/cx23885/cx23885-cards.c
@@ -804,8 +804,14 @@ struct cx23885_board cx23885_boards[] =3D {
 		.porta          =3D CX23885_ANALOG_VIDEO,
 		.portc		=3D CX23885_MPEG_DVB,
 		.tuner_type     =3D TUNER_ABSENT,
-		.force_bff	=3D 1,
 		.input          =3D {{
+			.type   =3D CX23885_VMUX_TELEVISION,
+			.vmux   =3D	CX25840_VIN7_CH3 |
+					CX25840_VIN5_CH2 |
+					CX25840_VIN2_CH1 |
+					CX25840_DIF_ON,
+			.amux   =3D CX25840_AUDIO8,
+		}, {
 			.type   =3D CX23885_VMUX_COMPOSITE1,
 			.vmux   =3D	CX25840_VIN7_CH3 |
 					CX25840_VIN4_CH2 |
diff --git a/drivers/media/pci/cx23885/cx23885-dvb.c b/drivers/media/pci/=
cx23885/cx23885-dvb.c
index 590af4656828..37dc13b052a3 100644
--- a/drivers/media/pci/cx23885/cx23885-dvb.c
+++ b/drivers/media/pci/cx23885/cx23885-dvb.c
@@ -2553,6 +2553,11 @@ static int dvb_register(struct cx23885_tsport *por=
t)
 				goto frontend_detach;
 			}
 			port->i2c_client_tuner =3D client_tuner;
+
+			dev->ts1.analog_fe.tuner_priv =3D client_tuner;
+			memcpy(&dev->ts1.analog_fe.ops.tuner_ops,
+			       &fe0->dvb.frontend->ops.tuner_ops,
+			       sizeof(struct dvb_tuner_ops));
 			break;
 		}
 		break;
--=20
2.23.0

