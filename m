Return-Path: <linux-media+bounces-47327-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 49CDBC6BC10
	for <lists+linux-media@lfdr.de>; Tue, 18 Nov 2025 22:46:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id F387A4E3CB6
	for <lists+linux-media@lfdr.de>; Tue, 18 Nov 2025 21:46:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 435F62F7AA3;
	Tue, 18 Nov 2025 21:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ee+v8QXt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bLwYohh8"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E37D2857EF
	for <linux-media@vger.kernel.org>; Tue, 18 Nov 2025 21:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763502361; cv=none; b=MIpDQemEDBkUER48lFGaDu1d9A+q9FUx+cGigYdHVPHP3Hm7ZCOa3ZXDsOZMjK7dafqkTQEsFyQSAuWlWssAAH0HscoVJ5lBLi+J10IqowoKOGBGX1sOpDQkHR5+Irf1V0awI6XnI7bdJPhT2psSnmqyS6MivmQRoTVPQNGkW3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763502361; c=relaxed/simple;
	bh=ls2Rw5xBdwyriW57f6EvboxT3meR68baJB60XNRB7gc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rS5PzxzlxmCLM+EADEuA6mMpEibudklsvyK/0FEo1OwookTDoNDdN2cPVTdEM8y8nCD8Zft0BFHvxerPZnmiSX0RRdfcQCS0UkHQktdH4Y0Kus7xeJi+MQfL3uwBtCv3OJ48ZXMvPiNd6Qcpzsb5ikFeqf0+djTxIh+cLn/w+J8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ee+v8QXt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bLwYohh8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AIG3RWp3176704
	for <linux-media@vger.kernel.org>; Tue, 18 Nov 2025 21:45:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x5iVPsaYlCb1RMVTHNymKIOQrhn6hE3lW1sYoQpRwNE=; b=Ee+v8QXtyh261DVW
	FZgce6h4fGZUj6T42xbyTWbTp8Ako7hkPkv1+PdUu+N3ZHDaIFH6UM0uageX/X7A
	xioCuVzt5xZBDelLrANoSJTw8KbhJwe5MBmQFUCTWAXVUaaHyyDR2+Wi+UkJXlao
	tnVy6dODUFjclRg0XqXLZ11uE20g425yIPlDxolzSgTsoBnNOcaOKeni8AgEo/gU
	g+4g5h0BMa5CmSCh+JwiUhG9ZEmudNq9hKWeEe5WTKPlr3TXqFSh0M/DcPQohGhz
	x4RukSvRdEpGp0RVYHFMwMGV+2oxoHPWKrkkBA3qrR45Q3NAiMeTyUrdcLJyHZF1
	V8asmg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agv0210ch-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 18 Nov 2025 21:45:59 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b55735710f0so10782218a12.2
        for <linux-media@vger.kernel.org>; Tue, 18 Nov 2025 13:45:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763502358; x=1764107158; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x5iVPsaYlCb1RMVTHNymKIOQrhn6hE3lW1sYoQpRwNE=;
        b=bLwYohh8aPLz6E7Kapck5HLWzUXByjpwwwDbTaS21Vu4DJgUKuQ2bQ9ly+KMMVLsLM
         /seNJG87QI8Fh3UMChHMW+/NU+2lRU83RBf90SfrTIGEAVlPAIrJdPKkjhc1jwlPxQTT
         ukMsrNBv4DTqVhKHZFRW8A5kDdpfk7ZFxr2aVUvmZxq3S6T0Cid7GnaF0/EDDGaHR8IR
         zSzE2Hqvo8n1Toce3ZnpZPxOKCHIpNnVGgQruay1W11V9B6xHzOP1pd8KNK/pwAAvu/i
         f75p2WygSbB0HTtwbZL4oXt+XMAi3frbIdWMPv83s0QDu/JCHDz6e9UwSYb76oVwdBl2
         KUWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763502358; x=1764107158;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x5iVPsaYlCb1RMVTHNymKIOQrhn6hE3lW1sYoQpRwNE=;
        b=a5mbCtK5IE7irvyHnqOcZdvfFOFSrBzeLFKUqKTWdpoB8mW9DN3ky63cGMPPrGTQXK
         U7t5uHIWnrYp0/BLXnXLo080XYnbKipNJe5LsfomF7KsFZ5VX7B4w2Hmx6McpcBXn5Fd
         qR2oE6Ed/dUOdXrrBNjy92lqpDrw8fTaYV0QWN0afmBtl0/YWIsDXDCtLgaLdPrXTPD2
         OVH4DJDG0zZ4+R+nA7vrLVq5LkOKLaKFBeMzEB7S6uv2QDLv8pDd+k+Nh2xCsszD/HAH
         s0bW8IX9eleLzRfRGCBg+czCKHgTadaJWvF53yYqio9Omedis28dVexHMPyJK5UT9yRX
         EmZg==
X-Forwarded-Encrypted: i=1; AJvYcCV+4hvH0vubrhXkyx9pZhYoIP+YBxp3BINOciX+N1pPB+hxgBOXxHIgP2skTel7k73iysA8RTFAcztipA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyufd7d2OUg+C+ODF0LT3UegaWSz1SazEAex1pzWpnIeTxsvVg1
	luOn/9DOVg1kv8yGe+bDUx4lmmiifZEmUP7oKhsXVIMTaQcxjfgTVGGIECkXW/YB/wHhL0sGKZn
	6vmQYHDe4E/qZrNtyCmooqMIoSTNSr29I3xyzFdN7NyZ2N0bv3ic7VD7hYA+xDpon8A==
