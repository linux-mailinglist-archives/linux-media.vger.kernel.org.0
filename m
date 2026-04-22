Return-Path: <linux-media+bounces-59326-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mNpsL/i96GkHPgIAu9opvQ
	(envelope-from <linux-media+bounces-59326-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 14:24:24 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 66FD9445DD1
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 14:24:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9D5EF304627A
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 12:23:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 267013D3486;
	Wed, 22 Apr 2026 12:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jcQUWSvJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hfQSrrEX"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 607723D3318
	for <linux-media@vger.kernel.org>; Wed, 22 Apr 2026 12:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776860623; cv=none; b=AUMCpIrB3S0f5PuURMGJCfbFrXYryFBPbGa2s5jApbHHGDvb6riPMbgs8O2kgYMTL61EIfCouoKQiv4SOJRburYBIPP2/XALc9TJTfMUfKFaP6HNu4Oo4MY4OKWwkZGqAVotf26FKuGuwak6iWsXcfmhaI4D827LNRAI7QhHYjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776860623; c=relaxed/simple;
	bh=iXyuKkBV9S3PbQal8Tllgo7nd1UWYCF83Gt1Z0MWTPo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L7o+BdPsZWex/tOZE6aTHeNkprxheuWST0dWyA/F/NZOU/H8pdumC6DdoyEm0+29+cqQk4FA5qMjj7QREtGmTGzXMJ0b4pyoJp0lhWZPQZfwl80arqp5IErlc0xHZqwarNiXUsXbhxzB5qyAEva8kb+alh7KAf0Ejak0BcYdFu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jcQUWSvJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hfQSrrEX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63M995Vr1081541
	for <linux-media@vger.kernel.org>; Wed, 22 Apr 2026 12:23:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Yjt06j2+GY+zSvMJMYvCj4wFlF2HsshkPFQGtgLqF8Y=; b=jcQUWSvJjWHsyvjH
	ztEcsTIgsZZ2niq8w3mlWaPivlAB01izwMOxwFU/gMunKULiBt28xV8nfkzSWavb
	vMhZwyscVdpRE0gIS/B4wr3psqMIvgfE7RxXUxzwKbw9MVYNaGc+hV0vBdnTxiM6
	30ooW7CCIb6HzAjFXFMlNNFSy1lPhJQzb0CNDqfvx4dLl3P34Fd8xKQrxbOKSb1Y
	DcM/OQi4U8t/pTXlRCNTBxub5DhtS9Fawt2XhZoZBBGWPHEepe/ic3Tu3b+WSU42
	8NuOmcXKBIALJkYMayPN2whRAqaPbNV3Ex7HJBJPouoNKh5rBlmiFeF6D592YIVh
	2ou0hw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpeng3bvr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 22 Apr 2026 12:23:41 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50d8c183c2eso50082871cf.0
        for <linux-media@vger.kernel.org>; Wed, 22 Apr 2026 05:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776860621; x=1777465421; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Yjt06j2+GY+zSvMJMYvCj4wFlF2HsshkPFQGtgLqF8Y=;
        b=hfQSrrEX20+vhwKCJRRqoD/dzzMcAcSnMvKZJS13HjiMX1nnCG7D1CdXdwN3Y50s2n
         pkkypQTerSNCOUv2GRfdh+9uJlanRbHirlWj+YejcUI/jgkOO5hX47azGCnbWtXhh47R
         1fN3cHHAPekmFL1E5qZN+XofBf3q2BcqMe/sb5kRZ/wKyI7gGaq6cqEcMiDFSvWSFU0Z
         vqhwb5cxd1XXENv7VdC9RUhkhulclRRm4PhFbsAd0uF15mO/BRJEOp+yKjN7brO58aTO
         eNtI/GuMTWn8uwy19iz4sj3k81yitKxGCiesDIEkng8s/ky7TY2g5vTIQiG9qJp9A4nd
         lCyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776860621; x=1777465421;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yjt06j2+GY+zSvMJMYvCj4wFlF2HsshkPFQGtgLqF8Y=;
        b=hTdLEca+w8bT78bO9FnNzv/wKROwzdODnAIa9M4VusDcmkurxUq6wtQEWwlIgliT2m
         qM6pRfJlYveQsJMDuSjUNXhxbALwKsEpeT4RhwfFgYIDbxyaU5nizWfsuhxBPJMEkTV/
         u8dOgtrCyZFFhGZHuJ+YkpbOIRzb95VA1mHenpYegj3zVbp/77DuIN5pz7RHeGAA6fLO
         Bxz+XtnPBrM+zX/POQ7cLKVnYBBgX81IJ7AWv87zxcI+VjlgRJTO7zRkNR8En/eCoou2
         Mmi1LNbuvnTrtk1svrLswoyrj01lhTwszCpx3pCDgn1R8kH9Ykkti86HaZlaJwrmp2A8
         707g==
X-Gm-Message-State: AOJu0YwAeg2VLR99gWNHFSD3DaEVQFS7mDoDFmIrOeIH3xNT0O/zpdvu
	OiFQDW722Q8DYpRenKQEZzMrTCp/zd6vimorKVQGZIhZaN5RUd5CgwiCXR+dWnPsdWjQiOOMQ9f
	xfEMdmhL/+VLZyvZSSs39s9T2AGrhAIMnKIWOIlRoHRB5jHoTo53cHR6vqKJOIRdvOw==
X-Gm-Gg: AeBDietD95lxvk8kiwk8F5eVlbM5cb0AwgFXRzATRC4BVRcGozWaT6WuUZ1ROxh3wQs
	ij/2unka0n+lVylDz0K+peMS6LtROtnPuzARypRS3pVKtckF4f7n/mUXVS//49a6AuwiOCTI0x+
	ygTmCAtC/5D7qVrNu/GC0pMOO6gT/ikMOxDFHTHtfBSu843fnVvOHIh5FlJL0Bi/ha65luSGMIl
	L8PRtPG/XIqSfVmCPQYcUpGTGzhaehpMAEG2X9A9YF3U5nDmtgtRXJuLy6cGlgarqncNW2SIEzq
	MxD+w8bx19A5U1Ww1CLMEcodS/AFnZyQVILeOaL69yXxpqPLP7RA7B5YVPdR0bTXnU0DP0MFpIx
	LeJKf4M+a1HH3wG4zO8xmTehMt4u1hUmP/wVyAqYq6N8XMsdJQ8bnoiby8ZtWWWZKyhO+RrODap
	7zovMSVQGzIu6mmA==
X-Received: by 2002:a05:622a:15ca:b0:50b:5286:f756 with SMTP id d75a77b69052e-50e36c51b96mr220843801cf.6.1776860620806;
        Wed, 22 Apr 2026 05:23:40 -0700 (PDT)
X-Received: by 2002:a05:622a:15ca:b0:50b:5286:f756 with SMTP id d75a77b69052e-50e36c51b96mr220843421cf.6.1776860620332;
        Wed, 22 Apr 2026 05:23:40 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba45553980csm537315066b.58.2026.04.22.05.23.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 05:23:39 -0700 (PDT)
Message-ID: <5b740daa-132b-4719-baeb-c029bb82f5d0@oss.qualcomm.com>
Date: Wed, 22 Apr 2026 14:23:37 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] media: qcom: iris: Remove dead assignment in
 iris_hfi_gen2_set_tier()
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20260422-iris-code-improvement-v1-0-8e150482212d@oss.qualcomm.com>
 <20260422-iris-code-improvement-v1-4-8e150482212d@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260422-iris-code-improvement-v1-4-8e150482212d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=CNUamxrD c=1 sm=1 tr=0 ts=69e8bdcd cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=gpaKJrZyFcMpK8QZ-bcA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: UPG5WOFUuc-iFnhuU2YcWtLBnidlptvV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDExOSBTYWx0ZWRfX6MXWzD8nxVeO
 7j4aZBIwk8hoZV7ULlmn7p6Ta7NQ7NVRGgMw+S+jqft7uPnStayENTh3/1bTsgh/oW0mIJY6iE8
 BhoxTs/ADbgAXpspFL7QaoluqA1kDBRCa1Epuh3AdypdIEMLzvV3Asqio6SlNkuwZUwNVsMnoUy
 49mvhFkPbahvKeQB/UXnjr8Bu6anudsuSGrPHJKCz0KPI0rfZgrF78rdO5A8U8l8RHFBJ4wZJyJ
 F7Q52K4Wodtvz8NPMh2IaKWZb+NypB5Y0kb8qyvpfcSYecLe5BE/LpwiDNnQM1rVEXl1hDKP38G
 NFPMVoQPN5PaGNWv5P1QYo/RoDjpGub8i7u544LuugVzfNwTUeujx+XaGRaXXSskdJobe2qJAJ6
 SCo8NZrTeC73bmy4uFnz/5ZqZWOYrQYvwvFwmtOVOxQlm9GblKzTx1nij95BWj6zFhu+G003dl4
 F9VTCCuKKwEiCGTJVJw==
