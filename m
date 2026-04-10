Return-Path: <linux-media+bounces-58515-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0PWsNx++2GlVhggAu9opvQ
	(envelope-from <linux-media+bounces-58515-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 11:08:47 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A108E3D485B
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 11:08:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 36B90300A7EA
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 09:08:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 380D63BD63D;
	Fri, 10 Apr 2026 09:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ME37tV0d"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DF1D3B635C;
	Fri, 10 Apr 2026 09:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775812053; cv=none; b=b1yuNLiO5tpH6swcAnUq59jZ71BLNfxVdsFMYAtdsuJ/rvFTWmxQSpxldCHzE/lq9LLwb7iVGm/wpY6X2d4LEv6NyJZNCVWTccJOCnP2TJ0BFOIRR5Zng3QfuC5kzS+bi/qg2lEph+WJ/In71zTt802G5iIxZR6w1ElocuVq5Ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775812053; c=relaxed/simple;
	bh=Kt7rTgTt45aIyvtx41kgoun8nydMBxrHUD2+WVOFSgg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jzfQpSZwyuIv5cGJG3CLVRfCSflk4e7kfVvF6lCGkoYS+tN5p7K+7XRi6JrF15cHjWEQz1dqKO1Fc6YhjijpTP+JG21XLrHuTj+FwRIeh9eCkokGPo4KMqTef57YciBn97zhobnQoXI85XZOeEH44OsCdHDylgDigTbQ7cJDF9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ME37tV0d; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [103.176.47.184])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 06326236;
	Fri, 10 Apr 2026 11:06:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1775811961;
	bh=Kt7rTgTt45aIyvtx41kgoun8nydMBxrHUD2+WVOFSgg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ME37tV0dtFypI1n+hBTg2/5ehRzya0457v2ZdAOpt/zX63Ga0YtJAhmnizfzxqUUG
	 84IwgXhlbpRYj9h/d+Ha99XeU63K1WACE3BFa4HwyuCtrmMIGr4HGKlc7ezQ26rq9z
	 zzGuyggSVB40yyckvMf867Tj710qIk77HvT1PTpE=
From: Jai Luthra <jai.luthra+renesas@ideasonboard.com>
Date: Fri, 10 Apr 2026 14:35:45 +0530
Subject: [PATCH SQUASH v7 10/18] media: rppx1: hist: Expose channel
 selection
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260410-rppx1-v7-10-43cfc6b44f1f@ideasonboard.com>
References: <20260410-rppx1-v7-0-43cfc6b44f1f@ideasonboard.com>
In-Reply-To: <20260410-rppx1-v7-0-43cfc6b44f1f@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Marek Vasut <marek.vasut+renesas@mailbox.org>, 
 Jai Luthra <jai.luthra+renesas@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2362;
 i=jai.luthra+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=Kt7rTgTt45aIyvtx41kgoun8nydMBxrHUD2+WVOFSgg=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBp2L2A1ZBgYVauQQ77W1XniCvks3wHfAvRxFcdH
 /jiTX9jYVmJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCadi9gAAKCRBD3pH5JJpx
 RXbhD/9HJYjHDSpwyGQmlX1JTUaoBOjB4MMVZbOaJ5bEldj2baJuPeO5JMe2eYfjWGq+CDVLQcb
 kAtGQX49hVYXQ4v/sOVSzHKryeuVg3AQ/1wAoe6RuLf2zUZa4pYdQTqMf+vWp1/VCM01mpX9NAt
 or6J1Kn6mJZkFqrWiEExZYGgzF466Cz7VcPOpEpLvu16JFBmMiw62Ty/ejmRYJ4ClZjAE18h+u0
 i14cAR26Wv8EqFcOyANGVkx4KUvPsXalGDGQSoPvms44FS0xAW8DispjqyNARDE8p6+xGzg93tZ
 ygbeukbsnFXdAVSn69aS89tZqLeaWCow4g2tohHpwy00L62wrKByXGN2yc+0YxtZrVJ0A8RzyYx
 pifVOl0XiM3IPGCS/Ul/f+MgrBhtFv/TUskj9tgbVbGwejZw3xUXfbB4BGAcgXhkI14m8bupZOV
 hgk6P4vWsjJCGub4vjnGNj/UIGodnRisvv3WeMbKZOMrEEKpY3ZnLkVJ7jCUQY7lzHi1WEES9nG
 NPKH4JE09aFNdpHuxTzXMtcNbfV0GcG3ZtlWOW9DKssBFoUnm6kzE0rMzLRrcnYM73Sq8u4/EmJ
 +7PhCfwzdNTS8pkMmWSgd6t+/jjqmu33ZPeBnI2+kl9Qjv4CpGzmh3TFP7uCFxBBT1MjGF5AZFq
 uqs3lPhgfACAlGQ==
X-Developer-Key: i=jai.luthra+renesas@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58515-lists,linux-media=lfdr.de,renesas];
	FREEMAIL_TO(0.00)[kernel.org,ragnatech.se,glider.be,gmail.com,renesas.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jai.luthra@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A108E3D485B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The module supports selecting the sampling point (channel selector) in
the pipeline for histogram measurements.

Expose it in the uAPI and add support in the driver.

Note: This commit's changes will be squashed into the relevant uAPI and
driver commits. It is separate for now to ease review and highlight the
differences.

Signed-off-by: Jai Luthra <jai.luthra+renesas@ideasonboard.com>
---
 drivers/media/platform/dreamchip/rppx1/rppx1_hist.c | 5 +++--
 include/uapi/linux/media/dreamchip/rppx1-config.h   | 2 ++
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/dreamchip/rppx1/rppx1_hist.c b/drivers/media/platform/dreamchip/rppx1/rppx1_hist.c
index 6287f9c401dfc8ee7f1c19acef1a3e82c5036ac7..76642d2ec0959969e10a92be49c3b0995a0ea5b4 100644
--- a/drivers/media/platform/dreamchip/rppx1/rppx1_hist.c
+++ b/drivers/media/platform/dreamchip/rppx1/rppx1_hist.c
@@ -94,8 +94,9 @@ static int rppx1_hist_fill_params(struct rpp_module *mod,
 		return 0;
 	}
 
-	/* Sample after demosaicing. */
-	write(priv, mod->base + HIST_CHANNEL_SEL_REG, 7);
+	/* Select sample point */
+	write(priv, mod->base + HIST_CHANNEL_SEL_REG,
+	      cfg->channel_sel & HIST_CHANNEL_SEL_CHANNEL_SELECT_MASK);
 
 	/*
 	 * The RkISP1 histogram_predivider setting controls the pixel spacing
diff --git a/include/uapi/linux/media/dreamchip/rppx1-config.h b/include/uapi/linux/media/dreamchip/rppx1-config.h
index 2adf5f9e083b89c0308a8728f8468f326ab87c48..b247312cfde41510c6d678cb6482a3b22b9036b5 100644
--- a/include/uapi/linux/media/dreamchip/rppx1-config.h
+++ b/include/uapi/linux/media/dreamchip/rppx1-config.h
@@ -593,6 +593,7 @@ enum rppx1_histogram_mode {
  * @header: block header (type = RPPX1_PARAMS_BLOCK_TYPE_HST_MEAS)
  * @mode: histogram mode (from enum rppx1_histogram_mode)
  * @histogram_predivider: process every Nth pixel
+ * @channel_sel: measurement point (see enum rppx1_[pre|post]_meas_chan)
  * @meas_window: measurement window coordinates
  * @hist_weight: weighting factors for sub-windows (5x5 grid)
  */
@@ -600,6 +601,7 @@ struct rppx1_params_hst_config {
 	struct v4l2_isp_params_block_header header;
 	__u32 mode;
 	__u8 histogram_predivider;
+	__u8 channel_sel;
 	struct rppx1_window meas_window;
 	__u8 hist_weight[RPPX1_HISTOGRAM_WEIGHT_GRIDS_SIZE];
 };

-- 
2.53.0


