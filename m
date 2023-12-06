Return-Path: <linux-media+bounces-1704-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E52EA80676A
	for <lists+linux-media@lfdr.de>; Wed,  6 Dec 2023 07:36:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 75B0A2822AD
	for <lists+linux-media@lfdr.de>; Wed,  6 Dec 2023 06:36:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4038811C8D;
	Wed,  6 Dec 2023 06:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="oRljmTO8"
X-Original-To: linux-media@vger.kernel.org
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3441D45
	for <linux-media@vger.kernel.org>; Tue,  5 Dec 2023 22:36:06 -0800 (PST)
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20231206063605epoutp04dc8c4ac2df14a97bb8def9a0a74717c4~eKp2KAry20472304723epoutp04j
	for <linux-media@vger.kernel.org>; Wed,  6 Dec 2023 06:36:05 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20231206063605epoutp04dc8c4ac2df14a97bb8def9a0a74717c4~eKp2KAry20472304723epoutp04j
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1701844565;
	bh=WHPozqOjeeMV+027x1IXGBtLuq0YyyL6MMLi+5/X378=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oRljmTO85Z56xZm1BJH4/GTFe7j5WeVDUyALEyCHiPXhGAAx9LkIR0qkjnpPZ/eCo
	 5pZnGf6hof0NJ3xm4P4KImf9c0nGoK0DXtzMAO18JqSMwn6ALnSFDq/neq8IvUSvPN
	 H4r6GvTj5Qdqg4iKI5e59puPkVRt0WnxSuhPzx/M=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTP id
	20231206063604epcas5p2eff862e2f9e2274ca9ee7db0ed8d4330~eKp1pCq0w1715517155epcas5p2W;
	Wed,  6 Dec 2023 06:36:04 +0000 (GMT)
Received: from epsmgec5p1new.samsung.com (unknown [182.195.38.177]) by
	epsnrtp3.localdomain (Postfix) with ESMTP id 4SlSN30Fjtz4x9QB; Wed,  6 Dec
	2023 06:36:03 +0000 (GMT)
Received: from epcas5p1.samsung.com ( [182.195.41.39]) by
	epsmgec5p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	08.45.08567.25610756; Wed,  6 Dec 2023 15:36:02 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20231206063108epcas5p1af3d9d0442c8abebe91d769cc68284d5~eKliBib0x1697916979epcas5p1d;
	Wed,  6 Dec 2023 06:31:08 +0000 (GMT)
