Return-Path: <linux-media+bounces-48371-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A952CAC15E
	for <lists+linux-media@lfdr.de>; Mon, 08 Dec 2025 06:41:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 53E6B3032139
	for <lists+linux-media@lfdr.de>; Mon,  8 Dec 2025 05:41:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E975F303C94;
	Mon,  8 Dec 2025 05:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lw9CaUgK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fFCj9x89"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 947B423373D
	for <linux-media@vger.kernel.org>; Mon,  8 Dec 2025 05:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765172478; cv=none; b=HxqnLRzCwOLYAYl7ZoMvzFDpgk8yiKJABabG+BME73KFElITnKC0mHoVZui4WKHSsZuQ0XB91Wb1lECnUnL4311I1IiiqWt0/rG8vJUItWXjEuH7XDJaqLCazcLNUb4bOpTbFYfj+KOC43YI3/GhwVd+RthafID8J2sN7zDfXXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765172478; c=relaxed/simple;
	bh=985896D1EG3WIv20THJ7bMeGE4yAYGM9Q92uY8qMyOw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mSHKN+UAcKNbzkz7FRFw0DmwFCriYEE3SEXiWadpfnpAd9YRL9B53WfgZN9G49GKr44MADY4oiXWY4ET5xGmTaZy5blaLJJELcsjJ/83hf4s1Li1SruP7xTEml4JXIFdUGMO06CVtMJZ3UfVMRlmna/ITQ0u2of4sEmR028bkWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lw9CaUgK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fFCj9x89; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B7MftdC2899520
	for <linux-media@vger.kernel.org>; Mon, 8 Dec 2025 05:41:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nAgZDB+WL8BEuCWKxtSRY/sz0RcMKBtlpfHXa5SzQE0=; b=lw9CaUgKo6MjbIVj
	eQQZ9V+HfHDnDBvX5HyE86p69d0gbyFS0bnRNYprfNeA4WZGijqxFTV3sY+xisXr
	glZUdumrlYIft0gC0GuIli9X8ZjvMREQzPFm2WaY1DuWzXJWFOnoFJK8+9SeGQfy
	SnwvQsiXRpyA89T8bM98EeFRkORpSZmYMNWvD5dpBrysW6LffBarKuyLlMaFFZ5R
	zi+bS6DirPtQwZHBAuhary9uVUinqGcFXlN1VXEtvhlDFZWDzh5xwmjShkKB4BCG
	rWIKo305SBBw4Dc61E1uuoEzKKgUi/QKv0iXU2jAIh8YUY/kBS/fm8sfIX7u4hF7
	hCIBNA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4awhaqrr1n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 08 Dec 2025 05:41:14 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-bf06c3426b7so7315037a12.3
        for <linux-media@vger.kernel.org>; Sun, 07 Dec 2025 21:41:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765172474; x=1765777274; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nAgZDB+WL8BEuCWKxtSRY/sz0RcMKBtlpfHXa5SzQE0=;
        b=fFCj9x89AlVCdWm9wGUCL7GaG/BZX6wLg4nphS3UhOR8DsPq9SGl98xY3sxmzCfaVe
         dEyNIE8qxXh0oSoL5IuJMaZhvC71CBegEKTSSDr66o8u58fnf9xabL5sqJREV3hb8+HA
         NZlWPIpVOiADUni0MiG0sohUaGmk9w478gxowyLUq4igPuIiTTraCmEoVHxgtHVagLTX
         95WdamuKQyaeinTSB/eH0lPUXI/oRlsXDSFY89+OzHEP9yDFtn+wsljXlEkuidk71byz
         BXMb0Hgw/dyXKR9HQWZ6raAq39EIdo35KT9dNWpvSS+ba/oPvglx/W4jK9Y0wlIdYsQ8
         Qb7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765172474; x=1765777274;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nAgZDB+WL8BEuCWKxtSRY/sz0RcMKBtlpfHXa5SzQE0=;
        b=P9mcUQgczmcrCWN+d0D0yXhvSSrPne42OpiGAqtuJgHHpdfi0LQ3XocExZKvWLCiaE
         Ux4snP+vhYkyIWmI5OFcuefUlF/PpTFqQv1FDXCMqpBtBkH2Ms8KPrNx0ZemuAq7IO9l
         mVgwUDRXe6YHDsGc9yfrcRKgEMjzfN7WMLv4TowTZiawjnDIbI47UhPQ6PRkAmgSfIEl
         DpjdgGc0DuD8hBV4LwYf76baQZVJvCDbGeiMUy7bEpRt7ALPRQhg7+gne9/adS/IaeEC
         G1syIsi+xzC0rQRLtRn4dx1xeDQRfOgwq9kOzaDxNzttjLzwss/eoFLgPTIDmKH3iUTO
         NS7Q==
