Return-Path: <linux-media+bounces-49439-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BFC71CDB3F9
	for <lists+linux-media@lfdr.de>; Wed, 24 Dec 2025 04:22:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 433E130CC7EC
	for <lists+linux-media@lfdr.de>; Wed, 24 Dec 2025 03:19:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 011353126A4;
	Wed, 24 Dec 2025 03:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EjpL9JC4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RJa6W/Jv"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ADE42C1586
	for <linux-media@vger.kernel.org>; Wed, 24 Dec 2025 03:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766546303; cv=none; b=HM9gkyRdczh4JzH3oDk1WQ+lOxakc9YyhQ8YRkVmBrSSvQoqalc8Ki9t7ZCSMukvGPDgVm4KDm/bPuVpCs7tYHkftBp9X3tg/oa5pyeqxG3kLBihAfGAltSigpDthG0ZRuexNnNWOJEHD6y1XzO6L7i/LH8RFi6EDkOjhblRec0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766546303; c=relaxed/simple;
	bh=vzkejSaCXJO6srXI9a9a3T5MG3aVvCRbaz7MNxvZ458=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JThBtRyjldcqT+GejAmrmx59kloxIm/kprM2gK+96i4El3pBs+ViOguZW0Q6ZM5Ph9xDOOscJdrwHRYJUB1mCyk1qmiO677tl23dRasaP09TVSKeoXb7wXyBkvU5jzhmESWzwnFV1zmO7aiiRB52rVOIWLe6kC6EYiP8lCVjeug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EjpL9JC4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RJa6W/Jv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BNJriCF721977
	for <linux-media@vger.kernel.org>; Wed, 24 Dec 2025 03:18:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aaaT/MtsLg9/MTGw8soOQU5G/mHt56DgZFZKOaqo0YQ=; b=EjpL9JC4Z1HIzt2/
	McLlhVTR11aGdIhMqEZbB2qoO5m1NGLs/g81ipH0/oaktbZi7aiqeE4wS6J5h4Ki
	o/Xdv+c+o1wTwFh2QPJopZY/9FFAwHE+3R2kOz09XFdNfuo55tZJv+R5WbWrAdBD
	binDNVs59DND9iErwDU77actiKlWgs25uReyQgrRQ0pZM3rVI4EXKBwYxceDnWDs
	ikJMhsjAyxle0/wIqUNjpf/D5ROx9x6/h/Woo2KWQrqbdrgjEQChey+f5w3P0H04
	Xnu82BWmGfAMHbjeiAWtPuPY5ui+o74PCYraYoajhdYf8214gljUwYf4XpEPtoMg
	9fBeRQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b81mt8x84-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 24 Dec 2025 03:18:12 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-88a47331c39so142122676d6.2
        for <linux-media@vger.kernel.org>; Tue, 23 Dec 2025 19:18:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766546291; x=1767151091; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aaaT/MtsLg9/MTGw8soOQU5G/mHt56DgZFZKOaqo0YQ=;
        b=RJa6W/JvD7I5IbzTIlg1n9BIICtfM/v/ai988eTtvNIHOxVN+07E5ayHPtUPW2ck4e
         ipDXGteFz4DfauseXnYPwT2TvJNYwUSRld0gEbu59YZtzygMdjJYboS525LSGl8gPJwy
         WuwgesnS4+c5T3yhnkuSCVhUtyB6w+rE/65pY4zy3QDPz1S1N0gsCwdMqo8Is+v1+mYn
         cAZdZtRErJw4TO6Yuljsrvjw2o/vE/hqGTLfqwnXdpwpXBSQfBG2y8JlMenLGYzjV8TQ
         BF2GQUGk7GRNf3IOOq9qorl5z8NJLtTaFvtxn28Z7/d7eCY0Y9gKNr+yY5XyjnI+Hut1
         BoPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766546291; x=1767151091;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aaaT/MtsLg9/MTGw8soOQU5G/mHt56DgZFZKOaqo0YQ=;
        b=tExlIfa8CJnKrjsBpFWkeSCcXYQdvTeK88enI/dGKfwRG6jntfurAiudiWpp5RR5Gl
         L0FAB0vQ+w556xrrD5dlntYYVX+kK8ixbKf00HFoHmtqoJvC/qvgUujFaG91mDJrY9BT
         huZ1ojqyUzT6S5+LHrIkL/mmMWcROYD+BwN4mKAFqLwB6ucWfOBG9dIV+knAfo3hyWeB
         wH8f9EM/Pb41I61S+8zjse+3Apy5XgDrPq38ozqirA01LAnc8NAWrHGbO0GvIaKqUwFs
         Q6xmmEqwtLj5z1cUYjz5qnjlvT95EqJNAMoGTYMnV6St4TKejC1DDDa7T+XZQW+ZJcYA
         sEFg==
X-Forwarded-Encrypted: i=1; AJvYcCXhtQAf+A+CR5IArti0DDcDX81Sr1VyLgUFJ4jzccRj5wSd0ccSr7nhmoLmGci3y3p45Zbzmf8WiLfM3w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxlLQlTkMfKZNANCXdqLTZkTMRTWWqE1ZpQ89vPbwGvE3uQfkqb
	G06RRqEpUkqVO9Qm1JN5Z7Ze4jqKc7exGKRUM33mATUzKKwv5/t/famY0qudPZC9dfR+9bKY2Ai
	fQDVcVy5pC5oUGz5P94R/2ss2lQZtV83DwZWjG7WqgNFSRJteOH1oSwZuqsdaNlmQaA==
