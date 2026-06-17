Return-Path: <linux-media+bounces-65125-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yu5WEI25MmpD4gUAu9opvQ
	(envelope-from <linux-media+bounces-65125-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 17:13:17 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4567769AD9E
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 17:13:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="mJhgK/u+";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=kf1stwMX;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65125-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65125-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9A98E30355F0
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 15:10:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44E3E481223;
	Wed, 17 Jun 2026 15:04:36 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E114481221
	for <linux-media@vger.kernel.org>; Wed, 17 Jun 2026 15:04:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781708675; cv=none; b=HRQbDHug7R/OI91wsbAD5glQzCxqOL31lmtnfMp3xl9Qi6mmmLMlq+Byu08qkR1voBOGB/WvHWIfNIRW6r21TafK2loIANkE2RwWa2GtYp4XSxEvo/S6JMIp8DjnPfMuBH1BRwPHOa9kUGS7BGynVi439z3VAjkcwL7f5OWzgBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781708675; c=relaxed/simple;
	bh=pASOjP3S0Uv4ugchenDmCNPGNwsOsomDAh19FFHphRw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K2vGmPfFUeG1QQ11Hmg7wcu+u1AMMNXLWiBfDL716E5+n4CO/9Ti03GQTvIrX+DqSRZNJAfkj0HecGAww4gaAVQ8Nc19Km/2WZaXqwwf3E2VIiZIWPGmXuf0UklRHj6ntr8d1YS4g0q3TxX5obLRG5Jh4BZRlwuQA6SaQxgVdOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mJhgK/u+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kf1stwMX; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65HEEAiv1014186
	for <linux-media@vger.kernel.org>; Wed, 17 Jun 2026 15:04:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0hkYA6Lo4Jj5Kkyg3hZREkEP+CcxyQv2PQdWFdmvQa4=; b=mJhgK/u+arZhAPSb
	SxGBdHGKi1dTlJgk1piDUIAqxa3hCE9Bn1y0SJ49ZZTmrCg4elma6qqZR+Ekwsxl
	XazN0HE/pjwhSlx9TPsQOJORHxKBvwRGYd9Axvp+34oxP7MfPK3mo2kTYiErtnqh
	vy7MK8/YJ7n5if1APCJtRwnJ9ED3/dOiqwQbkgY7QJbxivClo5B54KVDPogYxld7
	HsBHWk7ZVH+l91wGBLpnN7TOVTXIOvpbNG43dzJn143rN/w4G0lDhPqvqSn2oJzW
	FUXI1zSHSUcaRmdcjQmzhZGl4GgI9UVx/su7/w5cqSoYFXn136C3QJ5xpbxDiRJf
	Z9ZSzg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eueepkph9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 17 Jun 2026 15:04:33 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c8514f8ed5dso3163313a12.3
        for <linux-media@vger.kernel.org>; Wed, 17 Jun 2026 08:04:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781708673; x=1782313473; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0hkYA6Lo4Jj5Kkyg3hZREkEP+CcxyQv2PQdWFdmvQa4=;
        b=kf1stwMXHEKFQEcXKOoTv0lSVaA8ma4D17gVkIZ+cXeXy98HjLfRIblwIzPa6o1zmQ
         JG3tMpMfY2bfo3LMKoc3gg99yW62aI0CfKjqeY9/T3K+MORFpahBHcAkoi9FM/1H3IZ7
         U+BF3Sgu98InGZBUOP/UweYvDzKFqDnPS5zSMVrdYwOypkLu/9OCqwd6/7PCSdoE/qP8
         aInpxAk+NWryjXpxvDh9WaB6TU81J7qr4oZXj+cl18m8BLuNz1ywkYaaKiSnpMIlyCwD
         9tO1OTG0jIel/KRkOJRpKPUeyEf61U0e1UaqkuvwjFRl9nZuXaBr0p2IbeaTn9rVv63+
         sPSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781708673; x=1782313473;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0hkYA6Lo4Jj5Kkyg3hZREkEP+CcxyQv2PQdWFdmvQa4=;
        b=XgFW3k8qmaZjI1IH91eMZ46KpHMwaG48Q7VGs74vHVaNI7XpPo/0n05rFzcs7/36Lt
         wd/YxPVzjfed8oAo9FHSVJuqlqvkcyJEIDdDj0L9XzcuoqGAuJTqW6Yy3YkWULJyeCUc
         fbu5P3+w0LSBKKazGRtdkn2d5Z13i3cK51v+d+yjYSrc++S6Q30xrr9fqfBsHBwWE7ju
         RRrr6YxIfs2PsgU4+f6zTgMYWq+o9PbLk0LAP+idwd1UX2OU/kfx6Dyxehh/ebwByUoF
         qa9ya7kl7694l25dbIl5pUFa5r7RAmchYyE537ZncGBSHALteamIxe1epmxNETP5ndFK
         BUcQ==
X-Gm-Message-State: AOJu0Ywbcq7WXNGsmXJXJz8DJ9BVM09hXreJBNbwsFM78bozgb+oZMLC
	SGLQSH3b3CsA0icoDL2bZxITJDo4bjDnlD1LC/6S08zt7Fj7tCAy9NCNGVU1lPV0xyfhYFSvdv9
	xWOi1gKZNIIP7/IZQGkpaPZVm3qzd+qkDVHhW5gqf9ID283eUDJDQ2wViwN3P/irXFQ==
X-Gm-Gg: AfdE7cnKg/hV/e5c9fwW0vpPPxR/EH0yqiU9AjQX5WT0Os3o2OvCyT3Pb2Xu6nmqsgp
	+ICYWub8WKc5SKEpsbhUQx/l8tXRSQEzbGXDVZ5RYPTJzVqwufzc8SyUSo1/pNLScZcBoLtwvpr
	A/n/hpWNyYyP0132XlloOf0TEh2pIy+EoijjdsANTHn7y45yqbR/FCuRg0hpEZSTL0xgiEWQeA3
	9SHYRz1zo13lF68A5qwOW75zgIiPj6o0W8A/0e90TqmbGllc54oHvFivqIl3umfYFkVd0AU3G0k
	qjkOo2B28t2v1HpugVp/ZX/S23OY+qj7GEWq4jSvtefTp7lTJtm5msa5EsJZ5DcmN1n8+tBQQt/
	VZzhrutdj8nkBaIcLGzyeYE0X/qKEh0oQym0Wmye8d+qs
X-Received: by 2002:a17:903:950:b0:2bf:23ad:8595 with SMTP id d9443c01a7336-2c6bbf58b5emr43304835ad.4.1781708672770;
        Wed, 17 Jun 2026 08:04:32 -0700 (PDT)
X-Received: by 2002:a17:903:950:b0:2bf:23ad:8595 with SMTP id d9443c01a7336-2c6bbf58b5emr43304025ad.4.1781708672073;
        Wed, 17 Jun 2026 08:04:32 -0700 (PDT)
Received: from [192.168.29.100] ([49.43.194.141])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f7c70easm227261845ad.25.2026.06.17.08.04.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 08:04:31 -0700 (PDT)
Message-ID: <023152ae-5a98-e19c-7803-0dbca7814ddd@oss.qualcomm.com>
Date: Wed, 17 Jun 2026 20:34:25 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v5 10/16] media: iris: add minimal GET_PROPERTY
 implementation
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
References: <20260616-iris-ar50lt-v5-0-583b42770b6a@oss.qualcomm.com>
 <20260616-iris-ar50lt-v5-10-583b42770b6a@oss.qualcomm.com>
