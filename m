Return-Path: <linux-media+bounces-43220-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F6E5BA1421
	for <lists+linux-media@lfdr.de>; Thu, 25 Sep 2025 21:45:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E7D177BC05D
	for <lists+linux-media@lfdr.de>; Thu, 25 Sep 2025 19:43:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6014131DD9B;
	Thu, 25 Sep 2025 19:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pl+z1jyX"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 296FF1DE3DC
	for <linux-media@vger.kernel.org>; Thu, 25 Sep 2025 19:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758829525; cv=none; b=EWw8Z+4crpiInz0j2uEhPX2PORkPllGgcnIExd+mB/tFUrH5VErU/trCAKVOIVZx4u47rfqL1VbdJxhZRB9elg9KXXmrRYRwatR0xv1QJn1CPnnaqyq7m7x7GoBFDnhOKuzhX1AGzF22Dp8i8hIfqs2CKZRuUMxY1xydOsqWRV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758829525; c=relaxed/simple;
	bh=1zEu2OmlwcXZazsas1KTl1VcfwBjOaoT3EP8isjLdzI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eDSyGCcM3GRzVtniseJc+MDuvEs7x3HViRsYi9kqTO8jLSTg5cqoRfeVY4Zro0iJW+KiBAwuNaufUGSO3FDHlNVIoO3dPWpy3w8w5zJwaKccOzToDAKMERCuvNn8MNHm+Ow1tfjexUXyuuCLkocz9aRR7lCN6jDz+9Kmf8dhWZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pl+z1jyX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58PIQKhu015899
	for <linux-media@vger.kernel.org>; Thu, 25 Sep 2025 19:45:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T61Tn9AWSXYN6GxmJGVXPjVrhV39tAQxcO9u49rK4W4=; b=Pl+z1jyXkRzTHuXw
	BvJuH7Bn56HtJk7FslnjGr+5hGCjRyzfiOv+holL5N7f/Tl8VyCDgsK2TjzjfRXd
	wt+VQ0JhgcMTTv71CwiEDkI0wiuTPFxoG1PEkM//z9IqKtufssvcM2hMDsaA3xtH
	QqVoSftdb4xmvTP2VIxEGOcF2mG1gmCameXkz4B0lCtOzoFULG1PVZyy/i2++erX
	I1z6VSiTbBkd3qplqn0Ofn7JeSk5697cyyqtwK048ff/BTAkiFLzlMsl+6n28x7F
	GRg98XuTyqJlkk6BkWAUiuzTxGLWZTNEdunWpSI7I5zZkFVVMOgMcuHrjO4c9vwy
	JRF53Q==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0t866r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 25 Sep 2025 19:45:23 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-33428befc3aso1490499a91.2
        for <linux-media@vger.kernel.org>; Thu, 25 Sep 2025 12:45:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758829522; x=1759434322;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T61Tn9AWSXYN6GxmJGVXPjVrhV39tAQxcO9u49rK4W4=;
        b=d78Wgzw4XoZiVtWtycjjGGBheWfrmJDQW4V58yArcw93ofbmzt+c3XCUMyIhr7dyum
         xefP0VUs9gBuriITY9RUZj6z8GWT1MphYrYmtFDCYgv27156sQyA5CIhShj8pvstkuyD
         kpaNr0azWJ64/KZLcJGNQs5hq0kQoOMLu2ZX//vLv6of28b6ohNcRHyuyXqyG39VfJKu
         wJ5l2ro7Ub911q37JEboH0Tefj/8+Hs3UXQqHMj9EKwjarxurvSlS5hobt/mW1JUhaN7
         p8TwEvLtEWhZ+tOZEBOgZrx7EtHmodv0E3R5/ajehgKXtDllI1vsnyAcfgm2jlvESL49
         5a1g==
X-Forwarded-Encrypted: i=1; AJvYcCV+GkJICivjVVikajpa8f1FPaD+AtJkpGW2AMqRoj7sQrdAv6qC2czW3bJ0kB67CdnSlj2xUL93A0gbSA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzy9d1tTJuVMkugvGYyg+8Vuo6lP71eEwIVnIFbywwJnRxU6NGt
	tbIDOtd3Sx0GAglVWY+Cvhogx87N7Qc+3CyB0qiOWoyO5wOt7VdSe8PREs9FHnuRypsO7TLFXHv
	sMdn0twVBhgfa8Xxj1WjTOw3NJi0XP7j525hRJ+BEcGRFxeOAfhmJ3DHJILp4Va8isw==