X-Gm-Gg: AY/fxX5mTfsSyuuMRTN0wXyl+i2qMLcCDp/ewVFfAolcHyZmaL9J/kJ8AFvPp414J/Y
	1qvfdvn1YNX7SQa7LuHjYnN2roREaMDyzyxKctNwY/EGgd7zCl8B1LybYImW912d1CvoEG4C0be
	JYC0g5s2Z4dcTO9IAJrYnH4paECF8NWANqw9v+hahp+PO6lagfxAKm3Hn+6BTIO4g/NnnnjnkOv
	JOGaL6Wdh1Hwi00WeJpOfUxHxKF+vz27jBzsQuW5k3Nwzlkmw6cMup2NzMMCb/AOaKoxqKoIL3a
	pZu94apy1sqIz15oleQ9hOiRd+RHFbhmOPLtXc/sTcASFjepU6C2med66pShxtD6cXKu4nMGS05
	ixBAVG9wMNWyK9hW2uQ+qZwjfGe6OQjDaos8LythMARcP5Ykp8SOvcrBvjJpkrvETnix9nlzZpg
	==
X-Received: by 2002:a05:6214:178b:b0:888:24a3:a9f8 with SMTP id 6a1803df08f44-88d8166a0e7mr225479686d6.7.1766546291429;
        Tue, 23 Dec 2025 19:18:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF8XqDvxhmkUIG4JdHxx/10hJu4RbVFpkdEr60MvodJNZ0cdFzM17vLG27WZrE1k5cxRLcipQ==
X-Received: by 2002:a05:6214:178b:b0:888:24a3:a9f8 with SMTP id 6a1803df08f44-88d8166a0e7mr225479406d6.7.1766546290853;
        Tue, 23 Dec 2025 19:18:10 -0800 (PST)
Received: from [10.111.161.169] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88d9a83f6f3sm121631886d6.55.2025.12.23.19.18.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Dec 2025 19:18:10 -0800 (PST)
Message-ID: <c6174a0a-9a76-4284-8675-bb5ca78a7b35@oss.qualcomm.com>
Date: Wed, 24 Dec 2025 11:18:02 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] media: dt-bindings: Add qcom,sm6150-camss
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
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
Content-Language: en-US
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
In-Reply-To: <20251223-pompous-inescapable-sponge-3fc9f0@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=e/ILiKp/ c=1 sm=1 tr=0 ts=694b5b74 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=UyieoiCksbjufx2AMFMA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: xNJZgaXGnhJ3NEDUcJm1zrv1KmwrdFD6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDAyNCBTYWx0ZWRfX2cC+nEQ01KAE
 2RpQkzlplKt8EiQvTfoQVoAv54Hh1BxJyEDslrLcclU47f82nHdLukiDYrHn74kL+cmhYldEg1B
 D3/NzTCMyrEYR6plu0jegNakpsmiRG6HTr6u1AKl7t8wL93C/0G2IWVz6Ae0+ol4QyrERZ/3vkZ
 cx7TPZnlCRKl/isLaGN7mmoE4XsS0G5c0esgmeSGzJ77Cu/v+3+oSdTiZ+8FoCAdYE2+gp6H15N
 VRwoai7DfPFI1YdUpBWtyEne+i2X39iLVuBqMJE2bzltqVXRJDt79UlRh/IMSUOCCTCynpt4At2
 nBnhtcSb/Cl4Tacnreecsdc9gNBZ3mV3pClabCctWSiBiEt0cakj6UD+IGri70ajYQLg/HoQuA8
 zuuZG7qYkRGWdJKE6oyOEZgjjFZmywOn2Q+SWDLJ1L+2zBu4h1prulU5mrTjLSikbsvKbB/KK/K
 7/hCgWXuOSnsLEA2Lqg==
X-Proofpoint-ORIG-GUID: xNJZgaXGnhJ3NEDUcJm1zrv1KmwrdFD6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_01,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 adultscore=0 suspectscore=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512240024



On 12/23/2025 9:38 PM, Krzysztof Kozlowski wrote:
> On Mon, Dec 22, 2025 at 04:28:39PM +0800, Wenmeng Liu wrote:
>> +  interconnects:
>> +    maxItems: 4
>> +
>> +  interconnect-names:
>> +    items:
>> +      - const: ahb
>> +      - const: hf0_mnoc
>> +      - const: hf1_mnoc
> 
> Same comments as before, do not invent names.

<&mmss_noc MASTER_CAMNOC_HF0 QCOM_ICC_TAG_ALWAYS
&mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
<&mmss_noc MASTER_CAMNOC_HF1 QCOM_ICC_TAG_ALWAYS
&mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,

This platform(qcs615) is different from others. It has two types of sf, 
namely sf0 and sf1.
The same as it is:
sc7180 sc8180x sdm670 sdm845 sm8150
Do you have any suggestions about this?

> 
> I finish review here and ignore the rest. You did not respond to
> previous comments and I do not see any improvements.

I'm sorry about this. However, the previous comments did not clearly 
point out the problem.

> Also, way you send patches makes it difficult for us, so I see no reason
> why it should be my task to try to decipher all this.
> 
> b4 diff '20251222-sm6150-camss-v2-1-df8469a8343a@oss.qualcomm.com'
> Checking for older revisions
> Grabbing search results from lore.kernel.org
> ---
> Analyzing 5 messages in the thread
> Could not find lower series to compare against.

--in-reply-to, will pay attention in the next version.

Thanks,Wenmeng