Content-Language: en-US
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <20260616-iris-ar50lt-v5-10-583b42770b6a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=AY+B2XXG c=1 sm=1 tr=0 ts=6a32b781 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=LrD0L7TPytbPiIQqxktYyw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=FHMilMr0S3awb_RgwQsA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: 8-mUkO-z-6ZCO1ueENyJ7Lov7TIIHiGu
X-Proofpoint-ORIG-GUID: 8-mUkO-z-6ZCO1ueENyJ7Lov7TIIHiGu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDE0NCBTYWx0ZWRfX1D325xRmCcq5
 flK1SoVeL0AEH4iI4V2cYpFkK8JyHY0B0AHkxKpD6DAcduX06i4Fv3j/PhX55et6nz1T3bCme8D
 bNnLSbvkF4SWzwkZoFbrfJKZScJ7qo1aORrsVSP/ZivgeJ0dI8XSHf6JQVclEnGxseT/XstexFS
 /+q5f+HtVEqk7wSpiNKW4l3M3urYXCWgKr4kSCkOPHpMD2zkuiahIoMLHrol8F++6w03WWC5d9t
 dgo9k9gahkJJ3qU56slChFU6fgUnJORQ3JbV0fJEIAzkCNJQLDW2NNxpOtu9Lpc334qCERmOYQD
 G2wXqeVS7ZqT/O9DcoZBbjGGM4+I+Sl2YtOplqA1gpFwyrFGcDILzgmLNeQob5IpBeJ0i3L3lxe
 luCdndXH7VOWS9Ek8ohqoov7c5vpFPHgG8IfwZb1rJkvjmKJoR7IByhUn9nSfxcgJWXF9x7CksS
 tBnghuoJjaxPXdLvpvA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDE0NCBTYWx0ZWRfX86xk4AXQOnNn
 zVl8CPAsadnl1CQF9QWU2p/6AA0QQR2zvJikoJ0jbw7kVhjv5FNH6CFojClVbNaaSN+1RsVJHdH
 SqmHGv1bJv/OEOizE7xM/Nz9Zy4jqT4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_02,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 bulkscore=0 suspectscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606170144
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-65125-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:vikash.garodia@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:dikshita.agarwal@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,pkt.data:url,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4567769AD9E


