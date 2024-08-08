Return-Path: <linux-media+bounces-15999-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7746394C057
	for <lists+linux-media@lfdr.de>; Thu,  8 Aug 2024 16:56:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 22BE71F27C85
	for <lists+linux-media@lfdr.de>; Thu,  8 Aug 2024 14:56:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3154725570;
	Thu,  8 Aug 2024 14:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="euaPm5W2"
X-Original-To: linux-media@vger.kernel.org
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5137718EFD3
	for <linux-media@vger.kernel.org>; Thu,  8 Aug 2024 14:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723128970; cv=none; b=hNaNfRAhh01/vkYyHav7spUsGT0vKtZnxz6SdMqW+R/yFp4e+GQon69AY02Tt63wlmeaM5o5mnXD75pZZdiCTDJyxyBAxXtFicv0GIaiDhRW6O/ct97lRwXT+C7c9jusz++qGVsiBWJJdjjptl5/wZZ6WVd7d0DB3Oh3GhfyXMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723128970; c=relaxed/simple;
	bh=3uV1fuMQTRFXuTNBkDloolIsfEw6mH5RqeD6IH0xgHE=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:References; b=WKn9dwYana2x65kWA8Gxcj83hFNVIpzxC7VG+su6h3xcNkoYQatieC/xbsOnYDRXzM4eAYMq/3hifcGUe2opdx/3rwcq3GeV+oKblmbirHdzvdvX4C4OW39k9iquB3if/FM4ZU2Sj84T6ukUTHaBfp9ryGAgEd3KJaZVkuOJNIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=euaPm5W2; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20240808145600epoutp04d8bbb830012d79c80997c0e093fd42b9~pyKjmKQM60730507305epoutp04W
	for <linux-media@vger.kernel.org>; Thu,  8 Aug 2024 14:56:00 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20240808145600epoutp04d8bbb830012d79c80997c0e093fd42b9~pyKjmKQM60730507305epoutp04W
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1723128960;
	bh=iNHEhsKUx1AEHn4RcoaHOHCYihBFYUXlK4KIGR/VKI4=;
	h=From:To:Cc:Subject:Date:References:From;
	b=euaPm5W2EvDLHTi3jNAj9v4Fep8mgfIhmfJUG+Iaxia6p5YGyNCzw3+Us/+aFAsna
	 rIf6KOCUoeDQcFdcQsAsJ7KhSikXgkFpUt8cXG5MQqSVumTIwoFaPrVurVfRxU2U8q
	 ZL/8hiNULWnYGyQPxQ8jgTk4mFEnGch0qi4m067Q=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTP id
	20240808145558epcas5p2c825edfc5676142867b54dee74fdac81~pyKiPHUfs2090620906epcas5p2r;
	Thu,  8 Aug 2024 14:55:58 +0000 (GMT)
Received: from epsmges5p1new.samsung.com (unknown [182.195.38.176]) by
	epsnrtp1.localdomain (Postfix) with ESMTP id 4WfqqK0hG5z4x9Pr; Thu,  8 Aug
	2024 14:55:57 +0000 (GMT)
Received: from epcas5p4.samsung.com ( [182.195.41.42]) by
	epsmges5p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	99.71.09640.C7CD4B66; Thu,  8 Aug 2024 23:55:56 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20240808135645epcas5p37c6bf0c6ad8efbe43e8451874900c111~pxW00INr_1294112941epcas5p3h;
	Thu,  8 Aug 2024 13:56:45 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20240808135645epsmtrp2a2c13c9a9563ffaaf1c17b590ae4e28e~pxW0zGl0S1652216522epsmtrp2V;
	Thu,  8 Aug 2024 13:56:45 +0000 (GMT)
X-AuditID: b6c32a49-a57ff700000025a8-d9-66b4dc7c889c
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
	63.BB.08456.D9EC4B66; Thu,  8 Aug 2024 22:56:45 +0900 (KST)
Received: from cheetah.sa.corp.samsungelectronics.net (unknown
	[107.109.115.53]) by epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20240808135643epsmtip14a883be020d8fe2f9098ecd4adea68f2~pxWy2ngIn3179631796epsmtip1h;
	Thu,  8 Aug 2024 13:56:43 +0000 (GMT)
From: Aakarsh Jain <aakarsh.jain@samsung.com>
To: linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: m.szyprowski@samsung.com, andrzej.hajda@intel.com, mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl, krzysztof.kozlowski+dt@linaro.org,
	linux-samsung-soc@vger.kernel.org, gost.dev@samsung.com,
	aswani.reddy@samsung.com, pankaj.dubey@samsung.com, Aakarsh Jain
	<aakarsh.jain@samsung.com>
