Return-Path: <linux-media+bounces-24188-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 18A7B9FEC5F
	for <lists+linux-media@lfdr.de>; Tue, 31 Dec 2024 03:12:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F37631882F2D
	for <lists+linux-media@lfdr.de>; Tue, 31 Dec 2024 02:12:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAAA013C9C4;
	Tue, 31 Dec 2024 02:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="a86EWqjw"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 650E91EEE6;
	Tue, 31 Dec 2024 02:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735611141; cv=none; b=VNwBF7+D2xnV19kt83xr0awvJPip3j523zVLNdmmyTQLJM5Y+hxMVFDNXo8boVXne5ZKXZweYr0BhB8vA0xc6UlFcN+QldA2RwGi9HoJnCJ/4tEiRQ45EcxUgx7kRZMjoo3XU/fOWN8olPCpSkhykAmhHnuo/dcZ2vxpDBw2O8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735611141; c=relaxed/simple;
	bh=5FEbKt6kSXBWOpnW1shqIeo2JvACa9nxNkoVndr0wnk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=XfdBG30eyQy8VKQXPYsnIJ3I7v1ElQAOHO4Lh1dQMUKd7CX9TtrbqpLysgbH/uBM0uaK0K/w5nGdpF4gFY1OE0Teqe1C6eofMVjtfcCs7u8RHo0QpYNNTu0lEMS2OK+DBIJsLJmPgfdIUGlYL87w1hmHSYp1FmZkP9QCNVh5/Vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=a86EWqjw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BUKqk2q022670;
	Tue, 31 Dec 2024 02:12:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6qpD0UfSDu22yFJD580YmIT9lzTBVTxSgxhHadDfx38=; b=a86EWqjwmTgBUD2t
	c29HqDoUMpIa9fMPW81YoPjtBUubosW23FR5Se5Kn2daRS4S5D2HY+tkf+tjZQ51
	UrkfyXHtj8+gEUI3d4hu16GDR16WV2B4cMg215yTWLnY+v4C62qUGEF12cfTec/9
	OunmVGTSUQyDcd5jAAxOrq2r7IeE6EhlwRhuiaVmYe5lpmBFyC+uv8ZgWuF6UPBM
	p3oiHlIrwpvzf75rkJ1mY825EifwDmdKBnQ3o455CA56qJjnVD5aF5P/9ZhfWqLk
	qNolQqvvete+DnEAW1NCR99O6NBZy4P2KSaREAdm9FV0eYJCMh0XVSZim+RCTObE
	ODbSYg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43uvxxh7mr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 31 Dec 2024 02:12:14 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BV2CDsS019400
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 31 Dec 2024 02:12:13 GMT
Received: from [10.253.8.45] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 30 Dec
 2024 18:12:08 -0800
Message-ID: <325ac989-855d-4474-a02e-d378013a11cb@quicinc.com>
Date: Tue, 31 Dec 2024 10:12:05 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/4] media: venus: enable venus on qcs615
To: Bjorn Andersson <andersson@kernel.org>
CC: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Vikash Garodia
	<quic_vgarodia@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
References: <20241219-add-venus-for-qcs615-v6-0-e9a74d3b003d@quicinc.com>
 <xygyprx3e6iagoq55bw5y2ruvoqd3jy5defpp4jyeo5sqlomto@rxkp6eolrewp>
Content-Language: en-US
From: Renjiang Han <quic_renjiang@quicinc.com>
In-Reply-To: <xygyprx3e6iagoq55bw5y2ruvoqd3jy5defpp4jyeo5sqlomto@rxkp6eolrewp>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: VsNAdcqG6uf0t8Z-DlBh-ZWcIqvODbhm
X-Proofpoint-GUID: VsNAdcqG6uf0t8Z-DlBh-ZWcIqvODbhm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=886
 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 adultscore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412310016


On 12/27/2024 6:19 AM, Bjorn Andersson wrote:
>> QCS615 uses the same video core as SC7180, so reuse the same resource
>> data of SC7180 for QCS615 to enable video functionality.
>>
>> There are no resources for the video-decoder and video-encoder nodes
>> in the device tree, so remove these two nodes from the device tree. In
>> addition, to ensure that the video codec functions properly, use [3]
>> to add encoder and decoder node entries in the venus driver.
>>
>> Validated this series on QCS615 and SC7180.
>>
>> depends on:
>> [1]https://lore.kernel.org/all/20241108-qcs615-mm-dt-nodes-v1-0-b2669cac0624@quicinc.com
> This series has requests for changes and will as such never be merged.
>
> Rather than relying on the maintainer to coordinate your cross-team
> dependencies, it would be preferable if you grouped your patches per
> functional area (i.e. you include Taniya's patch to add videocc) in your
> series.
>
>> [2]https://lore.kernel.org/all/20241108-qcs615-mm-clockcontroller-v3-0-7d3b2d235fdf@quicinc.com
> Same goes for this.
>
> I'll drop the two two dts patches from my review queue as they have
> unmet dependencies. Please resubmit them together with dependencies or
> once the dependencies are available in linux-next.
>
> Regards,
> Bjorn
  Thanks for your comment, I will sync with Taniya and ask her to update
  these two patch series. Then I will update dependency versions.

-- 
Best Regards,
Renjiang


