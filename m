Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9E983E92B5
	for <lists+linux-media@lfdr.de>; Wed, 11 Aug 2021 15:31:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231477AbhHKNcR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Aug 2021 09:32:17 -0400
Received: from mail.ispras.ru ([83.149.199.84]:38170 "EHLO mail.ispras.ru"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229737AbhHKNcR (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Aug 2021 09:32:17 -0400
Received: from kleverstation.intra.ispras.ru (unknown [10.10.2.220])
        by mail.ispras.ru (Postfix) with ESMTPS id 5A612407625E;
        Wed, 11 Aug 2021 13:31:52 +0000 (UTC)
From:   Nadezda Lutovinova <lutovinova@ispras.ru>
To:     =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc:     Nadezda Lutovinova <lutovinova@ispras.ru>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org, ldv-project@linuxtesting.org
Subject: [PATCH] media: rcar-csi2: Add checking to rcsi2_start_receiver().
Date:   Wed, 11 Aug 2021 16:31:42 +0300
Message-Id: <20210811133142.13363-1-lutovinova@ispras.ru>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If rcsi2_code_to_fmt() return NULL,
then null pointer dereference occurs in the next cycle.
The patch adds checking if format is NULL.

Found by Linux Driver Verification project (linuxtesting.org).

Signed-off-by: Nadezda Lutovinova <lutovinova@ispras.ru>
---
 drivers/media/platform/rcar-vin/rcar-csi2.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/media/platform/rcar-vin/rcar-csi2.c b/drivers/media/platform/rcar-vin/rcar-csi2.c
index e28eff039688..55bb584d2a13 100644
--- a/drivers/media/platform/rcar-vin/rcar-csi2.c
+++ b/drivers/media/platform/rcar-vin/rcar-csi2.c
@@ -553,6 +553,12 @@ static int rcsi2_start_receiver(struct rcar_csi2 *priv)
 
 	/* Code is validated in set_fmt. */
 	format = rcsi2_code_to_fmt(priv->mf.code);
+	if (!format) {
+		dev_err(priv->dev,
+			"Incorrect mbus frame format code %u\n",
+			priv->mf.code);
+		return -EINVAL;
+	}
 
 	/*
 	 * Enable all supported CSI-2 channels with virtual channel and
-- 
2.17.1

