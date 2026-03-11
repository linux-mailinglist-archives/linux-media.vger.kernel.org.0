Return-Path: <linux-media+bounces-55400-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EMAGGjB0sWlVvAIAu9opvQ
	(envelope-from <linux-media+bounces-55400-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 14:54:56 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AB4F264E3A
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 14:54:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6D89A300BC60
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 13:54:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77FC9362136;
	Wed, 11 Mar 2026 13:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="oz2TVu6k"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD7C235F618;
	Wed, 11 Mar 2026 13:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773237247; cv=none; b=ojOc+zJIZmPyVX9LKxtvhwz9rHVAWI466rWmT8ghWe0vbVqfzgK/qmZREpHxMOux6hgUEgUvkh6tIlZP4OoZwfPbaptMX2f24uMmhS9cstDn+YPA/0uClYVQjfNMb9xqUuWwZcdV+30RU4cQMHptyrf5iwLRK7MH1jLSZ0RAMc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773237247; c=relaxed/simple;
	bh=e3GDDap0IFU4kE62sys31KdPbj/6dEOb3CokA1RneYI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sEU+6ybd34sG00/P1VJgKTKlj5eonzHNZE1rEEj6WLX/gzKhTdlpubau1owNRxgQTRBMaPugB5anRC7EerZcTCjyn7114pKLZVzOpCTVwJyBMIjtbb2n8n88x6pdWMTOdjgVNbBfaGhcD4ByhfnUBPXIGlv/VldJNt/lfjLaWe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=oz2TVu6k; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DFB34981;
	Wed, 11 Mar 2026 14:52:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773237164;
	bh=e3GDDap0IFU4kE62sys31KdPbj/6dEOb3CokA1RneYI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=oz2TVu6kveXLvGvDrxECbv7QT8j4fBR26zXcdOEfKRnYhMbUR5ErH3GtMWbGlY25D
	 wqtFz8gBvKsZEJcZ034Rg4dnr1fGLEmqAGCuyR0xwTzoqUIn6R1t3ryBxVcI/Ie1it
	 ZX/B5EQVRCMjycbPebBk46TUqwPXDKBAO8ie4kPc=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Date: Wed, 11 Mar 2026 15:53:16 +0200
Subject: [PATCH v5 03/10] media: rcar-csi2: Move {enable|disable}_streams()
 calls
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-rcar-streams-v5-3-3e6c957d7567@ideasonboard.com>
References: <20260311-rcar-streams-v5-0-3e6c957d7567@ideasonboard.com>
In-Reply-To: <20260311-rcar-streams-v5-0-3e6c957d7567@ideasonboard.com>
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
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2831;
 i=tomi.valkeinen+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=e3GDDap0IFU4kE62sys31KdPbj/6dEOb3CokA1RneYI=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBpsXPpBjrV/8oq7ZuEqEU3DXmABMzyy86DlP+6o
 28stAS9Yc6JAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCabFz6QAKCRD6PaqMvJYe
 9aNsEACZTJdMGJNykXqO0n0sjJ0B8Ch0IUrbbDwOxA6ecYgUbTYW1Gq8GvOxsR2MkgXHDvV2/lq
 bXLexjdv/Y+FTQU1/TaHOW/AQRGc8MH//Cf5Io2sBgHBx6iRB42jYJLJB4PftuUTxzH1Z+/9SqY
 bKV7lxUV5IgiL4nz5cHi7v+LYGE40rPg355QuJ5erjJ02P/nFxVUxBnj1CWk7zzaWxMDEb3xTbB
 SWf6OP9mehJ1hRIgXAf8RpFYHtwM+vEf+tK/EH2UHiajCE32yCvlXdxzgXQk225+Nimg9aM7rpl
 Mf4Yng93RCRPO3HeaWBDl82CzltNLkrr22R6wvTHxvnX6k8cVkKv850lRMXsE+hPSK72y8XwoB+
 S2WKIEuXRNu09a6HrNjbLCKS4XjMphL1TGob4ZPk8zqqdBUdIPGbwWjEOCj6xykuRdDbtMo5dqj
 BfZDRO8S8FQxmh6zIpVF/+Dh+WICg3iQdbVm2L3QHhgCn9aKtybn0qmt44DZfJgRMX05pX0qQ4a
 0GeB/GxvaDY/rEKDPvLbQqu1gqpz/T2qcwQDTQq3/IF2tnDTM8Ca+XYg8Ul3CFqoe7MeLQbyhVi
 EGOqyqJiGysNzg5RhkfD6eupnA+nRprugnVpF3z45tSEeAxHpMeFkWPRUc51udGQRj44jGjC4Jt
 c3VtXpotdsqchAg==
X-Developer-Key: i=tomi.valkeinen+renesas@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-Rspamd-Queue-Id: 6AB4F264E3A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55400-lists,linux-media=lfdr.de,renesas];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tomi.valkeinen@ideasonboard.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas,huawei];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Action: no action

With multiple streams the operation to enable the CSI-2 hardware and to
call {enable|disable}_streams() on upstream subdev will need to be
handled separately.

Prepare for that by moving {enable|disable}_streams() calls out from
rcsi2_start() and rcsi2_stop().

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
 drivers/media/platform/renesas/rcar-csi2.c | 25 +++++++++++++++----------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
index 7305cc4a04cb..158fa447e668 100644
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

-- 
2.43.0


