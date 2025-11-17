Return-Path: <linux-media+bounces-47211-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CC2CDC641C0
	for <lists+linux-media@lfdr.de>; Mon, 17 Nov 2025 13:40:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C24963AFD89
	for <lists+linux-media@lfdr.de>; Mon, 17 Nov 2025 12:38:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6FB7329C79;
	Mon, 17 Nov 2025 12:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CYPf9e42";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O31QMZCu"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EE5D30C629
	for <linux-media@vger.kernel.org>; Mon, 17 Nov 2025 12:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763383074; cv=none; b=uDqnTuvXacKQieNcdyz4DTLSdOqt6g4nsm2cSwgdA49we1+SBqADKFAj/wMB6zyAyAcYwI3VCTTrYxaZfw92p1s7g7qnRdhRP8cE5MUq29EngTVQrHFeZuD3z8pIrEYUC0cfPq5CAVICblHL4tAv/AvzEpa5NlweNyiSiPE2cBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763383074; c=relaxed/simple;
	bh=/5ah1QK2cJKdVp1XH2QjKgHNWqaUxV893AhuHah12E0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R9K8MPfPV52Qf1rjxTbYMGfilEM7EFwEN1cmZB59qkGzGJMV6giLg7vnXC8qMrf8eA3maHFibGlUrFEuV+lq4yQWQ6mUDe046koblptLAM49265MOir9BI+oQHEPvHtlDnFklUPL4Bi+fMEeREBFtRRdYJ91Odsj2MsOlIl1viU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CYPf9e42; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O31QMZCu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AHB3asc3517229
	for <linux-media@vger.kernel.org>; Mon, 17 Nov 2025 12:37:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pJWzE6wvjXG1AV+aIp3wOyeFKxb3rhX/85KvL6y03Cc=; b=CYPf9e42rZzlJawP
	Qp3kqvy3qfQCc+Y52D4WM/zhh09glkeF391ACL2AWapNefwrEKk7UoMK+kJoMbbH
	0LvIIzRmE/gRC7zjE6MaZXehjtZoGiHfMcsUR0glCU+a5P4KnaDgl8yCqpKrxgSG
	TnVr//U6O9hqW1UDSci5nuEjSUrwDkuCNm3/UQZB5UUUGOFt5QN2RjqbYnka90SB
	qh9XDSGra90dJgFwkqwfaoHwPgJY8eKYrg6/vIsxrAiQh2q/XegShtb5qvLngh8k
	b/pk47dF2H0Wc3Y6fv7ssio96UPIw5bt8zEPPhhDBlE1846Q7bYSyj+mdRbH9zae
	vPKI/g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ag2gg88mx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 17 Nov 2025 12:37:51 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ee05927183so1511221cf.0
        for <linux-media@vger.kernel.org>; Mon, 17 Nov 2025 04:37:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763383071; x=1763987871; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pJWzE6wvjXG1AV+aIp3wOyeFKxb3rhX/85KvL6y03Cc=;
        b=O31QMZCuc3MTmsapB7esqEdGdvzIy1g/2o3g/q71MfdxWkKku4apWX3lwNT0S19mQO
         aOMeynaFwt7l9WigPN1RDeQcml9+uYCJNSSSyG9Z+vEpu959alkC17za+M5ptHLFJ+Tj
         8Oq5voXxCAMbh7kX0CDqsmsZ5Pu772qZrrV4bFg2926pDmhq9SMIz2oJvu6kdC8ZWoWL
         nqsAwlDwAo7KYP0d6XNuj34thiqYEt93R/5z1qne96s7p0LIo/e/nMhT4XcIiyQjO2vQ
         R5PP3ourCqPZM86Fw8mZOSenGgPg9quUcIW+lBJ+Kkw8HPE9G8GO3VY6yahUwrz/qlvI
         OmRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763383071; x=1763987871;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pJWzE6wvjXG1AV+aIp3wOyeFKxb3rhX/85KvL6y03Cc=;
        b=s8xda0ph/kon4JmMxCU+ZzFKXN9VZifdD4ow8gemp0nzORTDYWc4Qvd+m/VhpvzApQ
         19tf75qBX9lYjAxzzrrjo7pEZhxRjWES2XyMBw1eKVFUqzxvdTRyNj4M3gSS+F9kUzMB
         aCdR2D5ebJPAK4ovkjjG/+ow+hDQSqB/V2xcsvxK2/he6t9IlQGEvl5OomovLYn8XSRu
         l9sNhuoQbEhM3plwM02GNmlmybNKwm0aY25lSY4DCMJWbxLB1XXUQ7TjLPmlSUVdc2Wr
         KvaiAI6iLmCOLFDga2lPhGdpwQG5ZdvwdzrSZBCLBdcTnHBT8jIz//kyvvnTeF40IZ5d
         GFSw==
