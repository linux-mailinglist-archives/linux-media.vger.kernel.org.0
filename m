Return-Path: <linux-media+bounces-51522-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oC/nJeAhd2lmcgEAu9opvQ
	(envelope-from <linux-media+bounces-51522-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 26 Jan 2026 09:12:16 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FFC9855CE
	for <lists+linux-media@lfdr.de>; Mon, 26 Jan 2026 09:12:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 801BE300383F
	for <lists+linux-media@lfdr.de>; Mon, 26 Jan 2026 08:12:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E9CF2F83B7;
	Mon, 26 Jan 2026 08:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NB0MQmEM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DlIR+urQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AE902F6935
	for <linux-media@vger.kernel.org>; Mon, 26 Jan 2026 08:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769415129; cv=none; b=EUm/IaeSBsyjXXPKVxjdvp3saNFX1G1pF/lyVtCZPuUmGIfW52mAcgXjLCiDVTBx2iAphCdfr2asOTg2VTvpRXdJU8BN3wNqQ7HUWErPXORgn7MzV+uNTAZxao9bJKUnSWOJHwAEIF5cKkCRm3cYCJ4gHUUkKA1ptyI8aW1yeD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769415129; c=relaxed/simple;
	bh=ZwRb3dT/cGaGYFrvTwAatD7KQyxYekQVp/ubs4iaius=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=edV0buSw/LNKkk5EoPfZE49V/uPShN6KNPi20NVDaIhRnOfMRO8MvqlYyLO6euBKrpLycpqe6lqrxBBrh16/IJgL34PDZ4VwvCD5hyqYTNIheQXshbAgcpBWhTzwO5pcb3AenS8KrHktZGkjGQXtbQh/v4W97OvwgFfBmxgC+oI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NB0MQmEM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DlIR+urQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60PKsLmY344832
	for <linux-media@vger.kernel.org>; Mon, 26 Jan 2026 08:12:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x1CMx7e3LYR7pLqgZ7x++uPS48aYhata5WM+yqK19hU=; b=NB0MQmEMglWg19KA
	ykmdIfJn16iaD7+EOFsEIrFKhjPn4EVq+1LwhOyhm+t7W0FSQoSlCNuxYciJSNip
	pO4KLhj/lCfOdAotq9Sb5WoyiWktOMcjZzV5DnqBh9eITeeYbLaHM0rYhOGNINRV
	kqZsGExLq1x6zfAwMhWzw8YNYZkLYdVJ78G6JrprmaxpiPGDciNK7vqFEca3EFLp
	YorpGeFA/+ZFEeM9zbFb1MpiGjTEOIBGo3uNFckesDxoryVky+oHGMsotN4a2bqN
	KhYFOmI+4K7LAGKtyxw5+yW2smYa3kHEnNzZgtmM13Y72VOSD8Ivgf8IhkNaroI5
	0moRDQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvq9tuu0b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 26 Jan 2026 08:12:06 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a08cbeb87eso43887805ad.3
        for <linux-media@vger.kernel.org>; Mon, 26 Jan 2026 00:12:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769415126; x=1770019926; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x1CMx7e3LYR7pLqgZ7x++uPS48aYhata5WM+yqK19hU=;
        b=DlIR+urQLsodcqFqnaWVgXe+rbx9tq9Pm0hGFxI0katiD5p2vlzi6mA7ztBmLQoFOo
         zVg+LyVhdxgQY/F2M59TW7pFbXr0/0w/TKnbaU56xsRWGiK6Ee2pWw4Ax4QpZ54iPPwT
         2iockJsuO0DZ830/PDWEHjqKakAjqeGqSWoIzjXM8YtdLmPe3uHf7VI732028gDTV+hG
         oAtsvx9qlvA+zuKnPZmqVwDk04gZzOeUESHUu4gc8OWltmDNhaqegTV3WT0lYkkd5LCP
         gfbjxeA4Y0S+vnj46rQRQ44Uw1gTWl9p+mrmLNDNB47aqO8Bfjg7kYK70DOWlRGIdsPh
         ZjZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769415126; x=1770019926;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x1CMx7e3LYR7pLqgZ7x++uPS48aYhata5WM+yqK19hU=;
        b=bZmEnX+dlHeroSDSmpR108KAEUfMpu0/zxBMyMcAENhuqFX3wsyZBt2toLC/u5gPG+
         /0S/hD/hAo1k9kDMifKycmtRGZCn/7BpaKfReEOmzsV6zOFlhZIW2hT6e5ZtnVxUTEhD
         4XjErqAMS4DYRq0wyPYmIOw3E7OQtWT+BXROh/T3T2r1tdc+R9JlsekcUG719Tk84sDO
         sw6xzny5+f1Nh8CCu4TXzDS86Z7LYu/3HPs+u9uONvJjRh1V5GikFthYNqLJj5JXZfws
         J1XwJ/5TdmqRy9kZLuTKLRZ/v60iIXX6QtaW6ittI7CKHzYHCyKO/E0efE4QrRJE2Ft7
         +5SA==
X-Forwarded-Encrypted: i=1; AJvYcCUVvbESQZTpTbpePbhXKF1BMz1owK8qztOuTshm0+H6cOqBi5dfQ21md1ILnkVxnr/cn7CifcjVxtZb+g==@vger.kernel.org
X-Gm-Message-State: AOJu0YziYFDGdbo5PetV6U6cbsG6ghGeUCREUZe8xJQRcAbSjBKYPWta
	YrdNmwoOPk2YAiO64ub60/c0dxSVzz8hwBHyaA2Vo5hI3vnYJMZnkMs/FRuhINe6oTOGbvsgUHK
	ADacnb8RPHwBfneJSmsgXDugA+P9kGXp8WQPSxB01Uqr5HvtKgvhiD/vrP0o08QoATQ==
X-Gm-Gg: AZuq6aL//iNZAD7ZhvEfeaG2iYfhRuvedRbNzEhXjICjDQ9vQPGr5Qg6zIO5ujDNgq/
	krPvOaal4jFKxpZMagz4qNxEPU+55owrkGsLNwKW/p2gOKOsdYt0WX4JPvNlqwhuQO5i0my+vVB
	nRxg5HNiKCcNnHuZG1YhHLxB1F+Dp0JHhfNbtCSns+8j80Shd+swoWV8u5Q7IzBat8w2uuDR9LX
	0t+9S3G5Bm69AcflOYmSGnWwa4gJZpcNC0z83wuQXEG2L/oM9Er2rvzXGHJfCDCbiVQTTpjmuOn
	kiyZkrnqCCziwZYKcNDpaDjp5g+L6PmbNaSCSq2ww2icr0/j8o1QJWXtQPak25TF8AD3DknugWQ
	HF3cNmNEfC/7pxKf0scOc+XJPH+MtblQPAw2KqDYEKOJJirOE4sg59pxnCMkJA0uep02r
X-Received: by 2002:a17:903:24f:b0:2a7:6f90:8650 with SMTP id d9443c01a7336-2a84530e11fmr36010275ad.55.1769415125751;
        Mon, 26 Jan 2026 00:12:05 -0800 (PST)
X-Received: by 2002:a17:903:24f:b0:2a7:6f90:8650 with SMTP id d9443c01a7336-2a84530e11fmr36009995ad.55.1769415125212;
        Mon, 26 Jan 2026 00:12:05 -0800 (PST)
Received: from [10.249.16.203] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802dcd776sm82001135ad.26.2026.01.26.00.12.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jan 2026 00:12:04 -0800 (PST)
Message-ID: <dd9cd9dd-3947-4ea9-bdbc-0c655238af46@oss.qualcomm.com>
Date: Mon, 26 Jan 2026 16:12:01 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: wangao.wang@oss.qualcomm.com, quic_qiweil@quicinc.com,
        Renjiang Han <renjiang.han@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 4/6] media: qcom: iris: Add hierarchical coding support
 for encoder
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20260109-batch2_iris_encoder_enhancements-v3-0-196855ef32ba@oss.qualcomm.com>
 <20260109-batch2_iris_encoder_enhancements-v3-4-196855ef32ba@oss.qualcomm.com>
 <e4afc72c-ed44-c516-a44f-4f727da86248@oss.qualcomm.com>
