Return-Path: <linux-media+bounces-67096-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +q5OG400T2pTcAIAu9opvQ
	(envelope-from <linux-media+bounces-67096-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 07:41:33 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E32B472CD0A
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 07:41:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Q2fsT9wP;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=c8WAFPMZ;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67096-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-67096-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 084FE3036762
	for <lists+linux-media@lfdr.de>; Thu,  9 Jul 2026 05:41:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F6263AA504;
	Thu,  9 Jul 2026 05:41:08 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F6793A8384
	for <linux-media@vger.kernel.org>; Thu,  9 Jul 2026 05:41:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783575667; cv=none; b=lxmEfqAarISUSP3AxsfUD0/wvRkJfzDNaU9hE5tthHX6/xvdIaGCWywEwN9H9ptxEwPPkv7CMI5Ix8hGQFAHAToNxy60Sv75se2CAGxujryVeT8nyqK4IWP4LOZnTnmJSUKYoiLVGPHakueb9LfBb9ySGNQX6BtlEX2nP2Ia3EI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783575667; c=relaxed/simple;
	bh=quwu+cde7ba9hLMTE61fx30w8O+wPuSVUmWVKkQQ6Os=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kjjjKkMxDvBVy5vOowEnQ1oQ3WTypBMGtEmv9oib9zVrcKllEcSh122gQLSLizdKoXI5asBXEaW3v7691IVRV6OjCi4qpMKT6W3SIDi6qpHgHNKZ7xBzkFZ6W3HOKezpbLppiEfU059xq7fDIPmxBHE/bdYZxSoHzzHNFo0Ht1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q2fsT9wP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c8WAFPMZ; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668N8jYd037298
	for <linux-media@vger.kernel.org>; Thu, 9 Jul 2026 05:41:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HZLxGrfv7jXMYi1H20L/RrftdACB9MvmvKJ3YlkaKUI=; b=Q2fsT9wPtj5O6eRf
	E8YJCbyH/MIPaL09nP/thMyB4RchZvgx+2eccLjmGsS1+nPAJ7dyc1mG+TvYYI9X
	L0FeCJrYXfHINLWu4iZdPSXh4/CCtF4mTNWPYloLIJTf9+hFmw/9q4zD6/dnWFXr
	Y3dq72GI3qhfIwgCJSEr3+oNJxmhtVPv5ROaGfyqYFz0C+tjXiVZsduiV8k9IfjX
	+owwq/+zQlaegU7lx6y2sRPsacyA0Li4fQEJ1A4Wb+9DtZVViP0X5Mb7e/1F2hk1
	I9luw73dq8OwQb00etk/lfbwmT+Lu6GBRP+4DIRJCFIiQJJ45ullW/QDvHEJc5j2
	Gw/R/w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9ug6j2q0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 09 Jul 2026 05:41:04 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c12e43b98so19115531cf.1
        for <linux-media@vger.kernel.org>; Wed, 08 Jul 2026 22:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783575664; x=1784180464; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HZLxGrfv7jXMYi1H20L/RrftdACB9MvmvKJ3YlkaKUI=;
        b=c8WAFPMZvO3N8GxXsjfTBvd8CzHXcyG/CRRBp2lGc4urhXs6OcAteuGhkkKSi376Fa
         OwXwkt0j6g5kqyL/pqJYLpqOtd/IPSrd6rzu+YlbCPJVjEtwX/R0/cmHdLxhJrtJ6R7q
         ApHaQb85Jedkdz4xGfISX73+s4JHBIgem7p5KIxOo6PdNPa6TYpscrClNRCi5cGvjGix
         VT6xQgOKQRVP9bKmuJN249SpLFXEbT42mcvDI5YVQGmLvdoeFUrMtNNIkvHGlgfCNon+
         dE/VtDhu+01rdsJNa+UJQvWmm1bxeGOPlkMRAZ6yGeT+YQxYhXjQP4JKxgIYYm4gSw9T
         NtLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783575664; x=1784180464;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HZLxGrfv7jXMYi1H20L/RrftdACB9MvmvKJ3YlkaKUI=;
        b=RvaDgufyL9TediONkEM9RTMmYN6h9hZFwD6maL28A95TEXkA2iFYff+QggVCeU6/xN
         TTCP6jLRIGtjqS9KzT+u/arII+1/lQtZahvRXO0Y+QDwN3aut6MGDBuw919HjyGVmQYh
         kPP5lxrZrKxu15brZEEbhYmdbZD/ydORj/MC5yDIpTg7QY2Hes2dpiaR0Ak1jztvxaRB
         4jMOl4jguUd9DrQNDvnQ9IumfDDSbw6wzQlndnNwy06vc0JkPtRUDt1JfZ461/y6df76
         tLFDR1F2lR7/QchPpgSCuYq7OsLLhE0rz+zLZDAlDQDuVIP0reFVe3AelZAWo2ZqM/B8
         s69w==
X-Forwarded-Encrypted: i=1; AHgh+RovOMnpdWle8ot7YssbvKXDl7eGmdLV4HtBP4yBN4KS0RWmkR/jtqO3L/caJy3CVPqIJTlsniE/EMFgaQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxRw9Hd708mjWi4tAMWD1EvSOv4GsYrqjJfUXMMw6q7mQvsL+yy
	pxIfDl5zBPSywkqzQlLirvez0sXUyPZ72xBrihosaDU0klB+DGny69G7eTuSTBPuwPy0RQFkSdo
	Y+EuaoibbssgDJXP+q9l9aENWg9LMdc63/ntCq9MynpkHYv0NQX984tg5qIZjNRLDjA==
X-Gm-Gg: AfdE7clcxgeKPPXyJPcKjNaMWdXaqugU7Qmi7pJi0nVymoNCcgZzRUzWC7qLjRCFwID
	g3G/8y3iiGSvy5ldFgUuNnLSiTjsAovdwO7TdXSk8FbrMjfCCOTdoksRgxFr7qN4ulTBfb+Zn+O
	pbNrgl/FNmWc7UjYFSoYXqMQuvdYhOqLajkR1n3OqeWgd3/WZ6klxlo4ryemnvabtmLlZ7g2n+t
	oYemM+pNWsgdSZvAywsnkGBmSdw2Vjsyu069htTnbRsgexbEZzx0ae2D9PNrLQeMlUaIbyC90nn
	RfwfEuGNo2HYdhYM//hwAbf0kGGoj0+2Zwe2LsbKhaKnVltAvus40p8EBJDwlb9ZUUiXwKaLyFO
	KKQqeM8AxS3/tHvWPv4b3ztN5Oe1yruhnO13x1CE2uBMCGRqPucS4940PgyH6m3Zu7SCxRhArqw
	xhEuoMZE4=
X-Received: by 2002:a05:622a:5599:b0:51c:14f5:8f9c with SMTP id d75a77b69052e-51c8b2e3578mr59044211cf.27.1783575664301;
        Wed, 08 Jul 2026 22:41:04 -0700 (PDT)
X-Received: by 2002:a05:622a:5599:b0:51c:14f5:8f9c with SMTP id d75a77b69052e-51c8b2e3578mr59043881cf.27.1783575663835;
        Wed, 08 Jul 2026 22:41:03 -0700 (PDT)
Received: from [192.168.1.31] ([85.196.172.179])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15e2936b42sm64059766b.21.2026.07.08.22.41.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2026 22:41:03 -0700 (PDT)
Message-ID: <a80f9d60-e1be-45e9-b601-c47361591f52@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 08:41:00 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/5] Add Qualcomm JPEG V4L2 encoder for SM8250
To: Bryan O'Donoghue <bod@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        linux-media@vger.kernel.org
Cc: loic.poulain@oss.qualcomm.com, mchehab@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260706071113.383215-1-atanas.filipov@oss.qualcomm.com>
 <68e59764-5a10-4abc-849c-14ea2d9ef76e@linaro.org>
 <d74d7839-d126-427a-b151-ca895a27a83e@linaro.org>
 <437d1eb0-4495-406a-9501-b0515cfa3151@linaro.org>
 <e04cb9dc-76dd-4fa8-92f4-be002bf7ee8b@linaro.org>
 <8116c54e-4050-4e9d-b236-59d74846bd57@linaro.org>
 <8a09875d-af5f-438b-b947-bc2b61219b70@oss.qualcomm.com>
 <c8c38ec6-4422-4c91-a249-20bc20260e73@linaro.org>
 <d0768c15-453f-4d3f-8110-886a5c697b02@oss.qualcomm.com>
 <d5407ab1-1af7-4678-ae67-5cf30ce8fa4b@kernel.org>
 <VoXmpDKdgY_XxAvO5tkDze4jpmMzSuKTmIISTejJsbIO_FIO1JFfUBlaPkNdb14E95zf_qwtDB6myQ2wdRCh1Q==@protonmail.internalid>
 <8fc1ddfd-0f77-4b67-b9bd-33fbd60e2046@oss.qualcomm.com>
 <54ad9b8a-7596-4bc7-a1c3-7230cca21360@kernel.org>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <54ad9b8a-7596-4bc7-a1c3-7230cca21360@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDA1MCBTYWx0ZWRfX6V2fy6wIW56k
 COCYo+lLO6H9n9QTMW3DeY8Tk6juNqMLyO+b2eYDW7QFxBbwgiqaNwPlUP6NMBp0RAJ548N/UjG
 ZmYHHzx1nZ+Tfu/fzXyg4GgH2fENhhA=
