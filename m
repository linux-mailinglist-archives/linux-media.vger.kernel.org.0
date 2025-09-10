Return-Path: <linux-media+bounces-42209-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CE66B516D5
	for <lists+linux-media@lfdr.de>; Wed, 10 Sep 2025 14:26:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 096197B1959
	for <lists+linux-media@lfdr.de>; Wed, 10 Sep 2025 12:24:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78872288538;
	Wed, 10 Sep 2025 12:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YGSMO8cs"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 432713191CE
	for <linux-media@vger.kernel.org>; Wed, 10 Sep 2025 12:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757507139; cv=none; b=jEEsxlIVmHQarACwV92aSUut7CBrNoKDx7C+3iYEwePyab0/lwgdSg/5dWmuSe0IX0r9MdnATsFZ3XLK4xN44KV9CaV0WanRvpNsvQpT8opEe2rFnEFxrSZ0yl+nptUoobw2kqR8S+xOxYMCseH+yrwqFuoWJLuG2+SQxFRSpwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757507139; c=relaxed/simple;
	bh=I939lIKXR/P65iimR2JYCNDGh3a24yNGf+7dxgbMuWQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XIJw4Vcqjc6YKsksZ+XnvA+rw3JkEIl9b0Hkk/b/0QcGtAI84zUyMI8bFTaH5DQCjkxU1COd7PJ8TfDCsOcKibDOfcS/esuLnP6odLKALl2pTE7bMUnZIUIYolHNpHffwK9Zg3wpYYreX2glXbFY28tCy0LyDPQxXq2H1TjmmxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YGSMO8cs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58AAFdFf000528
	for <linux-media@vger.kernel.org>; Wed, 10 Sep 2025 12:25:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xhCtGHB0DkBobVlK7MICfsktcm5yyzHhvJCYtnxxZbw=; b=YGSMO8cs/IX7VOGl
	qYARYWX5lqqlY6xLJWPFYVq6YnEyTXTsbJzzhU8t0lUDFh5WbZb09BEZzKi2NMvw
	pdw9VOhyBIYEZNu2ZuY5Cx2E+REObTSN3O6KUpW8qy/YeUk1LWX7dQhK6IJXuuoR
	N0HLJVkN9lNf5aI1SlZrhL/SPNu0OUeKDPfmEgYkhCarS2eD322RQdHD741xiRWJ
	4ci3fPWRl918MOQuDdI0rGpGUTf3ZWrEXgtTsawcA+gGbZXxrpQezzOLdsvywWDk
	DhFseYpyh9HUOYx2U+GdASX35h4aMfA7F6Wap4VNeS620R3+vh6X0vFO4/QRoIqZ
	JcdkCQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490e4m3nsd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 10 Sep 2025 12:25:36 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8019bd7af43so191632085a.3
        for <linux-media@vger.kernel.org>; Wed, 10 Sep 2025 05:25:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757507135; x=1758111935;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xhCtGHB0DkBobVlK7MICfsktcm5yyzHhvJCYtnxxZbw=;
        b=iSqPwKZwMHMhRK/a5uOcXX15hDDJZRklKolbVv1b0PZs2eTA864aKR+VeYXA4TIFfQ
         2NmxCBuGp+EbH99u/ONGI+Q4jmTX81YZmsYzQMGch8GRkIw/njpul7zUokkNU7Yq9gIY
         bBD+EKV9gbYo2q2ecsX/AVTsqhp4ZAM23rKxGdga6mdNYb5DH1wdkBrsVDNW6nx5QQ9C
         xaWv4JQ1ebLccba+Oa6v/RZQjgORLXAXcsZcvrA5vbioEW7sWDSgWIXAzT9dQunA9ZL4
         b5flCehh9Ue/UaH1u0o6/9KmR8qntycBYODt8yNVuN4XwPB1NXYHTYMB4H831GLWJqGO
         lgcw==
X-Forwarded-Encrypted: i=1; AJvYcCUy1H5QURqJeJ13IdkfEfGTQekV8awjrT1sgXA8Z0R3G0JFH/jYyv5x3I2WnN7ns1BI8yc+oUKx2x+htA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwT2AVbANskklav7MAVi8N0jzuZxSViYJwNnqYDvYQivQt/Aart
	h/yS9RoTswKNZYedcpMIKYDc/K4zLv/99Wzz0MQmZgPUcxxP2KkrhtHx3xXRxAOoPhwT21nRbuA
	GL2ozJQ/JPfnhnrtR8HkVYBo39hQTBg87Bwu9D60itx6IDAnAgwKzr+g6uiXvIyH8Iw==
X-Gm-Gg: ASbGnct1raN1hy1CHRoeZwVcar5Qdhc9gQrL9lDm5NPf1tA7hxcEY5ilQfC6lY7ZxAM
	socwPSpK+vGGz/nQxogquZsvlaRlOwuNhgUUJA+NatJiKMb4BhVG5eqYxeEFgXw2fsACT3pgR9X
	9O1EibTTTtnYvmwOqYxpg7M+uvAAbL1pzEtfWOSaVUeOLhwZkXtiDh2fyLNJWwvwnQqWKA7qr9D
	3i7SNHDLpAHFAPa7OD4sxX4P5/NgFklk8fSST1+lzEG2LebCl2b701kzvwieTL4vGYBVsgMiRSG
	ET4q1pI2M6m1plLxnEEXBTFQdb+Q9P3quJdt6jKTmq9i5albf4tV/cE3hB6W456STMwZLXiUdgV
	N/ELwnmDUdufbFTU3izc52A==
