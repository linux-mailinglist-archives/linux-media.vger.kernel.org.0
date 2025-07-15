Return-Path: <linux-media+bounces-37764-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4E36B05666
	for <lists+linux-media@lfdr.de>; Tue, 15 Jul 2025 11:33:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EB5D04E6333
	for <lists+linux-media@lfdr.de>; Tue, 15 Jul 2025 09:32:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C6A62D63FF;
	Tue, 15 Jul 2025 09:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g7TU44qq"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F7BE2D6402
	for <linux-media@vger.kernel.org>; Tue, 15 Jul 2025 09:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752571987; cv=none; b=Eqp11w8b4CiAMlUeuKhHXynu0KI+PSpojNUxeq9gi6/8k0Ud2CtohKYT1JFUNW4LeBpr1i9qOYtxyvB4Iu7qUszomj1cXjrj+gCf7Jjt6H/bxqf3LIUSiuc14ohv/DAli3IG0g7dDY8cA5MuKpoJ0RELU5jQ1lArDKIP9nQrbEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752571987; c=relaxed/simple;
	bh=UmVZaGJsu9p+gSw3gRVYkjWOW1ZiNpKv4kj6EGPUUYU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Wxw46M/KbgTJ2pMirNEd2mxBQwmo+09fMWr5LJ6E+4mRrldoorSU+1wuBE5IOclWdNx5RQeGgpr8URGi1nf72dcdl4UNwrg+ItcaK3BhMxUtQ5vxYM/hhYTuad3MMTmo+YEWCb7sLljxvWAkGH4BVfN1wXerH4PWqhxXtO9aLSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g7TU44qq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56F8kRgQ027427
	for <linux-media@vger.kernel.org>; Tue, 15 Jul 2025 09:33:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZVKYKZI50CRu8kFfLOssIBGcOuWlmDEa2DIvNCnCY7s=; b=g7TU44qqEKoX/E5n
	ZKw1/jZstXtfBQHMJMHbVLubG83iuy6I0tciArG0dzRrmhqtd5iTMIECYqHxJTRQ
	E0jKB0fnVz0DSd+bjwfry8J7clWxezfgy4FwA24Xbm5PPMRmeZt9W+4vMbQ+2rPO
	lLubHRW5bG3WLSTyrw1yiX0N0yBK8yYAz7qVcu248c63jvhiFYTCtfdejJdpRKdl
	9t49INgET1aFb3cC0HodaSR6Nrjhn66WTsftXNipBlUJXExsYt9Bf1vP5Hl66Hts
	uCA8QrYgYtyBlvjLDuIFOnGK8MhjBYh2kOooco14zUgmFTY2w7xp63t2QE3Mby1B
	T0SqdA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47wkrug5xq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 15 Jul 2025 09:33:05 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ab716c33cdso7200171cf.0
        for <linux-media@vger.kernel.org>; Tue, 15 Jul 2025 02:33:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752571984; x=1753176784;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZVKYKZI50CRu8kFfLOssIBGcOuWlmDEa2DIvNCnCY7s=;
        b=BBWT9Kfd2xgvI4U6VCgiPyhRYuLdZ/qmnG34F1b2mggzBoDy2uGmr+wbU9UZcmYBLO
         J4rc/EHleB2E3da0V42pen6UIA9w07uyb7CIiMCsWNW1WPqCwAh0MItdrfDrZKRAkfUY
         fhrKesrhHhxM1OuKijxeOwkDxxR7PHeHSawfv/p6RT1Mtf+qnTkcCr4LNTBDr+1FrwTj
         5G0oJCAXUSaoXr2L3k2LKL/h1+148ec1glgYaMdLEWcpe5nj4BInYDx7ehiFv+j9VMgn
         +BDakOVhOJ760LPjRt497dDyXSfMIlisznLfvzb94EZL4iIpedTPI1O/OFIqN0rGJcKV
         ZOhg==
