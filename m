Return-Path: <linux-media+bounces-25897-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 567B9A2E9D5
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2025 11:45:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 933AD7A2B75
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2025 10:44:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88DD61DE3CA;
	Mon, 10 Feb 2025 10:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="Rp9EA02h"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA65A1CAA82;
	Mon, 10 Feb 2025 10:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739184309; cv=none; b=Bo2TwAGks7UW8SYWsNpUAaLoSVIXyLB/TEAJvvfId2D6g5hW6aUFtG7B2fxcegqol0VcNSEXOgdmqMsmH6vi2WFIlrnxJuLS4bUh8B/en1a5E1H1KOYKXr1DJVD4vkKVr0f8dF8IPghIND4M3HKrp1K5OCvF7C1BOU1iiwJR6jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739184309; c=relaxed/simple;
	bh=Cvj5SmS/2dD6/BHiaLLezmb1EqPOsWisTTunV3hF0qA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=UT15530gG2ZUvBsJQgLI2SiXWNS5vKoIu+vyzSn3laSwA1fjNY5O1mlylk2Dt+XD042Btn6PaLuV+3LMGrpv4RzFbPbB75h5V2zMkNSAdiO7cmWZrPoSyokvEIw3eGcQzBiwMC5trxtJCA78o/XAsouaYdxTYomsw68zByYUEtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=Rp9EA02h; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51A9esgn022216;
	Mon, 10 Feb 2025 11:07:16 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	KrNQJraXZVjilPFdNhBPtBLSm+xWnPeDyMXrb2bQCls=; b=Rp9EA02hn4j6/zpf
	9WS8gwiAvBc0R7ipgIptAfQyN02mO4Mw5Ll8jIAuhu3B4UVda1tW2VSZVOS8Srmd
	rOLx0G8ukSY/k98zd1YrQn3FkjRV+Ih3fWyjqoclFZzz7pmqj+QZNgVd/BH8mwwI
	PsCghMr5T+r/8EeBqw9I9+txbubOAZzObCz1koLomFf5ZxjYGGFBnXboTwzOnfS1
	POSSuGMf4MYWxJUDbD5kbAhpSYRu3ZBtupaMrj+qItsRrTt1UmVpuCJe5/tjETgj
	G3RRiy6buyBL3CRbwWQSQMD57qpFTpUnWoUkdSt/KITAncS6rQAri3DfxrEqWNfp
	HKqNSA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 44p0rhwv3v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Feb 2025 11:07:16 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id AC6B84004D;
	Mon, 10 Feb 2025 11:06:16 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C587A2BEFA0;
	Mon, 10 Feb 2025 11:05:02 +0100 (CET)
Received: from localhost (10.252.6.236) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 10 Feb
 2025 11:05:02 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Mon, 10 Feb 2025 11:04:31 +0100
Subject: [PATCH 2/2] dt-bindings: media: st,stmipid02: correct
 lane-polarities maxItems
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250210-6-14-stm32-media-fixes-v1-2-c64ebe9af8bb@foss.st.com>
References: <20250210-6-14-stm32-media-fixes-v1-0-c64ebe9af8bb@foss.st.com>
In-Reply-To: <20250210-6-14-stm32-media-fixes-v1-0-c64ebe9af8bb@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
        Sylvain Petinot
	<sylvain.petinot@foss.st.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Marek Vasut <marex@denx.de>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-media@vger.kernel.org>, Alain Volmat <alain.volmat@foss.st.com>,
        <stable@vger.kernel.org>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-10_05,2025-02-10_01,2024-11-22_01

The MIPID02 can use up to 2 data lanes which leads to having a maximum
item number of 3 for the lane-polarities since this also contains the
clock lane.

CC: stable@vger.kernel.org
Fixes: c2741cbe7f8a ("dt-bindings: media: st,stmipid02: Convert the text bindings to YAML")
Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 Documentation/devicetree/bindings/media/i2c/st,st-mipid02.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/st,st-mipid02.yaml b/Documentation/devicetree/bindings/media/i2c/st,st-mipid02.yaml
index b68141264c0e9fe0e530ce3b06fa3434fa712b38..4d40e75b4e1efff673647dff7bf984c89abca4cf 100644
--- a/Documentation/devicetree/bindings/media/i2c/st,st-mipid02.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/st,st-mipid02.yaml
@@ -71,7 +71,7 @@ properties:
                 description:
                   Any lane can be inverted or not.
                 minItems: 1
-                maxItems: 2
+                maxItems: 3
 
             required:
               - data-lanes

-- 
2.34.1


