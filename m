Return-Path: <linux-media+bounces-13596-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3536C90DBB2
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2024 20:38:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4812E1C2264B
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2024 18:38:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CC2015EFD4;
	Tue, 18 Jun 2024 18:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="cNu4QMr4"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1137156F25;
	Tue, 18 Jun 2024 18:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718735902; cv=none; b=KTJAJuwKvQqk9GGNa/nJ8z6K8OHiMsQGTafi+Kj+NG+B2k2FwNXmuidb/qt/Raaj2lywhE8rtrEB6cGZ5F2OdoRQc+0ySw8vSwZw4JqZRwwiBq6LSUin/H+co4grNXMKRQYHnm3cB/fLMRhYejCKrJcPsvlTzMlLPNz71BX8AK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718735902; c=relaxed/simple;
	bh=ewO028FP+/fLIGrTwi46vVYeQqRp4FQ65WxGYZ1bq94=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NUKTzFsE67o7+w06WK/j/g7AYs6ZpQHUtcmuYKKPBqljTX5nyeXbxrr0zsafJlnEw9dhAwxf+Tq1bEaCQqWa3qHb5WXpoBJLcTf/jYNsiqReCAgkLokw0Kq98CpiDH/H+GU4bImmYdLhomSjkzfoct/OcsyYuJmS79ePsTdHF4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=cNu4QMr4; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1718735897;
	bh=ewO028FP+/fLIGrTwi46vVYeQqRp4FQ65WxGYZ1bq94=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cNu4QMr4W6+iL0HYbR8gw5sDoyO1SbWARXZq6VmtX3p3M/ahMCS/ysaOF27bSTDez
	 zZXyNDWhE4T24bE22Y61KNCwd8p1e04YAE8WdkMUH+FgmuFKsIPqAUW2RdM467duMd
	 kStKyMPSjSIiXwoW8pFTgJgDF45uSYvCm7wtfV4oW+RcZXL9c55gn98fQIfGGIjfnd
	 ZfI80k/HiO7p+LYV4ntHtTx4E33zswntOnC4Hx9hEhzh0h2z8b7YcBNOtpw+4HqG7x
	 +9df9up0g9YDicRnk5xBmChLCguB6ZeW2QlScUzhAxJXjb9i+PxAiIWUO01sAEwZNO
	 Yarbm3ZqxLwpw==
Received: from jupiter.universe (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 99EA53782196;
	Tue, 18 Jun 2024 18:38:17 +0000 (UTC)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 2BFCC4800C7; Tue, 18 Jun 2024 20:38:17 +0200 (CEST)
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
Subject: [PATCH v7 1/6] media: dt-bindings: rk3568-vepu: Add RK3588 VEPU121
Date: Tue, 18 Jun 2024 20:18:32 +0200
Message-ID: <20240618183816.77597-2-sebastian.reichel@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240618183816.77597-1-sebastian.reichel@collabora.com>
References: <20240618183816.77597-1-sebastian.reichel@collabora.com>
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
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 .../devicetree/bindings/media/rockchip,rk3568-vepu.yaml          | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/media/rockchip,rk3568-vepu.yaml b/Documentation/devicetree/bindings/media/rockchip,rk3568-vepu.yaml
index 9d90d8d0565a..947ad699cc5e 100644
--- a/Documentation/devicetree/bindings/media/rockchip,rk3568-vepu.yaml
+++ b/Documentation/devicetree/bindings/media/rockchip,rk3568-vepu.yaml
@@ -17,6 +17,7 @@ properties:
   compatible:
     enum:
       - rockchip,rk3568-vepu
+      - rockchip,rk3588-vepu121
 
   reg:
     maxItems: 1
-- 
2.43.0


