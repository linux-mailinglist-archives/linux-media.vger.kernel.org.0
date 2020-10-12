Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8C0C28C38F
	for <lists+linux-media@lfdr.de>; Mon, 12 Oct 2020 22:59:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731870AbgJLU7S (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Oct 2020 16:59:18 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:49884 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731696AbgJLU7A (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Oct 2020 16:59:00 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: aratiu)
        with ESMTPSA id 2C9261F44C44
From:   Adrian Ratiu <adrian.ratiu@collabora.com>
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Mark Brown <broonie@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Fruehberger Peter <Peter.Fruehberger@de.bosch.com>,
        kuhanh.murugasen.krishnan@intel.com,
        Daniel Vetter <daniel@ffwll.ch>, kernel@collabora.com,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 09/18] media: hantro: default regmap to relaxed MMIO
Date:   Mon, 12 Oct 2020 23:59:48 +0300
Message-Id: <20201012205957.889185-10-adrian.ratiu@collabora.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201012205957.889185-1-adrian.ratiu@collabora.com>
References: <20201012205957.889185-1-adrian.ratiu@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is done to match the pre-regmap membarrier behaviour, ensuring
default regmap_write calls in _relaxed() are indeed relaxed while
the non-relaxed versions include an explicit mem-barrier call.

Signed-off-by: Adrian Ratiu <adrian.ratiu@collabora.com>
---
 drivers/staging/media/hantro/hantro.h        | 4 ++++
 drivers/staging/media/hantro/hantro_regmap.c | 1 +
 2 files changed, 5 insertions(+)

diff --git a/drivers/staging/media/hantro/hantro.h b/drivers/staging/media/hantro/hantro.h
index c5425cd5ac84..5b7fbdc3779d 100644
--- a/drivers/staging/media/hantro/hantro.h
+++ b/drivers/staging/media/hantro/hantro.h
@@ -346,6 +346,7 @@ static inline void vepu_write_relaxed(struct hantro_dev *vpu,
 static inline void vepu_write(struct hantro_dev *vpu, u32 val, u32 reg)
 {
 	vpu_debug(6, "0x%04x = 0x%08x\n", reg / 4, val);
+	wmb(); /* flush encoder previous relaxed writes */
 	regmap_write(vpu->regs_enc, reg, val);
 }
 
@@ -354,6 +355,7 @@ static inline u32 vepu_read(struct hantro_dev *vpu, u32 reg)
 	u32 val;
 
 	regmap_read(vpu->regs_enc, reg, &val);
+	rmb(); /* read encoder swreg data in order */
 	vpu_debug(6, "0x%04x = 0x%08x\n", reg / 4, val);
 
 	return val;
@@ -369,6 +371,7 @@ static inline void vdpu_write_relaxed(struct hantro_dev *vpu,
 static inline void vdpu_write(struct hantro_dev *vpu, u32 val, u32 reg)
 {
 	vpu_debug(6, "0x%04x = 0x%08x\n", reg / 4, val);
+	wmb();/* flush decoder previous relaxed writes */
 	regmap_write(vpu->regs_dec, reg, val);
 }
 
@@ -377,6 +380,7 @@ static inline u32 vdpu_read(struct hantro_dev *vpu, u32 reg)
 	u32 val;
 
 	regmap_read(vpu->regs_dec, reg, &val);
+	rmb(); /* read decoder swreg data in order */
 	vpu_debug(6, "0x%04x = 0x%08x\n", reg / 4, val);
 
 	return val;
diff --git a/drivers/staging/media/hantro/hantro_regmap.c b/drivers/staging/media/hantro/hantro_regmap.c
index 890e443688e2..2fc409cbd797 100644
--- a/drivers/staging/media/hantro/hantro_regmap.c
+++ b/drivers/staging/media/hantro/hantro_regmap.c
@@ -21,6 +21,7 @@ struct regmap_config hantro_regmap_dec = {
 	.reg_stride = 4,
 	/* all hantro accesses are sequential, even with respect to irq ctx */
 	.disable_locking = true,
+	.use_relaxed_mmio = true,
 	.name = "hantro_regmap_dec",
 };
 
-- 
2.28.0

