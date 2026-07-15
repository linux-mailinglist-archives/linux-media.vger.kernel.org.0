Return-Path: <linux-media+bounces-67629-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id LqlBET9BV2q8IAEAu9opvQ
	(envelope-from <linux-media+bounces-67629-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 10:13:51 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D067575BC5B
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 10:13:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=B2WS63Ov;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=CG6vH4WT;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67629-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-67629-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E9B69303CE1C
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 08:12:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 468993CAE70;
	Wed, 15 Jul 2026 08:12:00 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D1493C3C0F
	for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 08:11:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784103119; cv=none; b=oJdiM5BwSxcu4IUZCyubewU/SNG66Gc1iX8l0L+HDnXXAfkEMiQQUyIAkmAC1RjSR3xq5kllnA/lSPhFgttjxZ5FArRqJ63S7mhWuOhRkbi8xQNDbLE4VZ5DA37sgdyvfgapZ0npxYLEBOnBrNfdb1IJUO90Lswspn97qHM5LFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784103119; c=relaxed/simple;
	bh=Dn3AlNjz3WzHd2KHxN/GexTbkYP6o4IWjElyvS7sqIY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m7BiSiF9H537Skj6inMsTTW80od5ch07CuXnnxi+YThjF3Q12ojYW0wlt0dKzODt0ESfT1cvSNxX4umwm35ArZHMcZvp0KWM1GZyX3ijGvLq6exYnR6zQEByUQ3h5/txW1hOy9bsaR9W2qyY6aP1Hr0caVIT6aBj3Yse9j5STKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B2WS63Ov; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CG6vH4WT; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66F3l5xS2679725
	for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 08:11:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Dn3AlNjz3WzHd2KHxN/GexTbkYP6o4IWjElyvS7sqIY=; b=B2WS63OvFMmtHXUB
	BxrUqzEQxoKZYvtsum9IcOUP1tqNDNEcu2pf9LZDaMVeJA7nVTgCCaZieHfAZr3z
	0ykb++CHV0InE7TJe0FI4A8Svd3cp9MIGQtqgGu82FYWvz1nNYuLf2i5flPkehy8
	LoSx+BPy1W/XobhdPoKkO7wTtlZH1rvyL+l1rwHhC52oQKuEct9GgoYNL4evOw9k
	N0go0UvDgBbJK+0ltA3kjkcy+GJSLFraVIlVXzmdzi9Zpq2JWQ5wuWOAvHqQpWnI
	2WKX5Umjr2GRuxkGdXkcnSzO/6lBcB3+VQ4zYBoqIJPuPxzacf9pxXI+0l/SrSqM
	epH/mQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdnnuur30-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 08:11:57 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51ebdfceddcso2555161cf.3
        for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 01:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784103117; x=1784707917; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dn3AlNjz3WzHd2KHxN/GexTbkYP6o4IWjElyvS7sqIY=;
        b=CG6vH4WTD01bgiYJmJtUR4HG7ZUtpnmWEaXNF0Q7gXdfta8GmPFM3Z18/NO26NWRjG
         A+biH7TUnLidKrv0bl7F8/eaABros33Da7ViF32NjxOH/aBOogg3R40X5C5xXGIcYTmB
         nvQZS1T9FAWRCDXJgknTQbaF8ICXAgsoUAqZEh9zfikQkVfh1IB5c3Mt0AaZADu9hnbu
         DZ9TquPGeQLtM9u+KbZdkKBs+yiRLOsccdlcP+j7eU2awiu4yRQs30U1wlxe4az+ykXR
         sc3nV+q6t7W/halIA8GaS5+GJyfdlYuygh9FqiSvW+hm4lzT0Y3w447wPndEaupslpFy
         VmyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784103117; x=1784707917;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Dn3AlNjz3WzHd2KHxN/GexTbkYP6o4IWjElyvS7sqIY=;
        b=UBiynLuJu+SSAMESeR0dHxeOUYGWbFsRgPOjhK63iXKRZZRGuSLIfacK+Ho9/7n9mc
         rtvenr2bFwhZ+er0yhNaZBGOLEqN4f3Ube5Qxl8sNm+GbJDwHYfSBB+6SzIw9peKLfw7
         kIpnrbqLg0vJ9DpdXS7jPX2SEqCw6O+kUV75KQGhS+hZgev+olcgjKbJV1+HXv+7WUa8
         NP4lLrMW/sCW0PPciber99mh57jNrzFnG5XLFbyE9hvnZfDdjojP0+WCyU3XE5rH3dS3
         79AtlLBR/VdxvhR1uJne00sPfMNrVHLbbNA00Wm/dKxNI0iGcAnzg73ESjxUh/X+wjb+
         3I2g==
X-Gm-Message-State: AOJu0Yx9AA/7H0hp2L73HQIEG0JuyTDherv9r3zGkfGhmSpoX+KaxwGB
	/K+akQtafr4PwoCo/EuTcFt3AymB7K+KZs9ZJRyq9fLiTqKdBu+JCL2aA3co2YGwJmNIG24G2u8
	96ZX10ZP+sW8j4b0iLY3MxRUU75IztfkunA/DpU70QcC0kMGnixVZA/s+Qnuohffyfw==
X-Gm-Gg: AfdE7cn2H8lVoyCVp+w714vAD5WT2WLC6kz2I/92XQ56heLMXD3Yf6/iNfcsW7x5uPz
	K421BYxUJHnPnK1CjkjaNie5p1bfFTP9TIa+oTYG/xj/zYUjI+nI6kpgPMsyLcIlwkyDl+Rk8oQ
	UluPzPifyiVgaJR2wRV2amNSvC3xAeou/gukhGJbR67q9leXBypYjh0ti0JXXC0gK5AVD/5JWBC
	p6mcIxeDFRI68YUG655bsf0aL3xnMq2iK98aPkpmwGssAgqLvu7u5mG1HBmMF4J9x6nc27pIBUW
	JuQnZHlS/ozzL7TYiyCYBMCafBV6wJ3WKk3hcNPWCsygiY3NJ83j1RIhf4Z98yIn93Woy/jt3ew
	GrDdO+XmekdkT1RAnuh1KBsLFp1z/OY1OuSCdT3nfZw7sejiG7Fc5Wc+q72aN5JEuygx+tva2M+
	ehMANKcp7B
X-Received: by 2002:a05:622a:15cf:b0:51b:f40b:2fb3 with SMTP id d75a77b69052e-51e4ede80d5mr17803951cf.9.1784103116613;
        Wed, 15 Jul 2026 01:11:56 -0700 (PDT)
X-Received: by 2002:a05:622a:15cf:b0:51b:f40b:2fb3 with SMTP id d75a77b69052e-51e4ede80d5mr17803691cf.9.1784103116215;
        Wed, 15 Jul 2026 01:11:56 -0700 (PDT)
Received: from [192.168.25.64] ([94.155.124.210])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15beb53b86sm1142891566b.25.2026.07.15.01.11.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 01:11:55 -0700 (PDT)
Message-ID: <61d147cc-9baa-4304-b03a-beb342faf690@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 11:11:53 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/5] dt-bindings: media: qcom: Add JPEG encoder binding
To: Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-media@vger.kernel.org, bryan.odonoghue@linaro.org,
        vladimir.zapolskiy@linaro.org, loic.poulain@oss.qualcomm.com,
        mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260706071113.383215-1-atanas.filipov@oss.qualcomm.com>
 <20260706071113.383215-4-atanas.filipov@oss.qualcomm.com>
 <alOpwQx-43WNPHcL@baldur>
 <ecf8cad1-47cc-4b07-bab2-d0fef6648bae@oss.qualcomm.com>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <ecf8cad1-47cc-4b07-bab2-d0fef6648bae@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: HAGBjIEwEbQlgRLrSZoTw0Km5p30rkf5
X-Authority-Analysis: v=2.4 cv=E+v9Y6dl c=1 sm=1 tr=0 ts=6a5740cd cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=eGCDHFSXubCXFTSSGhjuOA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=PfuqhoIL75c5hKM3NgMA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDA3NyBTYWx0ZWRfX8c1HXlSCybgM
 XKl3RrpAtXqLeqSNrKSV1wfYpPhvUWAFyhTGc192lsdlsz2bBkK5AfzX25O11Vaa3Cqlbqfobdg
 fUKYEuYyB9DuccRQ0k7IrX3lj+gG/d7C8+sVPT3y4uSVZdlQJesQUYYjIFWeZ2FGmp8Ts8PDZB2
 /HRn7iZaAR3HUcQwfOmlSNuzBm85g7guxn2BhkyReMve5g7/xPDjgetK397yoj33jfuKdl67Dvn
 VEwthedTl+XcvKzwAN1N5TQYRRLk5Nc0fRq2/ejp8D4zKsXVEzaa5QfCj/QKk/1ELn9XoSAtkGa
 Jnqs+IWjp0bcHzE2RnKRN10EcahcIC5Nm2l6JPrryhQttU6w1KFojCVjDrbBvZRMsMKfY9Aklm2
 5VBI3pMoDIv0opwh7szD/hwUi53VH/jvup/V1YFQhLZS1vWPDymCVrk99s74ID0cFmJijMhfOkx
 bMKdEW3j3p7PWw/OP8g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDA3NyBTYWx0ZWRfX8X3stzyqkCeT
 CgKs18Hs9wdv6SS1Pta8+V8f40L3i9KRglqNKBlBmZ7r4jhWV/uMGP7MubQVXIBrIetqg/rBhxx
 PNmKpEWP52gPjVP+mTnIk8ELIzXZq84=
