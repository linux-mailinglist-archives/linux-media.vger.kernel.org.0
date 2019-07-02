Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5C9B35D370
	for <lists+linux-media@lfdr.de>; Tue,  2 Jul 2019 17:49:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727198AbfGBPtR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Jul 2019 11:49:17 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:58388 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727197AbfGBPtQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 2 Jul 2019 11:49:16 -0400
Received: from turingmachine.home (unknown [IPv6:2804:431:c7f4:61e7:d711:794d:1c68:5ed3])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tonyk)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 0C43A28631D;
        Tue,  2 Jul 2019 16:49:10 +0100 (BST)
From:   =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     mchehab@kernel.org, hverkuil@xs4all.nl, helen.koike@collabora.com,
        kernel@collabora.com, linux-kernel@vger.kernel.org,
        =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@collabora.com>
Subject: [PATCH 5/7] media: vimc: core: Add output device on the pipeline
Date:   Tue,  2 Jul 2019 12:47:50 -0300
Message-Id: <20190702154752.14939-6-andrealmeid@collabora.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190702154752.14939-1-andrealmeid@collabora.com>
References: <20190702154752.14939-1-andrealmeid@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add the output video device on the hardcoded pipeline. Change the link
to it be enabled by default.

Signed-off-by: André Almeida <andrealmeid@collabora.com>
---
 drivers/media/platform/vimc/vimc-core.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/vimc/vimc-core.c b/drivers/media/platform/vimc/vimc-core.c
index 571c55aa0e16..ecdea1d631c5 100644
--- a/drivers/media/platform/vimc/vimc-core.c
+++ b/drivers/media/platform/vimc/vimc-core.c
@@ -95,8 +95,7 @@ static const struct vimc_ent_config ent_config[] = {
 	},
 	{
 		.name = "RGB/YUV Input",
-		/* TODO: change this to vimc-input when it is implemented */
-		.drv = "vimc-sensor",
+		.drv = "vimc-output",
 	},
 	{
 		.name = "Scaler",
@@ -118,11 +117,11 @@ static const struct vimc_ent_link ent_links[] = {
 	/* Link: Sensor B (Pad 0)->(Pad 0) Raw Capture 1 */
 	VIMC_ENT_LINK(1, 0, 5, 0, MEDIA_LNK_FL_ENABLED | MEDIA_LNK_FL_IMMUTABLE),
 	/* Link: Debayer A (Pad 1)->(Pad 0) Scaler */
-	VIMC_ENT_LINK(2, 1, 7, 0, MEDIA_LNK_FL_ENABLED),
+	VIMC_ENT_LINK(2, 1, 7, 0, 0),
 	/* Link: Debayer B (Pad 1)->(Pad 0) Scaler */
 	VIMC_ENT_LINK(3, 1, 7, 0, 0),
 	/* Link: RGB/YUV Input (Pad 0)->(Pad 0) Scaler */
-	VIMC_ENT_LINK(6, 0, 7, 0, 0),
+	VIMC_ENT_LINK(6, 0, 7, 0, MEDIA_LNK_FL_ENABLED | MEDIA_LNK_FL_IMMUTABLE),
 	/* Link: Scaler (Pad 1)->(Pad 0) RGB/YUV Capture */
 	VIMC_ENT_LINK(7, 1, 8, 0, MEDIA_LNK_FL_ENABLED | MEDIA_LNK_FL_IMMUTABLE),
 };
-- 
2.22.0

