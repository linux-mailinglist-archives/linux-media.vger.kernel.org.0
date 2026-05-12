Return-Path: <linux-media+bounces-61307-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0I+/DSxmA2oq5gEAu9opvQ
	(envelope-from <linux-media+bounces-61307-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 19:41:00 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 76E28525F13
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 19:40:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DD1DA3025D38
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 17:40:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 371733E0745;
	Tue, 12 May 2026 17:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BtjkCAc2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jNP3KZAO"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 242033DC862
	for <linux-media@vger.kernel.org>; Tue, 12 May 2026 17:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778607645; cv=none; b=rJoDNQ4V2mEaLQScEBsHYLhV52qdvY4YpDfUe5BkQEl46dxesqmS2CtPsnmHcVPHCExIm3DZNFpwY3qkDtnd5BBDEIiE4JLyHOd69fFFHL2nKkcmat7Hv9prm63k9oaSpw+Jk8wz40h5Idt2goUq7Roe0cDTzoGqGGWBbn8+7tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778607645; c=relaxed/simple;
	bh=07b2wn9qUxUy+k2+lVl3+1Qxar7E3VLDvFFEqgwX44U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JPqDA53cGPcR/egVPDLFI88Da5rRVCEuyYp5Nnac2UHSjmW0xwFbKP/Ptv+mB5yAqGpp5d+lgjlWhd8jrchzJ2/YXypve75n/k7lu60ZnwExVraFv91sujl+JthmTUK4nJCenL0yY3q+L5n7eogM0xviu7INC8GxIE82yiKrWIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BtjkCAc2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jNP3KZAO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64CEJPQZ424495
	for <linux-media@vger.kernel.org>; Tue, 12 May 2026 17:40:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=RpNEDhNdBps/y2+PC0xSdhx2
	e7O3NRdNbIHJ/ZR4D9Q=; b=BtjkCAc2/ziG2SlkjUY/3LBh9YlRABaFdSsEBlwn
	jtxGZUekmkJqnOk9SV+tv3vjaHZSecoGjN16FiTt9tRkVWZ21/jcR5UFW4CSQ3P1
	7TNxh2QEJygsfEIlRXKb47UGACa3i3+2MYYn7g60craCRNJTqK3htjbSoaDqESkp
	Vt6LbnlEqHjjltfUqqIKeGjYRNejpu8JvoadY6YBy9OEy7JMEaUoUev4UobcjFA6
	Ck5FoquufhDcGDuZpMydbfu/qc3IWxziZjzsVEzMPkQHpgF/bMt5+HLSmQLOf3lY
	YLOLBcoAK6mJzw0JuQtOAPzT1iWQnIAROHzbbwtIWGp2iQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e45v58tg5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 12 May 2026 17:40:43 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50e575a50bcso41968781cf.0
        for <linux-media@vger.kernel.org>; Tue, 12 May 2026 10:40:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778607642; x=1779212442; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RpNEDhNdBps/y2+PC0xSdhx2e7O3NRdNbIHJ/ZR4D9Q=;
        b=jNP3KZAOLiOq6RWV8tyrxwH4ofiJWoq7FCozvdWj9yM3k0u3MATdmEthOZ9sNujj30
         ybb+ti69nVYGrLclXIZ16hQhLKvwe9preLXaUf0aurVrNpXe/Bk4wX7ZMdgCsB8wddW2
         A60Xcn8w90A8Vx3/OSCNcuBS4nSnjxd+E/e/xGPLZBXyEWTGmlBUNdkdNhx8nHpqSY2K
         DJXk/PqNgz4kdsq2D9GBjq0rdFBVnFWu0XPOYwcA7ldI42WbhRCZT0BDFKurGETyg9Tt
         5twRBwJLjVbtbhIyy588NF1bsX5AUz8N3PH0oflHuhq3yLHNu2kXs60Wk7skQP+krahx
         1g6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778607642; x=1779212442;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RpNEDhNdBps/y2+PC0xSdhx2e7O3NRdNbIHJ/ZR4D9Q=;
        b=DXAOSd81ophqNRDycV+kuj3nGd6obWoDMX8zjLMqPEez9LRT0epTv2VAtvhMepmgw3
         7/lgUyKnSXJV5o6ph0MQA+AQODpvYUO+b0q6p9MJLtJtZztTY2vufy6kaEnNDikEqAjh
         laZsrhOnHK0csWPox6/74y0LXftI6D5megWnpQB14ccaf4EfKs4rvU/mxvZX65TGidON
         7kINfjXFNaKOdcSB2j5ULg//tChis1vqBP+xn25gc+AY+uCpuCUrqExcmdQuFFjSg6Uc
         Y1Pq9cyD49aVOlSbpig4tah0aceUh4RdTZJVW4bVlU6QrH1SoW96MtLily2qbpFLj+2D
         ixdw==
X-Forwarded-Encrypted: i=1; AFNElJ/TUBsAU6CY63XvR6j7GbXLnjYnpNVCxStmgxpdoU3SNntxp3lOJEjNsm589IpproHI5B7pACqbHYnS5A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzZbKSun9xq6n4kdqQBGmdZR3ob3EZTSxWlzAnyhjX+vikJaDzZ
	faqAaemOW00mKs3aoIXp8mBm2IMYTH9i1pKUovw50BbjzvHs1m8+0rjwz+xDCu72wRmCXik6PiI
	zRelHe16hscbSf66j1qPbJvE9pRSEml36/S58m3DjMJz7615VHWzN+PQaZcH90sjeL7kXoGT+KQ
	==
X-Gm-Gg: Acq92OFnnb3jR9hTXHNcwVXDdLnrjQzk9ecAQe5im5ZKYjsdsKY5zLHKPvEPQl0froF
	7I2b3OsbGXA8kOQzBm9ibtmHjO42LAeqpm9kkBGAYk23zD+i5rlQguagAD5KxdXbSVU3QjZ9FmP
	gRsjvzdbu50HKHoCRo8XohADg4sVvgw4qhOeh9UTKPcCOaLI7uAbMQlMBMgZOvjuoF8hWzAQ8fk
	hrcW6UFxit/EpdpnwbhJ9fMcvn+ILRIxMB+Aqxo4IHzLKL2eCkZGIwpm3eIaayZjFoTB3LXojnr
	RT6na4PAe9kqb0nhuQTnFRaoBZGAZM8q0MYa96OY73EqVLE7+gRlv0DBES5vZ+vn9V8UzzQ3BPv
	dCnMRAziILJGYoQfEZr6Iw2YCnX90dr0gXbCdx/O6snpxOc0meV6vW6It0qCjarniviAo//C2rl
	n6qb6B0kUquRZMSr4wC1JHQS0Ffx0OWg9e2ts=
X-Received: by 2002:ac8:5a0e:0:b0:50f:c26d:f31f with SMTP id d75a77b69052e-51461c1c46bmr427240821cf.19.1778607641685;
        Tue, 12 May 2026 10:40:41 -0700 (PDT)
X-Received: by 2002:ac8:5a0e:0:b0:50f:c26d:f31f with SMTP id d75a77b69052e-51461c1c46bmr427239771cf.19.1778607640868;
        Tue, 12 May 2026 10:40:40 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a955e3dasm3455134e87.42.2026.05.12.10.40.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 10:40:39 -0700 (PDT)
Date: Tue, 12 May 2026 20:40:37 +0300
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
        quic_renjiang@quicinc.com,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [PATCH v6 3/6] media: qcom: iris: Add scale support for encoder
Message-ID: <vaqtadd7awrib45zmw264dszom4h53aeca7m7owieppvz73uoy@p545mqnyq4jb>
References: <20251114-iris_encoder_enhancements-v6-0-d6d35a92635d@oss.qualcomm.com>
 <20251114-iris_encoder_enhancements-v6-3-d6d35a92635d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251114-iris_encoder_enhancements-v6-3-d6d35a92635d@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDE4NCBTYWx0ZWRfX5tVfEAR7p8s0
 PVun8xIP4Sgnje3T+WOMINVDcUTJKlj9lAqAC7n3lZynWIomqa6SsFQdpT0ikO7j1d/oDqCSOUR
 pD/CRXaxpGShIOU17x24pn1nVqb0a8GFFppaB+QsDvm6PWgnBbucCoXQx4Ms3AkRVe96O8oKUgr
 //BUKUe2gyDKxO7eg1iIm+SfrjJ7IeGJ14y4b4z2WGnkfoUcgPfeHj/mxqYXHplKqYK8emsy1AB
 J3ekamfBHY8+C3g0atfeOq6ZAd8SNOetHHwTBWZawtafhJEPolLuxXs5dtqEJmNOGDrMIUtTO4+
 DvSun7aOBs80jUcWWv759z0siqrDf/nRYbjOaaky9DEn+6Fs0NIc6oDG6Tdcu5aQAI7DAL4mxTF
 TIFdRyov9tiBggzgiaFiuJD88dJLbrA1APdH/1A+9y6WVPTJhs/sBTCrXkzrJM/s+SYxOaJCIDM
 Yv/n3n8F7uNY4kVeEng==
X-Authority-Analysis: v=2.4 cv=GZ8nWwXL c=1 sm=1 tr=0 ts=6a03661b cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=kQw6oea2LHIZlx9fzxkA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: hQhgvsjtKkJGSGMt2WKXZkfCIDp3Hobf
X-Proofpoint-ORIG-GUID: hQhgvsjtKkJGSGMt2WKXZkfCIDp3Hobf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 malwarescore=0 phishscore=0
 impostorscore=0 bulkscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605120184
X-Rspamd-Queue-Id: 76E28525F13
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61307-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,linaro.org:email,qualcomm.com:email,qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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

On Fri, Nov 14, 2025 at 11:09:00AM +0800, Wangao Wang wrote:
> Add members enc_scale_width, enc_scale_height to the struct iris_inst to
> support scale requirements.
> 
> Add output width and height settings in iris_venc_s_fmt_output to
> enable scaling functionality.
> 
> Add VPSS buffer to platform data, which the scale function requires.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-HDK
> Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
> ---
>  .../platform/qcom/iris/iris_hfi_gen2_command.c     | 12 +++++------
>  .../platform/qcom/iris/iris_hfi_gen2_response.c    |  2 ++
>  drivers/media/platform/qcom/iris/iris_instance.h   |  4 ++++
>  .../media/platform/qcom/iris/iris_platform_gen2.c  | 12 +++++++++++
>  drivers/media/platform/qcom/iris/iris_venc.c       | 23 +++++++++++++++++++++-
>  drivers/media/platform/qcom/iris/iris_vpu_buffer.c |  9 +++++----
>  6 files changed, 51 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> index 8250e0d6f0a8916f3389be60dba762f3b4f3c690..94c996c6eeceb36d5e63e3ddb0d402d7138f94c4 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> @@ -194,8 +194,8 @@ static int iris_hfi_gen2_set_bitstream_resolution(struct iris_inst *inst, u32 pl
>  		payload_type = HFI_PAYLOAD_U32;
>  	} else {
>  		codec_align = inst->codec == V4L2_PIX_FMT_HEVC ? 32 : 16;
> -		resolution = ALIGN(inst->fmt_dst->fmt.pix_mp.width, codec_align) << 16 |
> -			ALIGN(inst->fmt_dst->fmt.pix_mp.height, codec_align);
> +		resolution = ALIGN(inst->enc_scale_width, codec_align) << 16 |
> +			ALIGN(inst->enc_scale_height, codec_align);
>  		inst_hfi_gen2->dst_subcr_params.bitstream_resolution = resolution;
>  		payload_type = HFI_PAYLOAD_32_PACKED;
>  	}
> @@ -237,10 +237,10 @@ static int iris_hfi_gen2_set_crop_offsets(struct iris_inst *inst, u32 plane)
>  			left_offset = inst->crop.left;
>  			top_offset = inst->crop.top;
>  		} else {
> -			bottom_offset = (ALIGN(inst->fmt_dst->fmt.pix_mp.height, codec_align) -
> -					inst->fmt_dst->fmt.pix_mp.height);
> -			right_offset = (ALIGN(inst->fmt_dst->fmt.pix_mp.width, codec_align) -
> -					inst->fmt_dst->fmt.pix_mp.width);
> +			bottom_offset = (ALIGN(inst->enc_scale_height, codec_align) -
> +					inst->enc_scale_height);
> +			right_offset = (ALIGN(inst->enc_scale_width, codec_align) -
> +				       inst->enc_scale_width);
>  			left_offset = 0;
>  			top_offset = 0;
>  		}
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> index 2f1f118eae4f6462ab1aa1d16844b34e6e699f1e..dc3e606b6ab429a1d15536fa8316afb1e384d674 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> @@ -54,6 +54,8 @@ static u32 iris_hfi_gen2_buf_type_to_driver(struct iris_inst *inst,
>  			return BUF_SCRATCH_2;
>  	case HFI_BUFFER_PERSIST:
>  		return BUF_PERSIST;
> +	case HFI_BUFFER_VPSS:
> +		return BUF_VPSS;
>  	default:
>  		return 0;
>  	}
> diff --git a/drivers/media/platform/qcom/iris/iris_instance.h b/drivers/media/platform/qcom/iris/iris_instance.h
> index a95244cf6d30cd81199b9f1e51bf64c991be1790..0a0d4ace0bb6bee6ab11bd47fddb27432cd524f7 100644
> --- a/drivers/media/platform/qcom/iris/iris_instance.h
> +++ b/drivers/media/platform/qcom/iris/iris_instance.h
> @@ -71,6 +71,8 @@ struct iris_fmt {
>   * @hfi_rc_type: rate control type
>   * @enc_raw_width: source image width for encoder instance
>   * @enc_raw_height: source image height for encoder instance
> + * @enc_scale_width: scale width for encoder instance
> + * @enc_scale_height: scale height for encoder instance
>   */
>  
>  struct iris_inst {
> @@ -111,6 +113,8 @@ struct iris_inst {
>  	u32				hfi_rc_type;
>  	u32				enc_raw_width;
>  	u32				enc_raw_height;
> +	u32				enc_scale_width;
> +	u32				enc_scale_height;
>  };
>  
>  #endif
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> index c1989240c248601c34b84f508f1b72d72f81260a..f1f9ee8a93560c0875a396f6197d4b42e3d2612c 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> @@ -728,6 +728,10 @@ static const u32 sm8550_dec_op_int_buf_tbl[] = {
>  	BUF_DPB,
>  };
>  
> +static const u32 sm8550_enc_ip_int_buf_tbl[] = {
> +	BUF_VPSS,
> +};
> +
>  static const u32 sm8550_enc_op_int_buf_tbl[] = {
>  	BUF_BIN,
>  	BUF_COMV,
> @@ -815,6 +819,8 @@ const struct iris_platform_data sm8550_data = {
>  	.dec_op_int_buf_tbl = sm8550_dec_op_int_buf_tbl,
>  	.dec_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_op_int_buf_tbl),
>  
> +	.enc_ip_int_buf_tbl = sm8550_enc_ip_int_buf_tbl,
> +	.enc_ip_int_buf_tbl_size = ARRAY_SIZE(sm8550_enc_ip_int_buf_tbl),
>  	.enc_op_int_buf_tbl = sm8550_enc_op_int_buf_tbl,
>  	.enc_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_enc_op_int_buf_tbl),
>  };
> @@ -907,6 +913,8 @@ const struct iris_platform_data sm8650_data = {
>  	.dec_op_int_buf_tbl = sm8550_dec_op_int_buf_tbl,
>  	.dec_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_op_int_buf_tbl),
>  
> +	.enc_ip_int_buf_tbl = sm8550_enc_ip_int_buf_tbl,
> +	.enc_ip_int_buf_tbl_size = ARRAY_SIZE(sm8550_enc_ip_int_buf_tbl),
>  	.enc_op_int_buf_tbl = sm8550_enc_op_int_buf_tbl,
>  	.enc_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_enc_op_int_buf_tbl),
>  };
> @@ -988,6 +996,8 @@ const struct iris_platform_data sm8750_data = {
>  	.dec_op_int_buf_tbl = sm8550_dec_op_int_buf_tbl,
>  	.dec_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_op_int_buf_tbl),
>  
> +	.enc_ip_int_buf_tbl = sm8550_enc_ip_int_buf_tbl,
> +	.enc_ip_int_buf_tbl_size = ARRAY_SIZE(sm8550_enc_ip_int_buf_tbl),
>  	.enc_op_int_buf_tbl = sm8550_enc_op_int_buf_tbl,
>  	.enc_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_enc_op_int_buf_tbl),
>  };
> @@ -1075,6 +1085,8 @@ const struct iris_platform_data qcs8300_data = {
>  	.dec_op_int_buf_tbl = sm8550_dec_op_int_buf_tbl,
>  	.dec_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_op_int_buf_tbl),
>  
> +	.enc_ip_int_buf_tbl = sm8550_enc_ip_int_buf_tbl,
> +	.enc_ip_int_buf_tbl_size = ARRAY_SIZE(sm8550_enc_ip_int_buf_tbl),
>  	.enc_op_int_buf_tbl = sm8550_enc_op_int_buf_tbl,
>  	.enc_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_enc_op_int_buf_tbl),
>  };

