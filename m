Return-Path: <linux-media+bounces-65109-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id h62AF0eMMmqI1wUAu9opvQ
	(envelope-from <linux-media+bounces-65109-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 14:00:07 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5543B69966C
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 14:00:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=GVrJu1UF;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65109-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65109-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8B15F3061086
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 11:56:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF9D33F6C59;
	Wed, 17 Jun 2026 11:56:12 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61C803F54BF;
	Wed, 17 Jun 2026 11:56:10 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781697372; cv=none; b=jpbOu2jZZ3Sv06pgqO0MuBmScCH052JdZRuYdNX+TMGJNyNPWFJPAcsTEoCC6828FVGEDMI5jvXcsRZ40aresaHHLa0D+k6DihvQ6dE7XRPqVOiFGISQ6sbAmCvCBka3cAN5ltgxm1kj5UtCYXb7bRqxsBa2h9udXnIYU3rRZAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781697372; c=relaxed/simple;
	bh=fLSaZatxZGVezSWbEtVA1QixYVyhOQYtg1eGVTt/5WM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nMFkLg8FhH0rFQZad1EFviwjr3rjbOMkMl4ueJAwuNkS7QoBDA93XmIvQ7qLtGBFI2iAnzNWM9HltsUwp1KUz8+8LeKhCQ12a2d+r4M9IdDGs9dabgJDRsnNz3uCvOssmIMb/9rHl8jQ4Wc5VT1m6kdelA+3xUQyQdOTZzuO3fA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=GVrJu1UF; arc=none smtp.client-ip=213.167.242.64
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A402016F9;
	Wed, 17 Jun 2026 13:55:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1781697321;
	bh=fLSaZatxZGVezSWbEtVA1QixYVyhOQYtg1eGVTt/5WM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=GVrJu1UFJ/IEND04SfxgJODDYTfZHlo8LxjQiheBg/A+ctBwiSTA6qRgv0jBleaCh
	 hkJYXpwBUu4ALtHrwNY/oP6mKwDS2gfZTSl7LDrtJH3rSfM+dJ52IhjGiA2O33BQAl
	 O6FejUg0EPbjzmfwmPBC505EKKnaQNXnKKnfaLFU=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Date: Wed, 17 Jun 2026 14:54:57 +0300
Subject: [PATCH v6 04/11] media: rcar-csi2: Move {enable|disable}_streams()
 calls
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260617-rcar-streams-v6-4-1260eb72dff7@ideasonboard.com>
References: <20260617-rcar-streams-v6-0-1260eb72dff7@ideasonboard.com>
In-Reply-To: <20260617-rcar-streams-v6-0-1260eb72dff7@ideasonboard.com>
To: =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4090;
 i=tomi.valkeinen+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=fLSaZatxZGVezSWbEtVA1QixYVyhOQYtg1eGVTt/5WM=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBqMotEmmV/gtknz5Yn43xKdU7KYsWTNOvTzLODo
 1bH27q8ne2JAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCajKLRAAKCRD6PaqMvJYe
 9ffnEACiIGPtz90VoxIS71QGFHNUxqNvKhIZmIJr6eSkKoyXhhW0EqMvuidgWQ0/NPK5FMAM4NM
 InpRl/Mur69nCrzyiH0Yd8W/g8mTI1n+PkwfhT9UzRtA4WFCc/SkyBmjLkipyyiJwWySq/jj6D3
 11ySg4+je+HUmvUs+ltliKdYCU5L6QomfQ6QqI/npy2gedi2c1aBkM8Y5eXlXJtBHEza9FJApKg
 THs5VaRzm4uM8lEQf6HyglZZnHUPl6ZrGrqDSnt9A+s0Fx9sjM9S10r5qEqkd15WTeslEOOUQvk
 DEs7kGe0ArzqOU4zRu9J/QXm2IVqXK9irMOyCw5NuBFnt2KABYQP+z7Gd8UnotqW9n5h4j1+SIa
 rBtNgS42Txj81WDa8XABHN6HGbUrJ/87MgUvtxIF/rF3aNIRrrqm4bFsMwN+HapKbX+rYo8pJGl
 bDarw+HkdUNDEPzZy4YXqqnUtvNPbFC2mQLIWr7yIhyhbWtas/QEXaJi3TA6rZHAZ/tdsU2HGKO
 cxIDBmjLlxJP6kc1M9xf4xjT/xTK3GYMCxf7ozwtKhOLjGHv2pWwGLsv1SHjkZLRNpz4/m49xd8
 gMfRN8Gbq/HVPHDc0nMh2/0bYTJ6N+ji+HT8W5rsub13hGCA4TdwKXtI7Kmdyt4YdGdIdxVbdXa
 cqgYczvFoEqvuew==
X-Developer-Key: i=tomi.valkeinen+renesas@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65109-lists,linux-media=lfdr.de,renesas];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[tomi.valkeinen@ideasonboard.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:niklas.soderlund@ragnatech.se,m:mchehab@kernel.org,m:sakari.ailus@linux.intel.com,m:linux-media@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:niklas.soderlund+renesas@ragnatech.se,m:mchehab+huawei@kernel.org,m:laurent.pinchart@ideasonboard.com,m:jacopo.mondi@ideasonboard.com,m:tomi.valkeinen+renesas@ideasonboard.com,m:tomi.valkeinen@ideasonboard.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tomi.valkeinen@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-media,renesas,huawei];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:mid,ideasonboard.com:from_mime,vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5543B69966C

