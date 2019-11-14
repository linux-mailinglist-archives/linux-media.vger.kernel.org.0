Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5FFF2FCF1B
	for <lists+linux-media@lfdr.de>; Thu, 14 Nov 2019 21:04:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726962AbfKNUEa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Nov 2019 15:04:30 -0500
Received: from egyptian.birch.relay.mailchannels.net ([23.83.209.56]:39447
        "EHLO egyptian.birch.relay.mailchannels.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726444AbfKNUE3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Nov 2019 15:04:29 -0500
X-Sender-Id: dreamhost|x-authsender|brad@nextdimension.ws
Received: from relay.mailchannels.net (localhost [127.0.0.1])
        by relay.mailchannels.net (Postfix) with ESMTP id 5BC4921C9B;
        Thu, 14 Nov 2019 20:04:28 +0000 (UTC)
Received: from pdx1-sub0-mail-a96.g.dreamhost.com (100-96-196-8.trex.outbound.svc.cluster.local [100.96.196.8])
        (Authenticated sender: dreamhost)
        by relay.mailchannels.net (Postfix) with ESMTPA id CBF3921EC1;
        Thu, 14 Nov 2019 20:04:27 +0000 (UTC)
X-Sender-Id: dreamhost|x-authsender|brad@nextdimension.ws
Received: from pdx1-sub0-mail-a96.g.dreamhost.com ([TEMPUNAVAIL].
 [64.90.62.162])
        (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384)
        by 0.0.0.0:2500 (trex/5.18.5);
        Thu, 14 Nov 2019 20:04:28 +0000
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|brad@nextdimension.ws
X-MailChannels-Auth-Id: dreamhost
X-Obese-Whistle: 375d4360137ea174_1573761868108_1236906938
X-MC-Loop-Signature: 1573761868108:3944466174
X-MC-Ingress-Time: 1573761868107
Received: from pdx1-sub0-mail-a96.g.dreamhost.com (localhost [127.0.0.1])
        by pdx1-sub0-mail-a96.g.dreamhost.com (Postfix) with ESMTP id 3B40B8260E;
        Thu, 14 Nov 2019 12:04:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=nextdimension.cc; h=from
        :to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=nextdimension.cc; bh=
        1mQ92ZLLhSFZ7MBxNy3RmzEGNTY=; b=Z/EIxs1ja+q9s0J2xn9xUrlSEd+dK1rz
        m0DdK7Z7oxvHJkWFHM56782GGTk6PPSL/fkRCkiGA5XcPUGs1XbnAeMQx7Cif8MM
        xdHTjhSIM9PWzlMqwBlO3jgcyme98xkdmi3zk6rpwpG68Nbs3tuNngTeHLU00pMC
        TYR4iH4Jx9c=
Received: from localhost.localdomain (67-198-57-188.static.grandenetworks.net [67.198.57.188])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: brad@nextdimension.ws)
        by pdx1-sub0-mail-a96.g.dreamhost.com (Postfix) with ESMTPSA id D1A528260C;
        Thu, 14 Nov 2019 12:04:22 -0800 (PST)
X-DH-BACKEND: pdx1-sub0-mail-a96
From:   Brad Love <brad@nextdimension.cc>
To:     linux-media@vger.kernel.org
Cc:     Brad Love <brad@nextdimension.cc>
Subject: [PATCH v3 13/14] lgdt3306a: Add CNR v5 stat
Date:   Thu, 14 Nov 2019 14:04:07 -0600
Message-Id: <20191114200408.28883-14-brad@nextdimension.cc>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191114200408.28883-1-brad@nextdimension.cc>
References: <20191114200408.28883-1-brad@nextdimension.cc>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The CNR is already calculated, so populate DVBv5 CNR stat
during read_status.

Signed-off-by: Brad Love <brad@nextdimension.cc>
---
No changes

 drivers/media/dvb-frontends/lgdt3306a.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/media/dvb-frontends/lgdt3306a.c b/drivers/media/dvb-=
frontends/lgdt3306a.c
index 6c4adec58174..d3c330e035c4 100644
--- a/drivers/media/dvb-frontends/lgdt3306a.c
+++ b/drivers/media/dvb-frontends/lgdt3306a.c
@@ -846,6 +846,7 @@ static int lgdt3306a_fe_sleep(struct dvb_frontend *fe=
)
 static int lgdt3306a_init(struct dvb_frontend *fe)
 {
 	struct lgdt3306a_state *state =3D fe->demodulator_priv;
+	struct dtv_frontend_properties *c =3D &fe->dtv_property_cache;
 	u8 val;
 	int ret;
=20
@@ -997,6 +998,9 @@ static int lgdt3306a_init(struct dvb_frontend *fe)
 	ret =3D lgdt3306a_sleep(state);
 	lg_chkerr(ret);
=20
+	c->cnr.len =3D 1;
+	c->cnr.stat[0].scale =3D FE_SCALE_NOT_AVAILABLE;
+
 fail:
 	return ret;
 }
@@ -1597,6 +1601,7 @@ static int lgdt3306a_read_status(struct dvb_fronten=
d *fe,
 				 enum fe_status *status)
 {
 	struct lgdt3306a_state *state =3D fe->demodulator_priv;
+	struct dtv_frontend_properties *c =3D &fe->dtv_property_cache;
 	u16 strength =3D 0;
 	int ret =3D 0;
=20
@@ -1637,6 +1642,15 @@ static int lgdt3306a_read_status(struct dvb_fronte=
nd *fe,
 		default:
 			ret =3D -EINVAL;
 		}
+
+		if (*status & FE_HAS_SYNC) {
+			c->cnr.len =3D 1;
+			c->cnr.stat[0].scale =3D FE_SCALE_DECIBEL;
+			c->cnr.stat[0].svalue =3D lgdt3306a_calculate_snr_x100(state) * 10;
+		} else {
+			c->cnr.len =3D 1;
+			c->cnr.stat[0].scale =3D FE_SCALE_NOT_AVAILABLE;
+		}
 	}
 	return ret;
 }
--=20
2.23.0