X-Gm-Gg: ASbGncsDyiT3UhgpXzdlsUmd2pB9jT+Ch01F43euQGLAFrKkpjQLZLvCOjH3bKM6ozF
	EGMLM5k7sLchPCg8/in/KMcRzHq9OFivHBbAXI7VKKCfOGNDjBYIcrBpwB8fI73/q86kKYH2s2J
	dsTTMgdbYYz9V0XyER5I0j4b138VrsGtndjf0P+SG/THz1zkQDPmIEO6d8B+QWc4VekyIxe0VrR
	DhJzQKA2KpIbVLG7R8ZPcjMPz2Ak7CJt5b/TH7cDQZRztNt+X1cdh8AChk8fCNpoEhaqeblhDNu
	RTvWbv2mqcPG4y3Ef9C7gSuTUmG+ha8allEZ+7JtLq+2wIQVMDeyZ/pEcnCzoz4pTFqnGPN2OdA
	=
X-Received: by 2002:a17:90b:1d0d:b0:32d:d8de:191e with SMTP id 98e67ed59e1d1-3342a25964emr5540658a91.10.1758829521628;
        Thu, 25 Sep 2025 12:45:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHRfwJXovOnl+lHkuSFlnxOPjTPUGECyVPSFyJNabv+KOUv3Mo6exOm1jceL+NldToCC5Md/A==
X-Received: by 2002:a17:90b:1d0d:b0:32d:d8de:191e with SMTP id 98e67ed59e1d1-3342a25964emr5540630a91.10.1758829521132;
        Thu, 25 Sep 2025 12:45:21 -0700 (PDT)
Received: from [192.168.0.166] ([49.205.248.165])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33471d71199sm3135991a91.5.2025.09.25.12.45.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 12:45:20 -0700 (PDT)
Message-ID: <6198a56a-dbca-5cce-fcd2-43978e87236d@oss.qualcomm.com>
Date: Fri, 26 Sep 2025 01:15:15 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 1/8] media: dt-bindings: qcom-kaanapali-iris: Add
 kaanapali video codec binding
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Vishnu Reddy <quic_bvisredd@quicinc.com>
References: <20250925-knp_video-v1-0-e323c0b3c0cd@oss.qualcomm.com>
 <20250925-knp_video-v1-1-e323c0b3c0cd@oss.qualcomm.com>
 <nuunkv3xwfes6wed5xf4re2efakndvvrfl4lhmenilkic4sjiy@5cb2f5ygegvm>
 <522d7244-0003-a42e-9be0-1d353df8d5bd@oss.qualcomm.com>
 <oimuo26ohcye74j6rl5hfbmd4ip5wzudhyiaibf74b5zmjb4vl@xh3dnp7gmvq7>
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <oimuo26ohcye74j6rl5hfbmd4ip5wzudhyiaibf74b5zmjb4vl@xh3dnp7gmvq7>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: dxWkV0howvgNHMQTZxiBrc4NAfG_96S6
X-Proofpoint-GUID: dxWkV0howvgNHMQTZxiBrc4NAfG_96S6
X-Authority-Analysis: v=2.4 cv=Jvz8bc4C c=1 sm=1 tr=0 ts=68d59bd3 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=AkZwv1uTgJSVxlfcUQlFCg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=gEfo2CItAAAA:8 a=puI59K64icZz00i_70MA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfX9w95YsT6o8+K
 EKF4U9YoJoUeZ5NS/4AODpDNi7ma0vZQ2u3VNGegJlFEm8FPp8S5Z0LnT/ZMv8zooLpZ01b+puS
 O1nqtwHbZ8bRNWjn6k88KNqqXvQiCBcF4e+eooRYdDrwK0q6RYoKf5L+3+9eUz/YgAWhuF25wlp
 f1tkXwHoj0eiHRDYqI9bzfSSr+CaK9OeQRFWINBtIy/ln0FaF/wKmIQ8aiuuhv5rEWDfKcHURH6
 gci2uB28RmUVj+kjx+IrG8aCLQ5FawdZeFe4rpDf5EXwp3ErEvzcEteRTwKnfhVBXUPnAQU+Rni
 LPheseGgu16DxQ6DlxkYqUrI291OLfblr6BMIEFixXBgL0vbxpU9+z2O+CmIeElBZPEjOnH3G2r
 2BcaVIqmXkNGBtNlt5lY2ECM2RCDSQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-25_01,2025-09-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 suspectscore=0 spamscore=0 priorityscore=1501 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250171