X-Proofpoint-ORIG-GUID: UPG5WOFUuc-iFnhuU2YcWtLBnidlptvV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 phishscore=0 bulkscore=0
 suspectscore=0 clxscore=1015 spamscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220119
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59326-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 66FD9445DD1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/22/26 1:16 PM, Dikshita Agarwal wrote:
> Fold the ternary initialiser directly into the variable declaration,
> removing the dead store that was immediately overwritten.
> 
> Fixes: 2af481a459a4 ("media: iris: Define AV1-specific platform capabilities and properties")
> Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> index 30bfd90d423ba024caf6ececc827f7102e8f3324..06698fde639ec654ff9ec78a178271ab2284f5f0 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> @@ -536,10 +536,9 @@ static int iris_hfi_gen2_set_tier(struct iris_inst *inst, u32 plane)
>  {
>  	u32 port = iris_hfi_gen2_get_port(inst, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
>  	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
> -	u32 tier = inst->fw_caps[TIER].value;
> -
> -	tier = (inst->codec == V4L2_PIX_FMT_AV1) ? inst->fw_caps[TIER_AV1].value :
> +	u32 tier = (inst->codec == V4L2_PIX_FMT_AV1) ? inst->fw_caps[TIER_AV1].value :
>  							inst->fw_caps[TIER].value;
> +

Since you're touching this already, I think the cleanest way to handle
it would be to do 'tier_cap = (inst->codec == V4L2_PIX_FMT_AV1) ? TIER_AV1 : TIER`
and then use that index 

Also, the namespacing here is mediocre - "TIER" doesn't indicate it's an index
of the fw caps array

Konrad

