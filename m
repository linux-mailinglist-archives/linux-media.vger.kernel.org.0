Return-Path: <linux-media+bounces-15975-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ACD6C94B90C
	for <lists+linux-media@lfdr.de>; Thu,  8 Aug 2024 10:31:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CFC611C2472C
	for <lists+linux-media@lfdr.de>; Thu,  8 Aug 2024 08:31:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B1B9188003;
	Thu,  8 Aug 2024 08:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="LeQ+sdTz"
X-Original-To: linux-media@vger.kernel.org
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 567AB208C4
	for <linux-media@vger.kernel.org>; Thu,  8 Aug 2024 08:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723105869; cv=none; b=nVPel2yAIq8zc6if57Pia2KexjhVznrgFveIML+0NueygMyItaK04I/OEtg9ZhvBgNdqsBPI3gyzbYBoAnR9Ft8OOXh0JccawsnJlV007K4dlVvY+KP3vnkN4XPBBg5NRbbRUGh4wT5NyATPwRAqk7rrwvIvJJOV8j0SY5mPPrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723105869; c=relaxed/simple;
	bh=Q+a6uAoUzOJfNJlLqKiW9bOJctnF6d0eXCj+TgP69rg=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:References; b=IjDM2hRA8J/GJYDTQR3Fqm23SLl4yc0GmaCWI3LRu68dBaSiYZ4i+/K8ZA4c/xHSwIWKQ4l7Cka32RoWa2WGC4twDK3e8Na1jNOlf+nOuMZHu93jRSzzTGUYrtYMt+xOaAkPMCy3OlKLliqdrdGOhTm7sh3HdDvhdx2gC/98bY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=LeQ+sdTz; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20240808083105epoutp03bc852242283b1be1b0bab45e5f115cca~ps6en0pU21087410874epoutp03W
	for <linux-media@vger.kernel.org>; Thu,  8 Aug 2024 08:31:05 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20240808083105epoutp03bc852242283b1be1b0bab45e5f115cca~ps6en0pU21087410874epoutp03W
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1723105865;
	bh=sy99WQrEArLB2GVHVM3NcSs6PqK16OI98ozU/DmWpwg=;
	h=From:To:Cc:Subject:Date:References:From;
	b=LeQ+sdTzPlWHdpaLqm154qkZK+2No+6M5ex4zvnOJclUG3r9/7Kt17hk4y2mmRKO3
	 rN3d8Xi8lrhsUQAZMVeBv9g5v0uCRL1WPc+vGDEEX976lFsfLq7F4yb6347FkMaRMI
	 wJk3dV7z1PTGohQJWj7iGPFocVrLr0VcMtqWXfc0=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTP id
	20240808083104epcas5p46c53678e6566ab4be853214002c36ac8~ps6eA4fxx0482004820epcas5p4D;
	Thu,  8 Aug 2024 08:31:04 +0000 (GMT)
Received: from epsmgec5p1-new.samsung.com (unknown [182.195.38.180]) by
	epsnrtp3.localdomain (Postfix) with ESMTP id 4WfgHB5pGnz4x9Q1; Thu,  8 Aug
	2024 08:31:02 +0000 (GMT)
Received: from epcas5p3.samsung.com ( [182.195.41.41]) by
	epsmgec5p1-new.samsung.com (Symantec Messaging Gateway) with SMTP id
	A4.7F.19863.64284B66; Thu,  8 Aug 2024 17:31:02 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20240808083027epcas5p153e64139a5e71448b1ea3f04af1df2bd~ps57ZZ5ZQ1632116321epcas5p1j;
	Thu,  8 Aug 2024 08:30:27 +0000 (GMT)
