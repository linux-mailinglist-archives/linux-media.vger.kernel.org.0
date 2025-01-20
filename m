Return-Path: <linux-media+bounces-24966-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 924D7A16D19
	for <lists+linux-media@lfdr.de>; Mon, 20 Jan 2025 14:13:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CD056161283
	for <lists+linux-media@lfdr.de>; Mon, 20 Jan 2025 13:13:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B6291E3DFD;
	Mon, 20 Jan 2025 13:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="l4ORFvvj"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 067541E3793;
	Mon, 20 Jan 2025 13:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737378704; cv=none; b=KCgjl7u8ORMBD4jUDdeN8ITb2F/nIHb14d3BF5M41Vl7IiRM+e8XStHjSfA1fIMRO9dBp60ilXONCbJtj+rMA1XiKvA2CunfHMUj/JC5tAIbFZT0KNB/QlEaJGim2up67gFrX/jJzNOk5T2QQrQsD5HCc3VMYWddRl+ZoBLWEyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737378704; c=relaxed/simple;
	bh=X+TlKfpYSyW/I55G4eeXWUbG0Mub9IhXrQ8tx05iH5I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B/sReCtDYtnWHLzCWEbhTG1qo79Tc46VrWpgm6saXa+sQMv00pxlU329sYXrQFplBQRIIn6eFy9mhz9Vyf375YdrqHZjw2XpN97KjZy631OVLUenp20OmmtJASbhCjQtfa0A6905xmD/75fyxFawLBtWHhatEp3Y3QqvZ3WtF4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=l4ORFvvj; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 989FB11DF;
	Mon, 20 Jan 2025 14:10:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1737378625;
	bh=X+TlKfpYSyW/I55G4eeXWUbG0Mub9IhXrQ8tx05iH5I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=l4ORFvvjmBhJvnEpJpIJY6031sgDAR5YTefX91/V4D5hE49Pfkf3N8itTq3ixwG+A
	 5nv8fIfLwhTbjSo8YX2PSIVjPwciO2euW8qFwEKhm5JiKaa9Z44/6o7zTMC17dSnSN
	 jbsesw/b+FgM8ghL/GNEiqweowReS6vsfic++0ks=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Date: Mon, 20 Jan 2025 15:10:39 +0200
Subject: [PATCH 06/10] media: rcar-isp: Use
 v4l2_subdev_{enable|disable}_streams()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250120-rcar-media-impro-v1-6-043823c3893e@ideasonboard.com>
References: <20250120-rcar-media-impro-v1-0-043823c3893e@ideasonboard.com>
In-Reply-To: <20250120-rcar-media-impro-v1-0-043823c3893e@ideasonboard.com>
To: =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1684;
 i=tomi.valkeinen+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=X+TlKfpYSyW/I55G4eeXWUbG0Mub9IhXrQ8tx05iH5I=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnjkt5OMiy7omIOfdsETsOqDwFYMYq3uRGsrq4w
 sekkJy7XYaJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ45LeQAKCRD6PaqMvJYe
 9XI5D/wI83N2zbRkchmiZIFThu/BdnE3tTNmaTOWT3oWsW6hLL9J0OUtj/X3gZ9FuMgc1yI8OZE
 UkPEqkoqn63vavpqYegjn128CqkVgTRAIQnwfjwUu10pjTabXppJ2v5UFV+H11HBI2aV7iJ3ge3
 gz/tvMSo5ny6btQD537QkECgmnbc3C7nsCt7dSGkymEMngoBlecP5ggZp41+eaxZby0ObojjcCh
 FwM8f7TeYEa3wbsP/BPIRSjwT7mrBNuyYfn9ip3EiOdTUDqNhOJluL4GdSiJTHceVspAV7cKNzt
 Jf/L0pBJAbiBUnjwnwbw7T7RftNO8mC4MUs35CdGKJ4lRG0vmwT7n1Arnp8Y+8iS/cKZ+gs8CBi
 25XQCTGYqABNIP4bPStH9X9Pq7n/qs2mE/xv4AkX3m2p/j9uyVk/WFceBsWVaJbrnXqRPalwUUT
 SocD/9Q6l23Bu5qCAjqBNZxRhlwuC1T6t/YNn2YfNeGfmJw3lEgoeaaWpYqRfYQySok4TomlHKY
 NPKnUjp0zTxNTyQecwRHJYtstRkWtQs9qB9PQ8YrYO4221hHGe7tmH9Gs12n+9BiBJFEUs1PJhy
 GKjSpqAUwMNriezN0/+FgO3dA4ir3/xckWbvN2WInYogHKug+kg5Glt8VWm75tGhTQXlyFqdHfd
 wl6LQDvFHgMk7DA==
X-Developer-Key: i=tomi.valkeinen+renesas@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

Use v4l2_subdev_{enable|disable}_streams() instead of calling s_stream
op directly. This allows the called subdev to drop the legacy s_stream
op.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/rcar-isp.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-isp.c b/drivers/media/platform/renesas/rcar-isp.c
index 121fa7524ee1..385fafb2318f 100644
--- a/drivers/media/platform/renesas/rcar-isp.c
+++ b/drivers/media/platform/renesas/rcar-isp.c
@@ -169,6 +169,7 @@ struct rcar_isp {
 
 	struct v4l2_async_notifier notifier;
 	struct v4l2_subdev *remote;
+	unsigned int remote_pad;
 
 	struct mutex lock; /* Protects mf and stream_count. */
 	struct v4l2_mbus_framefmt mf;
@@ -267,7 +268,8 @@ static int risp_start(struct rcar_isp *isp)
 	/* Start ISP. */
 	risp_write(isp, ISPSTART_REG, ISPSTART_START);
 
-	ret = v4l2_subdev_call(isp->remote, video, s_stream, 1);
+	ret = v4l2_subdev_enable_streams(isp->remote, isp->remote_pad,
+					 BIT_ULL(0));
 	if (ret)
 		risp_power_off(isp);
 
@@ -276,7 +278,7 @@ static int risp_start(struct rcar_isp *isp)
 
 static void risp_stop(struct rcar_isp *isp)
 {
-	v4l2_subdev_call(isp->remote, video, s_stream, 0);
+	v4l2_subdev_disable_streams(isp->remote, isp->remote_pad, BIT_ULL(0));
 
 	/* Stop ISP. */
 	risp_write(isp, ISPSTART_REG, ISPSTART_STOP);
@@ -387,6 +389,7 @@ static int risp_notify_bound(struct v4l2_async_notifier *notifier,
 	}
 
 	isp->remote = subdev;
+	isp->remote_pad = pad;
 
 	dev_dbg(isp->dev, "Bound %s pad: %d\n", subdev->name, pad);
 

-- 
2.43.0


