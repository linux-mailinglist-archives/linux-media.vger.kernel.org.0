Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1FBF0E074A
	for <lists+linux-media@lfdr.de>; Tue, 22 Oct 2019 17:27:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732288AbfJVP1K (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Oct 2019 11:27:10 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:35813 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726847AbfJVP1F (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Oct 2019 11:27:05 -0400
Received: from localhost.localdomain (lfbn-1-17395-211.w86-250.abo.wanadoo.fr [86.250.200.211])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id 38495240010;
        Tue, 22 Oct 2019 15:27:03 +0000 (UTC)
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@googlegroups.com
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Jonas Karlman <jonas@kwiboo.se>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [PATCH v9 2/5] media: cedrus: Remove unnecessary parenthesis around DIV_ROUND_UP
Date:   Tue, 22 Oct 2019 17:26:51 +0200
Message-Id: <20191022152654.1999355-3-paul.kocialkowski@bootlin.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191022152654.1999355-1-paul.kocialkowski@bootlin.com>
References: <20191022152654.1999355-1-paul.kocialkowski@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

DIV_ROUND_UP's first argument doesn't need to be wrapped in parenthesis
since that is already being taken care of in the macro's definition.

Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
---
 drivers/staging/media/sunxi/cedrus/cedrus_regs.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_regs.h b/drivers/staging/media/sunxi/cedrus/cedrus_regs.h
index f9dd8cbf3458..21676a1797f1 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_regs.h
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_regs.h
@@ -101,9 +101,9 @@
 #define VE_DEC_MPEG_PICCODEDSIZE		(VE_ENGINE_DEC_MPEG + 0x08)
 
 #define VE_DEC_MPEG_PICCODEDSIZE_WIDTH(w) \
-	SHIFT_AND_MASK_BITS(DIV_ROUND_UP((w), 16), 15, 8)
+	SHIFT_AND_MASK_BITS(DIV_ROUND_UP(w, 16), 15, 8)
 #define VE_DEC_MPEG_PICCODEDSIZE_HEIGHT(h) \
-	SHIFT_AND_MASK_BITS(DIV_ROUND_UP((h), 16), 7, 0)
+	SHIFT_AND_MASK_BITS(DIV_ROUND_UP(h, 16), 7, 0)
 
 #define VE_DEC_MPEG_PICBOUNDSIZE		(VE_ENGINE_DEC_MPEG + 0x0c)
 
-- 
2.23.0

