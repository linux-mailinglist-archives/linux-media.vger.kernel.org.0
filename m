Return-Path: <linux-media+bounces-45874-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE130C16959
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 20:18:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2EA723AB143
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 19:18:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82B5734F481;
	Tue, 28 Oct 2025 19:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qo3Ag8i3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GT64veWJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69C242BE021
	for <linux-media@vger.kernel.org>; Tue, 28 Oct 2025 19:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761679103; cv=none; b=k75GVRM55IoyHxKPIrUuzySxe+AW+vP7/b7kii9Zw8msttWozT1/Jcz9Xy8p5lnTgs4KUsymQk8nSCIP3eNSNyD6URuQImJBffDBd/vtB6K4RrmSrzYfrvvzJtZnWmnOFt/Z8Zt/wRTQY4k0pO87Cok4isq1M5kQpijY7RrUNLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761679103; c=relaxed/simple;
	bh=0hhlCwxtrTuVy9ywy8PZ04TLMeWmNoQW1VuNCe9Lhnc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LZ2u3KjqOjSUqiduarYWpRaXv//dTdyE4tRknMxJnbwAr5cdwIPm+8ByaLmmzDs/Gi8tiysNIJYEowTh3MILDhwi3YOjY4q+RkUBirbiWSbQDuqyXQSxBZbTo0XEgkLoSzDchLiTcM5LIl4pzRnCx7AbnAoj3qEpvr1JGzKjgDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qo3Ag8i3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GT64veWJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59SEnjJT1965933
	for <linux-media@vger.kernel.org>; Tue, 28 Oct 2025 19:18:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cE6kvUJtutSNKY0OcaTxxOhxbbMxO1uEYLUzt+x1AGw=; b=Qo3Ag8i3WEdvawyt
	NceclgyZWGnUROoX+denb7Xm6kAQytPtpD/uxRZ73cnbLYHRF2oCqcfXeL3PtkSa
	eEk1sGctW5envpKDehgT0XcQskIPf7lg7Eh6IUT10/xK7diITsF8YyGIGyfFCE6e
	KulelTE+FNOym+MPN1HwHnuCCaPf1sWUoOMAWztPOozmTQvmr6f3fKzSE8xnDFFG
	fYvA03BfEG61SE8LiL7DZ8PubSYphrSXwNBgdNe8IuP6FKao5VhWkW8+KCfaJ3vo
	BhBSTOqjsEKO3eW84oj94icChInxUNoiMHBdkuMoxy+7zBU1nVAuKU5LgjfAvV1U
	qSjojg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a2w51sdj6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 28 Oct 2025 19:18:21 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-27ee41e062cso71507065ad.1
        for <linux-media@vger.kernel.org>; Tue, 28 Oct 2025 12:18:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761679101; x=1762283901; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cE6kvUJtutSNKY0OcaTxxOhxbbMxO1uEYLUzt+x1AGw=;
        b=GT64veWJYfFx/cytML6IJOr51A3+s54l9R4EdngHHyOD6xfiF9GgaW9TPKoozdYD/C
         JV+BvQmaZ7NjlxAk/aa7WFyLvMdIp2lV3p0qCKtTzAAKy8r/iJK7qKV8uXVuhNtAHwBF
         /E68dc5ExTN3p0CUwb89h0GCXP0Ktg3qUjxcng1kP/oxnzP6wvzbLQ9qlv73LkdqcAlh
         W/5BWalGTIXiI/1738yCVYC9g/0+dG9LyTm5YZkW5IO17ck4YGZYroe61xQTqIc3xA+u
         GeWAbSlHp9HMIPuveB83Md0nl+McWqcs+xtY4jW4SB7ZSl2dOfPCv29IJ9SnINmlTqMn
         3Uwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761679101; x=1762283901;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cE6kvUJtutSNKY0OcaTxxOhxbbMxO1uEYLUzt+x1AGw=;
        b=LGMJoUzweFdDrQQFtoiz3ElURn85HdSu3zog8S2I3EdfPkhagWiHW0LnWzORVxEl+e
         3M+un4hP6R+8HGUQYxT9adnl04t/W7rhcH8yx8d2Q19sXigs+ZUAYpKbZVQZnwNfHb3N
         VybDWyo2RLG38Ng2UCCDkt5i/4d5M53pVM1Nnc5ChFMP4LWJLQ5ZGthad80eGlH153DF
         3WR0gQTzOFo9VGG6mKE59WsEiNhVOqsgkreX6PgTdJ7mhY4JHemntjIv4yvvraSH/su2
         mqwgOzYCFofMewDOP5RdH6FcYjBUq/jF8z0DO5U/9RxDhUz1JTomzsOOo+IvQSTzCkjg
         ru2A==
