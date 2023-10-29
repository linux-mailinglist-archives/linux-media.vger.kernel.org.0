Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E68BA7DAC87
	for <lists+linux-media@lfdr.de>; Sun, 29 Oct 2023 13:49:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230077AbjJ2MtV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 29 Oct 2023 08:49:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229482AbjJ2MtT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 29 Oct 2023 08:49:19 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFADCF9
        for <linux-media@vger.kernel.org>; Sun, 29 Oct 2023 05:49:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=s31663417; t=1698583738; x=1699188538; i=wahrenst@gmx.net;
        bh=lb1OtERw+AGwlwx7wh86H5dO1K1o6Yr1Q3BtzK1SjYA=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:
         References;
        b=quRCaAux/teG2h9PIkiC6DlvwNUhmHQGuFG/EY4hEkVmESzL1HZwyI5ABEunIGhG
         yyQ5Emk1TryAwNCbak0nJVHOVo20H3TlXVBa52qy/mvzy6TCH5hgJsVmecKFBrDvG
         ucDhCszVIZ+nwxS/LaBLzXEvp0tdS+rwaJDP1lHLDoNLYK3oDIcfx1/wW/8xXgz21
         QD2eIa6zN9f8W4VmTYloJyY8fIFsURQWYK3fE2jM58PR6h9Ggli3cSpqdG390nYPC
         lywBjzoh28GK9g8ZsZMim2Lhekeix0iW0t7bREq/omrFTHa83keo2kLwTd3fohrjF
         9nt4R79tZn2g+gYg+A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.248.43]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MzQkK-1rjX0T3w8G-00vRTr; Sun, 29
 Oct 2023 13:48:58 +0100
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
Subject: [PATCH V2 2/3] staging: vchiq_core: Shorten bulk TX/RX pending dump
Date:   Sun, 29 Oct 2023 13:48:36 +0100
Message-Id: <20231029124837.119832-3-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231029124837.119832-1-wahrenst@gmx.net>
References: <20231029124837.119832-1-wahrenst@gmx.net>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:sfOpDu0Vm9zeCyrISDNRl3qwamKKktE9YklDU+o8o0uWp7XJUtN
 9cBHveRTGEbrmjXluEtc0YdA+IZ4GXwurQyMCSCo9NeXETMqdMB4qc1eNX7SWaGz0usN2TB
 X1xVfS/Zz61A00hVsvY121Mbs68ezwSaAjuIfMASj2zqAEwFkYjtCH6Pm0/W5Ny/wDN/IsA
 HVsIdSi5QPM13P3upXaOQ==
UI-OutboundReport: notjunk:1;M01:P0:ukpQllaRuds=;YCk7Z0kGW8eP24jKoxzAzkeSMdu
 srQ7Cl4zB90xC21kUr1hsMT7bZRT9RMEHDXUvXWFzEtwTqQVJYah6KuOpmj3uLhqPcP6fBKyw
 4EVDFwg6XbWfWBTZ14jtptsam/aETVAVcVZAcia6cpTUfsc2kPkLGbfcEUWdfpnJcGCpbcbn0
 or75iMo/Jn2NWDRXVJ6nPxyewoW+WeALugZdCuK9eQSwuJSx/TlOTVvrsrnNhLlrnsi5424z5
 I+/91NpEJA5reEAw7XlcLoYRQ/6b5mHN8g5ZcXPUNcNNEw49CPzKVXqS80Rm4POWyr2ELqI5D
 DDirZZdKn8/hokpBjRoYcYt6G4VPHmiDp/t94P4nc3hJOETyXnB2v1Uy3Zrso9FQWnXkdtXLA
 M/C1o66QX/AMqdHPGoEf27DcbdvRoPrmbekyPWoZwffVhKZTEgnXS6lhlmj5/pli5GaVvsDXJ
 I1a3X+n7s9hC+2PVE0RB3uqclPmRXalO/EWHCSEHzWym6ejqGzwnO00I76fSejYJOw9ISN8Sa
 /QLjg0HwOE5FDIAp7BuIMdtzOxt0khlMbs1I4OCHxav+bSpyiPqBTtpv503k32PcCDJZsXsyR
 DCSqoOVDVL31EAyeh9U+W2Z+VCCptfAYf8Hyda/dlrvERHLDaQdZBH+Ob8ZdcZKd2O9LYK1Fu
 eY/zn463UXpHAg8kJEvXLVEFIBaXldWLpBXKzQIgwXcI9FH1+oR+QFO3POZpqHnhCd/nhwRBm
 u8fgbIXa6/g7xyZN2yTN9fmEdfGbH1LncGAyNeDG9Lfz3sHLMG13Cz4YWOu+OB7J/gcitDtJ7
 GB7xScB/fHTW/M7HVOZnOCHKlG+VUcgDSCQegoU3O9ZbvX9kqoGEHM0nOkj3TX2TwXz4/z5Wn
 iEuxk4brKjetSnvqS2TiHH2WqMfBeb3dYx6BXajsPqCbYHbwfjWmI+mcQ99BZpS6SCPuLP2UH
 K3l8Gfj6XxgmYtsWb9aNVMwgRxg=
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The calculation for the bulk TX/RX pending is complex and
reaches 99 chars per line. So move the size determination
below the pending calculation and get the rid of the
ternary operator.

Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
=2D--
 .../interface/vchiq_arm/vchiq_core.c          | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.=
c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
index 94073f92651a..36c742a2f3b2 100644
=2D-- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
@@ -3447,7 +3447,7 @@ vchiq_dump_service_state(void *dump_context, struct =
vchiq_service *service)
 		struct vchiq_service_quota *quota =3D
 			&service->state->service_quotas[service->localport];
 		int fourcc =3D service->base.fourcc;
-		int tx_pending, rx_pending;
+		int tx_pending, rx_pending, tx_size =3D 0, rx_size =3D 0;

 		if (service->remoteport !=3D VCHIQ_PORT_FREE) {
 			int len2 =3D scnprintf(remoteport, sizeof(remoteport),
@@ -3472,18 +3472,23 @@ vchiq_dump_service_state(void *dump_context, struc=
t vchiq_service *service)

 		tx_pending =3D service->bulk_tx.local_insert -
 			service->bulk_tx.remote_insert;
+		if (tx_pending) {
+			unsigned int i =3D BULK_INDEX(service->bulk_tx.remove);
+
+			tx_size =3D service->bulk_tx.bulks[i].size;
+		}

 		rx_pending =3D service->bulk_rx.local_insert -
 			service->bulk_rx.remote_insert;
+		if (rx_pending) {
+			unsigned int i =3D BULK_INDEX(service->bulk_rx.remove);
+
+			rx_size =3D service->bulk_rx.bulks[i].size;
+		}

 		len =3D scnprintf(buf, sizeof(buf),
 				"  Bulk: tx_pending=3D%d (size %d), rx_pending=3D%d (size %d)",
-				tx_pending,
-				tx_pending ?
-				service->bulk_tx.bulks[BULK_INDEX(service->bulk_tx.remove)].size :
-				0, rx_pending, rx_pending ?
-				service->bulk_rx.bulks[BULK_INDEX(service->bulk_rx.remove)].size :
-				0);
+				tx_pending, tx_size, rx_pending, rx_size);

 		if (VCHIQ_ENABLE_STATS) {
 			err =3D vchiq_dump(dump_context, buf, len + 1);
=2D-
2.34.1

