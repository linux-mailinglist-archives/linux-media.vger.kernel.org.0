Return-Path: <linux-media+bounces-66120-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PurWMELeQ2rakgoAu9opvQ
	(envelope-from <linux-media+bounces-66120-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 17:18:26 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B7DEA6E5D9D
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 17:18:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=FDCuBMB3;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=TITGeKLH;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66120-lists+linux-media=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-media+bounces-66120-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 995D9305A4A5
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 15:10:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23E2434404E;
	Tue, 30 Jun 2026 15:10:23 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B92B9318EDF
	for <linux-media@vger.kernel.org>; Tue, 30 Jun 2026 15:10:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782832222; cv=none; b=hP2wr0wNEBSFCAAyWv91OGBNv3yp2vfz5qG4pCfaTAWrQpes1aZvVn8KFF2kbRjdUaQX5ohhTihLU9AoZjop1/F5aTebubaa8yYKu/b9nuBxqFb+NHFXjR16LUVbyAiiUcvgC9EMxJXJDTz8EXi7BWvTo+p0ND0DNs4hk8xymL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782832222; c=relaxed/simple;
	bh=MUYCtPlEsyuOMBfsNpu6Wb6k9MvokyrT68Q6FUk9z6U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HrhK8qO9UTlLWIMOGEmlnqxxaIY1pIjw0LHLpo4yl0wc2gP9LM/uhEW9D2MZeR+lZj5xgFHx0m3D8/QgrVByypWzAj/SkT+LAOyEcq40vdoyRDQcZcwaLU/eIMBxOOvdnUFEFs/wfSTA3vEKuQU/2FIkZpLdmy82TTzvkY83cqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FDCuBMB3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TITGeKLH; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65UEDJUK2214573
	for <linux-media@vger.kernel.org>; Tue, 30 Jun 2026 15:10:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	trJaQGHwodpZN/OHSrRqChU8QTKm9DBXM6a+MnWUVtk=; b=FDCuBMB3RPoyIS53
	AQyepW5K4pnVmke7tktRVbuuOpA/A/jHvkXP3aA+Pg/nANbgDDltL9jugrbiWgVI
	CxAVfGV1Ho5BaWrp87KgFRRZWI+cbaXKoNXoADsx/Rx/lNzahbK1ltSeK+DHOJjc
	ILutApYHsGmk4R458JNYuKRZsHTto83R4YcKVKuCbZVnToRB8/+vXAra4aNWzaSJ
	geSZbH3rsYazv91HfEfDVBUqUd00e8orR01Jwpf++GpAZBgXSVAtlKp/oyfg9fh/
	LQEr3OSb4nE7qJlYo2T8OF+e5hDBNodwfcayTKd1e5G9C5JUyYOT3cMMlEUkv3wJ
	08Chng==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f45k5u1dp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 30 Jun 2026 15:10:19 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-139ca26403fso3912336c88.1
        for <linux-media@vger.kernel.org>; Tue, 30 Jun 2026 08:10:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782832219; x=1783437019; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=trJaQGHwodpZN/OHSrRqChU8QTKm9DBXM6a+MnWUVtk=;
        b=TITGeKLHXC0iXU3kec8MxeFBch0MEhl2fNrJ/o+wlpj2TohzlbUQ26pyys6vxuePHG
         p9KJ/TN6mpi9ZIqoqFIwAfxC0VDCd9hHlVTHN1zzHAWoMhJtQlmEd+5c2UANiPJRUkZl
         qUsT3oa4TJwHLeS/m8rQ0gdFIW0xed3EkQ+ZlxV4z7rDRHcnDflKQgNHZrb0P8HE3yg/
         H3tyHPHfzryqYv/NSFGstY/F1KpgXQyR+UJddc2GueDUiPOKN6QQFGgx8hBL8a6+GczM
         p/tKeWEyfOytzm5YCrB+5IhYIB25b5F+RiAdqdTBFimY7nM5xcTea/PBP7NOlsSkt1c9
         Mktw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782832219; x=1783437019;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=trJaQGHwodpZN/OHSrRqChU8QTKm9DBXM6a+MnWUVtk=;
        b=KhLCFgBNR/+mKXsKr1UrsIT3CdJYh2pFdLLGIb0aHfqxSWapV72MA89QNNQb0lcO8S
         Q3G084EfWrDxMJuGq0r7MTb8z6rITqQBBzXWrxnKYZNrc25FYcLduIFGNWLObHuHaCw4
         nnDMiE+BxHhjbKod5JTqeE2X9siT8EI5Y5kCJ2mHIR1n+VXNEqbbLweICbN3ipF0KQGL
         cS5yvbNjTb2DSTmyYVKTfXWyBUWsldYvZREOYxr9VwUbeA4bbRaRleoPKxU0ICNny+9W
         Wh47ez5NUctgy2U6xPRxZOya94aroCBcRFb0FRM5RkZSDXnxnsThWSIhyf1ju+WDrfgY
         HYJA==
X-Forwarded-Encrypted: i=1; AFNElJ9KbSWyhLg52ZPZ7i99KNmN98k4Rlh9hvKTGPR+9q/UNticQ/Rqqga3x9u7nnWtGSy+O5sbeIZ0oKPPbA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyAEykILCEv1UJKdo9WmvFh0+UyM2RjL1NlRJFBzVJYBsLyyTRN
	elIEmb1Cgxp73AIahAGoC6xYSF0XYwCFgq4VjAodB5ec4w7rWtLboVbdMINhApI7BitLjlT1xyq
	jXbXyIuucpO+E0BIROWU+jYcaH7WSRGvNpoZpIqsWc4udp/j6yQaUcOycSUuUQcCAmA==
X-Gm-Gg: AfdE7ckcIfJMann6nUsnNAILHr3JmxS5v5Wt3JzA9E7bdrl8KXZPvBWs4Oh3heUzaZy
	HulDf1K97NJluJb+Nn/ygPplY0hHjDplBr+RhFBOW7P5gJBw2K2c9p0ifB4Lh7kqWv6cvi6YlRt
	cIm/gKD+5tPsTi/87sX50XMFaXRYk25V6jO671q4hO2BcqkQ+UIjVFRC3TpkYKuX5R6kZLPD65t
	Ozl1lq1kMMHKklF53RO7HwSbMRoo99ZlbE9EI1BzcuuD2bws+sjgfJsUd51w4TRZqCOUzkAOtU7
	RTxf7lPWa53hjbeFwnTZsFmqfTWWCN9zg8K8u0Ck6nWMAtGliLvjtiX2jXz752PrUCbgObpB/Ps
	f2z+Ahh5z1UMEKfTQNO7vhxeQnQWnh0JvKgeTQGCJh4I=
X-Received: by 2002:a05:701b:290e:b0:13b:3132:6e8e with SMTP id a92af1059eb24-13b313270a3mr376139c88.9.1782832218474;
        Tue, 30 Jun 2026 08:10:18 -0700 (PDT)
X-Received: by 2002:a05:701b:290e:b0:13b:3132:6e8e with SMTP id a92af1059eb24-13b313270a3mr376109c88.9.1782832217654;
        Tue, 30 Jun 2026 08:10:17 -0700 (PDT)
Received: from [10.206.105.200] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b2abcd5edsm12532351c88.15.2026.06.30.08.10.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 08:10:16 -0700 (PDT)
Message-ID: <fe3b6b0c-7b20-fd41-c835-d9ff961235cf@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 20:40:11 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 2/2] media: qcom: iris: Add request key frame support
 for encoder
