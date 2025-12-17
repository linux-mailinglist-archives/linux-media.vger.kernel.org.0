Return-Path: <linux-media+bounces-48959-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FDA3CC6708
	for <lists+linux-media@lfdr.de>; Wed, 17 Dec 2025 08:55:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EC19230349A1
	for <lists+linux-media@lfdr.de>; Wed, 17 Dec 2025 07:55:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 966D0340280;
	Wed, 17 Dec 2025 07:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=emfend.at header.i=@emfend.at header.b="auuFKmw4"
X-Original-To: linux-media@vger.kernel.org
Received: from lx20.hoststar.hosting (lx20.hoststar.hosting [168.119.41.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB01633F8C9;
	Wed, 17 Dec 2025 07:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.41.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765956790; cv=none; b=gM9WP8mXKWs1mDSLHyfLFQosoiGw8FNFMy/oBgPIGPYSSpYw+pn6L0E3+w+s7mXpUjSLEVdSXASbPxi9lFSc1eG9NVUX/cACwtO/AWPEKTHs9lewqYjB99arQy3j2lteSxKhyLeYHkq8pqD0SSC3KGExJNgdizCBitPiPSvMKYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765956790; c=relaxed/simple;
	bh=pVpwmE4xF2oG0prtUMbMsJQkg6FQDpoWqQNP3Spbfoo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UXzw0OjobczxnLfI0OFHrjVmECcDYadvMEkvkliwkHQXx/TxXCSdDthjy466f7f1VizuBklne5Bp24tIf469XPtiQ0WWM3csuRCbXnegsaWgZPSMDy645gbn8HYc2qTKIyWTOMujA+VB9uwLcyEp94yuoQag/UKz0uamfkq4RyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emfend.at; spf=pass smtp.mailfrom=emfend.at; dkim=pass (1024-bit key) header.d=emfend.at header.i=@emfend.at header.b=auuFKmw4; arc=none smtp.client-ip=168.119.41.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emfend.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=emfend.at
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=emfend.at;
	 s=mail; h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=AqIigudrJ7aAmp+ba/Ka2Uo9pQb6nbd+5461BnRWGaQ=; b=auuFKmw452DKykGb85+eW46Pje
	mTarSJZAtPCYefFArwCnXRNmAlol9B8mUaF6Fdu6fkWDSz17e2sDld7b4qg5JL+uYltIryxd1QVkZ
	BObAGzFAdqHoYga7FZ2OUXgmW5L+vjbsjFSjeViT5vje0/YxHBikMr6Ch2Q6m/bz4Rwo=;
Received: from 194-208-208-245.tele.net ([194.208.208.245]:58335 helo=[127.0.1.1])
	by lx20.hoststar.hosting with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <matthias.fend@emfend.at>)
	id 1vVlbm-00DjfJ-LE; Wed, 17 Dec 2025 08:06:02 +0100
From: Matthias Fend <matthias.fend@emfend.at>
Date: Wed, 17 Dec 2025 08:06:01 +0100
Subject: [PATCH 2/3] media: i2c: imx283: add support for non-continuous
 MIPI clock mode
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251217-imx283-ext-v1-2-906a762f592d@emfend.at>
References: <20251217-imx283-ext-v1-0-906a762f592d@emfend.at>
In-Reply-To: <20251217-imx283-ext-v1-0-906a762f592d@emfend.at>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Umang Jain <uajain@igalia.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Matthias Fend <matthias.fend@emfend.at>
X-Mailer: b4 0.14.2
X-Spam-Score: -1.0
X-Spam-Bar: -
X-Spam-Report: Spam detection software, running on the system "lx20.hoststar.hosting",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Add the optional clock-noncontinuous endpoint property that
    allows enabling MIPI CSI-2 non-continuous clock operations. Signed-off-by:
    Matthias Fend <matthias.fend@emfend.at> --- Documentation/devicetree/bindings/media/i2c/sony,imx283.yaml
    | 2 ++ 1 file changed, 2 insertions(+) 
 
 Content analysis details:   (-1.0 points, 5.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -1.0 ALL_TRUSTED            Passed through trusted hosts only via SMTP
  0.0 TVD_RCVD_IP            Message was received from an IP address
  0.0 KAM_DMARC_STATUS       Test Rule for DKIM or SPF Failure with Strict
                             Alignment (older systems)
  0.0 Local_hs_NotFromHoststar Sender is NOT hoststar.(ch|at|com)
  0.0 Local_hs_NotToHoststar Recipient is NOT hoststar.(ch|at|com)

Add support for selecting between continuous and non-continuous MIPI clock
mode.

Previously, the CSI-2 non-continuous clock endpoint flag was ignored and
the sensor was always configured for non-continuous clock mode. For
existing device tree nodes that do not have this property enabled, this
update will therefore change the actual clock mode.

Signed-off-by: Matthias Fend <matthias.fend@emfend.at>
---
 drivers/media/i2c/imx283.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/media/i2c/imx283.c b/drivers/media/i2c/imx283.c
index 8ab63ad8f385f6e2a2d7432feff0af09a5356dc4..7a6ab2941ea985401b21d60163b58e980cf31ddc 100644
--- a/drivers/media/i2c/imx283.c
+++ b/drivers/media/i2c/imx283.c
@@ -149,6 +149,9 @@
 #define IMX283_REG_PLSTMG02		CCI_REG8(0x36aa)
 #define   IMX283_PLSTMG02_VAL		0x00
 
+#define IMX283_REG_MIPI_CLK		CCI_REG8(0x3a43)
+#define   IMX283_MIPI_CLK_NONCONTINUOUS	BIT(0)
+
 #define IMX283_REG_EBD_X_OUT_SIZE	CCI_REG16_LE(0x3a54)
 
 /* Test pattern generator */
@@ -565,6 +568,7 @@ struct imx283 {
 	struct v4l2_ctrl *hblank;
 	struct v4l2_ctrl *vflip;
 
+	bool mipi_clk_noncontinuous;
 	unsigned long link_freq_bitmap;
 
 	u16 hmax;
@@ -988,6 +992,7 @@ static int imx283_set_pad_format(struct v4l2_subdev *sd,
 static int imx283_standby_cancel(struct imx283 *imx283)
 {
 	unsigned int link_freq_idx;
+	u8 mipi_clk;
 	int ret = 0;
 
 	cci_write(imx283->cci, IMX283_REG_STANDBY,
@@ -1007,6 +1012,10 @@ static int imx283_standby_cancel(struct imx283 *imx283)
 	/* Enable PLL */
 	cci_write(imx283->cci, IMX283_REG_STBPL, IMX283_STBPL_NORMAL, &ret);
 
+	/* Configure MIPI clock mode */
+	mipi_clk = imx283->mipi_clk_noncontinuous ? IMX283_MIPI_CLK_NONCONTINUOUS : 0;
+	cci_write(imx283->cci, IMX283_REG_MIPI_CLK, mipi_clk, &ret);
+
 	/* Configure the MIPI link speed */
 	link_freq_idx = __ffs(imx283->link_freq_bitmap);
 	cci_multi_reg_write(imx283->cci, link_freq_reglist[link_freq_idx].regs,
@@ -1426,6 +1435,9 @@ static int imx283_parse_endpoint(struct imx283 *imx283)
 		goto done_endpoint_free;
 	}
 
+	imx283->mipi_clk_noncontinuous =
+		bus_cfg.bus.mipi_csi2.flags & V4L2_MBUS_CSI2_NONCONTINUOUS_CLOCK;
+
 	ret = v4l2_link_freq_to_bitmap(imx283->dev, bus_cfg.link_frequencies,
 				       bus_cfg.nr_of_link_frequencies,
 				       link_frequencies, ARRAY_SIZE(link_frequencies),

-- 
2.34.1


