Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 49BC17DAC88
	for <lists+linux-media@lfdr.de>; Sun, 29 Oct 2023 13:49:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230101AbjJ2MtW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 29 Oct 2023 08:49:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230050AbjJ2MtU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 29 Oct 2023 08:49:20 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F4BE128
        for <linux-media@vger.kernel.org>; Sun, 29 Oct 2023 05:49:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=s31663417; t=1698583737; x=1699188537; i=wahrenst@gmx.net;
        bh=LLHvVo63AjV5Hqcr1vFlrSG2w/jB0JpbolqJznId/kE=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:
         References;
        b=NeebYyrrvcGl6+DhmjHYxeWsdi+B0X6H6t/6s3LW4ZhzMl54pzbX753IVfFUMKo1
         FqXMRjfRJfx6tbHj+r4soKiR+ljk1Zq5btnv2fTXYM47lXYXN7WH7zvpcE+GAR1kK
         57QqiFC1vEqC25ZQ79dme4rZDJ5cZNtG1ed2juX9ZvfPLSnZInVgJC2gwAwfffZLk
         nmHrzgAQyRQQt9a8nC9kIqN8e8DQ3I8cMNt+mtbnxZ/M2W1Q0AH9F0YWxvOc+WHtL
         yT4qJ4fUfuHkErxd+9+sD4PajHlw3YmPcMYU9DBFIO+y+L3IXHaYbfoN4YQkr1Ig2
         XRwXdICQmaSKQfN3cA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.248.43]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MVeMG-1r4kCj1yZ2-00RaJP; Sun, 29
 Oct 2023 13:48:57 +0100
From:   Stefan Wahren <wahrenst@gmx.net>
To:     Umang Jain <umang.jain@ideasonboard.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Florian Fainelli <florian.fainelli@broadcom.com>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        Phil Elwell <phil@raspberrypi.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-staging@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH V2 1/3] staging: vchiq_core: Make vchiq_dump_service_state static
Date:   Sun, 29 Oct 2023 13:48:35 +0100
Message-Id: <20231029124837.119832-2-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231029124837.119832-1-wahrenst@gmx.net>
References: <20231029124837.119832-1-wahrenst@gmx.net>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:fnQaSbRNyE9QMj90gnh3LQXlCZg7uJYe9hHnatjhlHLfMbkPXvG
 sdKpB0bsJBnJeASH2+F/QqIW/Z4NSpF5h+uFpqWKK+lcOmr74Fn/s945G/uyoR+9Fy++JZ+
 0NiiKwoEjQNGnTitdVBQR1DCpQ4NVzGoAKyhKt+WrztZAyJjgdmIyJ4SasCPukRir3ZyqEF
 Tag00ON6rzf+AF5/he4Gw==
UI-OutboundReport: notjunk:1;M01:P0:2v1R47j4rlg=;k7PpRxaVxhP+ZA8phL3tU1EEqlN
 qex9xgUePnxL0PuwmVBITeXKqu1VMzPtnUlURFHI8yspwb4Zfo2edCJaM+moxXcRRYcxCwLJX
 LgSZCCRgnJCxAzl2uYOTaMuXcPj8KpD6dczHL8ldNEre8kZgYcg1QG+WH7bq2BIxqpwj2iPow
 c0irtk43eswyv9go7RbyKfotpnoasQgX2y2QfCbW4Li3tE58xrT0dpzuhrcHY2vTMpH0SiGdT
 b08wlJmy0flEix/NEaWy/ga1eV7x/8VOYYXQYL+KiG8HsXT1de3Bx2++eAqWquAloIZfVb5rC
 LUrSCPmoeyDWu6fsvcfL9qHd1MuLJ0qFh3pzIzQxcFTAtdNj8rX6+B4vOgmzeqlyfJhPtuG6N
 19MBcocafrowmuoaeqzP37+uq/Ev5invREh/YEb16PXqxcVTLZq2fkI64CFIVatVKVc1y5mM4
 CauygI3idzz3XpboqrDjhtIJ59c24PrYIsQY/NI24QzOEmZ0yQcNcWE1VXh0NcouWOneJXg3U
 /lH+VKARh2fZbFxsaKG/sdXHOqzqSIn9WqcmJ3/O7DQNVmLc2BegNFDhXgePEn8NxmGG/4pgG
 XyYKromRl78Nz5QrEbYr7ZxSJYvyXGXApmWpwYldxr7E6da+YOW9wxDVu83HCa81ad1xR9Vb8
 Xz6gb2L341Ytd2eIeXGWtzfpmYYaMnvH+m7qniHHvXskQ+V3QvyFokyUpC9AYe6yUoRrJsCMP
 s1edEuu3DUmJapbEPzUitSIHZU14Fu4zX/jLYwAkge9fpPPdxbu4nRZ9BOtzHeLxHhWSEphdW
 BomxIsiY7A6TrxLkmtC6nVH7S0F8EVH/hGXCEpw4q7imQE4AfS15gz/iBzyZlyXG7twOb2l0p
 1rfDjCMf3YotIOGGnEXdIckjBs+Q3Mm4PRikBbUHa3XgQo/DHu5psk7HvW+IQ9B/Ka1dQtgcU
 ZOH9pjIelgvNWOqhiQOWchnlFhM=
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The function vchiq_dump_service_state() is only used by vchiq_dump_state()
within vchiq_core.c. So move the definition of vchiq_dump_state() below
vchiq_dump_service_state() in order to make it static.

Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
=2D--
 .../interface/vchiq_arm/vchiq_core.c          | 169 +++++++++---------
 .../interface/vchiq_arm/vchiq_core.h          |   3 -
 2 files changed, 85 insertions(+), 87 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.=