X-Proofpoint-GUID: UZzOW-4AyY21k_w2fg06cTjFQMNMp1Vr
X-Authority-Analysis: v=2.4 cv=cL3QdFeN c=1 sm=1 tr=0 ts=6a4f3470 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=Q/e3f29T3Hw2hnAEzBPF7w==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=CVLRNxM7UcJW-wxj-VEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: UZzOW-4AyY21k_w2fg06cTjFQMNMp1Vr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDA1MCBTYWx0ZWRfX6Si2FtGDqneJ
 9sc7xZ+CfKNMD1LQ1Wizb/7vT9blcg+ZkOMWZt4uPlOwNVs8moOSEmSToWDnrYhiBgr7ImBz5QJ
 QVY4j70PrXwk0pNaCb0Zd0FInBV4MW4bxirQSYh4ZJn5H87AbgBGXR2OBuIutciXWJOvGYgmfc0
 L8EMAPoGFYrieTbQRREIRR0IdzI61yXDJOXluXuAS61QC503UZViYGxYknHgzIF2yYk/UZ/Q2t+
 uWM5rNOiJO3HdwzajjopmTtDIIgpMdRvYXToN3VLyOS9iBffPNqkuRfSRwqM1WRaG2h3DlpDrj+
 9Ln/KOkQ4oMHR8P7rYlF85Zbqkk98W50GiaxVzyLu1brl+D5kR503sDB6+MaRxqkjTeXygZSn5b
 EV/mhIeToCyM8lUBsWkC1j6we7RlKe4rZv8Xgx47jCYwbLH4sjT/tigV3PHebzrYeayB9NUQw/+
 QWzunqKqM30rHSDZGZA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_05,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090050
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-67096-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:bod@kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:vladimir.zapolskiy@linaro.org,m:atanas.filipov@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:loic.poulain@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[gjorgji.rosikopulos@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gjorgji.rosikopulos@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E32B472CD0A



On 7/9/2026 12:21 AM, Bryan O'Donoghue wrote:
> On 08/07/2026 13:19, Konrad Dybcio wrote:
>> On 7/7/26 12:41 PM, Bryan O'Donoghue wrote:
>>> On 07/07/2026 11:11, Konrad Dybcio wrote:
>>>> On 7/7/26 12:00 PM, Bryan O'Donoghue wrote:
>>>>> On 07/07/2026 10:24, Konrad Dybcio wrote:
>>>>>> On 7/6/26 3:37 PM, Bryan O'Donoghue wrote:
>>>>>>> On 06/07/2026 14:02, Vladimir Zapolskiy wrote:
>> [...]
>>
>>> OK, I can see how this thread is confusing.
>>>
>>> The idea is to start to declare sub-nodes "on the road" to making camss into a bus. The legacy binding we have is really for the IFE domain - that is CSIPHY, CSID, IFE.
>>>
>>> Right now the camss binding describes those things - so linking say OPE or JPEG back to the thing that describes those isn't right.
>>>
>>> OTOH we_want_ to make the top-level binding into a bus, we've discussed that several times.
>>>
>>> To transition from monolith IFE-domain only, to camss-bus, we should have the sub-nodes fully describe themselves as "camss-bus" doesn't exist yet.
>>>
>>> Once we have compat="camss-bus" then fine, make that linkage, I fully support that.
>>>
>>> That roadmap BTW is why I'm asking Antanas and Loic to make JPEG and OPE sub-nodes of camss - but make them complete sub-nodes - power-domains, clocks, nocs, including the TOP_GDSC.
>> I think this needlessly increases the amount of combinations we'll
>> have to keep supporting down the line (with a ton of compatibility
>> boilerplate code)
>>
>> Konrad
> 
> Fine.
> 
> Lets drop the bus idea then. I'm happy to close the conversation as peer-nodes.
> 
> camss@{
>     existing CSID/IFE
>     IFE SID stuff goes here
>     power-domains = TITAN_TOP_GDSC, IFE_GDSC
> }
> 
> csiphy @ {
> }
> 
> jpeg@ {
>     JPEG SID stuff goes here
>     power-domains = TITAN_TOP_GDSC, JPEG_GDSC
> }
> 
> camnoc@ {
>     modelled as an ICC provider and consumed by
> }
> 

I vote for this as well. For me having resources at parent side which are already referenced counted, is
not justifying the complexity we are adding. Another argument is that i don not like the exceptions, either
we move every hw block as child device of CAMMS including CCI or go with peer-nodes.

~Gjorgji

> ---
> bod
> 


