Return-Path: <linux-media+bounces-49444-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2565FCDB67F
	for <lists+linux-media@lfdr.de>; Wed, 24 Dec 2025 06:36:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 252CD3016B89
	for <lists+linux-media@lfdr.de>; Wed, 24 Dec 2025 05:36:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A15EF30170E;
	Wed, 24 Dec 2025 05:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OZmXH645";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NmiygSDN"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 986042DECBA
	for <linux-media@vger.kernel.org>; Wed, 24 Dec 2025 05:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766554598; cv=none; b=Ee5NPI2jrReI/OHj1It1P1HVqWDE48TtoCyZi6le9k3tZd4k2qYt7okz2151E6N/YnqLEYxEQ+sVW3G0s1KeplsQrOoic9X0EHNJ/waRqcd9ngToqLSM6WYHYKE+ttMi8VnPeTafPU48D1+OUtpsl8v6mvFSXvrXfk1nI1Lp/8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766554598; c=relaxed/simple;
	bh=D/EJY/xZcVzEI1mfF5NG5bRCf7dgZm3su4wxwdDfqwI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JYxJwjsK2lJL5asOKLYDbwCdyDZB5VWx9wMN/Yq7iVdsa62tOVTfTzRyIW9hDpfgDg2KsdnUFDszYvXYov7OEUFtcLr9YXh20sWd0JDSfwClRxUV51UKQtZDguj6Rx3HPerFLC5V0wYfkBf74zKPYkyA74AHcMaY6EP7mEKpkYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OZmXH645; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NmiygSDN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BO2Omqc461418
	for <linux-media@vger.kernel.org>; Wed, 24 Dec 2025 05:36:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	44X9WKEnAvBqjJQ5vQapEwynquc45TyXg/tY+vGS4fo=; b=OZmXH645qAVq7ATS
	u0iWg0Fxk6J2zKge8RqIrVn2pT2XZStJcrd3MedCttgxNpeTEA3Pr6qvBLT0FFA4
	2xcJnzBgtJx85WCicwaJkvL+KWZqM9/f7mSaQVpodPA8oB03o5SLyrKVlpXE/Zc2
	+C9TTnM6hddfwB6FMZx0t8bNamZgCS8w4O4582Te58nkp6CTurQVRwN2bO8W/AWN
	0fozBGAMjwzN1sZys0XYUD0IBZAOb/dExA9KfMkjlf6rGJ7/7s+KO6/0sqYiQsM1
	aSiteH3nLsuvDzcueryJp/Zh/aImQcu2HLjv9O+UQB6mqE1GNku3dMUJx4i9nRTk
	D5adjg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7w8ft6aj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 24 Dec 2025 05:36:35 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b2e19c8558so273723585a.2
        for <linux-media@vger.kernel.org>; Tue, 23 Dec 2025 21:36:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766554595; x=1767159395; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=44X9WKEnAvBqjJQ5vQapEwynquc45TyXg/tY+vGS4fo=;
        b=NmiygSDNwQkRePjX8rZnroSndapx6+Nt797KmWfLY7QRTh16OO9VIAYgRY26OLupUT
         wC7rhHSHF3ch5u6DvlzRyo6Feu+PE2vsjj81Ott1fJ1FJnBQC+E3ACcPhPg48WmlwaCR
         gkOk6ONGeolhKJCR7Cbc8c8eaFX/3H5GmfZX9CtgvZ0/a8l3oVTEvkSaAQ6cemJ87Pam
         Zlc+S28wBh0tjqaYE15WgYuQ2kGx/48KFNgjuuMBhjtcQDHqos9x6vDbfuzKc2uU/QHG
         5LmoV/uG7TW4V2EsAcp/PCTWiJXLKpwtKiUjcMC3+xwffB9lD8TXgCUOH+FX4XYOX5sc
         mxNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766554595; x=1767159395;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=44X9WKEnAvBqjJQ5vQapEwynquc45TyXg/tY+vGS4fo=;
        b=Bk9mNx0DNYVp0NDx2jHR+l6D+KtVQNE9Ao0oNu7AaxTf3avqk08bh4C9gNe9058bEf
         27tZ7pG3PVGjxlEYcL0Tnul1OWH6oV+SxOv1rJCIgBxwGVitjdKqbdW/6ddfh8VRjPF4
         4Rj1zf2lIDAbhQKGcHTxD84TnS6z1tAVaFSKf7pP2CclEbydyYU9nqN7xsigSbTXpRO6
         4l1J5vnMxVnqpikcdQ1ilHL4mEF6ON5si+yXjWale2TJD9xLlwBLlWeCC6i0YnCqqsKL
         1150C0j8XEJGJUE3aFOqLBwnAyS1OTt7bD4f8BKCXuVoIi9AtIoLEwlUcO+E2R8+LiwL
         irfA==
