Return-Path: <linux-media+bounces-48902-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 98A26CC3F5A
	for <lists+linux-media@lfdr.de>; Tue, 16 Dec 2025 16:33:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6336430C9AD9
	for <lists+linux-media@lfdr.de>; Tue, 16 Dec 2025 15:28:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D762935293B;
	Tue, 16 Dec 2025 15:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="s5ZcdMJq"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6C7B350A2F;
	Tue, 16 Dec 2025 15:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765898365; cv=none; b=HNUgvjQQHoF1dv9icZXCY2YjUkw025/VoC1HwQ9stosgwadsUDROQRc7AD+WI8sx1MDpGoUUg+P7aR6PJtSFwMDAQJDpUkorOjp+e03aUr/VO1wjY1IQFeIHHAKWCnLKp7a2Re5JjH3r13/Ns1wdnHidmhZENHwr61QSVykdaK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765898365; c=relaxed/simple;
	bh=e3GDDap0IFU4kE62sys31KdPbj/6dEOb3CokA1RneYI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TsfXW0NfvPiK+7Ka1/uWr0RhAIzJDFTS5/CvwPttGFA2NO1MJGmWGfI6t/APzncwNfDzZN9R2GjuYk4aWOIznbBRZ6+iii6sbJEHcibGP6BV02Sn9Ij2f3awXR9fpPH5ODexo/J/nRU2yasRLtV3m1XvwjBONmZ7fTbT5LP+BLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=s5ZcdMJq; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7F93E1574;
	Tue, 16 Dec 2025 16:19:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1765898346;
	bh=e3GDDap0IFU4kE62sys31KdPbj/6dEOb3CokA1RneYI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=s5ZcdMJqW88F+0YjvHT9wcRev7LXK6dVXigaJsbTk2zik+rxksv4fNQisD73jx8D8
	 bHKPV+tCNsZacFH7CR52VpdLysrCoNoZY/n8fDx5o5aBWABQQ2AsjLhhh6j2LlzpgO
	 cjgLnZRxvejCr5oMhNM8AV30SVKs7ouuhuWtf3ZM=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Date: Tue, 16 Dec 2025 17:18:25 +0200
Subject: [PATCH v4 08/15] media: rcar-csi2: Move {enable|disable}_streams()
 calls
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251216-rcar-streams-v4-8-f28b4831cc67@ideasonboard.com>
References: <20251216-rcar-streams-v4-0-f28b4831cc67@ideasonboard.com>
In-Reply-To: <20251216-rcar-streams-v4-0-f28b4831cc67@ideasonboard.com>
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
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBpQXhlTZtOJmBZcspYN34xm+5YkRuAKXZJXdsqZ
 O9W3LgusJGJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCaUF4ZQAKCRD6PaqMvJYe
 9fOPD/4k66rEnZx1bcltQsDxExxiRvg+1E7N6vSbdZwdDdoAfcAPh97dyUxTdwGMDQknjNgsLJ7
 uPmSR7rBe1hPfqJOpperYQRfzsvh6Il09IaGmfXPJwAkGFL+9x3ulRhWKjJH71uU53CtrD9Di7x
 gHpIhobnx2q7cHzj1NkN6ajTWTpEOLllUnNeKsF8sic+pll/0O2nVvIASzsuY0BvWwRXFhGRbt5
 sn4yt2q75A/QBcAjgAe20mzsGbqYrtorSzHKU0LdZsaHLeeHe13MXr6VO07WZMLRzRK5HTISjeE
 DDe6xkl+5XjKQhZaA7xD3m1hXJJ4s4DMpH461VrZ8U5vGoTfTiK1naczP1fY2ZYTo/vLrpMGclU
 DX7OjTraZNMAL/XJr3oJNEgxdj2PQ+oM3bpQDW328TElKxBrZp2QJLPp+vKuf8qCrUI+Iqlhrj+
 +L2U8RFhAqOUQ2WQlw5GscsRw9CHaxFJsu6C8dE0pbGJdmXAq/9H1aiYypFacOgVMeVpyrdiQsh
 mFeCJN5y0b4Shh6F2jQsy+t4ibrHzHAzn/kkwlLyJ4Q8/QH6kSgAyu8yySSfNV7hIhAETft41sk
 lvT/+MJUoL/igFX3UPJ1dQaZS9ve5Gx4c9CM7wc/i6HFplVSBBiICTeBPlvNnJYVoHjsXDLjCy2
 2UaJLDKkNmwc6bA==
X-Developer-Key: i=tomi.valkeinen+renesas@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

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


