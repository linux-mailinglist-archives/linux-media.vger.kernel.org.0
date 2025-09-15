Return-Path: <linux-media+bounces-42572-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3606CB58300
	for <lists+linux-media@lfdr.de>; Mon, 15 Sep 2025 19:11:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B95F61A2447B
	for <lists+linux-media@lfdr.de>; Mon, 15 Sep 2025 17:12:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 999A52D7397;
	Mon, 15 Sep 2025 17:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="lSNzQcwO";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Hm4E5TqD"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-b2-smtp.messagingengine.com (fhigh-b2-smtp.messagingengine.com [202.12.124.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A29272C08D4;
	Mon, 15 Sep 2025 17:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757956242; cv=none; b=QlOmaVU5A1OidTk6b3gzRCiUi/kUlzG48xPtZLVWSZe5x9LqWaH/7twHWtMdTK/NsccbYcZ2UP7GWmtP2QbAa2bqT5yqwDymVJPKEpuh9MuR7tNWRBBvE3L+nvKRj4ia9M9kzJQXEsIyZiLh02piLyATzWi4ZzDxLawT0HaWE10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757956242; c=relaxed/simple;
	bh=SS5LQRIEDoqDDL5IhsqFIlLgwRllsQKu+iYkbcFEqGk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Xl8hLWZKsFJCMXB+/FEq74y4UDdOiphpEiXXa16es8Z+PbjNpUFI/OSiHJlGe2wr8kalUcbmNcK68jrlb19W0+doY8GQrkTlE+YMYcdDL+AIVZ7Rv1TEn16N0GTYBHpRwC7NCur1b3kBZ44vBy3ydRip9q4+HPltUIu9BsWig6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=lSNzQcwO; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Hm4E5TqD; arc=none smtp.client-ip=202.12.124.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 8E5867A0188;
	Mon, 15 Sep 2025 13:10:39 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Mon, 15 Sep 2025 13:10:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1757956239;
	 x=1758042639; bh=6mefLAI9ROKPMRAZVtJzEGzrw1zhU0SiVOplEIuy5WA=; b=
	lSNzQcwOHrHqwVv1ERl9ZEVabQ0I/IjcptNlkajQer+uRCFrzrTOK0LW3qCLyEc0
	T7W/kuWuyd/UivHspu7uXlGNn8ZOp0Bcf6/omt9l3m7W8wi2ijsww5gKVzChHUAX
	PCQw7OaTcTiaMRLYj4Mfu44B9/cooP0wVq1alsxpEUXPrEFjkzijqI4Nl73hrcZy
	/L3S/tsNRBdOSa8iYuCKF7rLI65vO8E4k98CTbhXgge4m5b9MpKNAq8WGer8SGX6
	BFuOFIpVeBPfdMAg3rOQq0kiQL+dafg7IazqS2nohloVnBguKjxRpHJXc2iAeyTo
	XBFr5VAxAXnZ2/bnD0LLcA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1757956239; x=
	1758042639; bh=6mefLAI9ROKPMRAZVtJzEGzrw1zhU0SiVOplEIuy5WA=; b=H
	m4E5TqDhj8lkc4r/iV6nO5MTuVQUGZIpq1bZpgbIa+Xzs4jNNBPai9WtFzcDgwid
	WiMMCiKLavsLKlTaFOF0aSJoBxAtKeQ2rXjqaw78DMaB+CFsxz2tEERezJm1Zhei
	9MjNE2a2bHVNqHUlEa5DFiHVLtVskec1KAdLN3GSjxUwLORYyaKFO4nAi85oLjVG
	KvA86Zq83oav1M0Gs994ZPLbPkbV8M/5q9iIiv3NRNJy9AcofkjmYCl0TYxur6aD
	YjmhLwv0m3u6lMYcnsis1yXozapMkTCiY88iksBFJteH+t/PkErkW3QaHV5mTUUX
	b+NCAlWdfW0M78vmWk5pw==
