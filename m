Return-Path: <linux-media+bounces-28546-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A997A6B330
	for <lists+linux-media@lfdr.de>; Fri, 21 Mar 2025 04:17:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DBDC4189E9F5
	for <lists+linux-media@lfdr.de>; Fri, 21 Mar 2025 03:17:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 932731E573F;
	Fri, 21 Mar 2025 03:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ahqW/eyc"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 790FAD2FB;
	Fri, 21 Mar 2025 03:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742527011; cv=none; b=MDBHdSuAAoivur5lk3JOuq0mwNfs/NtRG4ezaYg3DyXd9EEDY+n8z97vUKcWf0GlhWGXQ0a2qT2PyHkl6CaPjwJSVj15lhqjapNHkE/t7ZFMML7BpfTyzE6F13vJc4fVmE0L2a2uyhPq/jG6/+Nigzuc20WTOZiI8WVilBpfEls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742527011; c=relaxed/simple;
	bh=26BOuDr8MnFJZ+2boN7vQY9PzW2qtPC+duoZ6R2il8Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=S4D/nyQ/wBnGaW0yYxtbhG6vjwj5AhD1sQyJf2Kipe6oMZdj7KJ5QURJ9j+aItmDAnWIUMg1Z4r0lTzYTiEonXAWmSK14IW28b6dbw1fEOWaiECT46WUgZ7GCAY7PYXineGvyo0a6G27NFshFvNnPhtmAM+0o4M/aJezKrBsmuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ahqW/eyc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52L1WSNV018779;
	Fri, 21 Mar 2025 03:16:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2iiz6+HJD8Um03E21HAUqv4J1CUWro52h+WJUHHJ1uQ=; b=ahqW/eycRARgILh7
	KHxlyujfuIo3rhLHrFDagd6O6DRYVk+pWag3PptKhe12iYf5y/YW3p1Xgbkwly31
	SBv6qaR7E3u/MZabY8ZwMyBK9ATHq1rIdqjR4kC5g8661NejddIUXAM7IbL2WNpY
	ZOKdYL3ffKLtai9VJcwxw6+6o1qLQ0+PqtjKD8opBDJDziIKhGPlZbvUAgfsUlV6
	Xz2y49wfeGJhKVq5ipGwfrMR/u1HihDQeNqzKdH6uCjhG5b6iHHCrrF38EKWRrqQ
	IP9RuAEuBU30xMjT+qWrE8uitwV6n/AeW9qHD0xwBAQWX/sV+ubVOMQrFWKBgPlI
	9xp8Sw==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45g09f58ga-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Mar 2025 03:16:44 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52L3GiEu030067
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Mar 2025 03:16:44 GMT
Received: from [10.216.18.30] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 20 Mar
 2025 20:16:39 -0700
Message-ID: <21d177e5-9b79-ad1d-9803-63c6b7d133ab@quicinc.com>
Date: Fri, 21 Mar 2025 08:46:29 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: sa8775p-ride: enable video
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dikshita Agarwal
	<quic_dikshita@quicinc.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        "Mauro Carvalho Chehab" <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>,
        Dmitry Baryshkov
	<dmitry.baryshkov@oss.qualcomm.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <sumit.garg@oss.qualcomm.com>
References: <20250320-dtbinding-v3-0-2a16fced51d5@quicinc.com>
 <QmxHHC087sYySMBmJH4INHn5KxydFiCpjxuGSwMWq2izyyd5JQByDX7LBzvgK_SccwtrWn2FzazAyF3252YvDg==@protonmail.internalid>
 <20250320-dtbinding-v3-3-2a16fced51d5@quicinc.com>
 <a4134aed-0b6a-463e-828e-326636fbadc3@linaro.org>
Content-Language: en-US
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <a4134aed-0b6a-463e-828e-326636fbadc3@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=BvKdwZX5 c=1 sm=1 tr=0 ts=67dcda1c cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=0JC6n-01gJ6Kf0JWlbYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: nP2-G7tos6WJPdighhhL8zJoIkNbDWNs
X-Proofpoint-GUID: nP2-G7tos6WJPdighhhL8zJoIkNbDWNs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-21_01,2025-03-20_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 clxscore=1015
 priorityscore=1501 mlxscore=0 bulkscore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 phishscore=0
 mlxlogscore=885 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503210021


On 3/21/2025 3:17 AM, Bryan O'Donoghue wrote:
> On 20/03/2025 18:06, Vikash Garodia wrote:
>> +
>> +&iris {
>> +    firmware-name = "qcom/vpu/vpu30_p4_s6.mbn";
>> +
>> +    status = "okay";
>> +};
> 
> You're out of alphanumeric order here.
ACK. Will update.

Regards,
Vikash

