Return-Path: <linux-media+bounces-58908-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AzfWEcfp4GmmnQAAu9opvQ
	(envelope-from <linux-media+bounces-58908-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 15:53:11 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8787740F3B0
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 15:53:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A2B843007230
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 13:53:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A07313D75A6;
	Thu, 16 Apr 2026 13:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pDuIPU58";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jPctGZyQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B551E3D410E
	for <linux-media@vger.kernel.org>; Thu, 16 Apr 2026 13:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776347567; cv=none; b=hKDvBTho6Lbpj35RJmz0fKPmhDCkNsBriSe6tjoIWwsKh8e+faILhNiAYEjNTrdPwfcxY8wTTnbY5l2QdZN24RVbjEa9VPuBXEPpynZByDr1ZHvdbI7xuOe6o5a2xPoiOxON8v+evnO+aUDyJ3PH41aleozwXRwvGkoy7bXJSnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776347567; c=relaxed/simple;
	bh=B70FZ+Ga8PwVGy83BiIRKB7y4GG12RQVNQwTwJXCbn4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=utZbbVIXsbrSKTYDjxiDfyl42tbf7ZBCl2I7qf9+wnl84ilM60PYu/yzNLO+V3ohs17/FcOyUPsl3juraqVSGJlNVOuFCjlNodxuIrl/rA+uBjuwTT+rvs1dFAd+JQLnp1PWm9L8GVQ4y6Kgvdca9GUCf6w5n7XHKSH56W5PaFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pDuIPU58; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jPctGZyQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63G8YY7Z1702831
	for <linux-media@vger.kernel.org>; Thu, 16 Apr 2026 13:52:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+OFWZqVzZGSVKYR/6nGUmZmi/+VsR+GRP+LJUeyBYjU=; b=pDuIPU58c4TY3F7n
	SZFptInWYSXM0aMao40zBx1KsOP0xDNt7CYf0FMjjqrvHa7gWfVfiAhcR2x7KzZG
	HJ/hdYMcAhlutyD9Gn48ZQ9OKTqfO6VrNs+q8x1zSAWcpI2Thuw8Uybbr29VYbU5
	XMEZ0gFCtTO3jtOl+KxPs8skaGXHsqu8cUJkd+bxEBpgj7VBuvENRBLQuqsJ6rjA
	YMDkfpkHEuaeaiWLyB0OTmgO3eab9ILSsLXYrqRS4DpeMFZEwmim+bfsQA5xrOoV
	kBNm/snElZGuWNf/MtE9gU/3SLbZspvVlhXvHw2ixJAgZsoiGNRxWPmBSnGe9kRa
	xNOG4A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4djdamm1tm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 16 Apr 2026 13:52:43 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50d9f1bccd7so12504481cf.1
        for <linux-media@vger.kernel.org>; Thu, 16 Apr 2026 06:52:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776347562; x=1776952362; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+OFWZqVzZGSVKYR/6nGUmZmi/+VsR+GRP+LJUeyBYjU=;
        b=jPctGZyQpv37z4zB6wUgC/rVTEsPdobGZuD/silq0fWFNHWG0YREGQnjfeHhWk/vK8
         zMS/Sqrski0JYIJ1HyBOXwtJ/XLF4VHmpJJkbtKcVAvzAOnPdMX4iH7+HcgZZQBIDarR
         2EWZzd/7nxkrwb9yVkL6c7W6zyoMi0lnZp66mAMIDueP+AZ8mZyccS9FNu81H+ztkGRB
         CxMbflr5asYalAEskpbYToXy+/gEoUAgLOWpdFmEqnhoOHy2E+9NjWqSFMppHKoO8vK8
         ZNHiSgzRK/XsS+Gqph1XufejvUYO9fU74s/oAaxBZx3vZx5mnkAAgngVRRD+FQZfvCAR
         0nXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776347562; x=1776952362;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+OFWZqVzZGSVKYR/6nGUmZmi/+VsR+GRP+LJUeyBYjU=;
        b=mPdH+wdNfRm0lxJUHY2Y7gwM6+x+1SQMwVwJkCo+OtSKLVNwipoS5ZN2h3qzY8AdAW
         oyNbwkYDy5m1f7ku3ESE374RaoKl32prMnOISY8ONUXYTqsth5QEziuV+5Tq+hbb5eYH
         rKTggDoPTHlA5HUkEbKjxxBLb7ls+H87Jmx8QNMzjVDqkLaMka/QNbhwXCm7EukLyiKc
         htJrOpoIT6mXrgUE/C0NGF80u3TMee7OpBP9M/BQCfW37nK9vWuNRvyyAOUcGW/mK6oA
         sf6I2Cv8rGspoGo9pl6ApIxv/XUXOs/51nWXh4Sj5VA0O2ujNef/gZBEvCG6y56sqVjW
         jeGQ==
X-Gm-Message-State: AOJu0YysSQZO9RP8h8r4XM6M6lwoXsuF/sq42/tG4oE2uhcbeHflNhyA
	RsNNAQDAw6mcg8BWhOvIyZViBUNnWFEvBd0rialAEAPt7ezaPUP6xgHtvMVvpHb59raHV4zdrNh
	dB9pV1Ck7+0gdXrmwpR1J7bjBsLGqoh4iodASZxp8KDtTxzR+rOpf6grO/tGkKrA8Wg==
X-Gm-Gg: AeBDietj15ogUp9wUVhmI2FDWMRjj1115a0dYSLuc9hl6xI6iyxT16fPnr3j67kzmeg
	Yq+Dwsy3i8QiDsCTbsw3YVKWYVzYsmWdtBtuvSNPRAlhM99KzKs7w4z5T1d1rFZQ8YeW9M6b9dz
	P4tUxuYS43GqbE8RlUXyH6MMMd8rjjQBECf4IvmkR/yG/GbAGF6GiX19/CaruDtKz3j5R47rldI
	fHdkMDXLYIs0XM78s3vs3SGRS17pxT1rZGU+YMWlvzZyjBxDPpCSGMtU+vGfSpvC9N04MFwV0nf
	Pn6dj9zWwSwH9p8H8nPDMO+xnp0r7DbCiHl1rkicFgWe4MPhjRQr7ZVeeFVeImFwLl9Hl15tVzD
	XoSN+DLbtF5LH4wHK25M9yQCE3M7hC2wLHdO+GDC2SBwfc7DEKDMhcTmAypZzU7j3L9KEJdCfKL
	IFJtXPK5zpIoKCbA==
X-Received: by 2002:a05:622a:481a:b0:50b:2275:8c1f with SMTP id d75a77b69052e-50e28cf24f4mr24101541cf.0.1776347562454;
        Thu, 16 Apr 2026 06:52:42 -0700 (PDT)
X-Received: by 2002:a05:622a:481a:b0:50b:2275:8c1f with SMTP id d75a77b69052e-50e28cf24f4mr24100991cf.0.1776347561884;
        Thu, 16 Apr 2026 06:52:41 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba170629d7bsm171699866b.0.2026.04.16.06.52.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2026 06:52:40 -0700 (PDT)
Message-ID: <b7b6c3e7-f8e6-4b73-b17a-e5e1691a54f8@oss.qualcomm.com>
Date: Thu, 16 Apr 2026 15:52:37 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 00/10] media: qcom: venus: add MSM8939 support
To: Erikas Bitovtas <xerikasxx@gmail.com>, Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org
References: <20260416-msm8939-venus-rfc-v1-0-a09fcf2c23df@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260416-msm8939-venus-rfc-v1-0-a09fcf2c23df@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 0Y7sUU_QTHrNvb_WdgHchZO7MmpV9srJ
X-Authority-Analysis: v=2.4 cv=HMjz0Itv c=1 sm=1 tr=0 ts=69e0e9ab cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=Hal5A9k0WOgLizwzjeAA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: 0Y7sUU_QTHrNvb_WdgHchZO7MmpV9srJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDEzMyBTYWx0ZWRfX9EzW8e6wcciW
 z27bnNyurqlM7fxjpYBDHa2s01L3LDJdHjlfKsdjsNnEpZBlT1Yvn5zRkHSW1x95nHGdvypnEQz
 Qm4AeklX4ej6iE65RZhYn/D6EHXZwGuhkKn+nO/U5q+/z+hu0m4xAEpWqW6g0rhybtUIsZAZC6M
 bBpf1z9u1GfvJKvqwZ1QXRwP90EJbvF2m3z0mFniBTbj6r65RgMh/a4BkshpStTbmc8Tg0WoI8J
 8uYa7joFrvyhK5GkRvYvMLIUb0oGlnK9dyuMZw7qkDtrFhIL94Z9kjemupilRAKFzHFCLOWIfGC
 OuEThR0rdMpGg+UB4pmXDBm7BZjmr4ndpjVREieWAizdgIAJwTv0iZYldpsZicTNnRg6HUF++Gi
 1MYPt/O/Tj2ZHqYqIWkQHNwa6vOdJQ5ECn0A10obmt7YJeWT7qWBzqtLyjyET9c+jKxTyIz8YoV
 l1UOJ0nmt1Kf3rc5b9A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_03,2026-04-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604160133
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58908-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,oss.qualcomm.com,apitzsch.eu,baylibre.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8787740F3B0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/16/26 3:43 PM, Erikas Bitovtas wrote:
> This patch series adds support for Venus on MSM8939. It is mostly
> similar to MSM8916 Venus, except it needs two additional cores to be
> powered on before it can start decoding.
> 
> This patch series is marked as an RFC. Before submitting a non-RFC
> series, I would like to have some details clarified regarding how Venus
> works in order to improve and eventually upstream support for MSM8939.
> 
> 1. In downstream, particularly in LA.BR.1.2.9.1_rb1.5, the buses
>    for vcodec0 cores have only decoding bits enabled, as depicted
>    by qcom,bus-configs property of qcom,msm-bus-clients children
>    in qcom,vidc node. Do I understand correctly that these cores
>    are only needed for decoding, and not for encoding?
> 2. Currently in device tree there is a video-decoder subnode for Venus
>    node, however, for SDM845-v2 (and newer) chipsets, Venus does not use
>    subnodes. Does this mean it should be dropped for MSM8939 as well?
> 3. MSM8939 supports HEVC decoding, however, as the patchset is written
>    now, it does not work. It can be enabled, however, it will result in
>    breakage of Venus for faulty MSM8916 firmwares, because the code
>    disabling HEVC for HFI v1 needs to be removed, and as per commit
>    c50cc6dc6c48 ("media: venus: hfi_parser: Ignore HEVC encoding for V1"),
>    this would break support for some MSM8916 devices. What could be the
>    best way to work around this?

if (!device_is_compatible(core->dev, "qcom,msm8939-venus"))?

Also, you mentioned HEVC *de*coding, while the commit you pointed to
disables *en*coding (decoding had been already disabled prior to that
commit)

Konrad

