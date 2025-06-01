Return-Path: <linux-media+bounces-33817-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 22630ACA592
	for <lists+linux-media@lfdr.de>; Mon,  2 Jun 2025 02:33:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1B1103ADE95
	for <lists+linux-media@lfdr.de>; Mon,  2 Jun 2025 00:32:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5DA73080A4;
	Sun,  1 Jun 2025 23:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RZihP9FW"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF6C9297434;
	Sun,  1 Jun 2025 23:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748821070; cv=none; b=uARk1Hxqn4uUeLZEbbiLxZS/xa2C1DKFJuZvKn6SZmGp/748LjlTpBA7ikdNO9giSBD18B5noxQnvL5Y5EaZD68FU9iE9OKCoHAROEV91D6jGGj/tr4pe/Lkwez1dZAeOBDDLlFCOTQ71zuNJmY+psZyzGo39ZKzdckTcA0trfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748821070; c=relaxed/simple;
	bh=zv8ZRgZq/0dbeugcXHWe2rbJBNGGL580SzsO5M2Zk1g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YlQpYGjCTLY/4zcEqjBatgPos3+whMMCpEvD0T6GbOyuThz9cwqU5Bf5Nao5gyT+JZDRigTVT/x4C1JcKZNMqWfsZneWRl1Mmz/WqxXNQbrup0d5GBMm2oB0V80gV02jFvpJwJGeOFmrtIMFiiWo1qkGn9czPNcWT53nXUDxH8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RZihP9FW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56C97C4CEE7;
	Sun,  1 Jun 2025 23:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748821069;
	bh=zv8ZRgZq/0dbeugcXHWe2rbJBNGGL580SzsO5M2Zk1g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RZihP9FWUysey/C1EjoNNxvzzu3p7Btz9ZxoD0AWYmkqmG7RuZwhXiVlAnG3hr4og
	 nTuFEmHc66t6/MyusFkgVmMhz1FEOxcJVYqgZ56glZV/IBWuxA9IM7mv30SPcbkLKl
	 7/2QH37bk9A4N8JF/mgojZK699Zeh5EZM9RrbdkjdHUJ9NbDkHYqy2BVa0ORwcqcMB
	 Lio+kbQS7AE4dhDBYuIk3arRNdprXr51owA/rTreqGfFIZ4hW+CQvbTubNmrxVGwNx
	 FdEVd2PD2Axpal+A/ShAq7pFunl+HZ78WBfDZruEitv6nqsxfiGEi0VjrruEmnMrkI
	 PlPK1AFZ4btZA==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Ming Qian <ming.qian@oss.nxp.com>,
	Frank Li <Frank.Li@nxp.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Sasha Levin <sashal@kernel.org>,
	mirela.rabulea@nxp.com,
	mchehab@kernel.org,
	shawnguo@kernel.org,
	imx@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 6.6 02/66] media: imx-jpeg: Check decoding is ongoing for motion-jpeg
Date: Sun,  1 Jun 2025 19:36:39 -0400
Message-Id: <20250601233744.3514795-2-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250601233744.3514795-1-sashal@kernel.org>
References: <20250601233744.3514795-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.92
Content-Transfer-Encoding: 8bit

From: Ming Qian <ming.qian@oss.nxp.com>

[ Upstream commit fd5b6cd730676940df63b0970bb1ba30bca1aac3 ]

As the first frame in "repeat-mode" is the pattern, the pattern done
interrupt is ignored by the driver. With small resolution bitstreams,
the interrupts might fire too quickly and hardware combine two irqs to
once because irq handle have latency. Thus the driver might miss the
frame decode done interrupt from the first actual frame.

In order to avoid the driver wait for the frame done interrupt that has
been combined to the pattern done interrupt and been ignored, driver
will check the curr_desc and slot_status registers to figure out if the
decoding of actual frame is finished or not.

Firstly we check the curr_desc register,
- if it is still pointing to the pattern descriptor, the second actual
frame is not started, we can wait for its frame-done interrupt.
- if the curr_desc has pointed to the frame descriptor, then we check the
ongoing bit of slot_status register.
- if the ongoing bit is set to 1, the decoding of the actual frame is not
finished, we can wait for its frame-done interrupt.
- if the ongoing bit is set to 0, the decoding of the actual frame is
finished, we can't wait for the second interrupt, but mark it as done.

But there is still a small problem, that the curr_desc and slot_status
registers are not synchronous. curr_desc is updated when the
next_descpt_ptr is loaded, but the ongoing bit of slot_status is set
after the 32 bytes descriptor is loaded, there will be a short time
interval in between, which may cause fake false. Consider read register
is quite slow compared with IP read 32byte from memory, read twice
slot_status can avoid this situation.

Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

