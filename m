Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83EB948FC51
	for <lists+linux-media@lfdr.de>; Sun, 16 Jan 2022 12:30:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234880AbiAPLaR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 16 Jan 2022 06:30:17 -0500
Received: from mcv99outg.rz.uni-leipzig.de ([139.18.1.195]:59315 "EHLO
        mcv99outg.rz.uni-leipzig.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230451AbiAPLaP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 16 Jan 2022 06:30:15 -0500
Received: from mcv2outg.rz.uni-leipzig.de (mcv2outg.rz.uni-leipzig.de [139.18.1.194])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mcv99outg.rz.uni-leipzig.de (Postfix) with ESMTPS id 4JcCMm3tNgz11Hb
        for <linux-media@vger.kernel.org>; Sun, 16 Jan 2022 12:23:32 +0100 (CET)
Received: from v1.rz.uni-leipzig.de (v1.rz.uni-leipzig.de [139.18.1.26])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits))
        (No client certificate requested)
        by mcv2outg.rz.uni-leipzig.de (Postfix) with ESMTPS id 4JcCMl3WpYz11Q9;
        Sun, 16 Jan 2022 12:23:31 +0100 (CET)
Received: from server1.rz.uni-leipzig.de (server1.rz.uni-leipzig.de [139.18.1.1])
        by v1.rz.uni-leipzig.de (Postfix) with ESMTPS id 60964205F2;
        Sun, 16 Jan 2022 12:23:31 +0100 (CET)
Received: from gg1.iat.uni-leipzig.de (gg1.iat.uni-leipzig.de [141.39.226.97])
        by server1.rz.uni-leipzig.de (Postfix) with ESMTPS id 7148194004;
        Sun, 16 Jan 2022 12:23:29 +0100 (CET)
Received: from gg1.iat.uni-leipzig.de (localhost [127.0.0.1])
        by gg1.iat.uni-leipzig.de (Postfix) with ESMTP id 5347C840798;
        Sun, 16 Jan 2022 12:23:29 +0100 (CET)
Received: (from localhost) by gg1.iat.uni-leipzig.de (MSCAN) id 6/gg1.iat.uni-leipzig.de/smtp-gw/mscan; Sun Jan 16 12:23:29
     2022
From:   Michael Bunk <micha@freedict.org>
To:     mchehab@kernel.org, linux-media@vger.kernel.org
Cc:     vasilyev@ispras.ru, crope@iki.fi, Michael Bunk <micha@freedict.org>
Subject: [PATCH 1/4] media: m88ds3103: Fix lock led support
Date:   Sun, 16 Jan 2022 12:22:35 +0100
Message-Id: <20220116112238.74171-1-micha@freedict.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Score: 0.00
X-ExSBR-Direction: Incoming
X-Rspamd-UID: 1f0b6b
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The new m88ds3101b demodulator version requires the highest bit of
register 0x11 be cleared after tuning to a new frequency to make the
lock output pin go high when a signal is found.  This pin is normally
connected to an indicator led.

Signed-off-by: Michael Bunk <micha@freedict.org>
---
 drivers/media/dvb-frontends/m88ds3103.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/media/dvb-frontends/m88ds3103.c b/drivers/media/dvb-=
frontends/m88ds3103.c
index bce0f42f3d19..b5e3b4b81350 100644
--- a/drivers/media/dvb-frontends/m88ds3103.c
+++ b/drivers/media/dvb-frontends/m88ds3103.c
@@ -1000,6 +1000,13 @@ static int m88ds3103_set_frontend(struct dvb_front=
end *fe)
 	if (ret)
 		goto err;
=20
+	if (dev->chiptype =3D=3D M88DS3103_CHIPTYPE_3103B) {
+		/* to light up the LOCK led */
+		ret =3D m88ds3103_update_bits(dev, 0x11, 0x80, 0x00);
+		if (ret)
+			goto err;
+	}
+
 	dev->delivery_system =3D c->delivery_system;
=20
 	return 0;
--=20
2.34.1