X-Forwarded-Encrypted: i=1; AJvYcCWlO+4bfeeBh2qshoaaiijhXdtuCVgEKKZk7V/Z+TJdba1kv+8kN3qifWNHfWRuR7ne8LrDBMRSxYl9dw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzth5F/fIkV7dvys4Ov0OUm4nwWT0lknzHQqavnDVqvhc4UM9+l
	nALzcT/pGMMJCtZvegiXaqrBPWEY0y25a8oXkWqG4u4otd6Bc08Zpa7/xy3brEragRtdgnxB8JZ
	9jLSlsSrZ4yJ33V/h3zgvqmCEwijVEHLEjsTGg+S9CzBpyFaZ3WGdl+BARNko7icUHw==
X-Gm-Gg: ASbGncvK9aNg3i7ucQX1ybBalrZzTahYzMb0e/s9HixaKcCRZ5aAyW1sVbI/eh3VaB9
	Rn6P5V+/yU5mDK4LEadeJvbV0dxAjqdYb2GBy6GhDeUEiJ6zb26pWFTnFHb+xpZNqP3MCs20brV
	8yYSw4vsjMIlr6zcLerDoHOQOAsfxdWOa1p+2a3KLy9lCl7ygBWilq+esjuC2iY4Y/62OZcKVkg
	KEN63Gt8866rbh12GBW49buUVYZq51UN6qxOBRDOJ+hni9b0cwlLcnYJs8XONFNBdpQUsdByzWc
	uw5WSfFa3qzHgIYUIIrvoRYuj5Vg0Aat6XtJN/anbRveXDawU6PSvVKLVLg3RSl8a9CvadACxhe
	fKVWmLdrTrtDqYj89Q9WPHrHFqzg5x8REJttrGVD+DlUoRpOOSK3s3w==
X-Received: by 2002:a17:903:2a85:b0:269:b2e5:ee48 with SMTP id d9443c01a7336-294def62ea6mr2685655ad.52.1761679100190;
        Tue, 28 Oct 2025 12:18:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHiS4DA5cZRIsPNZiUXqoc8KRQ897PBaD+pMPM1dqIN+3BfFWkz5CMP9zUSwsQqIiqDj9LO5w==
X-Received: by 2002:a17:903:2a85:b0:269:b2e5:ee48 with SMTP id d9443c01a7336-294def62ea6mr2685185ad.52.1761679099527;
        Tue, 28 Oct 2025 12:18:19 -0700 (PDT)
Received: from [10.62.37.19] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498cf49easm126964705ad.9.2025.10.28.12.18.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Oct 2025 12:18:18 -0700 (PDT)
Message-ID: <c264e656-604c-4390-8edb-a9810e68dd79@oss.qualcomm.com>
Date: Tue, 28 Oct 2025 12:18:17 -0700
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/6] dt-bindings: media: camss: Add
 qcom,kaanapali-camss binding
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Atiya Kailany <atiya.kailany@oss.qualcomm.com>
References: <20251023-add-support-for-camss-on-kaanapali-v3-0-02abc9a107bf@oss.qualcomm.com>
 <20251023-add-support-for-camss-on-kaanapali-v3-2-02abc9a107bf@oss.qualcomm.com>
 <20251028-wonderful-olive-muskox-77f98d@kuoka>
 <ac126c63-f40c-4159-87c9-1b3d7a8dec63@oss.qualcomm.com>
 <7efc63ed-9c84-43c0-b524-f7e9e60b2846@kernel.org>
 <f0c05321-776c-40af-b379-b9336b618340@oss.qualcomm.com>
 <0ddf3634-d9eb-425a-b35b-c0b4ee995a4b@kernel.org>
