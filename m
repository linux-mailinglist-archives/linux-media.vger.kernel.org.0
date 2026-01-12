Return-Path: <linux-media+bounces-50471-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 80899D13930
	for <lists+linux-media@lfdr.de>; Mon, 12 Jan 2026 16:18:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0638D30508AE
	for <lists+linux-media@lfdr.de>; Mon, 12 Jan 2026 15:00:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E983A2EBB84;
	Mon, 12 Jan 2026 14:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=emfend.at header.i=@emfend.at header.b="MnoLR01i"
X-Original-To: linux-media@vger.kernel.org
Received: from lx20.hoststar.hosting (lx20.hoststar.hosting [168.119.41.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 343DA2DCBF8;
	Mon, 12 Jan 2026 14:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.41.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768229980; cv=none; b=NPDsWig2S0mIE0BTueWwoCOSSBb3ufJjDHvkNDRbTpsBHjBTyaW+kdXKIjDf6pN4558xiEMlJyxiERfMjvRXX0Yt71oU2z24SmZ3b7UHYK0G6HLT6zwYkcAEjXwSTR93RdxKmQ4eHP++Kd0d4q6MqAMFwitOLq08n+BOkWlJUI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768229980; c=relaxed/simple;
	bh=DoySZJb+/dX4tX+SckY2cfiJpr62a6BkVboaZ+y3eVU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Qe6o0cJaP54rq3yMEXCwyxcP1d55E0HgVCo7OBSyFyDuHtEddpBxh1pV4gg9A5YhuN4/k8MQa516nAKpCtRCpM8ulJ9EZeueq6Un5FjQEyQdEUCGYW6wXsVcjhzVBgdV0MREZiWyYuishQIdXxjDPbpcF28NetUGIKQ041SpJi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emfend.at; spf=pass smtp.mailfrom=emfend.at; dkim=pass (1024-bit key) header.d=emfend.at header.i=@emfend.at header.b=MnoLR01i; arc=none smtp.client-ip=168.119.41.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emfend.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=emfend.at
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=emfend.at;
	 s=mail; h=Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=KS6J46kYK+sVTlFskCuxSfFQijC3eqAgPVExn/P68gI=; b=MnoLR01it5M9C9HGwBUEaYaJMq
	gM5Pq04K8dCUtwU4Go00sCah94kJKOD7OABAtxneRb1A3pRAsJ7NAjA83TXkKUts8mnyTXeSXMTJZ
	oY/stoK4nBhxF1+fu/FquEBd2Gv/UsY7lNc8QBgf7nMU+V0eZxpo/00RU4QcqEm1nEwo=;
Received: from 194-208-208-245.tele.net ([194.208.208.245]:52270 helo=[127.0.1.1])
	by lx20.hoststar.hosting with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <matthias.fend@emfend.at>)
	id 1vfJOH-009DZw-0c; Mon, 12 Jan 2026 15:59:33 +0100
From: Matthias Fend <matthias.fend@emfend.at>
Date: Mon, 12 Jan 2026 15:59:28 +0100
Subject: [PATCH v2] media: i2c: imx283: add support for non-continuous MIPI
 clock mode
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260112-imx283-ext-v2-1-9349e3268b4b@emfend.at>
X-B4-Tracking: v=1; b=H4sIAE8MZWkC/03MQQrCMBCF4auUWRtJRpKmrnoP6SKaqZ1FU0lCq
 JTe3VgQXP4P3rdBosiU4NpsEKlw4iXUwFMDj8mFJwn2tQElaoXKCJ5XtBdBaxa6M9YZbf2dDNT
 DK9LI64HdhtoTp7zE92EX9V1/TPvPFCWk6KRxrcFRd+h7mkcK/uwyDPu+fwCRhoVFpAAAAA==
X-Change-ID: 20251216-imx283-ext-5968a658dbe6
To: Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Umang Jain <uajain@igalia.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, bsp-development.geo@leica-geosystems.com, 
 Matthias Fend <matthias.fend@emfend.at>
X-Mailer: b4 0.14.2
X-Spam-Score: 
X-Spam-Bar: 
X-Spam-Report: 

Add support for selecting between continuous and non-continuous MIPI clock
mode.

Previously, the CSI-2 non-continuous clock endpoint flag was ignored and
the sensor was always configured for non-continuous clock mode. For
existing device tree nodes that do not have this property enabled, this
update will therefore change the actual clock mode.

Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
Signed-off-by: Matthias Fend <matthias.fend@emfend.at>
---
Add support for selecting the MIPI clock mode (continuous, non-continuous).
---
Changes in v2:
- Drop '[PATCH 1/3] media: dt-bindings: imx283: add clock-noncontinuous' (Krzysztof)
- Drop '[PATCH 3/3] media: i2c: imx283: implement {g,s}_register' (Dave)
- Link to v1: https://lore.kernel.org/r/20251217-imx283-ext-v1-0-906a762f592d@emfend.at
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

---
base-commit: 3aa9296a23ec41a8424e9a2346eea59fb6cb7d8c
change-id: 20251216-imx283-ext-5968a658dbe6

Best regards,
-- 
Matthias Fend <matthias.fend@emfend.at>


