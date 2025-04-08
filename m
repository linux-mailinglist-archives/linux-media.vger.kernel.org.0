Return-Path: <linux-media+bounces-29572-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A2DB3A7F3BF
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 06:40:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BD3973B1E95
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 04:40:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0386425F999;
	Tue,  8 Apr 2025 04:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JOcmEBF6"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4438920897E;
	Tue,  8 Apr 2025 04:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744087205; cv=none; b=bYidAg0AUiMqfMWC0DpacSETBlVk5qHC4Imp7eGIbsmno8zevmsoP0orQW4eCe2uW1LZMyrsmcuPjWykc9PP+HiZw1U1zhU9CuNYieT4+qGbx2ajIdXgt0iQNXcjeS2GlH9N04shkHCbyfm/IUaa/XJfEsMeL4Pp0abhjFwUftg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744087205; c=relaxed/simple;
	bh=RNcRiM7n8szI07JS6f/BwWB0N8Q1bvbkV8to3cBk5/o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Fe7XMrGe05F2zcM6l1o1D+JZPOdeBBOv7Qqn0qteikA4PhSxXy0sHisWOyCcVVeyS2OeOnhVfMO/J1BLYO8GYig533TKdP6cNduNRZSviiKrjmK/0jwziibdvX293D3OXJHRqtxRioqAH57b7DojkEkL90Dh9fr6h4r3zAGKqqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JOcmEBF6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9B03EC4CEE9;
	Tue,  8 Apr 2025 04:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744087204;
	bh=RNcRiM7n8szI07JS6f/BwWB0N8Q1bvbkV8to3cBk5/o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=JOcmEBF6Oh73inGdnv4NUfuJ337ThIhUbxBgA3vNGteoXNdqUVAjMHCNNb5N0NhCe
	 IrvEyZdSS7zdMpF2WH1fF/ZhHbmx6e2Z0GRxcP1dgFAlUChQxi+v/adYrKICMPlDkR
	 X3qNFJtplFt9MAo4RvTf4Dw749WfQkouQcFIjNuvUOyg8a3qcoZWEh6DGB1KQVW64G
	 DYDmrfvhm4FJwk514+lhMzYqSneNQXiYMYqxOVbShdHyyFggvc6Ga1tWoqMHxZw3iN
	 kUTe5yRL75hwh4qUpj9sBGINWMu3w0wWzJUxgVSYsZ4df4PEbPpd+uDLs6CgriocYX
	 loxPEuVJWJsnA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FF93C369A1;
	Tue,  8 Apr 2025 04:40:04 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Date: Mon, 07 Apr 2025 23:39:48 -0500
Subject: [PATCH 1/4] media: dt-bindings: Document Tegra186 and Tegra194 cec
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-tegra-cec-v1-1-e25dd9577b5f@gmail.com>
References: <20250407-tegra-cec-v1-0-e25dd9577b5f@gmail.com>
In-Reply-To: <20250407-tegra-cec-v1-0-e25dd9577b5f@gmail.com>
To: Hans Verkuil <hverkuil@xs4all.nl>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-tegra@vger.kernel.org, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Aaron Kling <webgeek1234@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744087203; l=869;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=1LwAlwBIrxvyrSHNHTaA4FD6ANtCDiiKoFzrjcG+iF0=;
 b=BkXp7FZHAp75/VkFExYSoFSW9H4qv3hZDcLpOkXp7q2vPZTFSzPUG9IYIR3xZMvj97+Sk1Tv+
 6gbBU9V+E1JAM/Bg/RH/j8zq90awjVFB9mwgI9ddybjU9D0RjUVOc04
X-Developer-Key: i=webgeek1234@gmail.com; a=ed25519;
 pk=TQwd6q26txw7bkK7B8qtI/kcAohZc7bHHGSD7domdrU=
X-Endpoint-Received: by B4 Relay for webgeek1234@gmail.com/20250217 with
 auth_id=342
X-Original-From: Aaron Kling <webgeek1234@gmail.com>
Reply-To: webgeek1234@gmail.com

From: Aaron Kling <webgeek1234@gmail.com>

These are already used in device trees, so describe them here.

Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
---
 Documentation/devicetree/bindings/media/cec/nvidia,tegra114-cec.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/cec/nvidia,tegra114-cec.yaml b/Documentation/devicetree/bindings/media/cec/nvidia,tegra114-cec.yaml
index a6b73498bc217a2e884e31af91e9d8845c9b1d76..27987bc428ea1a0db8dba4910727e1ce3fa3dab3 100644
--- a/Documentation/devicetree/bindings/media/cec/nvidia,tegra114-cec.yaml
+++ b/Documentation/devicetree/bindings/media/cec/nvidia,tegra114-cec.yaml
@@ -18,6 +18,8 @@ properties:
       - nvidia,tegra114-cec
       - nvidia,tegra124-cec
       - nvidia,tegra210-cec
+      - nvidia,tegra186-cec
+      - nvidia,tegra194-cec
 
   clocks:
     maxItems: 1

-- 
2.48.1