X-Gm-Gg: ASbGncsx0dFD3jujWXkAjYiqkP0c3eLOI/XxCIF/gH3/Sif/dPGpYkK+o5gPmF9egem
	tqvc632UgizdK0oPG/fwEYYIf74ygvAcxNi1b6Htv4wedtBJp6ZymmmzdgqRwgQjBEfb6/GFyxt
	Olk5FBHgH9G3LawP9A+ADbJrUWv8gUi9Pz3YGcXZMXqOYKBMOflvf4c4DbwYGRFgmHV631Px0Us
	cVWTSpAkcR6N9Ta4wWbAeq69+r9p8mpc9nZCvY9c3OewJhsYq6J4Udp8HMEU5BHRozr0knNRo7W
	DZ8GmIPXg0nebjkZh+E+/6zSU5Un+VpDXSX4iB3h1QphopOVX8xe36tAYoUfMcwPtjw/tzvF+EY
	EvkMEWawAxHgaZW/4IUMm3Y3s9jdSSMl+UXvyuxqF
X-Received: by 2002:a05:701b:260c:b0:11b:9386:8266 with SMTP id a92af1059eb24-11b9386850bmr3847555c88.43.1763502358469;
        Tue, 18 Nov 2025 13:45:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IELTILBUpxHvNoH+O531dN5+wyeYypui6nPCf/ktkz+dWVwvrt1daR3IOAvqgTlEK5x1GA+Rw==
X-Received: by 2002:a05:701b:260c:b0:11b:9386:8266 with SMTP id a92af1059eb24-11b9386850bmr3847539c88.43.1763502357930;
        Tue, 18 Nov 2025 13:45:57 -0800 (PST)
Received: from [192.168.1.57] ([98.148.145.183])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11b86afe12esm53561915c88.6.2025.11.18.13.45.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 13:45:57 -0800 (PST)
Message-ID: <1f320bc6-ba7b-476a-b9fa-b5333f66530f@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 13:45:53 -0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/5] media: dt-bindings: Add CAMSS device for Kaanapali
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Atiya Kailany <atiya.kailany@oss.qualcomm.com>
References: <20251113-add-support-for-camss-on-kaanapali-v6-0-1e6038785a8e@oss.qualcomm.com>
 <20251113-add-support-for-camss-on-kaanapali-v6-1-1e6038785a8e@oss.qualcomm.com>
 <bd899586-f714-4d2e-95e3-6abf124e75a4@linaro.org>
 <37d0f89f-69be-45a7-90fa-347d6a3800bf@oss.qualcomm.com>
 <2d7ac7e8-ab69-44a6-b732-3657abf3a5a6@oss.qualcomm.com>
Content-Language: en-US
From: Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
In-Reply-To: <2d7ac7e8-ab69-44a6-b732-3657abf3a5a6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: B4v1M0momql9_JP5ABJgSo_XqyQSybD3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDE3NiBTYWx0ZWRfXyODV179mcj/Y
 jiSAZYFF44oCzG2V71epsh+ssVcgcCee0UOP+/ZtFDkjZ4StVR1rrEA/dKIWjdJBNgrwxQgcg7m
 ONMoP4kLDeE5cRnxgapyuJ7XoJP2AfDilx+YdS5E8wQ0GzLeblFuhM83wRro5xfz06Ednlv/7/W
 aD9ujFytoyoo+etmQYg33qKG0wR367iQ0hANKCs/cmn6qe3ooLN35iRuOK9KPJ+Zs8neM25j4tM
 XHFjqXA2b5rojmyjuqkQKoJ8r+nWGxDwQiXSGA0fMqMmV7hU9h3L1ce0bgCX+MtZFlaNjVZIid6
 5MwjLpqGcUnr6tDCzktbTT8ezTLrxE5RMe/wwCSl0U5zAkVEg8Iyj7Y3/5QuXGKJ3GIKz9fplRy
 S+ZhfCJB1/0462D/8Sfbp+lhBm8ctg==
X-Authority-Analysis: v=2.4 cv=ad9sXBot c=1 sm=1 tr=0 ts=691ce917 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=BiHMn5M11h/vNwziJwzFrg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Im06aVK_WBUVNnXpTS0A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: B4v1M0momql9_JP5ABJgSo_XqyQSybD3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-18_03,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 bulkscore=0 adultscore=0 malwarescore=0
 impostorscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511180176


On 11/18/2025 10:44 AM, Konrad Dybcio wrote:
> On 11/18/25 7:25 PM, Vijay Kumar Tumati wrote:
>> On 11/18/2025 7:00 AM, Bryan O'Donoghue wrote:
>>> On 14/11/2025 03:29, Hangxiang Ma wrote:
>>>> +                  <0x0 0x0900e000 0x0 0x1000>,
>>> Why aren't you starting @ 0x0900e000 ? seems to be omitting some of the registers in the ICP block. Should start at +0xd000 not +0xe000 ?
>>>
>>>> +                  <0x0 0x0902e000 0x0 0x1000>,
>>> Same here.
>> Hi Bryan, HLOS does not have access to those registers. They are configured by the Hyp.
> If that's hyp, please add them. We already have platforms without
> Gunyah. Remember, bindings are defined once and for good and I wouldn't
> call it impossible that someone would want to run that configuration on
> Kaanapali some day
>
> Konrad

Sure, if that's the standard. But even on systems without Gunyah (say, 
KVM/PKVM), these will not be configured from HLOS in the regular flow. 
It will be done from TZ.

Thanks,

Vijay.


