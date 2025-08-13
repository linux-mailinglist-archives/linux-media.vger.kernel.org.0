Return-Path: <linux-media+bounces-39790-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C1AD5B2467A
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 12:03:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C2ABC1B60ACB
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 09:58:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 535502F659F;
	Wed, 13 Aug 2025 09:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OjAoJH62"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85A112F5337;
	Wed, 13 Aug 2025 09:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755078916; cv=none; b=JN5R05YsHXujZ9vFSMczLsimo8o4GRg6yDa1h2A/boljhM8CXLEM6zWfTrvEpDLDvkttOpeLydL3HgpUY4MYE3F2HsYF666LwdBM+SY9Le0IzcniEopk64rqsH1b5B5CenI8qtKce9mwgQBI09Ytppkd7NasOOOL05AnzLKYDmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755078916; c=relaxed/simple;
	bh=uBSxFVB8M/HdzrHEThGCY2+OpvVZtcNgIN266BaogDg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CwNIfoOHjXCx3rr741acNNjXTQ5tTHq0DFoKKjHSniWgygCQ7ZlKjszBRmsmn4rYyvOF4dvMYZIyfkKqtYuue3wzP+OlekdeinGvo2qx7yM4lQR66AsrMgumhQs98SVKG5fZWcqr7uV8dqY1KBzb+sq2lHvJE1s9wotJjnFw9qE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OjAoJH62; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1A0DAC4CEF8;
	Wed, 13 Aug 2025 09:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755078916;
	bh=uBSxFVB8M/HdzrHEThGCY2+OpvVZtcNgIN266BaogDg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=OjAoJH626gSAtjBqDmz4DnNWtEuox28wvVC0q39yX9X+N8UjVQLZnhRB4JhHb6Rp3
	 zk2zJpeYq0ANEXMNxhKVq2IQsyOKuWgsfmMB7vD4tnqfPQeyy4IiJf2JZ84X3ghsOH
	 jtea5ZymMU7qiVTgGezcvFzvbL9ZQOAOtm2XhdpBCHVby1tXXZrPyDYMPCICSAqjaM
	 0tNuIZQOENbPzsWgHEnHfjNo0QcKL64n1wEmqgX3J7n5xqWF4kZKBT9vruzFKkyaMg
	 QeSTy6zakLNH6PLNb/oScLYGBHJ8oXXFmTAzQ3ZqDHQnBhZuwtXUhR0V6Q4FdxPI0k
	 eLgr7Eco6Y3Ew==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1201ECA0EE5;
	Wed, 13 Aug 2025 09:55:16 +0000 (UTC)
From: Yassine Ouaissa via B4 Relay <devnull+yassine.ouaissa.allegrodvt.com@kernel.org>
Date: Wed, 13 Aug 2025 09:54:55 +0000
Subject: [PATCH v5 3/4] dt-bindings: vendor-prefixes: Update the
 description of allegro prefix
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250813-allegro_dvt_al300_dec_driver-v5-3-a312ddebc4d8@allegrodvt.com>
References: <20250813-allegro_dvt_al300_dec_driver-v5-0-a312ddebc4d8@allegrodvt.com>
In-Reply-To: <20250813-allegro_dvt_al300_dec_driver-v5-0-a312ddebc4d8@allegrodvt.com>
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
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1039;
 i=yassine.ouaissa@allegrodvt.com; h=from:subject:message-id;
 bh=PC3ijNZetyZmp31mYsP4nsyh9qRs+vDTMrjy2hHRDqY=;
 b=owGbwMvMwCV2oHftXqU9jLMZT6slMWTMSWTU4PmnsSxsbfEZnz/Lj1/Ya8H46mT2c6nZc2dG9
 1++2y59oaOUhUGMi0FWTJHlg8HSZ1/YanxmtLDNh5nDygQyhIGLUwBusinDPzOjXe4btn6ySai+
 b6y9e49X842VhZ01um9yLM7pKjf0czD8Uy94/H3aYWOmU7N9nJwORSqKRq6Zp9v6aP3+tR8fVBm
 6MQIA
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
index 77160cd47f54079a39f35b570d69f7c4c2274724..8b480a62368556e8d0ded02cf304d7e776b6ea18 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -83,7 +83,7 @@ patternProperties:
   "^alfa-network,.*":
     description: ALFA Network Inc.
   "^allegro,.*":
-    description: Allegro DVT
+    description: Allegro DVT, SAS.
   "^allegromicro,.*":
     description: Allegro MicroSystems, Inc.
   "^alliedvision,.*":

-- 
2.30.2



