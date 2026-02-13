Return-Path: <linux-media+bounces-52753-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cGWYI4swj2mhLwEAu9opvQ
	(envelope-from <linux-media+bounces-52753-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 15:09:15 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EAD69136EF7
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 15:09:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 78B0A306CEEC
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 14:02:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9239A22A7E9;
	Fri, 13 Feb 2026 14:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="WnEodnX4"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59C3B362136;
	Fri, 13 Feb 2026 14:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770991356; cv=none; b=nXYs11CGagS66tODLGTWnfLCx9o9qVZzzzQa4JYMKx1bqq9469Yu0Qi4/lAMi0kZH4h7a9HOmrw8X9/z877xPsQu1Lf3cDm9uESw/dWfoEcIpQLa0RUcZE7ff9iJFdQg55MMiBAQ4CCR5VBxtPp7kWBwic49IfzmyhmnuyOKJOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770991356; c=relaxed/simple;
	bh=ZtvCdLXKH0xCm3KsKiK5I+ap6byNDfS/xiw525xrPnA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aaGnBJUFaH4/U116JVX3IGF364UAXNF4R+vFqHVkMX8IcANThd2TRGIbJn2Kn3tQP4BOL/+wH7IjNEMxucObmjNm4HUrX/cC6ckHW0qJJBsYLhocedpfYcYfaQXxNkSOh6QDU5Fu1jCXcig6bUl3Sy7z2Iw8jvPW+NYKV9WS1H8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=WnEodnX4; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ping.linuxembedded.co.uk (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 68BA326D6;
	Fri, 13 Feb 2026 15:01:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1770991281;
	bh=ZtvCdLXKH0xCm3KsKiK5I+ap6byNDfS/xiw525xrPnA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=WnEodnX4dV6UKzpbny30GT/QiTvMrzZ93FJEV1XKNE7T+uNlGAiUppNRzp4iBT+T8
	 2s3RFcONfu61O+LuAyfbuHSVDm+CuBbjl+2C9Dzff9thqHMtuXTNnQXqxcZxlmz/Il
	 ryKDi8LviVCmY568hWAJcKH2Khu+gh73vOw/3Qnw=
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Date: Fri, 13 Feb 2026 14:01:51 +0000
Subject: [PATCH v2 12/25] media: i2c: imx283: Simplify v_pos determination
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260213-mainline-imx283-v2-v2-12-be40a3770ebf@ideasonboard.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770991325; l=1313;
 i=kieran.bingham@ideasonboard.com; s=20260207; h=from:subject:message-id;
 bh=ZtvCdLXKH0xCm3KsKiK5I+ap6byNDfS/xiw525xrPnA=;
 b=WinTCBBeb/J0Nc/0tRlU6B1OfSJzFn4dzgKcUUMyOxFWxHoaF11UaUBcXSAYorZ1IPtjewYTm
 FStaEzowQNlB34gmNKmgjRSy+GeJm8tfJz4j+cUgXdJCuDaW+rZajX8
X-Developer-Key: i=kieran.bingham@ideasonboard.com; a=ed25519;
 pk=FVXKN7YuwHc6UtbRUeTMAmranfsQomA+vnilfglWdaY=
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52753-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ideasonboard.com:mid,ideasonboard.com:dkim,ideasonboard.com:email]
X-Rspamd-Queue-Id: EAD69136EF7
X-Rspamd-Action: no action

Refactor the v_pos to separate out the vflip handling from the top
coordinate.

No functional change is intended in this commit.

Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
---
 drivers/media/i2c/imx283.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/imx283.c b/drivers/media/i2c/imx283.c
index f115a6df7b31..315c050c4fd0 100644
--- a/drivers/media/i2c/imx283.c
+++ b/drivers/media/i2c/imx283.c
@@ -1143,16 +1143,18 @@ static int imx283_start_streaming(struct imx283 *imx283,
 	{
 		u32 y_out_size = mode->crop.height / mode->vbin_ratio;
 		u32 write_v_size = y_out_size + mode->scan->vertical_ob;
+		s16 top = mode->crop.top;
 		u32 v_widcut;
 		s32 v_pos;
 
+		if (imx283->vflip->val)
+			top = -top;
+
 		/*
 		 * cropping start position = (VWINPOS – Vst) × 2
 		 * cropping width = Veff – (VWIDCUT – Vct) × 2
 		 */
-		v_pos = imx283->vflip->val ?
-			((-mode->crop.top / mode->vbin_ratio) / 2) + mode->scan->vst :
-			((mode->crop.top / mode->vbin_ratio) / 2)  + mode->scan->vst;
+		v_pos = (top / mode->vbin_ratio / 2) + mode->scan->vst;
 		v_widcut = ((mode->scan->veff - y_out_size) / 2) + mode->scan->vct;
 
 		cci_write(imx283->cci, IMX283_REG_Y_OUT_SIZE, y_out_size, &ret);

-- 
2.52.0