X-Forwarded-Encrypted: i=1; AJvYcCVb4OU18v1uK1cK8Qw0Kuh5BA2q4+AogM1kJ7jp42Jmwz+lTLzBq/HYLNiAg7nP/WcwBRnTh6TM3ntQqw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/MNxY+eBp0Fqm2OTrmVR3gcSOcdl7UZL2G4axum3M5XE8ypSk
	2cS+8rSPki3IOgpX556s/B2Olyvhiegp/WiUmClcM8tgEKDm6CodxnOnx10ht9+oaK+sgzui5Eo
	cHqpXsT4vKjOPppKDDV+FEQFT54RcQkZdvTPVhatiZJgDDJlCCgY5HRawbe8ydC0xXQ==
X-Gm-Gg: ASbGncvtFoihYSlE7TdLzv3Q3n8+laV3ursUc8M0yPz7Ctmux5WUYh7ULfI+Xj9jYmP
	7/oIyTKLgr23AI5RbkuLowqqcwKP7Ge8fH7jHtAHzJLLnXn2CWG9xWjP9BQLMJgnIt9RsXw4sri
	iBXukgajEmQWqrEdSxiG3toQKaixvf3KFgQZ0HBL6IN50o3+c8EVH4KKitIk1ypuKpnJGAWaAOX
	ymQO3+3yFj/8Z1GPqy7sy7pXb/VyUjWbFqrFd8rrlBhAiWm4KiI5zUd9n8GiJO1d3iOPAgdBZTJ
	ddCHCeP0VesRJ2udpzN5gKwkduZJfAmRsxWl1wN7/frB6Hwz7EyuHZS9d3oCfIqlZKiQYLKzlxa
	gPa2cHslSAbXUrExS79csqx6MWo8DquimPX/fD10w6w7784PtDeoPyZYk
X-Received: by 2002:ac8:58d1:0:b0:4ee:1f0c:c19d with SMTP id d75a77b69052e-4ee1f0cc6acmr31605031cf.0.1763383070628;
        Mon, 17 Nov 2025 04:37:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGwighRspdkvDuEfxmwg2BdMrC4mdWFT0VtYsAmtd8r1HDT/ZXvRXlEbF7IXcyxlyFAchnefQ==
X-Received: by 2002:ac8:58d1:0:b0:4ee:1f0c:c19d with SMTP id d75a77b69052e-4ee1f0cc6acmr31604651cf.0.1763383069999;
        Mon, 17 Nov 2025 04:37:49 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fa80cb6sm1076756166b.7.2025.11.17.04.37.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Nov 2025 04:37:48 -0800 (PST)
Message-ID: <4b73f64a-1e28-4f25-80d2-3d59575b9da2@oss.qualcomm.com>
Date: Mon, 17 Nov 2025 13:37:45 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/3] arm64: dts: qcom: monaco-evk-camera: Add DT
 overlay
To: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>,
        Vikram Sharma <quic_vikramsa@quicinc.com>, bryan.odonoghue@linaro.org,
        mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        hverkuil-cisco@xs4all.nl, cros-qcom-dts-watchers@chromium.org,
        catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, quic_svankada@quicinc.com,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ravi Shankar <quic_rshankar@quicinc.com>,
        Vishal Verma <quic_vishverm@quicinc.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
