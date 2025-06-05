Return-Path: <linux-media+bounces-34120-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AD96BACEF2C
	for <lists+linux-media@lfdr.de>; Thu,  5 Jun 2025 14:27:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2D37E1899F16
	for <lists+linux-media@lfdr.de>; Thu,  5 Jun 2025 12:27:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 967BB225415;
	Thu,  5 Jun 2025 12:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aZcuRc+x"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC8F8214813;
	Thu,  5 Jun 2025 12:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749126427; cv=none; b=SrdnUdkBqgeDqMbYnrkaq2Oz5GJRzNsbSu0IyUwYZDXBks3LuDnOQF5BLJdVcearzfhktIJrrZZUxpZx3XX0Xz9PtUTDBJ1aKuYPzMefvrBx+/HRY7e0AxYesae37wkjBFbrqLXBd9B1b5X8yk3qETflZQ8N5YGShehC1CKsO0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749126427; c=relaxed/simple;
	bh=7FsO6SeXMQrOR6nvT3kc1qeC6bIkhiQ0CJg3aCAVrRk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CsSg1frcjnmdIUSx9xGEDkZKiT79U1DwT5OF5NapLVGTOEMk76QyAjQp+NsXV20P4GtMTlylzOFFi53Kun2W5k+8OJg5Li6tqjKnfV/n4ZL++gA7rOo6Yk48tFO+BKP+vXWwzcF0srukrCmzor1UmpOaOrjfLgXc9gHp1Bt3lbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aZcuRc+x; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7EB58C4CEF4;
	Thu,  5 Jun 2025 12:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749126426;
	bh=7FsO6SeXMQrOR6nvT3kc1qeC6bIkhiQ0CJg3aCAVrRk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=aZcuRc+xgzFRLxO/6CHIydmdwZCu6GxXHgjtfZHrsSDFdArTC9YJTFhmpeCdZTvyJ
	 pbUIkfBn+hVdFykBs3fHpoZv+TQfLF3Blmd3IFYFk4q2uJ6j6VltcKMLaT5Zj82lkj
	 CW2T7gtVMRQYlauT5ipXBubwmCGOJ/vunJi81rUwPZmPriRW9CNNBuQNTwLwaI+qyk
	 dw6Ylhs+eG7IAHk9vHTwcbg+5OwDNqNT7DJl/o4midh4fxTX7IQtdepREk6Ueoin2u
	 QY87prJc/eb3VWbhyiNsfsioLIUkkwOs5a4j1epALeiwCiMlgnAf2p7G+6z4gbI5/j
	 QpexJ/DyKi/vQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7097AC61CE8;
	Thu,  5 Jun 2025 12:27:06 +0000 (UTC)
From: Yassine Ouaissa via B4 Relay <devnull+yassine.ouaissa.allegrodvt.com@kernel.org>
Date: Thu, 05 Jun 2025 12:26:58 +0000
Subject: [PATCH v2 3/4] dt-bindings: vendor-prefixes: Update the
 description of allegro prefix
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250605-allegro_dvt_al300_dec_driver-v2-3-1ef4839f5f06@allegrodvt.com>
References: <20250605-allegro_dvt_al300_dec_driver-v2-0-1ef4839f5f06@allegrodvt.com>
In-Reply-To: <20250605-allegro_dvt_al300_dec_driver-v2-0-1ef4839f5f06@allegrodvt.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Michael Tretter <m.tretter@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Michal Simek <michal.simek@amd.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Yassine OUAISSA <yassine.ouaissa@allegrodvt.com>, 
 Nicolas Dufresne <nicolas@ndufresne.ca>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=986;
 i=yassine.ouaissa@allegrodvt.com; h=from:subject:message-id;
 bh=5iUhKAdElKhwIW7fDAYX2Kf2zk0pHavOIAas+qtjgcA=;
 b=owGbwMvMwCV2oHftXqU9jLMZT6slMWQ49kqY7c/qa/z0cMPmoBwvk9ecxwKDwl2nP/nLabf8v
 Gr8zzM1HaUsDGJcDLJiiiwfDJY++8JW4zOjhW0+zBxWJpAhDFycAjCRs6aMDBfyryvVXv4y68aL
 oFen13N27P6wP8D4SEqXbmjbWhXeN7mMDBP3Nv1avPnKT6O2f058KZkPHVkFg6d+1Z1nc3G5Vet
 1Q3YA
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

Signed-off-by: Yassine Ouaissa <yassine.ouaissa@allegrodvt.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index c01adbaacbbbcafa3e174153cdc5d2ca28cf703e..02e70a31477d742c606d63228b97037375442e49 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -82,7 +82,7 @@ patternProperties:
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