Based on my analysis of both the commit message and code changes, here
is my determination: **YES** This commit should be backported to stable
kernel trees for the following reasons: 1. **Fixes a real bug causing
driver hangs**: The commit addresses a specific issue where the driver
can wait indefinitely for an interrupt that has already been combined
with a previous ignored interrupt. This causes the driver to hang,
making the hardware unusable for motion-JPEG decoding with small
resolution bitstreams. 2. **Clear bug fix with minimal changes**: The
fix is targeted and minimal - it adds one new function
(`mxc_dec_is_ongoing()`) and modifies one condition in the IRQ handler.
The changes are well-contained within the imx-jpeg driver with no impact
on other subsystems. 3. **Hardware-specific race condition**: The commit
addresses a hardware behavior where interrupts can be combined when they
fire too quickly. This is a real issue that affects users of the i.MX8
JPEG hardware decoder, particularly when processing small resolution
motion-JPEG streams. 4. **No architectural changes**: The fix doesn't
introduce any new features or change the driver's architecture. It
simply adds additional state checking to handle a specific hardware race
condition. 5. **Low regression risk**: The changes are defensive - they
add additional checks before proceeding rather than changing existing
behavior. The worst case would be that the new checks might not catch
all edge cases, but they won't break existing working scenarios. 6.
**Similar to other backported commits**: Looking at the similar commits
marked as "YES" for backporting (like "media: imx-jpeg: Disable slot
interrupt when frame done"), this follows the same pattern of fixing
specific hardware issues that cause system problems. The commit
specifically fixes a condition where the driver becomes stuck waiting
for an interrupt that will never come, which is exactly the kind of bug
that stable kernels should fix to ensure reliable operation of hardware.

 .../media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h |  1 +
 .../media/platform/nxp/imx-jpeg/mxc-jpeg.c    | 31 ++++++++++++++++++-
 2 files changed, 31 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h
index a2b4fb9e29e7d..cbb2de369838c 100644
--- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h
+++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h
@@ -89,6 +89,7 @@
 /* SLOT_STATUS fields for slots 0..3 */
 #define SLOT_STATUS_FRMDONE			(0x1 << 3)
 #define SLOT_STATUS_ENC_CONFIG_ERR		(0x1 << 8)
+#define SLOT_STATUS_ONGOING			(0x1 << 31)
 
 /* SLOT_IRQ_EN fields TBD */
 
diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
index 092d83b7e7954..3b789e0ebdf46 100644
--- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
+++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
@@ -877,6 +877,34 @@ static u32 mxc_jpeg_get_plane_size(struct mxc_jpeg_q_data *q_data, u32 plane_no)
 	return size;
 }
 
+static bool mxc_dec_is_ongoing(struct mxc_jpeg_ctx *ctx)
+{
+	struct mxc_jpeg_dev *jpeg = ctx->mxc_jpeg;
+	u32 curr_desc;
+	u32 slot_status;
+
+	curr_desc = readl(jpeg->base_reg + MXC_SLOT_OFFSET(ctx->slot, SLOT_CUR_DESCPT_PTR));
+	if (curr_desc == jpeg->slot_data.cfg_desc_handle)
+		return true;
+
+	slot_status = readl(jpeg->base_reg + MXC_SLOT_OFFSET(ctx->slot, SLOT_STATUS));
+	if (slot_status & SLOT_STATUS_ONGOING)
+		return true;
+
+	/*
+	 * The curr_desc register is updated when next_descpt_ptr is loaded,
+	 * the ongoing bit of slot_status is set when the 32 bytes descriptor is loaded.
+	 * So there will be a short time interval in between, which may cause fake false.
+	 * Consider read register is quite slow compared with IP read 32byte from memory,
+	 * read twice slot_status can avoid this situation.
+	 */
+	slot_status = readl(jpeg->base_reg + MXC_SLOT_OFFSET(ctx->slot, SLOT_STATUS));
+	if (slot_status & SLOT_STATUS_ONGOING)
+		return true;
+
+	return false;
+}
+
 static irqreturn_t mxc_jpeg_dec_irq(int irq, void *priv)
 {
 	struct mxc_jpeg_dev *jpeg = priv;
@@ -946,7 +974,8 @@ static irqreturn_t mxc_jpeg_dec_irq(int irq, void *priv)
 		mxc_jpeg_enc_mode_go(dev, reg, mxc_jpeg_is_extended_sequential(q_data->fmt));
 		goto job_unlock;
 	}
-	if (jpeg->mode == MXC_JPEG_DECODE && jpeg_src_buf->dht_needed) {
+	if (jpeg->mode == MXC_JPEG_DECODE && jpeg_src_buf->dht_needed &&
+	    mxc_dec_is_ongoing(ctx)) {
 		jpeg_src_buf->dht_needed = false;
 		dev_dbg(dev, "Decoder DHT cfg finished. Start decoding...\n");
 		goto job_unlock;
-- 
2.39.5


