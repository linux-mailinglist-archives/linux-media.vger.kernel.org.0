Return-Path: <linux-media+bounces-36853-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B2897AF9757
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 17:54:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 52B633A89B2
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 15:53:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C95F12D9487;
	Fri,  4 Jul 2025 15:53:56 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D53E21E3772;
	Fri,  4 Jul 2025 15:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751644436; cv=none; b=uIhFGTISxJPkSecViGEjfBvBnvKDr2iYTXgIf6k0kDlCGLYg732cUMXrU2Q8jj6JIRBea0H/CBgMI9ZGUH84XVWzOyBouIlpW7Ta/SDgWrwg0z9+XDkXsf6n7lhQm5BSJzE8uvmrpv/ApxOuJODcSp781QCG9gDfO1xxkIx7O7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751644436; c=relaxed/simple;
	bh=0ntha8xfUpHF2jHsuenBQgWYSUELO8vbmsaXkYuPhpM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WLEeJbsF5lxUVPA7v2sE9tIQE7bzRP2OmAr1AneaGz+5iAzPPB4lgZmSe1YALtJmnDJRWFiYFL9yB2EsW0hM12btecLxImqFiyRDlcZwdmSh6RO+DmwcRU/hFZxaEd8ozZsYfDigpjYrwDNdmh4aKMgrKGfZmHWwipBebrBnANA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id E695D1F00047;
	Fri,  4 Jul 2025 15:53:52 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 7B821ACA67D; Fri,  4 Jul 2025 15:48:35 +0000 (UTC)
X-Spam-Level: *
Received: from localhost.localdomain (unknown [192.168.1.64])
	by laika.paulk.fr (Postfix) with ESMTP id 82FF0ACA650;
	Fri,  4 Jul 2025 15:46:34 +0000 (UTC)
From: Paul Kocialkowski <paulk@sys-base.io>
To: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Cc: Yong Deng <yong.deng@magewell.com>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Maxime Ripard <mripard@kernel.org>
Subject: [PATCH v8 2/9] dt-bindings: media: sun6i-a31-isp: Add optional interconnect properties
Date: Fri,  4 Jul 2025 17:46:19 +0200
Message-ID: <20250704154628.3468793-3-paulk@sys-base.io>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250704154628.3468793-1-paulk@sys-base.io>
References: <20250704154628.3468793-1-paulk@sys-base.io>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

An interconnect can be attached to the sun6i-a31-csi device, which is
useful to attach the dma memory offset. Add related properties.

Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
---
 .../devicetree/bindings/media/allwinner,sun6i-a31-isp.yaml  | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/allwinner,sun6i-a31-isp.yaml b/Documentation/devicetree/bindings/media/allwinner,sun6i-a31-isp.yaml
index 3ea4a4290f23..c0d7accc7bbe 100644
--- a/Documentation/devicetree/bindings/media/allwinner,sun6i-a31-isp.yaml
+++ b/Documentation/devicetree/bindings/media/allwinner,sun6i-a31-isp.yaml
@@ -36,6 +36,12 @@ properties:
   resets:
     maxItems: 1
 
+  interconnects:
+    maxItems: 1
+
+  interconnect-names:
+    const: dma-mem
+
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
 
-- 
2.49.0


