Return-Path: <linux-media+bounces-49467-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 36B38CDC355
	for <lists+linux-media@lfdr.de>; Wed, 24 Dec 2025 13:32:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 783F030528C5
	for <lists+linux-media@lfdr.de>; Wed, 24 Dec 2025 12:31:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63E5130DD1A;
	Wed, 24 Dec 2025 12:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SY+DonnX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TrDSHt0X"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 245ED30DD1F
	for <linux-media@vger.kernel.org>; Wed, 24 Dec 2025 12:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766579479; cv=none; b=SwpeJhoSXEHgrJYRdJw20/xnFSJzMJyeMjYUq6VPhjYTvAZ3KP4RnVFDavOhXFE2DxnzQIkgdDrNtY1oDkBlQYvt/f7Hn9mwAC6n44uHOWya6A+rf66fqSmsjQo0mFKbE7wDP9yuZ9jmkD466wzA67iZuaXx/QjK7m4gv1yIgrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766579479; c=relaxed/simple;
	bh=zJcfKTtr2OUt1atKsnqHQ8YeTCDMJphSaZU5HYu0LZ4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UBwBll6LWSaur+M9aqZwppkTNmvsY35lJXJdY2yREAHBpSg43q/6+un0QSeulH4Friqz8m4Tb/WAo/jz6Or+7G3NGs589xBZiXCh/2xhGAgOf03KPTOyAOP8fmLMnFbLreCBZA+QsfhoGN9g3oPxaGQ4KlEgZW918t9QFmG4rig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SY+DonnX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TrDSHt0X; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BO3w5ZT4134186
	for <linux-media@vger.kernel.org>; Wed, 24 Dec 2025 12:31:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	69LwN2GymV95gpb6upe2s92Dg5vXdcAsg/CyJzbONbU=; b=SY+DonnXVeKfnQT6
	qCrpcSc4dnXez1igRkWJX5lMoXZwDBmgcVq0gMhpfzFqkI93r0DHW7QgHrNYf5Vr
	Y8D3gf7ZNhitc49WnioTerAdYQ9zmnNHbaRUlJhON/hhItUWsNCLJJN6OpYNuStD
	FyghPVHCIzifqW24dwY+1vx+dBkwn1O5cRk8duNLxtwi7zyJgEnsrtN4ms1IUtkq
	HBxLDLautqXnzSBwcBlUojwf/Yy6S5/Ik7OXR1bmYa3FFfT+hqu5Xbffxkbz8g9q
	U9meMADe13ps8cI3SdcQ9gcNNogE0VsYVKbLfDRTO3NoFxQ3LWNGxKKUxqSwq+0a
	MdADnw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7x46u19x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 24 Dec 2025 12:31:17 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4eff973c491so148375181cf.1
        for <linux-media@vger.kernel.org>; Wed, 24 Dec 2025 04:31:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766579476; x=1767184276; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=69LwN2GymV95gpb6upe2s92Dg5vXdcAsg/CyJzbONbU=;
        b=TrDSHt0XmQtkZxvtlO3UfcSPT59LRBsj70AkuWgA3Dmdu7hUM0UDyR+0yb6FTWniZD
         SeAPH2Pu5SX2E70bknGwtGEOyWDTiUCBvIVdOJgCeZ5CXy+lXAsV0YgsJFTZkLW5OlB/
         PHps6Ja1dzNxi+Ui9wTnf8Ucl5TCbwgVcFKs5y2aTjJ0frYYqNFn5aIdcqADXSS+N3EH
         bS4wnLWExyTZoK3z4C8KKDSgzLYNupx6LE9zzvcIwLuQCsGE0a4HC/R3F1Y4n4uiug5e
         SObOp4cihiW4kGwzwGgAt09f52+IJqf6v8LqLDJZ4o/Gk6JX3+fIlhGpUwbISudS7RDV
         CW8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766579476; x=1767184276;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=69LwN2GymV95gpb6upe2s92Dg5vXdcAsg/CyJzbONbU=;
        b=r7te/RZzK9HcFiG4cOdjwat+C3ruASKs/4vXy6zUwyyvi3S+gOUO3j8vpseILHl88x
         U7JmhJmFySVR2/u2jFY2ueLK0/NAeqj05psjWRDrQFwRT96BdqdI+YeBqgPxu11Iq47o
         8CwT9TiWxfRtwwKanR2B9aQfcJDJ8WbNpr3vnu9Xu7Cww/a1rB27VzV+mNvdnzwT7Fd2
         ZSl3NcOq/Dg+8ahvVg+hETZrmmoyZFSEDi4DI1SKLa358h4KYQOJKWpbRD3NdHDMzv6a
         vm8flS2ITkGQwxvnXIKubC3Pf2s/bAdyTJlcXBlgFuTDwXXcOHjnB0+XyPMirmU+YIZZ
         Q5bw==
X-Gm-Message-State: AOJu0YwT1YVsB8oE0UUwBA9AFGOVYfRjNepU+c6y0JjI6PX3yfoPG7id
	Hm0IfmC++mEakVHe3hhJz4FkLLI+T5K537AhZ3BCgWwAOwvWPZtsFadhF798VAKhryC5qtIk/4e
	3B5kx1FSnY+1lb0JLrchH8y1Wl4kfCiC903MjDVuMGbVxv3wAbeKZBR8MIxwRrDp2Kg==
