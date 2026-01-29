Return-Path: <linux-media+bounces-51775-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +AbECn1Ge2kfDQIAu9opvQ
	(envelope-from <linux-media+bounces-51775-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 29 Jan 2026 12:37:33 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 52403AFB1A
	for <lists+linux-media@lfdr.de>; Thu, 29 Jan 2026 12:37:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 412463013ECA
	for <lists+linux-media@lfdr.de>; Thu, 29 Jan 2026 11:37:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 703E238758E;
	Thu, 29 Jan 2026 11:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZdEKKU1y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NmakoDUe"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF05A38551C
	for <linux-media@vger.kernel.org>; Thu, 29 Jan 2026 11:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769686648; cv=none; b=r7Xc8HljHcYWg66AtqyMCOb1vbhq9mG4M9dJkIdeFblUbljmPlyfmEpmdbAQVGSVZZK/7hyq65ykoPTkBDkGKlo7u63qIyjLDlml+YM1+K3/9CgVKzM+e7FabfyDzSqGmVLXTB04p6lQh1Xnqr6ppUqg2NTdp4jk0lZlbfL8I6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769686648; c=relaxed/simple;
	bh=6kvQ97LRkkElf3UouvEmnCdw824T8JLamRTerPlZJQ4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=epYp0Qpbl1u0KNOU/niaS/ui8JLC/mwJbcmTftKvTYQm3taiYFI0p6sdwYRGk+yGPfTq9ZToCnxvBRQsfqcMldnSR6st5Gccmsh68hd7hnho4da6Kp3zC7G8PjxV3jft6mJtqnebmCUXFDfTv9qT+WyhTjRf0kuxShSyqNyqqaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZdEKKU1y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NmakoDUe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60TALEvV1430095
	for <linux-media@vger.kernel.org>; Thu, 29 Jan 2026 11:37:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6FEwaCgb9Vu3bOySSeCsGzKX2IHXxVvu1F3GO9cDwFA=; b=ZdEKKU1yX56Divvd
	88MtTYfoBxVfHPYBcgr4cRyymfu4g/ZV8IBUsWCl0bdRZtLvRYYQcKVFn+XKIZo9
	adXIR3R6/n4hpP7OACW6ipkezNOwwYGRyY8UlyFCTyP4x98NpxIL4vNUppkOAjjp
	pNswza2mPnhR6SuBF0wV593pU4uFmDeAenkDR59BiTOE/n6HG/88PpaOoS6BuepB
	JmFzyfEZgjp+APboU1Iz2MVA/QHhc58HIFwnyQVkRAp0kLho3y+nXqvxvMoZmXVO
	e7lWw7QhI15doYC+SgH8eOrntHhlXAYOBKP3w8R/J8jO1HJx0gaI3cF6IdKW54gC
	gVjhVg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4byydh1eyg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 29 Jan 2026 11:37:25 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2a0a8c465c1so12280375ad.1
        for <linux-media@vger.kernel.org>; Thu, 29 Jan 2026 03:37:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769686644; x=1770291444; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6FEwaCgb9Vu3bOySSeCsGzKX2IHXxVvu1F3GO9cDwFA=;
        b=NmakoDUejv/akrVmZZZe8fQx2IGJowOtAjW1iURBaBSG2xF9PnmGXJESVCaS7B1xR/
         PvYhVpy70CbDhazjv1JkV7n1P5eMjUPIhy11KiCc6gZGc39mzp6kC2D+hf+Uwi4HAebH
         wFsAIzOyfb6QYCSDbKMlMQ2jRmauLUa/OVHGyX3DIvXWIIpg+uzzOTnKkJeJFKvr/JCK
         buPdu/e157pHS2bYmctCVqO+eCJRRbLApQV91yx6ibEDkqlrkR4Fs0NE451N8NeJhQ1Z
         eDX/LtbxuiyzvJOGs1RHR9nVmVdYX2TGTIybRA7KsArvmFm5aO3Zo1untGuonkbrTa9W
         1yTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769686644; x=1770291444;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6FEwaCgb9Vu3bOySSeCsGzKX2IHXxVvu1F3GO9cDwFA=;
        b=ho1wfaTsOhItgtnvEc7DhoCI4WmUXYbPo0IFN5GdXfCRnqfvLOThNLuyBCk5HtjcP9
         aCT9oj6fYEzyFGjuvNz1uiegJrryS1NdNEjN0Idl0r37XyCSkaUIYQ2YudZXUIWn+wPX
         XeoDD8J3IW2ypTKL7Y8C73igX/7CbhAlcTr9Bch09bMkFZSiN4C6lwQiPfscFGRvZrmH
         GIE38381WwTmsLxm2u8E0CZoByDtjFLKiBUtHqFFw3WdEc3owOKrDZp7rVMg3sx0Lo0n
         kz/Q/iccXQWR5OGD7qBpPqwlWZzApWBd71fuQiERosm3eobAOIsL1qVktrJcEuQPiv6o
         2gDw==
X-Forwarded-Encrypted: i=1; AJvYcCV4jQolGddqYaR55utXgxsLskftCVzTSVc9dX+aYNFX22G4PNWSZK00YqawFQy+AYVAwoVRpd5IiGLd+Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw86XRnpxsYLRB25gMJ+ZrsNnxE/RPIUkWTKneXz4hU59dV+amF
	3ZaWvVOoLYJBUMny21F7IBRYmqzL9BkaRRf/wmYSSN2sHdmVIHDP9NRD9QZd0YHdmNX8PbNS2cp
	Srbv6jiZvA4Kv3qtSGunnO1XTWMlphoxvu2ujUQ8nXAeeFNkydcFknJfZ4e6SOFckAA==
X-Gm-Gg: AZuq6aIhksRr2a5oPKU8EvzUTz/XYWFnsbZLjkORSvkLliD9RxgPFVQYKt37p6dld5V
	5OuMMYQcwGJ1SzAB8MFWLJbtpBEcylBL7Y12siXFmPj7+fu1ev0e+gguMHeZqlsfBj5WGRVPcNN
	sbQ5UyW1JdBdK3HzEIDiRIm7iuvClyxQLVm3RiRFrShsOv52fGr+AM90LBW/W4xWP1G82thiJAe
	nz6gXkkRz2w3vjn9ZwSesqoe1zR1wxyvFaka5Mljonqner23olPgML+Sgs/bKojNuSUUFSRLtKL
	A5qsZhpxMiauJk1IV7pQdST4UbSYjnuBeQhPbVniDcIdBB57YWIrQ+GgXeRrJeYGJ7Fz0f7Rdbq
	UMphfANlCOc4pVnKwtNGkaDGI1n16wg//HpmYDBJRUQ==
X-Received: by 2002:a17:902:ce89:b0:294:8c99:f318 with SMTP id d9443c01a7336-2a8bd43274fmr27500495ad.3.1769686643551;
        Thu, 29 Jan 2026 03:37:23 -0800 (PST)
X-Received: by 2002:a17:902:ce89:b0:294:8c99:f318 with SMTP id d9443c01a7336-2a8bd43274fmr27500185ad.3.1769686642812;
        Thu, 29 Jan 2026 03:37:22 -0800 (PST)
Received: from [10.204.100.98] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c642a33607esm4695585a12.23.2026.01.29.03.37.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Jan 2026 03:37:22 -0800 (PST)
Message-ID: <22af9d61-fdbe-4347-a1b0-1f8696a77f38@oss.qualcomm.com>
Date: Thu, 29 Jan 2026 17:07:17 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/6] media: qcom: iris: Add hierarchical coding support
 for encoder