Received: from epsmgmcp1.samsung.com (unknown [182.195.42.82]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20240808083027epsmtrp1792e9837461341a1756c4fc6532dda71~ps57YUnui2600726007epsmtrp13;
	Thu,  8 Aug 2024 08:30:27 +0000 (GMT)
X-AuditID: b6c32a50-ef5fe70000004d97-52-66b482468aee
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgmcp1.samsung.com (Symantec Messaging Gateway) with SMTP id
	25.B2.19367.32284B66; Thu,  8 Aug 2024 17:30:27 +0900 (KST)
Received: from cheetah.sa.corp.samsungelectronics.net (unknown
	[107.109.115.53]) by epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20240808083025epsmtip26002044a67fd5e12a21da265afeb47dd~ps55cL1Ew2734327343epsmtip27;
	Thu,  8 Aug 2024 08:30:25 +0000 (GMT)
From: Aakarsh Jain <aakarsh.jain@samsung.com>
To: linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: m.szyprowski@samsung.com, hverkuil-cisco@xs4all.nl, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	linux-samsung-soc@vger.kernel.org, gost.dev@samsung.com,
	aswani.reddy@samsung.com, pankaj.dubey@samsung.com, Aakarsh Jain
	<aakarsh.jain@samsung.com>
Subject: [PATCH V3] dt-bindings: media: s5p-mfc: Remove s5p-mfc.txt binding
Date: Thu,  8 Aug 2024 13:48:15 +0530
Message-Id: <20240808081815.88711-1-aakarsh.jain@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrNKsWRmVeSWpSXmKPExsWy7bCmpq5b05Y0g3XPtC2e7pjJanFo81Z2
	izV7zzFZzD9yjtXi5oGdTBYXZ95lseh78ZDZYtPja6wWl3fNYbPo2bCV1WLG+X1MFmuP3GW3
	WLT1C7tF694j7A58HptWdbJ53Lm2h81j85J6j74tqxg9Pm+S8zj19TN7AFtUtk1GamJKapFC
	al5yfkpmXrqtkndwvHO8qZmBoa6hpYW5kkJeYm6qrZKLT4CuW2YO0LVKCmWJOaVAoYDE4mIl
	fTubovzSklSFjPziElul1IKUnAKTAr3ixNzi0rx0vbzUEitDAwMjU6DChOyM/Xu3MxWsYq+4
	M3E+UwPjLrYuRk4OCQETiYX3J7J2MXJxCAnsYZRofDyVGcL5xCjRtmkWE5wze8MrRpiW/XtP
	skMkdjJKdDy4yAbhtDJJLL37FaiKg4NNQFfi7PYckAYRgUZGiccdJSA1zAILmCS2vL/FBJIQ
	FvCWmDdrKjtIPYuAqsSliRYgYV4BW4k3M98yQyyTl1i94QDYSRICL9kl/j3axAKRcJGYu/gx
	O4QtLPHq+BYoW0riZX8blJ0s8XjRS6hBORLr90yB6rWXOHBlDgvIXmYBTYn1u/QhwrISU0+t
	AzuNWYBPovf3EyaIOK/EjnkwtprEnDs/WCFsGYnDq5dCA8VDYsub9WC2kECsxIF3rxknMMrO
	QtiwgJFxFaNUakFxbnpqsmmBoW5eajk8ppLzczcxglOhVsAOxtUb/uodYmTiYDzEKMHBrCTC
	2xy+KU2INyWxsiq1KD++qDQntfgQoykwzCYyS4km5wOTcV5JvKGJpYGJmZmZiaWxmaGSOO/r
	1rkpQgLpiSWp2ampBalFMH1MHJxSDUz+6/dG9CgW/Dj/63G13+ayVMNzJ9e+nxe8cWaC1ZaP
	fCLCm43vtKgLaOyXD57wNy/WijMkpic3Vehl6uOnq90Yv3ZwfXdeq+vlbPnS/2XuuYWauWKn
	f36ZJC1i8jRH8JnZ6rUeIVzPxSYbvjgV6FlRstkw5PvUN6Wn7j6wDbRaGLhUqaeD8TKL7NOJ
	WRoM0TdZcg/M+HHjgs2fpGa/nzrZUZYGXSahX3iaDvDsPZBl4aKzYGK0tmfIWY/nXPw2B7ae
	bqnmmX95r8QzRgvLVU+cjmoc6Nx9gsF7ycE9rTyTD8TMXW6+Ztnzpze8bhX9cI2qnJw1ye3T
	C1svsddW81v3dqy44zo9Sj3xllXs9RYlluKMREMt5qLiRAA3UjXbDgQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrELMWRmVeSWpSXmKPExsWy7bCSvK5y05Y0g9Z2DounO2ayWhzavJXd
	Ys3ec0wW84+cY7W4eWAnk8XFmXdZLPpePGS22PT4GqvF5V1z2Cx6NmxltZhxfh+Txdojd9kt
	Fm39wm7RuvcIuwOfx6ZVnWwed67tYfPYvKTeo2/LKkaPz5vkPE59/cwewBbFZZOSmpNZllqk
	b5fAlbF/73amglXsFXcmzmdqYNzF1sXIySEhYCKxf+9J9i5GLg4hge2MErefPmWCSMhI/G87
	xg5hC0us/PccqqiZSWLP/kWMXYwcHGwCuhJnt+eAxEUEWhklrq/sZAJxmAVWMUlMePcJbIWw
	gLfEvFlT2UEaWARUJS5NtAAJ8wrYSryZ+ZYZYoG8xOoNB5gnMPIsYGRYxSiaWlCcm56bXGCo
	V5yYW1yal66XnJ+7iREcjFpBOxiXrf+rd4iRiYPxEKMEB7OSCG9z+KY0Id6UxMqq1KL8+KLS
	nNTiQ4zSHCxK4rzKOZ0pQgLpiSWp2ampBalFMFkmDk6pBiaW0N2dxzmKH6yUmv9ZwenDIu2A
	KStSg8qeFQafNjizbrfW94PXq7Nbb6i57uxaWFl8cErUXZUtjIH/HA0qVff94J+66tzDRpvy
	khd/yqUPf3/3Krpxzc+w/VGFkUs66tiLfLrt9jkmcr6veL2Fk+P78adL1lzzudiRu2ZKVH6/
	c7/4rfu8V44u5X35edrJhS+jBM+zlqiHHq2fs2Hanpd23gpcT4327GheIek3Z8+Nq1duitRa
	X7nRse2O2PYUKem7S24kXfqzkWn7yaVmio8rY58+m3dXJP/xhg3Vh9VL2fY95PRb/XxNRtHK
	q2zHTzaYW3zKUnC9v9OxOmq5jJdIgN62nPXpJqXb7kvJJigVK7EUZyQaajEXFScCAA3LIsm1
	AgAA
X-CMS-MailID: 20240808083027epcas5p153e64139a5e71448b1ea3f04af1df2bd
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240808083027epcas5p153e64139a5e71448b1ea3f04af1df2bd
References: <CGME20240808083027epcas5p153e64139a5e71448b1ea3f04af1df2bd@epcas5p1.samsung.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

s5p-mfc bindings to json-schema is already merged with
this commit 538af6e5856b ("dt-bindings: media: s5p-mfc:
convert bindings to json-schema"). Remove s5p-mfc.txt
file.

Fixes: 538af6e5856b ("dt-bindings: media: s5p-mfc: convert bindings to json-schema")
Signed-off-by: Aakarsh Jain <aakarsh.jain@samsung.com>
changelog:
v1->v2
Add Fixes tag suggested by Krzysztof
v2->v3
Aligned Fixes tag in oneline and corrected commit message
Link: https://patchwork.kernel.org/project/linux-media/patch/20240213045733.63876-1-aakarsh.jain@samsung.com/
---
 Documentation/devicetree/bindings/media/s5p-mfc.txt | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/media/s5p-mfc.txt

diff --git a/Documentation/devicetree/bindings/media/s5p-mfc.txt b/Documentation/devicetree/bindings/media/s5p-mfc.txt
deleted file mode 100644
index e69de29bb2d1..000000000000
-- 
2.17.1


