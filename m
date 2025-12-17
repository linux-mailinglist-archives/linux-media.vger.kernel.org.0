Return-Path: <linux-media+bounces-48963-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CF092CC66D3
	for <lists+linux-media@lfdr.de>; Wed, 17 Dec 2025 08:51:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DCBC930F62CE
	for <lists+linux-media@lfdr.de>; Wed, 17 Dec 2025 07:45:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 358D3346E64;
	Wed, 17 Dec 2025 07:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=emfend.at header.i=@emfend.at header.b="Xlzut0fR"
X-Original-To: linux-media@vger.kernel.org
Received: from lx20.hoststar.hosting (lx20.hoststar.hosting [168.119.41.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01CC4345CA3;
	Wed, 17 Dec 2025 07:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.41.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765956923; cv=none; b=uGpyCJpKG35xAJEnyT8yUs2xEapN9XmEc5HYTFjv9Lmx9d9Qg1zO/pWX9tVYz40Mko74gn1zQ4YvU98nE9EcSAHRBH3lovQCk3YiWEWczEo1chR5d4HUjxhUlJzKjL0xyI91rn5DDatKZAC3q+RHg/cqTGf4p57soDiQdkB4NYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765956923; c=relaxed/simple;
	bh=LT6xKE15ozldFIKxTigCLTL+01Jt8xS1Ha1kAN0vv1w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XpsuKQHJiihILVRbc/VYWkX4H8vaez84FkyppP6HYNj/u1vcTavtWxBLv2KiBuAMbMYM4lGTxfCrEvn2QVIbdlz5R8+HgncKBxIKNHgy2M3nRvqzlHZ69E34R/LwhtMhBD57o5ZAvzg1rnGTfJxT4YjdjAagidCW45K7EXiXUPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emfend.at; spf=pass smtp.mailfrom=emfend.at; dkim=pass (1024-bit key) header.d=emfend.at header.i=@emfend.at header.b=Xlzut0fR; arc=none smtp.client-ip=168.119.41.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emfend.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=emfend.at
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=emfend.at;
	 s=mail; h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=t7gTeS7UooYe46Shqnjdy6N8d4XSJJaeQQhocEYk9DM=; b=Xlzut0fRjh3lv3/xULv5kfRzCc
	4tjjNNu89swQvXINtgCtG2fmXT/xakdHCxZUn6T4XXdakKCcg9BFfq1moXY5zi0iCL8rgZxPCDiMM
	oMGc7T6zvBcxvFhrewy0jaeIYoszzSvJWbPC+Hj6wFyPjCfYVb3f4ecmhLHLADZTH0Dg=;
Received: from 194-208-208-245.tele.net ([194.208.208.245]:58335 helo=[127.0.1.1])
	by lx20.hoststar.hosting with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <matthias.fend@emfend.at>)
	id 1vVlbn-00DjfJ-Co; Wed, 17 Dec 2025 08:06:03 +0100
From: Matthias Fend <matthias.fend@emfend.at>
Date: Wed, 17 Dec 2025 08:06:02 +0100
Subject: [PATCH 3/3] media: i2c: imx283: implement {g,s}_register
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251217-imx283-ext-v1-3-906a762f592d@emfend.at>
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
 
 Content preview:  Add support for selecting between continuous and non-continuous
    MIPI clock mode. Previously, the CSI-2 non-continuous clock endpoint flag
    was ignored and the sensor was always configured for non-continuous clock
    mode. For existing device tree nodes that do not have this property e [...]
    
 
 Content analysis details:   (-1.0 points, 5.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -1.0 ALL_TRUSTED            Passed through trusted hosts only via SMTP
  0.0 TVD_RCVD_IP            Message was received from an IP address
  0.0 KAM_DMARC_STATUS       Test Rule for DKIM or SPF Failure with Strict
                             Alignment (older systems)
  0.0 Local_hs_NotFromHoststar Sender is NOT hoststar.(ch|at|com)
  0.0 Local_hs_NotToHoststar Recipient is NOT hoststar.(ch|at|com)

Implement {g,s}_register to support advanced V4L2 debug functionality.

Signed-off-by: Matthias Fend <matthias.fend@emfend.at>
---
 drivers/media/i2c/imx283.c | 44 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/drivers/media/i2c/imx283.c b/drivers/media/i2c/imx283.c
index 7a6ab2941ea985401b21d60163b58e980cf31ddc..d8ccde0a1587259f39a10984c517cc57d323b6bc 100644
--- a/drivers/media/i2c/imx283.c
+++ b/drivers/media/i2c/imx283.c
@@ -1295,7 +1295,51 @@ static const struct v4l2_subdev_internal_ops imx283_internal_ops = {
 	.init_state = imx283_init_state,
 };
 
+#ifdef CONFIG_VIDEO_ADV_DEBUG
+static int imx283_g_register(struct v4l2_subdev *sd,
+			     struct v4l2_dbg_register *reg)
+{
+	struct imx283 *imx283 = to_imx283(sd);
+	u64 val;
+	int ret;
+
+	if (!pm_runtime_get_if_active(imx283->dev))
+		return 0;
+
+	ret = cci_read(imx283->cci, CCI_REG8(reg->reg), &val, NULL);
+	reg->val = val;
+
+	pm_runtime_put(imx283->dev);
+
+	return ret;
+}
+
+static int imx283_s_register(struct v4l2_subdev *sd,
+			     const struct v4l2_dbg_register *reg)
+{
+	struct imx283 *imx283 = to_imx283(sd);
+	int ret;
+
+	if (!pm_runtime_get_if_active(imx283->dev))
+		return 0;
+
+	ret = cci_write(imx283->cci, CCI_REG8(reg->reg), reg->val, NULL);
+
+	pm_runtime_put(imx283->dev);
+
+	return ret;
+}
+#endif
+
+static const struct v4l2_subdev_core_ops imx283_core_ops = {
+#ifdef CONFIG_VIDEO_ADV_DEBUG
+	.g_register = imx283_g_register,
+	.s_register = imx283_s_register,
+#endif
+};
+
 static const struct v4l2_subdev_ops imx283_subdev_ops = {
+	.core = &imx283_core_ops,
 	.video = &imx283_video_ops,
 	.pad = &imx283_pad_ops,
 };

-- 
2.34.1


