Return-Path: <linux-media+bounces-42617-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C8A15B594D9
	for <lists+linux-media@lfdr.de>; Tue, 16 Sep 2025 13:11:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 093403B6D06
	for <lists+linux-media@lfdr.de>; Tue, 16 Sep 2025 11:11:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DD3A2D3228;
	Tue, 16 Sep 2025 11:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ERQxo6t2"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 369562D23AD
	for <linux-media@vger.kernel.org>; Tue, 16 Sep 2025 11:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758021101; cv=none; b=dYg9MCmRZzSeG2iGzPggvbhMFqZMYuOvwe6QmkifgmuF2gTnHM7LgbcecXNHwh8S45Pjy7SNHQH1zfmfCY/CViUczbMhPnnaaDFOn3MI1sVMDwtLiVJCM7m/mN1XOrJesdrQQKEg7H0/Z1ciYqwBHJZCUTUmTzCLV/QKe7Tl2+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758021101; c=relaxed/simple;
	bh=275oPonI9MjWeJkyrUhmar7DMWxX8YBm5z0LrGXMLuE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m2ywa08F3YkIJKPEhsLEfhTwDVgtSd7E35hWiVvQ9EEbkvl2tmAhYePdjsCSUEthq6NW6hJBP5RRarWpQLN9UL34bR38HsTDbtzi4TpY/zkzp/IhUv5LVG6dK6ox88DLXAuA6NWV7lvSGwlGmeZfmpccYkpWVxJB6Sp0a0mKP3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ERQxo6t2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58G9tmBf005497
	for <linux-media@vger.kernel.org>; Tue, 16 Sep 2025 11:11:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OIclFIP+LOqTqDxbmvs6AySAEMGiS2FOLi7+K6YMV/0=; b=ERQxo6t2OMvGWd2C
	Np11Rzcvp7p8epeQb2kAN3KDNiQcU+WtMF0pYiEIoeUJQWR4eZDHsqLroLzKitqy
	8Jtu7m3399Fq6HXoUXvQi4SiaeFTVVedoI2BpFn0tjCKlwOePfX0LUmAqDdx5knp
	k03qlq+oClSrMoogIUnKYu7ElFtG3C342E7xw2vGbdKKB3OQ3MU9AZBR1Xtev5eB
	v7Nfg1Nf6WPlYxrtNGr5cWETshzlMsM8yHDcVQLJzQWjbqiecuXVUPiBuqlg4SPG
	0A0Vw/ls/BkS4I15igj39/q9rXLNxBNOcqNHMOdsp8avn2vB6hVHIIHAY6gB+32G
	e429/A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4950u58jhf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 16 Sep 2025 11:11:39 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b822016cd2so1057321cf.1
        for <linux-media@vger.kernel.org>; Tue, 16 Sep 2025 04:11:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758021098; x=1758625898;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OIclFIP+LOqTqDxbmvs6AySAEMGiS2FOLi7+K6YMV/0=;
        b=Lna9xoU1uKgxKznN3sri2AyRZj0S1NOkufB+8+fW1Bt6CdVUyv3Uzbk0wXXFzwMjAB
         l0E9Gpkq1NPyBMH30uR+ZnM9jQvNxxu1EkyDJ7PCRckGYLfLJB8ioqSwQwntUpCvv9My
         afikpk9V6fr8Hwg/Pch9bUZdjhC7bErhOTd6JVEBf0VWJr/xLTcH2A7WZW71gLB0HnPj
         741L3DASDwBGYkCmrfh3pRG1gMN4PRHWYuNb125ypgLoBQLcflJ8InxsXbzf2VaONtqs
         qVB//C+2tocJ26AArBqG07/n6Wghy77HnXg4VKmUznuDV1dEZ55cJkmn3/Cxc5SM+CXZ
         tnJQ==
X-Forwarded-Encrypted: i=1; AJvYcCWHb/AUa+Qqx8lxnQT8xc2jIsmhknnK81FtFohitnnFRpMJoVdXWENGj7T8sNSx4pUEpiQugZDQT1KEjA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzz7AVOV3wl0CgikmeB3fIMJBxsqUdv6ONjZD+VI0Jz1BvuGZs3
	cIYEzuKeOk5gAFpd8Ud32UsKLqVouBMQKg2/ypSTGiAg60K/ymL+WVwqwCAyhWSKSYUXB0HMskn
	VyB9m8zXUpPTWvID3Xk5tgdXbe1FKRYFH/rsmk+hpQ4d1ctOOKCUYISXvTQKtUrBbmw==
X-Gm-Gg: ASbGncvCyzhvYMad2svr8C+yS1qY/RiEcczujjdH2Ov4r5BaMg7HsU3QHJFkMaxZ+0p
	Sy3QWEtwxx6vbybfOCyFn3dKI6bcIZVJ3SvdeN2DNET5xKOtBc8gw+0d9qMDPiy/z0OvY0PwzHV
	G/aqwLY3gQq2tZxLqrBqjgVqb8Jlhp6U0IVYaiYI8yUEx/EWI0ql+S8UhWXhmc4+1NxF1Ls5tG+
	H3vtUNyAEw27PdFaotxgR6mPRvoEsDqsXtu70J6G7a8kC16hfZ/9vlQSRlTouqjejcW1Sn3SteU
	++NLmoILES6avrsYQiq2FduwTJvrU5R2Sq2Q0a+TJY7IWU5l6FVw+P8EgmcDxmjHd0n8reDfbQI
	YjeiRicWo6NUMOnfAZFkIeA==