On 6/16/2026 5:34 AM, Dmitry Baryshkov wrote:
> AR50Lt with the Gen1 firmware requires host to read
> HFI_PROPERTY_CONFIG_BUFFER_REQUIREMENTS property, otherwise it doesn't
> update internal data and fails the HFI_CMD_SESSION_LOAD_RESOURCES
> command. Implement minimal support for querying the properties from the
> firmware.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_hfi_common.h  |  1 +
>  .../platform/qcom/iris/iris_hfi_gen1_command.c      | 21 +++++++++++++++++++++
>  .../platform/qcom/iris/iris_hfi_gen1_defines.h      | 15 +++++++++++++++
>  .../platform/qcom/iris/iris_hfi_gen1_response.c     |  6 ++++++
>  4 files changed, 43 insertions(+)
>
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_common.h b/drivers/media/platform/qcom/iris/iris_hfi_common.h
> index a27447eb2519..16099f9a25b6 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_common.h
> @@ -121,6 +121,7 @@ struct iris_hfi_session_ops {
>  	int (*session_set_property)(struct iris_inst *inst,
>  				    u32 packet_type, u32 flag, u32 plane, u32 payload_type,
>  				    void *payload, u32 payload_size);
> +	int (*session_get_property)(struct iris_inst *inst, u32 packet_type);
>  	int (*session_open)(struct iris_inst *inst);
>  	int (*session_start)(struct iris_inst *inst, u32 plane);
>  	int (*session_queue_buf)(struct iris_inst *inst, struct iris_buffer *buffer);
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> index 7674b47ad6c4..99e82e5510ab 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> @@ -1117,10 +1117,31 @@ static int iris_hfi_gen1_session_set_config_params(struct iris_inst *inst, u32 p
>  	return 0;
>  }
>  
> +static int iris_hfi_gen1_session_get_property(struct iris_inst *inst, u32 packet_type)
> +{
> +	struct hfi_session_get_property_pkt pkt;
> +	int ret;
> +
> +	pkt.shdr.hdr.size = sizeof(pkt);
> +	pkt.shdr.hdr.pkt_type = HFI_CMD_SESSION_GET_PROPERTY;
> +	pkt.shdr.session_id = inst->session_id;
> +	pkt.num_properties = 1;
> +	pkt.data = packet_type;
> +
> +	reinit_completion(&inst->completion);
> +
> +	ret = iris_hfi_queue_cmd_write(inst->core, &pkt, pkt.shdr.hdr.size);
> +	if (ret)
> +		return ret;
> +
> +	return iris_wait_for_session_response(inst, false);
> +}
> +
>  static const struct iris_hfi_session_ops iris_hfi_gen1_session_ops = {
>  	.session_open = iris_hfi_gen1_session_open,
>  	.session_set_config_params = iris_hfi_gen1_session_set_config_params,
>  	.session_set_property = iris_hfi_gen1_session_set_property,
> +	.session_get_property = iris_hfi_gen1_session_get_property,
>  	.session_start = iris_hfi_gen1_session_start,
>  	.session_queue_buf = iris_hfi_gen1_session_queue_buffer,
>  	.session_release_buf = iris_hfi_gen1_session_unset_buffers,
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
> index 0e4dee192384..bb495a1d2623 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
> @@ -35,6 +35,7 @@
>  #define HFI_CMD_SESSION_EMPTY_BUFFER			0x211004
>  #define HFI_CMD_SESSION_FILL_BUFFER			0x211005
>  #define HFI_CMD_SESSION_FLUSH				0x211008
> +#define HFI_CMD_SESSION_GET_PROPERTY			0x211009
>  #define HFI_CMD_SESSION_RELEASE_BUFFERS			0x21100b
>  #define HFI_CMD_SESSION_RELEASE_RESOURCES		0x21100c
>  #define HFI_CMD_SESSION_CONTINUE			0x21100d
> @@ -113,6 +114,7 @@
>  #define HFI_MSG_SESSION_FLUSH				0x221006
>  #define HFI_MSG_SESSION_EMPTY_BUFFER			0x221007
>  #define HFI_MSG_SESSION_FILL_BUFFER			0x221008
> +#define HFI_MSG_SESSION_PROPERTY_INFO			0x221009
>  #define HFI_MSG_SESSION_RELEASE_RESOURCES		0x22100a
>  #define HFI_MSG_SESSION_RELEASE_BUFFERS			0x22100c
>  
> @@ -205,6 +207,12 @@ struct hfi_session_set_property_pkt {
>  	u32 data[];
>  };
>  
> +struct hfi_session_get_property_pkt {
> +	struct hfi_session_hdr_pkt shdr;
> +	u32 num_properties;
> +	u32 data;
> +};
> +
>  struct hfi_sys_pc_prep_pkt {
>  	struct hfi_pkt_hdr hdr;
>  };
> @@ -574,6 +582,13 @@ struct hfi_msg_session_fbd_uncompressed_plane0_pkt {
>  	u32 data[];
>  };
>  
> +struct hfi_msg_session_property_info_pkt {
> +	struct hfi_session_hdr_pkt shdr;
> +	u32 num_properties;
> +	u32 property;
> +	u8 data[];
> +};
> +
>  struct hfi_msg_session_release_buffers_done_pkt {
>  	struct hfi_msg_session_hdr_pkt shdr;
>  	u32 num_buffers;
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
> index bfd7495bf44f..23fc7194b1e3 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
> @@ -591,6 +591,10 @@ static const struct iris_hfi_gen1_response_pkt_info pkt_infos[] = {
>  	 .pkt = HFI_MSG_SESSION_RELEASE_BUFFERS,
>  	 .pkt_sz = sizeof(struct hfi_msg_session_release_buffers_done_pkt),
>  	},
> +	{
> +	 .pkt = HFI_MSG_SESSION_PROPERTY_INFO,
> +	 .pkt_sz = sizeof(struct hfi_msg_session_property_info_pkt),
> +	},
>  };
>  
>  static void iris_hfi_gen1_handle_response(struct iris_core *core, void *response)
> @@ -652,6 +656,8 @@ static void iris_hfi_gen1_handle_response(struct iris_core *core, void *response
>  			iris_hfi_gen1_session_etb_done(inst, hdr);
>  		} else if (hdr->pkt_type == HFI_MSG_SESSION_FILL_BUFFER) {
>  			iris_hfi_gen1_session_ftb_done(inst, hdr);
> +		} else if (hdr->pkt_type == HFI_MSG_SESSION_PROPERTY_INFO) {
> +			complete(&inst->completion);
>  		} else {
>  			struct hfi_msg_session_hdr_pkt *shdr;
>  

Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>


