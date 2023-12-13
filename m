Return-Path: <linux-media+bounces-2339-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D67068110F5
	for <lists+linux-media@lfdr.de>; Wed, 13 Dec 2023 13:20:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 14F16B20F5D
	for <lists+linux-media@lfdr.de>; Wed, 13 Dec 2023 12:20:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A023F28E2A;
	Wed, 13 Dec 2023 12:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="NZZ2v/cs"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [IPv6:2a00:1098:ed:100::25])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2DB4CD;
	Wed, 13 Dec 2023 04:20:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1702470029;
	bh=tE9lejZ6+1W68lWo5ayV1iSQspAij2+WbiKQT0W05Fw=;
	h=From:To:Cc:Subject:Date:From;
	b=NZZ2v/cscYsHaD0R/dEw+WSkCXywzErHcJdJc98BKZsC9AyjQUiIXCXH+kT9EtKf2
	 JLqQdztraaZ4UBcyFSrNdTYlPEG+WdWqSKN7p0QFBLaxW+IuQqHJgAv6Xhj/TdvghA
	 S8Ypvalbaty6H0dWCJX/HKGcFFVb/ScVyA/qb0Dn4UQ2QswXXFIkbJ4KD6eHINqlpG
	 WiCeTtEv4aJWClR6YOrd45YvULufuWuWld3ZGvRxtRUfFrc+jXo6+rmV3x6XreTe3o
	 Dt17CwN3/e551wu7IZppG5pjNIfFNrQXmh8WCSp6gV1rIw0VWTV2FZjzJF1Oyk86jU
	 IX6BV4a2UAl9w==
Received: from eugen-station.. (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: ehristev)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 315F73781478;
	Wed, 13 Dec 2023 12:20:28 +0000 (UTC)
From: Eugen Hristev <eugen.hristev@collabora.com>
To: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	angelogioacchino.delregno@collabora.com,
	kernel@collabora.com,
	eugen.hristev@collabora.com,
	tiffany.lin@mediatek.com,
	andrew-ct.chen@mediatek.com,
	matthias.bgg@gmail.com
Subject: [PATCH 1/4] dt-bindings: media: mtk-vcodec-encoder: add dma-ranges
Date: Wed, 13 Dec 2023 14:20:14 +0200
Message-Id: <20231213122017.102100-1-eugen.hristev@collabora.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As IOMMUs are supported, dma-ranges is not mentioned but
additionalProperties=false, thus we have an error when adding dma-ranges.
Add dma-ranges as a possible property because this may be present.

Signed-off-by: Eugen Hristev <eugen.hristev@collabora.com>
---
 .../devicetree/bindings/media/mediatek,vcodec-encoder.yaml      | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml b/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml
index a2051b31fa29..403530de5624 100644
--- a/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml
@@ -38,6 +38,8 @@ properties:
     minItems: 1
     maxItems: 5
 
+  dma-ranges: true
+
   assigned-clocks: true
 
   assigned-clock-parents: true
-- 
2.34.1