Content-Language: en-US
From: Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
In-Reply-To: <0ddf3634-d9eb-425a-b35b-c0b4ee995a4b@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: dz6AVQ9j4Lc3to5y8r4jhywahsR2Jqwj
X-Authority-Analysis: v=2.4 cv=YMiSCBGx c=1 sm=1 tr=0 ts=690116fd cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=I-EcnzrSYEg_xlsmLtMA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: dz6AVQ9j4Lc3to5y8r4jhywahsR2Jqwj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDE2MiBTYWx0ZWRfX8v756oLsmpnd
 3GdXE7Q8e3wxW2T9gyvf+8KJSM9LP96fKdRxdH3HwWoESjgGa9yfFAVzh+rWygo+jABfWChzreg
 m/oSZjJRwtc60EHCs356Hywbw8jp0HfvO/NuOzpqRq74fkHw+2AHXCpqFdMYlYOFwbwQICJcEch
 wYDsAZHKWirgSkWP0iN9R/W2/73luU1CHUur+qrfjzdzVvK8a7I0/aghL2f0s5EVu+a3Qhf1uaG
 rEQlt9/kriwDnWIh5W3pVudNB1YnmvynieTVjGf4R4xDxCJTWH92fCENrEJdCSRAHswzOfkTHQr
 cfptx7ke4F7xgDlMzCQOrMbCWrWGCx2XMS0hAvFYJJ5XRxHkbBf9ElqxefcOVRKlD5XR9yXW6GC
 upcLsdM1k1C2Rg6iIlu7zuk09lPvfw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_07,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 spamscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510280162


On 10/28/2025 11:39 AM, Krzysztof Kozlowski wrote:
> On 28/10/2025 18:45, Vijay Kumar Tumati wrote:
>>>>>> +      - const: tfe1
>>>>>> +      - const: tfe2
>>>>> Why not using the same names as before? It really does not matter that
>>>>> it is thin or image, all of them are the same because only the
>>>>> difference against top matters.
>>>> Right, this is done to maintain the consistency with the clock driver on
>>> Sorry, this makes no sense. This device has nothing to do with clock
>>> driver. Don't ever use clock drivers as arguments for doing something in
>>> completely different place.
>>>
>>> Not mentioning that drivers don't matter much for the bindings, so I
>>> really do not get what you try to explain here.
>> Understood. I meant to say that it is consistent with the naming for the
>> TFE device that is available on Kaanapali. If our intention is to keep
>> the names in the bindings same as previous generations despite the
>> changing HW architectures, we could change these to IFEs, to be
>> consistent with previous  generations. Please advise. Appreciate your
>> inputs here.
>
> You name these based on the provider, the clock controller or whatever
> controller, and that's the mistake. Names are coming from this device
> point of view, from the consumer. This device does not care whether this
> is Thin or Image or Whatever GDSC.
>
>
> Best regards,
> Krzysztof
Gotcha. Thanks for the explanation, Krzysztof. Agree with you, we are 
just trying to differentiate the GDSCs / power domains for TOP and to 
each of the front end modules, to control them independently based on 
the usage, as we have one common device 'camss' in the DT.

Looking at this device as a whole (as a consumer), it has one TOP GDSC 
and one GDSC to each of the TFEs (the front end device itself in this 
architecture is called TFE) separately for clock gating. TFE_0_GDSC is 
enabled only when TFE0 is used, for instance. That way it seemed fitting 
too. But if that's not OK, we have two options. One, we change this to 
"ife" to be consistent with previous targets or the second, use even 
more superficial name like "xfe_0", "xfe_1"etc. for power domain names 
that represent any front end (thin or otherwise, which like you said 
doesn't matter here) and can be adopted to all future targets. Please 
let us know your thoughts. Thank you very much.

