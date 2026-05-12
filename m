Return-Path: <linux-media+bounces-61313-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6E2UCDpsA2of5wEAu9opvQ
	(envelope-from <linux-media+bounces-61313-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 20:06:50 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BCC4526C75
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 20:06:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id EFA11306327A
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 17:53:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA80F3C09FC;
	Tue, 12 May 2026 17:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JxEanmOM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RgDBly3b"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB7A72D12ED
	for <linux-media@vger.kernel.org>; Tue, 12 May 2026 17:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778608338; cv=none; b=gRH4owucTXYwqw61T8MnHqD2P6WOLKgabZdtBa3yiZ94sgKLsHJ+JRsma6K6aj3WW9GhzdGasISKNb3F6W+IaYvLWgCMjh9l68fYz54ZRNVkYTpYSU5eBzl7gacnxvO+ZL423xN9B9v+Xugn904d/oZNovnbFlByzP3fFqu5JqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778608338; c=relaxed/simple;
	bh=FYBpb9HDMk9zYyD3R2L2DWIXBNaI2qIxjFxCMRHjhVY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=foTn1QidcjALNkKHRQl2Z/QOvJIO0BxxYNvVhE9Xv7xu0HWa8BqdS1haCepgFYI9S42UHbqQf078bGa0qqviAGWuBaLKFsTiQIDnttGTamHtNPM2rWF0Z044QlLkdvNy7rVJaxBoWbYFhwRALzn2NrZnCbcK9ewgRQe3bhmkenE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JxEanmOM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RgDBly3b; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64CC4PF53320941
	for <linux-media@vger.kernel.org>; Tue, 12 May 2026 17:52:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=iuRKzl2H0S+sNsBSVPSenDJn
	kKJASVZxZOkqN+6UxY8=; b=JxEanmOMqnqrnO+EMypBe//BbDoXFa9dy8sV0lgy
	W/bX3CdfQbq/stXONqjB6nQt3/w55LS4AhU4wAJwLtOLvPsqCb77LvsZ8Q8LqAd+
	IVKySt2HWDfQ2C8pF65RphyjOwKQlDdMcjVJ+YlbXC+skCodKwuhzok8v8nSXz5M
	ddnxAFZzNbnGzB/HVdFEa5uLVA3lxTyFP5WEVzo+LK/uTi6hsOXABkR95agaYF9Z
	6b0U5EWNA/GxNLfPW/Fu2CP/m2QUVBOZjkiTExY+UVakJl6tSN9CqMMfCjQmCSHt
	4tU1GE0ZyT99dNVJqsAcYPcQCgySDYufLB2o7NxrT0Gb7g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e43w1sbpf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 12 May 2026 17:52:16 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51009190feeso113095961cf.2
        for <linux-media@vger.kernel.org>; Tue, 12 May 2026 10:52:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778608334; x=1779213134; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iuRKzl2H0S+sNsBSVPSenDJnkKJASVZxZOkqN+6UxY8=;
        b=RgDBly3bWrV+S7HkHz1ct1wQaXGnqQDTNfAl6x9LCmppj4jhQQ69+QdU0DYb2jOPuI
         xQWsvfW3LaUMGBqcn5FrAG6NEOH7pWPx3JUDwDvrlMfWKbdJwbyVA6YJlDlq7osxGZd+
         bXltPOTX/HXZWAzbf4g4W32cs6qLLPdDesJg+e9pLhBQuIoEOxH0LvTkDbcvN1w1nnSN
         p73Ld+WFv8NU1Z1//kqCs0YOrUS6pnRtlhFmFWutij1ZIY4viHc94Z9Qmi4O2PkE8UYs
         yMY3SHvoAVB6zTiLq6U1J9AnLyh3t6MJWVwxDRBeqgnlj9dvqJ6WrHIN2hMxzBch0k0C
         gSpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778608334; x=1779213134;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iuRKzl2H0S+sNsBSVPSenDJnkKJASVZxZOkqN+6UxY8=;
        b=dsBOnA9vHU4bQroMSC2lLYmQg/yH0+5QsYiPGkD69krovh+u48s6jtu1GZgj1oRvwz
         OUto9l9J1G6AbCY2lmbk5qzrj2DJ+V0gHhF0JLAbpKGKkL8GyGxLJ5OczHWdBNIG8HUQ
         F5G7WePi8GcfLjwRcjPVjz3aA3pwMakwc8E9FpdEr6kXBmgVDKrwKeoT8ZEfNkxqlPst
         kClRQwScbHjjZeYcguLFFHD9hNPRbMK+9dApQMrjz608SU2EPFhJsVWLbZw6bXKUPiay
         wgc2QamltypzLmplNJf5ftGFSBa0SJJ7U78uOx7m7cSHOObQKAvTFdSP6mfQlmDsLUCP
         MCjA==
X-Forwarded-Encrypted: i=1; AFNElJ+yhC49FAJwGA/SLFmRTOHMvel482ltqddIRqYQ7JppQ5YI1zjeiTLHR56HH5YIDTmYwJWgHrWF3Jgvyw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2V6hcNizWmy2BcFjo+iku4UFhVo4Dhqxg2MqwkrSN38ebqpwc
	kWKmhX6RrJxtTdyNqvAZANIL2kj/vAlWURjPgsegPybaPE518AXax2dxJ9YbRCIkG0tAEHQCFVQ
	szwnrQGmA+4V1SgLG2MYUqQQYr4OZraOvl8A49mCwYBiKSn79Q3eB3QH36oI/OBxDAQ==
X-Gm-Gg: Acq92OEh3BaUdyr3tsXY0lMaQckuYo0/lSDLPzRZrN0bWFng8kEsafiUL41q5zzsuzt
	U9tod0xRd+wVSeFyV18rBDaNSHOdnfoSRjbo81OkL0VW9Rn2CPpbpcSpJRQhGo+/wTTq8Zf60zH
	9CeyedeDWsMH3Ki1ow+igTnz+5TMgWCG6q+eAU6AjgP87CalM4uCqigD3amrGiTmteuBM4V33eB
	d9Spa7YQkldQOLYuL3YnyH+2gpXCQ1FX6O3mcpMtBAhkKz+fIiCEPAa6nnzInZHfFfEusOWfj87
	ZPWyP+qLYnuQ6cOz2eDC8/i3vQwN1mkSM55Jfaa4cfvN6pcqGiZuGN+/M0+N7OSf5jElEAN2cMG
	mEorHkjMVnfZX/gYVzSNYILNlXBudtnJsqZD+tlGMQxrIAnAhl7vq+Oqv6Et0j6OHnyQVRtCOIz
	bnIMtb/UeYQbS/gK63DBppyEf00AboI1We428=
X-Received: by 2002:a05:622a:568e:b0:515:6c6b:48a0 with SMTP id d75a77b69052e-5156c6b4a29mr21482591cf.28.1778608333931;
        Tue, 12 May 2026 10:52:13 -0700 (PDT)
X-Received: by 2002:a05:622a:568e:b0:515:6c6b:48a0 with SMTP id d75a77b69052e-5156c6b4a29mr21482231cf.28.1778608333423;
        Tue, 12 May 2026 10:52:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393f6292993sm34234081fa.41.2026.05.12.10.52.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 10:52:12 -0700 (PDT)
Date: Tue, 12 May 2026 20:52:10 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Wangao Wang <wangao.wang@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>, quic_qiweil@quicinc.com,
        quic_renjiang@quicinc.com
Subject: Re: [PATCH v6 6/6] media: qcom: iris: Add intra refresh support for
 encoder
Message-ID: <ixxau44iyaf3oiro4csw2i6iabcgnmhacc52ee4t45muxbidsv@yi3trwpyk2sr>
References: <20251114-iris_encoder_enhancements-v6-0-d6d35a92635d@oss.qualcomm.com>
 <20251114-iris_encoder_enhancements-v6-6-d6d35a92635d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251114-iris_encoder_enhancements-v6-6-d6d35a92635d@oss.qualcomm.com>
X-Proofpoint-GUID: 7eZD4n5DMaLNcprCiDZFd7omP2Rhfkhi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDE4NSBTYWx0ZWRfX+olN4gY/8xjs
 QIm7u8Dl1rbl0cxe+RheCjPEGat66zj0S10VPKkvDD33MS4RsJJDqVbHOVgDxS6feJpyb1QolbI
 93UngUEOFaYxVmVnQtIWBOeFT7ofodKTqc9mIFtZqABmhk2naVcCypSz+wS+v9Odg8HfwM0K2YU
 0p+jf4iyTlZrZoFKs7gOpWVhFlX2y/md4WhYFvxsJ8mrAqK9333EWhcFKhv8MqXBky9lc2G0n9G
 CyuY5OmfFbDxZTunRx9uZ/WwXRL94Kt1PGv73OmH732jLshtqwcWA3CcGjN8Tg8e5zYzrtdV3xA
 7ks42kvftKd3hj0JgnnpR/tLSeyxuaCzYyIZw+pY8gtFGMtZ2E0aiFeEbPzhRVCw7ugGxNwreXR
 u2VH5eoSBSSIRTJDGY9wJYRhEzDqUhpFUmGW5NJ24428/TJrL43s2gzorplNXekJOyqBoWMxVen
 WVUlVzRyobi1JqX7+xA==
X-Proofpoint-ORIG-GUID: 7eZD4n5DMaLNcprCiDZFd7omP2Rhfkhi
X-Authority-Analysis: v=2.4 cv=BoGtB4X5 c=1 sm=1 tr=0 ts=6a0368d0 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=bhafrh2O5digpgmg_hUA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1015
 impostorscore=0 phishscore=0 spamscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605120185
X-Rspamd-Queue-Id: 3BCC4526C75
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61313-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,linaro.org:email,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Fri, Nov 14, 2025 at 11:09:03AM +0800, Wangao Wang wrote:
> Add support for V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD and
> V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE controls.
> 
> Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-HDK
> Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_ctrls.c      | 34 ++++++++++++++++++++++
>  drivers/media/platform/qcom/iris/iris_ctrls.h      |  1 +
>  .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  2 ++
>  .../platform/qcom/iris/iris_platform_common.h      |  2 ++
>  .../media/platform/qcom/iris/iris_platform_gen2.c  | 19 ++++++++++++
>  5 files changed, 58 insertions(+)
> 
> @@ -954,6 +962,32 @@ int iris_set_flip(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
>  					     &hfi_val, sizeof(u32));
>  }
>  
> +int iris_set_ir_period(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
> +{
> +	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
> +	struct vb2_queue *q = v4l2_m2m_get_dst_vq(inst->m2m_ctx);
> +	u32 ir_period = inst->fw_caps[cap_id].value;
> +	u32 ir_type = 0;
> +
> +	if (inst->fw_caps[IR_TYPE].value ==
> +			V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE_RANDOM) {
> +		if (vb2_is_streaming(q))
> +			return 0;

Comment, why. Here or in the commit message.

> +		ir_type = HFI_PROP_IR_RANDOM_PERIOD;
> +	} else if (inst->fw_caps[IR_TYPE].value ==
> +			V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE_CYCLIC) {
> +		ir_type = HFI_PROP_IR_CYCLIC_PERIOD;
> +	} else {
> +		return -EINVAL;
> +	}
> +
> +	return hfi_ops->session_set_property(inst, ir_type,
> +					     HFI_HOST_FLAGS_NONE,
> +					     iris_get_port_info(inst, cap_id),
> +					     HFI_PAYLOAD_U32,
> +					     &ir_period, sizeof(u32));
> +}
> +
>  int iris_set_properties(struct iris_inst *inst, u32 plane)
>  {
>  	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
> diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.h b/drivers/media/platform/qcom/iris/iris_ctrls.h
> index 355a592049f3fcc715a1b9df44b4d1398b052653..9518803577bc39f5c1339a49878dd0c3e8f510ad 100644
> --- a/drivers/media/platform/qcom/iris/iris_ctrls.h
> +++ b/drivers/media/platform/qcom/iris/iris_ctrls.h
> @@ -34,6 +34,7 @@ int iris_set_frame_qp(struct iris_inst *inst, enum platform_inst_fw_cap_type cap
>  int iris_set_qp_range(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
>  int iris_set_rotation(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
>  int iris_set_flip(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
> +int iris_set_ir_period(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
>  int iris_set_properties(struct iris_inst *inst, u32 plane);
>  
>  #endif
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
> index c9e93d97fb01ec8d9c4b38ea932aae21c1df0943..f6a214a6815420f299be70f80732943d02168f0c 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
> @@ -70,6 +70,7 @@ enum hfi_rate_control {
>  #define HFI_PROP_QP_PACKED			0x0300012e
>  #define HFI_PROP_MIN_QP_PACKED			0x0300012f
>  #define HFI_PROP_MAX_QP_PACKED			0x03000130
> +#define HFI_PROP_IR_RANDOM_PERIOD		0x03000131
>  #define HFI_PROP_TOTAL_BITRATE			0x0300013b
>  #define HFI_PROP_MAX_GOP_FRAMES			0x03000146
>  #define HFI_PROP_MAX_B_FRAMES			0x03000147
> @@ -108,6 +109,7 @@ enum hfi_flip {
>  #define HFI_PROP_BUFFER_MARK			0x0300016c
>  #define HFI_PROP_RAW_RESOLUTION		0x03000178
>  #define HFI_PROP_TOTAL_PEAK_BITRATE		0x0300017C
> +#define HFI_PROP_IR_CYCLIC_PERIOD		0x0300017E

Lowercase hex.

>  #define HFI_PROP_OPB_ENABLE			0x03000184
>  #define HFI_PROP_COMV_BUFFER_COUNT		0x03000193
>  #define HFI_PROP_END				0x03FFFFFF

-- 
With best wishes
Dmitry

