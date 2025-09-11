Return-Path: <linux-media+bounces-42338-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DBF9B53422
	for <lists+linux-media@lfdr.de>; Thu, 11 Sep 2025 15:44:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C2E813ACA74
	for <lists+linux-media@lfdr.de>; Thu, 11 Sep 2025 13:44:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A395338F44;
	Thu, 11 Sep 2025 13:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="GQ44euK9"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3268A29BD89;
	Thu, 11 Sep 2025 13:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757598143; cv=none; b=lJUTrWcBxcY7lBF2xrUa4aqUngX9F4e7gBfjM43KdoID/XIX6q+pdnJX1RpQAdLfGRZd7QdtChcd9miM3YboAEdbgW98xL83hCpwIuTlrm6VL6O+KcuEFqbhCMqP2miXC8F4SrEt6vrfJeNH5/vdDom2oT4cpsOJkjAC+hUlJ/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757598143; c=relaxed/simple;
	bh=7lfEB5M9k7g9zlcwTXBuu3GlYjUA3daeMYjO3Au5LCA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=b9DgEURhImSnhttf+3Ro2uBhRYnt4KUz8OpvPrlHLcKBKGmqB1OvxVWxT7WbU14Tio/AxM5tDiGSOYaPBwmcov/AT9j+6nldMTjIfI0OAooSU/4Zxz6BhkoHxs/jymDxrkrUis1VeTrF8nx8E7U2WzvVh25XjJ+sEOHwPvMUdW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=GQ44euK9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58BBvgn0015855;
	Thu, 11 Sep 2025 13:42:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+3jPGouR0+yQHCgvvvSgKQSzVqyFCvemgzbRuRdMNJ0=; b=GQ44euK92AjhEOSF
	FPHEaOnkRxTh5ztWg12N3PKdA1WbqAdJqCOnxQlaYTb2mjw94lmX4dTb6m48zM8K
	hKeR3JEES5FtDKN973itgUdaj/ywAe4noxuwUZti2axpSa++Zpk9cEQPqEQaKVsh
	1Py7XZY8AIWHNanQacNalYEAVy7uETieSUa/w0dixTX5QM5LnL4TQRUI0qS/ULLV
	TsywEnQS4TCE2MLIQug5fEwArASL5bPfe2VpOBw1LZ2xwWeGX9jjsXliY7sVC/Xo
	AKEDxDdaWdeExdsFmOc6T9+Em74E9jDUZ1JP1Q3IoT4tPMWtrgHn2tGwVc7J/mHr
	3Mx35Q==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490e4m7qdm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Sep 2025 13:42:10 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 58BDgADM012972
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Sep 2025 13:42:10 GMT
Received: from [10.204.66.168] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.24; Thu, 11 Sep
 2025 06:42:04 -0700
Message-ID: <ba4b1276-90cc-4cff-b80b-d4d096fc7bc2@quicinc.com>
Date: Thu, 11 Sep 2025 19:11:56 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: monaco-evk-camera: Add DT overlay
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Nihal Kumar Gupta
	<quic_nihalkum@quicinc.com>
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
References: <20250909114241.840842-1-quic_vikramsa@quicinc.com>
 <20250909114241.840842-4-quic_vikramsa@quicinc.com>
 <w54mpkzk7irjb7m5jiouxhj77czj4ex72oqioaph4o5qhcsay2@qjolctktsu4s>
 <8104bb41-e827-4daa-bc96-9b6678a9d345@quicinc.com>
 <3d26b554-727a-44cb-a1a9-56f49775ba3a@quicinc.com>
 <j475dpcflsibhrim44wjmtbfcfht5jzvptlzrj354oyjee5mit@wmfc6zmrkbfs>
 <0ca4f6bb-b2a2-4f98-a494-bb0507bafcd5@quicinc.com>
 <gd7allvjkgbmqgc6pazq5o5u62tdkrogpf2r43vfkqfsptzybk@66i2def6aumf>
