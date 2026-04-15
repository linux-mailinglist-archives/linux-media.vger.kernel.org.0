Return-Path: <linux-media+bounces-58811-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8H4TFLFd32m5SAAAu9opvQ
	(envelope-from <linux-media+bounces-58811-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 11:43:13 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id DF1B6402C16
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 11:43:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2DE86303E2C6
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 09:42:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A7CC33AD82;
	Wed, 15 Apr 2026 09:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZCMTYzUd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LRiAOyhV"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA69E33A9E2
	for <linux-media@vger.kernel.org>; Wed, 15 Apr 2026 09:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776246126; cv=none; b=djcJpmAfLi6EQn+XnHn+UuX6lf22bDFs5n/P83/sq14pVHHZuC4fLJg+O1D+zYmSJavFDrDBDHpChUDL2oIyzXJmP778OAkH/WiRs2gdbeGPDPADdXtD4Qx4cGXucK8a9ZNXGBruHzooEHbejsxTWbLGk2hxLpFpQXAuUEtFNG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776246126; c=relaxed/simple;
	bh=KboxyMTnclITlovOtCeHt/2q4Az468hfl1/29hD1Bpo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CWMUfPfntcEEIp5MPMv1RR5oRAlbXZGA6DjEUBFgDoDOIrGU0CFCx6nU+wHi9RDUY0Z7KLW064i1omnX8JzqXj4jIKIxqZ1maGrsbuNZp9M5OC53wOInaGcdPaRl6owAAf4tZedpuukUQ99wpr0gA+c0okMZ2osGVf9N5ZxC5K8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZCMTYzUd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LRiAOyhV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63F45YtH1701769
	for <linux-media@vger.kernel.org>; Wed, 15 Apr 2026 09:42:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8au+N/1MLaPhi7Q+5KjJ+7n0ETdu8nJODsL00VdDp6o=; b=ZCMTYzUdw7kLLoms
	3BiS3Nm3C5g4C01oA+Yx8kFfiIUsdntcJ3bZi0S3rVuWnj0tSglRgzViyXTWAyDl
	hjQUBHQcLxEAjYhXSah6NuSc0xG49gviLc9z+N1so3PA0+wOuHvHJn29ozQGaWrD
	1aV62Qu51ut300p2i/R21a5ZJp0+JBJ3vFwVXp/q8X3YgzfRpGFAbGxMkIpHVMRB
	T2RZzH8uKC5I1MPicRBtzBjA9SIU/gXwfKnNMkKrSiVlB7280AanJrp3mtnNIBvi
	jQRN7FM3iB3ShxsWiBB1wL9SySpptpLFC32Oo4O8vrvkE1R2SAlDiFDdN/3FQodH
	32v9OQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dht56tpvv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 15 Apr 2026 09:42:04 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8d56ae62e86so198839285a.0
        for <linux-media@vger.kernel.org>; Wed, 15 Apr 2026 02:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776246124; x=1776850924; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8au+N/1MLaPhi7Q+5KjJ+7n0ETdu8nJODsL00VdDp6o=;
        b=LRiAOyhV8SkWgE1LlsYCv26Rlum/Xo1jgC445etmkuk65ArjnX0VLweHhpgdiRbenW
         ursycaUW/GhTwSMCTq38sM7LQY0SF1/pjSSjhwVl5QxBDCiSjK+Kd05oO/INzF6x/1KI
         b/WojQdRuXEiDI9h6U1U7n67tvHFFmRCvwIifJOwuFrwZn/O5gfu9x9J5R7c6XUfIVeN
         yajRCGNUBTbnJK1kSO7O8ckRmNSZzPMtpmtbHHQ0pemYMToYQY6/bJPDCZJW59N9VaaE
         B+lIcGvWn39HM6ogGgW3fkZcl5h/wpjie54NUYvx4jUof3XbnnTzVFdU+E5uagnwzGIV
         fyaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776246124; x=1776850924;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8au+N/1MLaPhi7Q+5KjJ+7n0ETdu8nJODsL00VdDp6o=;
        b=jPNDrzcZrDy39No0gaUWidLg8XFyrB6D5RCSLwBdHh22IaOo68G6vCv+hwo6UjFbso
         AiPNr1UqnCIqqonfy3O6LzJQN8qVI6kjovqHzi9m2tg7/XG1k/QnfQsx316txF3u14o6
         Pn5tVWdjYq1OsIAxVqFL72TT73lu4oaErlldmjspLUWFg6rRsQQooddw8iJOEfx7PPvE
         3otOxZNe88el8b9ZP4E8/pqVJPJVKg1RwQSNM66NS1vtMPTORS/0/Firm4JzHoeeZAEL
         6fqFudG1mCYYBOJPMbFbrZgHC7KTHFcv0ibTJf7R7tr/kL3fjVsl3jLFf4M4hfpYqg6E
         5XAA==
X-Forwarded-Encrypted: i=1; AFNElJ/PA4fA6H5qSox9Yurf6jGNZhLfUmjakcU837wzOJICyx4eFQxaYI3g+NQcIXt9QFSBDcBNee2xFy/sZw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyCBARV9+TOPpRLlMMcE5vK7TuhfSmM5FH3SepKEVe8qTKZGtHO
	XZelw8AwK4hsc4EmhhPOavMLrDV7Ah+L+//WYPIlhixfarOWdXyQwCy/7YSqmiyNCEgcl0RRDjg
	o7Adu6XPaa3BcwVEfuc4XlcsMOU45mazQklAr9PV/ZcR2UVoND+iAr+lxDUNFbjcMoQ==
X-Gm-Gg: AeBDiesssLl/6DYdUklKLVYhdIy70LEzWqPBGdKfV1vGE6KW8qMR0TQCboaG6pm7Jba
	GhyAatj3nDaki0UHF4JiAgTfhoazcNXKflf+Mb2twRkZUUl6zzUuMLALceQvIgxywG5ykiqBin+
	t6LUEh23JCbbRgBpZmyWDR51KOqrGs3Ia7Gq4F/gJI9Dvx8yLg/N//drCiVJeCeiOcd2V/bO9gz
	Ho/VjF5KhXf+TLDjwAwk6hyfZ3eCvtBTV0Zebn7gYfM+OSwff5ZDCcmMl7pAfGw6jZBhSVkElgb
	lxi4aFlAcJHP+BXqsTVsYCuBn6SnaaN6KzuK8t92t58/vMpGMfZGwBisYJbKdWshiqqRTLHNIpz
	rdKta80DdVaoWI/9utnyEDeu+uusiBbQhKiE87PvSXqH6gDhKY61e6/QhN4w1m/ip+emGJ5z8Vx
	67FfGeDlS+ylm0IA==
X-Received: by 2002:a05:620a:3186:b0:8d5:ddc3:a3ab with SMTP id af79cd13be357-8e4cb303470mr158105985a.4.1776246123939;
        Wed, 15 Apr 2026 02:42:03 -0700 (PDT)
X-Received: by 2002:a05:620a:3186:b0:8d5:ddc3:a3ab with SMTP id af79cd13be357-8e4cb303470mr158104085a.4.1776246123537;
        Wed, 15 Apr 2026 02:42:03 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67238000e68sm249860a12.25.2026.04.15.02.42.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Apr 2026 02:42:02 -0700 (PDT)
Message-ID: <5bf3589e-0ec1-493e-ba10-db8237a18d6d@oss.qualcomm.com>
Date: Wed, 15 Apr 2026 11:41:59 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
To: Bryan O'Donoghue <bod@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vinod Koul
 <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260326-x1e-csi2-phy-v5-0-0c0fc7f5c01b@linaro.org>
 <20260326-x1e-csi2-phy-v5-1-0c0fc7f5c01b@linaro.org>
 <7712fbdd-a225-49f0-aeb9-ebcbb9d5abac@oss.qualcomm.com>
 <da3ed78d-fb5e-4820-95d6-527d540cf03e@linaro.org>
 <1f38187a-9464-4aa9-b70a-03b767349d56@linaro.org>
 <c5278028-dfe9-4d09-970a-a25977967bdd@linaro.org>
 <016c03b8-27c3-41dc-a630-8e7095db1f88@linaro.org>
 <456ded59-d13e-4b61-975b-97ca48b5e771@linaro.org>
 <RAPaPhpxA39W0ykm-Cr1KaDiJKpRqdQTXUeEmt5mQn4lJBHEGaIS010ejjmhUYEBsHjzrTX41Ek9zLU2bae_YA==@protonmail.internalid>
 <76ea03d0-d41b-4880-a48c-06570eb089ed@linaro.org>
 <0101d8bc-1ae8-475e-bb9e-cc1e16db87ec@kernel.org>
 <U7Oj0BBSw7MWOWSCyP3-GGypXsAALySEpjzoCVQD3P9O_ZWJqO4GVKLhzQn5JD4I3okCCp2F4YFckFRJ1duvCQ==@protonmail.internalid>
 <6d5ebab6-3c4e-4a1c-9578-6e926cbd96de@oss.qualcomm.com>
 <6ea214cf-e68e-44c6-ba0c-38aa0a644ae9@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <6ea214cf-e68e-44c6-ba0c-38aa0a644ae9@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: cWpoaX8qRcCuQoMfHBcWy0eIe_rkpa21
X-Proofpoint-GUID: cWpoaX8qRcCuQoMfHBcWy0eIe_rkpa21
X-Authority-Analysis: v=2.4 cv=K9gS2SWI c=1 sm=1 tr=0 ts=69df5d6c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=MidpbNYMP4jx3VwMSCAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE1MDA4OCBTYWx0ZWRfX8M3vJJNoNXUU
 sKocptdwtMAh6aocLoHffncNl1yhT3xujN51zr6pVc864M1tAM7MXNk6PoEWpK4vVvWsXwFYyFx
 o5Zlps5oUY0Ps3Wk05A7x4sZmbP+Hds6lcX4Qq80fLRdslAhoUIpz2CreXxKNTKY1IxWaViWrM8
 AxLRFqZtrw5e9DIcKKclpobHR7phF6q48rnrzvuitLrvF7m1h1GYuvTvQ7VEHrRd6fRYAd5m5hz
 FHhfE6LbYYvwsIMpgUKa9bnT0Ls3zVTNlNBIIad0NcUYUWSFBBqFdPgsfU89C9Q0V8fyaWpfwzN
 2ibK6u1DQM2RZY+8EilN8jvhcVfl9NSw/gCn2Bfafy5apbvVS29Loh5nBEFpEN1Lr9Lge8ssl3x
 f8bJzmM0N2+9OTYvgfrXZ2X0GGlam5wc9ELrtTNU0WEdvRW+OApwQZ12UoEluCtSmAG6DcgZ5re
 +zDpXOr8IH6XBEjsCxA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_04,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 clxscore=1015 phishscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604150088
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-58811-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,0.15.66.64:email,0.0.3.232:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_PROHIBIT(0.00)[0.152.150.128:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DF1B6402C16
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/30/26 1:41 PM, Bryan O'Donoghue wrote:
> On 30/03/2026 12:34, Konrad Dybcio wrote:
>> Let's take a step back - since any CSIPHY can feed into any CSID (at runtime),
>> the resulting nodes would either look like:
>>
>> // hardcoded, m may != n
>> csid_n: csid@1000000 {
>>     phys = <&csiphy_m>;
>> };
>>
> 
> Well that would be wrong they can connect to any CSID. We'd be churning the user-space ABI and imposing an artificial constraint on what the hw can do.
> 
>>
>> // determined at runtime
>> csid_n: csid@1000000 {
>>     phys = <&csiphy_0>,
>>            [...]
>>            <&csiphy_n-1>;
>> };
> 
> This I think works well and actually maps to what the hardware can do. This would be where to talk more about Neil's mux.
> 
>>
>> or we could store them once, centrally, in the "CAMSS_TOP" node and
>> pass handles around as necessary:
>>
>> // camss "catalog/manager" driver/library provides CSIDn with PHYm
>> camss: camss@10000000 {
>>     phys = <&csiphy_0>,
>>            [...]
>>            <&csiphy_n-1>;
>>
>>     csid_n: csid@1000 {
>>         // no PHY references
>>     };
>> };
> That could work too.

I personally think this is the cleanest approach, at least from the dt-description
standpoint.

For combo mode..

I forgot what the conclusion was on the sensor-to-(CAMSS vs CSIPHY) connections
or whether there was one, but in any case, I think that data-lanes and bus-type
could be aggregated across each PHY instance and the final operating mode could
be chosen based on that, at runtime by the driver that managed all this (say,
via phy_configure())

Konrad