X-Forwarded-Encrypted: i=1; AJvYcCUhMLD2QwXZNepC+YdS3v6o+gDfLlti3DuWgym0sGxxKL45bwSmgsRdYnglhQKDXcPjEb3v5lDtFdPetg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+eEAv7WqeB8S/C5JkC9ZiTG/W2+TKV9HJ2qlwAwGAu3F59jgv
	yWFWx+n5srENqYsdqB3STQzrlTkPS8+RnDDhIZkuh0QanXIuQ1S7TEqj/taWjco5aS49Fjxy695
	o3adx0ero8JQAy38xG/gNapAaXuj3u+5f/EZIoCojTYn4hUjSQZqivWki58b5Yv3yng==
X-Gm-Gg: AY/fxX6qs6VUUuty01VRJCF9uwCT61ZM3dPbzKGI1fxKcnldL0S/nr9r0K2sII21KOy
	/C2T5fxl5Nm5po2+Ul0xh9mm7mH79HD9zXGhOXwkbRbjNnSlS552BGNkQLq+P/SL3DB5UE3U5Ah
	CQeXYwpCWCd0y9uXxzBNQh0WjxUas2vUkFR/0+oo30EXuI8evrkxOzkNWxYXR979FCDgL1GItjy
	dantnxkmsNKgE8sj16UOYy+jf9WO548nU9OCkIIl5J+/eJEqAQ24iWPEQl/5XbkVbJJtS2gniOb
	RgEFhystDb4KwZmsg+mcxpwsjriddS963CzaLiAPJYu/LVbsstKp9m1RVyQ+tXm4A9B7S6Rgp/Y
	lRpltiGcEx1i6qs55838Pk+9qTJLdv2pxWhehnhaHU+N+7FTwB+JQeDFAqcO7F+HPNCY/D2NkFg
	==
X-Received: by 2002:a05:620a:170b:b0:8b3:e4c:1bd3 with SMTP id af79cd13be357-8c08fc011d1mr2491520585a.12.1766554594805;
        Tue, 23 Dec 2025 21:36:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFaKSIbqODFp+Qf1RwehcNGLME4jhdlVwH6+nSPDaYIi8JwEdGAOj3HPEagDesqxYDLswnumQ==
X-Received: by 2002:a05:620a:170b:b0:8b3:e4c:1bd3 with SMTP id af79cd13be357-8c08fc011d1mr2491518285a.12.1766554594357;
        Tue, 23 Dec 2025 21:36:34 -0800 (PST)
Received: from [10.111.161.169] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88d9623fe63sm117785366d6.10.2025.12.23.21.36.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Dec 2025 21:36:33 -0800 (PST)
Message-ID: <26536725-19fe-4aa6-8a33-8e2e39261cd4@oss.qualcomm.com>
Date: Wed, 24 Dec 2025 13:36:26 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] media: dt-bindings: Add qcom,sm6150-camss
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251222-sm6150-camss-v2-0-df8469a8343a@oss.qualcomm.com>
 <20251222-sm6150-camss-v2-1-df8469a8343a@oss.qualcomm.com>
 <20251223-pompous-inescapable-sponge-3fc9f0@quoll>
 <c6174a0a-9a76-4284-8675-bb5ca78a7b35@oss.qualcomm.com>
 <eklzmnlnkanrper7lt46vap54u5giprsmwhwpr4am5ytwyohov@kjqvls5vjani>
 <6b52d19e-8ff1-4bd6-b854-bcabccc7cd74@oss.qualcomm.com>
 <3342fv43qdkmm66jgc63hho2kd3xn65p2fv3tyk3573izlxf7i@hgjsp2kwqyuh>