On 9/26/2025 1:08 AM, Dmitry Baryshkov wrote:
> On Fri, Sep 26, 2025 at 01:01:29AM +0530, Vikash Garodia wrote:
>>
>> On 9/26/2025 12:55 AM, Dmitry Baryshkov wrote:
>>> On Thu, Sep 25, 2025 at 04:44:39AM +0530, Vikash Garodia wrote:
>>>> Kaanapali SOC brings in the new generation of video IP i.e iris4. When
>>>> compared to previous generation, iris3x, it has,
>>>> - separate power domains for stream and pixel processing hardware blocks
>>>>   (bse and vpp).
>>>> - additional power domain for apv codec.
>>>> - power domains for individual pipes (VPPx).
>>>> - different clocks and reset lines.
>>>>
>>>> There are variants of this hardware, where only a single VPP pipe would
>>>> be functional (VPP0), and APV may not be present. In such case, the
>>>> hardware can be enabled without those 2 related power doamins, and
>>>> corresponding clocks. This explains the min entries for power domains
>>>> and clocks.
>>>> Iommus include all the different stream-ids which can be possibly
>>>> generated by vpu4 video hardware in both secure and non secure
>>>> execution mode.
>>>>
>>>> This patch depends on following patches
>>>> https://lore.kernel.org/all/20250924-knp-interconnect-v1-1-4c822a72141c@oss.qualcomm.com/
>>>> https://lore.kernel.org/all/20250924-knp-clk-v1-3-29b02b818782@oss.qualcomm.com/
>>>>
>>>> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>>>> ---
>>>>  .../bindings/media/qcom,kaanapali-iris.yaml        | 236 +++++++++++++++++++++
>>>>  1 file changed, 236 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/media/qcom,kaanapali-iris.yaml b/Documentation/devicetree/bindings/media/qcom,kaanapali-iris.yaml
>>>> new file mode 100644
>>>> index 0000000000000000000000000000000000000000..f3528d514fe29771227bee5f156962fedb1ea9cd
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/media/qcom,kaanapali-iris.yaml
>>>> @@ -0,0 +1,236 @@
>>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>>> +%YAML 1.2
>>>> +---
>>>> +$id: http://devicetree.org/schemas/media/qcom,kaanapali-iris.yaml#
>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>> +
>>>> +title: Qualcomm kaanapali iris video encode and decode accelerators
>>>> +
>>>> +maintainers:
>>>> +  - Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>>>> +  - Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
>>>> +
>>>> +description:
>>>> +  The iris video processing unit is a video encode and decode accelerator
>>>> +  present on Qualcomm platforms.
>>>> +
>>>> +properties:
>>>> +  compatible:
>>>> +    const: qcom,kaanapali-iris
>>>> +
>>>> +  reg:
>>>> +    maxItems: 1
>>>> +
>>>> +  interrupts:
>>>> +    maxItems: 1
>>>> +
>>>> +  power-domains:
>>>> +    minItems: 5
>>>> +    maxItems: 7
>>>
>>> You are sending bindings for a single device on a single platform. How
>>> comes that it has min != max?
>>
>> I was planning to reuse this binding for the variant SOCs of kaanapali/vpu4. If
>> we do not have min interface, then for those variants, we have to either have
>> separate bindings or add if/else conditions(?). Introducing min now can make it
>> easily usable for upcoming vpu4 variants.
> 
> No, it makes it harder to follow the changes. This platform has
> this-and-that requirements. Then you add another platform and it's clear
> that the changes are for that platform. Now you have mixed two different
> patches into a single one.

you are suggesting to add new schema when the new variant comes in ? there is
also a possibility that this hardware(kaanapali) can be used without those
optional power domains as well. Let say, someone does not want apv codec, in
such case, that pd becomes optional.

Regards,
Vikash

