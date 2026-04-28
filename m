Return-Path: <linux-media+bounces-59826-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EFS1KwqL8GkRUwEAu9opvQ
	(envelope-from <linux-media+bounces-59826-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 12:25:14 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 55E3B4828B3
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 12:25:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 559BC31F921A
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 09:50:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1295E3DA7EA;
	Tue, 28 Apr 2026 09:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FcizD0zR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PDFUrll7"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19E093A6B88
	for <linux-media@vger.kernel.org>; Tue, 28 Apr 2026 09:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777369821; cv=none; b=O5qMZcQQ55yGKY4TJrMTCWJR24bs76+N9sRvpicBViNlpcOekzoNcyVYyQZiLxcR7J+/0P+UNvF2U69RSP/dMsvA9S1aVt/gmu6kvovNBJONtLmKUQkGCr55Wp/znl5cG6Zz+3Pj+8Q1XZZ14HvOFMc+2JwbJICqO0WmoD7JgMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777369821; c=relaxed/simple;
	bh=xJHqPBiTn94yBzMImM4YOFZy7uS41sjz0uqcdavPIHw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sk4i1ZcwNg6bvG6EBL0JCnv3zZEqv/J2lNBZLpkl5qMAEitR+i4afLNKr22COzhaQREwhDBKM5Oz6a9+2Oa7Z/XC/nqkUHFK/uAT9luRw1nmMkB78Paut5FOvAiBifKEE1sdsWiYNCE8dNos8SU0q561U8zKq98MCo3mrV77K2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FcizD0zR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PDFUrll7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63S9hW0W2045169
	for <linux-media@vger.kernel.org>; Tue, 28 Apr 2026 09:50:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rSgFwP34wCo85AXhGbCR+4Z8PnplijHqeQr5lFbp24E=; b=FcizD0zRNxc6cpHg
	57cp96c0X25V4Dg1/329BfSZWxMwjav9fnBsOhuvrLjRGlirvmTJgyxdzfEzU6aH
	CmH9V1X6eiZoBbOm9uvewtLkESS3c2Qlr20WZQ0BEvEpHqfaabvVYzq5dHjehO2z
	kPyD83i6EfmB5A+IiXuDh4LjbzYDjzVcfxWBuuntAx6drxwRwYpRHtiYjuDF0miz
	p8owDTw1csDLaJV6VpPFMMo7y3nKmz7JzG7jyDWkPf7YYMiYuCW9XQqS6BNp2yRu
	+pYwUNxn5uTZVyoJGNZCEPBBFzPTYJcELIyDyFabnwm33FUv3w8GFc4pypy75gC1
	v8CCgw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dttgyr0rq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 28 Apr 2026 09:50:19 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8aca281aaa4so17764656d6.1
        for <linux-media@vger.kernel.org>; Tue, 28 Apr 2026 02:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777369818; x=1777974618; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rSgFwP34wCo85AXhGbCR+4Z8PnplijHqeQr5lFbp24E=;
        b=PDFUrll7DcQ8/zHxh5ZIoyNvbqxP3o7PPcXaAYyswwFWmFCnaaVksDiRVy0JqwvY+n
         Ub+JiEzs/wrxFuVCZL60nf7OzbtasJbHEOXH7vvBUrLko8CcDtGBrkCvlbsAwMy+dYzS
         bz2NKtMTISHoUCOZ64y14B+oNLo9LOsxoC8IB95DTHTXPf/miw5PunP3viYkjaLC9VuP
         vadMt91hpqVUobQXAft25qkyATMKfwGKP1GAA6HSYRDw4JQ29TljTR/k2T979zLsEkEY
         MsyXkL5Bh/rn+RP5+wSsXWS5IxliIjVn4f8vIq83ioWG9wLeIhXIIib7zQmSK2KszsVi
         Pt9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777369818; x=1777974618;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rSgFwP34wCo85AXhGbCR+4Z8PnplijHqeQr5lFbp24E=;
        b=Gv96kixyKoVlal3hkPIyA0gYldRinOCxHbl4HuQnA9pma4wUuxXWNyXI5UfOW767NQ
         /yJQLsVd/frpbEs5lRdZtFPg73bP24MuSSTiC6GinQToRHqU+XtaGxstm8AW7vU28LMP
         FFXUcmIv7eeATdCd6Gw3NFnB7QpeYDQ2GpF8/pHAs9E5+fqPbwtBak2u24tAwqYW9CDR
         2aM1SClw2Dj8GUz+r/6aNHLYGeqICitvcldqHYFypV5eLQe7ly/7m0kdH9daPNxyejIe
         8yNiWU6nBP99Cuur2Lhw08CRXESuICw7/XN6ZFDJVC0kLcyB9oJGk7STwXPNwSQOU/K0
         fw9A==
X-Forwarded-Encrypted: i=1; AFNElJ8xOTJ2AUe4SnWuRfcc2f7n675VqvbFWQjxNNRKU+MXD8Ip+Qks6Ns31xd4C0nMnRZUf0GOJwTmt7VTXQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwmPNIUESHjUQ6DcKdJy7jlJgSsWfiSBfm8/AOwF9IYJNRz/vFV
	Ovg1+nTDnVAZPX8/f7mJA/nzeAFX9P96piUIDHheiRrzQnnkpVipEYw80nFf11Fzh2EjgziH43D
	Eh2nCdrNk2Wyt60/NDpcj8ISumuzHgtHqHMFI3SinorT5vi4IKjnZNm2F72m0NRRBSA==
X-Gm-Gg: AeBDieveU4djLp5eGceniOtL/FdgNSeuVoG1oXjVfmNSvfem9PTFv4KGZjV0DWc6ML9
	mhsmBJleS85HS74GDvD7UxOKJ30gWIOqLnj3dK/fSL24ZXdnaR2tw+ua0yzPL904xam7m481HVh
	RrSUnTDH5Tx3kSUP/kNRgORKdijzWqXWytQK5MvjgSFNO5h401LuPCHnsC7qw8ZczDrPt0IXzjM
	0l4Z4jgDfKu3Uccnp1rPerJ62vVis8yUJQhzDF948pfCR09M3tTfLeKULiPjAry+b+QMwkTB6rr
	DLQbEi2sWFAp16YOfZJMHLIEwWCNjSvxd99WeDebIqb10TGDNqnzPJn8RaBndObhgJcvN/oWJ4R
	Igdvk2sXP5jnx3QkSGhh9WryNVDrZ0pROrzAcb/PEtXHODPfIcmFoiTaIXSxQQQb5ZqcleYLUoM
	YFg/OEk3lg22ibBA==
X-Received: by 2002:a05:6214:caf:b0:89c:e371:2b42 with SMTP id 6a1803df08f44-8b3e283bb10mr30341326d6.2.1777369818277;
        Tue, 28 Apr 2026 02:50:18 -0700 (PDT)
X-Received: by 2002:a05:6214:caf:b0:89c:e371:2b42 with SMTP id 6a1803df08f44-8b3e283bb10mr30341026d6.2.1777369817780;
        Tue, 28 Apr 2026 02:50:17 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bb80853e641sm77209466b.10.2026.04.28.02.50.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 02:50:16 -0700 (PDT)
Message-ID: <e752f72c-d0c7-406b-b9ea-4ef4e6911e72@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 11:50:13 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/14] dt-bindings: media: qcom,qcm2290-camss: Add OPE
 ISP subnode
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org, devicetree@vger.kernel.org,
        laurent.pinchart@ideasonboard.com, kieran.bingham@ideasonboard.com
