Return-Path: <linux-media+bounces-25352-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C473A20E1A
	for <lists+linux-media@lfdr.de>; Tue, 28 Jan 2025 17:11:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3F7733A2CBD
	for <lists+linux-media@lfdr.de>; Tue, 28 Jan 2025 16:10:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 392901D6DB5;
	Tue, 28 Jan 2025 16:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SMhFM/A9"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 872F6199E8D;
	Tue, 28 Jan 2025 16:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738080651; cv=none; b=iVm2dY2GV5KYNxPwHWnqyF9SyFGIzLMKU3YTqCnxufJWw13vtSA+uJxHuqhsBOxup/OSHAElbwLEW72JGBeSWGT9bJ1SsoJUaCESttXUOlY0S/zra3pzoHumhJJg5rJHvU4mpHhiFdJ9CHBGZ/u3X3GQtuMlfjlh8NI2NoVpGWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738080651; c=relaxed/simple;
	bh=s4OfIy2xFOPDUcEYiKch6281mbiwNPc7sRWa122cyNk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NBmQ79uHmSLGk9QIulmHm3iPd+1QI6t8pA0RVV1QFYJVlHooPWTS/7H7aOC4KmfdVR7w9MvKHBh/6Yj8+XQ4CKdsqvWChPcoi2cTw+a3IRYfmolv6FyhAT2beVBvIefy8QEEjXtiigNCRx9TpQ4alH83QEpv5+PKR3v6+I9CH0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SMhFM/A9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C29D8C4CED3;
	Tue, 28 Jan 2025 16:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738080651;
	bh=s4OfIy2xFOPDUcEYiKch6281mbiwNPc7sRWa122cyNk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SMhFM/A9c4rdPxC/506znPyAFfVd1wB5+xTuT8haGc+GEuCIfX1ci6cgfurm2moJx
	 8TqN9DyBlJDO3NJGoEBd4+c6yI5GJDx+z4zkCKJm+SITkHf8PtnEu5IiBW5dnIkxVX
	 7L7Lzr7/y3LoqAsaz7ijEIQzVcYS12eo5bf8PbCEKPpG/R5GhFhhP6E+jp2ShG4GzX
	 O2LQROkWpweP2GvcfnOCwKt/gu4fr1CjA1nqobHSPh3c4T4iepVoTjjU+ojjvf0tuW
	 NVbVwHRFNdtKpF9lNFH256Zl+iqjOOD1I9sXumQO6HHjleFGoInglqa6dz5qtRBpmA
	 gsGNRSOoRdecw==
Date: Tue, 28 Jan 2025 10:10:49 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v2 1/2] media: dt-bindings: renesas,fcp: add top-level
 constraints
Message-ID: <20250128161049.GA3543944-robh@kernel.org>
References: <20250128095355.65766-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250128095355.65766-1-krzysztof.kozlowski@linaro.org>

On Tue, Jan 28, 2025 at 10:53:54AM +0100, Krzysztof Kozlowski wrote:
> Properties with variable number of items per each device are expected to
> have widest constraints in top-level "properties:" block and further
> customized (narrowed) in "if:then:".  Add missing top-level constraints
> for clocks and clock-names.
> 
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

How did you find these? The below dtschema patch will find them. 
Unfortunately, there's a lot of false positives. We could eliminate some 
of them, but not sure we could get to 0. The main problem is if the 
constraints are somewhere else (e.g. reset-gpios) or via a $ref.

8<-------------------------------------------------------

diff --git a/dtschema/meta-schemas/cell.yaml b/dtschema/meta-schemas/cell.yaml
index 3f61ed93593b..b4f0d9ea0559 100644
--- a/dtschema/meta-schemas/cell.yaml
+++ b/dtschema/meta-schemas/cell.yaml
@@ -7,6 +7,7 @@ $id: http://devicetree.org/meta-schemas/cell.yaml#
 $schema: https://json-schema.org/draft/2019-09/schema
 
 array:
+  type: object
   description: cell array properties must define how many entries and what the
     entries are when there is more than one entry.
   anyOf:
diff --git a/dtschema/meta-schemas/core.yaml b/dtschema/meta-schemas/core.yaml
index c8cd03439239..233a2afd696b 100644
--- a/dtschema/meta-schemas/core.yaml
+++ b/dtschema/meta-schemas/core.yaml
@@ -16,7 +16,9 @@ allOf:
 
 definitions:
   unit-suffix-properties:
-    $ref: cell.yaml#/array
+    oneOf:
+      - $ref: cell.yaml#/array
+      - type: boolean
     propertyNames:
       description: Standard unit suffix properties don't need a type $ref
       not:
@@ -44,7 +46,9 @@ definitions:
   core-properties:
     properties:
       ranges:
-        $ref: cell.yaml#/array
+        oneOf:
+          - $ref: cell.yaml#/array
+          - type: boolean
       reg:
         $ref: cell.yaml#/array
       compatible:
diff --git a/dtschema/meta-schemas/string-array.yaml b/dtschema/meta-schemas/string-array.yaml
index f5234c6c2fc6..4d4824bc108b 100644
--- a/dtschema/meta-schemas/string-array.yaml
+++ b/dtschema/meta-schemas/string-array.yaml
@@ -5,7 +5,8 @@
 ---
 $id: http://devicetree.org/meta-schemas/string-array.yaml#
 $schema: https://json-schema.org/draft/2019-09/schema
-#type: object
+
+type: object
 
 if:
   not:


