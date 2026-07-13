Return-Path: <linux-media+bounces-67446-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /AYBAAGmVGomowMAu9opvQ
	(envelope-from <linux-media+bounces-67446-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 10:46:57 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 42072748E48
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 10:46:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=NGe8fOXZ;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=JxyVw3KS;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67446-lists+linux-media=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-media+bounces-67446-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 848B3300E698
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 08:38:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7EB73B440E;
	Mon, 13 Jul 2026 08:38:21 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29FD83B3BF1
	for <linux-media@vger.kernel.org>; Mon, 13 Jul 2026 08:38:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783931899; cv=none; b=QQC92l2wMTGvcCjgjL7OWzRiZtoOw1tQHu3lSNU16yVzhaAsfsO0r5wTAhDS84XuLlgAu2wzQTV/X8Y+rRh0KWQH3IVvkfUWpIJDu+C4zCdG/4jqnyxY4hS+WcixW46ZDmI+Snru7ScgroyUKQoXJGUy8PAeqH1MqAZCFDDt6X8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783931899; c=relaxed/simple;
	bh=w9gymKIIY8qbVxG+ONMNM7bkins/+X393rhhygMu0u8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sCcsLoFqKmBSYl/vnJ4VaImxT9qivPveqQFeklykbM5eT745j/hFGYCKut5kXsYaVHUnC0L/0Ljz6HJ7IRRQFSWOEaI654aO1mv7Pt+QcC1QRzl+dOyrdoxxomyUVI8prcbjHjH7H7iROjWirbxYQ6zgS/y48OwRVn0ZLhD89i0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NGe8fOXZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JxyVw3KS; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D6Nh48469297
	for <linux-media@vger.kernel.org>; Mon, 13 Jul 2026 08:38:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NPN1d+VaQFa2WiRxdgb2v0onTMD3U0YsB7IwP3R0BTo=; b=NGe8fOXZDVZke2TI
	vA7XP22Wgo0nlckpbfs2mkA805wV5rVsSgjwBpv5xCRmmC2GpKFDaJ40qNzpNRdQ
	4LQlOE1GWOA9YAJUXOH+jMTklPohs4ye++UDZMv5kgpxi/le+xjGRVDHTDqtzbrV
	rhtWKmeXEc8iZRKdr8h7Y1Ruy9/gkTTAOQ/LKl8v/IfS3RD2vas6h1MzdsEk0HYK
	NVHrX+xMh9DoHEqTf/jollWt/vP53ahMDy/bnexI+RPMLAVX2WZZTWJi7s6yIGVF
	mJsRbgLTHa8ivTWXGel+pX3Q+6UjPzMwtJepNCjvCZWeSBRs7+pZyMMEbEyNZMoc
	l/OErA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbf4857fk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 13 Jul 2026 08:38:14 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51a8b0a08d2so35439681cf.0
        for <linux-media@vger.kernel.org>; Mon, 13 Jul 2026 01:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783931894; x=1784536694; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NPN1d+VaQFa2WiRxdgb2v0onTMD3U0YsB7IwP3R0BTo=;
        b=JxyVw3KSm8bsUWy/XNzYxx1zykJMqWG0cJCo8G0kg6Y1WU7zxLY2WZTKz88hnmHnOW
         aAnqSb8ANe6klR/tl/kOFK9U9z1SOMKnsbtCiMfBgHdPiVcGLDM8epffQlYfr+2Plm3r
         EAhP1RbSSXqOQJotD73IrMcQyhFZpj4hRzx3b48rSrbIf67DQA98zws1MCq4CbMDzhR9
         Dx+PDOCuJtHHBwCvqKyABAs/pCr9uUKZY5De+p828B5rRp2yXcdIDIaelEE/8uIIe2Be
         Q9ej0eJzFZRIysr1C3eAYVcet5kGL7bMX1/D5bAZhoFUUSRFCPI67IipqrT0ncijrgQK
         Rh0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783931894; x=1784536694;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NPN1d+VaQFa2WiRxdgb2v0onTMD3U0YsB7IwP3R0BTo=;
        b=P3jpQk/O7KxIQ+tvDjF6zJR/v6cRMGw8oCadJaMFg8PlaB2BQXJNnEu27yTrzuylY1
         /oFWYo+YubfenU4qhbP3njHRodPrLBE3ACV7in9HJXBviY3Vix3IHmkGxa6P7YNDWB03
         0vU4J6hXEdk8wkTVXGLNB+qqjq8m3ljyTbwTkD1NXz1zsBn4B/8fp9Eut4wuLmT4acLH
         tMxBEY/eTxR5sW4kfiYqpaPTFD8GHqEupiABTPGSTs2076xDjTPKFJOJ0U/lWn+vpJ98
         1tosdnvqP+uWGpzw5neVVU3FX23v0IooGPAIPEIlCS/Aon7b1kv3Kj4RHaaAqOwlWc8a
         Wr1w==
X-Gm-Message-State: AOJu0YwfdPCyqNgnodj0vVWagBzQ8r0Ifr2fvquASAe9jmrjRjvBYQfM
	kfWr5IVNBROOkxvM9K/W+0LWiL9AJ4I2IJcEO905DRnD0O6Rjgy87ukU1SGdlp+PNzgf6RBSFYD
	PMCQrYsKwvAIJz7lTYhDKgvC25iAJogqhMJY/QBREKzpVrD6Jb95U05mWXQf3lEC3Zw==
X-Gm-Gg: AfdE7ckorL5CC3RRRvQzwSJtxQcLtPxFXsQV9kgW5EDcpNHcp3K1CoBAd4Hfi9CpBAd
	+UuxlBrzfvjXEbT6wjoEB7/uVDLr0AZOQaLOt8xN6tah3Db8/yRtsSJpHKi2CwAC79AtFsY+bKo
	/YRbOCteTmMrytr/+D9m6Wh+WUDO1B+tt5WO2EISNL1J7F2HHY+dpvN4nFN+datTjNbEUtrdl5C
	oQvp4OrVREnOQdAwGkHMWuqZWjb6Y/PhFnScIfjfAEhhROGfSCWsJ2A4Yab5IPowfmWIaaqiXFY
	IqmD5L6fzdPI9gfHe0Ylvbkzjs7IK2LA2alC1hSjddcyyRpSignU/YETHxo08UW4Cj8fCHiQIQQ
	YWTaSp4HhueaQ26O7bQMdzAedIy1al7/YzD83WqaQo5A=
X-Received: by 2002:a05:622a:259b:b0:51c:9ad:d77 with SMTP id d75a77b69052e-51cbf280a7dmr79968561cf.51.1783931893872;
        Mon, 13 Jul 2026 01:38:13 -0700 (PDT)
X-Received: by 2002:a05:622a:259b:b0:51c:9ad:d77 with SMTP id d75a77b69052e-51cbf280a7dmr79968471cf.51.1783931893405;
        Mon, 13 Jul 2026 01:38:13 -0700 (PDT)
Received: from [192.168.1.73] ([92.247.57.178])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15d3e54e83sm742060466b.42.2026.07.13.01.38.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 01:38:12 -0700 (PDT)
Message-ID: <ecf8cad1-47cc-4b07-bab2-d0fef6648bae@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 11:38:11 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/5] dt-bindings: media: qcom: Add JPEG encoder binding
To: Bjorn Andersson <andersson@kernel.org>
Cc: linux-media@vger.kernel.org, bryan.odonoghue@linaro.org,
        vladimir.zapolskiy@linaro.org, loic.poulain@oss.qualcomm.com,
        mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260706071113.383215-1-atanas.filipov@oss.qualcomm.com>
 <20260706071113.383215-4-atanas.filipov@oss.qualcomm.com>
 <alOpwQx-43WNPHcL@baldur>
Content-Language: en-US
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
In-Reply-To: <alOpwQx-43WNPHcL@baldur>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA4OCBTYWx0ZWRfX6iCKtpscPr1H
 S3rcj35qrho/K1H9gQfxBk3ejgIxFxabVVmQiHkVIvT1tRYCFrd0u47JjwPlaPWOR6i/Z7bu3w1
 N4LCd7bxgr1UZUsxYosnH+7RBEXYDZY=
X-Authority-Analysis: v=2.4 cv=OsJ/DS/t c=1 sm=1 tr=0 ts=6a54a3f6 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=ybD9qRDIDfZaXNPQ7Ca20A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=2iqQDksCm9cAjr31UZcA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA4OCBTYWx0ZWRfX6s5PjKzITDrZ
 vlrAQOxx/TiVHfPt/AGkWqF6OL89l5DxDUaihE8ZmywGGUhA+TSFqqAcAGMqX3LyWtEJ63/xRdm
 Try1jGk8JXfgXLD/R7jPsK06+vsamtYflHTYWBOdZHFaJTvuM/DXk/Nlm7+NMTGJ4qzhqBB2ULj
 8gCmVBzYzcD+VGf+iFbmGeN1NZPCzKPrgsR5LNI/9rgmWThnA7xtQD5KkRfHA4gNpk/dmGWqLCA
 bOSSkJ4xRTpIPs2zptLZJQ2lhlRZ+5N29UDPoTAP3BdHNHavDXygp9ZT3DCJernqhbIKkj1ZjAr
 t883Qu2RRIG3YAK5Sc0UVDcw/yLDvjvHMZZfHVTuI6rPh2ytHsTxIIxXs8g3GHNBkyPd6k55wwl
 hnspjtNro46FRjjUqyhuDr/fXlaOfgzTfeGBY3cbIIfldHtDHkY8TrZfN3szFLX6qXlUxU9AxRA
 I+oYEQFDaVmenZimSIA==
