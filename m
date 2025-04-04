Return-Path: <linux-media+bounces-29386-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 52F84A7BAE6
	for <lists+linux-media@lfdr.de>; Fri,  4 Apr 2025 12:34:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A4B6716F851
	for <lists+linux-media@lfdr.de>; Fri,  4 Apr 2025 10:33:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 315F71B9831;
	Fri,  4 Apr 2025 10:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="JYqK8ygK"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C767D10E9;
	Fri,  4 Apr 2025 10:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743762828; cv=none; b=dsvx38CfVF0gEFBtYKEAehSdCDnkSh85CtZQUg9Nu0vWfagqEgYAmINVvDn447wDQVY8bQ9OX2Az44ja1xXQpDSL5Uxa3kt22N8qO36LroNefCEjBDCrlBwRyI90YNcKo8vUwyqvuXnvmyzZkvkZhtWVWkkkWL/F+3G2W+ViuZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743762828; c=relaxed/simple;
	bh=38upGB0DbOTlqZuiMJDcmdUwubOS+Q8tO4NLEP+t3aM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=NRjbCDCYWzvybcUYXs1s4oqM83Ae81aIp3KdxN5Zjy8QEuVZQ3dwsQzAlv7cwXxslS70ieref0GujNe0VYHFQ/7w8BjoVkx4J6CCzS8Ih7VKoTrEubNzxGVC3Oj/bz7VOOVBfhInpkgSXLUfuIqe07tvvgrPJ/PV0TjQ6YaAoXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=JYqK8ygK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53433oJC012456;
	Fri, 4 Apr 2025 10:33:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lIOnZULnFX+QVwFsNZ/W3Tbhwbo208fPQklkCX8gMyg=; b=JYqK8ygKltlOLYBI
	yCvOT5vifwig97kV6O9W5NFtHepjaLaQaXU2F2WnEXVHnlwsYd+8KDcy0N0nvwA3
	6fQfNi+0u+eeqK91cQJcJ+nUrowcrayNHiGFdFOJtTTcatHlQZYQQ9EhPefHCroc
	XP3I1Q+qdMvLFM17Lyr1MqbjClBUvb/NksvUlFcbgmpmwXIHFNOT5PhgM9hV9EPL
	5pul9MFE+WDMLKpCqng49oLIiXW7bjbNenM0hijcyrauVffzMVCkJnhiMJr8H3zV
	CWewySg/XrFD0WjKzGIY/I/SgMesUZQa8EWy3cCNxya0VUt6gJvjlzdAjyGkOSTV
	hdWoOA==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45t2d51fqb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Apr 2025 10:33:40 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 534AXdCQ015295
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 4 Apr 2025 10:33:39 GMT
Received: from [10.204.100.69] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 4 Apr 2025
 03:33:35 -0700
Message-ID: <b73f8aa4-ccb9-d8fe-90c2-4430520d2255@quicinc.com>
Date: Fri, 4 Apr 2025 16:03:32 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 0/8] Reup: SM8350 and SC8280XP venus support
Content-Language: en-US
To: Bryan O'Donoghue <bod@kernel.org>,
        Dmitry Baryshkov
	<dmitry.baryshkov@oss.qualcomm.com>
CC: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Johan Hovold
	<johan+linaro@kernel.org>
References: <20250304-b4-linux-media-comitters-sc8280xp-venus-v1-0-279c7ea55493@linaro.org>
 <8cfaeb25-2657-9df4-5cea-018aad62f579@quicinc.com>
 <it3njgklhnedjzojafuxpjy3o5zfulgdclweyobv7kjgtpjmzx@6opje7yms4yg>
 <1dd6e03d-09be-4853-741a-4fb47b7619a0@quicinc.com>
 <70891a99-d2ca-4fd3-a88d-2f66a9a78f66@kernel.org>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <70891a99-d2ca-4fd3-a88d-2f66a9a78f66@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: JFJ9DZSbqRMiS4GbkjyNFynO1TviuMIx
X-Proofpoint-GUID: JFJ9DZSbqRMiS4GbkjyNFynO1TviuMIx
X-Authority-Analysis: v=2.4 cv=Cvu/cm4D c=1 sm=1 tr=0 ts=67efb584 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=NEAV23lmAAAA:8 a=atOABbsASZFoYH5kmBwA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-04_04,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 adultscore=0
 bulkscore=0 suspectscore=0 mlxlogscore=911 malwarescore=0 spamscore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 mlxscore=0
 clxscore=1011 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504040072



On 4/4/2025 2:32 PM, Bryan O'Donoghue wrote:
> On 04/04/2025 06:24, Vikash Garodia wrote:
>>>> How different is this from sm8250 which is already enabled on iris driver ?
>>> As far as I remember, SM8250 support in Iris did not reach
>>> feature-parity yet. So in my opinion it is fine to add new platforms to
>>> the Venus driver, that will later migrate to the Iris driver.
>> I would say, from decoder side all codecs are there now on Iris. H264 merged,
>> while h265 and VP9 dec are posted as RFC, there is one compliance failure which
>> is under debug to post them as regular patches.
>> If we are mainly looking for decode usecases, then we should be on Iris.
>> Preference would be to stay on Iris, otherwise we would have that extra ask to
>> port it later from venus to iris.
> 
> Right now venus represents 9/20 - 45% of the patches being churned for sc8280xp.
> 
> https://github.com/jhovold/linux/tree/wip/sc8280xp-6.14-rc7
> 
> This is a good debate to have, however my memory of what we collectively agreed
> both in public and private was to continue to merge new silicon <= HFI6XX into
> venus unless and until iris hit feature parity for HFI6XX and to continue with
> venus at that point for < HFI6XX.
Agree. Would appreciate your help later as well when we migrate these SOCs to iris.

Regards,
Vikash
> 
> So merging sc8280xp - HFI6XX is consistent with our agreement, the right thing
> to do for our users and a big win in terms of technical debt reduction.
> 
> I will post an update to this series ASAP.
> 
> ---
> bod