Received: from epsmgmcp1.samsung.com (unknown [182.195.42.82]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20231206063108epsmtrp116e918b40aeddea8431f6d3bd98a2026~eKlh-54tQ1588615886epsmtrp1u;
	Wed,  6 Dec 2023 06:31:08 +0000 (GMT)
X-AuditID: b6c32a44-617fd70000002177-6f-6570165251ce
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgmcp1.samsung.com (Symantec Messaging Gateway) with SMTP id
	4F.96.18939.C2510756; Wed,  6 Dec 2023 15:31:08 +0900 (KST)
Received: from cheetah.sa.corp.samsungelectronics.net (unknown
	[107.109.115.53]) by epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20231206063105epsmtip2a30753c7eee8d498603bb7223c4d5ae5~eKlfYQpUO1118411184epsmtip2K;
	Wed,  6 Dec 2023 06:31:05 +0000 (GMT)
From: Aakarsh Jain <aakarsh.jain@samsung.com>
To: linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: m.szyprowski@samsung.com, andrzej.hajda@intel.com, mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl, krzysztof.kozlowski+dt@linaro.org,
	robh+dt@kernel.org, conor+dt@kernel.org, linux-samsung-soc@vger.kernel.org,
	andi@etezian.org, gost.dev@samsung.com, alim.akhtar@samsung.com,
	aswani.reddy@samsung.com, pankaj.dubey@samsung.com,
	ajaykumar.rs@samsung.com, aakarsh.jain@samsung.com, linux-fsd@tesla.com
Subject: [Patch v5 01/11] dt-bindings: media: s5p-mfc: Add mfcv12 variant
Date: Wed,  6 Dec 2023 12:00:35 +0530
Message-Id: <20231206063045.97234-2-aakarsh.jain@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231206063045.97234-1-aakarsh.jain@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrEJsWRmVeSWpSXmKPExsWy7bCmum6QWEGqweoDphZPd8xktTjw/iCL
	xYN529gsFv94zmRxf/FnFotDm7eyW6zZe47JYv6Rc6wWNw/sZLK4OPMui0Xfi4fMFpseX2O1
	ePgq3OLyrjlsFj0btrJazDi/j8li7ZG77BbLNv1hsli09Qu7ReveI+wOIh7Xl3xi9li85yWT
	x6ZVnWwed67tYfPYvKTeo2/LKkaPf01z2T0+b5LzOPX1M3sAZ1S2TUZqYkpqkUJqXnJ+SmZe
	uq2Sd3C8c7ypmYGhrqGlhbmSQl5ibqqtkotPgK5bZg7QZ0oKZYk5pUChgMTiYiV9O5ui/NKS
	VIWM/OISW6XUgpScApMCveLE3OLSvHS9vNQSK0MDAyNToMKE7Iw3b2ezF8wRrDjds4WlgXEj
	TxcjJ4eEgInEtO+vmbsYuTiEBHYzSrx5M5sZJCEk8IlR4lybIUQCyD50/iEbTMfS2RehOnYy
	Sqz8cwTKaWWSOPq/Fcjh4GAT0JU4uz0HpEFEoJFR4nFHCUgNs8AsZonm+f9ZQBLCAp4S71v7
	wNaxCKhKvOn9BdbLK2Ar0f4/CWKZvMTqDQfASjgF7CSmrFnACjJHQuAAh8TrmzdZIYpcJF4u
	mMcIYQtLvDq+hR3ClpJ42d8GZSdLPF70khnCzpFYv2cKC4RtL3HgyhwWkL3MApoS63fpQ4Rl
	JaaeWscEYjML8En0/n7CBBHnldgxD8ZWk5hz5wfUCTISh1cvhTrBQ6Lp2Q0mSJhMZJSYPOUI
	+wRGuVkIKxYwMq5ilEwtKM5NT002LTDMSy2HR1pyfu4mRnDi1XLZwXhj/j+9Q4xMHIyHGCU4
	mJVEeHPO56cK8aYkVlalFuXHF5XmpBYfYjQFht9EZinR5Hxg6s8riTc0sTQwMTMzM7E0NjNU
	Eud93To3RUggPbEkNTs1tSC1CKaPiYNTqoHpubZ1TmpZ5Kfa/ysFivrfZx47cdyrr1Lgd62+
	yYnloodqOjr85hxu0uhdFnVWN2Hd7B2CT+T99nXFaj5J+vDhyYqUhacSaoUeX9D2i1VP9dkv
	e4hF6z6Lux3LjHsdbf5V8uFsHK8+OMZpqIq2Ok1N4r/SlnXjWMLvgw1MC/bb/uU69tdxxpMJ
	V0v/KuRvXrNkscF1D4OHd4/xbZ3ytJ5BziiPdRL36vNaS4LPHeXuPFeZkdDnPDXWYBvDztkJ
	DL/Ev2m8XPokP/OzyINvp/dJdv74r/KuzGN24YHLcemeh35vZnyw6Rmbao7+MhHlT9d//2f+
	JfCj29u9L/K9hFXHNrcDvg/1g7/PLOWqi01SYinOSDTUYi4qTgQAeJ9sZUUEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrKLMWRmVeSWpSXmKPExsWy7bCSvK6OaEGqwY3pGhZPd8xktTjw/iCL
	xYN529gsFv94zmRxf/FnFotDm7eyW6zZe47JYv6Rc6wWNw/sZLK4OPMui0Xfi4fMFpseX2O1
	ePgq3OLyrjlsFj0btrJazDi/j8li7ZG77BbLNv1hsli09Qu7ReveI+wOIh7Xl3xi9li85yWT
	x6ZVnWwed67tYfPYvKTeo2/LKkaPf01z2T0+b5LzOPX1M3sAZxSXTUpqTmZZapG+XQJXxpu3
	s9kL5ghWnO7ZwtLAuJGni5GTQ0LARGLp7IvMXYxcHEIC2xkluo5vYoVIyEj8bzvGDmELS6z8
	95wdoqiZSWLysW1sXYwcHGwCuhJnt+eAxEUEWhklrq/sZAJxmAXWMUt0NN0A6xYW8JR439rH
	DGKzCKhKvOn9xQzSzCtgK9H+PwligbzE6g0HwEo4BewkpqxZwApSIgRUsvKk4wRGvgWMDKsY
	RVMLinPTc5MLDPWKE3OLS/PS9ZLzczcxgmNCK2gH47L1f/UOMTJxMB5ilOBgVhLhzTmfnyrE
	m5JYWZValB9fVJqTWnyIUZqDRUmcVzmnM0VIID2xJDU7NbUgtQgmy8TBKdXAlDF5980dAfzZ
	Obcvp4eYLZqjtPFXCYv157QuK/PTDl17Ck7oeXtcbTq84/+6Vq+G5NDr2gk/Sq2k/ZRzzKfs
	YW+7fjW/JM/zw+bmy/ez98rMdPjU0TZFtDC4sXlSovOat3Vs6qn+7xZ6RS2cdOhv79GG7V0Z
	vZZhOyc/cH59L/pwppbZCt3XBlYT7E42Bq1iOdsUKvV9i8usHI2u9eJ/YoQme7zftXiZ/LXI
	NRJTVz64Y6b95ZWz8z5dQc3//FJZU8Qq45/L/WFdr77ZP9czeWn8gZ0y1+O7Z9yeJ7XzUsc2
	vZwFM//1V16JPvFjfWHGk6rXPC5HnI+cZPuz8Mucj88LNE2ygvu9jBlkX9qvUWIpzkg01GIu
	Kk4EAIfNtyb4AgAA
X-CMS-MailID: 20231206063108epcas5p1af3d9d0442c8abebe91d769cc68284d5
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20231206063108epcas5p1af3d9d0442c8abebe91d769cc68284d5
References: <20231206063045.97234-1-aakarsh.jain@samsung.com>
	<CGME20231206063108epcas5p1af3d9d0442c8abebe91d769cc68284d5@epcas5p1.samsung.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

Add Tesla FSD MFC(MFC v12) compatible.

Cc: linux-fsd@tesla.com
Signed-off-by: Aakarsh Jain <aakarsh.jain@samsung.com>
---
changelog:
v4->v5
Added iommu property for mfcv12.

v3->v4
Since mfc dt-schema patch got merged so now only one patch remains which add
mfcv12 compatible.
On top of this change, added mfcv12 hw properties in this patch. Since, this became
relatively new patch so thought of getting it reviewed again. So, removed krzysztof's
reviewed-by tag.

v2->v3:
Fixed warnings and errors reported by Rob bot on dt-schema patch.

v1->v2:
There were two different patches for dt-schema. First patch was for conversion
of mfc txt file to json schema and also contains mfcv12 hw properties and
Second patch was for adding mfcv12 specific compatible string.
So as per review comment, changed mfcv12 compatible string to SoC base and fixed
the warnings reported by Rob bot in dt-schema file.
 .../bindings/media/samsung,s5p-mfc.yaml        | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/samsung,s5p-mfc.yaml b/Documentation/devicetree/bindings/media/samsung,s5p-mfc.yaml
index 084b44582a43..d66e51547482 100644
--- a/Documentation/devicetree/bindings/media/samsung,s5p-mfc.yaml
+++ b/Documentation/devicetree/bindings/media/samsung,s5p-mfc.yaml
@@ -24,6 +24,7 @@ properties:
           - samsung,mfc-v7                # Exynos5420
           - samsung,mfc-v8                # Exynos5800
           - samsung,mfc-v10               # Exynos7880
+          - tesla,fsd-mfc                 # Tesla FSD
       - items:
           - enum:
               - samsung,exynos3250-mfc    # Exynos3250
@@ -165,6 +166,23 @@ allOf:
           minItems: 1
           maxItems: 2
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - tesla,fsd-mfc
+    then:
+      properties:
+        clocks:
+          maxItems: 1
+        clock-names:
+          items:
+            - const: mfc
+        iommus:
+          maxItems: 2
+        iommus-names: false
+
 examples:
   - |
     #include <dt-bindings/clock/exynos4.h>
-- 
2.17.1