X-Proofpoint-GUID: CdN8ezJUt4_MUQj1VEC_crhyfxMhLvJC
X-Proofpoint-ORIG-GUID: CdN8ezJUt4_MUQj1VEC_crhyfxMhLvJC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130088
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-67446-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:linux-media@vger.kernel.org,m:bryan.odonoghue@linaro.org,m:vladimir.zapolskiy@linaro.org,m:loic.poulain@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[atanas.filipov@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim,devicetree.org:url,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[atanas.filipov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 42072748E48

On 7/12/2026 5:55 PM, Bjorn Andersson wrote:
> On Mon, Jul 06, 2026 at 10:11:11AM +0300, Atanas Filipov wrote:
>> Add device-tree binding for the Qualcomm JPEG encoder hardware block
>> present in SM8250 (Kona) SoCs.
>>
>> The JPEG encoder is a standalone hardware IP within the camera subsystem
>> that performs JPEG compression in memory-to-memory fashion.  It is
>> separate from the CAMSS ISP pipeline and has its own register space,
>> interrupt, clocks, power domain, IOMMU streams, and interconnect paths.
>>
>> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
>> ---
>>   .../bindings/media/qcom,jpeg-encoder.yaml     | 151 ++++++++++++++++++
>>   1 file changed, 151 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/media/qcom,jpeg-encoder.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/media/qcom,jpeg-encoder.yaml b/Documentation/devicetree/bindings/media/qcom,jpeg-encoder.yaml
>> new file mode 100644
>> index 000000000000..e4c16388ef07
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/media/qcom,jpeg-encoder.yaml
>> @@ -0,0 +1,151 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/media/qcom,jpeg-encoder.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm JPEG Encoder
>> +
>> +maintainers:
>> +  - Atanas Filipov <atanas.filipov@oss.qualcomm.com>
>> +
>> +description:
>> +  Qualcomm JPEG Encoder is the JPEG encode hardware present in Qualcomm SoCs.
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - qcom,sm8250-jenc
> 
> I suspect you find it obvious
> that this is the block than is used to enc the js, but I don't.
> 
> We have space, can we please use some more letters here? How about
> inflating this to qcom,sm8250-jpeg-enc?
> 
> Is there a qcom,sm8250-jdec as well? Is that a completely separate
> block, or is this IP-block actually the qcom,scm8250-jpeg block doing
> both encoding and decoding?
> 
> Regards,
> Bjorn
> 

Good point. v5 will use qcom,sm8250-jpeg-enc.

Best regards,
Atanas

>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    maxItems: 6
>> +
>> +  clock-names:
>> +    items:
>> +      - const: hf_axi
>> +      - const: sf_axi
>> +      - const: core_ahb
>> +      - const: cpas_ahb
>> +      - const: cnoc_axi
>> +      - const: jpeg
>> +
>> +  interconnects:
>> +    maxItems: 3
>> +
>> +  interconnect-names:
>> +    items:
>> +      - const: cpu-cfg
>> +      - const: hf-mnoc
>> +      - const: sf-mnoc
>> +
>> +  iommus:
>> +    maxItems: 1
>> +
>> +  operating-points-v2: true
>> +
>> +  opp-table:
>> +    type: object
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - clocks
>> +  - clock-names
>> +  - interrupts
>> +  - interconnects
>> +  - interconnect-names
>> +  - iommus
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/qcom,camcc-sm8250.h>
>> +    #include <dt-bindings/clock/qcom,gcc-sm8250.h>
>> +    #include <dt-bindings/interconnect/qcom,icc.h>
>> +    #include <dt-bindings/interconnect/qcom,sm8250.h>
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +
>> +    jpeg-encoder@ac53000 {
>> +        compatible = "qcom,sm8250-jenc";
>> +        reg = <0xac53000 0x1000>;
>> +
>> +        interrupts = <GIC_SPI 474 IRQ_TYPE_EDGE_RISING>;
>> +
>> +        clocks = <&gcc GCC_CAMERA_HF_AXI_CLK>,
>> +                 <&gcc GCC_CAMERA_SF_AXI_CLK>,
>> +                 <&camcc CAM_CC_CORE_AHB_CLK>,
>> +                 <&camcc CAM_CC_CPAS_AHB_CLK>,
>> +                 <&camcc CAM_CC_CAMNOC_AXI_CLK>,
>> +                 <&camcc CAM_CC_JPEG_CLK>;
>> +        clock-names = "hf_axi",
>> +                      "sf_axi",
>> +                      "core_ahb",
>> +                      "cpas_ahb",
>> +                      "cnoc_axi",
>> +                      "jpeg";
>> +
>> +        interconnects = <&gem_noc MASTER_AMPSS_M0 QCOM_ICC_TAG_ACTIVE_ONLY
>> +                         &config_noc SLAVE_CAMERA_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
>> +                        <&mmss_noc MASTER_CAMNOC_HF QCOM_ICC_TAG_ALWAYS
>> +                         &mc_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ALWAYS>,
>> +                        <&mmss_noc MASTER_CAMNOC_SF QCOM_ICC_TAG_ALWAYS
>> +                         &mc_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ALWAYS>;
>> +        interconnect-names = "cpu-cfg",
>> +                             "hf-mnoc",
>> +                             "sf-mnoc";
>> +
>> +        iommus = <&apps_smmu 0x2040 0x400>;
>> +
>> +        operating-points-v2 = <&jpeg_opp_table>;
>> +
>> +        jpeg_opp_table: opp-table {
>> +            compatible = "operating-points-v2";
>> +
>> +            opp-100000000 {
>> +                opp-hz = /bits/ 64 <400000000>,
>> +                         /bits/ 64 <100000000>;
>> +                opp-peak-kBps = <76800 104166 104166>;
>> +                opp-avg-kBps = <38400 33569 33569>;
>> +                required-opps = <&rpmhpd_opp_min_svs>;
>> +            };
>> +
>> +            opp-200000000 {
>> +                opp-hz = /bits/ 64 <400000000>,
>> +                         /bits/ 64 <200000000>;
>> +                opp-peak-kBps = <76800 208333 208333>;
>> +                opp-avg-kBps = <38400 67138 67138>;
>> +                required-opps = <&rpmhpd_opp_low_svs>;
>> +            };
>> +
>> +            opp-400000000 {
>> +                opp-hz = /bits/ 64 <400000000>,
>> +                         /bits/ 64 <400000000>;
>> +                opp-peak-kBps = <76800 416666 416666>;
>> +                opp-avg-kBps = <38400 134277 134277>;
>> +                required-opps = <&rpmhpd_opp_svs>;
>> +            };
>> +
>> +            opp-480000000 {
>> +                opp-hz = /bits/ 64 <400000000>,
>> +                         /bits/ 64 <480000000>;
>> +                opp-peak-kBps = <76800 500000 500000>;
>> +                opp-avg-kBps = <38400 161132 161132>;
>> +                required-opps = <&rpmhpd_opp_svs_l1>;
>> +            };
>> +
>> +            opp-600000000 {
>> +                opp-hz = /bits/ 64 <400000000>,
>> +                         /bits/ 64 <600000000>;
>> +                opp-peak-kBps = <76800 625000 625000>;
>> +                opp-avg-kBps = <38400 201416 201416>;
>> +                required-opps = <&rpmhpd_opp_nom>;
>> +            };
>> +        };
>> +    };
>> -- 
>> 2.34.1
>>