X-Forwarded-Encrypted: i=1; AJvYcCWzW3kIs7tpM6Jxfcna3n5yxYJYa9QecNa91ueWot/cUrhXjLAoDbvkX9pAwlyKYWv4IbQ5Tlx62GUzsQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwjD2owhLgVmb/nZQ9mBvvQJ/NWlu5seu2PAfcVVRfkIBtGnEa3
	e6Xw0ZsChKsn3gPhJC4ucDfha9pd96X1uvbSPtXWFbsYZKMyWLLACQJA9mHybkIEeVuCdSdYRDi
	0lDLDsa5IUn0tQvSPgRY2Lohplv7ifWwcLlLfIX+I5twumCu83aK2R1hKpiScHlBGvrxTpUM6dg
	==
X-Gm-Gg: ASbGncvETLQTK8123qMs9kxhVl+HPehqYaaY9M2ZceSzzi9UI5fYKpaHioegTc97tP1
	BEh5WPhxkKT/3rVF9XX5CUpQBPh1uiDgWkm5N9CSulwDpM6g4H2Ocaw4EMQkSjz1o51u2/RV2nA
	RXgIpiOe4iVQhxORm7ZwDS8rfE+qwMT+sCb6+7b6HsQkyr32H3RB13GctiSa4j6zaliOUJpWvVE
	/WQ8bO50EE+48SFFznUe3sQEFE15Zp+eZQpIqLxeWD26HoHnp8diBktb6JO1PHvCNtrlahlzUwQ
	8XFZP5PynBgifYy10HqTbW4T7SrdF1pEXQV/+brIRn5vfnVwBdOS/i7x6irNlqtvVVEE5yU2ci3
	mB5qOGJuGnNRNkt31sfsf
X-Received: by 2002:a05:622a:82:b0:4a9:e326:277a with SMTP id d75a77b69052e-4ab86e207f0mr4752191cf.5.1752571983978;
        Tue, 15 Jul 2025 02:33:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGCcr4nANIHsBRbxeeXFSYzXrr7BOuMOwD02ol+PSNYDc+EIBk8wmnfYeAHim0Yt70dnuwwlg==
X-Received: by 2002:a05:622a:82:b0:4a9:e326:277a with SMTP id d75a77b69052e-4ab86e207f0mr4752121cf.5.1752571983473;
        Tue, 15 Jul 2025 02:33:03 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e82652b9sm980622966b.78.2025.07.15.02.33.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Jul 2025 02:33:02 -0700 (PDT)
Message-ID: <427548c0-b0e3-4462-a15e-bd7843f00c7f@oss.qualcomm.com>
Date: Tue, 15 Jul 2025 11:33:00 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] phy: qcom-mipi-csi2: Add a CSI2 MIPI D-PHY driver
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vinod Koul
 <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Bryan O'Donoghue <bod@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250710-x1e-csi2-phy-v1-0-74acbb5b162b@linaro.org>
 <20250710-x1e-csi2-phy-v1-2-74acbb5b162b@linaro.org>
 <11b573d5-ce4d-476c-b94c-216d427cd838@linaro.org>
 <08261aa4-689b-4d6b-bfd2-221c1976d254@linaro.org>
 <a7f64b31-4767-4281-b452-a2bc5351d745@mleia.com>
 <c93624bb-ee7b-45ac-8b53-b5391f11c9c9@linaro.org>
 <eac3a877-a4aa-4789-9013-ab8b6c91e0f3@linaro.org>
 <0a12879f-dc4a-47fb-87a0-ac4b8bcd4d75@linaro.org>
 <53a19b1d-5665-4937-a07c-5dd1fcde06c5@linaro.org>
 <3b760685-97db-46e3-80a3-7fad69ad31cd@oss.qualcomm.com>
 <94b75177-9401-4e0c-966b-5847a29cb6f7@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <94b75177-9401-4e0c-966b-5847a29cb6f7@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 9z7KWJ-BYoDWE_CDSuogLNKYyMkVbYcx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDA4NSBTYWx0ZWRfX84d2Corzh8t6
 Ha8tkuj+jVSJmbD+qMkSTiB9UXxLQtFoDZ/T1NSbPMjrZkLWFln5G59owA450bamt0ESaqci7sP
 8BbOa8YCtL/Tx1KlbX/+Cr2sdGSRZs9oWcLIvUES8BtrY1ccjzgZoyhqYDvcRWzdt6D+cCfq485
 rv+cN8l12cS8q0iC2pQeVOhidghQCcIrej8l+V8Ko9HP0GrTe1/cyCnNTBnVcUCjSl22OHScOF4
 FxonSl/SnTxJfAxMEksqX772hPZQTjPhSIqI7MbyVND0MxkseyKxv0Y36+agKU0m6EuCspHHo54
 SHn4TZb4l7YvZg2okbDS0hZf1xI4kMM3q01kllwkZSnP/26pWsygSzhUvVeGNcjbUARUUnssc+y
 R+Ee05ZmCdNHsNj1a1Su7RFqqBLMHmcCVJJS5IggA9lLZrDLHsG5YdsaDI29guwLuk6a7zqU
