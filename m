Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4FCDE1CCBE2
	for <lists+linux-media@lfdr.de>; Sun, 10 May 2020 17:14:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729242AbgEJPOi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 10 May 2020 11:14:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728762AbgEJPOh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 10 May 2020 11:14:37 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98030C061A0C;
        Sun, 10 May 2020 08:14:37 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id m24so5556528wml.2;
        Sun, 10 May 2020 08:14:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OyysxUp4XjcgsqI2Lfus556dLlr5fhri7TKgWrqmiJE=;
        b=qb0OGWexu2cHDt229RIuaammyh4YBvZZQ5yFQ34zvb7DmJHEISASUaV3F10i9spuge
         PeFpaIbgR75Ge1v/Xy9jvA8k7EudCWJ0H/rXfjl0kz/+dQ6EnkVAnexAjI+igxqPnd3u
         /+SCj/KyEPZEu6x6WDR66FUZModaorWk3lOtnhfAfPA2jZoimFZqOOvvvKoEIP+EsgWo
         11z+YBCsklt4cIlPMqlyiOlaUR6RdpJzdw0HqRWGZNyW66x4XPVbBJlL9HWZn5uCY0PH
         QK3wc2kQyb7edTGCm+1hMAEHKJJPbKd7NFRZHEwtqmyDk8+CkuSVCaecAmSaLfIU55UZ
         /Wzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OyysxUp4XjcgsqI2Lfus556dLlr5fhri7TKgWrqmiJE=;
        b=cnJa1L5Fq3N1Mgrn4yiLNqjiTxUzxnD2uBTxsbnI/bgIQX3lCkB3SjRaWji6fgaUVh
         ZG7f4A6JJ5fCB0QUjRief1rS+mVKn6dcAEovYdp05xpIMlUPg0wDmP1HFGiiTLzztkrt
         o+hXLz8oWRtRiMQapGdVuDDa7QkR+j8kLWB2NNVvHg6qaIiwFjchm8opV1ZemLy5rOlv
         1arIP0yjhmBlDFIYmRYDjTfT+9iSZ0txpKRH3A0y7Sf/8hJz8sv3HXTeGplm2k+D9Cj8
         Q0h2NINobrFAK+rr3cubzAjbdex7Pc2tjDTpeYGaWK2sgFI2IVV7gC8ErvxL7XSjaliC
         oMww==
X-Gm-Message-State: AGi0PubWYj0MS5d1o+gtJIYNdwiAMkTzZuMFhB12tVD1f8bcnLmOtE1A
        YYugmzptg6MhvMIsoWy4iO8=
X-Google-Smtp-Source: APiQypLLdc4lGN0pRsmfHFAo/Jd2cV7QfHwh3umlf/UMcLSrbBtkd/KW0StN+PjHbPwn1DCEEK+KUw==
X-Received: by 2002:a1c:9804:: with SMTP id a4mr2456741wme.80.1589123676201;
        Sun, 10 May 2020 08:14:36 -0700 (PDT)
Received: from skynet.lan (198.red-83-49-57.dynamicip.rima-tde.net. [83.49.57.198])
        by smtp.gmail.com with ESMTPSA id d133sm25176897wmc.27.2020.05.10.08.14.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2020 08:14:35 -0700 (PDT)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     computersforpeace@gmail.com, kdasu.kdev@gmail.com,
        miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
        sumit.semwal@linaro.org, linux-mtd@lists.infradead.org,
        bcm-kernel-feedback-list@broadcom.com,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Cc:     =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
Subject: [PATCH 1/3] nand: brcmnand: rename v4 registers
Date:   Sun, 10 May 2020 17:14:04 +0200
Message-Id: <20200510151406.2527856-1-noltari@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

These registers are also used on v3.3.

Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
---
 drivers/mtd/nand/raw/brcmnand/brcmnand.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.c b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
index e4e3ceeac38f..6a08dd07b058 100644
--- a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
+++ b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
@@ -338,8 +338,8 @@ enum brcmnand_reg {
 	BRCMNAND_FC_BASE,
 };
 
-/* BRCMNAND v4.0 */
-static const u16 brcmnand_regs_v40[] = {
+/* BRCMNAND v3.3-v4.0 */
+static const u16 brcmnand_regs_v33[] = {
 	[BRCMNAND_CMD_START]		=  0x04,
 	[BRCMNAND_CMD_EXT_ADDRESS]	=  0x08,
 	[BRCMNAND_CMD_ADDRESS]		=  0x0c,
@@ -591,8 +591,8 @@ static int brcmnand_revision_init(struct brcmnand_controller *ctrl)
 		ctrl->reg_offsets = brcmnand_regs_v60;
 	else if (ctrl->nand_version >= 0x0500)
 		ctrl->reg_offsets = brcmnand_regs_v50;
-	else if (ctrl->nand_version >= 0x0400)
-		ctrl->reg_offsets = brcmnand_regs_v40;
+	else if (ctrl->nand_version >= 0x0303)
+		ctrl->reg_offsets = brcmnand_regs_v33;
 
 	/* Chip-select stride */
 	if (ctrl->nand_version >= 0x0701)
-- 
2.26.2

