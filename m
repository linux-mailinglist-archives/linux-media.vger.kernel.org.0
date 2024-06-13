Return-Path: <linux-media+bounces-13188-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98E40907448
	for <lists+linux-media@lfdr.de>; Thu, 13 Jun 2024 15:50:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 30C29287C2D
	for <lists+linux-media@lfdr.de>; Thu, 13 Jun 2024 13:50:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AFD7145A03;
	Thu, 13 Jun 2024 13:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="cPROAiVX"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D6E0144D18;
	Thu, 13 Jun 2024 13:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718286640; cv=none; b=ByGOAQVS07CLg1Oj9HAKKplWkkz0ju9tGYMheTLtiv0d74OOxotE5aJ4ZUfZjxMyCDA0Ing6chFDxXaFmxpvYil5MyYYMoS284U3bg74uGKCG4+CimIBfAVyE5tGcHzpduf4SFfSrYNeX4HjDBfjFajp2xq1Up+atkp/u7ytQZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718286640; c=relaxed/simple;
	bh=qT3T7wi3nE+eFhkZ2bUnCRb/SyRrxFgNwM5t87xUarI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qME1jon14AJTdwPE7y8fY6IP0jVOLwn9rxNKYTsrr9OfTB9UtbLX/6wxn7hukWBD8+aeGxOZ7sWo8mpaRpJcpUxUAuPEWSrhfX614qZExrmAZDjgO1ilgsO+57I2Q51h+UJT9XVLtHfRPtBPc/f71vtSt1yneuM7eNUiDtDizi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=cPROAiVX; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1718286636;
	bh=qT3T7wi3nE+eFhkZ2bUnCRb/SyRrxFgNwM5t87xUarI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cPROAiVXeeUDKIBYFW2Vw1uHI6CZqvs99dmHUIt+mEt5T+f4QyliV258zRnEJ7/tc
	 fCJld725QP2D4L/m7sPxyvCGewAqxapNDZBDhhe/fzisKouRruezQXvzPfx2F1xFUt
	 JnlGvMO7RNzitdYE3vxxfQ6sRtkaKDjGLmf8835S4pC6A5rz7r9Jv5f0WUMnckUIiS
	 XPZDC2//kmfxMZ4f4uvp0W06iU7GNk3WSNDtVt1llLYA6zTCfwOJfIsWdrmfrQZ1Tj
	 zg9apN2V+NBVKChcB88n+EUvkK4aXUGo6kNEDq/mXMf3BQLyxSYmQlH/zQPBSW7ko2
	 8n+kQ11XxUAzA==
Received: from jupiter.universe (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 891C33782199;
	Thu, 13 Jun 2024 13:50:36 +0000 (UTC)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 34ECC4800CD; Thu, 13 Jun 2024 15:50:36 +0200 (CEST)
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
Subject: [PATCH v6 2/6] media: dt-bindings: rockchip-vpu: Add RK3588 VPU121
Date: Thu, 13 Jun 2024 15:48:43 +0200
Message-ID: <20240613135034.31684-3-sebastian.reichel@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240613135034.31684-1-sebastian.reichel@collabora.com>
References: <20240613135034.31684-1-sebastian.reichel@collabora.com>
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


