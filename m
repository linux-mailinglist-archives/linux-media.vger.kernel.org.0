Return-Path: <linux-media+bounces-33799-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 917A5ACA4BB
	for <lists+linux-media@lfdr.de>; Mon,  2 Jun 2025 02:15:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 80A8E188BDBF
	for <lists+linux-media@lfdr.de>; Mon,  2 Jun 2025 00:12:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80D6929B8DA;
	Sun,  1 Jun 2025 23:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fRzGZsau"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0445267B89;
	Sun,  1 Jun 2025 23:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748820854; cv=none; b=gwVmwqE9QtUT5TqtoRRjpLQ9JKQzpeO67Ipd5GFWBZYVjGY6mtxDku3QlNA6i4po57rujhrvrnX4iMLrHEW2aKmDLO4z4EjwZmpbZKnvcLsSQPACh6Rv9z6Rg0cQTDtg+kZaDDWXwJJaGyrj40fnSFZqaKu72kZHzkGTTMN+LXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748820854; c=relaxed/simple;
	bh=Dn2pn4NiS+BkWT1zOeO+GSzc0LYt7G/1bEh31uvW9XQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=F3O7TMgKTiZTgQoVIqWY9DJ4Pjp8tr55kzRMR8LdhHaPhxYjeI2PQIsQsKTC+CSpOTKP7LENkpetkql+UmXO4xvRpMcR9rXLzDnFGBbs2HrXqnnKfipucEGnsEfN8fBR1S5CxWbDU8E5ty2klhoXqd7vkJmG67YXSe6S8NOJXSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fRzGZsau; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D99FC4CEE7;
	Sun,  1 Jun 2025 23:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748820854;
	bh=Dn2pn4NiS+BkWT1zOeO+GSzc0LYt7G/1bEh31uvW9XQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fRzGZsau9PZx0eKycxks5TmHg9crwzqqQ/6ZaBjqe3bV1ZHqMUx1B7qHyac4PBJAG
	 NZt0r0kpGvAtxRktGDrTmgH4Ek/T699jTXark1+d0emI/6SgDdNAXQNSDMkhSWd5Px
	 ZNvBPkTLbDyVKDRyKwLRkfUxO94VNHBCF0uqv1nqBDc56+zI4Sb66iOA95UfiJGADc
	 Av9yttQgv7ASP9uGO05pz2o5BpCMXDweixf75D4rOJQJnZ6ikBkYADZWwrLH0fKwA8
	 GuDtoHtqLbGSfzXoUSO9O5/V7nsthWr86ZMzYNUqQcJS59kedgkJIgPS/ewnuujuAx
	 xxiVaeL3vsK2A==
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
Subject: [PATCH AUTOSEL 6.12 04/93] media: imx-jpeg: Check decoding is ongoing for motion-jpeg
Date: Sun,  1 Jun 2025 19:32:31 -0400
Message-Id: <20250601233402.3512823-4-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250601233402.3512823-1-sashal@kernel.org>
References: <20250601233402.3512823-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.31
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
index d579c804b0479..adb93e977be91 100644
--- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h
+++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h
@@ -89,6 +89,7 @@
 /* SLOT_STATUS fields for slots 0..3 */
 #define SLOT_STATUS_FRMDONE			(0x1 << 3)
 #define SLOT_STATUS_ENC_CONFIG_ERR		(0x1 << 8)
+#define SLOT_STATUS_ONGOING			(0x1 << 31)
 
 /* SLOT_IRQ_EN fields TBD */
 
diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
index b8c9bb017fb5f..ec24a33d03aac 100644
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


