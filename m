Return-Path: <linux-media+bounces-48435-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C46DCADA7D
	for <lists+linux-media@lfdr.de>; Mon, 08 Dec 2025 16:50:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EFF243022818
	for <lists+linux-media@lfdr.de>; Mon,  8 Dec 2025 15:49:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D0EC2DAFB5;
	Mon,  8 Dec 2025 15:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R4LeTFCF"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F100271448;
	Mon,  8 Dec 2025 15:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765208976; cv=none; b=mHZ4/RZX+nwuaii//J1mlA0yFuWCdtiU/ONWb7X9gkcPMogyoNciFbKEYQXLHrOQJVPQAY5R52SYAilRo8+Srgz6V2CsxuMWoCw8k4W5ncPTpG7gkRUrdE2JkSgB1hGb2McyoF23KewwKtDCqHu4d277HjVyemoZvZJ/O0lLnO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765208976; c=relaxed/simple;
	bh=Xi23dNBeLnbyP+MfAVL3IQS68z/4ZfOXaIm5R1+0ooA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Vk5YWDX0lJKff3gK4x0O8pwdBfVgMjNnUCzczemUCad60mxFb0S1kDu97N0C5ZtR08yeWpIO8wm0ss08nTKVGsmImMjuR4cVjUWD2z5coPlIkNTFdOZ7DOIHKbAfKA1/I90Trij6l/PRBkNnTZQaAHZODOVrSJeXbB0+IpUs4wE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R4LeTFCF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2AD31C2BC86;
	Mon,  8 Dec 2025 15:49:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765208976;
	bh=Xi23dNBeLnbyP+MfAVL3IQS68z/4ZfOXaIm5R1+0ooA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=R4LeTFCFJeunyEDGwSrc0za/kp7ona8ZwNpUzDXYau+WLhWjS5mMgrw7j4XSleCbU
	 VyMrDkSziwiZLF/+Oz5GJPfJw7hfwSXZEypTesCegX3Twz03nPwL+wL9q6WH7rfLZd
	 SSmwHhYPlldTkOPOL0ehaVqDd3NvetJYqEqfCqWPxxZGdxGtUyq1fNeWQj9JF54+OQ
	 fSdgZ2+7pClsmW8SDvCDt8TTf2tMbC1945oErfwtH5TypQXAXT2GMmPrZIMZULQaMI
	 b51tHQm8KhNgDD+yt93p9i6Dn8V88l0jrItL3JR8fAh43ydubyZYX9cl+BqfK/5p/1
	 pxVkqiW2fpStA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F4D3D3B7F8;
	Mon,  8 Dec 2025 15:49:36 +0000 (UTC)
From: Yassine Ouaissa via B4 Relay <devnull+yassine.ouaissa.allegrodvt.com@kernel.org>
Date: Mon, 08 Dec 2025 16:49:18 +0100
Subject: [PATCH RESEND v6 3/4] dt-bindings: vendor-prefixes: Update the
 description of allegro prefix
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251208-allegro_dvt_al300_dec_driver-v6-3-128956555677@allegrodvt.com>
References: <20251208-allegro_dvt_al300_dec_driver-v6-0-128956555677@allegrodvt.com>
In-Reply-To: <20251208-allegro_dvt_al300_dec_driver-v6-0-128956555677@allegrodvt.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Michael Tretter <m.tretter@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Michal Simek <michal.simek@amd.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Yassine OUAISSA <yassine.ouaissa@allegrodvt.com>, 
 Nicolas Dufresne <nicolas@ndufresne.ca>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=984;
 i=yassine.ouaissa@allegrodvt.com; h=from:subject:message-id;
 bh=dwi2brNNC57NCpVLbkKs5CwBSDc3o/+yQYET7H88jNk=;
 b=owGbwMvMwCV2oHftXqU9jLMZT6slMWSafe61s7h1sFfk67F7rpIZ7F0HvPZmHdnTf3rKsnmHw
 tuPbZg5s6OUhUGMi0FWTJHlg8HSZ1/YanxmtLDNh5nDygQyhIGLUwAmcryekaFz8Y2vvSUNTPoZ
 i9s6/z3OftWxr0flcMyqtGijExeXTYhj+F8WbL7nxPwjdSoqQe4Xl8/61H021KdUKqVW8rkCS6/
 3cV4A
X-Developer-Key: i=yassine.ouaissa@allegrodvt.com; a=openpgp;
 fpr=B0CE218FC8E89064DAED6179042F935CFB3AD0CC
X-Endpoint-Received: by B4 Relay for yassine.ouaissa@allegrodvt.com/default
 with auth_id=423
X-Original-From: Yassine Ouaissa <yassine.ouaissa@allegrodvt.com>
Reply-To: yassine.ouaissa@allegrodvt.com

From: Yassine Ouaissa <yassine.ouaissa@allegrodvt.com>

Add SAS (Société par actions simplifiée) to the allegro of vendor
prefixe description to include French simplified joint-stock company
legal structure.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Yassine Ouaissa <yassine.ouaissa@allegrodvt.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index c7591b2aec2a..8376312dd9e4 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -87,7 +87,7 @@ patternProperties:
   "^alfa-network,.*":
     description: ALFA Network Inc.
   "^allegro,.*":
-    description: Allegro DVT
+    description: Allegro DVT, SAS.
   "^allegromicro,.*":
     description: Allegro MicroSystems, Inc.
   "^alliedtelesis,.*":

-- 
2.50.1