What about Gen1 platforms?

> diff --git a/drivers/media/platform/qcom/iris/iris_venc.c b/drivers/media/platform/qcom/iris/iris_venc.c
> index 71f4263ada898ce8333086db59e386e91b34ed60..51162690168e6e6db923e635fe17932ad509d782 100644
> --- a/drivers/media/platform/qcom/iris/iris_venc.c
> +++ b/drivers/media/platform/qcom/iris/iris_venc.c
> @@ -70,6 +70,8 @@ int iris_venc_inst_init(struct iris_inst *inst)
>  
>  	inst->enc_raw_width = DEFAULT_WIDTH;
>  	inst->enc_raw_height = DEFAULT_HEIGHT;
> +	inst->enc_scale_width = DEFAULT_WIDTH;
> +	inst->enc_scale_height = DEFAULT_HEIGHT;
>  
>  	memcpy(&inst->fw_caps[0], &core->inst_fw_caps_enc[0],
>  	       INST_FW_CAP_MAX * sizeof(struct platform_inst_fw_cap));
> @@ -226,15 +228,32 @@ int iris_venc_try_fmt(struct iris_inst *inst, struct v4l2_format *f)
>  
>  static int iris_venc_s_fmt_output(struct iris_inst *inst, struct v4l2_format *f)
>  {
> +	const struct iris_fmt *venc_fmt;
>  	struct v4l2_format *fmt;
> +	u32 codec_align;
>  
>  	iris_venc_try_fmt(inst, f);
>  
> -	if (!(find_format(inst, f->fmt.pix_mp.pixelformat, f->type)))
> +	venc_fmt = find_format(inst, f->fmt.pix_mp.pixelformat, f->type);
> +	if (!venc_fmt)
>  		return -EINVAL;
>  
> +	codec_align = venc_fmt->pixfmt == V4L2_PIX_FMT_HEVC ? 32 : 16;
> +
>  	fmt = inst->fmt_dst;
>  	fmt->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
> +	/*
> +	 * If output format size != input format size,
> +	 * it is considered a scaling case,
> +	 * and the scaled size needs to be saved.
> +	 */

Why do we need to save it? Don't we have access to input and output
formats directly in the code which sends the properties?

> +	if (f->fmt.pix_mp.width != inst->fmt_src->fmt.pix_mp.width ||
> +	    f->fmt.pix_mp.height != inst->fmt_src->fmt.pix_mp.height) {
> +		inst->enc_scale_width = f->fmt.pix_mp.width;
> +		inst->enc_scale_height = f->fmt.pix_mp.height;
> +		fmt->fmt.pix_mp.width = ALIGN(f->fmt.pix_mp.width, codec_align);
> +		fmt->fmt.pix_mp.height = ALIGN(f->fmt.pix_mp.height, codec_align);
> +	}
>  	fmt->fmt.pix_mp.num_planes = 1;
>  	fmt->fmt.pix_mp.plane_fmt[0].bytesperline = 0;
>  	fmt->fmt.pix_mp.plane_fmt[0].sizeimage = iris_get_buffer_size(inst, BUF_OUTPUT);
> @@ -292,6 +311,8 @@ static int iris_venc_s_fmt_input(struct iris_inst *inst, struct v4l2_format *f)
>  
>  	inst->enc_raw_width = f->fmt.pix_mp.width;
>  	inst->enc_raw_height = f->fmt.pix_mp.height;
> +	inst->enc_scale_width = f->fmt.pix_mp.width;
> +	inst->enc_scale_height = f->fmt.pix_mp.height;
>  
>  	if (f->fmt.pix_mp.width != inst->crop.width ||
>  	    f->fmt.pix_mp.height != inst->crop.height) {
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
> index 4463be05ce165adef6b152eb0c155d2e6a7b3c36..db5adadd1b39c06bc41ae6f1b3d2f924b3ebf150 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
> @@ -1131,10 +1131,11 @@ static u32 iris_vpu_enc_arp_size(struct iris_inst *inst)
>  
>  inline bool is_scaling_enabled(struct iris_inst *inst)
>  {
> -	return inst->crop.left != inst->compose.left ||
> -		inst->crop.top != inst->compose.top ||
> -		inst->crop.width != inst->compose.width ||
> -		inst->crop.height != inst->compose.height;
> +	struct v4l2_pix_format_mplane *dst_fmt = &inst->fmt_dst->fmt.pix_mp;
> +	struct v4l2_pix_format_mplane *src_fmt = &inst->fmt_src->fmt.pix_mp;
> +
> +	return dst_fmt->width != src_fmt->width ||
> +		dst_fmt->height != src_fmt->height;
>  }
>  
>  static inline
> 
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry

