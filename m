Return-Path: <linux-media+bounces-13072-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CF01B905A04
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2024 19:32:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7F6961F22818
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2024 17:32:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A6361836C8;
	Wed, 12 Jun 2024 17:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="R3rVf2+k"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 869D0176ACD;
	Wed, 12 Jun 2024 17:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718213545; cv=none; b=od4vzerB9rWM3puFV3B+FRud3lIjXGtiQHgGuDEus7FbA9Za36vqVT2FR7vlQH0Mlz3XXwbhzoLHZWVTcMDyXvAWozKubkFSpSZdrFQTq7KtYfYaQqV/4L+XocrDTidmfqklnJQmizmUzWN/F/DpiTTpxX4wNbBg0Ot1vmvdOtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718213545; c=relaxed/simple;
	bh=VEM0T7Y24bsYJeE8dDbB44Yk+1yMMARS0IlFh2wyh1Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t1RYAwpxE3ygrLWtfCQ8n3HtBRiSJgRClcEYnyw4wuO/rIqyKfMw6aBhRsQMFZgbkkyszsVLgnBfhxWnPgnGIhSNhEoPzRyPR04QmhUVR39LwktIrQrXh9k0D9d3FVqaq9UNKDekhPJVmPTBvUeysHlafzomcG599fOMH4oXY9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=R3rVf2+k; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1718213541;
	bh=VEM0T7Y24bsYJeE8dDbB44Yk+1yMMARS0IlFh2wyh1Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=R3rVf2+kdqNlzYfHpH2RTI8JqDoN2WFj5syMa9mpmmfCqCuqhgtRLmNVKdsspwBUu
	 UmJ/XQVmUmcmcGjVEN+dNTpJZKKJSCnq8omeNZqW3B/7ILsrEAZXYTUcWcxvPftGCN
	 WDL2EN4F+wu7myRdZKewoEck5+Z+rl4BGkQlS/e+F/RtN8WyGCh28HpGnhuKLYTU9w
	 kRKBRMHryUnDnuJiH51FKgXXKz5yM6+m/+1NkhnteJBO9N2BdFe8nit7cSzdFhVIge
	 HbwdYPDHOjoSfpZcdglomxNvmYYb8D4RA68MeQecWVzwh0uBzbR+FZ7HyHktwJoDx5
	 UCGb95SQ8XjEg==
Received: from jupiter.universe (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id AB3E9378219F;
	Wed, 12 Jun 2024 17:32:21 +0000 (UTC)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 5A8AC4800C7; Wed, 12 Jun 2024 19:32:21 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jianfeng Liu <liujianfeng1994@gmail.com>,
	Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel@collabora.com,
	Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: [PATCH v5 1/5] media: dt-bindings: rk3568-vepu: Add RK3588 VEPU121
Date: Wed, 12 Jun 2024 19:15:41 +0200
Message-ID: <20240612173213.42827-2-sebastian.reichel@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240612173213.42827-1-sebastian.reichel@collabora.com>
References: <20240612173213.42827-1-sebastian.reichel@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

This encoder-only device is present four times on this SoC, and should
support everything the rk3568 vepu supports (so JPEG, H.264 and VP8
encoding). No fallback compatible has been added, since the operating
systems might already support RK3568 VEPU and want to avoid registering
four of them separately considering they can be used as a cluster.

Signed-off-by: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 .../devicetree/bindings/media/rockchip,rk3568-vepu.yaml      | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/rockchip,rk3568-vepu.yaml b/Documentation/devicetree/bindings/media/rockchip,rk3568-vepu.yaml
index 9d90d8d0565a..8b9496e6a2bb 100644
--- a/Documentation/devicetree/bindings/media/rockchip,rk3568-vepu.yaml
+++ b/Documentation/devicetree/bindings/media/rockchip,rk3568-vepu.yaml
@@ -15,8 +15,9 @@ description:
 
 properties:
   compatible:
-    enum:
-      - rockchip,rk3568-vepu
+    oneOf:
+      - const: rockchip,rk3568-vepu
+      - const: rockchip,rk3588-vepu121
 
   reg:
     maxItems: 1
-- 
2.43.0