References: <20251114064541.446276-1-quic_vikramsa@quicinc.com>
 <20251114064541.446276-4-quic_vikramsa@quicinc.com>
 <a5ae933d-c5d1-4094-b4a1-de52060e0786@oss.qualcomm.com>
 <22350774-20da-42ff-a6c2-02fab121f4b5@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <22350774-20da-42ff-a6c2-02fab121f4b5@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: AlDKUEGx6mSaqGVbQQQnpJSoNfc6vwzK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDEwNyBTYWx0ZWRfXxFP0GQ59BjDM
 LGroKzY0f7mSNTjzIMG4cjxJbHwwNByn+vozBbaX5K+JpuxkzS/b5nc1MW8ylhFP2uPvnY+uilX
 9/HwEY59eldFM9CaBiTb9qQDLQpFxBkCvHXM6Ei7p/Vhjn3TtYzwd8HusGa5XLfz0sc4zYHUrP3
 +hUg+d6dnbRVyGKL2xzQW+vo8k9PGC7aJf6LnpjrZW6aKI+fPu4b/TJ7W1yHBXQn17vBC8TfQzN
 JnGml9CJuU5aCnnzO2biT9DAcffyT+OyISF/9E+QnriCvwgFH1io4Iq04p0QmY02cvrlceuW3cG
 JADTPAgG+4b55RB7MC6ylRDk00NV5VDa3cHK5KPOWIWUpLMVWjAqkSD7lZ9QVeReYqG4LGIduj5
 rNT/8cpzMQqv/5i+Aq4iKIa7InvjLg==
X-Authority-Analysis: v=2.4 cv=Cryys34D c=1 sm=1 tr=0 ts=691b171f cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7e9gifwXs9hXINWudeUA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: AlDKUEGx6mSaqGVbQQQnpJSoNfc6vwzK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_03,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511170107

On 11/15/25 6:53 AM, Nihal Kumar Gupta wrote:
> 
> 
> On 15-11-2025 03:49, Konrad Dybcio wrote:
>>> +&{/} {
>>> +	vreg_cam1_2p8: vreg-cam1-2p8 {
>> Where does this regulator lie physically? Is its presence dependent
>> on the connection of the sensor, is it part of the EVK carrier board,
>> or perhaps something else?
> vreg_cam1_2p8 is a fixed 2.8 V regulator located on the EVK carrier board. 
> It supplies the camera sensor’s AVDD rail and is enabled via GPIO 74, which is controlled by the TLMM block. 

Please keep this definition in the EVK board then. It would let one
reuse it for another consumer

> 
>>
>>> +		compatible = "regulator-fixed";
>>> +		regulator-name = "vreg_cam1_2p8";
>>> +		startup-delay-us = <10000>;
>>> +		enable-active-high;
>>> +		gpio = <&tlmm 74 GPIO_ACTIVE_HIGH>;
>>> +		pinctrl-names = "default";
>>> +		pinctrl-0 = <&cam1_avdd_2v8_en_default>;
>> property-n
>> property-names
>>
>> please
>>
> ACK
> 
>> [...]
>>
>>> +&tlmm {
>>> +	/*
>>> +	 * gpio67, gpio68, gpio69 provide MCLK0, MCLK1, MCLK2 for
>>> +	 * CAM0, CAM1 and CAM2 respectively via the "cam_mclk" function.
>>> +	 * So, here it's MCLK1 pin for instance.
>>> +	 */
>> I don't really see the value in these comments..
>>
>> Vladimir requested you to move the 'description' (meaning the node
>> describing the hardware, not a comment explaining the function of the
>> DT hunk in natural language) to monaco.dtsi too
> I’ve added descriptions to indicate which pins enable which camera MCLK/Regulators. If these aren’t considered useful, I can remove them.

Please do

> Should I need to add hardware descriptions for all GPIOs (gpio67–69 for MCLK and gpio73–75 for regulator enable), even if they are unused?

You're going to need them when you add support for other sensors, so I see
no reason why you'd not want to do it right away

> I have referenced qcs6490-rb3gen2-vision-mezzanine.dtso for the MCLK pin hardware description (cam1_default).
> All TLMM GPIOs mentioned above are muxed pins. As Bryan suggested in v4, these should go into the mezzanine-specific dtso. Do I need to extend this in monaco.dtsi as well?

These mux settings apply to any and all users of the mclk function, there
is nothing specific to this single mezzanine about it

Konrad