Content-Language: en-US
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
In-Reply-To: <e4afc72c-ed44-c516-a44f-4f727da86248@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI2MDA2OSBTYWx0ZWRfXw+3gdUoRyVxo
 PPpotV+6lwPngCo2oTimiiONcrkZWr/NWiBM09BwfWrV4CGB1SdVVe3NWNjJ+Pqqg2hb7qY/xas
 mmO6oGGDMrcV9VBYs0qap3s55G6Vp4ZdZMiZ/igB80yIZ9le/Ip/CN+nHgJjMQHJL37dgxKx66J
 0DGzhCG9uqy/6WaGTFgxysGMG9Lis+2NKZrFF3agJ0MHaO69sPINIs3OnH+kptutKsrEfttSvpg
 +JOjQDo7PPwqFJiey/4klHQuhj75JwsVe9ZUC+kEQBIflIlhZPs8Gp8aGFIpAqvOtbPhCFX7ux1
 Jg9YjwD8Q92DmPcTq5bv4VkBxrxbWCkZOEN1Y8z4L77pppeKtbHcb5zVK+qmEk7tDKGUMGbClU9
 3ZIF38alQmgqt1/CSClWCAS2piHkmEZIaG1NUBb1jeH7Rrtvlzff0yjxpKL4jScuY17Q3s3hyTQ
 xJ5YaQmxleDVXL76y9Q==
