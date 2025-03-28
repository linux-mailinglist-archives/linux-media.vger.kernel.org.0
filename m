Return-Path: <linux-media+bounces-28920-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 74337A748D4
	for <lists+linux-media@lfdr.de>; Fri, 28 Mar 2025 11:59:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8D7847A8B46
	for <lists+linux-media@lfdr.de>; Fri, 28 Mar 2025 10:58:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1331B215F5D;
	Fri, 28 Mar 2025 10:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="FRrfQ/96"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEA511C3BE2;
	Fri, 28 Mar 2025 10:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743159562; cv=none; b=RHJQku8zjNP0KW7TT2RJLrgROPc/SOMGt6d3AjhiLmIy8kMD+tEy878oNvd2OdYt7BPlhVUc+OucnxoxbpFceTiZ8hy72wTgnFEH5OrIQttK9qRvTI1SCQrZupxN1PEyTI5dgDE3i/kqnhdqi+DWPvwDeAlvAZMSfnIt1OIrHIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743159562; c=relaxed/simple;
	bh=apc4iycMNLyIViO3H+yzrkm8toCkD/TbV+3AEof97Is=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=M2k0yjvHgfQTTaVvCitWvJ1L9AVsN7lbCHSLC6fXN/FuWeDV9Trd6N616x+8YCJQemSrr4VCsGTxcT2sLokRwNEaDkoRXFi0utPqIVLIjzgr1NwmaFVkqUOdWsu+bq9GqJw+NEJTVl3m7ZJ0xwxFbAvwicsHupHCcuzIzAIaZLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=FRrfQ/96; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52S9Grai015797;
	Fri, 28 Mar 2025 11:58:50 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	EzHzTCgsYvR0knstWtXnq/fUHYTmf/QEn7nWUuuZZXs=; b=FRrfQ/96DFmzUkc/
	KKtAdxsc8kocIb0gx5yVhoZYpVkJaf7e0c1I0vOH0ZhPE5s/5BIGULV5gR+SexNF
	WMHSDAiNOrxxkMeiWYQYr2ZQTtNgfD2nlZYlEZf/Yp/Tqs7lFCmQnaI///rBV/5+
	Educe7Tz5lRRcSVdbUZdBsoaPWv4JKEjVHZCC05yOCF8d6c8DowDVmhKHO9oTGjJ
	QvtTbrUcQN5M5xK1VaYP8JvtKDMiJUPp91ZxEGXXxatPDQ1typFb7POHumxwozAT
	a4UdoplXzABff8pIYfAOgUYAtQ9eqM1rk8jCfZCaGtojOEbBXu0KYP5j7CHICfHm
	+oE/9g==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 45nq0b1511-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Mar 2025 11:58:50 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id F1EE14004F;
	Fri, 28 Mar 2025 11:57:49 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B835B87D247;
	Fri, 28 Mar 2025 11:54:56 +0100 (CET)
Received: from [10.252.9.227] (10.252.9.227) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 28 Mar
 2025 11:54:55 +0100
Message-ID: <537f2dbd-7b94-4e2c-8a81-fdac10481413@foss.st.com>
Date: Fri, 28 Mar 2025 11:54:54 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] dt-bindings: media: st,stmipid02: correct
 lane-polarities maxItems
To: Alain Volmat <alain.volmat@foss.st.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        Sylvain Petinot
	<sylvain.petinot@foss.st.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Marek Vasut <marex@denx.de>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-media@vger.kernel.org>, <stable@vger.kernel.org>
References: <20250210-6-14-stm32-media-fixes-v1-0-c64ebe9af8bb@foss.st.com>
 <20250210-6-14-stm32-media-fixes-v1-2-c64ebe9af8bb@foss.st.com>
Content-Language: en-US
From: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
In-Reply-To: <20250210-6-14-stm32-media-fixes-v1-2-c64ebe9af8bb@foss.st.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-28_05,2025-03-27_02,2024-11-22_01

Hi Alain,

Reviewed-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>

Thank you.

On 2/10/25 11:04, Alain Volmat wrote:
> The MIPID02 can use up to 2 data lanes which leads to having a maximum
> item number of 3 for the lane-polarities since this also contains the
> clock lane.
> 
> CC: stable@vger.kernel.org
> Fixes: c2741cbe7f8a ("dt-bindings: media: st,stmipid02: Convert the text bindings to YAML")
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
> ---
>  Documentation/devicetree/bindings/media/i2c/st,st-mipid02.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/st,st-mipid02.yaml b/Documentation/devicetree/bindings/media/i2c/st,st-mipid02.yaml
> index b68141264c0e9fe0e530ce3b06fa3434fa712b38..4d40e75b4e1efff673647dff7bf984c89abca4cf 100644
> --- a/Documentation/devicetree/bindings/media/i2c/st,st-mipid02.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/st,st-mipid02.yaml
> @@ -71,7 +71,7 @@ properties:
>                  description:
>                    Any lane can be inverted or not.
>                  minItems: 1
> -                maxItems: 2
> +                maxItems: 3
>  
>              required:
>                - data-lanes
> 

-- 
Regards,
Benjamin