Content-Language: en-US
To: Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: quic_qiweil@quicinc.com, Renjiang Han <renjiang.han@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260624-dynamic_encode-v3-0-f2a2db0ac2af@oss.qualcomm.com>
 <20260624-dynamic_encode-v3-2-f2a2db0ac2af@oss.qualcomm.com>
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <20260624-dynamic_encode-v3-2-f2a2db0ac2af@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=AqDeGu9P c=1 sm=1 tr=0 ts=6a43dc5b cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=madFLhDvK5Zmr-ms3h4A:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-GUID: TzThDyLpMeJN8rOTwB2c5POuzgLN8D_j
X-Proofpoint-ORIG-GUID: TzThDyLpMeJN8rOTwB2c5POuzgLN8D_j
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDE0MiBTYWx0ZWRfX6JA6ydqNKyyX
 TjGgKKJqIcpF2nkf2bas97GavfIcK4PnxTefBzFczeEFzaOBtjHpfotayJ/GwoWP5lFlcpiVEbP
 8pjuYavSwhGjop2leXKWw70aCkvKLcjTyzWz/gQzBdg5or6r3R1GGWpMfU4jyyDFKvzLuMlSVCQ
 cX3Z3ifoKnTQQoLRBuLfkD+xJudLVDJuNyuKFkZE2Na+kZwW8+U3yvKcho/8mlj7YtJYmHSXJxA
 2yJ047c4j9D5dceYmliDpLDeHrhuyjbAfLjtmmLwlbapi9JI/g0W9D2VqAZKhV2jzR+jh2GBM2k
 8zD7b2MAKvEIFI8OdXQCszoAoDgYNoPzda1hVY8uDkaN97zARxttHPaqR1RVL8XfkGA46DLmYN4
 Kvm9UyBm41DA0YGAE9SSNB0HVavvvnbdF5MHCTVtjBoFevpV8Xxt+o8qw0SkOuZb6G6+UI9M0Xc
 lhib6pBhCUsageYjpcA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDE0MiBTYWx0ZWRfX+5E9g8EetzQe
 zn229hId90UqTmmOVLK72eWm5nT7tuaRdJHcHvHyfIlcmeeuyhQezIwT6HVMDl+se0ienXaBAa6
 KMeQ+cB42pqWErPSUYpmRdO7gWeGdm0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 spamscore=0 phishscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300142
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-66120-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:wangao.wang@oss.qualcomm.com,m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:quic_qiweil@quicinc.com,m:renjiang.han@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B7DEA6E5D9D


