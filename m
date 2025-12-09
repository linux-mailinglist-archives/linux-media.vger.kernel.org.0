Return-Path: <linux-media+bounces-48454-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B1B89CAF4BB
	for <lists+linux-media@lfdr.de>; Tue, 09 Dec 2025 09:27:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2A435300B36B
	for <lists+linux-media@lfdr.de>; Tue,  9 Dec 2025 08:27:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BCC32BDC34;
	Tue,  9 Dec 2025 08:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="P5glqkAI"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 308E0240604;
	Tue,  9 Dec 2025 08:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765268871; cv=none; b=BwclUjJDW4S5vctV3SY37w/xmkVsw2/7ed3c1AkQ7iZzfT/bz7CEDwJ9vPMuXXHQ42DkzDEALJLu8BSrDjVol6Hvutu+YbC6dIg1e5v9GP8+cMwu347sIUlARlSL0DBaA/EUWQMNREHqIleAn2+qNY0JHLGaM1nEBQ0aDuPfo/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765268871; c=relaxed/simple;
	bh=4+jeSFsHqTQ2cBtOp4Kcqu/K2dezNdXT5O673RnPFTw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=tL8mbIfFfILy01kgsDiGCo1JY2tW5MomnVAPbd7CnMUgRZAFmPG0sU0jG3ddEazIX9nbg1i8S/Te1CodogIxMafBm2o9T1KjakxSxWFY1hkM07r1n938l6LjfTsm6Eo035358H8yuDdPadPntF58FvBdo+pIbXxFLpJKUnQil5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=P5glqkAI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B8NXuYW1501040;
	Tue, 9 Dec 2025 08:27:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LAa1zHygYImSg3g7bPVdhgj3LXGjsfll+Hb4Jpkf0+w=; b=P5glqkAIed2gs8CT
	ZWgMSO5/9EVLqLGxIKtVEUoEW2jzTp8+q8lPBCdos8bWQ1r4Uh11sT2ulwuqJQqt
	G8vlYEqAwa0hSpBYdRU795KS/qFZGDEFJlqtrU1imTOgOGjw3vlEHAW7qVzVt90O
	6em3YG3HIKPBqe1YOAqX4YaIoJyRsJa0oBUZ7dlBOokDKd/8mlgTQJlCsMgzPW8q
	opB1GjDFsRVHo6dwDlvpRZDGZJu+Pi6XmEWLM88ahTcCsHpls/MBtokHSYEu9yif
	64nN/DHfu1iBNHjkLa8uv9PPCYC1qqzmd/XRp0A1f+21Ah8Q0m2T4gWQcnd80/Kq
	rqsAqA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ax57r9tqt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Dec 2025 08:27:40 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5B98ReRv011604
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 9 Dec 2025 08:27:40 GMT
Received: from [10.206.103.106] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 9 Dec
 2025 00:27:33 -0800
Message-ID: <66d4d882-7cb3-4c8b-ba5d-42d6d83b0b59@quicinc.com>
Date: Tue, 9 Dec 2025 13:57:25 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/3] arm64: dts: qcom: qcs8300: Add CCI definitions
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Vikram Sharma
	<quic_vikramsa@quicinc.com>
CC: <bryan.odonoghue@linaro.org>, <mchehab@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <hverkuil-cisco@xs4all.nl>,
        <cros-qcom-dts-watchers@chromium.org>, <catalin.marinas@arm.com>,
        <will@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <quic_svankada@quicinc.com>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Ravi Shankar <quic_rshankar@quicinc.com>,
        Vishal Verma <quic_vishverm@quicinc.com>
References: <DS0PR02MB11311CE33DFFE0739BE747590E3D8A@DS0PR02MB11311.namprd02.prod.outlook.com>
 <d49920eb-0b4e-4042-b0c6-28d1ba348ddc@quicinc.com>
 <3f1dbf91-f967-44dc-bb21-25fdcbbc8db2@quicinc.com>
 <6e6ecdbf-f3cb-4d7e-a679-4640d6603ac8@oss.qualcomm.com>
Content-Language: en-US
From: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
In-Reply-To: <6e6ecdbf-f3cb-4d7e-a679-4640d6603ac8@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=OPQqHCaB c=1 sm=1 tr=0 ts=6937dd7d cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=w19UCUruwjfvYCW3GzQA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA5MDA2MCBTYWx0ZWRfX9KCODUt/4GKK
 ArkOCbL3iw1H/OVe3d+R8sapAenYPPVccb4RughYaJwwJtRm0aU4cwfwg4dAkQDbLx3oOkAFOeM
 biWFOMdchFXZKOWy9s8o3cFkSur+Uqy4hGhHHlwMfkRIyz0OtKpnBrZnDbJRLznP8IUtRLf5UZl
 wpuPN1JYogpRWbY+gQvbjGPan6FCUyQj0aZfyj8D3L+E4g8xiy4CrYdKbtdX8eg6eLRTVxWZEDE
 s7aFEk1Cv/lJk/Bi2e2EX1yAriDlTEj0VODgqweh0BLbgAY4gWo3QEjM3wT2J0R/po5EavGfpE7
 NjoM7Riw44iVb29xSPVXAXiTlXaHIUYAsl9P7X4AbH/9KX7G8FVeAR7t8jZHgw/wZ8lwwV806xr
 VV1VZ9FxFWJk48gOenit3cpY0wKHmQ==
X-Proofpoint-ORIG-GUID: bNqfKTiMPgtJiVUPlyScdNVr9cG8K71i
X-Proofpoint-GUID: bNqfKTiMPgtJiVUPlyScdNVr9cG8K71i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_01,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 priorityscore=1501 adultscore=0 bulkscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512090060



On 05-12-2025 17:28, Konrad Dybcio wrote:
>> In monaco-evk.dts (Board level):
>> &tlmm {
>>     cam0_avdd_2v8_en_default: cam0-avdd-2v8-en-state {
>>         pins = "gpio73";
>>         function = "gpio";
>>         drive-strength = <2>;
>>         bias-disable;
>>     };
> That was my entire points, thanks

ACK. I will proceed with the example snippet.

As Vladimir suggested, the MCLK pad functions in this commit are unrelated to CCI, so I will split them into a separate commit.
GPIOs for enabling regulators are board-specific and will be moved to the EVK .dts in another commit.
Let me know if you see any ambiguity.

-- 
Regards,
Nihal Kumar Gupta


