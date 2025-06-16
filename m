Return-Path: <linux-media+bounces-34914-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B09CADB14A
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 15:13:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 36AEC3B638D
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 13:12:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9974C2DBF6E;
	Mon, 16 Jun 2025 13:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eAoqiq+3"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E67BD295DAA;
	Mon, 16 Jun 2025 13:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750079552; cv=none; b=LIW6YRhpWQAmnqbZPXzV6BAqGzrkz+hGRk7DMqMo4G8/ZS0w6hvvno4a+///fsi++6GZqz7GiV8HCyp2b1VRXMj9l9u70ayO+dowb1nZs3SFu4VwSw9rnbfmAPcrgUjiGbqNntL0nY3RzTuAkivUyAoJr7auwBExRfMSeFlZD28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750079552; c=relaxed/simple;
	bh=YXwjkRwHTteqV9ZERu+QJt1U/5y/bTSlS41CFa701/E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TaJ8KzBCQ7AxMeoDd68L2BWGTf7pCiKJobJ7yV3tC5FhHMBSsMhINeCslCHBlwwVjLMTJnF7GCKBOAvoRqhmuixqtxd6bCwY0QNpAjursA37FIaBDkuihd9wMoVZDkJYL9ocYhgTfnimU5Z3lAH03Z4HOpP8r33MGzN+i8MlDCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eAoqiq+3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 90D1DC4CEED;
	Mon, 16 Jun 2025 13:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750079551;
	bh=YXwjkRwHTteqV9ZERu+QJt1U/5y/bTSlS41CFa701/E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=eAoqiq+3BIiTXBQsf+iy6lbuldwoEn1VGVEc/MFL0cJUFkXH2Oj2RAd0VLz8iDcBU
	 4zLuIPHqi7gPXBlIGYyYxYHVHCGnNXOm7ee3O7cQcDGf/91bmKj2kY14CFbiKLdj0r
	 26/evmTtSwpYYq+5+/BUAfxfRASslpyJE1+hxouyNJQI2p45vf9WQ87bliaHyfjgBS
	 lVjX4kd95PGe9BxCUFU3k0UAg3+xbKy8JxEjAn/CF6Ueqpu3D/kQi9ID/76NDKMeXW
	 YSGyvs48n7n6XXaKDR7vgOaHTXpBKVhbDszip8OHFCjIJN2NA7lvwFpJOkSpAKv0wj
	 wrmst8AWtZ2PQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85121C7115B;
	Mon, 16 Jun 2025 13:12:31 +0000 (UTC)
From: Yassine Ouaissa via B4 Relay <devnull+yassine.ouaissa.allegrodvt.com@kernel.org>
Date: Mon, 16 Jun 2025 13:12:14 +0000
Subject: [PATCH v3 3/4] dt-bindings: vendor-prefixes: Update the
 description of allegro prefix
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250616-allegro_dvt_al300_dec_driver-v3-3-7d746cb9e5f9@allegrodvt.com>
References: <20250616-allegro_dvt_al300_dec_driver-v3-0-7d746cb9e5f9@allegrodvt.com>
In-Reply-To: <20250616-allegro_dvt_al300_dec_driver-v3-0-7d746cb9e5f9@allegrodvt.com>
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
 bh=wcArLg2XJHwE9gH/4U6ZLF2AB9JyotUnB2d5qn8XXFU=;
 b=owGbwMvMwCV2oHftXqU9jLMZT6slMWQESNiK52VITvYp/mj/JOtaM8vZ81dufTzm9imp582Js
 zl3E0U+dpSyMIhxMciKKbJ8MFj67Atbjc+MFrb5MHNYmUCGMHBxCsBEZG8z/I8q+TPx4ORsW39G
 q98Gufvehj5h2yXSqXas8UOBhMXntOuMDHNOcSdYODpbTNkl87FVbf0plbB+1piXyQsTFbfbrk4
 MYQUA
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
index 5d2a7a8d3ac6c666c8b557c2ef385918e5e97bf9..827fa988c5af4b59cf71e4cf47163e38eb1aa4c9 100644
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