X-Forwarded-Encrypted: i=1; AJvYcCXQnKO66sfmLXepO9pxHkQFcHwBJ0Cf3T2rYPccSg8hYF+o4iotrRj8qr1xni4KhgmOOYEO+//UPkMrdQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyOP0BjixfUGIa8TuYcFN0G4PKf+EZruukPf1UA2dkMSXloKzzO
	iJiSz11K8QWpEnW/Je+aA/w4iZx31eAy9LGVBJllOgQU41LIJSjREbHeikQ9VGp2Jtjo0TVWS4b
	hyOgfNJoIVPyeSba8/xvVhymPmjfbo0NPJrhfnw7Lslhn26zN5ul1WeZcz39ekw+Vjw==
X-Gm-Gg: ASbGncsUnx4L+J0AYhHS9ANua+fzhEgoaTLQ6k9Ks1bbOyk8nnwFtunDbLyHyJRkLCX
	qLq2nM8nkfwxWgMif1Dun/i1JpyK+DqtxaRTgV20pt9Wl19l+egEtGoeeg+8lT8+SRHTSRc0044
	yjEKgxlrs4sQAAlYXGmOolKfVR6fHnSP/VqhXa7uVbZ4jyNzNlkaSoamkpWBrJt52vr3GW76ZE4
	Z2p8onATSLhCiytS18+zo47s8y3p5t9tVuXxbDzXMgsj5v4kUcKWceHIfIvmX38F8kHXifRmlfO
	k/agKs6CHEk9VPKfS4uQBNiMqTMzXbaW49yaFy1e6OhxMYb71V3ICM76+5mUYwXOAR+CFhgAmtO
	zz6PXcDq7gGmVoKEtpR4+6N8cdDMJFnotOZNsw9j1
X-Received: by 2002:a05:7301:162b:b0:2ab:ca55:89ad with SMTP id 5a478bee46e88-2abca5598e7mr2701768eec.40.1765172473985;
        Sun, 07 Dec 2025 21:41:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH0eZZECCjKhYlXrxylmiZXDhZKDt1q/a8sPEBGZ/dNfFaGi4tnfcHdhR4jarbtU6StoEW8pA==
X-Received: by 2002:a05:7301:162b:b0:2ab:ca55:89ad with SMTP id 5a478bee46e88-2abca5598e7mr2701743eec.40.1765172473360;
        Sun, 07 Dec 2025 21:41:13 -0800 (PST)
Received: from [192.168.1.57] ([98.148.145.183])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2aba822b615sm32322187eec.0.2025.12.07.21.41.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Dec 2025 21:41:13 -0800 (PST)
Message-ID: <dc0da45b-165c-455a-8e03-7cdd2d2d2ba0@oss.qualcomm.com>
Date: Sun, 7 Dec 2025 21:41:11 -0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/5] media: dt-bindings: Add CAMSS device for Kaanapali
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Atiya Kailany <atiya.kailany@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
References: <20251130-add-support-for-camss-on-kaanapali-v8-0-143a8265e6e8@oss.qualcomm.com>
 <20251130-add-support-for-camss-on-kaanapali-v8-1-143a8265e6e8@oss.qualcomm.com>
 <f4d29f9b-98ce-4e57-9916-5a37927db2a7@linaro.org>
 <2tvkcuipfaa7cn7goynt6jfzlcxg2d7yvvjqizb6p7sf5oqwuj@drqiyr3khoyf>