X-ME-Sender: <xms:j0jIaLse-kPU5y6jHo3D-i-MJhQ0MixGiPZ51ueFGIeJTETzEnFFfw>
    <xme:j0jIaEFzWZs4P7Mi_gM6wR5cwZkXfYJIjEmv_dXmHP7tg3fYYBgJa0dIRnKx4D7wB
    0khI7-ohTGewhVtJTA>
X-ME-Received: <xmr:j0jIaMZz964m87JDRN3bz3J4nkB36GFMVTW9ILgQEqS6DrGAPex2wXjewKbEEjMUgN1NcCfwHv5ILSNRQQi2A6wQ_Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdefkedviecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomheppfhikhhlrghs
    ucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvghsrg
    hssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthhtvghrnhepheeigfeuveeutdef
    hfehgeekvedtleeuueekveefudehhffhjeffgfegffelfeegnecuvehluhhsthgvrhfuih
    iivgepudenucfrrghrrghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhsohguvghrlhhu
    nhgusehrrghgnhgrthgvtghhrdhsvgdpnhgspghrtghpthhtohepjedpmhhouggvpehsmh
    htphhouhhtpdhrtghpthhtohepmhgthhgvhhgrsgeskhgvrhhnvghlrdhorhhgpdhrtghp
    thhtohepjhgrtghophhordhmohhnughisehiuggvrghsohhnsghorghrugdrtghomhdprh
    gtphhtthhopehlrghurhgvnhhtrdhpihhntghhrghrthesihguvggrshhonhgsohgrrhgu
    rdgtohhmpdhrtghpthhtoheplhhinhhugidqmhgvughirgesvhhgvghrrdhkvghrnhgvlh
    drohhrghdprhgtphhtthhopehlihhnuhigqdhrvghnvghsrghsqdhsohgtsehvghgvrhdr
    khgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrh
    drkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnhhikhhlrghsrdhsohguvghrlhhunhgu
    odhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvg
X-ME-Proxy: <xmx:j0jIaEXtdNPffLR10njjKoQq7irB-vdJVym4mqLks1lYrmXpH4kYqQ>
    <xmx:j0jIaCkiehxBa2Uswa1UrV76jj71ea2MaMI4oYzH5dU10ZsIr86M4A>
    <xmx:j0jIaPDvuw6H4gLmklshtUBMhEjSib0ZpgAcyex5gZ3M_oAAoJUkgg>
    <xmx:j0jIaBjHjlGRR09PoeBzPb_1xDwsEPJfH2z1_zKxYJ3t6kOnyqDl_w>
    <xmx:j0jIaD2s0aHc5SeAw24sJw8XJI6atL6bMSbT58NwR3JsXKfgWpceXHgq>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 15 Sep 2025 13:10:38 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v2 06/12] media: rppx1: Add support for Histogram Measurement
Date: Mon, 15 Sep 2025 19:07:37 +0200
Message-ID: <20250915170743.106249-7-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250915170743.106249-1-niklas.soderlund+renesas@ragnatech.se>
References: <20250915170743.106249-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Extend the RPPX1 driver to allow setting the Histogram configuration
using the RkISP1 parameter buffer format. It uses the RPPX1 framework for
parameters and  its writer abstraction to allow the user to control how
(and when) configuration is applied to the RPPX1.

As the RkISP1 parameters buffer have lower precision then the RPPX1
hardware the values needs to be scaled. The behavior matches the RkISP1
hardware.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 .../platform/dreamchip/rppx1/rpp_params.c     |   3 +
 .../platform/dreamchip/rppx1/rpp_stats.c      |   4 +
 .../platform/dreamchip/rppx1/rppx1_hist.c     | 173 ++++++++++++++++++
 3 files changed, 180 insertions(+)

diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_params.c b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
index bff525970478..15e476d2fa1c 100644
--- a/drivers/media/platform/dreamchip/rppx1/rpp_params.c
+++ b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
@@ -30,6 +30,9 @@ int rppx1_params_rkisp1(struct rppx1 *rpp, struct rkisp1_ext_params_cfg *cfg,
 		case RKISP1_EXT_PARAMS_BLOCK_TYPE_AWB_MEAS:
 			module = &rpp->post.wbmeas;
 			break;
+		case RKISP1_EXT_PARAMS_BLOCK_TYPE_HST_MEAS:
+			module = &rpp->post.hist;
+			break;
 		case RKISP1_EXT_PARAMS_BLOCK_TYPE_AEC_MEAS:
 			module = &rpp->pre1.exm;
 			break;
diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_stats.c b/drivers/media/platform/dreamchip/rppx1/rpp_stats.c
index d62b26e24cb0..059bd76ecf64 100644
--- a/drivers/media/platform/dreamchip/rppx1/rpp_stats.c
+++ b/drivers/media/platform/dreamchip/rppx1/rpp_stats.c
@@ -16,6 +16,10 @@ void rppx1_stats_fill_isr(struct rppx1 *rpp, u32 isc, void *buf)
 		if (!rpp_module_call(&rpp->post.wbmeas, stats_rkisp1, &stats->params))
 			stats->meas_type |= RKISP1_CIF_ISP_STAT_AWB;
 
+	if (isc & RPPX1_IRQ_ID_POST_HIST_MEAS)
+		if (!rpp_module_call(&rpp->post.hist, stats_rkisp1, &stats->params))
+			stats->meas_type |= RKISP1_CIF_ISP_STAT_HIST;
+
 	if (isc & RPPX1_IRQ_ID_PRE1_EXM)
 		if (!rpp_module_call(&rpp->pre1.exm, stats_rkisp1, &stats->params))
 			stats->meas_type |= RKISP1_CIF_ISP_STAT_AUTOEXP;
diff --git a/drivers/media/platform/dreamchip/rppx1/rppx1_hist.c b/drivers/media/platform/dreamchip/rppx1/rppx1_hist.c
index cab498ece5a8..40ae8dc72b90 100644
--- a/drivers/media/platform/dreamchip/rppx1/rppx1_hist.c
+++ b/drivers/media/platform/dreamchip/rppx1/rppx1_hist.c
@@ -25,6 +25,9 @@
 
 #define HIST_LAST_MEAS_LINE_REG			0x0010
 #define HIST_SUBSAMPLING_REG			0x0014
+#define HIST_SUBSAMPLING_V_STEPSIZE(x)		(((x) & 0x7f) << 24)
+#define HIST_SUBSAMPLING_H_STEP_INC(x)		(((x) & 0x1ffff))
+
 #define HIST_COEFF_R_REG			0x0018
 #define HIST_COEFF_G_REG			0x001c
 #define HIST_COEFF_B_REG			0x0020
@@ -71,6 +74,176 @@ static int rppx1_hist_probe(struct rpp_module *mod)
 	return 0;
 }
 
