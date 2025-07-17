Return-Path: <linux-media+bounces-37935-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 26ADDB08447
	for <lists+linux-media@lfdr.de>; Thu, 17 Jul 2025 07:29:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 83BD71A63D25
	for <lists+linux-media@lfdr.de>; Thu, 17 Jul 2025 05:30:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F47A202C45;
	Thu, 17 Jul 2025 05:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="osh6IZKI"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B69A1DE4C2;
	Thu, 17 Jul 2025 05:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752730183; cv=none; b=kPA765ni1rMhFXdV3KvzngUHkn1fW4cZ4yL4XevmVQ3Tnh4jLqZamLQtujm5Q7ETL3BS3YuJiVM+EBuW5qOGIHJE7w+dCVstspWOwHx14kvh8a0N1cwDA1ifQ5dM5yFxTZSwkmWdH7J7PiXATxFU7biRSgyo+KocZ+1J9kUNNb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752730183; c=relaxed/simple;
	bh=1YOTVp4nHv0BZ7i58c4SKiaJdSMcdRVXOcAQIUL+unc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=SU48t89pP034MkmTF20ESb5HJiRB74tun0SZxuW81Iuby0IExNspmmf1THqPC4/rysyKbPetYIHmSa0TF2dyBSw5C9kmTCcmfPm9JBo8zYSh1udgDuetLRXMBMicWsURb2ydmuevTD6WaDbzi1g6yoZZzHkhjvvUBvavHSXKZ2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=osh6IZKI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56H5RGPQ021636;
	Thu, 17 Jul 2025 05:29:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3MhQvyCES0nl5lKNd0WhTNMhyxl4JLHMvRYThxKdV2c=; b=osh6IZKImUiId3uP
	I8i+mJvt6GH8K4tI7cXffyX9b72ST5SjurEhaNzQnFMbTvNCNf0IBVWrwUQOsRaQ
	A3WZ1+5wncBQdWZQJWkQlxeZrkr6wMGmGTJknR8DkoI5lMZmxd+qHztfYjWqQ1ri
	nnELRbdKAuwTcLjFlC+9L1tSgw4BA0AA3z6duA0cYPY53xL16TTNMU6AImq4U+Cu
	9DrWmelnAfwtWq9fRipYT+ktZRA2zi1cazc9mSWD6G25YzzjrEVEJsxI5Ni7aWw6
	d+K5LRX0BQyoYRiwSSGU3PjOigJWg7qK5CvaCwPJ9JpHtgAXZsHpQnVpOSLqvlEX
	2IU7xQ==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ufu8e7a5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Jul 2025 05:29:21 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56H5TKml028519
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Jul 2025 05:29:20 GMT
Received: from [10.216.39.173] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Wed, 16 Jul
 2025 22:29:16 -0700
Message-ID: <0cac2138-391e-ffc9-4cdc-07668795e6d1@quicinc.com>
Date: Thu, 17 Jul 2025 10:59:13 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] dt-bindings: media: qcom,sm8550-iris: Add X1E80100
 compatible
Content-Language: en-US
To: Stephan Gerhold <stephan.gerhold@linaro.org>,
        Dikshita Agarwal
	<quic_dikshita@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
CC: Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Stefan Schmidt
	<stefan.schmidt@linaro.org>
References: <20250704-x1e-iris-v1-1-c3137d979e43@linaro.org>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <20250704-x1e-iris-v1-1-c3137d979e43@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE3MDA0NSBTYWx0ZWRfXzXvZnxdlIFUW
 YfMJOUFPu8u80vhbhYSjfAa0WOJ601mDot1uUuO06Re1+JhvDW1OJ04S9oLA8ZqO1lKh9Mt0Qdg
 tJwBy+WBVAdtGF+QO2eE2mVUJiYEEnQjLhinH5q+LDdi6/0xLZOO1ELKmuiUrosnej2rcVFW7Ms
 Zlx0wkgzo4lzUpBBodCs4IAQQuOPikUbE92FSl8cdrxUn9qBu3k4xpJlCWrxctcDXscjQlMpPXD
 0wZAb098YJcTivF+7nf2VX93qgDZfXenMa/QbFdf34tDpZCTI6xndMk5Ootym2ZGPaJ54o4ayR6
 06t2fqlb9YHsHshVgNY429jDwm7xx7151Scwf+kJaVxBHINRnHYETKS6hh4UUorhMAGfrq9ZT0j
 I78Ldzi+wbgZyIvb3Ap6o/G8JuqbLc2Im29b4ZDIGtCnJYUl+mBuD3OkPTukg7kkzXp9AfA4
X-Proofpoint-ORIG-GUID: NOrIs6m6EPrQvtJYahuhIBUGYXCJ0QYX
X-Proofpoint-GUID: NOrIs6m6EPrQvtJYahuhIBUGYXCJ0QYX
X-Authority-Analysis: v=2.4 cv=f59IBPyM c=1 sm=1 tr=0 ts=68788a31 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=KKAkSRfTAAAA:8
 a=COk6AnOGAAAA:8 a=NRAvYGhPTOzaQrcWcUcA:9 a=QEXdDO2ut3YA:10
 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-17_01,2025-07-16_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 lowpriorityscore=0 malwarescore=0 spamscore=0 mlxscore=0
 bulkscore=0 suspectscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=999 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507170045


On 7/4/2025 7:08 PM, Stephan Gerhold wrote:
> Iris in X1E80100 is pretty much identical to SM8550. We can use the same
> firmware image and the same definitions in the driver, so just add
> qcom,x1e80100-iris to the existing list with qcom,sm8550-iris as fallback
> compatible.
> 
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> ---
>  Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
> index c79bf2101812d83b99704f38b7348a9f728dff44..9504d7ea23f4a30fd2d03e8683721641f8b1a115 100644
> --- a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
> @@ -20,6 +20,7 @@ properties:
>        - items:
>            - enum:
>                - qcom,sa8775p-iris
> +              - qcom,x1e80100-iris
>            - const: qcom,sm8550-iris
>        - enum:
>            - qcom,qcs8300-iris
> 
> ---

Reviewed-by: Vikash Garodia <quic_vgarodia@quicinc.com>

