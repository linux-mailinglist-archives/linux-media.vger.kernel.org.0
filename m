Return-Path: <linux-media+bounces-32254-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E1C8AB2F5C
	for <lists+linux-media@lfdr.de>; Mon, 12 May 2025 08:11:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A8891189A5D8
	for <lists+linux-media@lfdr.de>; Mon, 12 May 2025 06:11:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77C4A255E33;
	Mon, 12 May 2025 06:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="dNN5zwrW"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C47080B;
	Mon, 12 May 2025 06:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747030252; cv=none; b=elJbxexivvIfKK/QTOc2Q5zhvfaAfcPxzK+2Pc6DfMJY+g12vmN396YwdVw+TWbOiOAcLJwNgexM9t/wKlp5IfR0rQnwDMSJvCsHys8i0nOeF27DAB0MKqK7LAv00JyMhaJcyf3L2s7W7ioqYSZN9Uf/2irfLlYzYH6LUe4+Mes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747030252; c=relaxed/simple;
	bh=6lhNFOoojKX3eUP7C5eh/HI9G9rsFuJ8URXW7oBpebE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=KZwYXGUUUWppvkLJWmua5whcdQnrmkhOZOYlAcWiSyP0ZE3XkBHDOvRrL1JSd1Ao+6RWafs/y7a0iDBCokf3N95LaR6z/c0VGv/RzmK2hT3Mpz1n58wIR/cosJ3AJEoDrnf/fHFJS+PsOIi3izHtyH8LoJBD2q2ovMOXKDaSR0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=dNN5zwrW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54BLeEA0016839;
	Mon, 12 May 2025 06:10:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KwlDUaySrakDWPxDjjyqX13omrVCtFWxy05G5JTsJZs=; b=dNN5zwrWeThRBYFE
	TWpcK7pfMS0oWHoEE/FZrpIscAnphTUk+AIoXJBGMKlvXbPEJ/IDoe35uWAGYxuM
	/k5STQjI00CBbOydBnwskHov119FUhXdo3KLHoAg787PvMYm19602nLqZHDpW3Di
	lxfVK/YhxHBTnc4ljHMEeq9NrT5Rap6CgTo7VpNGuPMEQil21DKUgx79jOLE7TLD
	ZtjS01E7y7me1rO1jPugZLe4RyCsIM5YIIfU4Qwd9FlmN9XoHTTgCEMpy7pa/qkS
	5vdvK3jFgof6f4dhMSFjoKdk0i8zgLW3jvNrh4DXQNVzThLuKAGkeG1CMrA210zp
	LJc3wA==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46hyynu5gw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 May 2025 06:10:47 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54C6Ak2N002076
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 May 2025 06:10:46 GMT
Received: from [10.50.62.222] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 11 May
 2025 23:10:41 -0700
Message-ID: <f54bbef9-aa48-efa5-e7eb-477035ef069b@quicinc.com>
Date: Mon, 12 May 2025 11:40:27 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v5 0/3] media: qcom: iris: add support for SA8775P
Content-Language: en-US
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        "Konrad Dybcio" <konradybcio@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "Bryan
 O'Donoghue" <bryan.odonoghue@linaro.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>,
        Dmitry Baryshkov
	<dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio
	<konrad.dybcio@oss.qualcomm.com>
References: <20250421-dtbinding-v5-0-363c1c05bc80@quicinc.com>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <20250421-dtbinding-v5-0-363c1c05bc80@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEyMDA2MyBTYWx0ZWRfX3qSlDVqpYAcg
 7I/fzkTIFgeZIvy0kWLakMhtAsH8479Yzr8+LM5CTcMzXTd6jYDyBTg2iYqtPe6KK6RzQixjSSe
 JHXTWZ74pm1A3Teg8nGKRyCNcdg1FrBXkG3ZQd+BnKYF272bL6+zUCZ3Orq8aJxJYpIxYtA6ztN
 JVpMJDNw4d3koSdo4AoWU5OTG7tNSTVhGeo5kUqoFZRGcBvgs+iYFM6Sb6BXhhkS79mzqOvoGVB
 oGDoWH6RvoOuB+hsuIrYMCynC45+csTJm9WgfHCn5kSolFThsJRwbR1XPnP2LsFWf/ci+AZT/m5
 /vPej2FFU0HIISGBK5m6Idc/sf0zDrQoY7rP6vz+U5D6qPXLtNdU4A8Bb7MHI6M1j3lLay/5r9k
 zpj4O/HAphkBUSZFe6l1XQqwQKO1bb6lo0Jq39af47k05YSAothME6zJ7oIPuHnnqzA/ujgP
X-Proofpoint-ORIG-GUID: mm_8SYX_yh3bqaJhT32Zt6fYgaWbW5n_
X-Authority-Analysis: v=2.4 cv=Uo9jN/wB c=1 sm=1 tr=0 ts=682190e7 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=3NXaMSWaM5VxNsQXxBMA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: mm_8SYX_yh3bqaJhT32Zt6fYgaWbW5n_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-12_02,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 mlxscore=0 adultscore=0
 impostorscore=0 suspectscore=0 bulkscore=0 spamscore=0 mlxlogscore=999
 lowpriorityscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505120063

Hi Bjorn,

On 4/21/2025 8:16 PM, Vikash Garodia wrote:
> add support for video hardware acceleration on SA8775P platform.
> 
> Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
> ---
> Changes in v5:
> - Fix clock corner and a power domain specifier
> - Link to v4: https://lore.kernel.org/all/20250321-dtbinding-v4-0-6abd4575bff4@quicinc.com
> 
> Changes in v4:
> - Fix the order of video node.
> - Link to v3: https://lore.kernel.org/r/20250320-dtbinding-v3-0-2a16fced51d5@quicinc.com
> 
> Changes in v3:
> - Fix nit review comments.
> - Link to v2: https://lore.kernel.org/r/20250320-dtbinding-v2-0-8d8eaa4e76cc@quicinc.com
> 
> Changes in v2:
> - Drop 01/04 patch as it was not needed.
> - Introduce sa8775p as fallback compatible to sm8550.
> - Move firmware files to board DT
> - Link to v1: https://lore.kernel.org/r/20250311-dtbinding-v1-0-5c807d33f7ae@quicinc.com
> 
> ---
> Vikash Garodia (3):
>       dt-bindings: media: qcom,sm8550-iris: document SA8775p IRIS accelerator
>       arm64: dts: qcom: sa8775p: add support for video node
>       arm64: dts: qcom: sa8775p-ride: enable video
> 
>  .../bindings/media/qcom,sm8550-iris.yaml           |  7 ++-
>  arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi         |  6 ++
>  arch/arm64/boot/dts/qcom/sa8775p.dtsi              | 71 ++++++++++++++++++++++
>  3 files changed, 83 insertions(+), 1 deletion(-)
> ---

When do u plan to pick DT patches (2/3 and 3/3) from this series ? I just saw
the PR for 6.16 and i did not see these patches, would like to know what is
pending ?

Regards,
Vikash

