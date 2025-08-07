Return-Path: <linux-media+bounces-39027-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C721B1D620
	for <lists+linux-media@lfdr.de>; Thu,  7 Aug 2025 12:54:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 715081AA2369
	for <lists+linux-media@lfdr.de>; Thu,  7 Aug 2025 10:54:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A8C6277814;
	Thu,  7 Aug 2025 10:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="MYMpeRqx"
X-Original-To: linux-media@vger.kernel.org
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 077E2277CB9
	for <linux-media@vger.kernel.org>; Thu,  7 Aug 2025 10:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754564028; cv=none; b=grmawpUAOr1RlT9y+4rOcW7WmSCmmMNBUE8j4a4S5EqmkeReDpxJetne4sUX6GwySd9AhaK6EEjbg8w9slxrmpDaPVMrt+3aJYsAEcH2YgdAkYEUkFyiSyVTq8gTrZBOif6Ox+npYhnymgGxK67C/Grpclk+3VIKI/bzykhzJrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754564028; c=relaxed/simple;
	bh=8GJWrjCBxg6kZvZ1gYqYneSJRZnVlxbnu3DNO3FCMy0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type:References; b=DLwasuoJshWzFBI6JJHjxFdwee1mUuuLdNMBM8j/XWMLccuw9jN+aulI22jG4e2/X4WVHjH6jqnhBHxDCphOE5eojttX4RbG0L7ofq7Tx96IdiqWhrvfQ9LpNKiwf6bLKmZ7RkY4jN4UYqGybKEumRAuEncG0SqdCfPy6fDgP3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=MYMpeRqx; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250807105345epoutp02fdd974b16329dc6393409d78a2c65e31~Zdq9eI3Jt1903619036epoutp02h
	for <linux-media@vger.kernel.org>; Thu,  7 Aug 2025 10:53:45 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250807105345epoutp02fdd974b16329dc6393409d78a2c65e31~Zdq9eI3Jt1903619036epoutp02h
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1754564025;
	bh=D+ayVJwgciizVxsr+RL6VH4988L9AOyityEB6YdMCKU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MYMpeRqxLIp4U/ePo3KYLiJXIbB9VxxK0Nj6+bBo0Oe9078w2kFyeyy5fj1FubINF
	 oVMbKf0ljLJVrMM4KyEOs8mGk3Ab5JfpjDSZ9YXl6gitaoKfi8PSAxha/VPtKhp8pz
	 vN9EUZLxi7LU/2zIm4eenNOUO48pWMRshxhGKWbk=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20250807105344epcas5p187b2c5cd75d7146e99e48dbde0863b72~Zdq8717_o2390623906epcas5p12;
	Thu,  7 Aug 2025 10:53:44 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.94]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4byPCq65ngz6B9m5; Thu,  7 Aug
	2025 10:53:43 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20250807032525epcas5p42f764c0b2af23d0e47e853fc5707cb46~ZXjg9yEDk0583105831epcas5p4H;
	Thu,  7 Aug 2025 03:25:25 +0000 (GMT)
Received: from cheetah.samsungds.net (unknown [107.109.115.53]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250807032523epsmtip2831067472ba6dc46cb11960543bc4c44~ZXje91v-r1379313793epsmtip2j;
	Thu,  7 Aug 2025 03:25:23 +0000 (GMT)
From: Aakarsh Jain <aakarsh.jain@samsung.com>
To: linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, m.szyprowski@samsung.com,
	andrzej.hajda@intel.com, mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
	alim.akhtar@samsung.com, robh@kernel.org, conor+dt@kernel.org,
	devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org
Cc: linux-samsung-soc@vger.kernel.org, aswani.reddy@samsung.com,
	anindya.sg@samsung.com, Aakarsh Jain <aakarsh.jain@samsung.com>
Subject: [PATCH 09/10] dt-bindings: media: s5p-mfc: Modify compatible string
 check for SoC-specific support
Date: Thu,  7 Aug 2025 08:54:48 +0530
Message-ID: <20250807032449.92770-10-aakarsh.jain@samsung.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250807032449.92770-1-aakarsh.jain@samsung.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250807032525epcas5p42f764c0b2af23d0e47e853fc5707cb46
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250807032525epcas5p42f764c0b2af23d0e47e853fc5707cb46
References: <20250807032449.92770-1-aakarsh.jain@samsung.com>
	<CGME20250807032525epcas5p42f764c0b2af23d0e47e853fc5707cb46@epcas5p4.samsung.com>

Modify compatible strings in the s5p-mfc binding to reflect
accurate SoC-specific naming across multiple Samsung platforms.

Signed-off-by: Aakarsh Jain <aakarsh.jain@samsung.com>
---
 .../bindings/media/samsung,s5p-mfc.yaml          | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/samsung,s5p-mfc.yaml b/Documentation/devicetree/bindings/media/samsung,s5p-mfc.yaml
index b46cc780703c..6a711c8103ac 100644
--- a/Documentation/devicetree/bindings/media/samsung,s5p-mfc.yaml
+++ b/Documentation/devicetree/bindings/media/samsung,s5p-mfc.yaml
@@ -20,15 +20,15 @@ properties:
       - enum:
           - samsung,exynos5433-mfc        # Exynos5433
           - samsung,mfc-v5                # Exynos4
-          - samsung,mfc-v6                # Exynos5
-          - samsung,mfc-v7                # Exynos5420
-          - samsung,mfc-v8                # Exynos5800
-          - samsung,mfc-v10               # Exynos7880
+          - samsung,exynos5250-mfc        # Exynos5
+          - samsung,exynos5420-mfc        # Exynos5420
+          - samsung,exynos5800-mfc        # Exynos5800
+          - samsung,exynos7880-mfc        # Exynos7880
           - tesla,fsd-mfc                 # Tesla FSD
       - items:
           - enum:
               - samsung,exynos3250-mfc    # Exynos3250
-          - const: samsung,mfc-v7         # Fall back for Exynos3250
+          - const: samsung,exynos5420-mfc # Fall back for Exynos3250
 
   reg:
     maxItems: 1
@@ -133,8 +133,8 @@ allOf:
         compatible:
           contains:
             enum:
-              - samsung,mfc-v6
-              - samsung,mfc-v8
+              - samsung,exynos5250-mfc
+              - samsung,exynos5800-mfc
     then:
       properties:
         clocks:
@@ -152,7 +152,7 @@ allOf:
         compatible:
           contains:
             enum:
-              - samsung,mfc-v7
+              - samsung,exynos5420-mfc
     then:
       properties:
         clocks:
-- 
2.49.0