c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
index 39b857da2d42..94073f92651a 100644
=2D-- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
@@ -3428,90 +3428,8 @@ vchiq_dump_shared_state(void *dump_context, struct =
vchiq_state *state,
 	return 0;
 }

-int vchiq_dump_state(void *dump_context, struct vchiq_state *state)
-{
-	char buf[80];
-	int len;
-	int i;
-	int err;
-
-	len =3D scnprintf(buf, sizeof(buf), "State %d: %s", state->id,
-			conn_state_names[state->conn_state]);
-	err =3D vchiq_dump(dump_context, buf, len + 1);
-	if (err)
-		return err;
-
-	len =3D scnprintf(buf, sizeof(buf), "  tx_pos=3D%x(@%pK), rx_pos=3D%x(@%=
pK)",
-			state->local->tx_pos,
-			state->tx_data + (state->local_tx_pos & VCHIQ_SLOT_MASK),
-			state->rx_pos,
-			state->rx_data + (state->rx_pos & VCHIQ_SLOT_MASK));
-	err =3D vchiq_dump(dump_context, buf, len + 1);
-	if (err)
-		return err;
-
-	len =3D scnprintf(buf, sizeof(buf), "  Version: %d (min %d)",
-			VCHIQ_VERSION, VCHIQ_VERSION_MIN);
-	err =3D vchiq_dump(dump_context, buf, len + 1);
-	if (err)
-		return err;
-
-	if (VCHIQ_ENABLE_STATS) {
-		len =3D scnprintf(buf, sizeof(buf),
-				"  Stats: ctrl_tx_count=3D%d, ctrl_rx_count=3D%d, error_count=3D%d",
-				state->stats.ctrl_tx_count, state->stats.ctrl_rx_count,
-				state->stats.error_count);
-		err =3D vchiq_dump(dump_context, buf, len + 1);
-		if (err)
-			return err;
-	}
-
-	len =3D scnprintf(buf, sizeof(buf),
-			"  Slots: %d available (%d data), %d recyclable, %d stalls (%d data)",
-			((state->slot_queue_available * VCHIQ_SLOT_SIZE) -
-			state->local_tx_pos) / VCHIQ_SLOT_SIZE,
-			state->data_quota - state->data_use_count,
-			state->local->slot_queue_recycle - state->slot_queue_available,
-			state->stats.slot_stalls, state->stats.data_stalls);
-	err =3D vchiq_dump(dump_context, buf, len + 1);
-	if (err)
-		return err;
-
-	err =3D vchiq_dump_platform_state(dump_context);
-	if (err)
-		return err;
-
-	err =3D vchiq_dump_shared_state(dump_context,
-				      state,
-				      state->local,
-				      "Local");
-	if (err)
-		return err;
-	err =3D vchiq_dump_shared_state(dump_context,
-				      state,
-				      state->remote,
-				      "Remote");
-	if (err)
-		return err;
-
-	err =3D vchiq_dump_platform_instances(dump_context);
-	if (err)
-		return err;
-
-	for (i =3D 0; i < state->unused_service; i++) {
-		struct vchiq_service *service =3D find_service_by_port(state, i);
-
-		if (service) {
-			err =3D vchiq_dump_service_state(dump_context, service);
-			vchiq_service_put(service);
-			if (err)
-				return err;
-		}
-	}
-	return 0;
-}
-
-int vchiq_dump_service_state(void *dump_context, struct vchiq_service *se=
rvice)
+static int
+vchiq_dump_service_state(void *dump_context, struct vchiq_service *servic=
e)
 {
 	char buf[80];
 	int len;
@@ -3606,6 +3524,89 @@ int vchiq_dump_service_state(void *dump_context, st=
ruct vchiq_service *service)
 	return err;
 }

+int vchiq_dump_state(void *dump_context, struct vchiq_state *state)
+{
+	char buf[80];
+	int len;
+	int i;
+	int err;
+
+	len =3D scnprintf(buf, sizeof(buf), "State %d: %s", state->id,
+			conn_state_names[state->conn_state]);
+	err =3D vchiq_dump(dump_context, buf, len + 1);
+	if (err)
+		return err;
+
+	len =3D scnprintf(buf, sizeof(buf), "  tx_pos=3D%x(@%pK), rx_pos=3D%x(@%=
pK)",
+			state->local->tx_pos,
+			state->tx_data + (state->local_tx_pos & VCHIQ_SLOT_MASK),
+			state->rx_pos,
+			state->rx_data + (state->rx_pos & VCHIQ_SLOT_MASK));
+	err =3D vchiq_dump(dump_context, buf, len + 1);
+	if (err)
+		return err;
+
+	len =3D scnprintf(buf, sizeof(buf), "  Version: %d (min %d)",
+			VCHIQ_VERSION, VCHIQ_VERSION_MIN);
+	err =3D vchiq_dump(dump_context, buf, len + 1);
+	if (err)
+		return err;
+
+	if (VCHIQ_ENABLE_STATS) {
+		len =3D scnprintf(buf, sizeof(buf),
+				"  Stats: ctrl_tx_count=3D%d, ctrl_rx_count=3D%d, error_count=3D%d",
+				state->stats.ctrl_tx_count, state->stats.ctrl_rx_count,
+				state->stats.error_count);
+		err =3D vchiq_dump(dump_context, buf, len + 1);
+		if (err)
+			return err;
+	}
+
+	len =3D scnprintf(buf, sizeof(buf),
+			"  Slots: %d available (%d data), %d recyclable, %d stalls (%d data)",
+			((state->slot_queue_available * VCHIQ_SLOT_SIZE) -
+			state->local_tx_pos) / VCHIQ_SLOT_SIZE,
+			state->data_quota - state->data_use_count,
+			state->local->slot_queue_recycle - state->slot_queue_available,
+			state->stats.slot_stalls, state->stats.data_stalls);
+	err =3D vchiq_dump(dump_context, buf, len + 1);
+	if (err)
+		return err;
+
+	err =3D vchiq_dump_platform_state(dump_context);
+	if (err)
+		return err;
+
+	err =3D vchiq_dump_shared_state(dump_context,
+				      state,
+				      state->local,
+				      "Local");
+	if (err)
+		return err;
+	err =3D vchiq_dump_shared_state(dump_context,
+				      state,
+				      state->remote,
+				      "Remote");
+	if (err)
+		return err;
+
+	err =3D vchiq_dump_platform_instances(dump_context);
+	if (err)
+		return err;
+
+	for (i =3D 0; i < state->unused_service; i++) {
+		struct vchiq_service *service =3D find_service_by_port(state, i);
+
+		if (service) {
+			err =3D vchiq_dump_service_state(dump_context, service);
+			vchiq_service_put(service);
+			if (err)
+				return err;
+		}
+	}
+	return 0;
+}
+
 int vchiq_send_remote_use(struct vchiq_state *state)
 {
 	if (state->conn_state =3D=3D VCHIQ_CONNSTATE_DISCONNECTED)
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.=
h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
index 161358db457c..ea8d58844775 100644
=2D-- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
@@ -507,9 +507,6 @@ vchiq_bulk_transfer(struct vchiq_instance *instance, u=
nsigned int handle, void *
 extern int
 vchiq_dump_state(void *dump_context, struct vchiq_state *state);

-extern int
-vchiq_dump_service_state(void *dump_context, struct vchiq_service *servic=
e);
-
 extern void
 vchiq_loud_error_header(void);

=2D-
2.34.1