X-Received: by 2002:a05:622a:190f:b0:4b5:f4c0:5fd with SMTP id d75a77b69052e-4b5f8531717mr107906281cf.8.1757507134753;
        Wed, 10 Sep 2025 05:25:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE27NK31Io4E+jeD+4VIvXuMgeiu+Md8ls94UaGm36iHEowM6oGp7UQf+Mw0cZqlAH0Hlx3cQ==
X-Received: by 2002:a05:622a:190f:b0:4b5:f4c0:5fd with SMTP id d75a77b69052e-4b5f8531717mr107905721cf.8.1757507134155;
        Wed, 10 Sep 2025 05:25:34 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b078334b0desm158265166b.66.2025.09.10.05.25.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Sep 2025 05:25:33 -0700 (PDT)
Message-ID: <2a7bd0cd-a6c4-47c3-a6ca-f9d94c9b65ec@oss.qualcomm.com>
Date: Wed, 10 Sep 2025 14:25:30 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3.1] media: dt-bindings: Add qcom,qcs8300-camss
 compatible
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Vikram Sharma <quic_vikramsa@quicinc.com>, bryan.odonoghue@linaro.org,
        mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        hverkuil-cisco@xs4all.nl, cros-qcom-dts-watchers@chromium.org,
        catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, quic_svankada@quicinc.com,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
References: <20250813053724.232494-2-quic_vikramsa@quicinc.com>
 <20250910104915.1444669-1-quic_vikramsa@quicinc.com>
 <5a087d08-273e-4740-b47d-fc25be952ebd@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <5a087d08-273e-4740-b47d-fc25be952ebd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzOCBTYWx0ZWRfX2etixzdAfCtb
 sV5gmJzQZrjVWti0S7G3Hl2TqdWKdcYZFD0cAUrXvcs7C6VqiUXqsALQ4RuZLOxiPc0QT/7DBwS
 6Jhw3pQ6wr6VEluhsvcZk8D1IeHAApp9krFcQLRHShxq+wPwaRqCpZvXRLRCwLDH/QjG1lviaIu
 qZl30+UXgY/uwg5dwMRy9XFIf8OrUf9qGS48xJ+WRSm6YMm3W90LHXN9FKEHOVm8oZvHazMvwfp
 Dm5ScrZeiFCg5cPDJSXBTkeXV86KBDroFOMqO9vnJugzJFAg8Kr3NZlugr7qblr9yeaKmhaNM39
 0GxOfh3QXy8PaCRn1lEwJ+0JowkuhCaqFaUl6deAVrRT3jYaPUCYTPcLxwu35lyvalhMTW+O6O3
 Ac4ovhr9
X-Authority-Analysis: v=2.4 cv=J66q7BnS c=1 sm=1 tr=0 ts=68c16e40 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=P-IC7800AAAA:8 a=COk6AnOGAAAA:8
 a=Ttb-WI7uj3phwydCKpUA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=d3PnA9EDa4IxuAV0gXij:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: MOx3kt9oI6Mj3xbpuQcc4wQZheZXLECK
X-Proofpoint-ORIG-GUID: MOx3kt9oI6Mj3xbpuQcc4wQZheZXLECK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_01,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0 phishscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060038

On 9/10/25 1:38 PM, Krzysztof Kozlowski wrote:
> On 10/09/2025 12:49, Vikram Sharma wrote:
>> Add the compatible string "qcom,qcs8300-camss" to support the
>> Camera Subsystem (CAMSS) on the Qualcomm QCS8300 platform.
>>
>> The QCS8300 platform provides:
>> - 2 x VFE (version 690), each with 3 RDI
>> - 5 x VFE Lite (version 690), each with 6 RDI
>> - 2 x CSID (version 690)
>> - 5 x CSID Lite (version 690)
>> - 3 x CSIPHY (version 690)
>> - 3 x TPG
>>
>> Co-developed-by: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
>> Signed-off-by: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
>> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> 
> Do not attach (thread) your patchsets to some other threads (unrelated
> or older versions). This buries them deep in the mailbox and might
> interfere with applying entire sets. See also:
> https://elixir.bootlin.com/linux/v6.16-rc2/source/Documentation/process/submitting-patches.rst#L830
> 
> Please version your patches correctly, e.g. use b4 or git format-patch
> -vX, and add changelog in cover letter or under '---' of individual
> patches describing changes from previous version.
> 
> What is v3.1? How to compare it? Try yourself:

This is a weird invention that some media maintainers seem to promote..

As a b4 user, I would also like it to stop, as doing anything other than
v(integer) will open the door for unlimited craziness

Konrad

