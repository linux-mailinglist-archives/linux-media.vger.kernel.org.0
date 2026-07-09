Return-Path: <linux-media+bounces-67186-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id g5FsNfC/T2o2nwIAu9opvQ
	(envelope-from <linux-media+bounces-67186-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 17:36:16 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 27CA7732FB3
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 17:36:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=HgpvLHyv;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=fTGBo5a0;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67186-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67186-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 39F3130AE9FA
	for <lists+linux-media@lfdr.de>; Thu,  9 Jul 2026 15:28:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 873DD3839B3;
	Thu,  9 Jul 2026 15:28:15 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A499A3803C6
	for <linux-media@vger.kernel.org>; Thu,  9 Jul 2026 15:28:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783610894; cv=none; b=iqVqnfcRhQWa3GXjmrgwtdN0ZbeQlN7UIcHVx3XtKTURUlYAsR5Xvl3LRKbs42a1PH8KGxRJlAy1+dU9jMU1n/rr+HEz6MMruePsRFMQJsbSa/qO/pXQnjyuwpbvZPrhNnPBP5zX724L9/yxxoI6488u+p2ZgY30dMHwgtaHWiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783610894; c=relaxed/simple;
	bh=hhpoffETOuifw+MNksNM0dLoI7WKZHtIwfPDeUBNl8o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GVdjnDnpMmcolrp7wR/FHRpra2+g34Qu/XHjsbIlrwTVHNvvcJY9DOfIFmilCFAa3sqPynI36JIa3a42KvaNCbENiiBA0TJv0y3XwFI1+1LctDBKf1qFTB2I/2ZnD2Uj+/fk9P+0Sk7urXhtO3O3algWDXPl9KtvTttODuNaAgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HgpvLHyv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fTGBo5a0; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669Dvwj02001929
	for <linux-media@vger.kernel.org>; Thu, 9 Jul 2026 15:28:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hhpoffETOuifw+MNksNM0dLoI7WKZHtIwfPDeUBNl8o=; b=HgpvLHyviZF2l86A
	avaqMK/HD9K4u+4v0YOvK+NtbkudPr2r9wXZSpXXZNSQNnTSm1OAcOUOkeNMU/Js
	Ct91/n7EdsTMkDCQtSPPJivDjALwt7rsquxAQbH97zPdx0w5NQG5nF/piNU6Hwvs
	EI5gTdrrWagAihHic8S3kqskvWOUW5GzQwZjtyIsbebbIaITueNf18Lf4Z5b17is
	m/WYYryEDzKQBwmD2I+5/lAjSOzxrU/RmlbzICjn5jDLBUzJ/Q3aitci2VB1S2dW
	bMfICuoaqCWfsBgsf99BvUSlMfVxhRTMpf22UvyiqYnfG6wSeR0Alp305EygksoR
	zrnfQw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fa6p3tddc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 09 Jul 2026 15:28:12 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c354050c34so32538295ad.3
        for <linux-media@vger.kernel.org>; Thu, 09 Jul 2026 08:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783610892; x=1784215692; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hhpoffETOuifw+MNksNM0dLoI7WKZHtIwfPDeUBNl8o=;
        b=fTGBo5a0tXztKfsT9uvnojbNEqPZJlyUZAz3zhLUUGKCSKu7lhlvHIQULK6FEBIsP5
         Oj0UQjx+cvrWYyrpH6Fo8afOEyXrtuttQJINlpUtGFyViNcHjCPFmKa0Jj5ZZRH+goZN
         ocGm1kfOP9ORBaRJrR3fOm7cNlvQR6exXUCtIUTlsRMWqhcBf8LrEtD7gQomEsPsjPIm
         iJkVXVbbSYPO8eGxdKYuWYEAzbbysCaUs5n+klyvNi9NGeJet1CRD/tS4d81FnvZ3/4v
         1yffG28HqFwb6L12QBaZaUX0lRVXogFoYZHyd7FeUEbu6cwT+nA9RlNzm7NtZevwLSyz
         81rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783610892; x=1784215692;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hhpoffETOuifw+MNksNM0dLoI7WKZHtIwfPDeUBNl8o=;
        b=OmR2mm3u4vLp6BTlDxab+hIfiHYP8OFHDoxHg5xnW5Eg+pMmsWD0OvAJx5p+QqMQR2
         s039E6Q1WMhopJOT7MFkrGWfTgD2RK0rkQjxr2k8IA47THNAUZ6EjzP2GgdoSyI+8gsx
         5U8fUC4y9aUHqFTgox+8pGKGycX9xBjSMLFsM5i0mFBmTMu67jxxfIlfGOVAQ2AZJ1BU
         tOBMVRZf6qxjwoi4d1vqatzmT3KhK09ZWfhBhVC9YA4JotR3PMWZYTcCw7EXZGOJXNMO
         9MD9e0WIxe6hyJDky8C5JUuxjCJIlKhcYJcdPMAxbdb5jd4GPPqCkWA3Qkoh9TYKUAT2
         g2Pw==
X-Forwarded-Encrypted: i=1; AHgh+RpLFzxIiwzlRYv8GxUZYupteBRL5i6AAr5D0ICkKNXGhkkN7/OG/1UxcI4C0XaYn9WpqgyJGoXQsRkJyg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2MK5ZN5j0nISI+RE/JDSeRNbx1iD3WP21zw9ezorRI57FBI68
	SsPslNfjJH6LcRNNl+kmvY4lk1g6TyXKe9czVPHdB/cNJ/J1PDdhSou9DHV31bN5GeAS2/tmnTR
	AvP86H5eWWCmqOdzdDlsXTOWVS/b4SUPHrkiAoy++x1nGIyVZAmz53vzWCUaBH6yF2w==
X-Gm-Gg: AfdE7ckX60zzClQoCtBPu3l6U2QilIq0SdHMz/Q1jDva9BzDygwGXjNLLP+pn66gU+L
	AUNlAntJTj+F30r5eA03vR4IA1YlAHL7KGwMHU0HB5a0N//x2XctSAxP1X7064levdkPwdtrg8z
	o2+dCb5q5QBlt7Fxgb6cjvElQsrMCJIjRTHGvWfYpeoVo69gxgAXT9F1+4RZM8u+B+hGCSNu9e4
	ZFi1e6PXphbpvSAMT4x4EQLFz2W+at4SrTLI3kyoiDCM6STX10OxFtwQrk16Be2wOQR8L4Gr3lj
	L4UJEOj0INobAASyJk3s5SEaOdqAbXhpLB4Td54CfobrpNSMBlwRae0zgZUqLZg60BGw3wjoHpo
	K/fv2KTnUiyHEyWPuF7RHz4d+sSH1terus9LbuqBWcw==
X-Received: by 2002:a17:90b:1d44:b0:37f:d9dc:557 with SMTP id 98e67ed59e1d1-38940638b51mr9375025a91.16.1783610892170;
        Thu, 09 Jul 2026 08:28:12 -0700 (PDT)
X-Received: by 2002:a17:90b:1d44:b0:37f:d9dc:557 with SMTP id 98e67ed59e1d1-38940638b51mr9374988a91.16.1783610891627;
        Thu, 09 Jul 2026 08:28:11 -0700 (PDT)
Received: from [10.204.66.221] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31198cb2b99sm13681204eec.26.2026.07.09.08.28.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 08:28:11 -0700 (PDT)
Message-ID: <85a05836-6298-4111-97ca-80d7e3b3a9c4@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 20:58:02 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 2/6] dt-bindings: media: qcom,x1e80100-camss: Describe
 iommu entries
