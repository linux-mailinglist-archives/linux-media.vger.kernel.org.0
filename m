Return-Path: <linux-media+bounces-55662-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EMeKKg7ys2nYdgAAu9opvQ
	(envelope-from <linux-media+bounces-55662-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 12:16:30 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 32F50282147
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 12:16:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3FC9330A7843
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 11:14:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46C413859E1;
	Fri, 13 Mar 2026 11:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="B419UbSG"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C2EE39098F;
	Fri, 13 Mar 2026 11:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773400464; cv=none; b=Yea7kbMcaFGPPx4BqB7xMWStBbRPD46jSA/plWllgEaTaSrA8hu05bYauUKX0CC6YN797v1dOn0VePodQe/fK8hmYPEKN7aVt2NdIVAOsnrwwjKZkvgmcJIIsdmEZO6+e3fNtkw8JmFRoJrqmol9kXL3LDswxu02kAg+8bVCRMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773400464; c=relaxed/simple;
	bh=9Zu3WwvywQQKNDA3rCqLYxT/zjUETeQZZDH2ujiWS6o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ep2Uk8yUBhH4RAAKZ8NWCWJKFZrrLKBnz1ZsDkA936w45eXjK3b5MPEo3WVVwAqpeThYumojZqDODAKpMWX1eIhxQs63IAw2b5FBJ3F8AguHvDuvsoZ38AEiB09tA2lM1GmpeCGJYVy4YPDmRmxj0WUv3hEfrHbJ1YQq7ZXQuow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=B419UbSG; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.224.131] (unknown [37.159.92.229])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E91FB103D;
	Fri, 13 Mar 2026 12:13:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773400387;
	bh=9Zu3WwvywQQKNDA3rCqLYxT/zjUETeQZZDH2ujiWS6o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=B419UbSGuj7VmsjAdJkJJEs78oyMlhEr88uP0Tjpz5VGVXj9utwBvl0Rv4DvHxY7D
	 bqrWN2HvMwwvfKbaKRAJ7jTEX/m/TSb8XUJ/+5PLqUnoqrziKbyCPvrxSODiLT8Mdo
	 qpAi6/s6mmMQ1pGB22co+xPgSFPIndXVdFaQwJ3Q=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Fri, 13 Mar 2026 12:14:00 +0100
Subject: [PATCH 4/7] media: rzv2h-ivc: Fix FM_STOP register write
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260313-mali-ivc-fixes-v7-0-v1-4-cb0714cd1279@ideasonboard.com>
References: <20260313-mali-ivc-fixes-v7-0-v1-0-cb0714cd1279@ideasonboard.com>
In-Reply-To: <20260313-mali-ivc-fixes-v7-0-v1-0-cb0714cd1279@ideasonboard.com>
To: Daniel Scally <dan.scally@ideasonboard.com>, 
 =?utf-8?q?Barnab=C3=A1s_P=C5=91cze?= <barnabas.pocze@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>, 
 =?utf-8?q?Barnab=C3=A1s_P=C5=91cze?= <barnabas.pocze+renesas@ideasonboard.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2099;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=PkkTr2oG0V9WpZyCwfGo3ZhNy+4BzlP/M28QLpEzQYw=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBps/GA2dLb0w0icatNhX+TeJVJUj2levk3nH0+n
 W2wo1yy4TuJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCabPxgAAKCRByNAaPFqFW
 PLqKEACuzS10CTLy0J7xjCubb39kEHD6XYzGVISDJltws5v/U3iYnAat05OnwJgjV2NyU8ORUsg
 JjHLhVCaVPRuTFm7/yCz1Ng7SHrJWPFRroZJz7urvY4JOK4mzxgoCjmz1Fgs+OiLcdQi3ouoNl0
 KtKso9PJYveKEcfwKnKaEdFSTjNOICj/0JDbxPS3FgnPTCK78/tyGIIXc0eGUk0DZ1FwicmRemI
 iBu0Xn75gDh1a9a7V74cHav17wtEZFyHh6QFlVZF3TqCmJ/2e1XU7fBAL31dJ0KtLcXBeSwH+A/
 aCeEjlEEIsWdG+W7rJX4jVSAkiVyLSWpZY/Wf5zpgnQ1ojPLyxPZsfHoK75KsBOSgitdJJAHEFo
 FJmu49AZNWUsAiTIyXqdfAqdz8Xb3HA447knMvR4KhsLjmsSMF8XKYoV59twje6PpV/5vrqEMox
 0nkPFB+JyVSCmI1CPd2vl9v++gdtIH5cyRHt3xZWdQzPh77N2tJmc2mvUgf7EnQLjuiMOxpunt1
 R3cR5FWDexu2DFjnc5rk9oYfjpyBZED4hG+DjrgHkvofIsqreAsv2aXQGHbeoaux5JcIDnZIUWe
 KrdJovP+PfBkhcNrjpKM3q+PyDXpzp57RKiBSPhPYWCXlqi3VN3S98zaUatflS/0aWT8sYkAAk5
 DusgEWEtOxu8SPw==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-55662-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco,renesas];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 32F50282147
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Barnabás Pőcze <barnabas.pocze+renesas@ideasonboard.com>

Bit 20 should be written in this register to stop frame processing.
So fix that, as well as the poll condition.

Cc: stable@vger.kernel.org
Fixes: f0b3984d821b ("media: platform: Add Renesas Input Video Control block driver")
Signed-off-by: Barnabás Pőcze <barnabas.pocze+renesas@ideasonboard.com>
Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-video.c | 5 +++--
 drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc.h       | 1 +
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-video.c b/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-video.c
index d894a880c33f..9b75e4b10e99 100644
--- a/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-video.c
+++ b/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-video.c
@@ -297,9 +297,10 @@ static void rzv2h_ivc_stop_streaming(struct vb2_queue *q)
 	struct rzv2h_ivc *ivc = vb2_get_drv_priv(q);
 	u32 val = 0;
 
-	rzv2h_ivc_write(ivc, RZV2H_IVC_REG_FM_STOP, 0x1);
+	rzv2h_ivc_write(ivc, RZV2H_IVC_REG_FM_STOP, RZV2H_IVC_REG_FM_STOP_FSTOP);
 	readl_poll_timeout(ivc->base + RZV2H_IVC_REG_FM_STOP,
-			   val, !val, 10 * USEC_PER_MSEC, 250 * USEC_PER_MSEC);
+			   val, !(val & RZV2H_IVC_REG_FM_STOP_FSTOP),
+			   10 * USEC_PER_MSEC, 250 * USEC_PER_MSEC);
 
 	rzv2h_ivc_return_buffers(ivc, VB2_BUF_STATE_ERROR);
 	video_device_pipeline_stop(&ivc->vdev.dev);
diff --git a/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc.h b/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc.h
index 54c70de31c1e..049f223200e3 100644
--- a/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc.h
+++ b/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc.h
@@ -46,6 +46,7 @@
 #define RZV2H_IVC_REG_FM_MCON				0x0104
 #define RZV2H_IVC_REG_FM_FRCON				0x0108
 #define RZV2H_IVC_REG_FM_STOP				0x010c
+#define RZV2H_IVC_REG_FM_STOP_FSTOP			BIT(20)
 #define RZV2H_IVC_REG_FM_INT_EN				0x0120
 #define RZV2H_IVC_VVAL_IFPE				BIT(0)
 #define RZV2H_IVC_REG_FM_INT_STA			0x0124

-- 
2.53.0