X-Authority-Analysis: v=2.4 cv=WqUrMcfv c=1 sm=1 tr=0 ts=68762051 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=93KYx9Pn6tzsntpFjOoA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: 9z7KWJ-BYoDWE_CDSuogLNKYyMkVbYcx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-15_01,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 mlxscore=0 mlxlogscore=999 bulkscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507150085

On 7/15/25 11:20 AM, Vladimir Zapolskiy wrote:
> On 7/15/25 12:01, Konrad Dybcio wrote:
>> On 7/15/25 8:35 AM, Vladimir Zapolskiy wrote:
>>> On 7/15/25 03:13, Bryan O'Donoghue wrote:
>>>> On 14/07/2025 16:30, Vladimir Zapolskiy wrote:
>>>>>>
>>>>>> I think that is genuinely something we should handle in camss-csid.c
>>>>>> maybe with some meta-data inside of the ports/endpoints..
>>>>>>
>>>>>
>>>>> This is a CSIPHY property, a CSIPHY hardware configuration and a wiring
>>>>> of sensors to a CSIPHY. Where is the relation to CSID here? There is no.
>>>>
>>>> All the PHY really needs to know is the # of lanes in aggregate, which
>>>> physical lanes to map to which logical lanes and the pixel clock.
>>>>
>>>> We should add additional support to the Kernel's D-PHY API parameters
>>>> mechanism to support that physical-to-logical mapping but, that's not
>>>> required for this series or for any currently know upstream user of CAMSS.
>>>>
>>>>> Please share at least a device tree node description, which supports
>>>>> a connection of two sensors to a single CSIPHY, like it shall be done
>>>>> expectedly.
>>>> &camss {
>>>>        port@0 {
>>>>            csiphy0_lanes01_ep: endpoint0 {
>>>>                data-lanes = <0 1>;
>>>>                remote-endpoint = <&sensor0_ep>;
>>>>            };
>>>>
>>>>            csiphy0_lanes23_ep: endpoint0 {
>>>>                data-lanes = <2 3>;
>>>>                remote-endpoint = <&sensor1_ep>;
>>>>            };
>>>>         };
>>>> };
>>>
>>> Don't you understand that this is broken?.. That's no good.
>>>
>>> Please listen and reread the messages given to you above, your proposed
>>> "solution" does not support by design a valid hardware setup of two
>>> sensors connected to the same CSIPHY.
>>>
>>> I would propose to stop force pushing an uncorrectable dt scheme, it
>>> makes no sense.
>>
>> If all you're asking for is an ability to grab an of_graph reference
>> from the camss (v4l2) driver, you can simply do something along the
>> lines of of_graph_get_remote_port(phy->dev->of_node)
>>
> 
> It's not about the driver specifics, my comment is about a proper
> hardware description in dts notation, please see the device tree node
> names.

I'm a little lost on what you're trying to argue for..

I could make out:

1. "the phy should be a multimedia device"
2. "There is no ports at all, which makes the device tree node unusable,
  since you can not provide a way to connect any sensors to the phy."

I don't really understand #1.. maybe that could be the case if the PHY
has a multitude of tunables (which I don't know if it does, but wouldn't
be exactly surprised if it did) that may be usecase/pipeline-specific

As for #2, I do think it makes sense to connect the sensors to the PHY,
as that's a representation of electrical signals travelling from the
producer to the consumer (plus the data passed in e.g. data-lanes is
directly related to the PHY and necessarily consumed by its driver)

Konrad 

