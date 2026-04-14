Return-Path: <linux-media+bounces-58724-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wDg8OSoJ3mnRmQkAu9opvQ
	(envelope-from <linux-media+bounces-58724-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2026 11:30:18 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6798D3F7EC4
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2026 11:30:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D8E26304A9DB
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2026 09:29:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4870D3BED0C;
	Tue, 14 Apr 2026 09:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UUkLiizj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PhhJ+c9W"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 346F73C0625
	for <linux-media@vger.kernel.org>; Tue, 14 Apr 2026 09:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776158989; cv=none; b=mHaLkZ8ZwuqPgoGIzCbY6anTfAx61dyoZpJszcP6pBRUWNOLjobLANaXKNOi/wBMSUC56T+QTnSO+ENo/ktP3QzD7Xgefhax23MtHPJ7NpWXykBB9icKTrpAW1Si/HIOR9Yug8WidbseKuu9+nO0xNVXmVlIwYf7oYO4c4z7PRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776158989; c=relaxed/simple;
	bh=7HquVGr9hSVRFnLZAoPF8/BbbTKUZHp/Ha1/h6tCv0A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bjoNtkDFMe6em8pqaoVmJOip0wLHVexcX1XVX2XsM9KXP/XW27L7hhBHfKdkkY7hV6K9PkYwsOnLjIVsX3r6zyAOcmnKDNqj2xUkbktoqjdI8K3scqF/DKZt6qSXgRFHKHWIuENXJAR+udrKvhm5hMoUIzzoaxst0Jy0LlbAQmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UUkLiizj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PhhJ+c9W; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63E6e5DL363130
	for <linux-media@vger.kernel.org>; Tue, 14 Apr 2026 09:29:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7HquVGr9hSVRFnLZAoPF8/BbbTKUZHp/Ha1/h6tCv0A=; b=UUkLiizjAdU27TCV
	rvY9p/8+AJOEPzrIxsfDyxUd7sYVFU9jOJdiXveeff0Yzs50M4uVTj04BV6JBOfd
	qi7GIek0zUwH7vaGWPmHjlYpgnX6FbC++LoCzKttwRAuCFKM1sHBDl4gvxSSnOys
	dZ5qTRQOcV6CANQC3Y0Gt9usgPkzdEKVjZ+cbbmdDyMYdlO8O3tpSy1QIM1qyErt
	avmmpK5uLgDrv/ggRE4OC0C5672Q5uFmLZWL4pu1D+KQ32rmo5UmHV5eIFVtcSCo
	8tjPgPsi17Fe/cgCwg55a1IfrdZxMARDonuZRmU0mqh5bse3kl/CXfC1YM3BgASa
	cpNblw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh870t36t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 14 Apr 2026 09:29:47 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8aca281aaa4so4971256d6.1
        for <linux-media@vger.kernel.org>; Tue, 14 Apr 2026 02:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776158986; x=1776763786; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7HquVGr9hSVRFnLZAoPF8/BbbTKUZHp/Ha1/h6tCv0A=;
        b=PhhJ+c9W1NshNltJ7pJ+WoTAEUZfCQFjkj4RG7EGC+as0+SANPOoQzPucFvuUHp/Gi
         N57oPCFLNFIZrmzK24ZcBeH5uLAgnxOxGittqlRdNl32Vt2oMK27O/KT5/8RkoK1gZxk
         AeVGL8BDxhjd7Flo7sx/Xfsuivc0cYyuloAf1SW5c10Yn6LkuQEImPnjmWenauou8tVj
         C43BeBf5L+AdGs9GPxkrPIXkGwJ4WTttErDp0jFL9PoOo5bqU9uGFV/tNPJ6v1zTWyDE
         +BSlCGujFk+AI0sTKYQet0/LVATwDJ63bPKUwlhtUsI6oH/3grSHfHpgmqJQfSj7txyl
         +wAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776158986; x=1776763786;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7HquVGr9hSVRFnLZAoPF8/BbbTKUZHp/Ha1/h6tCv0A=;
        b=AbuPtBFOIHVDL5a4kPxhZCSd4F/5opfPFiXn9BX0JV9ZE9yQIF+tK3WMM4L96IHHWn
         j1MvLRskVEE5z4lLfmcPed0ssVWmtGF9f2oxvgDK4k9mvTkjwhThQaaDbzdQwWjyRrrZ
         uPTWk80a1ZZlrvWsZdIdbneM9gnGuBRq6bqqPdbYeuaYig0sPcGCOcveY9I7/VUVKECm
         ijUO0Nc53eXN0c3tPgj1Hx91G9M5UZz2bVeIHgzEHEwRhIUi/C40yc9+CTm0y8rAgPbK
         aychcSO5JuvADtjfz7xrHD2Bpyby26fUDpefSJ3NmWxKeEInjTDrovEtBZZKr0wkr4ZR
         PIYw==
X-Gm-Message-State: AOJu0YxUxiQdNZJVZBlIZ0N4BWt5kdR7NRqjAfym0CDeugHX94n6zjHz
	o20WwBfAIqn8vb9fSUyo6Zdlz+1phfLJg7ir5xTe4XqLLqfw7zC8Ds+MgmUCZ5sJeoQq0vVbMFF
	bPlkF2tjJ7GT8P0C2cgnh71VA42C4fECzaxf91+75gDC2XdfV4uNtEaiM3H2X9iLJcw==
X-Gm-Gg: AeBDiesoIcvuZZU10cRaenqHfrmWM2/HjpzFJeCMa4BGwjAH9niZ4FAiUkPE/IVaeq1
	yrLc7qfJ6dID3KHwov5mlS3/PiTxmNG1CusyrlwjqZyqFpIoLgBPoMQSmlJ3Bt2ByhPhsks1Mr6
	ynEjN3sSqQczpEbpyT4AfO3Z+CPHp+R2ECC90xRdaS0iD7qWLW40Ph7+A9OtGSr4/34X4sdUswo
	Fd7fqTvQlI92222mo3bHxd4Zg6Zy6b+0yu3cbOGnFjDOzK8O0VOjkmRf7ypuFxaIXqwK5hAu7Ti
	dG6wyEzKjiaVof+Rk5vwl5F6z1Rb68Upzjn2atVKKpd40RHg7nuRDLirdkER+/ioke3AtSJAYxa
	cr2BLDDCjR64wYcsZhgDhT1vyNfeNxQRKEinsoMKt8XlygoAQQHmuO2KpUFxaIt4oXEV8GgNrLo
	MUXDnIuuRdVwk5qg==
X-Received: by 2002:a05:6214:5013:b0:8ac:4fd1:2d5d with SMTP id 6a1803df08f44-8ac86297b62mr188939526d6.5.1776158986471;
        Tue, 14 Apr 2026 02:29:46 -0700 (PDT)
X-Received: by 2002:a05:6214:5013:b0:8ac:4fd1:2d5d with SMTP id 6a1803df08f44-8ac86297b62mr188939346d6.5.1776158986063;
        Tue, 14 Apr 2026 02:29:46 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6de97e36sm400411166b.10.2026.04.14.02.29.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 02:29:44 -0700 (PDT)
Message-ID: <fe1e2ef2-dece-4864-a89b-a311b3ddbfcc@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 11:29:40 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/11] media: iris: Fix VM count passed to firmware
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
        iommu@lists.linux.dev, stable@vger.kernel.org