To: Bryan O'Donoghue <bod@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260708-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v12-0-f8588da41f16@linaro.org>
 <20260708-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v12-2-f8588da41f16@linaro.org>
 <HCPw5KYwtYb7jBFED4lssTvcaMo2bK808SHkTWNR77q0DXGPQklaADJXvuyeBrXh_GsEMKdiaaktkzQ9_xeseg==@protonmail.internalid>
 <cbc1b1eb-0064-4999-b829-2bec451c682a@oss.qualcomm.com>
 <f307848d-6abd-4e96-9183-36f8599026ce@kernel.org>
Content-Language: en-US
From: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
In-Reply-To: <f307848d-6abd-4e96-9183-36f8599026ce@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: RVgBeTzSDf3u-9pi_hbHz6bsXXM2Za89
X-Proofpoint-GUID: RVgBeTzSDf3u-9pi_hbHz6bsXXM2Za89
X-Authority-Analysis: v=2.4 cv=TPh1jVla c=1 sm=1 tr=0 ts=6a4fbe0c cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=HI1v2mgwsAgm2NAubtIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDE1MiBTYWx0ZWRfX3p/jTFfjA/Z3
 3Q9wu/8TM2n7qJLAZObf7LMPKE5w3L64tVUL3uwo8u6YgsPTkayaGpdk6KCTseMpkdjc/bLb+By
 2QJUBjSmEmm17S99dUVP0sK8k/1NnTE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDE1MiBTYWx0ZWRfX89kbTFvS04Pz
 d6FpD0CpD8+7p5TiuYFtNOabChAAeKb4hwFUlT3NfV9YPZmuRiIOih0Zk3noFgwatncdW3HuSZA
 rrQYpXunFtiHhzNT0i0wzjCKCQtlcP9zkNs6uTkTU9WtDKRM5SIrkCbitWMMlBnZL/VccSzsd0m
 zmDyZGj4jXGrAOBVo7d/2Ii/43VPJCJZ10QuoPvC36GMfhIjAC3LewIPXbBkZwvDuSbCdvPkqkn
 Wg6wCjJ1PjobrcQDj4E8xOQJR+sBLkdPvNPe+Lpe1NZGzS5ZutCdAXrmmJtPTwwJNMHDk1yW7FC
 KLPtTdE1Xub8Ifm1lXajthDGA+GXqW6TDd5zdMcs2Qlxvghe8/EUvxgTmaaLgUJwmhyDn9/qFAz
 FH6Iengx2/F8DsCCQTtQnTVRPNM4Usvrc8cnioM8memXliSj2neXqbpZNXl86fsY6igqvgUmUkq
 vu3R19XEElQO5izngnA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_03,2026-07-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 bulkscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090152
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-67186-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:bod@kernel.org,m:bryan.odonoghue@linaro.org,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:rfoss@kernel.org,m:todor.too@gmail.com,m:mchehab@kernel.org,m:konradybcio@kernel.org,m:vladimir.zapolskiy@linaro.org,m:loic.poulain@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:krzk@kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:conor@kernel.org,m:todortoo@gmail.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_SENDER(0.00)[vikram.sharma@oss.qualcomm.com,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[21];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,baylibre.com,gmail.com,oss.qualcomm.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikram.sharma@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 27CA7732FB3


On 7/9/2026 3:02 AM, Bryan O'Donoghue wrote:
> On 08/07/2026 16:15, Vikram Sharma wrote:
>>
>> On 7/8/2026 5:36 AM, Bryan O'Donoghue wrote:
>>>               iommus = <&apps_smmu 0x800 0x60>,
>>> +                     <&apps_smmu 0x820 0x60>,
>>> +                     <&apps_smmu 0x840 0x60>,
>>>                        <&apps_smmu 0x860 0x60>,
>>
>> I think only "iommus = <&apps_smmu 0x800 0x60>" should be enough as mask which 0x60 is implicitly covering sids like 0x820, 0x840 and 0x860.
>>
>> Regards,
>> Vikram
>>
>
> These all come from the Hamoa iommu defintions in qcom docs.
>
> Can you double check for yourself and let me know. 
Hi Bryan,

Confirmed — all four SIDs (0x800, 0x820, 0x840, 0x860) are valid and documented for IFE/SFE. My point was specifically about how the ARM SMMU SMR matching logic handles these with the given mask.

In SMR hardware, the mask field marks bits as "don't care" during stream ID comparison. With SID = 0x800 and MASK = 0x60:

MASK = 0x60 = 0b 0110 0000  →  bits [6:5] are don't-care
The four SIDs differ only in bits [6:5]:

0x800 = 0b 1000 0000 0000  → bits[6:5] = 00
0x820 = 0b 1000 0010 0000  → bits[6:5] = 01
0x840 = 0b 1000 0100 0000  → bits[6:5] = 10
0x860 = 0b 1000 0110 0000  → bits[6:5] = 11

Since 0x60 masks out exactly those differing bits, a single entry <&apps_smmu 0x800 0x60> will match all four SIDs.

That said, I'd say this is more of a preference — both forms are functionally correct, and if you prefer keeping the four explicit entries for clarity or to stay aligned with how the Qcom docs enumerate them, that's perfectly fine too.

Regards,
Vikram

