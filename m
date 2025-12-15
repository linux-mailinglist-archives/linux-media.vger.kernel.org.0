Return-Path: <linux-media+bounces-48773-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E0ACCBD0F6
	for <lists+linux-media@lfdr.de>; Mon, 15 Dec 2025 09:57:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 393053029233
	for <lists+linux-media@lfdr.de>; Mon, 15 Dec 2025 08:54:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3ED31329C5E;
	Mon, 15 Dec 2025 08:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="FdqBJqgb"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5B4E23AB81;
	Mon, 15 Dec 2025 08:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765788839; cv=none; b=ryEJSO/ab4aINhNqEuUznxeRz2NKAYRYLstcGoxfVOWwQPLoMWZ6NdzlIliJ1eUhzyYc+ip2gPeuapW2lr7kHbqVsaUXCMtdvOTE4qXgbAw1OHIru7cavCidGCOHkP3KSzVsZfSpWqkVAaGe2g8+upQNKB47KRelPuU7OOoo3cI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765788839; c=relaxed/simple;
	bh=kzz1stJ/eG8rdi6weyOcBPC+8rDtte6uRtWAAV5e9pQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Prda8nlrqE+7rCxOhaCWw18IWw7IYwRZZcopLwLn/BPynuvx0SiDW5BNUCw/kU2gDxtwhEzh4jVsO3VRBt/anFANJOhb5pGuIGbOj+3EJrxdy9d7+CV6VvPqdJKIbi2VmHHytj1sDX9hZoQxZDb7gxrNJZZ+0mlo2BYTGU1qib0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=FdqBJqgb; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1765788836;
	bh=kzz1stJ/eG8rdi6weyOcBPC+8rDtte6uRtWAAV5e9pQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FdqBJqgbgO4rg/utzEuHDO8ST6hY0P4uIhZAqWvS+yeknyVAxYUeJgBak36GtRl7b
	 9OnZn63oTAAjkiB5cRsCmtdrh6lagV96iCywl4Q1yv+Wu7Q0oVoOQ6v61KSDcf4jDM
	 WA36baNEDU5mR73o8mQ+li7auxftPELKti7j7p7F3vtDxPH6U6vBM8HQzncT9ZzMl4
	 t1ZKVjM2mz70tqltCSV9lhPsNM8xlVEVmqkOW3519mZbEJWgOEC2OUGmsz5OAnVyqK
	 uGdWLuIgYr6xKWLFh75wfOO5yoOBcqlkEPQVxkHtj4sh9zskEu8Cvq+wvm22flXDMA
	 smUipC4SGFtNg==
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:c17e:135b:5095:83a8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9CA1017E13B9;
	Mon, 15 Dec 2025 09:53:55 +0100 (CET)
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de,
	nicolas.dufresne@collabora.com,
	p.zabel@pengutronix.de,
	mchehab@kernel.org
Cc: iommu@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-media@vger.kernel.org,
	kernel@collabora.com,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v10 1/7] dt-bindings: vendor-prefixes: Add Verisilicon
Date: Mon, 15 Dec 2025 09:53:38 +0100
Message-ID: <20251215085349.10155-2-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251215085349.10155-1-benjamin.gaignard@collabora.com>
References: <20251215085349.10155-1-benjamin.gaignard@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Verisilicon Microelectronics is a company based in Shanghai, China,
developping hardware blocks for SoC.

https://verisilicon.com/

Add their name to the list of vendors.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index c7591b2aec2a..ce5c413948b1 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1745,6 +1745,8 @@ patternProperties:
     description: Variscite Ltd.
   "^vdl,.*":
     description: Van der Laan b.v.
+  "^verisilicon,.*":
+    description: VeriSilicon Microelectronics
   "^vertexcom,.*":
     description: Vertexcom Technologies, Inc.
   "^via,.*":
-- 
2.43.0