Content-Language: en-US
From: Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
In-Reply-To: <2tvkcuipfaa7cn7goynt6jfzlcxg2d7yvvjqizb6p7sf5oqwuj@drqiyr3khoyf>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA4MDA0NiBTYWx0ZWRfX+Ck+Xl9VbnDT
 aLbu39UCAJKM8RmhLgcUK8kGeBTBbtzznpaffvMI/SttdskQ0XoaW16/iHlpEkNU/R+kBMRRjJA
 vPhoffSFDPXR2uk98b1A0NFUYP/BrXcQOUELfqoIcwIR2Ey06WGsq9emrz46k5fx9l4PngnQdYh
 lb+BGyGBxIRM6ge5sQ6/jix90F1LAElQqnHRfFRf/MOKoRCoCSMi5QTl58CHfiKpZHurOnqyBXq
 KwwAcu6zB6nFAbX13UCe/KDX7ynijKC2QQqgesZZe9XlZOLzGLDPzya52VJmG5xMiWAkUB9AUpM
 SdE0qzc4UCcwUmJVfSb3HjWEq0+g/IPHw4+5e5lm5mHNWoeeXZB8fPHg9UI43wsvbQZKG5EmRbl
 U3GeeCSdTDlUOkiEnH0RWs9UNCdtTQ==
X-Proofpoint-GUID: PLUBI2ToTD59NNxIHZYYcbzBgNYgeokK
X-Authority-Analysis: v=2.4 cv=ItUTsb/g c=1 sm=1 tr=0 ts=693664fa cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=BiHMn5M11h/vNwziJwzFrg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=xq3W2uTSAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=VwQbUJbxAAAA:8 a=nMuhoS2BBV4FeKdUb5oA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=P5L7wpMTXyg1GfFA3Gwx:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: PLUBI2ToTD59NNxIHZYYcbzBgNYgeokK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-06_02,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 malwarescore=0 spamscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512080046


On 12/7/2025 5:44 PM, Dmitry Baryshkov wrote:
> On Sat, Dec 06, 2025 at 10:11:20PM +0000, Bryan O'Donoghue wrote:
>> On 01/12/2025 06:30, Hangxiang Ma wrote:
>>> Add the compatible string "qcom,kaanapali-camss" to describe the Camera
>>> Subsystem (CAMSS) on the Qualcomm Kaanapali platform.
>>>
>>> The Kaanapali platform provides:
>>> - 3 x VFE, 5 RDI per VFE
>>> - 2 x VFE Lite, 4 RDI per VFE Lite
>>> - 3 x CSID
>>> - 2 x CSID Lite
>>> - 6 x CSIPHY
>>> - 2 x ICP
>>> - 1 x IPE
>>> - 2 x JPEG DMA & Downscaler
>>> - 2 x JPEG Encoder
>>> - 1 x OFE
>>> - 5 x RT CDM
>>> - 3 x TPG
>>>
>>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>> Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
>>> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
>>> ---
>>>    .../bindings/media/qcom,kaanapali-camss.yaml       | 647 +++++++++++++++++++++
>>>    1 file changed, 647 insertions(+)
>>>
>>> +      - const: gcc_hf_axi
>> https://patchwork.linuxtv.org/project/linux-media/patch/20251126-add-support-for-camss-on-sm8750-v1-2-646fee2eb720@oss.qualcomm.com/
>>
>> Pointed out by Krzysztof in the 8750 patches but the name of this clock is
>> gcc_axi_hf.
>>
>> ~/Development/worktree/qcom-linux-next
>> ➞  grep gcc_axi_hf * -r | wc -l              [git:platform-qcom-next] ✖
>> 48
>>
>> ~/Development/worktree/qcom-linux-next
>> ➞  grep gcc_hf_axi * -r | wc -l              [git:platform-qcom-next] ✖
>> 0
> My 2c: it should be none of those. gcc_axi_hf is the _source_ of the
> clock, while the bindings (in my opinion) should be describing the
> function of the clock on the consumer side (e.g. bus, iface, something
> else, etc).

Hi Dmitry, this is MMNOC side of the AXI bus clock for the HF clients. 
If it's ok, we can change it to be consistent with previous generations 
for KNP and we can take it up in detail when we refactor the bindings 
for Hawi? Please let me know if you have a strong opinion on this at 
this point and we can discuss accordingly.

Hi Bryan, we are addressing the things that makes sense for KNP as well 
in the next revision. Btw, couple things like a separate CSIPHY DT node 
and ordering of the resources (that were to be added at the end as you 
advised), I believe are not relevant for KNP. As for the GDSC names, we 
preferred the module name and it's GDSC name to be consistent so changed 
the latter as well to VFE. Hope that's ok. Please let us know if you 
would suggest any further changes to KNP v9 bindings and we can move 
forward accordingly.

Thank you both.

>> Please resolve the other inconsitencies pointed out by Krzysztof in that
>> thread here also.
>>
>> I will have to skip application of this series in the meantime.
>>
>> ---
>> bod