X-Authority-Analysis: v=2.4 cv=QN5lhwLL c=1 sm=1 tr=0 ts=697721d7 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=65R93-EQ1uaeyMUcKjgA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: 2YEik0mF4Wr_EOJiPEbVw8aMy9272zca
X-Proofpoint-ORIG-GUID: 2YEik0mF4Wr_EOJiPEbVw8aMy9272zca
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-26_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 adultscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601260069
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51522-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wangao.wang@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2FFC9855CE
X-Rspamd-Action: no action



On 2026/1/22 17:38, Dikshita Agarwal wrote:
>> @@ -116,6 +116,40 @@ static enum platform_inst_fw_cap_type iris_get_cap_id(u32 id)
>>   		return MARK_LTR;
>>   	case V4L2_CID_MPEG_VIDEO_B_FRAMES:
>>   		return B_FRAME;
>> +	case V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING:
>> +		return LAYER_ENABLE;
> 
> Will the same control be used for HEVC as well? I think this is applicable
> for only H264 encoders.
> 

H264 flow:
V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING,
V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING_TYPE,
V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING_LAYER
HEVC flow:
V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_TYPE,
V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_LAYER

LAYER_ENABLE is used for H.264. In the HEVC flow, this flag is 
considered redundant—once the type is set, layer encoding is implicitly 
enabled.