Content-Language: en-US
From: Vikram Sharma <quic_vikramsa@quicinc.com>
In-Reply-To: <gd7allvjkgbmqgc6pazq5o5u62tdkrogpf2r43vfkqfsptzybk@66i2def6aumf>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzOCBTYWx0ZWRfX2Zgis9YBTTFt
 K1t67YnkPjTDaVV39suEDSNu1pNU9qYLe+lYVHXkjh6+MYu0bRX+HXVzDCTSPc9/njomtedLsKB
 LFpAzJ2sCH+hQf2eTjnw5zYdNJ0wEI2NacEIGp4NXVJiXJ+xYGB8No0U+YLkfpRmBkWugs04yUc
 KyNuQmAovsJVVMDLqik3TLWGIEacBJrPDaTh80F94WlcVxujUPwV4pgclL78Ex6TjHKc8NAgvOB
 MwoarqkMshoRzv0uz9/qplIimclH5XopqDtResdbrSWqgQozX1z9h0nvP/Ql9eFLIoXI07PN964
 8BvVaMLp8R7RMfnh25584HPodGMbounrbs0tPyEp0nXN4gz8W6zuWfkdRJf3He6T2CUil51YjNP
 Lf2a1Keb
X-Authority-Analysis: v=2.4 cv=J66q7BnS c=1 sm=1 tr=0 ts=68c2d1b2 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8
 a=Rr1lq44fawr2T7s8aF8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 65Tj0PzSGlbc8boSvUM7i5cMzg7hzD4N
X-Proofpoint-ORIG-GUID: 65Tj0PzSGlbc8boSvUM7i5cMzg7hzD4N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-11_01,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0 phishscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060038



On 9/11/2025 6:33 PM, Dmitry Baryshkov wrote:
> On Thu, Sep 11, 2025 at 06:19:02PM +0530, Nihal Kumar Gupta wrote:
>>
>>
>> On 11-09-2025 15:38, Dmitry Baryshkov wrote:
>>> On Thu, Sep 11, 2025 at 02:49:59PM +0530, Nihal Kumar Gupta wrote:
>>>>
>>>> On 10-09-2025 12:33, Vikram Sharma wrote:
>>>>> On 9/9/2025 7:31 PM, Dmitry Baryshkov wrote:
>>>>>> On Tue, Sep 09, 2025 at 05:12:40PM +0530, Vikram Sharma wrote:
>>>>>>> From: Nihal Kumar Gupta<quic_nihalkum@quicinc.com>
>>>>>>>
>>>>>>> Enable IMX577 sensor using the CCI1 interface on Monaco EVK.
>>>>>>> Camera reset is controlled through an I2C expander,
>>>>>>> and power supply is managed via tlmm GPIO74.
>>>>>> Why is done as an overlay? Is it a seprate mezzanine?
>>>>> It’s not a separate mezzanine; monaco-evk does not come with an attached camera
>>>>> sensor by default.
>>>>> The overlay simply reflects an optional camera sensor attachment (e.g., IMX577
>>>>> on CSIPHY1)
>>>>> That is why camera sensor is configured in monaco-evk-camera.dtso instead of
>>>>> modifying the base monaco-evk.dts.
>>>>> Please suggest and alternative approach if you feel this is not correct
>>>> Dmitry, Do you agree with this justification or you have a follow-up comment?
>>>> Can we post v2 with the same change addressing other comments.
>>> The previous email didn't land to the mailing list, I'm not sure why.
>>>
>>> Anyway:
>>> - What are other options that we might support? Having a single
>>>    monaco-evk-camera overlay means that this is the only configuration
>>>    that we plan to support.
>>>
>>> - It all should have been described in the commit message. Please update
>>>    it for the next revision.
>>
>> Yes, We have planned to support device tree overlay of the IMX577 sensor via CSIPHY1 only.
>> I'll update the commit message in v2
> 
> I'd still suggest monaco-evk-camera-imx577.dtso

ACK, Will address this in next version.

> 

Best Regards,
Vikram