X-Proofpoint-GUID: HAGBjIEwEbQlgRLrSZoTw0Km5p30rkf5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 clxscore=1015 bulkscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150077
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-67629-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:atanas.filipov@oss.qualcomm.com,m:andersson@kernel.org,m:linux-media@vger.kernel.org,m:bryan.odonoghue@linaro.org,m:vladimir.zapolskiy@linaro.org,m:loic.poulain@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[gjorgji.rosikopulos@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,devicetree.org:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
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
X-Rspamd-Queue-Id: D067575BC5B

Hi Bjorn,

On 7/13/2026 11:38 AM, Atanas Filipov wrote:
> On 7/12/2026 5:55 PM, Bjorn Andersson wrote:
>> On Mon, Jul 06, 2026 at 10:11:11AM +0300, Atanas Filipov wrote:
>>> Add device-tree binding for the Qualcomm JPEG encoder hardware block
>>> present in SM8250 (Kona) SoCs.
>>>
>>> The JPEG encoder is a standalone hardware IP within the camera subsystem
>>> that performs JPEG compression in memory-to-memory fashion.  It is
>>> separate from the CAMSS ISP pipeline and has its own register space,
>>> interrupt, clocks, power domain, IOMMU streams, and interconnect paths.
>>>
>>> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
>>> ---
>>>   .../bindings/media/qcom,jpeg-encoder.yaml     | 151 ++++++++++++++++++
>>>   1 file changed, 151 insertions(+)
>>>   create mode 100644 Documentation/devicetree/bindings/media/qcom,jpeg-encoder.yaml
>>>
>>> diff --git a/Documentation/devicetree/bindings/media/qcom,jpeg-encoder.yaml b/Documentation/devicetree/bindings/media/qcom,jpeg-encoder.yaml
>>> new file mode 100644
>>> index 000000000000..e4c16388ef07
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/media/qcom,jpeg-encoder.yaml
>>> @@ -0,0 +1,151 @@
>>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/media/qcom,jpeg-encoder.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: Qualcomm JPEG Encoder
>>> +
>>> +maintainers:
>>> +  - Atanas Filipov <atanas.filipov@oss.qualcomm.com>
>>> +
>>> +description:
>>> +  Qualcomm JPEG Encoder is the JPEG encode hardware present in Qualcomm SoCs.
>>> +
>>> +properties:
>>> +  compatible:
>>> +    enum:
>>> +      - qcom,sm8250-jenc
>>
>> I suspect you find it obvious
>> that this is the block than is used to enc the js, but I don't.
>>
>> We have space, can we please use some more letters here? How about
>> inflating this to qcom,sm8250-jpeg-enc?
>>
>> Is there a qcom,sm8250-jdec as well? Is that a completely separate
>> block, or is this IP-block actually the qcom,scm8250-jpeg block doing
>> both encoding and decoding?
>>
Just to add that it is separate block and is doing only encoding, jpeg
decoder i believe is not available as hw block for this Soc.

~Gjorgji