Subject: [PATCH v4] dt-bindings: media: s5p-mfc: Remove s5p-mfc.txt binding
Date: Thu,  8 Aug 2024 19:14:32 +0530
Message-Id: <20240808134432.50073-1-aakarsh.jain@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrGKsWRmVeSWpSXmKPExsWy7bCmlm7NnS1pBs/fmVs83TGT1eL+4s8s
	Foc2b2W3uHlgJ5PFxZl3WSz6Xjxkttj0+BqrxeVdc9gsejZsZbWYcX4fk8XaI3fZLZZt+sNk
	sWjrF3YHXo/Fe14yeWxa1cnmcefaHjaPzUvqPfq2rGL0+LxJzuPU18/sAexR2TYZqYkpqUUK
	qXnJ+SmZeem2St7B8c7xpmYGhrqGlhbmSgp5ibmptkouPgG6bpk5QNcqKZQl5pQChQISi4uV
	9O1sivJLS1IVMvKLS2yVUgtScgpMCvSKE3OLS/PS9fJSS6wMDQyMTIEKE7IzTlzex1Jwhb3i
	35rLjA2Md9i6GDk4JARMJM5e4QQxhQR2M0pscOhi5AQyPzFKHP9a1sXIBWR/Y5S4c/QOK0gC
	pPzK4dUsEIm9jBJrV69ngehoZZJ4sFoSZBCbgK7E2e05IGERgVSJV+vWsoLUMwssYZJYdOQZ
	E0hCWMBbYsWud+wgNouAqsSDyTvBbF4BW4m1jauZIZbJS6zecIAZpFlC4CW7xNUp06ASLhJH
	Vsxjg7CFJV4d38IOYUtJfH63FyqeLPF40Uuo+hyJ9XumsEDY9hIHrsxhATmUWUBTYv0ufYiw
	rMTUU+vAbmMW4JPo/f2ECSLOK7FjHoytJjHnzg9oQMhIHF69lBHC9pDoeHCYDRIOsRJn5k1g
	m8AoOwthwwJGxlWMkqkFxbnpqcWmBYZ5qeXwSErOz93ECE6AWp47GO8++KB3iJGJg/EQowQH
	s5IIb3P4pjQh3pTEyqrUovz4otKc1OJDjKbAMJvILCWanA9MwXkl8YYmlgYmZmZmJpbGZoZK
	4ryvW+emCAmkJ5akZqemFqQWwfQxcXBKNTBFM/r135v85M/td4fEvK6sLTv5WOzI1h4tS8/q
	nuzoB4U3rFZGcj52//77jFT2Lma17XdPBx2UWani2/d0aqrN+aziKmfpc2cTm858KlzPMpM1
	d3pfQ1j9B4fvx1Llz9UIyq5i8xTq9RWNb7Bq2xTi82+KY8vmZMYPQWt/XNGMizXoWW/Klrzk
	jFineVHov7/tDtJb1lp/lonZvaPukcOObTdLBecFzGc1OnDU8/BOi1/b722KXT3xppntpub6
	WXZZB3vO2e7Y27v3+99e9h2RBlEqVyMO/RYPV1LjZ4416vjrJD5Z++ky/dtM5/qYDKrPJCkm
	Xt56ZsLHjJ6iApt3509uTOngrVFZMYE5+awSS3FGoqEWc1FxIgA/gwlKCQQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrGLMWRmVeSWpSXmKPExsWy7bCSnO7cc1vSDHZd47J4umMmq8X9xZ9Z
	LA5t3spucfPATiaLizPvslj0vXjIbLHp8TVWi8u75rBZ9GzYymox4/w+Jou1R+6yWyzb9IfJ
	YtHWL+wOvB6L97xk8ti0qpPN4861PWwem5fUe/RtWcXo8XmTnMepr5/ZA9ijuGxSUnMyy1KL
	9O0SuDJOXN7HUnCFveLfmsuMDYx32LoYOTkkBEwkrhxezdLFyMUhJLCbUeLrrYWsEAkZif9t
	x9ghbGGJlf+es0MUNTNJTLswGaiDg4NNQFfi7PYckBoRgXSJSXe+gg1iFljHJLFz5USwQcIC
	3hIrdr0DG8QioCrxYPJOMJtXwFZibeNqZogF8hKrNxxgnsDIs4CRYRWjZGpBcW56brFhgVFe
	arlecWJucWleul5yfu4mRnBQamntYNyz6oPeIUYmDsZDjBIczEoivM3hm9KEeFMSK6tSi/Lj
	i0pzUosPMUpzsCiJ83573ZsiJJCeWJKanZpakFoEk2Xi4JRqYNoTPEX0q7DwtHvbTDb9jjqv
	wt2pFBTr9PNRx2PLM19nxiWULsq9Knx6+sNebbXbTOVHJlzf8V5KfE2Ayv5PZ7pvu5xmYmCb
	LvfhXKd/q+3s8l6z81H8K9NFijUc57o0Pt1gu8qYy+G75p7+K5NnZX55uCu551nPLf85HEFf
	WFXKnjgZ5GQaFLgvn/dB8BIbx3/tn2kOkSkrbgoEqtcV/Vgka7j1zhF9VtdXez8qBMr9fhQt
	kaIkmfes1vW8n5hY+3+WU1cmX+WV2OqWdLL7XIH6Nq+sRY/j9n+rEf2W+sH6nkTMvbSWi55N
	v+SWlUpOP7ThQ7T/fK0jAWmHFnwWSBTNiJSLv37uaPlxxrZlXkosxRmJhlrMRcWJAOUkQJC5
	AgAA
X-CMS-MailID: 20240808135645epcas5p37c6bf0c6ad8efbe43e8451874900c111
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240808135645epcas5p37c6bf0c6ad8efbe43e8451874900c111
References: <CGME20240808135645epcas5p37c6bf0c6ad8efbe43e8451874900c111@epcas5p3.samsung.com>
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
---
changelog:
v1->v2
Add Fixes tag suggested by Krzysztof
v2->v3
Aligned Fixes tag in oneline and corrected commit message
Link: https://patchwork.kernel.org/project/linux-media/patch/20240213045733.63876-1-aakarsh.jain@samsung.com/
v3->v4
Placed changelog at proper place
 Documentation/devicetree/bindings/media/s5p-mfc.txt | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/media/s5p-mfc.txt

diff --git a/Documentation/devicetree/bindings/media/s5p-mfc.txt b/Documentation/devicetree/bindings/media/s5p-mfc.txt
deleted file mode 100644
index e69de29bb2d1..000000000000
-- 
2.17.1