>> +int iris_set_bitrate_gen1(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
>> +{
>> +	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
>> +	u32 entropy_mode = inst->fw_caps[ENTROPY_MODE].value;
>> +	u32 bitrate = inst->fw_caps[cap_id].value;
>> +	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
>> +	struct hfi_bitrate hfi_val;
>> +	u32 max_bitrate;
>> +
>> +	if (!(inst->fw_caps[cap_id].flags & CAP_FLAG_CLIENT_SET) && cap_id != BITRATE)
>> +		return -EINVAL;
> 
> Can you pls explain what is this check for?
> 
> The layer bitrate should only be set if layer encoding is enabled, isn't it?
> 

This flag is used to confirm whether the corresponding ctrl has been 
invoked. A check should also be added to determine whether layer 
encoding is enabled, while excluding bitrate configuration in 
non–layer‑encoding scenarios.

>> +	if (inst->codec == V4L2_PIX_FMT_H264) {
>> +		if (!layer_enable || !inst->fw_caps[LAYER_COUNT_H264].value)
>> +			return -EINVAL;
>> +
>> +		if (inst->fw_caps[LAYER_TYPE_H264].value ==
>> +			V4L2_MPEG_VIDEO_H264_HIERARCHICAL_CODING_P) {
>> +			if (inst->hfi_rc_type == HFI_RC_VBR_CFR)
>> +				layer_type = HFI_HIER_P_HYBRID_LTR;
>> +			else
>> +				layer_type = HFI_HIER_P_SLIDING_WINDOW;
>> +		} else if (inst->fw_caps[LAYER_TYPE_HEVC].value ==
>> +			V4L2_MPEG_VIDEO_HEVC_HIERARCHICAL_CODING_B) {
> 
> why are you checking HEVC layer type for H264 codec? seems like a bug.
> 

This is a bug and will be fixed in v4.

>> +int iris_set_layer_count_gen1(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
>> +{
>> +	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
>> +	struct vb2_queue *sq = v4l2_m2m_get_src_vq(inst->m2m_ctx);
>> +	struct vb2_queue *dq = v4l2_m2m_get_dst_vq(inst->m2m_ctx);
>> +	u32 layer_enable = inst->fw_caps[LAYER_ENABLE].value;
>> +	u32 layer_count = inst->fw_caps[cap_id].value;
>> +	u32 hfi_id, ret;
>> +
>> +	if (!layer_enable || !layer_count)
>> +		return -EINVAL;
>> +
>> +	inst->hfi_layer_count = layer_count;
>> +
>> +	if (!vb2_is_streaming(sq) && !vb2_is_streaming(dq)) {
>> +		hfi_id = HFI_PROPERTY_PARAM_VENC_HIER_P_MAX_NUM_ENH_LAYER;
> 
> why the streaming check? and what's the significance of this setting? why
> this prop is set under streaming check?
> 

This property needs to be set to the firmware before streaming. It 
represents the maximum layer count and is static; any dynamically 
configured layer count later must not exceed this maximum.

>> +
>> +int iris_set_layer_bitrate(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
>> +{
>> +	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
>> +	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
>> +	u32 bitrate = inst->fw_caps[cap_id].value;
>> +
>> +	/* ignore layer bitrate when total bitrate is set */
>> +	if (inst->fw_caps[BITRATE].flags & CAP_FLAG_CLIENT_SET)
>> +		return 0;
>> +
> 
> any streaming check required here?
> 

A streaming check will be added here.

>> +	{
>> +		.cap_id = LAYER_TYPE_HEVC,
>> +		.min = V4L2_MPEG_VIDEO_HEVC_HIERARCHICAL_CODING_B,
>> +		.max = V4L2_MPEG_VIDEO_HEVC_HIERARCHICAL_CODING_P,
>> +		.step_or_mask = BIT(V4L2_MPEG_VIDEO_HEVC_HIERARCHICAL_CODING_B) |
>> +				BIT(V4L2_MPEG_VIDEO_HEVC_HIERARCHICAL_CODING_P),
>> +		.value = V4L2_MPEG_VIDEO_HEVC_HIERARCHICAL_CODING_P,
>> +		.hfi_id = HFI_PROP_LAYER_ENCODING_TYPE,
>> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
>> +		.set = iris_set_layer_type,
> 
> layer type depends on layer count so shouldn't you have layer count before
> layer type in caps? or handle both in same set API?
> 

In the iris_set_layer_type API, there is a check for the layer count. If 
the count is 0, layer type will not be set to the firmware.

>> +	/*
>> +	 * The expression (1 << layers - 2) + 1 accounts for the number of reference
>> +	 * frames in the Adaptive Hierarchical B-frame encoding case. In this scheme,
>> +	 * the number of frames in a sub-GOP is related to (2^(number of layers) - 1),
>> +	 * hence the use of the shift operation.
>> +	 */
>> +	if (layer_type == HFI_HIER_B) {
>> +		if (inst->codec == V4L2_PIX_FMT_HEVC)
>> +			num_ref	= layer_count;
>> +		else
>> +			num_ref = (1 << (layer_count - 2)) + 1;
>> +	}
> 
> were you able to test these different scenarios?
> 

Okay, I will test the other scenarios.

-- 
Best Regards,
Wangao


