Return-Path: <linux-media+bounces-52172-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uCBdJOssg2kwjAMAu9opvQ
	(envelope-from <linux-media+bounces-52172-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 04 Feb 2026 12:26:35 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 54D52E518E
	for <lists+linux-media@lfdr.de>; Wed, 04 Feb 2026 12:26:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4C8253014A21
	for <lists+linux-media@lfdr.de>; Wed,  4 Feb 2026 11:26:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A85153EFD33;
	Wed,  4 Feb 2026 11:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="bWhK2CM2"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4D9C3ECBD1;
	Wed,  4 Feb 2026 11:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770204322; cv=none; b=ZKNspZLwifHY3a6BdXFBd/VxH6MqTu1X4sHcoOwB7KK8p+QUJU8oVM1KxhZbpwvGXSR7frfpSn/dy5sISFXwDZbA7I6VzdMi2CLUttFai9aKeVQMVpt0FSw3Qt8f4Yfs3ltuPbZZTs/BkVSQIxhEQMPSg4M/nfoPR6tXqKmhY6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770204322; c=relaxed/simple;
	bh=Dvl3Tree0wsEccwQaxwDEFxXPpQC0laXl6e03FgkyEg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dNXDVfKDRB74tm6+POg2zaznwVFesnD1ms4x9tmqwrPKKMBTf75sGJmj4vdfDfYPOkqlbJhn3aR+VEar+Tvu0yPlyRnbQR+MjnX9GdT53pquv6Lvu8FBR2WJZLaFb8Ho6y0BldD5PIVftC+DQ8XD4DIvSHCvnwM3akJ2uHBDblw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=bWhK2CM2; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from t16.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 22DBD1356;
	Wed,  4 Feb 2026 12:24:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1770204273;
	bh=Dvl3Tree0wsEccwQaxwDEFxXPpQC0laXl6e03FgkyEg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bWhK2CM2Ml1myVRfbA2vz9SqyzEkleAq5+dv54lr6FCE59eA2ba+WNfxCeFh0tIQd
	 20C4ugZ3FQcpVnw7Pgv1fg2Sfb8LkQrywxNOotcXAUVuSPBhD6RkebFvIeRJtpzmf7
	 a+0qC8E20QAFhbfnklnTD7N00OOqMEw836bX+K+I=
From: Isaac Scott <isaac.scott@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: dafna@fastmail.com,
	laurent.pinchart@ideasonboard.com,
	mchehab@kernel.org,
	heiko@sntech.de,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Isaac Scott <isaac.scott@ideasonboard.com>
Subject: [PATCH v1 3/6] media: rkisp1-isp: Add target_format
Date: Wed,  4 Feb 2026 11:25:03 +0000
Message-ID: <20260204112506.3706049-4-isaac.scott@ideasonboard.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260204112506.3706049-1-isaac.scott@ideasonboard.com>
References: <20260204112506.3706049-1-isaac.scott@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[fastmail.com,ideasonboard.com,kernel.org,sntech.de,lists.infradead.org,vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52172-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[isaac.scott@ideasonboard.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,ideasonboard.com:email,ideasonboard.com:dkim,ideasonboard.com:mid]
X-Rspamd-Queue-Id: 54D52E518E
X-Rspamd-Action: no action

In passthough mode, we want to make sure the output format of the ISP is
identical to the input format. Add logic to ensure the format we
configure the output of the ISP with is the sink format when we are in
bypass, and the source format if we are not.

Signed-off-by: Isaac Scott <isaac.scott@ideasonboard.com>
---
 drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
index f636d738b7e8..716bd7f3c66d 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
@@ -175,9 +175,10 @@ static void rkisp1_gasket_disable(struct rkisp1_device *rkisp1)
 static void rkisp1_config_ism(struct rkisp1_isp *isp,
 			      const struct v4l2_subdev_state *sd_state)
 {
-	const struct v4l2_rect *src_crop =
+	const struct v4l2_rect *target_crop =
 		v4l2_subdev_state_get_crop(sd_state,
-					   RKISP1_ISP_PAD_SOURCE_VIDEO);
+			(isp->rkisp1->in_bypass ?
+				RKISP1_ISP_PAD_SINK_VIDEO : RKISP1_ISP_PAD_SOURCE_VIDEO));
 	struct rkisp1_device *rkisp1 = isp->rkisp1;
 	u32 val;
 
@@ -185,10 +186,10 @@ static void rkisp1_config_ism(struct rkisp1_isp *isp,
 	rkisp1_write(rkisp1, RKISP1_CIF_ISP_IS_MAX_DX, 0);
 	rkisp1_write(rkisp1, RKISP1_CIF_ISP_IS_MAX_DY, 0);
 	rkisp1_write(rkisp1, RKISP1_CIF_ISP_IS_DISPLACE, 0);
-	rkisp1_write(rkisp1, RKISP1_CIF_ISP_IS_H_OFFS, src_crop->left);
-	rkisp1_write(rkisp1, RKISP1_CIF_ISP_IS_V_OFFS, src_crop->top);
-	rkisp1_write(rkisp1, RKISP1_CIF_ISP_IS_H_SIZE, src_crop->width);
-	rkisp1_write(rkisp1, RKISP1_CIF_ISP_IS_V_SIZE, src_crop->height);
+	rkisp1_write(rkisp1, RKISP1_CIF_ISP_IS_H_OFFS, target_crop->left);
+	rkisp1_write(rkisp1, RKISP1_CIF_ISP_IS_V_OFFS, target_crop->top);
+	rkisp1_write(rkisp1, RKISP1_CIF_ISP_IS_H_SIZE, target_crop->width);
+	rkisp1_write(rkisp1, RKISP1_CIF_ISP_IS_V_SIZE, target_crop->height);
 
 	/* IS(Image Stabilization) is always on, working as output crop */
 	rkisp1_write(rkisp1, RKISP1_CIF_ISP_IS_CTRL, 1);
-- 
2.43.0


