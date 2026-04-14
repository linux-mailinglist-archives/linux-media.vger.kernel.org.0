Return-Path: <linux-media+bounces-58743-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MFD1L/9K3mkzqAkAu9opvQ
	(envelope-from <linux-media+bounces-58743-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2026 16:11:11 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 564CC3FAE5E
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2026 16:11:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 12E0D301E039
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2026 14:10:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B50E93E8661;
	Tue, 14 Apr 2026 14:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MnP120yy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VmASR2zE"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13DAA275AF5
	for <linux-media@vger.kernel.org>; Tue, 14 Apr 2026 14:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776175850; cv=none; b=TsmDNXBhofjwqeWnx8SqbJ6p2JjqcTPj47YG2q5iizDDxIEG4Z549Vgf30frzXPyHlkGoOtewXgPXtXE/5jhU0vKIW3NNlrjRvkVbzhzbjSBkT7r3mls1jP72amlZHNxiiWAexBmuIoQqltkghJbsm6+8HVHkx31E0niYx0Z1Gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776175850; c=relaxed/simple;
	bh=wRoc8vqU+Do3/rxWz0CWoGTRrOvwHOWj/Ks+NtJU8Ps=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u9B5Exob0FtYvyNR0YQcOAb94t9nvPDO1Hcu4XnSNC9xPR2FnbV3csYwMCFDzAcOz1eYvX5EOb+ODAm5sVMv2y9eDjTkLIjh+UZW70Hn9tj3+/CfKrQpsyabYKivS1cobsm7fYX+CIfL/7/eU03s/+W9GfIAn0vRuV6pa0t1IiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MnP120yy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VmASR2zE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63EBUJcR2386374
	for <linux-media@vger.kernel.org>; Tue, 14 Apr 2026 14:10:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YKQ7jg3Wkyd4r57T9ATozmR1799CYsFYrJoZVTakFlw=; b=MnP120yyUxKXxWyH
	Uh/UFCnxVbwpuQevgHOeQ1ng4S5LscTrPexdQoyTfxEc8c6TwZAhfvJPI8jdhvXi
	sH/l1Gx6Y36NwVnx1ZcZWTEq0MOYAeyAWW78zAFvKQSbFiAvwYFYqS2/pEmFRrGo
	8MwYLWDDbRpC6z22vEgWUTkWElTjf5141BN2lJ3XtFx9qUQ5dupkMaGkrikOrgwN
	wc38C/F1pTrSTlFCwG2hSqgZIysNph9xp/P8fqEYmTF1VSFnzUOQB2ZZmYHnFXj4
	5O8QRHL8Hh3DWLsWoPp9Ak+K5HsHf9BgJjIxLjB8oiPFEPdLQ0PWNPm8XDhkXHYf
	X6gcSw==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh86w313e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 14 Apr 2026 14:10:48 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-56d85c53a3eso452516e0c.0
        for <linux-media@vger.kernel.org>; Tue, 14 Apr 2026 07:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776175847; x=1776780647; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YKQ7jg3Wkyd4r57T9ATozmR1799CYsFYrJoZVTakFlw=;
        b=VmASR2zEiHQ0+WL2ynSjRboQO1zE8bY8zyak7ZdhGURr/SIgXMo+5y97o/4knY0t0o
         4eiGSqnv9AHcwHqg0UjFv06Dy9XLYBlRRqWhN/2uoKpDB7pr1M31P3382ymBgqLHLuaB
         /pEwH3u4tK+eUQYGRfcZcbzSqBmxYsmXAwSCnb3cJJYGbaRVsLKBoEyvvEDGxYk0qdrU
         CvETrsmQVd3RZy+eCzvFNAbG059zdCQGzlllLYWgvUDBzHcdfjoxTBiy9neGGdVox0Dr
         8tTjiAgo+iYcLW9c+uFY9rbBAyKpgkCgZVuK5FAB3JrwKH6/NIoUAbbMxgX2lxKKNcqX
         GTpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776175847; x=1776780647;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YKQ7jg3Wkyd4r57T9ATozmR1799CYsFYrJoZVTakFlw=;
        b=FxxV8/9nIbgzi0sFHAANdkI4B0brCW5FjhDCa4+M3RF5tVunCDr2Q+aHSAU5dDozh5
         PCHA0J9y596QdCWwI/FKyz/i5RkCV/3BTVk+MzhubwVMS4X3KlLxxujPtOMy7wQXu7Nj
         mz9pGBPL+1dr8hOiHjmj0tqHL2rwCWiyl5ScPPJ5V+SbsjEg/Uj3zv07+dz7foSQKyDh
         EE3x/MJMGMGYn64PutLY8h1ZJLjkofiWU80KTJw0MaxKDhqNcVDszkb9aAnaU0or0m1n
         tQc1ma0EqoJrC6KpiI0VMeH0kvqGJuM2deX6wHbxPjcTFW4vvQSRCz7WXn/ashPA8OGr
         7xZg==
X-Gm-Message-State: AOJu0Yx63hKPTbS4msotQza/uw2OaN6jiNQNIcKhgRGuf9hCRTGSeev/
	ONn5d/jTCyX2Hy/lszk/A9v0QJkdHNi/mlKwAER+tHlzCF7/ywUXRgvp3hKpWe5VrC341KGDiKj
	+Nv7PHDb7ldml/tJXeLoo4dxpTUpU1D4yWUTAlINrWdH0HzWLSkbagNMEe5QugLtodA==
X-Gm-Gg: AeBDiesc3GECHDVlHo/JTnkREJyQ+IkGQ4rFWxmeeWI+BUz3U9HZuO0H4VyoIEubOZq
	H5lKvF3yIGW/XibyTRC7phic4PgBDJ7bRemNM8voob5c6Q0XrV+IYq3oxXV+gMDPML/WW0WpDhG
	5ecsIMhB1w198P5c3K8wq0+/krBfCY5M0VViv6hG0ON6ZfDzcjFCd7u9MVOoo0I3KujppDbO3i+
	JD132w52e/goPVvayDexIjsVielzuwxcCzNL1ZHVt3SzrE3TBa69DwY5vM7fCS2Uy5zgRZI7w4C
	3bK5icTOZDJH36+Ls6SZzcn0ysPrro4nu0yyGEshBgdBBVqG+rxbCwSLgq6SYt/wGiYVWxMAXPo
	BiSua9ufinDekdweXb3hv/rvzBqeZ3YE3aGg6NLT8SZIrRjYvvuJmCu44Ej07Mo850CZlwInp+K
	OlOFdJKXs0mYXotw==
X-Received: by 2002:a05:6122:84b:b0:56f:5b59:5226 with SMTP id 71dfb90a1353d-56f5b59611emr1679939e0c.3.1776175847416;
        Tue, 14 Apr 2026 07:10:47 -0700 (PDT)
X-Received: by 2002:a05:6122:84b:b0:56f:5b59:5226 with SMTP id 71dfb90a1353d-56f5b59611emr1679918e0c.3.1776175846929;
        Tue, 14 Apr 2026 07:10:46 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6dfd88c9sm417722266b.23.2026.04.14.07.10.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 07:10:45 -0700 (PDT)
Message-ID: <ad4f1000-cdfa-4c21-be9e-87cd65f2739d@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 16:10:42 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/11] arm64: dts: qcom: glymur: Add iris video node
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev
References: <20260414-glymur-v1-0-7d3d1cf57b16@oss.qualcomm.com>
 <20260414-glymur-v1-11-7d3d1cf57b16@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260414-glymur-v1-11-7d3d1cf57b16@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: -ywwu_DD8jUqc01s5jfimhyC4RWUl0jQ
