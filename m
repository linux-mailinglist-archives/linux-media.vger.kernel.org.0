Return-Path: <linux-media+bounces-42334-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AA19DB532B5
	for <lists+linux-media@lfdr.de>; Thu, 11 Sep 2025 14:49:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C37431C8829C
	for <lists+linux-media@lfdr.de>; Thu, 11 Sep 2025 12:50:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80547322A34;
	Thu, 11 Sep 2025 12:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="OPczHEo/"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27C0E15746E;
	Thu, 11 Sep 2025 12:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757594970; cv=none; b=PlIclExB3bI0J5KUYoBhYIVdOQK2fKXkTPkJrYxtImbsH7hg2+auF0sV4LVBOKYj6rGGPqbI5xIgy0hM9B2Qekq10qabu/HqzAjZZdyl/Ate21km12NmcEPqb0hCAT5ilG8mXoy0QpwKZfKIEfjIUjeZF+0fUQgrXfgAkKYPf5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757594970; c=relaxed/simple;
	bh=95VGmn5zYkdSFvwiFR9CCNoXOXQuzw0/aWLYKuW80lw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=e54Ss4lGmC3K4dPuujn9/Q7lM8Aco1XDc6EMKgv+a1UYIXAXQRsfEHgm4fVX5GR012EPlR+IGW0u8sXQg519LhHNp/6pFcytRC5riWtNa7IWQoctDrlqh4AQOw3kA9wec8vlL4pka/f52fCdB1j8k0+v8fAb3oL8Km47UA8Je2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=OPczHEo/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58BBQnrZ026440;
	Thu, 11 Sep 2025 12:49:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o1CjqlXhvL+dqcsZqbFvvfk8Xta9TV6JWB9PtbZ0BjE=; b=OPczHEo/9jaGv9CX
	IdGQHF71IePA1SoA9c2Jjy7IWzLcusSfCQNqqhJEONEs0erQ5J4D/cczOZujZZTM
	M8TFfRibu0oVcs+hEQinP/RAjFxHwE6AKYqnTHzPc1qyWCmSW0H88zbQa9k37Lqd
	Emj7RCzGqgIIpJSnQ15NTYNR5eoG+0dOLd0GKaToWXIuYorpKh7zjU30rwe6AxhC
	DcOkwRh49/xkzRqzBvvJ0nprE36pXdp8R5o5NXIapodNguX7Dr0v5PA+gBKshInm
	6VhVqZTXSECoh1HB1GMTHomfBiKtj3UXmovCHr9n3WPfxdRudlYa6AU6N7PxV6HD
	XE3nLQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490cj0ykxt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Sep 2025 12:49:19 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 58BCnHr8009491
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Sep 2025 12:49:17 GMT
Received: from [10.206.103.106] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.24; Thu, 11 Sep
 2025 05:49:11 -0700
Message-ID: <0ca4f6bb-b2a2-4f98-a494-bb0507bafcd5@quicinc.com>
Date: Thu, 11 Sep 2025 18:19:02 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: monaco-evk-camera: Add DT overlay
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
CC: Vikram Sharma <quic_vikramsa@quicinc.com>, <bryan.odonoghue@linaro.org>,
        <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <hverkuil-cisco@xs4all.nl>,
        <cros-qcom-dts-watchers@chromium.org>, <catalin.marinas@arm.com>,
        <will@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <quic_svankada@quicinc.com>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Ravi Shankar
	<quic_rshankar@quicinc.com>,
        Vishal Verma <quic_vishverm@quicinc.com>
References: <20250909114241.840842-1-quic_vikramsa@quicinc.com>
 <20250909114241.840842-4-quic_vikramsa@quicinc.com>
 <w54mpkzk7irjb7m5jiouxhj77czj4ex72oqioaph4o5qhcsay2@qjolctktsu4s>
 <8104bb41-e827-4daa-bc96-9b6678a9d345@quicinc.com>
 <3d26b554-727a-44cb-a1a9-56f49775ba3a@quicinc.com>
 <j475dpcflsibhrim44wjmtbfcfht5jzvptlzrj354oyjee5mit@wmfc6zmrkbfs>
Content-Language: en-US
From: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
In-Reply-To: <j475dpcflsibhrim44wjmtbfcfht5jzvptlzrj354oyjee5mit@wmfc6zmrkbfs>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: DnpLQNfpcOq7b1_m4H8RFmoDZtxR2qx6
X-Proofpoint-GUID: DnpLQNfpcOq7b1_m4H8RFmoDZtxR2qx6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAyNCBTYWx0ZWRfX15Lt/VU2vMEm
 QTxoNQx6IOx0kCqzgsv0JVD+mSxb5/G34E2gcuu01cw8dyqhpgYmxVvTWxOiwsWKoWGkm5bvr+D
 sIMYxrgn8VQlfHCtYksLf5Eo9Yn88kUJAIlnsG2TzakfmWeL9AebUI+Qj74RKS0Ex6b4ErcWwuT
 8KA9FKKwUNSEbn90zZvjfIQbAuF/oC24gDzxU8OE2Vl0al/GSWrB/aGnpCk70K+29/Y4SKbiJ+a
 esQtoxqI/up9PEPywcrDL8iR4Br+HjJc8DPpO11VgIdFTzLIC3duD0JcKAnQdK3WZrn1sAe9bXL
 /sSpuFAwUocLMUrASt3WGVMW418aWVgbNedBNpZqRGn6f4DXcI47ja97T1tiCQcFYIwqFRdIWP9
 wDU/1Ugn
X-Authority-Analysis: v=2.4 cv=QeFmvtbv c=1 sm=1 tr=0 ts=68c2c54f cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8
 a=5w7gkbzRxSBdikr_-JgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 spamscore=0 impostorscore=0
 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509060024



On 11-09-2025 15:38, Dmitry Baryshkov wrote:
> On Thu, Sep 11, 2025 at 02:49:59PM +0530, Nihal Kumar Gupta wrote:
>>
>> On 10-09-2025 12:33, Vikram Sharma wrote:
>>> On 9/9/2025 7:31 PM, Dmitry Baryshkov wrote:
>>>> On Tue, Sep 09, 2025 at 05:12:40PM +0530, Vikram Sharma wrote:
>>>>> From: Nihal Kumar Gupta<quic_nihalkum@quicinc.com>
>>>>>
>>>>> Enable IMX577 sensor using the CCI1 interface on Monaco EVK.
>>>>> Camera reset is controlled through an I2C expander,
>>>>> and power supply is managed via tlmm GPIO74.
>>>> Why is done as an overlay? Is it a seprate mezzanine?
>>> It’s not a separate mezzanine; monaco-evk does not come with an attached camera 
>>> sensor by default.
>>> The overlay simply reflects an optional camera sensor attachment (e.g., IMX577 
>>> on CSIPHY1)
>>> That is why camera sensor is configured in monaco-evk-camera.dtso instead of 
>>> modifying the base monaco-evk.dts.
>>> Please suggest and alternative approach if you feel this is not correct
>> Dmitry, Do you agree with this justification or you have a follow-up comment?
>> Can we post v2 with the same change addressing other comments.
> The previous email didn't land to the mailing list, I'm not sure why.
> 
> Anyway:
> - What are other options that we might support? Having a single
>   monaco-evk-camera overlay means that this is the only configuration
>   that we plan to support.
> 
> - It all should have been described in the commit message. Please update
>   it for the next revision.

Yes, We have planned to support device tree overlay of the IMX577 sensor via CSIPHY1 only.
I'll update the commit message in v2

Regards,
Nihal Kumar Gupta

