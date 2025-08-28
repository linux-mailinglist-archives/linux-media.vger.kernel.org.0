Return-Path: <linux-media+bounces-41259-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3590EB3A2B6
	for <lists+linux-media@lfdr.de>; Thu, 28 Aug 2025 16:52:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 58D911686A8
	for <lists+linux-media@lfdr.de>; Thu, 28 Aug 2025 14:46:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5BB73203AC;
	Thu, 28 Aug 2025 14:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="oIzxYjOM"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 022BD314B9B;
	Thu, 28 Aug 2025 14:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756392156; cv=none; b=VmJJfs9cUB7zvOrcEpf4N6bY5zihCYgw6kOBqE3USmcaHEu8ERStkKRf6Wc97A2ha7UR5O+8JpmvZxHFle+J/Jh04CZ2PDBYVhvowI3iEOasuKqFMn+f0h1ngvGc57MauB0EUKH5P5hayEvGt11XtkZJ0azTcrYLVm7pQtxM/q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756392156; c=relaxed/simple;
	bh=9m0e54X3ywwuvWTRLhMZKYn2Wcp07VIIc/N/ZVKto50=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=hZReAVwABZzyBNL8mxb2B+9HP+XCTnzxyVifI7gg3dl0GEMcJ9HivFYZ6LvP18JrhV4Xwm8cZOq4xvaPryAbujTIDIM8ACqPvrNqcspE14bpPs9gk1xOg5Iks9vKeo37vJ4BGcTepp7wsu3O8G6MSIvQvKxl19YKP6XNWa0cH4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=oIzxYjOM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57S6g45c030476;
	Thu, 28 Aug 2025 14:42:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aIZyCNtJMqp32YDuISOPpFsn8Ta+EMkciZAmf8fLdAQ=; b=oIzxYjOMvGzYPhkt
	Bt9Bptr9hbxxKU/un0FQYLkZNYnfH+OZd9ulG1gyNiYOMPnq8ypKSuIlXTSZnHfk
	ge/Gt9EU4qCuvqaYA5k5YgQDqJVidgeaLb5qv1i9l9WSWqINE/x0vdzeKy+5Tdtq
	mJL3Ge+jx1kLB9X9e516MIYTU/7K92GuIUQOym/kj95huyVlPIUn+EnSScKRVbzM
	I/Dk/eQNhgVsfRsARlMF6PTinp5jaB+IUKxsOawTQ6geSm1CyOZ4MROMn27iVOHH
	Z2pYvai1oVxRVHv/OrUhbGgSQyT1QAdAicn8GNNxog+NpmTbmwqRP0SXeAZimzEq
	s7L2wA==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5up0csf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Aug 2025 14:42:19 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57SEgITk022351
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Aug 2025 14:42:18 GMT
Received: from [10.216.32.160] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.24; Thu, 28 Aug
 2025 07:42:15 -0700
Message-ID: <95a1d91e-d00a-18af-0957-412109c13aba@quicinc.com>
Date: Thu, 28 Aug 2025 20:12:12 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] media: dt-bindings: qcom,sm8550-iris: Do not reference
 legacy venus properties
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Dikshita Agarwal
	<quic_dikshita@quicinc.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        "Bryan
 O'Donoghue" <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250823155349.22344-2-krzysztof.kozlowski@linaro.org>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <20250823155349.22344-2-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: cDlbtOJZDcn9tVHm2w2Pya3GtYjEyBfo
X-Proofpoint-ORIG-GUID: cDlbtOJZDcn9tVHm2w2Pya3GtYjEyBfo
X-Authority-Analysis: v=2.4 cv=JJo7s9Kb c=1 sm=1 tr=0 ts=68b06acb cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=KKAkSRfTAAAA:8
 a=COk6AnOGAAAA:8 a=XmET1tXKQoUtgWt8NUMA:9 a=QEXdDO2ut3YA:10
 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMSBTYWx0ZWRfX3xV4jrHbUrY6
 GgWaMLg07MPPOFsDBwuJ1z34iVIpLhoDGJP5QaBifocxe7VC1HRo3Jbwf8IXu9EFzcqoaWqOUBd
 HDOz2Ekr93nqqPMpdTKJ3eWw8AK1MUufcS0NfreF8dqLlzvdPgGVw6O7ToaO2NgzPIoz8OJnKkg
 PiWBprr062vXMHXAiqVHVeFAFp4MexdI7WYfQm65gv0mSboUJeLx5kYmZ5fQEWa5/iyFU2mQlRJ
 uQW7jSX5V+/IST7Nkojh2iRFBHbJPt1sL0t/vZY1OiYWGqM7UucLTSTJHGvYW3wD4EtE3zSwkBR
 1mbd5OTW9dK1J88uXDasKQRM+cyEwK6n4bUzneN/G0xeRiNcnY/4Bm/hnEkAR5vX97XfRNdy/eF
 dgGB1h3M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-28_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230031


On 8/23/2025 9:23 PM, Krzysztof Kozlowski wrote:
> The Qualcomm SoC Iris video codec is an evolution of previous Venus and
> it comes with its own Iris Linux drivers.  These new drivers were
> accepted under condition they actually improve state of afairs, instead
> of duplicating old, legacy solutions.
> 
> Unfortunately binding still references common parts of Venus without
> actual need and benefit.  For example Iris does not use fake
> "video-firmware" device node (fake because there is no actual device
> underlying it and it was added only to work around some Linux issues
> with IOMMU mappings).
> 
> Stop referencing venus-common schema in the new Qualcomm Iris bindings
> and move all necessary properties, except unused "video-firmware" (no
> driver usage, no DTS).
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../devicetree/bindings/media/qcom,sm8550-iris.yaml | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
> index c79bf2101812..320227f437a1 100644
> --- a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
> @@ -26,6 +26,9 @@ properties:
>            - qcom,sm8550-iris
>            - qcom,sm8650-iris
>  
> +  reg:
> +    maxItems: 1
> +
>    power-domains:
>      maxItems: 4
>  
> @@ -45,6 +48,12 @@ properties:
>        - const: core
>        - const: vcodec0_core
>  
> +  firmware-name:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
>    interconnects:
>      maxItems: 2
>  
> @@ -69,6 +78,9 @@ properties:
>  
>    dma-coherent: true
>  
> +  memory-region:
> +    maxItems: 1
> +
>    operating-points-v2: true
>  
>    opp-table:
> @@ -85,7 +97,6 @@ required:
>    - dma-coherent
>  
>  allOf:
> -  - $ref: qcom,venus-common.yaml#
>    - if:
>        properties:
>          compatible:

Reviewed-by: Vikash Garodia <quic_vgarodia@quicinc.com>