X-Received: by 2002:ac8:5902:0:b0:4a9:9695:64c0 with SMTP id d75a77b69052e-4b77d1158c7mr127005481cf.8.1758021097865;
        Tue, 16 Sep 2025 04:11:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGnXuilj96k6BuqcLnJZYaYn30Rx4rGcsXCSnzBEldqk8rQYINLpEqXJPXep1f3KK1X9KhUTw==
X-Received: by 2002:ac8:5902:0:b0:4a9:9695:64c0 with SMTP id d75a77b69052e-4b77d1158c7mr127005221cf.8.1758021097349;
        Tue, 16 Sep 2025 04:11:37 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-62f416db508sm3834982a12.32.2025.09.16.04.11.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Sep 2025 04:11:36 -0700 (PDT)
Message-ID: <49d6c554-e6ed-4c86-8946-be2cdba659d0@oss.qualcomm.com>
Date: Tue, 16 Sep 2025 13:11:34 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: i2c: qcom-cci: Document qcs8300
 compatible
To: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>,
        Rob Herring <robh@kernel.org>,
        Vikram Sharma <quic_vikramsa@quicinc.com>
Cc: vladimir.zapolskiy@linaro.org, bryan.odonoghue@linaro.org,
        mchehab@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, hverkuil-cisco@xs4all.nl,
        cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com,
        will@kernel.org, linux-arm-kernel@lists.infradead.org,
        quic_svankada@quicinc.com, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Ravi Shankar <quic_rshankar@quicinc.com>
References: <20250912141134.2799078-1-quic_vikramsa@quicinc.com>
 <20250912141134.2799078-2-quic_vikramsa@quicinc.com>
 <20250916024858.GA3574831-robh@kernel.org>
 <373bbb78-2b0c-446c-be97-53b82edeed64@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <373bbb78-2b0c-446c-be97-53b82edeed64@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: dkUSqXlkVxA4uafY1UKwKf7vpcWG4wlX
X-Proofpoint-ORIG-GUID: dkUSqXlkVxA4uafY1UKwKf7vpcWG4wlX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAzMSBTYWx0ZWRfX5R5usR7Eu41X
 4RVrMUG7Yc8lTq+7Um/FvKGlg7DPFMVnT9QST1Dju/YWoHU+dzNYEB6ETgOaUTrFau2fXLnZth5
 lbUXPqfAyejeE9q06zm/rTn+fovmPH9c6dKrpEhGin9PAa8jKRzNjcNj9HTq1tCqnJkG44pn3Rm
 bSQK6fmczUA5xGei4Ww1eAyz36Kb6+hpqYCoT8Uep36ZrQcRklUa5feBFLOH+/MWtsfHWUpfvK1
 7DpvwTyvDZQOx8QisHH7MXkm905YmGM3mkAzHrk763jdEJPbMgUU4w3u0bsBIm/MsLrBXzGW0/U
 230b0prY8NvP1K/YgALrr2WuDPfGDE7sD+4DrKgksVYR8dE268jYROtwPsxg8+MIQ0u5stTDutZ
 ZSVIV/bK
X-Authority-Analysis: v=2.4 cv=JvzxrN4C c=1 sm=1 tr=0 ts=68c945eb cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=-IwCPt7gIHNx5Q8nY1kA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_02,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 spamscore=0 adultscore=0 malwarescore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509130031

On 9/16/25 1:07 PM, Nihal Kumar Gupta wrote:
> 
> 
> On 16-09-2025 08:18, Rob Herring wrote:
>> On Fri, Sep 12, 2025 at 07:41:32PM +0530, Vikram Sharma wrote:
>>> From: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
>>>
>>> Add device tree bindings for the CCI controller on the
>>> Qualcomm QCS8300 SoC.
>>> Introduce the "qcom,qcs8300-cci" compatible string.
>> Wrap commit messages at 72 chars. And explain how it's the same or 
>> different from existing SoCs in the commit message. Don't explain the 
>> diff. We can read that ourselves.
>>
> 
> SA8775P(Lemans) has 4 CCIs, while QCS8300 (Monaco) has 3 CCI, with the 
> only difference being the GPIOs used for SDA/SCL pins.
> 
> Currently, the CCI driver probe happens through the "qcom,msm8996-cci" 
> compatible string. Could we use the existing SA8775P compatible string
> "qcom,sa8775p-cci" or we should remove it? 
> 
> Please advise on the preferred approach for upstream compliance.

Try:

"""
The three instances of CCI found on the QCS8300 are functionally
the same as on a number of existing Qualcomm SoCs.

Introduce a new SoC-specific compatible, with a common fallback.
"""

Konrad