With multiple streams the operation to enable the CSI-2 hardware and to
call {enable|disable}_streams() on upstream subdev will need to be
handled separately.

Prepare for that by moving {enable|disable}_streams() calls out from
rcsi2_start() and rcsi2_stop().

As the error recovery in rcsi2_irq_thread() relies on rcsi2_start() and
rcsi2_stop(), we need to modify rcsi2_irq_thread() accordingly.

On Gen3, a side effect of this change is that if the sink side devices
call .enable_streams() on rcar-csi2 multiple times, the second call will
fail. This is because we always use stream ID 0, so the second call
would attempt to enable the same stream again, leading to an error. In
other words, a normal single-stream setup continues to work, but trying
to use the current driver's custom VC based routing will fail.

On Gen4, this doesn't matter as the rcar-isp behaves in a similar way as
described above, and thus rcar-csi2 will only get a single
.enable_streams() call.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/rcar-csi2.c | 59 ++++++++++++++++++++++++------
 1 file changed, 47 insertions(+), 12 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
index 7305cc4a04cb..f5d8b06dff51 100644
--- a/drivers/media/platform/renesas/rcar-csi2.c
+++ b/drivers/media/platform/renesas/rcar-csi2.c
@@ -1822,20 +1822,12 @@ static int rcsi2_start(struct rcar_csi2 *priv, struct v4l2_subdev_state *state)
 		return ret;
 	}
 
-	ret = v4l2_subdev_enable_streams(priv->remote, priv->remote_pad,
-					 BIT_ULL(0));
-	if (ret) {
-		rcsi2_enter_standby(priv);
-		return ret;
-	}
-
 	return 0;
 }
 
 static void rcsi2_stop(struct rcar_csi2 *priv)
 {
 	rcsi2_enter_standby(priv);
-	v4l2_subdev_disable_streams(priv->remote, priv->remote_pad, BIT_ULL(0));
 }
 
 static int rcsi2_enable_streams(struct v4l2_subdev *sd,
@@ -1857,6 +1849,14 @@ static int rcsi2_enable_streams(struct v4l2_subdev *sd,
 			return ret;
 	}
 
+	ret = v4l2_subdev_enable_streams(priv->remote, priv->remote_pad,
+					 BIT_ULL(0));
+	if (ret) {
+		if (priv->stream_count == 0)
+			rcsi2_stop(priv);
+		return ret;
+	}
+
 	priv->stream_count += 1;
 
 	return ret;
@@ -1867,7 +1867,7 @@ static int rcsi2_disable_streams(struct v4l2_subdev *sd,
 				 u32 source_pad, u64 source_streams_mask)
 {
 	struct rcar_csi2 *priv = sd_to_csi2(sd);
-	int ret = 0;
+	int ret;
 
 	if (source_streams_mask != 1)
 		return -EINVAL;
@@ -1878,9 +1878,14 @@ static int rcsi2_disable_streams(struct v4l2_subdev *sd,
 	if (priv->stream_count == 1)
 		rcsi2_stop(priv);
 
+	ret = v4l2_subdev_disable_streams(priv->remote, priv->remote_pad,
+					  BIT_ULL(0));
+	if (ret)
+		return ret;
+
 	priv->stream_count -= 1;
 
-	return ret;
+	return 0;
 }
 
 static int rcsi2_set_pad_format(struct v4l2_subdev *sd,
@@ -1971,14 +1976,44 @@ static irqreturn_t rcsi2_irq_thread(int irq, void *data)
 {
 	struct v4l2_subdev_state *state;
 	struct rcar_csi2 *priv = data;
+	int ret;
 
 	state = v4l2_subdev_lock_and_get_active_state(&priv->subdev);
 
+	if (priv->stream_count == 0)
+		goto out;
+
 	rcsi2_stop(priv);
+
+	ret = v4l2_subdev_disable_streams(priv->remote, priv->remote_pad,
+					  BIT_ULL(0));
+	if (ret) {
+		dev_warn(priv->dev,
+			 "Error recovery: failed to disable streams: %d\n",
+			 ret);
+		goto out;
+	}
+
 	usleep_range(1000, 2000);
-	if (rcsi2_start(priv, state))
-		dev_warn(priv->dev, "Failed to restart CSI-2 receiver\n");
 
+	ret = rcsi2_start(priv, state);
+	if (ret) {
+		dev_warn(priv->dev,
+			 "Error recovery: failed to start CSI-2 receiver: %d\n",
+			 ret);
+		goto out;
+	}
+
+	ret = v4l2_subdev_enable_streams(priv->remote, priv->remote_pad,
+					 BIT_ULL(0));
+	if (ret) {
+		dev_warn(priv->dev,
+			 "Error recovery: failed to start streams: %d\n",
+			 ret);
+		goto out;
+	}
+
+out:
 	v4l2_subdev_unlock_state(state);
 
 	return IRQ_HANDLED;

-- 
2.43.0