+#define RPPX1_HIST_WEIGHT(v0, v1, v2, v3) \
+	(((v0) & 0x1f) | (((v1) & 0x1f) << 8)  | \
+	(((v2) & 0x1f) << 16) | \
+	(((v3) & 0x1f) << 24))
+
+static int rppx1_hist_param_rkisp1(struct rpp_module *mod,
+				   const union rppx1_params_rkisp1_config *block,
+				   rppx1_reg_write write, void *priv)
+{
+	const struct rkisp1_ext_params_hst_config *cfg = &block->hst;
+	const struct rkisp1_cif_isp_hst_config *arg = &cfg->config;
+	u32 h_offs, v_offs, h_size, v_size;
+	u8 mode, coeff[3];
+
+	/* If the modules is disabled, simply bypass it. */
+	if (cfg->header.flags & RKISP1_EXT_PARAMS_FL_BLOCK_DISABLE) {
+		write(priv, mod->base + HIST_MODE_REG,
+		      HIST_MODE_HIST_MODE_DISABLE);
+		return 0;
+	}
+
+	/* Sample after demosaicing. */
+	write(priv, mod->base + HIST_CHANNEL_SEL_REG, 7);
+
+	/*
+	 * The RkISP1 histogram_predivider setting controls the pixel spacing
+	 * between each sample. On RPPX1 there is greater control as both line
+	 * and pixel spacing can be controlled.  The RkISP1 stepsize register is
+	 * documented as.
+	 *
+	 *  0, 1, 3: not allowed
+	 *  3: process every third input pixel
+	 *  4: process every fourth input pixel
+	 *  127: process every 127th pixel
+	 *
+	 * The output bins are 16 bit (FP16.4) so to not overflow a divider
+	 * calculated as would be needed.
+	 *
+	 *  count = mode == RGB_COMBINED ? 3 : 1
+	 *  factor = vsize * hsize  * count / 65536
+	 *
+	 * However the libcamera user of the RkISP documents the setting as
+	 * applying to both h and v direction at the same time and calculates
+	 * the divider as,
+	 *
+	 *  count = mode == RGB_COMBINED ? 3 : 1
+	 *  factor = ceil(sqrt(vsize * hsize  * count / 65536))
+	 *
+	 * Real world usage is better then bad documentation, do the same here
+	 * and apply the divider in both directions.
+	 *
+	 * The RPPX1 h-stepping is also configured differently. Internally
+	 * there is a 16-bit counter and for each input pixel h_step_inc is
+	 * added to it. Every time it overflows the input pixel is sampled.
+	 *
+	 *  h_step_inc = 2**16 => sample every pixel
+	 *  h_step_inc = 2**15 => sample every other pixel
+	 *
+	 * Gives us the conversion to RkISP1 parameters of.
+	 *
+	 *  h_step_inc = 65536 / divider
+	 */
+	write(priv, mod->base + HIST_SUBSAMPLING_REG,
+	      HIST_SUBSAMPLING_V_STEPSIZE(arg->histogram_predivider) |
+	      HIST_SUBSAMPLING_H_STEP_INC(0x10000 / arg->histogram_predivider));
+
+	/*
+	 * Adjust and set measurement window to hardware limitations,
+	 * - Offsets must be even.
+	 * - Width and height must be divisible by 10.
+	 */
+	h_offs = arg->meas_window.h_offs & 0x1ffe;
+	v_offs = arg->meas_window.v_offs & 0x1ffe;
+	h_size = arg->meas_window.h_size - arg->meas_window.h_size % 10;
+	v_size = arg->meas_window.v_size - arg->meas_window.v_size % 10;
+
+	write(priv, mod->base + HIST_H_OFFS_REG, h_offs);
+	write(priv, mod->base + HIST_V_OFFS_REG, v_offs);
+	write(priv, mod->base + HIST_H_SIZE_REG, h_size / 5);
+	write(priv, mod->base + HIST_V_SIZE_REG, v_size / 5);
+
+	/* Set last measurement line for ready interrupt. */
+	write(priv, mod->base + HIST_LAST_MEAS_LINE_REG,
+	      v_offs + v_size + 1);
+
+	/* NOTE: Keep the default full sample range. */
+
+	/* Set measurement window weights. */
+	write(priv, mod->base + HIST_WEIGHT_00TO30_REG,
+	      RPPX1_HIST_WEIGHT(arg->hist_weight[0], arg->hist_weight[1],
+				arg->hist_weight[2], arg->hist_weight[3]));
+	write(priv, mod->base + HIST_WEIGHT_40TO21_REG,
+	      RPPX1_HIST_WEIGHT(arg->hist_weight[4], arg->hist_weight[5],
+				arg->hist_weight[6], arg->hist_weight[7]));
+	write(priv, mod->base + HIST_WEIGHT_31TO12_REG,
+	      RPPX1_HIST_WEIGHT(arg->hist_weight[8], arg->hist_weight[9],
+				arg->hist_weight[10], arg->hist_weight[11]));
+	write(priv, mod->base + HIST_WEIGHT_22TO03_REG,
+	      RPPX1_HIST_WEIGHT(arg->hist_weight[12], arg->hist_weight[13],
+				arg->hist_weight[14], arg->hist_weight[15]));
+	write(priv, mod->base + HIST_WEIGHT_13TO43_REG,
+	      RPPX1_HIST_WEIGHT(arg->hist_weight[16], arg->hist_weight[17],
+				arg->hist_weight[18], arg->hist_weight[19]));
+	write(priv, mod->base + HIST_WEIGHT_04TO34_REG,
+	      RPPX1_HIST_WEIGHT(arg->hist_weight[20], arg->hist_weight[21],
+				arg->hist_weight[22], arg->hist_weight[23]));
+	write(priv, mod->base + HIST_WEIGHT_44_REG,
+	      RPPX1_HIST_WEIGHT(arg->hist_weight[24], 0, 0, 0));
+
+	/* Translate RkISP1 modes. */
+	mode = HIST_MODE_HIST_MODE_YRGB;
+	switch (arg->mode) {
+	case RKISP1_CIF_ISP_HISTOGRAM_MODE_RGB_COMBINED:
+		/* L = R + G + B */
+		coeff[0] = 0x80;
+		coeff[1] = 0x80;
+		coeff[2] = 0x80;
+		break;
+	case RKISP1_CIF_ISP_HISTOGRAM_MODE_R_HISTOGRAM:
+		/* L = R */
+		coeff[0] = 0x80;
+		coeff[1] = 0x00;
+		coeff[2] = 0x00;
+		break;
+	case RKISP1_CIF_ISP_HISTOGRAM_MODE_G_HISTOGRAM:
+		/* L = G */
+		coeff[0] = 0x00;
+		coeff[1] = 0x80;
+		coeff[2] = 0x00;
+		break;
+	case RKISP1_CIF_ISP_HISTOGRAM_MODE_B_HISTOGRAM:
+		coeff[0] = 0x00;
+		coeff[1] = 0x00;
+		coeff[2] = 0x80;
+		break;
+	case RKISP1_CIF_ISP_HISTOGRAM_MODE_Y_HISTOGRAM:
+		/* Coefficients for a BT.601 (from datasheet). */
+		coeff[0] = 38;
+		coeff[1] = 75;
+		coeff[2] = 15;
+		break;
+	default:
+		mode = HIST_MODE_HIST_MODE_DISABLE;
+		coeff[0] = 0x00;
+		coeff[1] = 0x00;
+		coeff[2] = 0x00;
+		break;
+	}
+
+	write(priv, mod->base + HIST_MODE_REG, mode);
+	write(priv, mod->base + HIST_COEFF_R_REG, coeff[0]);
+	write(priv, mod->base + HIST_COEFF_G_REG, coeff[1]);
+	write(priv, mod->base + HIST_COEFF_B_REG, coeff[2]);
+
+	write(priv, mod->base + HIST_FORCED_UPDATE_REG, 1);
+
+	return 0;
+}
+
+static int rppx1_hist_stats_rkisp1(struct rpp_module *mod,
+				   struct rkisp1_cif_isp_stat *stats)
+{
+	for (unsigned int i = 0; i < HIST_BIN_REG_NUM; i++)
+		stats->hist.hist_bins[i] = rpp_module_read(mod, HIST_BIN_REG(i)) & 0xfffff;
+
+	return 0;
+}
+
 const struct rpp_module_ops rppx1_hist_ops = {
 	.probe = rppx1_hist_probe,
+	.param_rkisp1 = rppx1_hist_param_rkisp1,
+	.stats_rkisp1 = rppx1_hist_stats_rkisp1,
 };
-- 
2.51.0