To: Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: quic_qiweil@quicinc.com, Renjiang Han <renjiang.han@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260129-batch2_iris_encoder_enhancements-v4-0-efaac131a5f7@oss.qualcomm.com>
 <20260129-batch2_iris_encoder_enhancements-v4-4-efaac131a5f7@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260129-batch2_iris_encoder_enhancements-v4-4-efaac131a5f7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: l0sIEoDtiDWn0komDM-cARpZ1gePql5u
X-Proofpoint-ORIG-GUID: l0sIEoDtiDWn0komDM-cARpZ1gePql5u
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI5MDA3OCBTYWx0ZWRfX/YDxpUpwCvJb
 KObLFag2I7EhhrWi0jOCtlPq1xz6d0ve3k5TwZb9Y6zDmw2aC1sgRNyK/or2i5Uk7dHRzjP+h9N
 c0wnZxznckDgmwEUmjl6nK02jvqz4+9Qm+5Ck5D8ZZY49s+O5ClQEEeOgjRumQ9C8BJ+nkSiKRq
 CfCPnjQlMdaOp6lW9ql5a1tNfNwFKmhMHvPM2AWn/wTOSa2CeGfam0ngSzePaLxUdpIQdTVLkvF
 Qqr9rUFD8+oO62KH/5l4oMjaT8w6s5UyHUhi7bCgJA3Nex40VwHGhFNsAyMKUss4h2d9o7rArVD
 OE7PADl6thgNOzZceHpWOYSrYbaKnqj8jBx7132X8xmXQ+dEtedSwAfeCutNSNj5pYBFe+XIvTX
 CUnzj560WBB+MquPlAIlXFfeBwvc91vO6rlh3fc+rxU2DRMo8npn7Jcx5gCUgvXsNOs5s7kzIkz
 l/PtL4uLLv6FBZq2HYQ==
X-Authority-Analysis: v=2.4 cv=Cs6ys34D c=1 sm=1 tr=0 ts=697b4675 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=vHvlO465x9FhKNSSsVIA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-29_02,2026-01-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 phishscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601290078
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51775-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 52403AFB1A
X-Rspamd-Action: no action



