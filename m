Return-Path: <linux-media+bounces-35672-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 694A7AE4A54
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 18:16:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2F7EA1888501
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 16:11:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 528A52C08A0;
	Mon, 23 Jun 2025 16:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="VF8rYvYZ"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E15492BF3C5;
	Mon, 23 Jun 2025 16:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750694874; cv=none; b=Znz5YwT/i5CCr/IJHs7gWy+NIZGl80UBbA5WR55DZk32ElZ/IjuVuRfANkOi916+RRObC/A5gdfWk7z8BaTDBqfFt/aQeKfTaGdxzRSEXn66kRxhWky7tg8+rvzYWF9D3N1Zng2ADTyl7zHjAVIzhE7vjIMqPnZFF/SS4idQsfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750694874; c=relaxed/simple;
	bh=UTdif7JufIoFJNm1QPMJyIUlLbeXViK0TKeCIJV7eq4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CosOPHmJ92/jxyQLIviNaqTgCjh9Ja2qmOrSpZdLW8Xc7TJ+WSIvv70y4Ms+9uo9IkYUBT2S1GT8cHJfff6fEwJOofxKQZiJF8MN7/YE28/LAmTU7YxyybuHQsHJ229mHGSb9Kz2aXkGXd196o5OApzUjvlpiXpIIBFEzO7eoSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=VF8rYvYZ; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750694871;
	bh=UTdif7JufIoFJNm1QPMJyIUlLbeXViK0TKeCIJV7eq4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VF8rYvYZX32tFHupmDNnAwZMci2CVeh5DbdrqnR4SeumETbsR5JDgsQMTtVgCBZBM
	 IInd5QURDwxAnccc8Yh6K5FseR8gz5fGM9Lrm9CWyY1qhic487y3qXFeIKGSswvAS1
	 XoB7PtCC1aFDOwdG5VgS/vnSK1P1rJFpYoH+tuJfA0LNYs1aL8a+m8wKYusJzIq+iW
	 7hRsjcCE7rqzLJ0fgqtLPkyjap8qR1d03xrmNdof1Ky/MEwm+DFPQdukMDcgKpuCfs
	 S7AtuuAne1hkzDEynt5VQMA6f/mE57ivtmbvGmvhBvYnc9urd0YlYWq4HvUdGe5t9N
	 JJI6ba9Bt/DDQ==
Received: from trenzalore.hitronhub.home (unknown [23.233.251.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E557A17E1560;
	Mon, 23 Jun 2025 18:07:47 +0200 (CEST)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Alexey Charkov <alchark@gmail.com>,
	Dragan Simic <dsimic@manjaro.org>,
	Jianfeng Liu <liujianfeng1994@gmail.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Kever Yang <kever.yang@rock-chips.com>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Frank Wang <frank.wang@rock-chips.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Hans de Goede <hansg@kernel.org>,
	Yunke Cao <yunkec@google.com>,
	linux-media@vger.kernel.org,
	kernel@collabora.com
Subject: [PATCH 2/8] media: dt-bindings: rockchip: Add RK3576 Video Decoder bindings
Date: Mon, 23 Jun 2025 12:07:16 -0400
Message-ID: <20250623160722.55938-3-detlev.casanova@collabora.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250623160722.55938-1-detlev.casanova@collabora.com>
References: <20250623160722.55938-1-detlev.casanova@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The video decoder in RK3576 (vdpu383) is described the same way as the
one in RK3588 (vdpu381). A new compatible is added as the driver
implementation will be different.

Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 Documentation/devicetree/bindings/media/rockchip,vdec.yaml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/rockchip,vdec.yaml b/Documentation/devicetree/bindings/media/rockchip,vdec.yaml
index e9b82dc05fd1d..96b6c89387683 100644
--- a/Documentation/devicetree/bindings/media/rockchip,vdec.yaml
+++ b/Documentation/devicetree/bindings/media/rockchip,vdec.yaml
@@ -17,6 +17,7 @@ properties:
   compatible:
     oneOf:
       - const: rockchip,rk3399-vdec
+      - const: rockchip,rk3576-vdec
       - const: rockchip,rk3588-vdec
       - items:
           - enum:
@@ -104,7 +105,9 @@ allOf:
       properties:
         compatible:
           contains:
-            const: rockchip,rk3588-vdec
+            enum:
+              - rockchip,rk3576-vdec
+              - rockchip,rk3588-vdec
     then:
       properties:
         reg:
-- 
2.50.0


