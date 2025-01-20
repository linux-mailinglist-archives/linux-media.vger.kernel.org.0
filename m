Return-Path: <linux-media+bounces-24970-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 04F35A16D2F
	for <lists+linux-media@lfdr.de>; Mon, 20 Jan 2025 14:15:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9C4153A9AFC
	for <lists+linux-media@lfdr.de>; Mon, 20 Jan 2025 13:14:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41B621E98F3;
	Mon, 20 Jan 2025 13:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="O66a06qX"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FDFC1E571F;
	Mon, 20 Jan 2025 13:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737378710; cv=none; b=i9ZkpSXiAwNFG14RRYC4ucKrZ8wKJ2YYpXaqe+0iS5WryQoXa1d6bAdEAzH3rkI0V2nYWi4zFpwezadTteVN7/umFth7uYPmbX7pDO6ZR+txpkZis8L5WOfUdo0YmgaYv++SCF3ZuMn9C76PHofCF0j5AA/VtYEm1tHaX4g8yYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737378710; c=relaxed/simple;
	bh=vb/+NyJJH6WqOf9gan/UQHHHcah8dJBGTn6F9vFZyp8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kNV7Gk1PefVXr+SNYkyGjLr63yVJ4EFrJBOxi3ddUSwyAD31VM5W6uVI2l3D5xyLvJcJT19Da9Dp6X5RcHYou3QoiNlpjf3wUcLP2DZ9KTWIXxXWbE3LV514yBtaxBM5zgKpCYxzhKXFxK06TpEpqf4sbqa/xENSCSFbQr+aO+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=O66a06qX; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9300311EB;
	Mon, 20 Jan 2025 14:10:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1737378627;
	bh=vb/+NyJJH6WqOf9gan/UQHHHcah8dJBGTn6F9vFZyp8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=O66a06qXa8xW7gysP6Az6clEUkDec6f9EAZ7wA35HLKkJ+KMPnPwtQhGaXJUxBjmr
	 flJmP0Ml8rCQsmdGkxWT1/QQxwq6TfqN2lcCXqCsx0Uvj0iQud7i3ERFbYWgYQLkgr
	 z3phtU1gKOtN+7zkQfLRt1J+Lqnn9Kf8RSNfJWfg=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Date: Mon, 20 Jan 2025 15:10:43 +0200
Subject: [PATCH 10/10] media: rcar-csi2: Convert to
 .{enable|disable}_streams
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250120-rcar-media-impro-v1-10-043823c3893e@ideasonboard.com>
References: <20250120-rcar-media-impro-v1-0-043823c3893e@ideasonboard.com>
In-Reply-To: <20250120-rcar-media-impro-v1-0-043823c3893e@ideasonboard.com>
To: =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2555;
 i=tomi.valkeinen+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=vb/+NyJJH6WqOf9gan/UQHHHcah8dJBGTn6F9vFZyp8=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnjkt79re4sJKQL/QkUuHfQB9fi/MUCrXQ/YlnK
 Ur0xl1DyfqJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ45LewAKCRD6PaqMvJYe
 9QmGD/9llK7gc2nNq8wUo8r5bVN3KUqCqZadaqGVCEeL4BzT5ERmxjdRYd5Y0tHyoUR/9BUrGPq
 0nNAbEjpCkq2RRkqCY8/gmMO3mvMJ6YldJ4/1ZtRCJrtiEKUsycv2tnALUfM7wFi3WOhy4r/hor
 LaJzCg0EzODtTyFvkzkfXJkJ1ilp7k/g1PsjNilVYuuoBaLE1/P75UMpoHl1EJ3N0PdPozu9SCE
 IZJaS8RrACngctkjxHxPwDjr3YawVjj9GML6RtyqdMxjjdZxGj5S1za3NqnSZ2CLBKXqsttVc0k
 iXmAsf9I1MZVlmf2hTzQLMOVsRvxHYgztb06I2WwPJXvAbPcv4nW8gkKgbeeHXyQrgPCiRzx8HN
 4GUZDOChHRfqwwnQH5yIp6T9iguxZH8LpLfwD1pcMwkVeu6geLOUoZ8MmV+I4Wngz3RoZuwtWWy
 if5x/XRw8quLG2uPt1whzg0B9FXJ+gUfxeV45ZbY+S3TAougYVZkNMwx30M1mYjsnroQpJR0ijf
 mmWrkPCrzo0GgH6/vak1en7t1iS579LDCsOxjeivyUepPIsLl2Ou6y/7W8wzJWRq+2K4ct3SSZL
 xLOrjmUd10cU34fEAv4fQ6G4VK03RijMzegQ35nL9cEm7kOHOEw3U7E24geR8U55tYrNkS3iTeb
 IOS4rLXulKlh+CQ==
