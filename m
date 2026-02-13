Return-Path: <linux-media+bounces-52752-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MJ7YCHovj2mhLwEAu9opvQ
	(envelope-from <linux-media+bounces-52752-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 15:04:42 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A5B28136E05
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 15:04:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7DECB30D3D0A
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 14:02:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16F7F3612F4;
	Fri, 13 Feb 2026 14:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="u4jByHze"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59BB635FF49;
	Fri, 13 Feb 2026 14:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770991353; cv=none; b=sN3o3VjxHEKHZN0EirgZbsCnZFKuuoJQ5D03tU6vDC3cGGSgxLLC62x0MCR1bqMSB9ClSnL0w/HKTJ05tij1sNt153yJoLIs2LtPjWQ19WmVlfw3N8I2qvDOks/gbqbKAelHlnDWVgeuZoN6lrLS56ceaw33d644PDS2Ve8Ggy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770991353; c=relaxed/simple;
	bh=s+KUR5jF5nSLHidI7PHEpfH18Z5QECf10D7XGlPboB0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VX42DvUL+kMLCnB2/uCNYBpNQ5KcnOsI4ED+fFSsYxvOPQ1u/jb2ZQaYiQCaNb4J9kefXOOwIqVwfdhfG/zDV0/xpgYQO9ZlDR+/X19WM3xxbK0CUpCCiHPG9ZHwfBaNDx9ttJ9ppOnFqHQnGe6Uw1a/tVBJ4Rekfo8i5CIUqfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=u4jByHze; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ping.linuxembedded.co.uk (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0DFD026D2;
	Fri, 13 Feb 2026 15:01:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1770991281;
	bh=s+KUR5jF5nSLHidI7PHEpfH18Z5QECf10D7XGlPboB0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=u4jByHzeuqzpjhDn4Nt0iPy2W5LMoBxF4OYuocfWchKVkJjD6/Mm3edMLL/6HRarI
	 1u6xKMbB3gsA36YaH+pbSHyzEvcCmw8cKy9HY5YzBjOOAatXjtALaZj52lg8GHzbAU
	 D7cQDSVHyTBCSjkjaX7kbWWmKaf2/YlaAcyxchK4=
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Date: Fri, 13 Feb 2026 14:01:50 +0000
Subject: [PATCH v2 11/25] media: i2c: imx283: Constrain scope of vertical
 calculations
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260213-mainline-imx283-v2-v2-11-be40a3770ebf@ideasonboard.com>
References: <20260213-mainline-imx283-v2-v2-0-be40a3770ebf@ideasonboard.com>
In-Reply-To: <20260213-mainline-imx283-v2-v2-0-be40a3770ebf@ideasonboard.com>
To: Umang Jain <uajain@igalia.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@kernel.org>
Cc: Jai Luthra <jai.luthra@ideasonboard.com>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770991325; l=2862;
 i=kieran.bingham@ideasonboard.com; s=20260207; h=from:subject:message-id;
 bh=s+KUR5jF5nSLHidI7PHEpfH18Z5QECf10D7XGlPboB0=;
 b=DaA7hbEhtDcBmDTnUp356SuDFJ1GrXU2sA6uUt/mHi67w3e2EWTTcaQnxW8ll5xSAfqWkCzDi
 t8AzRKhinu/BHePWEzB23A8PxsPvVCIF/LMgaOG+3UmNGwuNhitfq0i
X-Developer-Key: i=kieran.bingham@ideasonboard.com; a=ed25519;
 pk=FVXKN7YuwHc6UtbRUeTMAmranfsQomA+vnilfglWdaY=
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52752-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kieran.bingham@ideasonboard.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,ideasonboard.com:mid,ideasonboard.com:dkim,ideasonboard.com:email]
X-Rspamd-Queue-Id: A5B28136E05
X-Rspamd-Action: no action

Reduce the scope of the 5 registers used for vertical positioning to
make it easier to maintain and calculate the exact vertical
configuration.

No functional changes intended in this patch, which simplifies
later development.

Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
---
 drivers/media/i2c/imx283.c | 41 ++++++++++++++++++++++-------------------
 1 file changed, 22 insertions(+), 19 deletions(-)

diff --git a/drivers/media/i2c/imx283.c b/drivers/media/i2c/imx283.c
index 6d551a26cfa6..f115a6df7b31 100644
--- a/drivers/media/i2c/imx283.c
+++ b/drivers/media/i2c/imx283.c
@@ -1092,10 +1092,7 @@ static int imx283_start_streaming(struct imx283 *imx283,
 	const struct v4l2_mbus_framefmt *fmt;
 	const struct imx283_mode *mode_list;
 	unsigned int num_modes;
-	u32 v_widcut;
-	s32 v_pos;
-	u32 write_v_size;
-	u32 y_out_size;
+
 	int ret = 0;
 
 	fmt = v4l2_subdev_state_get_format(state, 0);
@@ -1142,23 +1139,29 @@ static int imx283_start_streaming(struct imx283 *imx283,
 		mode->crop.width,
 		mode->crop.height);
 
-	y_out_size = mode->crop.height / mode->vbin_ratio;
-	write_v_size = y_out_size + mode->scan->vertical_ob;
-	/*
-	 * cropping start position = (VWINPOS – Vst) × 2
-	 * cropping width = Veff – (VWIDCUT – Vct) × 2
-	 */
-	v_pos = imx283->vflip->val ?
-		((-mode->crop.top / mode->vbin_ratio) / 2) + mode->scan->vst :
-		((mode->crop.top / mode->vbin_ratio) / 2)  + mode->scan->vst;
-	v_widcut = ((mode->scan->veff - y_out_size) / 2) + mode->scan->vct;
+	/* Vertical Configuration */
+	{
+		u32 y_out_size = mode->crop.height / mode->vbin_ratio;
+		u32 write_v_size = y_out_size + mode->scan->vertical_ob;
+		u32 v_widcut;
+		s32 v_pos;
 
-	cci_write(imx283->cci, IMX283_REG_Y_OUT_SIZE, y_out_size, &ret);
-	cci_write(imx283->cci, IMX283_REG_WRITE_VSIZE, write_v_size, &ret);
-	cci_write(imx283->cci, IMX283_REG_VWIDCUT, v_widcut, &ret);
-	cci_write(imx283->cci, IMX283_REG_VWINPOS, v_pos, &ret);
+		/*
+		 * cropping start position = (VWINPOS – Vst) × 2
+		 * cropping width = Veff – (VWIDCUT – Vct) × 2
+		 */
+		v_pos = imx283->vflip->val ?
+			((-mode->crop.top / mode->vbin_ratio) / 2) + mode->scan->vst :
+			((mode->crop.top / mode->vbin_ratio) / 2)  + mode->scan->vst;
+		v_widcut = ((mode->scan->veff - y_out_size) / 2) + mode->scan->vct;
 
-	cci_write(imx283->cci, IMX283_REG_OB_SIZE_V, mode->scan->vertical_ob, &ret);
+		cci_write(imx283->cci, IMX283_REG_Y_OUT_SIZE, y_out_size, &ret);
+		cci_write(imx283->cci, IMX283_REG_WRITE_VSIZE, write_v_size, &ret);
+		cci_write(imx283->cci, IMX283_REG_VWIDCUT, v_widcut, &ret);
+		cci_write(imx283->cci, IMX283_REG_VWINPOS, v_pos, &ret);
+
+		cci_write(imx283->cci, IMX283_REG_OB_SIZE_V, mode->scan->vertical_ob, &ret);
+	}
 
 	/* Horizontal Configuration */
 	{

-- 
2.52.0


