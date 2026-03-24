Return-Path: <linux-media+bounces-56814-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gCCHFNs/wmmCagQAu9opvQ
	(envelope-from <linux-media+bounces-56814-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 08:40:11 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AB5CD30413A
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 08:40:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1D69831B91A4
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 07:32:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E925F32AAAB;
	Tue, 24 Mar 2026 07:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=emfend.at header.i=@emfend.at header.b="aMHgH1lo"
X-Original-To: linux-media@vger.kernel.org
Received: from lx20.hoststar.hosting (lx20.hoststar.hosting [168.119.41.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 618EA33065D;
	Tue, 24 Mar 2026 07:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.41.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774337548; cv=none; b=p4vG5n9u/iIzHPEhwG0DuBdySHnhX9C3grOKtRbxnMnrkEPUTqETCMlPUxc0LFxUQ1ptRN4fm0Jagpv09Qt1T4szEQukJKw0tVpfP1NB9/IFITqZ1RP6LTDgZ1kf7CojtoXrKXsGLjv/bz4VZQem9iZ8Xqv8iXfxx6W+HoulHC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774337548; c=relaxed/simple;
	bh=DoySZJb+/dX4tX+SckY2cfiJpr62a6BkVboaZ+y3eVU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=YN0IUT6FHTIa8D1vrhQrxSi+GVa88b+Byac4viJhzm+gYSORQYZJIOt6RHeU8KDMtKVoOsXfp0nhya+sQmfOuH3yUWlOv+fBvLqr62dmydrgFBTpatKggelPPuYDfXsqd2El0f4lN9vo3fHqF5vbxhoWPTQDIGeBidOQgiYfXjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emfend.at; spf=pass smtp.mailfrom=emfend.at; dkim=pass (1024-bit key) header.d=emfend.at header.i=@emfend.at header.b=aMHgH1lo; arc=none smtp.client-ip=168.119.41.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emfend.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=emfend.at
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=emfend.at;
	 s=mail; h=Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=KS6J46kYK+sVTlFskCuxSfFQijC3eqAgPVExn/P68gI=; b=aMHgH1locKZJ7MEsKcLzpSNyRr
	utWm2qH8ZZDRLXPCY3lFQSAomDAKdhhiDdUgjf6rH4AUR8CU/N8e0zlASKii6LXm4Qs0MgxRladQZ
	icDW7twLiONsVl1Y8qgb2G9EzhIQPabmPAgfPdpO4OgLHS8o/9opAZ3xbZBOduMho/Ng=;
Received: from 194-208-208-245.tele.net ([194.208.208.245]:62112 helo=[127.0.1.1])
	by lx20.hoststar.hosting with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <matthias.fend@emfend.at>)
	id 1w4vvO-009jM8-AH; Tue, 24 Mar 2026 08:11:41 +0100
From: Matthias Fend <matthias.fend@emfend.at>
Date: Tue, 24 Mar 2026 08:11:25 +0100
Subject: [PATCH RESEND v2] media: i2c: imx283: add support for
 non-continuous MIPI clock mode
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260324-imx283-ext-v2-1-4931dbd46c95@emfend.at>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Umang Jain <uajain@igalia.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Matthias Fend <matthias.fend@emfend.at>
X-Mailer: b4 0.14.2
X-Spam-Score: 
X-Spam-Bar: 
X-Spam-Report: 
X-Spamd-Result: default: False [1.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[emfend.at:s=mail];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56814-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[emfend.at];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[emfend.at:-];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.994];
	FROM_NEQ_ENVFROM(0.00)[matthias.fend@emfend.at,linux-media@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ideasonboard.com:email,emfend.at:email,emfend.at:mid]
X-Rspamd-Queue-Id: AB5CD30413A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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