On 6/24/2026 2:21 PM, Wangao Wang wrote:
> Add request key frame support for both gen1 and gen2 encoders by enabling
>
> V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME.
>
> Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_ctrls.c      | 22 ++++++++++++++++++++++
>  drivers/media/platform/qcom/iris/iris_ctrls.h      |  1 +
>  drivers/media/platform/qcom/iris/iris_hfi_gen1.c   | 10 ++++++++++
>  .../platform/qcom/iris/iris_hfi_gen1_command.c     |  3 +++
>  .../platform/qcom/iris/iris_hfi_gen1_defines.h     |  1 +
>  drivers/media/platform/qcom/iris/iris_hfi_gen2.c   | 12 +++++++++++-
>  .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  7 +++++++
>  .../platform/qcom/iris/iris_platform_common.h      |  1 +
>  8 files changed, 56 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
> index 391e1fc5f6e2ec8e9cf5ba4e0f76b2d1da3e2a35..2918a7df0b403a886648e90ec00968f51c4660a0 100644
> --- a/drivers/media/platform/qcom/iris/iris_ctrls.c
> +++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
> @@ -154,6 +154,8 @@ static enum platform_inst_fw_cap_type iris_get_cap_id(u32 id)
>  		return LAYER4_BITRATE_HEVC;
>  	case V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L5_BR:
>  		return LAYER5_BITRATE_HEVC;
> +	case V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME:
> +		return REQUEST_SYNC_FRAME;
>  	default:
>  		return INST_FW_CAP_MAX;
>  	}
> @@ -297,6 +299,8 @@ static u32 iris_get_v4l2_id(enum platform_inst_fw_cap_type cap_id)
>  		return V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L4_BR;
>  	case LAYER5_BITRATE_HEVC:
>  		return V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L5_BR;
> +	case REQUEST_SYNC_FRAME:
> +		return V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME;
>  	default:
>  		return 0;
>  	}
> @@ -1477,6 +1481,24 @@ int iris_set_layer_bitrate(struct iris_inst *inst, enum platform_inst_fw_cap_typ
>  					     &bitrate, sizeof(u32));
>  }
>  
> +int iris_set_req_sync_frame(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
> +{
> +	const struct iris_hfi_session_ops *hfi_ops = inst->hfi_session_ops;
> +	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
> +	u32 hfi_val = 0;
> +
> +	if (inst->fw_caps[PREPEND_SPSPPS_TO_IDR].value)
> +		hfi_val = HFI_SYNC_FRAME_REQUEST_WITH_PREFIX_SEQ_HDR;
> +	else
> +		hfi_val = HFI_SYNC_FRAME_REQUEST_WITHOUT_SEQ_HDR;
> +
> +	return hfi_ops->session_set_property(inst, hfi_id,
> +					     HFI_HOST_FLAGS_NONE,
> +					     iris_get_port_info(inst, cap_id),
> +					     HFI_PAYLOAD_U32_ENUM,
> +					     &hfi_val, sizeof(u32));
> +}
> +
>  int iris_set_properties(struct iris_inst *inst, u32 plane)
>  {
>  	const struct iris_hfi_session_ops *hfi_ops = inst->hfi_session_ops;
> diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.h b/drivers/media/platform/qcom/iris/iris_ctrls.h
> index 3c462ec9190be8935176b290588f224fe4f144a4..8d8bbef960076c08e5af0f65920dde187f24a313 100644
> --- a/drivers/media/platform/qcom/iris/iris_ctrls.h
> +++ b/drivers/media/platform/qcom/iris/iris_ctrls.h
> @@ -47,6 +47,7 @@ int iris_set_layer_type(struct iris_inst *inst, enum platform_inst_fw_cap_type c
>  int iris_set_layer_count_gen1(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
>  int iris_set_layer_count_gen2(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
>  int iris_set_layer_bitrate(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
> +int iris_set_req_sync_frame(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
>  int iris_set_properties(struct iris_inst *inst, u32 plane);
>  
>  #endif
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
> index eff9216bb50143c0d752051a6400605bbaf3803e..0f7e7d6b25f41eb8a67a9a8f01dce20ea54dc335 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
> @@ -375,6 +375,16 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8250_enc[] = {
>  			CAP_FLAG_DYNAMIC_ALLOWED,
>  		.set = iris_set_bitrate_gen1,
>  	},
> +	{
> +		.cap_id = REQUEST_SYNC_FRAME,
> +		.min = 0,
> +		.max = 1,
> +		.step_or_mask = 1,
> +		.value = 0,
> +		.hfi_id = HFI_PROPERTY_CONFIG_VENC_REQUEST_SYNC_FRAME,
> +		.flags = CAP_FLAG_INPUT_PORT | CAP_FLAG_DYNAMIC_ALLOWED,
> +		.set = iris_set_req_sync_frame,
> +	},
>  };
>  
>  static const u32 sm8250_vdec_input_config_param_default[] = {
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> index 7674b47ad6c49adfaf16b444c8ec7295b230a529..d7fd867cf6c98523123e9205fcfe4b469708da72 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> @@ -741,6 +741,9 @@ iris_hfi_gen1_packet_session_set_property(struct hfi_session_set_property_pkt *p
>  		packet->shdr.hdr.size += sizeof(u32);
>  		break;
>  	}
> +	case HFI_PROPERTY_CONFIG_VENC_REQUEST_SYNC_FRAME: {
> +		break;
> +	}
>  	default:
>  		return -EINVAL;
>  	}
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
> index 0e4dee19238464a9671a94eaab8eeda2d7f7ca9f..275f3fea3d2aabe26a2a0498c78c09ec28765b24 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
> @@ -157,6 +157,7 @@
>  #define HFI_PROPERTY_PARAM_VENC_HIER_P_MAX_NUM_ENH_LAYER	0x2005026
>  #define HFI_PROPERTY_CONFIG_VENC_TARGET_BITRATE			0x2006001
>  #define HFI_PROPERTY_CONFIG_VENC_INTRA_PERIOD			0x2006003
> +#define HFI_PROPERTY_CONFIG_VENC_REQUEST_SYNC_FRAME		0x2006004
>  #define HFI_PROPERTY_CONFIG_VENC_MARKLTRFRAME			0x2006009
>  #define HFI_PROPERTY_CONFIG_VENC_USELTRFRAME			0x200600a
>  #define HFI_PROPERTY_CONFIG_VENC_SYNC_FRAME_SEQUENCE_HEADER	0x2006008
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
> index acc0ed8adda1ae726c94ab6346b0b4b2b3db1d7b..7d6fde36f0e9036145e45b84054b439536b25e50 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
> @@ -937,7 +937,17 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8550_enc[] = {
>  		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
>  			CAP_FLAG_DYNAMIC_ALLOWED,
>  		.set = iris_set_layer_bitrate,
> -	}
> +	},
> +	{
> +		.cap_id = REQUEST_SYNC_FRAME,
> +		.min = 0,
> +		.max = 1,
> +		.step_or_mask = 1,
> +		.value = 0,
> +		.hfi_id = HFI_PROP_REQUEST_SYNC_FRAME,
> +		.flags = CAP_FLAG_INPUT_PORT | CAP_FLAG_DYNAMIC_ALLOWED,
> +		.set = iris_set_req_sync_frame,
> +	},
>  };
>  
>  static const u32 sm8550_vdec_input_config_params_default[] = {
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
> index 776b21cd11b2cd5555cbced8e438cb32e87a539c..a8b47e4ceba0fc868125f841a5635476571aab85 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
> @@ -90,6 +90,13 @@ enum hfi_layer_encoding_type {
>  #define HFI_PROP_BITRATE_LAYER4			0x0300013f
>  #define HFI_PROP_BITRATE_LAYER5			0x03000140
>  #define HFI_PROP_BITRATE_LAYER6			0x03000141
> +
> +enum hfi_syncframe_request_mode {
> +	HFI_SYNC_FRAME_REQUEST_WITHOUT_SEQ_HDR		= 0x00000001,
> +	HFI_SYNC_FRAME_REQUEST_WITH_PREFIX_SEQ_HDR	= 0x00000002,
> +};
> +
> +#define HFI_PROP_REQUEST_SYNC_FRAME		0x03000145
>  #define HFI_PROP_MAX_GOP_FRAMES			0x03000146
>  #define HFI_PROP_MAX_B_FRAMES			0x03000147
>  #define HFI_PROP_QUALITY_MODE			0x03000148
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index ff48333ad089894c3393e8ad45903c2603288eb9..23b6e7676d05bd01725f8e2cfca47b06ef112c27 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -182,6 +182,7 @@ enum platform_inst_fw_cap_type {
>  	LAYER3_BITRATE_HEVC,
>  	LAYER4_BITRATE_HEVC,
>  	LAYER5_BITRATE_HEVC,
> +	REQUEST_SYNC_FRAME,
>  	INST_FW_CAP_MAX,
>  };
>  

Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>