X-Authority-Analysis: v=2.4 cv=HKfz0Itv c=1 sm=1 tr=0 ts=69de4ae8 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=xYufHl49NKEuV1FEiosA:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDEzMyBTYWx0ZWRfX4qoopGMxcPLd
 3LZ0Ue69nzosdzbQyRYJ0RaW/N3WYSwd62DwMguFGTmZPOfLv62oxeXqO6vziU4MG5Go3UVu988
 rzh/qUsVoL4pXU2ny8mvtryD4/HA/u4K91QJcQyMAU0SevWf0+q5cP812ozs3joJo6/7xiJFRBi
 2RTu0pjvTrZ35p4P/ggOeShsvdc7xjYeb1+vj19wrqMLdnALaIlfxKZyilIFH7PlxspRFNSzMOD
 DLEstyCIKIBTmqv7fR6AZlF62yips6tZktwNmhlr31dmOW0hD7Aang25CihAsm9tqf3AZchLXCH
 p2Ahh/SOxUIHKGLChYrtnSCxaAsmWxcF/cuex5vsNZVDFP0DlhIquf3Kf/hA0KRr/bt9XdhxxQ4
 jGRElnI+BelhRfATFGDcX/2xydyUyv9gsgqRikbZttH8jCcpjzbHX9OUSFB/aouVZh3fdpc4Uwa
 bzBAaflzJXRJvToM/8A==
X-Proofpoint-GUID: -ywwu_DD8jUqc01s5jfimhyC4RWUl0jQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 clxscore=1015 bulkscore=0 phishscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140133
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58743-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 564CC3FAE5E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/14/26 7:00 AM, Vishnu Reddy wrote:
> Add iris video codec to glymur SoC, which comes with significantly
> different powering up sequence than previous plaforms, thus different
> clocks and resets.
> 
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> ---

[...]

> +			iommus = <&apps_smmu 0x1940 0x0>,
> +				 <&apps_smmu 0x1943 0x0>,
> +				 <&apps_smmu 0x1944 0x0>,
> +				 <&apps_smmu 0x19e0 0x0>;
> +
> +			iommu-map = <IRIS_FIRMWARE &apps_smmu 0x19e2 0x1>;

Shouldn't (almost?) all iommus entries be instead bound to a function in
iommu-map?

Konrad

