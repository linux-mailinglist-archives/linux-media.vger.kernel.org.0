Return-Path: <linux-media+bounces-28387-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A884A660E9
	for <lists+linux-media@lfdr.de>; Mon, 17 Mar 2025 22:46:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CD55017A9B2
	for <lists+linux-media@lfdr.de>; Mon, 17 Mar 2025 21:46:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 927C22036E5;
	Mon, 17 Mar 2025 21:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F9FWQx+R"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E74A58C1F;
	Mon, 17 Mar 2025 21:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742247987; cv=none; b=OjHC6UQuXA0LkcgoMyVhWeBzVxYwXn2+2kV7mWTQsN4tvOoDGmBmbHyyOcFHKTaY3EOiuehz1JyJlVRhUl37b4bpChSJkPHvaoec19MmG+EPyWmYkOOvK+nYwY9bVDZUPhcjtNKTk6VEfGEj6feeuwysNrL9OxsCsW7VADtVjLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742247987; c=relaxed/simple;
	bh=0accdJFRM4wuKrCBKOEVJXqhkfwUSg1V628c8C8UWIQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=J+wiyzRXqXkt8Saqyi51k/7TdF5ztuk7xHDkYbxpoLsOjQPMr1VPp2lYRoAbwUHzjiuWoKGsChQESLxptdShJbu8eePuNe6kynwgNaplgAPtOx0TtfxKPXoQtQlEFsIl9h4wMqLDCZd3bA94AWipmn+tz45ZtNSvm+1+u8boQGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F9FWQx+R; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1062BC4CEE3;
	Mon, 17 Mar 2025 21:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742247986;
	bh=0accdJFRM4wuKrCBKOEVJXqhkfwUSg1V628c8C8UWIQ=;
	h=From:To:Cc:Subject:Date:From;
	b=F9FWQx+R1+a3U7blCqh9czAaCATGyXzaqFTDP4g7fsXwNs+voCN7aea68gmBqXxFh
	 RdgerCAYsM9gyIzuj70E0/Eje5jb6vsQeOfCmlJxRIsF1iYjT+TVEYvRG8UFIYamMk
	 SbxUlahQ3qTQyp4jUi8ErTaF0whBgCR7rl1qfbLVvMiSTOuGTBwpYRe6WqnAzyK7Ui
	 Dm4GRXl2Ko6ZrCqBvi9tc70BDTbZg95PCguKmRXm9kMeVcoW/iIt3B1A0TTpqufCtw
	 XRTFP3G11drz7jQBC8LUrmFLWMyxsSHkF7LLqk7kqVEVJ44khmr7ZABYszDVQRboCU
	 PCn57/m6S5s4w==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Tiffany Lin <tiffany.lin@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] media: dt-bindings: mediatek,vcodec-encoder: Drop assigned-clock properties
Date: Mon, 17 Mar 2025 16:46:20 -0500
Message-ID: <20250317214621.794674-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The assigned-clock properties are always allowed on nodes with
'clocks' and generally not required. Additionally the mt8183 doesn't
define them, so they must not be required in that case.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/media/mediatek,vcodec-encoder.yaml  | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml b/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml
index 110e8f5f1f9e..ebc615584f92 100644
--- a/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml
@@ -41,10 +41,6 @@ properties:
     minItems: 1
     maxItems: 5
 
-  assigned-clocks: true
-
-  assigned-clock-parents: true
-
   iommus:
     minItems: 1
     maxItems: 32
@@ -78,8 +74,6 @@ required:
   - clocks
   - clock-names
   - iommus
-  - assigned-clocks
-  - assigned-clock-parents
 
 allOf:
   - if:
-- 
2.47.2