References: <20260414-glymur-v1-0-7d3d1cf57b16@oss.qualcomm.com>
 <20260414-glymur-v1-6-7d3d1cf57b16@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260414-glymur-v1-6-7d3d1cf57b16@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=C9vZDwP+ c=1 sm=1 tr=0 ts=69de090b cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=UlvO0n_oXqfwqGaIblEA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA4NyBTYWx0ZWRfX3wClmlPuwBmz
 oiVgzkOcxsxbbUwtwTwKKLyC3mpUSfkjJ4Q4iNmMwg3w+dnj+BzGNtvyEcWMwcq3BVucLqgVqmk
 mwC4Y8HAndbptTJj+tT4sHCtBIjppDob8Wzdj9rfbzoy9je2CkQoIyH9LslmaLCA5Fc6mc420VZ
 QUl7CY4ITVNukmuvv/+aJb5ub81JzA2EofmQNoUl1DvQBjavN754XVnT+TbRpXi2Ve3pIpRPZAB
 W/AoVe3jjPldBb+yhF7r9vjcRue8yGBVNxMR6OKF1ThyOqiAHDi+n72/9puTKscBf6CjNhmND8E
 giiGrsX216fpXZ+NYgC6X1rwQ5Vz8B8o5bWhW5Nvdg/0WLKDxbV4JxB4ywVKBLqQezrsy+8qlQC
 MMn6QScJwojtXiRojSpJz3LFdxgpZ1SLAAW3/JFQvtYnVAB98Jea9KSTA4b4vgdEjwM8AKPwAJ/
 jSfu2F+wFfWoCZBA7lA==
X-Proofpoint-GUID: P3mpKO0wM6PGuMUsg2XkwcOW0O5NH5vh
X-Proofpoint-ORIG-GUID: P3mpKO0wM6PGuMUsg2XkwcOW0O5NH5vh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_02,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 spamscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604140087
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58724-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6798D3F7EC4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/14/26 7:00 AM, Vishnu Reddy wrote:
> On Glymur, firmware interprets the value written to CPU_CS_SCIACMDARG3 as
> the number of virtual machines (VMs) and internally adds 1 to it. Writing
> 1 causes firmware to treat it as 2 VMs. Since only one VM is required,
> remove this write to leave the register at its reset value of 0. This does
> not affect other platforms as only Glymur firmware uses this register,
> earlier platform firmwares ignore it.

Should we write a zero there, then?

Konrad

