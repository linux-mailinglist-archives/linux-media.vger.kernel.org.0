Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 690D63DFD42
	for <lists+linux-media@lfdr.de>; Wed,  4 Aug 2021 10:50:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236733AbhHDIu1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Aug 2021 04:50:27 -0400
Received: from smtp-relay-canonical-1.canonical.com ([185.125.188.121]:57546
        "EHLO smtp-relay-canonical-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236698AbhHDIu0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 4 Aug 2021 04:50:26 -0400
Received: from localhost (1.general.cking.uk.vpn [10.172.193.212])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id 462303F228;
        Wed,  4 Aug 2021 08:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1628067011;
        bh=uoN7wGE5rbSl+FPh+rcsfSGaxUcJTJN+JDTF5R0gekM=;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type;
        b=jyn93kzwWGLXLHY27T1HMAEijIkPHDbWXwQBg1JgY7wQkNTl6k19RoQElzmIQUQrb
         YEsIUp4CnAXP6dKplHJCY6hP+bkZjFo0Yb+QLtcVM8RSkP6qMAeG1hu/PsSNbJlULZ
         mACFEhde9r66wt6lNk170YzzEv5+oRp+zAFFOEGoTrIQ3f0I2/d7NP95eX22Cf06SZ
         7Tcmz4njUsqZq/oJFUBxajHsT57ixVYo0kDQ35X0tfpSHzflVpJ9NQCp8z4CG34PGW
         mg0Wks0Jgg63Jyo0UFN4fYcavkXRwF/qjfdeMRm434YIONzQf/lHwOE21jtEhmoq3A
         EK8FoQ/6bN5Gw==
From:   Colin King <colin.king@canonical.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Steven Toth <stoth@kernellabs.com>,
        "Igor M . Liplianin" <liplianin@netup.ru>,
        Mijhail Moreyra <mijhail.moreyra@gmail.com>,
        linux-media@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] media: cx23885: Fix snd_card_free call on null card pointer
Date:   Wed,  4 Aug 2021 09:50:10 +0100
Message-Id: <20210804085010.103607-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently a call to snd_card_new that fails will set card with a NULL
pointer, this causes a null pointer dereference on the error cleanup
path when card it passed to snd_card_free. Fix this by adding a new
error exit path that does not call snd_card_free and exiting via this
new path.

Addresses-Coverity: ("Explicit null dereference")
Fixes: 9e44d63246a9 ("[media] cx23885: Add ALSA support")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/media/pci/cx23885/cx23885-alsa.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/pci/cx23885/cx23885-alsa.c b/drivers/media/pci/cx23885/cx23885-alsa.c
index ab14d35214aa..25dc8d4dc5b7 100644
--- a/drivers/media/pci/cx23885/cx23885-alsa.c
+++ b/drivers/media/pci/cx23885/cx23885-alsa.c
@@ -550,7 +550,7 @@ struct cx23885_audio_dev *cx23885_audio_register(struct cx23885_dev *dev)
 			   SNDRV_DEFAULT_IDX1, SNDRV_DEFAULT_STR1,
 			THIS_MODULE, sizeof(struct cx23885_audio_dev), &card);
 	if (err < 0)
-		goto error;
+		goto error_msg;
 
 	chip = (struct cx23885_audio_dev *) card->private_data;
 	chip->dev = dev;
@@ -576,6 +576,7 @@ struct cx23885_audio_dev *cx23885_audio_register(struct cx23885_dev *dev)
 
 error:
 	snd_card_free(card);
+error_msg:
 	pr_err("%s(): Failed to register analog audio adapter\n",
 	       __func__);
 
-- 
2.31.1

