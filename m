Return-Path: <linux-media+bounces-59818-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6GwNL+GD8GlwUQEAu9opvQ
	(envelope-from <linux-media+bounces-59818-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 11:54:41 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 536E8481F17
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 11:54:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3FA4534937CF
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 09:13:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC3303DE422;
	Tue, 28 Apr 2026 09:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Bb5E48/W";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V9EVzJjU"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C997A32AAC6
	for <linux-media@vger.kernel.org>; Tue, 28 Apr 2026 09:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777367569; cv=none; b=tMeWrR7zwQpyH43m29sfUB0AZM2Ku96oDMcBhPgFjSMamWglZX/qUypChvaimW8SYuynzsm1uwuWiRrURA22ngQe3GPaV/1+OYIObuomAxsX7ToT72fB4io0/7+o1MXGoPbMIM/E5W0V6Zb7NgLA4IflEbX+rQlaydyC9flePiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777367569; c=relaxed/simple;
	bh=MF6Yl0cb4sJbEESk0My1jj9Kp3v8QAV6KskeS18l3tw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R5XKejok0nABsLX/bUqWHGM/e4VL2qw6ag+xYeC2J1KxY23PyBW3B7PF+kq4LHjaGV6szXZOlypv5e1KxY3sL6aGGi6q9q81rI8STNnWNlT29xIXBqMoQnw/J9xXeJH4dTiUbCQMe5UtTo052lVSjuG2IoNcj8Owc11y4OU4NCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Bb5E48/W; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V9EVzJjU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63S4EWDd429032
	for <linux-media@vger.kernel.org>; Tue, 28 Apr 2026 09:12:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MF6Yl0cb4sJbEESk0My1jj9Kp3v8QAV6KskeS18l3tw=; b=Bb5E48/WHkMcUQN5
	qTc3Y2bO0rNm4QpiICkyhIxbVSQZ7j87CTqWYfkkF3R6sehoF7awpWWV0dpH9v3Q
	JZYe/+Cl3SngRS20Qzim4iVJk+oyj2/9NJRgKXl2Z9aRZ7+kPjw5I/ZYEdZruxuE
	AmjeivTQxK89DsB00ofLhTOta1/BPjbXjx9n7+iki7em6ZV1teecxIaJ1Q6oYT3c
	/90b+TqoDUChueM7Ohao1+8nyv5ZO8n9crkSR4MRqeprSoviufuyGH69G596DCuk
	3OyXJA48gVW3zbsxnGDVOay/GDcK38kKJcK9mNJ0qRnaWwIDQ2OKNhMSa6FsyBLO
	5uLtLQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt7x34a7a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 28 Apr 2026 09:12:46 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c76c2bb3149so5574625a12.1
        for <linux-media@vger.kernel.org>; Tue, 28 Apr 2026 02:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777367566; x=1777972366; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MF6Yl0cb4sJbEESk0My1jj9Kp3v8QAV6KskeS18l3tw=;
        b=V9EVzJjUemFEExHHNJ2VwarSNdhHC4xRGTG5NjfNPBCzxI9XsowbdtaQ2WIRnw3rUW
         J6aHoHg50ef4F9zLftA38t5Ux2aagPPx8dtEfQ/JLgln/BMP8qDFez8/0Hu2xkB0ioec
         ILqIeEOpPP5PTXzzxwm6TWC99OUYBA999d2oeKFFynNCGs6nlTdO1xxRtb9X8FGKmv0+
         aS6rwigY2ZklQqtF4yuhY0+uoMktroKNS3RYUfDM1uKSqFumFoNrDg/AnUlhTixgyYVy
         2JaO+/FkW5ehQJ8vQYq/+jK6iHht3eO5XUVLNOKI257CT4qdfBk5v+QZEL5if2SYO2bJ
         a1uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777367566; x=1777972366;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MF6Yl0cb4sJbEESk0My1jj9Kp3v8QAV6KskeS18l3tw=;
        b=gJae8m5bAq5L8o0acVn0R06vvFpI9V7kCU8Jxbvb95YJLw2/zgLjWYKRF+ueF/7OBw
         B85MZ0JVXi3pf1aM9HMjLxd+fOgjVRbr0234k5rnpN7lKqoXvmynguvTIFkef+16TsVQ
         TD5umYapjmPOuuZ+pOZR/UvuGd73W7UkObsfhgBduxBFjlGvh0EgjggB/b/vtxQiY8wH
         sJ4kRgEw7mq+3qCbHtfxNmA44WuUPlHAV0FO/ncPBtrwP3388WNe+u1Y6Tv/pE9sScut
         1dOA/GxKzC2mvcm4wW3lbuxuycq6/dTg+fcJSKQ5QYUc0wt/kIy7NkpIrroUB62k9Hx+
         BsFA==
X-Forwarded-Encrypted: i=1; AFNElJ81GSyNOnAImSJzAYvhFwfXYEXQLUjx1rWJSBstBb3pJsdtZWuVJkQ6sRa7Bl+gdALKTecHw7bqBPTXOg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6n6kDOTerR+VD1YDv4Byu/n4bfW/1aSf9Wf55mAd3o2864GdO
	tx5imcil6e0PVKNbthYjZ+78Tzbtm85uxMqFEAUzvPshz7a7AmKSYbQIJYyIkbDz64wO4fTx+s5
	2541QBFN9qPiDJB0yJ1sjhLMntGfzfPDuL3QHmQwslXZcinRl+zEdm+S9EWF+mfDCdg==
X-Gm-Gg: AeBDiesR5h+tu/QajNdoCKiP7lY1U/MGYa/tqrn8hn0ZhrHLFQVcU/HLzAo7F0b4Nia
	gVVi5IpPPd/7+97EhBhikpXlCw1EtEFfpSm2WyW2STes54fJX+h6nYmwGxHLjMVBsu3hrrFYhYE
	DeoY00yGxrxaNLj1dFkqRX1kzVmURQCdlL67972U67aHA+D88QIbzEUAckM4WmOtS7hXRfHgHka
	oCfpQ9AjmU7mZ2T60VeMMMjkmKCjARUVPJTNLp/W6pD520j3mQKz9PGdOieL4qAp+yUXqg9qtrR
	97VW39NmhXGGBYxe9y2IA+Og/AGjvshADrQjvB/qeScX9eJXcDJhUoulGPemjQl8fJZJWnTe4nu
	vo546ELF1ASSKhj3ldlzOOSUirX2dDaCijkRLFaEhZ2FJokVo6m9qt5GNZHPzeK8l
X-Received: by 2002:a05:6a00:4b50:b0:82c:9c90:6ea0 with SMTP id d2e1a72fcca58-834dd246ac1mr2019036b3a.3.1777367565612;
        Tue, 28 Apr 2026 02:12:45 -0700 (PDT)
X-Received: by 2002:a05:6a00:4b50:b0:82c:9c90:6ea0 with SMTP id d2e1a72fcca58-834dd246ac1mr2018998b3a.3.1777367565123;
        Tue, 28 Apr 2026 02:12:45 -0700 (PDT)
Received: from [10.206.105.200] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834dae00e40sm2480834b3a.12.2026.04.28.02.12.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 02:12:44 -0700 (PDT)
Message-ID: <6ebe28dc-b8a3-db92-0e66-3f0541e23e13@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 14:42:35 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 02/12] dt-bindings: media: qcom,glymur-iris: Add glymur
 video codec
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, iommu@lists.linux.dev
References: <20260428-glymur-v3-0-8f28930f47d3@oss.qualcomm.com>
 <20260428-glymur-v3-2-8f28930f47d3@oss.qualcomm.com>
 <20260428-nifty-quaint-hoatzin-6de65d@quoll>
 <97aa5f18-d1d5-f082-9075-a385255f2e97@oss.qualcomm.com>
 <7d775357-c7b1-4cf5-af90-012d1364e773@kernel.org>
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <7d775357-c7b1-4cf5-af90-012d1364e773@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDA4MSBTYWx0ZWRfXx/splvMusw94
 Gbf9SRhkCbYn9QCXw9OnK1J8u1+EP2/gSrUmNcg473Ej/sJY3HVhWLGDCbiIZlvqYBoicLQds5z
 75moV/tMV2oXjf26hySeUOVwM1r442TQemIMaUKlhT6m9935emr1nYQJBCfUk09UtttYEWorMLF
 n5CwN3kqABMfde9ioliO9OTQRvpcueoPecnPhbRCyTCmkpDx0QSaaMbxHragD+7BuMBYCOKLs0F
 s+vvV97w0qjYAgVlMN2E3tSEkEu1ZpVVr9HsEknSEgHsdRsR0w9yF4pZElahDaTrma4SwUzYP8x
 4DuwTgbVp1nj5lxK7VOEoY58cgSzV5h77RInnMyTXEkTumedUQ/VSmuIc4dNTjY9X2lhED4NMsJ
 OwnsoF+kBQ9CAmmPOIWFgHx9SgFOJMQWgPwaz3mu2heL31mM42xjy7qCgXOGN0xiSjI9R7iPEsm
 WCGp8yaUrBJ0FItVvEg==
X-Proofpoint-ORIG-GUID: bRFgT7XvKePaqeqmwvIgrCz4MKxYNcB2
X-Authority-Analysis: v=2.4 cv=AJEsYPsu c=1 sm=1 tr=0 ts=69f07a0e cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=H8TGg1LnFfWU2mlYB9oA:9 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: bRFgT7XvKePaqeqmwvIgrCz4MKxYNcB2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604280081
X-Rspamd-Queue-Id: 536E8481F17
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,linux.dev,kernel.org,linaro.org,gmail.com,8bytes.org,arm.com,vger.kernel.org,lists.linux.dev];
	TAGGED_FROM(0.00)[bounces-59818-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]


On 4/28/2026 1:58 PM, Krzysztof Kozlowski wrote:
> On 28/04/2026 10:08, Vishnu Reddy wrote:
>> On 4/28/2026 11:44 AM, Krzysztof Kozlowski wrote:
>>> On Tue, Apr 28, 2026 at 09:24:08AM +0530, Vishnu Reddy wrote:
>>>> Add device tree binding for the Qualcomm Glymur Iris video codec. Glymur
>>>> is a new generation of video IP that introduces a dual-core architecture.
>>>> The second core brings its own power domain, clocks, and reset lines,
>>>> requiring additional power domains and clocks in the power sequence.
>>>>
>>>> To accommodate glymur clock and power resources requirement, the maxItems
>>>> constraints in qcom,venus-common.yaml are relaxed. This allows the glymur
>>> This is a very confusing part of commit msg. You cannot relax the
>>> constraints. Each device MUST have a specific, fixed constraint. It is
>>> your task to be sure they are not relaxed.
>>>
>>>
>>>> binding to inherit from the common venus schema without duplicating shared
>>>> properties.
>>> That's obvious. Why would new iris device schema not use common venus
>>> schema? What is different here then that such possibility exists?
>> Glymur platform has a dual-core video codec architecture (vcodec0 + vcodec1),
>> requiring 9 clocks and 5 power domains. The stricter maxItems from the
>> qcom,venus-common.yaml takes precedence, making it impossible to accommodate
>> glymur requirements without updating the common schema.
> But so does every other device, no? So what is different here?

The difference is in the resource count relative to what qcom,venus-common.yaml
permits. Existing platforms like SM8750 have 6 clocks and 4 power domains,
which fall within the maxItems limits defined in the common schema (clocks: 7,
power domains: 4). So for those platforms, referencing qcom,venus-common.yaml
via allOf works fine, their resource counts are within range.

Glymur dual core architecture (vcodec0 + vcodec1) requires 9 clocks and 5 power
domains, both of which exceed the common schema maxItems. Even if
qcom,glymur-iris.yaml explicitly defines maxItems: 9 for clocks and maxItems: 5
for power domains, the stricter limit from qcom,venus-common.yaml takes the
precedence, causing schema validation to fail.

Glymur is the first platform where the common schema limits become a hard
blocker, unlike all prior platforms that happened to stay within those limits.

>
> Best regards,
> Krzysztof

