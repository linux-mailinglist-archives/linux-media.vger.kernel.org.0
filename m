Return-Path: <linux-media+bounces-60149-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cCDREWrJ9GnEEgIAu9opvQ
	(envelope-from <linux-media+bounces-60149-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 01 May 2026 17:40:26 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B33D84ADA7F
	for <lists+linux-media@lfdr.de>; Fri, 01 May 2026 17:40:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7513B302FA2F
	for <lists+linux-media@lfdr.de>; Fri,  1 May 2026 15:39:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABF6B3D332E;
	Fri,  1 May 2026 15:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="kWL/yujE"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 750BB3D093C;
	Fri,  1 May 2026 15:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777649979; cv=none; b=V7wUCy1dNsE7Z1ZRUzajhcFBGnZUoXMHhrO8CK1bgIAvMJWX0H87V1O4GPV+/JSbR8XO5Z9eXckmwT7EwTBqGY3kHtKBRcU96qyGCsWpdLBEFNPeutRXlgZ0jSkKPVt//tjF81iRdAje0gN6z3nMg4vD907U/jLl8epT55Hzwf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777649979; c=relaxed/simple;
	bh=pMb3Azb11NTN5VD1FvHVEEgQFjrkVkk5H7PL52CjrFE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Xu4UU6cl7HTVnoOeR9+G/e89NNBEyrz1Bhj1sEyvuqOpW8JNDM+85mdTpPNRUpl7F3EiEFLGSk2V4TNuzQojbmUms6DDicZQThHW0YSlhTgw7tK1EUTGsHodc7t6qdp7zorIiHDAxrn2FuzKdhDYu8v/sxJMOfZQdyVj+0Mckf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=kWL/yujE; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ping.linuxembedded.co.uk (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 68F35A64;
	Fri,  1 May 2026 17:37:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1777649856;
	bh=pMb3Azb11NTN5VD1FvHVEEgQFjrkVkk5H7PL52CjrFE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=kWL/yujE653lukYQ4cdU+vxedQgFr3cFelYzj12I9emmb2YXh5euUksSeKbzLiBTd
	 IOu8KFnq7JFuPFAH/WVr0LEpzV/hHghtaRVDHAp3GJag6f9qxLFwilcByPrvUegQdr
	 19nl9hncVCmcO9Vw70yuE8j1uIUfNFxMBFMr3b1E=
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Date: Fri, 01 May 2026 16:39:07 +0100
Subject: [PATCH 05/11] media: i2c: ov5640: Remove unsupported bayer orders
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260501-ov5640_cleanup-v1-5-0869a7802a33@ideasonboard.com>
References: <20260501-ov5640_cleanup-v1-0-0869a7802a33@ideasonboard.com>
In-Reply-To: <20260501-ov5640_cleanup-v1-0-0869a7802a33@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Steve Longerbeam <slongerbeam@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777649959; l=1276;
 i=kieran.bingham@ideasonboard.com; s=20260207; h=from:subject:message-id;
 bh=pMb3Azb11NTN5VD1FvHVEEgQFjrkVkk5H7PL52CjrFE=;
 b=mXI5OGGwHCPHqMSpjcrKJl/+rKjm83qqA+rYfd2YhIEY8D1oyUeOayUQNL4a+0+tK79JtRTNT
 bzU4fgtjOGGDGyv740EBKuSEJ/J93nb8rDjbTlx64fF1YzRdKMmjuot
X-Developer-Key: i=kieran.bingham@ideasonboard.com; a=ed25519;
 pk=FVXKN7YuwHc6UtbRUeTMAmranfsQomA+vnilfglWdaY=
X-Rspamd-Queue-Id: B33D84ADA7F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[linux.intel.com,gmail.com,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60149-lists,linux-media=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kieran.bingham@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,ideasonboard.com:email,ideasonboard.com:dkim,ideasonboard.com:mid]

The OV5640 only outputs SBGGR8. Remove the incorrectly advertised
alternatives which allow a misconfigured pipeline to be established.

Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
---
 drivers/media/i2c/ov5640.c | 21 ---------------------
 1 file changed, 21 deletions(-)

diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
index 244c341d0e77..e1e253730206 100644
--- a/drivers/media/i2c/ov5640.c
+++ b/drivers/media/i2c/ov5640.c
@@ -309,27 +309,6 @@ static const struct ov5640_pixfmt ov5640_csi2_formats[] = {
 		.bpp		= 8,
 		.ctrl00		= 0x00,
 		.mux		= OV5640_FMT_MUX_RAW_DPC,
-	}, {
-		/* Raw bayer, GBGB... / RGRG... */
-		.code		= MEDIA_BUS_FMT_SGBRG8_1X8,
-		.colorspace	= V4L2_COLORSPACE_SRGB,
-		.bpp		= 8,
-		.ctrl00		= 0x01,
-		.mux		= OV5640_FMT_MUX_RAW_DPC,
-	}, {
-		/* Raw bayer, GRGR... / BGBG... */
-		.code		= MEDIA_BUS_FMT_SGRBG8_1X8,
-		.colorspace	= V4L2_COLORSPACE_SRGB,
-		.bpp		= 8,
-		.ctrl00		= 0x02,
-		.mux		= OV5640_FMT_MUX_RAW_DPC,
-	}, {
-		/* Raw bayer, RGRG... / GBGB... */
-		.code		= MEDIA_BUS_FMT_SRGGB8_1X8,
-		.colorspace	= V4L2_COLORSPACE_SRGB,
-		.bpp		= 8,
-		.ctrl00		= 0x03,
-		.mux		= OV5640_FMT_MUX_RAW_DPC,
 	},
 	{ /* sentinel */ }
 };

-- 
2.52.0


