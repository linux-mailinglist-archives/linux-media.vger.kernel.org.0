Return-Path: <linux-media+bounces-60746-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QJlyNvdG/Gk0NwAAu9opvQ
	(envelope-from <linux-media+bounces-60746-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 10:01:59 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D40B4E46FB
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 10:01:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5D689301906B
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2026 08:01:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C285733123F;
	Thu,  7 May 2026 08:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dtAcGAxI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T0hd9R8u"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34DF43321A3
	for <linux-media@vger.kernel.org>; Thu,  7 May 2026 08:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778140900; cv=none; b=I4QPPlhHiEaHpmcjq1sWRrrSTNdP1pC6UPrAA5+eWRSwx+d3muA/N0e+i+aEEIl6ULXqDAF59Gt0PDjryuX+KkUyKzBye46QYh/JQZF4FSevLHJNREcj1WICkMya4mqBVvUe4+fg6NSjaPt3dltBETJ2bYWABJ2zsL3c/VXX/Rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778140900; c=relaxed/simple;
	bh=5Rtl6v6NNbV1X+gpoGuS99EbUlh7f4FwWbPb3hKL8hg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hjnPZmn14gj/+EfYYSHoVSjE7ZckU70QoxizUYFFkfYKrSxPcJz2BFEZc7ftTjtXxCMwhmvLyb1GC2e8lYm8ub5m75i/7+CDXuKInhgvs4tPIOefpy03X3m6On7IgEdN19NTQvqRUncYNno087hIwahefxR2Pn4Btz7udgAneBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dtAcGAxI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T0hd9R8u; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6473eWxI026511
	for <linux-media@vger.kernel.org>; Thu, 7 May 2026 08:01:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DJbvh6Ff3ErWjQAnyIhu4En/NyYHcsCrkXudwbrQfX0=; b=dtAcGAxI1vJxeRPX
	xdcs5EM7jPWFyZvW+Hr0iwmUJxqUNG9SNLnR0Ebsb2fVZ4R6AXcMa2x/Aet4yPgj
	irD88uGLXCIlWzvIm7SnCGwrdGrnXkOSL2LTkxalHlD+oGcqml5ejj2AX7QE63nn
	LDbrszYQeoSMY0JlEM1OgjRJGbmo1wmt/hqtj7/AypvRckjpUHGfiAsALQeUJzM6
	7Aw5ehk3+OSKjAy4eZn06Z6xlWEE0jfiCluuAxDGPDv1huzqh0Sh3mAJrCQAQf/D
	iiJ48JEyXd5TGWDIY/hXEmN7uL/RuWsK+i66tGG0DOYinHAiBCsSfIH7yER4XL+V
	Fri15A==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0k1t0uqs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 07 May 2026 08:01:36 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-573ac60fcc2so82338e0c.0
        for <linux-media@vger.kernel.org>; Thu, 07 May 2026 01:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778140896; x=1778745696; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DJbvh6Ff3ErWjQAnyIhu4En/NyYHcsCrkXudwbrQfX0=;
        b=T0hd9R8uqmuMvEOKsC2bNuOa48YDg2+KcJYN1UFPerHpeY2ANgOv4ZlaqYJ7+ZxgyA
         uJQ6yq0dmKt6c3/6lkw+RqvA3VnRclTdpUcBEKuT1CCekSIHSWJS+Y0YJGRRxWa1IDYh
         DPMPTm0c42g86IWtsNfCeeIJhfH8C/zVplk54GJidNjftkHE5WrzwVIbeF7oaiYD4e85
         t9E24vx96cYVGsW+jtelQv6Ev7h6Sdqs59P6G5A4tXTdhD75Jz7tr0CTD9kMJbZcfUYA
         UBf86sqzWXoFA5WscMNMFwHSsDFA1FTeBkT8ruMwiDcQqICjMESxuIUsdt/TECdzLD6w
         yOnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778140896; x=1778745696;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DJbvh6Ff3ErWjQAnyIhu4En/NyYHcsCrkXudwbrQfX0=;
        b=M0QUJvl7QLg8L2REitNI+/thZBRey+FMnNaCfybNbG84uDI9PVoi8TU+muqXtaVPoO
         rS5yhngebZopF1qUNa0UQJg0KpKR/0xB9/3lwyDM0TIkihuoY8vd871AeJtNE7aGSwfO
         Z7bN5ju4XreA6/6hjbQQWDbmH5yrGPkLfgnhlOYJ35ae2tC9fPhRUdgkp3EWraO8Eim+
         idblOuOg4k6S84WoAxQObNYiTcoHR7QkW3XHBKJ1sBPN2wMTkSIj+sZnvaHoXdlUI3+H
         YKyUJuDyFUTY0XVxWvkHBOlJQZQJeyRLTMGZd9zxquKR/P6Sq/Enm8aYbjWXZRkr5You
         O1gA==
X-Forwarded-Encrypted: i=1; AFNElJ/Z54el5inlifyb1Ce4hEVGzcq7axdty5tNaBrFw8RXK1QV5lzcuDjJNfqbjC5Tw/YyLHhqrPnZCxSboQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxSYBf5n2Uub3mGEoNCCafgVmCvJj3iE3xCoQNCu/F3LlVP9/cN
	52f1szTl/365hFn8n8/UsejodekOSUjxtmqu5VFDzYfJ0VrDCrUWTvJgcfACW6U7ATkwFvpPLz4
	GFkNg9/xJyvywB4lydHaHnv5Ep8xTmyb5s51Pto5nM3wTzrYYmAMd4+XgjSMUE2uB7w==
X-Gm-Gg: AeBDiet4I+rt0bD4PfAcXpfaK8Lj8nC8QQzsAGSRkrLkJmmbyR7DmNuTwL/araYZuAi
	CWLTjSqPbyncBIJ8WS9nqm2wqCGqcmEgaEOV/eYxUrWNnCK+xhcfI9Pr5QtIcNoOtwrQiNSJdil
	LSHfJ3IvFNPGnvfLUxQv0i/dM61N//B5/oumpaQwIiZ6xhgCJ6kr6MWiXJIAr0hI0Sk2gCu9n++
	Cf8AldBHfk9ohsHgfT9hrHy0J73+WDv40Ss4MpKzA5eT/GQ0z9C0MWDESpViowjs4ZTZmdh5giF
	2w/f9jxSNNojXyzwhNc4Np7BNZvmlez2y+kYPluRhqW7YRWFaGxpFM0NgZCxVZgV/dqAFmvKgEt
	NpB4GOQ4Ued5cNSKKSA5WKtI2yMEWyncmIY5fRV9fUXeMKejCKzKACwCwRBoCNwF+Gq88YGkZQn
	FIe1XRh8RUcNNAqQ==
X-Received: by 2002:a05:6122:5017:b0:575:24c1:f668 with SMTP id 71dfb90a1353d-5755b2b0d03mr1182892e0c.1.1778140896050;
        Thu, 07 May 2026 01:01:36 -0700 (PDT)
X-Received: by 2002:a05:6122:5017:b0:575:24c1:f668 with SMTP id 71dfb90a1353d-5755b2b0d03mr1182854e0c.1.1778140895636;
        Thu, 07 May 2026 01:01:35 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bc833742c49sm52804266b.30.2026.05.07.01.01.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 01:01:34 -0700 (PDT)
Message-ID: <9545da0b-d6b7-4298-b86b-f981908c80f2@oss.qualcomm.com>
Date: Thu, 7 May 2026 10:01:32 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] clk: qcom: gcc-sm6115: Set HW_CTRL_TRIGGER for video
 GDSC
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260507-iris-sm6115-v1-0-0b082ad8eea8@oss.qualcomm.com>
 <20260507-iris-sm6115-v1-1-0b082ad8eea8@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260507-iris-sm6115-v1-1-0b082ad8eea8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=EoPiaycA c=1 sm=1 tr=0 ts=69fc46e0 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=V4j3QN97b3vMt8JjJHsA:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-ORIG-GUID: 9RI_Pia1FfBKjsQxHQCesbc4St-9vtjK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDA3OCBTYWx0ZWRfX7HreOoaOm4MS
 xJwAvtvZ1g273Yd6AfyTX1tAg/a1CatiqozQYnvsBa44KjmF7MEp7q2vZipNc8lqlF4HGzvScUq
 43jDhFQ8sZXazchAUWqMQD96e1X8UuEQ48wCxx6MUEyd4w1ICGD+CU5HH5xceE2ZN/REGANRXB1
 lAHbhN9wagFUGhW1M/bZUcAM4Zd5LsyN8+OE/riM3pKBPVTdxmBIWz185HW442csg2hrD/5D+uS
 KocziSgG73wmE9pdRgklSkLEzA6n/f8ZEETB6FjXKTP8167j42DJYW6fX3JZg5a129vOItea2MS
 ZQ1Q0cS9pstO7OL5K7SOvsQDNhGUAG/c66ZPKjatnimG/zMCMdluSDjOyYI+vHHOxUI1GeLctog
 O7dR12UjeQEipiUS/Blq2mnU3RDVRJlXmfd11Y1yIkiJHr/jRjNHMPfWrPNv663IggcV5j4F/Ls
 vEf3AdxQzT2WlKfpaCQ==
X-Proofpoint-GUID: 9RI_Pia1FfBKjsQxHQCesbc4St-9vtjK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 malwarescore=0 priorityscore=1501 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070078
X-Rspamd-Queue-Id: 8D40B4E46FB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-60746-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-media@vger.kernel.org];
	RSPAMD_EMAILBL_FAIL(0.00)[dmitry.baryshkov.oss.qualcomm.com:server fail];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/7/26 9:08 AM, Dmitry Baryshkov wrote:
> The venus video driver will uses dev_pm_genpd_set_hwmode() API to switch
> the video GDSC to HW and SW control modes at runtime. This requires domain
> to have the HW_CTRL_TRIGGER flag.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

