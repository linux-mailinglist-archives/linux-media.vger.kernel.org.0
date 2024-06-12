Return-Path: <linux-media+bounces-13070-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D6509905A00
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2024 19:32:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 608E3B2604E
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2024 17:32:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C1EC183084;
	Wed, 12 Jun 2024 17:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="f7WvOn48"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86929EBB;
	Wed, 12 Jun 2024 17:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718213545; cv=none; b=l3Qb/TAXnhGGqukEQP1ueufO+tneV1vIOiX9pMHuUmN0nv8vmGOQHCivJfAWAld91HLcD+Y26FV/XIxIgZxF9BOe2gMeTdmEniAtLgtX7v3+nuym9EGB+iKhlFgiO9zDUQMhbIamuwyRqT3nVXtybFFJ6BgGw1hjNon/3e8rlgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718213545; c=relaxed/simple;
	bh=qT3T7wi3nE+eFhkZ2bUnCRb/SyRrxFgNwM5t87xUarI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bV1Fc+qKxPLZTi5UWv1JDqxBEXVQf7WG7PpqBs+U9Xfv74vG3olXvBhAzAWnRrCRr8UZ2P7BwTOsfZlR+7P+0oqp4x9HaK2fMaTRgKkJRqAWgs+o8mJo2TfFsSsIO1RpUFEbAOrvk1foy0WVggimiGIyPcEpdY/PpOM9PA1eFTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=f7WvOn48; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1718213541;
	bh=qT3T7wi3nE+eFhkZ2bUnCRb/SyRrxFgNwM5t87xUarI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=f7WvOn48Zarlf+9C1J/sh6Z/Qf3l8ugftHR2RXi05xjXmPAVPn3HjySLkto+GtntX
	 IOcxZwleqeeZ1J1OnqV5vDMMTvxM11ChjP/M0zv9VzWVZuJo3kv0ubKb8vix9N5BGt
	 u8gV9bXASfQhuLm9mq3Mzr54L8lgRXRhkoCI5ZtOxH6wimSzF+2+Trmp5iE5cq3vmq
	 d4Ie6pjUHsnHQHA3ZlfJjNRu/o2P8IepqEcJFqg75Jor1FUiwKYLR+a/i1X74HsLby
	 H8Cs/5K9cnxsB00lS6tGXP2d2rMWz8mSONzemrQVQnrDySR3dPHW0iO4wDtdMWlHbH
	 sTN6WPobSMLJQ==
Received: from jupiter.universe (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id B4D8937821A0;
	Wed, 12 Jun 2024 17:32:21 +0000 (UTC)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 5CAC14800CD; Wed, 12 Jun 2024 19:32:21 +0200 (CEST)
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
	Conor Dooley <conor.dooley@microchip.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: [PATCH v5 2/5] media: dt-bindings: rockchip-vpu: Add RK3588 VPU121
Date: Wed, 12 Jun 2024 19:15:42 +0200
Message-ID: <20240612173213.42827-3-sebastian.reichel@collabora.com>
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

From: Jianfeng Liu <liujianfeng1994@gmail.com>

RK3588 has four Hantro H1 VEPUs (encoder-only) modules and one combined
Hantro H1/G1 VPU (decoder and encoder). These are not described as
separate IP, since they are sharing an internal cache. This adds the
RK3588 specific compatible string for the combined VPU, which seems to
be identical to the version found in the RK3568.

Signed-off-by: Jianfeng Liu <liujianfeng1994@gmail.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 Documentation/devicetree/bindings/media/rockchip-vpu.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/rockchip-vpu.yaml b/Documentation/devicetree/bindings/media/rockchip-vpu.yaml
index c57e1f488895..2710bb2fb0d1 100644
--- a/Documentation/devicetree/bindings/media/rockchip-vpu.yaml
+++ b/Documentation/devicetree/bindings/media/rockchip-vpu.yaml
@@ -31,6 +31,9 @@ properties:
       - items:
           - const: rockchip,rk3228-vpu
           - const: rockchip,rk3399-vpu
+      - items:
+          - const: rockchip,rk3588-vpu121
+          - const: rockchip,rk3568-vpu
 
   reg:
     maxItems: 1
-- 
2.43.0