Content-Language: en-US
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
In-Reply-To: <3342fv43qdkmm66jgc63hho2kd3xn65p2fv3tyk3573izlxf7i@hgjsp2kwqyuh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: g5tgA7HXXxhD630e0671aqIsc4jpfoud
X-Proofpoint-ORIG-GUID: g5tgA7HXXxhD630e0671aqIsc4jpfoud
X-Authority-Analysis: v=2.4 cv=QutTHFyd c=1 sm=1 tr=0 ts=694b7be3 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Cv8wudomnPW4Owqv7AsA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDA0NSBTYWx0ZWRfXx5po4Dv/xSW0
 VyyLcwXdbjuR1pgyUipuLgRzcdsRtX/Jq6UR2BXGLJlk3WlJ+U8dKUIQanc9pZXjnUpkcU/hsjr
 vhWy87mYrNHvu6gYfp9snlVUuDDWOC3NCQDk6wU6xCh+rBneMwSdmOEWFFDfiduxQPEoto9Dhim
 fHzMxpwzx2+QHM+A4EK8eld28BWWs7IyZHhv1Ncbzjx16kTHtR21d1EY8EeYgUcm+hmZJjlc++d
 Fc/U7VDK8FeWw6jZz70UNfQlLVESNaL7QpWMrS9ngrw6Yq4prdUbmGTjWO6j7fOccXKGPA14n0Q
 s4Z3Vqk0Qh7bfqiB8382BDp7vnTluFUmWsJ4HCoLAeZhjiLzVf2pHSF3FLZyLAEmq4he+IPB/rv
 KWXWnYQKoqzauSnibAWGWAgN9TanptykiqTs5WDmDuAYj6aYRBXZVmnvog385isThReti62kEhr
 unQiVP70vi3l+i90NXg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_01,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 impostorscore=0 spamscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512240045



On 12/24/2025 1:03 PM, Dmitry Baryshkov wrote:
> On Wed, Dec 24, 2025 at 12:31:33PM +0800, Wenmeng Liu wrote:
>>
>>
>> On 12/24/2025 12:21 PM, Dmitry Baryshkov wrote:
>>> On Wed, Dec 24, 2025 at 11:18:02AM +0800, Wenmeng Liu wrote:
>>>>
>>>>
>>>> On 12/23/2025 9:38 PM, Krzysztof Kozlowski wrote:
>>>>> On Mon, Dec 22, 2025 at 04:28:39PM +0800, Wenmeng Liu wrote:
>>>>>> +  interconnects:
>>>>>> +    maxItems: 4
>>>>>> +
>>>>>> +  interconnect-names:
>>>>>> +    items:
>>>>>> +      - const: ahb
>>>>>> +      - const: hf0_mnoc
>>>>>> +      - const: hf1_mnoc
>>>>>
>>>>> Same comments as before, do not invent names.
>>>>
>>>> <&mmss_noc MASTER_CAMNOC_HF0 QCOM_ICC_TAG_ALWAYS
>>>> &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
>>>> <&mmss_noc MASTER_CAMNOC_HF1 QCOM_ICC_TAG_ALWAYS
>>>> &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
>>>>
>>>> This platform(qcs615) is different from others. It has two types of sf,
>>>> namely sf0 and sf1.
>>>> The same as it is:
>>>> sc7180 sc8180x sdm670 sdm845 sm8150
>>>> Do you have any suggestions about this?
>>>
>>> Which _names_ are used on other platforms? This question is quite clear
>>> from Krzysztof's comment.
>>
>> The platform mentioned above either has no camss ICC node or no support for
>> CAMSS on the upstream, so this is a new one.
> 
> I did a quick look for you.
> 
> kodiak, lemans, monaco: ahb, hf_0
> 
> x1e80100: ahb, hf_mnoc, sf_mnoc, sf_icp_mnoc
> sm8650: ahb, hf_mnoc
> agatti: ahb, hf_mnoc, sf_mnoc
> sm8550: ahb, hf_0_mnoc
> 
> sc8280xp: cam_ahb, cam_hf_mnoc, cam_sf_mnoc, cam_sf_icp_mnoc
> sm8250: cam_ahb, cam_hf_0_mnoc, cam_sf_0_mnoc, cam_sf_icp_mnoc
> sdm660: vfe-mem
> 
> I'd obviously hope for some unification here. Other than that, we have
> two clean winners: KLM and X Elite+SM8650+Agatti. Yours proposal is
> different from either of the options. In fact, none of the platforms
> have the same _approach_ as yours. Why?
> 

Yes, you're right.
But none of the above cases involved having two hf_mnoc simultaneously, 
so do you have any good suggestions for handling such a situation?


Thanks,
Wenmeng