X-Developer-Key: i=tomi.valkeinen+renesas@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

Drop the legacy .s_stream and convert to .{enable|disable}_streams.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/rcar-csi2.c | 49 ++++++++++++++++++++----------
 1 file changed, 33 insertions(+), 16 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
index ff27a8845969..38a3149f9724 100644
--- a/drivers/media/platform/renesas/rcar-csi2.c
+++ b/drivers/media/platform/renesas/rcar-csi2.c
@@ -1593,28 +1593,47 @@ static void rcsi2_stop(struct rcar_csi2 *priv)
 	v4l2_subdev_disable_streams(priv->remote, priv->remote_pad, BIT_ULL(0));
 }
 
-static int rcsi2_s_stream(struct v4l2_subdev *sd, int enable)
+static int rcsi2_enable_streams(struct v4l2_subdev *sd,
+				struct v4l2_subdev_state *state, u32 source_pad,
+				u64 source_streams_mask)
 {
 	struct rcar_csi2 *priv = sd_to_csi2(sd);
-	struct v4l2_subdev_state *state;
 	int ret = 0;
 
+	if (source_streams_mask != 1)
+		return -EINVAL;
+
 	if (!priv->remote)
 		return -ENODEV;
 
-	state = v4l2_subdev_lock_and_get_active_state(&priv->subdev);
-
-	if (enable && priv->stream_count == 0) {
+	if (priv->stream_count == 0) {
 		ret = rcsi2_start(priv, state);
 		if (ret)
-			goto out;
-	} else if (!enable && priv->stream_count == 1) {
-		rcsi2_stop(priv);
+			return ret;
 	}
 
-	priv->stream_count += enable ? 1 : -1;
-out:
-	v4l2_subdev_unlock_state(state);
+	priv->stream_count += 1;
+
+	return ret;
+}
+
+static int rcsi2_disable_streams(struct v4l2_subdev *sd,
+				 struct v4l2_subdev_state *state,
+				 u32 source_pad, u64 source_streams_mask)
+{
+	struct rcar_csi2 *priv = sd_to_csi2(sd);
+	int ret = 0;
+
+	if (source_streams_mask != 1)
+		return -EINVAL;
+
+	if (!priv->remote)
+		return -ENODEV;
+
+	if (priv->stream_count == 1)
+		rcsi2_stop(priv);
+
+	priv->stream_count -= 1;
 
 	return ret;
 }
@@ -1641,17 +1660,15 @@ static int rcsi2_set_pad_format(struct v4l2_subdev *sd,
 	return 0;
 }
 
-static const struct v4l2_subdev_video_ops rcar_csi2_video_ops = {
-	.s_stream = rcsi2_s_stream,
-};
-
 static const struct v4l2_subdev_pad_ops rcar_csi2_pad_ops = {
+	.enable_streams = rcsi2_enable_streams,
+	.disable_streams = rcsi2_disable_streams,
+
 	.set_fmt = rcsi2_set_pad_format,
 	.get_fmt = v4l2_subdev_get_fmt,
 };
 
 static const struct v4l2_subdev_ops rcar_csi2_subdev_ops = {
-	.video	= &rcar_csi2_video_ops,
 	.pad	= &rcar_csi2_pad_ops,
 };
 

-- 
2.43.0


