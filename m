Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E3D427D050
	for <lists+linux-media@lfdr.de>; Tue, 29 Sep 2020 15:59:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730778AbgI2N5s (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 29 Sep 2020 09:57:48 -0400
Received: from mail2-relais-roc.national.inria.fr ([192.134.164.83]:47110 "EHLO
        mail2-relais-roc.national.inria.fr" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728461AbgI2N5o (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 29 Sep 2020 09:57:44 -0400
X-IronPort-AV: E=Sophos;i="5.77,318,1596492000"; 
   d="scan'208";a="470079948"
Received: from palace.lip6.fr ([132.227.105.202])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/AES256-SHA256; 29 Sep 2020 15:57:40 +0200
From:   Julia Lawall <Julia.Lawall@inria.fr>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     =?UTF-8?q?Valdis=20Kl=C4=93tnieks?= <valdis.kletnieks@vt.edu>,
        Joe Perches <joe@perches.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        kernel-janitors@vger.kernel.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 02/20] media: em28xx-audio: use semicolons rather than commas to separate statements
Date:   Tue, 29 Sep 2020 15:14:25 +0200
Message-Id: <1601385283-26144-3-git-send-email-Julia.Lawall@inria.fr>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1601385283-26144-1-git-send-email-Julia.Lawall@inria.fr>
References: <1601385283-26144-1-git-send-email-Julia.Lawall@inria.fr>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Replace commas with semicolons.  Commas introduce unnecessary
variability in the code structure and are hard to see.  What is done
is essentially described by the following Coccinelle semantic patch
(http://coccinelle.lip6.fr/):

// <smpl>
@@ expression e1,e2; @@
e1
-,
+;
e2
... when any
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

---
 drivers/media/usb/em28xx/em28xx-audio.c |   14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/media/usb/em28xx/em28xx-audio.c b/drivers/media/usb/em28xx/em28xx-audio.c
index dc968fd5ace9..4d5ab1433b44 100644
--- a/drivers/media/usb/em28xx/em28xx-audio.c
+++ b/drivers/media/usb/em28xx/em28xx-audio.c
@@ -583,9 +583,9 @@ static int em28xx_cvol_new(struct snd_card *card, struct em28xx *dev,
 	struct snd_kcontrol_new tmp;
 
 	memset(&tmp, 0, sizeof(tmp));
-	tmp.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
-	tmp.private_value = id,
-	tmp.name  = ctl_name,
+	tmp.iface = SNDRV_CTL_ELEM_IFACE_MIXER;
+	tmp.private_value = id;
+	tmp.name  = ctl_name;
 
 	/* Add Mute Control */
 	sprintf(ctl_name, "%s Switch", name);
@@ -600,16 +600,16 @@ static int em28xx_cvol_new(struct snd_card *card, struct em28xx *dev,
 		ctl_name, id);
 
 	memset(&tmp, 0, sizeof(tmp));
-	tmp.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
-	tmp.private_value = id,
-	tmp.name  = ctl_name,
+	tmp.iface = SNDRV_CTL_ELEM_IFACE_MIXER;
+	tmp.private_value = id;
+	tmp.name  = ctl_name;
 
 	/* Add Volume Control */
 	sprintf(ctl_name, "%s Volume", name);
 	tmp.get   = em28xx_vol_get;
 	tmp.put   = em28xx_vol_put;
 	tmp.info  = em28xx_vol_info;
-	tmp.tlv.p = em28xx_db_scale,
+	tmp.tlv.p = em28xx_db_scale;
 	kctl = snd_ctl_new1(&tmp, dev);
 	err = snd_ctl_add(card, kctl);
 	if (err < 0)