X-Gm-Gg: AY/fxX74kBoVLYKY2Y0oD+suy8b88QDPKJjhcfoI2nV78cKcLIFBkYWd7v3UYZD78ym
	25NXrUbioD6G/nMYO0uLZ/SLa/zg9kg+PI7blmFR02qHIJDhl3vM4E+pX2IVGFVL9Eyc5B4SZ21
	KljcMf8EL+5cg3aooXSL96WJ9kolNSvd+XdqotMnuPCMQTqIfgVpcmqFjK6enwt+AmjzpuNgivr
	6pqNC/iGeGSJ+54BHp+/wfcF448N6Dxgy1FttK/Id4TKVURdEW2dwyuF8RnyZyw+kbIv0oV6Kce
	7To4bgXubsnmtLPcb7qdL0lPYD41cl/9yAjt6QVluX6V8b7akLP54tD+FcQJVzESnk/DnNFkijW
	4PQZkYZjzXA0vcHP8xgp7U9PrmeBJCqNRW3u1BVo1GJAHDz6SrtyzceMaJJKFrOS4/HB1DK1r9c
	2bQ/Q4nJu03mFN2YkDbz8Es8dDyRn1RNIbeRf4rl8G
X-Received: by 2002:a05:622a:2505:b0:4ee:1e63:a4e0 with SMTP id d75a77b69052e-4f4abdd5bf0mr284304831cf.74.1766579476238;
        Wed, 24 Dec 2025 04:31:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFqgmQEf9res857crOrJAdP6n2C6W3dZtLXr/MM3Vab2v4e67/gWNhXFq8iSj83KVLRHU754w==
X-Received: by 2002:a05:622a:2505:b0:4ee:1e63:a4e0 with SMTP id d75a77b69052e-4f4abdd5bf0mr284304271cf.74.1766579475839;
        Wed, 24 Dec 2025 04:31:15 -0800 (PST)
Received: from shalem.localdomain (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f0b12dsm1750304066b.48.2025.12.24.04.31.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 04:31:14 -0800 (PST)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Date: Wed, 24 Dec 2025 13:31:11 +0100
Subject: [PATCH v4 02/15] media: aptina-pll: Add comment documenting the
 PLL chain
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251224-mt9m114-atomisp-v4-2-60b25da7a1bc@oss.qualcomm.com>
References: <20251224-mt9m114-atomisp-v4-0-60b25da7a1bc@oss.qualcomm.com>
In-Reply-To: <20251224-mt9m114-atomisp-v4-0-60b25da7a1bc@oss.qualcomm.com>
To: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans de Goede <johannes.goede@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: 3b-5_BqQitG7zXGt9xYjcWbw8AMyqn_J
X-Proofpoint-GUID: 3b-5_BqQitG7zXGt9xYjcWbw8AMyqn_J
X-Authority-Analysis: v=2.4 cv=aOf9aL9m c=1 sm=1 tr=0 ts=694bdd15 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=P1BnusSwAAAA:8 a=EUspDBNiAAAA:8 a=oOvwe9_kTgpR66QT4jQA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22 a=D0XLA9XvdZm18NrgonBM:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDEwOSBTYWx0ZWRfX9FutReq1pLyD
 F9Bfi3JUisQioWW1DA1m85nSjDfsUWaW7oYwrCIWaQgjbiZANspIG0HM+UZsFt3I2+U4Buhgj9e
 0inSfF3uah2CaGpsxZymx5bnaYhyHNvFFM06OmcFycPUWF0JP8CFeBmuNj8jXAnl0BICJF675ay
 tkJu/h4jEWDz6Gi9m0fGFKVna/mluWcPob9N3m5yHbS2CLi5Z2cY4fJbcjgXZUBKsC1Eyab1cv7
 g25BBFH5khhTKLNE7LIHQKsOOeN+R6yG1JmknG9kAQ2hrrq1NN8xnd/DWfCXj3L42EfVyOnymfC
 SsKLdZMHeYIea7pNgh0owu5kjf0NHDXouHxedDS0oXgPtOmmhtUoH9gfq+EIE8DWRs6Lwl/0Ypb
 zVOMeJ54RgAgXuGPQkIW7SWAtNZYgFNSR+jG6O3JDrJL9caFmVquEttlZz1hl5kxFdwrC/ugEed
 ClDBzrT1CuyJu9mNqqQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 suspectscore=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512240109

Add a code-comment documenting the PLL chain, this is a verbatim
copy of Laurent's ASCII-art PLL chain from the mailinglist.

Link: https://lore.kernel.org/linux-media/20250629204655.GA2059@pendragon.ideasonboard.com/
Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
---
Suggested-by: should really be Co-authored-by since I just copy and
pasted Laurent's comment from the list, but that requires Laurent's S-o-B.

Laurent can you give your S-o-B for adding a Co-authored-by ?
---
Changes in v4:
- New patch in v4 of this series
---
 drivers/media/i2c/aptina-pll.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/media/i2c/aptina-pll.c b/drivers/media/i2c/aptina-pll.c
index cd2ed4583c97ec87e516acfd249fdccf2f9efbb8..4a519ab587ba4cfb9945a1bb05e87a3b5e6d28c9 100644
--- a/drivers/media/i2c/aptina-pll.c
+++ b/drivers/media/i2c/aptina-pll.c
@@ -12,6 +12,16 @@
 
 #include "aptina-pll.h"
 
+/*
+ * Based on the docs the PLL is believed to have the following setup:
+ *
+ *         +-----+     +-----+     +-----+     +-----+     +-----+
+ * Fin --> | / N | --> | x M | --> | x 2 | --> | / P | --> | / 2 | -->
+ *         +-----+     +-----+     +-----+     +-----+     +-----+
+ *                                         fBit       fWord       fSensor
+ * ext_clock    int_clock   out_clock                             pix_clock
+ */
+
 int aptina_pll_calculate(struct device *dev,
 			 const struct aptina_pll_limits *limits,
 			 struct aptina_pll *pll)

-- 
2.52.0