On 1/29/2026 1:18 PM, Wangao Wang wrote:
> Add hierarchical coding support for both gen1 and gen2 encoders by enabling
>   the following V4L2 controls:
> H264:
> V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING,
> V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING_TYPE,
> V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING_LAYER
> HEVC(gen2 only):
> V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_TYPE,
> V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_LAYER
> 
> Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_ctrls.c      | 287 ++++++++++++++++++++-
>   drivers/media/platform/qcom/iris/iris_ctrls.h      |   7 +-
>   .../platform/qcom/iris/iris_hfi_gen1_command.c     |  21 +-
>   .../platform/qcom/iris/iris_hfi_gen1_defines.h     |   2 +
>   .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  15 ++
>   drivers/media/platform/qcom/iris/iris_instance.h   |   4 +
>   .../platform/qcom/iris/iris_platform_common.h      |  23 ++
>   .../media/platform/qcom/iris/iris_platform_gen1.c  |  94 ++++++-
>   .../media/platform/qcom/iris/iris_platform_gen2.c  | 182 ++++++++++++-
>   drivers/media/platform/qcom/iris/iris_vpu_buffer.c |  28 ++
>   10 files changed, 655 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
> index e049c28db1d8395736ae6970b5efbb351ce427dd..b7f0cce8ec7da5336156d0780d84dff6d0f50535 100644
> --- a/drivers/media/platform/qcom/iris/iris_ctrls.c
> +++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
> @@ -120,6 +120,40 @@ static enum platform_inst_fw_cap_type iris_get_cap_id(u32 id)
>   		return MARK_LTR;
>   	case V4L2_CID_MPEG_VIDEO_B_FRAMES:
>   		return B_FRAME;
> +	case V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING:
> +		return LAYER_ENABLE;
> +	case V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING_TYPE:
> +		return LAYER_TYPE_H264;
> +	case V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_TYPE:
> +		return LAYER_TYPE_HEVC;
> +	case V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING_LAYER:
> +		return LAYER_COUNT_H264;
> +	case V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_LAYER:
> +		return LAYER_COUNT_HEVC;
> +	case V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L0_BR:
> +		return LAYER0_BITRATE_H264;
> +	case V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L1_BR:
> +		return LAYER1_BITRATE_H264;
> +	case V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L2_BR:
> +		return LAYER2_BITRATE_H264;
> +	case V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L3_BR:
> +		return LAYER3_BITRATE_H264;
> +	case V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L4_BR:
> +		return LAYER4_BITRATE_H264;
> +	case V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L5_BR:
> +		return LAYER5_BITRATE_H264;
> +	case V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L0_BR:
> +		return LAYER0_BITRATE_HEVC;
> +	case V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L1_BR:
> +		return LAYER1_BITRATE_HEVC;
> +	case V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L2_BR:
> +		return LAYER2_BITRATE_HEVC;
> +	case V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L3_BR:
> +		return LAYER3_BITRATE_HEVC;
> +	case V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L4_BR:
> +		return LAYER4_BITRATE_HEVC;
> +	case V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L5_BR:
> +		return LAYER5_BITRATE_HEVC;
>   	default:
>   		return INST_FW_CAP_MAX;
>   	}
> @@ -229,6 +263,40 @@ static u32 iris_get_v4l2_id(enum platform_inst_fw_cap_type cap_id)
>   		return V4L2_CID_MPEG_VIDEO_FRAME_LTR_INDEX;
>   	case B_FRAME:
>   		return V4L2_CID_MPEG_VIDEO_B_FRAMES;
> +	case LAYER_ENABLE:
> +		return V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING;
> +	case LAYER_TYPE_H264:
> +		return V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING_TYPE;
> +	case LAYER_TYPE_HEVC:
> +		return V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_TYPE;
> +	case LAYER_COUNT_H264:
> +		return V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING_LAYER;
> +	case LAYER_COUNT_HEVC:
> +		return V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_LAYER;
> +	case LAYER0_BITRATE_H264:
> +		return V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L0_BR;
> +	case LAYER1_BITRATE_H264:
> +		return V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L1_BR;
> +	case LAYER2_BITRATE_H264:
> +		return V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L2_BR;
> +	case LAYER3_BITRATE_H264:
> +		return V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L3_BR;
> +	case LAYER4_BITRATE_H264:
> +		return V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L4_BR;
> +	case LAYER5_BITRATE_H264:
> +		return V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L5_BR;
> +	case LAYER0_BITRATE_HEVC:
> +		return V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L0_BR;
> +	case LAYER1_BITRATE_HEVC:
> +		return V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L1_BR;
> +	case LAYER2_BITRATE_HEVC:
> +		return V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L2_BR;
> +	case LAYER3_BITRATE_HEVC:
> +		return V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L3_BR;
> +	case LAYER4_BITRATE_HEVC:
> +		return V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L4_BR;
> +	case LAYER5_BITRATE_HEVC:
> +		return V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L5_BR;
>   	default:
>   		return 0;
>   	}
> @@ -575,7 +643,63 @@ int iris_set_header_mode_gen2(struct iris_inst *inst, enum platform_inst_fw_cap_
>   				     &hfi_val, sizeof(u32));
>   }
>   
> -int iris_set_bitrate(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
> +int iris_set_bitrate_gen1(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
> +{
> +	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
> +	u32 entropy_mode = inst->fw_caps[ENTROPY_MODE].value;
> +	u32 bitrate = inst->fw_caps[cap_id].value;
> +	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
> +	struct hfi_bitrate hfi_val;
> +	u32 max_bitrate;
> +
> +	if (!(inst->fw_caps[cap_id].flags & CAP_FLAG_CLIENT_SET) && cap_id != BITRATE)
> +		return -EINVAL;
> +
> +	if (inst->codec == V4L2_PIX_FMT_HEVC)
> +		max_bitrate = CABAC_MAX_BITRATE;
> +
> +	if (entropy_mode == V4L2_MPEG_VIDEO_H264_ENTROPY_MODE_CABAC)
> +		max_bitrate = CABAC_MAX_BITRATE;
> +	else
> +		max_bitrate = CAVLC_MAX_BITRATE;

check this logic, for hevc, its reassiging

> +
> +	hfi_val.bitrate = min(bitrate, max_bitrate);
> +
> +	switch (cap_id) {
> +	case BITRATE:
> +	case LAYER0_BITRATE_H264:
> +		hfi_val.layer_id = 0;
> +		break;
> +	case LAYER1_BITRATE_H264:
> +		hfi_val.layer_id = 1;
> +		break;
> +	case LAYER2_BITRATE_H264:
> +		hfi_val.layer_id = 2;
> +		break;
> +	case LAYER3_BITRATE_H264:
> +		hfi_val.layer_id = 3;
> +		break;
> +	case LAYER4_BITRATE_H264:
> +		hfi_val.layer_id = 4;
> +		break;
> +	case LAYER5_BITRATE_H264:
> +		hfi_val.layer_id = 5;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	if (hfi_val.layer_id > 0 && !inst->fw_caps[LAYER_ENABLE].value)
> +		return -EINVAL;
> +
> +	return hfi_ops->session_set_property(inst, hfi_id,
> +					     HFI_HOST_FLAGS_NONE,
> +					     iris_get_port_info(inst, cap_id),
> +					     HFI_PAYLOAD_STRUCTURE,
> +					     &hfi_val, sizeof(hfi_val));
> +}
> +
> +int iris_set_bitrate_gen2(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
>   {
>   	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
>   	u32 entropy_mode = inst->fw_caps[ENTROPY_MODE].value;
> @@ -1191,6 +1315,167 @@ int iris_set_intra_period(struct iris_inst *inst, enum platform_inst_fw_cap_type
>   					     &intra_period, sizeof(intra_period));
>   }
>   
> +int iris_set_layer_type(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
> +{
> +	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
> +	u32 layer_enable = inst->fw_caps[LAYER_ENABLE].value;
> +	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
> +	u32 layer_type;
> +
> +	if (inst->hfi_rc_type == HFI_RATE_CONTROL_CQ ||
> +	    inst->hfi_rc_type == HFI_RATE_CONTROL_OFF)
> +		return -EINVAL;
> +
> +	if (inst->codec == V4L2_PIX_FMT_H264) {
> +		if (!layer_enable || !inst->fw_caps[LAYER_COUNT_H264].value)
> +			return -EINVAL;
> +
> +		if (inst->fw_caps[LAYER_TYPE_H264].value ==
> +			V4L2_MPEG_VIDEO_H264_HIERARCHICAL_CODING_P) {
> +			if (inst->hfi_rc_type == HFI_RC_VBR_CFR)
> +				layer_type = HFI_HIER_P_HYBRID_LTR;
> +			else
> +				layer_type = HFI_HIER_P_SLIDING_WINDOW;
> +		} else if (inst->fw_caps[LAYER_TYPE_H264].value ==
> +			V4L2_MPEG_VIDEO_H264_HIERARCHICAL_CODING_B) {
> +			if (inst->hfi_rc_type == HFI_RC_VBR_CFR)
> +				layer_type = HFI_HIER_B;
> +			else
> +				return -EINVAL;
> +		} else {
> +			return -EINVAL;
> +		}
> +	} else if (inst->codec == V4L2_PIX_FMT_HEVC) {
> +		if (!inst->fw_caps[LAYER_COUNT_HEVC].value)
> +			return -EINVAL;
> +
> +		if (inst->fw_caps[LAYER_TYPE_HEVC].value ==
> +			V4L2_MPEG_VIDEO_HEVC_HIERARCHICAL_CODING_P) {
> +			layer_type = HFI_HIER_P_SLIDING_WINDOW;
> +		} else if (inst->fw_caps[LAYER_TYPE_HEVC].value ==
> +			V4L2_MPEG_VIDEO_HEVC_HIERARCHICAL_CODING_B) {
> +			if (inst->hfi_rc_type == HFI_RC_VBR_CFR)
> +				layer_type = HFI_HIER_B;
> +			else
> +				return -EINVAL;
> +		} else {
> +			return -EINVAL;
> +		}
> +	} else {
> +		return -EINVAL;
> +	}
> +
> +	inst->hfi_layer_type = layer_type;
> +
> +	return hfi_ops->session_set_property(inst, hfi_id,
> +					     HFI_HOST_FLAGS_NONE,
> +					     iris_get_port_info(inst, cap_id),
> +					     HFI_PAYLOAD_U32_ENUM,
> +					     &layer_type, sizeof(u32));
> +}
> +
> +int iris_set_layer_count_gen1(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
> +{
> +	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
> +	struct vb2_queue *sq = v4l2_m2m_get_src_vq(inst->m2m_ctx);
> +	struct vb2_queue *dq = v4l2_m2m_get_dst_vq(inst->m2m_ctx);
> +	u32 layer_enable = inst->fw_caps[LAYER_ENABLE].value;
> +	u32 layer_count = inst->fw_caps[cap_id].value;
> +	u32 hfi_id, ret;
> +
> +	if (!layer_enable || !layer_count)
> +		return -EINVAL;
> +
> +	inst->hfi_layer_count = layer_count;

does it include base layer as well ? It does for gen2, so keep the 
uniformity.

> +
> +	if (!vb2_is_streaming(sq) && !vb2_is_streaming(dq)) {
> +		hfi_id = HFI_PROPERTY_PARAM_VENC_HIER_P_MAX_NUM_ENH_LAYER;
> +		ret = hfi_ops->session_set_property(inst, hfi_id,
> +						    HFI_HOST_FLAGS_NONE,
> +						    iris_get_port_info(inst, cap_id),
> +						    HFI_PAYLOAD_U32,
> +						    &layer_count, sizeof(u32));
> +		if (ret)
> +			return ret;
> +	}
> +
> +	hfi_id = inst->fw_caps[cap_id].hfi_id;
> +	return hfi_ops->session_set_property(inst, hfi_id,
> +					     HFI_HOST_FLAGS_NONE,
> +					     iris_get_port_info(inst, cap_id),
> +					     HFI_PAYLOAD_U32,
> +					     &layer_count, sizeof(u32));
> +}
> +
> +int iris_set_layer_count_gen2(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
> +{
> +	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
> +	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
> +	u32 layer_type = inst->hfi_layer_type;
> +	u32 layer_count, layer_count_max;
> +
> +	layer_count = (inst->codec == V4L2_PIX_FMT_H264) ?
> +		inst->fw_caps[LAYER_COUNT_H264].value :
> +		inst->fw_caps[LAYER_COUNT_HEVC].value;
> +
> +	if (!layer_count)
> +		return -EINVAL;
> +
> +	if (layer_type == HFI_HIER_B) {
> +		layer_count_max = MAX_LAYER_HB;
> +	} else if (layer_type == HFI_HIER_P_HYBRID_LTR) {
> +		layer_count_max = MAX_AVC_LAYER_HP_HYBRID_LTR;
> +	} else if (layer_type == HFI_HIER_P_SLIDING_WINDOW) {
> +		if (inst->codec == V4L2_PIX_FMT_H264) {
> +			layer_count_max = MAX_AVC_LAYER_HP_SLIDING_WINDOW;
> +		} else {
> +			if (inst->hfi_rc_type == HFI_RC_VBR_CFR)
> +				layer_count_max = MAX_HEVC_VBR_LAYER_HP_SLIDING_WINDOW;
> +			else
> +				layer_count_max = MAX_HEVC_LAYER_HP_SLIDING_WINDOW;
> +		}
> +	} else {
> +		return -EINVAL;
> +	}
> +
> +	if (layer_count > layer_count_max)
> +		layer_count = layer_count_max;
> +
> +	layer_count += 1; /* base layer */
> +	inst->hfi_layer_count = layer_count;
> +
> +	return hfi_ops->session_set_property(inst, hfi_id,
> +					     HFI_HOST_FLAGS_NONE,
> +					     iris_get_port_info(inst, cap_id),
> +					     HFI_PAYLOAD_U32,
> +					     &layer_count, sizeof(u32));
> +}
> +
> +int iris_set_layer_bitrate(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
> +{
> +	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
> +	struct vb2_queue *sq = v4l2_m2m_get_src_vq(inst->m2m_ctx);
> +	struct vb2_queue *dq = v4l2_m2m_get_dst_vq(inst->m2m_ctx);
> +	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
> +	u32 bitrate = inst->fw_caps[cap_id].value;
> +
> +	/* ignore layer bitrate when total bitrate is set */
> +	if (inst->fw_caps[BITRATE].flags & CAP_FLAG_CLIENT_SET)
> +		return 0;
> +
> +	if (!(inst->fw_caps[cap_id].flags & CAP_FLAG_CLIENT_SET))
> +		return -EINVAL;
> +
> +	if (!vb2_is_streaming(sq) && !vb2_is_streaming(dq))
> +		return -EINVAL;
> +
> +	return hfi_ops->session_set_property(inst, hfi_id,
> +					     HFI_HOST_FLAGS_NONE,
> +					     iris_get_port_info(inst, cap_id),
> +					     HFI_PAYLOAD_U32,
> +					     &bitrate, sizeof(u32));
> +}
> +
>   int iris_set_properties(struct iris_inst *inst, u32 plane)
>   {
>   	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
> diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.h b/drivers/media/platform/qcom/iris/iris_ctrls.h
> index 609258c81517b71523b682ca994786cdd020b07f..3c462ec9190be8935176b290588f224fe4f144a4 100644
> --- a/drivers/media/platform/qcom/iris/iris_ctrls.h
> +++ b/drivers/media/platform/qcom/iris/iris_ctrls.h
> @@ -22,7 +22,8 @@ int iris_set_level(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id
>   int iris_set_profile_level_gen1(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
>   int iris_set_header_mode_gen1(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
>   int iris_set_header_mode_gen2(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
> -int iris_set_bitrate(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
> +int iris_set_bitrate_gen1(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
> +int iris_set_bitrate_gen2(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
>   int iris_set_peak_bitrate(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
>   int iris_set_bitrate_mode_gen1(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
>   int iris_set_bitrate_mode_gen2(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
> @@ -42,6 +43,10 @@ int iris_set_use_ltr(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_
>   int iris_set_mark_ltr(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
>   int iris_set_use_and_mark_ltr(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
>   int iris_set_intra_period(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
> +int iris_set_layer_type(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
> +int iris_set_layer_count_gen1(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
> +int iris_set_layer_count_gen2(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
> +int iris_set_layer_bitrate(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
>   int iris_set_properties(struct iris_inst *inst, u32 plane);
>   
>   #endif
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> index 87871fed09ed753760b6057ad4afa87be5f91b69..39fc728646d3808c50481ccdfa15ef0dfab05576 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> @@ -604,11 +604,10 @@ iris_hfi_gen1_packet_session_set_property(struct hfi_session_set_property_pkt *p
>   		break;
>   	}
>   	case HFI_PROPERTY_CONFIG_VENC_TARGET_BITRATE: {
> -		struct hfi_bitrate *brate = prop_data;
> -		u32 *in = pdata;
> +		struct hfi_bitrate *in = pdata, *brate = prop_data;
>   
> -		brate->bitrate = *in;
> -		brate->layer_id = 0;
> +		brate->bitrate = in->bitrate;
> +		brate->layer_id = in->layer_id;
>   		packet->shdr.hdr.size += sizeof(u32) + sizeof(*brate);
>   		break;
>   	}
> @@ -728,6 +727,20 @@ iris_hfi_gen1_packet_session_set_property(struct hfi_session_set_property_pkt *p
>   		packet->shdr.hdr.size += sizeof(u32) + sizeof(*intra_period);
>   		break;
>   	}
> +	case HFI_PROPERTY_PARAM_VENC_HIER_P_MAX_NUM_ENH_LAYER: {
> +		u32 *in = pdata;
> +
> +		packet->data[1] = *in;
> +		packet->shdr.hdr.size += sizeof(u32) + sizeof(u32);
> +		break;
> +	}
> +	case HFI_PROPERTY_CONFIG_VENC_HIER_P_ENH_LAYER: {
> +		u32 *in = pdata;
> +
> +		packet->data[1] = *in;
> +		packet->shdr.hdr.size += sizeof(u32) + sizeof(u32);
> +		break;
> +	}
>   	default:
>   		return -EINVAL;
>   	}
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
> index 4343661e86065f5623b2c02c7ee808a3c47a8c41..0e4dee19238464a9671a94eaab8eeda2d7f7ca9f 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
> @@ -154,11 +154,13 @@
>   
>   #define HFI_PROPERTY_PARAM_VENC_LTRMODE				0x200501c
>   #define HFI_PROPERTY_PARAM_VENC_MAX_NUM_B_FRAMES		0x2005020
> +#define HFI_PROPERTY_PARAM_VENC_HIER_P_MAX_NUM_ENH_LAYER	0x2005026
>   #define HFI_PROPERTY_CONFIG_VENC_TARGET_BITRATE			0x2006001
>   #define HFI_PROPERTY_CONFIG_VENC_INTRA_PERIOD			0x2006003
>   #define HFI_PROPERTY_CONFIG_VENC_MARKLTRFRAME			0x2006009
>   #define HFI_PROPERTY_CONFIG_VENC_USELTRFRAME			0x200600a
>   #define HFI_PROPERTY_CONFIG_VENC_SYNC_FRAME_SEQUENCE_HEADER	0x2006008
> +#define HFI_PROPERTY_CONFIG_VENC_HIER_P_ENH_LAYER		0x200600b
>   
>   struct hfi_pkt_hdr {
>   	u32 size;
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
> index aec19efc41a5ef47bbad2471d3c4575704859743..d09096a9d5f934acf072b05c2cf80f3007c3aa7e 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
> @@ -74,7 +74,22 @@ enum hfi_rate_control {
>   #define HFI_PROP_LTR_COUNT			0x03000134
>   #define HFI_PROP_LTR_MARK			0x03000135
>   #define HFI_PROP_LTR_USE			0x03000136
> +
> +enum hfi_layer_encoding_type {
> +	HFI_HIER_P_SLIDING_WINDOW	= 0x1,
> +	HFI_HIER_P_HYBRID_LTR		= 0x2,
> +	HFI_HIER_B			= 0x3,
> +};
> +
> +#define HFI_PROP_LAYER_ENCODING_TYPE		0x03000138
> +#define HFI_PROP_LAYER_COUNT			0x03000139
>   #define HFI_PROP_TOTAL_BITRATE			0x0300013b
> +#define HFI_PROP_BITRATE_LAYER1			0x0300013c
> +#define HFI_PROP_BITRATE_LAYER2			0x0300013d
> +#define HFI_PROP_BITRATE_LAYER3			0x0300013e
> +#define HFI_PROP_BITRATE_LAYER4			0x0300013f
> +#define HFI_PROP_BITRATE_LAYER5			0x03000140
> +#define HFI_PROP_BITRATE_LAYER6			0x03000141
>   #define HFI_PROP_MAX_GOP_FRAMES			0x03000146
>   #define HFI_PROP_MAX_B_FRAMES			0x03000147
>   #define HFI_PROP_QUALITY_MODE			0x03000148
> diff --git a/drivers/media/platform/qcom/iris/iris_instance.h b/drivers/media/platform/qcom/iris/iris_instance.h
> index 16965150f427b901778dd5decf10a1379450b2f4..84b939f390d940c01db4b1c56270a123cabca2e3 100644
> --- a/drivers/media/platform/qcom/iris/iris_instance.h
> +++ b/drivers/media/platform/qcom/iris/iris_instance.h
> @@ -74,6 +74,8 @@ struct iris_fmt {
>    * @enc_raw_height: source image height for encoder instance
>    * @enc_scale_width: scale width for encoder instance
>    * @enc_scale_height: scale height for encoder instance
> + * @hfi_layer_type: hierarchical coding layer type
> + * @hfi_layer_count: hierarchical coding layer count
>    */
>   
>   struct iris_inst {
> @@ -116,6 +118,8 @@ struct iris_inst {
>   	u32				enc_raw_height;
>   	u32				enc_scale_width;
>   	u32				enc_scale_height;
> +	u32				hfi_layer_type;
> +	u32				hfi_layer_count;
>   };
>   
>   #endif
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index 67acd98e467df037d49d2ea1830038c0c8fecbaf..3efe3121459c610af55ad2f930b21c376f0a085b 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -32,6 +32,12 @@ struct iris_inst;
>   #define INVALID_DEFAULT_MARK_OR_USE_LTR		-1
>   #define MAX_LTR_FRAME_COUNT_GEN1		4
>   #define MAX_LTR_FRAME_COUNT_GEN2		2
> +#define MAX_LAYER_HB				3
> +#define MAX_AVC_LAYER_HP_HYBRID_LTR		5
> +#define MAX_AVC_LAYER_HP_SLIDING_WINDOW		3
> +#define MAX_HEVC_LAYER_HP_SLIDING_WINDOW	3
> +#define MAX_HEVC_VBR_LAYER_HP_SLIDING_WINDOW	5
> +#define MAX_HIER_CODING_LAYER_GEN1		6
>   
>   enum stage_type {
>   	STAGE_1 = 1,
> @@ -167,6 +173,23 @@ enum platform_inst_fw_cap_type {
>   	MARK_LTR,
>   	B_FRAME,
>   	INTRA_PERIOD,
> +	LAYER_ENABLE,
> +	LAYER_TYPE_H264,
> +	LAYER_TYPE_HEVC,
> +	LAYER_COUNT_H264,
> +	LAYER_COUNT_HEVC,
> +	LAYER0_BITRATE_H264,
> +	LAYER1_BITRATE_H264,
> +	LAYER2_BITRATE_H264,
> +	LAYER3_BITRATE_H264,
> +	LAYER4_BITRATE_H264,
> +	LAYER5_BITRATE_H264,
> +	LAYER0_BITRATE_HEVC,
> +	LAYER1_BITRATE_HEVC,
> +	LAYER2_BITRATE_HEVC,
> +	LAYER3_BITRATE_HEVC,
> +	LAYER4_BITRATE_HEVC,
> +	LAYER5_BITRATE_HEVC,
>   	INST_FW_CAP_MAX,
>   };
>   
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen1.c b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
> index e9016609127b83b933a18e44250fd43d25f05959..65156584326a1a83588e8055f1318ba1b62e6510 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_gen1.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
> @@ -158,7 +158,7 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8250_enc[] = {
>   		.hfi_id = HFI_PROPERTY_CONFIG_VENC_TARGET_BITRATE,
>   		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
>   			CAP_FLAG_DYNAMIC_ALLOWED,
> -		.set = iris_set_bitrate,
> +		.set = iris_set_bitrate_gen1,
>   	},
>   	{
>   		.cap_id = BITRATE_MODE,
> @@ -313,6 +313,98 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8250_enc[] = {
>   		.flags = CAP_FLAG_OUTPUT_PORT,
>   		.set = iris_set_intra_period,
>   	},
> +	{
> +		.cap_id = LAYER_ENABLE,
> +		.min = 0,
> +		.max = 1,
> +		.step_or_mask = 1,
> +		.value = 0,
> +		.flags = CAP_FLAG_OUTPUT_PORT,
> +	},
> +	{
> +		.cap_id = LAYER_TYPE_H264,
> +		.min = V4L2_MPEG_VIDEO_H264_HIERARCHICAL_CODING_P,
> +		.max = V4L2_MPEG_VIDEO_H264_HIERARCHICAL_CODING_P,
> +		.step_or_mask = BIT(V4L2_MPEG_VIDEO_H264_HIERARCHICAL_CODING_P),
> +		.value = V4L2_MPEG_VIDEO_H264_HIERARCHICAL_CODING_P,
> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
> +	},
> +	{
> +		.cap_id = LAYER_COUNT_H264,
> +		.min = 0,
> +		.max = MAX_HIER_CODING_LAYER_GEN1,
> +		.step_or_mask = 1,
> +		.value = 0,
> +		.hfi_id = HFI_PROPERTY_CONFIG_VENC_HIER_P_ENH_LAYER,
> +		.flags = CAP_FLAG_OUTPUT_PORT,
> +		.set = iris_set_layer_count_gen1,
> +	},
> +	{
> +		.cap_id = LAYER0_BITRATE_H264,
> +		.min = 1,
> +		.max = BITRATE_MAX,
> +		.step_or_mask = 1,
> +		.value = BITRATE_DEFAULT,
> +		.hfi_id = HFI_PROPERTY_CONFIG_VENC_TARGET_BITRATE,
> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
> +			CAP_FLAG_DYNAMIC_ALLOWED,
> +		.set = iris_set_bitrate_gen1,
> +	},
> +	{
> +		.cap_id = LAYER1_BITRATE_H264,
> +		.min = 1,
> +		.max = BITRATE_MAX,
> +		.step_or_mask = 1,
> +		.value = BITRATE_DEFAULT,
> +		.hfi_id = HFI_PROPERTY_CONFIG_VENC_TARGET_BITRATE,
> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
> +			CAP_FLAG_DYNAMIC_ALLOWED,
> +		.set = iris_set_bitrate_gen1,
> +	},
> +	{
> +		.cap_id = LAYER2_BITRATE_H264,
> +		.min = 1,
> +		.max = BITRATE_MAX,
> +		.step_or_mask = 1,
> +		.value = BITRATE_DEFAULT,
> +		.hfi_id = HFI_PROPERTY_CONFIG_VENC_TARGET_BITRATE,
> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
> +			CAP_FLAG_DYNAMIC_ALLOWED,
> +		.set = iris_set_bitrate_gen1,
> +	},
> +	{
> +		.cap_id = LAYER3_BITRATE_H264,
> +		.min = 1,
> +		.max = BITRATE_MAX,
> +		.step_or_mask = 1,
> +		.value = BITRATE_DEFAULT,
> +		.hfi_id = HFI_PROPERTY_CONFIG_VENC_TARGET_BITRATE,
> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
> +			CAP_FLAG_DYNAMIC_ALLOWED,
> +		.set = iris_set_bitrate_gen1,
> +	},
> +	{
> +		.cap_id = LAYER4_BITRATE_H264,
> +		.min = 1,
> +		.max = BITRATE_MAX,
> +		.step_or_mask = 1,
> +		.value = BITRATE_DEFAULT,
> +		.hfi_id = HFI_PROPERTY_CONFIG_VENC_TARGET_BITRATE,
> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
> +			CAP_FLAG_DYNAMIC_ALLOWED,
> +		.set = iris_set_bitrate_gen1,
> +	},
> +	{
> +		.cap_id = LAYER5_BITRATE_H264,
> +		.min = 1,
> +		.max = BITRATE_MAX,
> +		.step_or_mask = 1,
> +		.value = BITRATE_DEFAULT,
> +		.hfi_id = HFI_PROPERTY_CONFIG_VENC_TARGET_BITRATE,
> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
> +			CAP_FLAG_DYNAMIC_ALLOWED,
> +		.set = iris_set_bitrate_gen1,
> +	},
>   };
>   
>   static struct platform_inst_caps platform_inst_cap_sm8250 = {
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> index a7ee63e5cbd8b476d765f29ecb3a7d5d52fae269..32e36b547343b5e4dc2bcfb2de57ee3d515cc8ff 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> @@ -416,7 +416,7 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8550_enc[] = {
>   		.hfi_id = HFI_PROP_TOTAL_BITRATE,
>   		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
>   			CAP_FLAG_DYNAMIC_ALLOWED,
> -		.set = iris_set_bitrate,
> +		.set = iris_set_bitrate_gen2,
>   	},
>   	{
>   		.cap_id = BITRATE_PEAK,
> @@ -780,6 +780,186 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8550_enc[] = {
>   		.flags = CAP_FLAG_OUTPUT_PORT,
>   		.set = iris_set_u32,
>   	},
> +	{
> +		.cap_id = LAYER_ENABLE,
> +		.min = 0,
> +		.max = 1,
> +		.step_or_mask = 1,
> +		.value = 0,
> +		.flags = CAP_FLAG_OUTPUT_PORT,
> +	},
> +	{
> +		.cap_id = LAYER_TYPE_H264,
> +		.min = V4L2_MPEG_VIDEO_H264_HIERARCHICAL_CODING_B,
> +		.max = V4L2_MPEG_VIDEO_H264_HIERARCHICAL_CODING_P,
> +		.step_or_mask = BIT(V4L2_MPEG_VIDEO_H264_HIERARCHICAL_CODING_B) |
> +				BIT(V4L2_MPEG_VIDEO_H264_HIERARCHICAL_CODING_P),
> +		.value = V4L2_MPEG_VIDEO_H264_HIERARCHICAL_CODING_P,
> +		.hfi_id = HFI_PROP_LAYER_ENCODING_TYPE,
> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,

no setter for h264 ?

> +	},
> +	{
> +		.cap_id = LAYER_TYPE_HEVC,
> +		.min = V4L2_MPEG_VIDEO_HEVC_HIERARCHICAL_CODING_B,
> +		.max = V4L2_MPEG_VIDEO_HEVC_HIERARCHICAL_CODING_P,
> +		.step_or_mask = BIT(V4L2_MPEG_VIDEO_HEVC_HIERARCHICAL_CODING_B) |
> +				BIT(V4L2_MPEG_VIDEO_HEVC_HIERARCHICAL_CODING_P),
> +		.value = V4L2_MPEG_VIDEO_HEVC_HIERARCHICAL_CODING_P,
> +		.hfi_id = HFI_PROP_LAYER_ENCODING_TYPE,
> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
> +		.set = iris_set_layer_type,
> +	},
> +	{
> +		.cap_id = LAYER_COUNT_H264,
> +		.min = 0,
> +		.max = 5,
> +		.step_or_mask = 1,
> +		.value = 0,
> +		.hfi_id = HFI_PROP_LAYER_COUNT,
> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_DYNAMIC_ALLOWED,

no setter here ?

> +	},
> +	{
> +		.cap_id = LAYER_COUNT_HEVC,
> +		.min = 0,
> +		.max = 5,
> +		.step_or_mask = 1,
> +		.value = 0,
> +		.hfi_id = HFI_PROP_LAYER_COUNT,
> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_DYNAMIC_ALLOWED,
> +		.set = iris_set_layer_count_gen2,
> +	},
> +	{
> +		.cap_id = LAYER0_BITRATE_H264,
> +		.min = 1,
> +		.max = BITRATE_MAX,
> +		.step_or_mask = 1,
> +		.value = BITRATE_DEFAULT,
> +		.hfi_id = HFI_PROP_BITRATE_LAYER1,
> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
> +			CAP_FLAG_DYNAMIC_ALLOWED,
> +		.set = iris_set_layer_bitrate,
> +	},
> +	{
> +		.cap_id = LAYER1_BITRATE_H264,
> +		.min = 1,
> +		.max = BITRATE_MAX,
> +		.step_or_mask = 1,
> +		.value = BITRATE_DEFAULT,
> +		.hfi_id = HFI_PROP_BITRATE_LAYER2,
> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
> +			CAP_FLAG_DYNAMIC_ALLOWED,
> +		.set = iris_set_layer_bitrate,
> +	},
> +	{
> +		.cap_id = LAYER2_BITRATE_H264,
> +		.min = 1,
> +		.max = BITRATE_MAX,
> +		.step_or_mask = 1,
> +		.value = BITRATE_DEFAULT,
> +		.hfi_id = HFI_PROP_BITRATE_LAYER3,
> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
> +			CAP_FLAG_DYNAMIC_ALLOWED,
> +		.set = iris_set_layer_bitrate,
> +	},
> +	{
> +		.cap_id = LAYER3_BITRATE_H264,
> +		.min = 1,
> +		.max = BITRATE_MAX,
> +		.step_or_mask = 1,
> +		.value = BITRATE_DEFAULT,
> +		.hfi_id = HFI_PROP_BITRATE_LAYER4,
> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
> +			CAP_FLAG_DYNAMIC_ALLOWED,
> +		.set = iris_set_layer_bitrate,
> +	},
> +	{
> +		.cap_id = LAYER4_BITRATE_H264,
> +		.min = 1,
> +		.max = BITRATE_MAX,
> +		.step_or_mask = 1,
> +		.value = BITRATE_DEFAULT,
> +		.hfi_id = HFI_PROP_BITRATE_LAYER5,
> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
> +			CAP_FLAG_DYNAMIC_ALLOWED,
> +		.set = iris_set_layer_bitrate,
> +	},
> +	{
> +		.cap_id = LAYER5_BITRATE_H264,
> +		.min = 1,
> +		.max = BITRATE_MAX,
> +		.step_or_mask = 1,
> +		.value = BITRATE_DEFAULT,
> +		.hfi_id = HFI_PROP_BITRATE_LAYER6,
> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
> +			CAP_FLAG_DYNAMIC_ALLOWED,
> +		.set = iris_set_layer_bitrate,
> +	},
> +	{
> +		.cap_id = LAYER0_BITRATE_HEVC,
> +		.min = 1,
> +		.max = BITRATE_MAX,
> +		.step_or_mask = 1,
> +		.value = BITRATE_DEFAULT,
> +		.hfi_id = HFI_PROP_BITRATE_LAYER1,
> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
> +			CAP_FLAG_DYNAMIC_ALLOWED,
> +		.set = iris_set_layer_bitrate,
> +	},
> +	{
> +		.cap_id = LAYER1_BITRATE_HEVC,
> +		.min = 1,
> +		.max = BITRATE_MAX,
> +		.step_or_mask = 1,
> +		.value = BITRATE_DEFAULT,
> +		.hfi_id = HFI_PROP_BITRATE_LAYER2,
> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
> +			CAP_FLAG_DYNAMIC_ALLOWED,
> +		.set = iris_set_layer_bitrate,
> +	},
> +	{
> +		.cap_id = LAYER2_BITRATE_HEVC,
> +		.min = 1,
> +		.max = BITRATE_MAX,
> +		.step_or_mask = 1,
> +		.value = BITRATE_DEFAULT,
> +		.hfi_id = HFI_PROP_BITRATE_LAYER3,
> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
> +			CAP_FLAG_DYNAMIC_ALLOWED,
> +		.set = iris_set_layer_bitrate,
> +	},
> +	{
> +		.cap_id = LAYER3_BITRATE_HEVC,
> +		.min = 1,
> +		.max = BITRATE_MAX,
> +		.step_or_mask = 1,
> +		.value = BITRATE_DEFAULT,
> +		.hfi_id = HFI_PROP_BITRATE_LAYER4,
> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
> +			CAP_FLAG_DYNAMIC_ALLOWED,
> +		.set = iris_set_layer_bitrate,
> +	},
> +	{
> +		.cap_id = LAYER4_BITRATE_HEVC,
> +		.min = 1,
> +		.max = BITRATE_MAX,
> +		.step_or_mask = 1,
> +		.value = BITRATE_DEFAULT,
> +		.hfi_id = HFI_PROP_BITRATE_LAYER5,
> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
> +			CAP_FLAG_DYNAMIC_ALLOWED,
> +		.set = iris_set_layer_bitrate,
> +	},
> +	{
> +		.cap_id = LAYER5_BITRATE_HEVC,
> +		.min = 1,
> +		.max = BITRATE_MAX,
> +		.step_or_mask = 1,
> +		.value = BITRATE_DEFAULT,
> +		.hfi_id = HFI_PROP_BITRATE_LAYER5,

HFI_PROP_BITRATE_LAYER6 ?

> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
> +			CAP_FLAG_DYNAMIC_ALLOWED,
> +		.set = iris_set_layer_bitrate,
> +	}
>   };
>   
>   static struct platform_inst_caps platform_inst_cap_sm8550 = {
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
> index 0ed82dc2b8af8c789df1b8c10c1a5afc51ef39d8..c2cd4adc082394a9ab6f32a37fe4e57678019d89 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
> @@ -936,6 +936,8 @@ static u32 iris_vpu_enc_bin_size(struct iris_inst *inst)
>   
>   static inline u32 hfi_buffer_get_recon_count(struct iris_inst *inst)
>   {
> +	u32 layer_count = inst->hfi_layer_count;
> +	u32 layer_type = inst->hfi_layer_type;
>   	u32 bframe_count, ltr_count;
>   	u32 num_ref = 1;
>   
> @@ -945,9 +947,35 @@ static inline u32 hfi_buffer_get_recon_count(struct iris_inst *inst)
>   	if (bframe_count)
>   		num_ref = 2;
>   
> +	/* The shift operation here is rounding logic, similar to [(x+1)/2]. */
> +	if (layer_type == HFI_HIER_P_HYBRID_LTR)
> +		num_ref = (layer_count + 1) >> 1;
> +
> +	if (layer_type == HFI_HIER_P_SLIDING_WINDOW) {
> +		if (inst->codec == V4L2_PIX_FMT_HEVC)
> +			num_ref = (layer_count + 1) >> 1;
> +		else if (inst->codec == V4L2_PIX_FMT_H264 && layer_count < 4)
> +			num_ref = (layer_count - 1);
> +		else
> +			num_ref = layer_count;
> +	}
> +
>   	if (ltr_count)
>   		num_ref = num_ref + ltr_count;
>   
> +	/*
> +	 * The expression (1 << layers - 2) + 1 accounts for the number of reference
> +	 * frames in the Adaptive Hierarchical B-frame encoding case. In this scheme,
> +	 * the number of frames in a sub-GOP is related to (2^(number of layers) - 1),
> +	 * hence the use of the shift operation.
> +	 */
> +	if (layer_type == HFI_HIER_B) {
> +		if (inst->codec == V4L2_PIX_FMT_HEVC)
> +			num_ref	= layer_count;
> +		else
> +			num_ref = (1 << (layer_count - 2)) + 1;
> +	}
> +
>   	return num_ref;
>   }
>   

Regards,
Vikash


