Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A8F863E96AD
	for <lists+linux-media@lfdr.de>; Wed, 11 Aug 2021 19:19:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230431AbhHKRUA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Aug 2021 13:20:00 -0400
Received: from mail.ispras.ru ([83.149.199.84]:39904 "EHLO mail.ispras.ru"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229976AbhHKRT7 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Aug 2021 13:19:59 -0400
Received: from kleverstation.intra.ispras.ru (unknown [10.10.2.220])
        by mail.ispras.ru (Postfix) with ESMTPS id BC28A400FC5B;
        Wed, 11 Aug 2021 17:19:33 +0000 (UTC)
From:   Nadezda Lutovinova <lutovinova@ispras.ru>
To:     =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc:     Nadezda Lutovinova <lutovinova@ispras.ru>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org, ldv-project@linuxtesting.org
Subject: [PATCH v2] media: rcar-csi2: Add checking to rcsi2_start_receiver()
Date:   Wed, 11 Aug 2021 20:18:16 +0300
Message-Id: <20210811171816.12012-1-lutovinova@ispras.ru>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <YRPUhqvcTxCVvnBG@oden.dyn.berto.se>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If rcsi2_code_to_fmt() return NULL, then null pointer dereference occurs 
in the next cycle. That should not be possible now but adding checking 
protects from future bugs.
The patch adds checking if format is NULL.

Found by Linux Driver Verification project (linuxtesting.org).

Signed-off-by: Nadezda Lutovinova <lutovinova@ispras.ru>
---
v2: fix subject and commit message, remove dev_err()
---
 drivers/media/platform/rcar-vin/rcar-csi2.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/rcar-vin/rcar-csi2.c b/drivers/media/platform/rcar-vin/rcar-csi2.c
index e28eff039688..d28f83f7698b 100644
--- a/drivers/media/platform/rcar-vin/rcar-csi2.c
+++ b/drivers/media/platform/rcar-vin/rcar-csi2.c
@@ -553,6 +553,8 @@ static int rcsi2_start_receiver(struct rcar_csi2 *priv)
 
 	/* Code is validated in set_fmt. */
 	format = rcsi2_code_to_fmt(priv->mf.code);
+	if (!format)
+		return -EINVAL;
 
 	/*
 	 * Enable all supported CSI-2 channels with virtual channel and
-- 
2.17.1