References: <20260427-camss-isp-ope-v2-0-f430e7485009@oss.qualcomm.com>
 <20260427-camss-isp-ope-v2-11-f430e7485009@oss.qualcomm.com>
 <20260428-demonic-albatross-of-enrichment-aa6f26@quoll>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260428-demonic-albatross-of-enrichment-aa6f26@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: QSD27CGrng_w0ozS3H1q-L4A4QH1Bx2l
X-Proofpoint-GUID: QSD27CGrng_w0ozS3H1q-L4A4QH1Bx2l
X-Authority-Analysis: v=2.4 cv=cb7iaHDM c=1 sm=1 tr=0 ts=69f082db cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=axVsYsM61IUpGc0LCtEA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDA4NCBTYWx0ZWRfX8rAFNoyk6Z/8
 kfB8nnqBvMvXuznwQbYmsFXcwe6vM3na1O4MR39UHdpbni57leWwsFcAEKqWrvMiJwtrM92ouWW
 QmFek6tuf0BgGUipzT8Ybas/DQgdfRg7trWHvaOdkqKP50QLZNyJX9qxsOUHFrkIu3EBpfnzdk4
 4vjOgYuMgoEr7JiZcIJWP/mtnW0VmtKHWm7wInrpiSM8bgFDN/jE4F/VPNoLsl83HGOvs7Jrxk8
 iu0KrwjdD9z6zQnr9kyg1qoamLKA6Y49+oCc0iC4nkVcCSZLlQ+m9V0NqED1tONGF4pr0qOFMGR
 tBF7teDsuhcdk8KkNCETZK38RdllbvrYf25WPbdjyescDTKPefDzxfpeNVj+Adm+twRgrpuuA9b
 uQ801G+p/4lrKupfh4LTl/2vA9pbmHYMdiiJ2WrexfwzX/+NfC7nr9LlmiAnVE2lfVDh1FfnvcE
 mGz+wM4bGDOevD3kvHg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604280084
X-Rspamd-Queue-Id: 55E3B4828B3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	TAGGED_FROM(0.00)[bounces-59826-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

On 4/28/26 8:35 AM, Krzysztof Kozlowski wrote:
> On Mon, Apr 27, 2026 at 02:43:38PM +0200, Loic Poulain wrote:
>> Extend the qcm2290 CAMSS binding to describe CAMSS as a simple bus by
>> allowing child ISP nodes. Add the required address and size cells, as
>> well as ranges, and validate ISP subnodes against the existing
>> qcom,qcm2290-camss-ope schema.
>>
>> On qcm2290 the OPE (Offline Processing Engine) is a memory-to-memory
>> ISP (Image Signal Processor).
>>
>> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
>> ---
>>  .../devicetree/bindings/media/qcom,qcm2290-camss.yaml       | 13 +++++++++++++
>>  1 file changed, 13 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml
>> index 391d0f6f67ef5fdfea31dd3683477561516b1556..d8b356028e24c3c5b2e9b7f20e220db7d491ad68 100644
>> --- a/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml
>> +++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml
>> @@ -52,6 +52,14 @@ properties:
>>        - const: vfe1
>>        - const: vfe1_cphy_rx
>>  
>> +  '#address-cells':
> 
> Please use consistent quotes, either ' or "
> 
>> +    const: 2
> 
> This means the child will use 64-bit addressing, but does it need that?
> Or do you need that to have 36-bit DMA addressing? If there are true no
> needs for above, usually recommendation is to use narrowe address space
> for children, so only 32-bit.

I can't find data for this platform, but on e.g. Hamoa, most camera
components can address 36b

Konrad

