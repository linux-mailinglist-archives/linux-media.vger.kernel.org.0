Return-Path: <linux-media+bounces-44366-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C65BABD8168
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 10:06:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 62A503A7D7E
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 08:05:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FC8B30F814;
	Tue, 14 Oct 2025 08:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CiBI+aHy"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 210D330F80E
	for <linux-media@vger.kernel.org>; Tue, 14 Oct 2025 08:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760429111; cv=none; b=bsat6FpXxCoaoup6LUMsNyqfos/yWDXi0m30CEuVWVjKoto15ZuHUTis8ZIlbaw4CjUmj9+RHV0Ab+hpZY7VQ/x8apt7uTvQCawRQweuPO0Tca0vIPFHHs+llgLU+o5st4XlMTTHYoahibRBgZOdeVvrj+Rmbe+1H3hOyMnbZD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760429111; c=relaxed/simple;
	bh=Z6zL6YJ6cUwQrgpzFvBGjojtXBxPeqta+E94dltfWIA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IHEQ9dWSGdNxdCN7Fos5wdP8vkKyko/mxVNyI4mOZv7MBi6yNe6We3kyuf7iRg4yfMye037GSQHm/Bmb3gjVWB946ga8x/E6zGWFtEuyLwVSEpwvHN9AVwg0tWu5x2nOVlaOqpNLPp+Mdo1fxNM7gKgIzLK/T/jf7d4b/ImYIn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CiBI+aHy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59E6Cghd018954
	for <linux-media@vger.kernel.org>; Tue, 14 Oct 2025 08:05:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TohgtehwDVHty+ULvWSXoitH8DcYULF1gTlXe69tEp4=; b=CiBI+aHyM5xJhEB4
	JnGjzk8aSkP/6HkXmi1IJ4UNvhxAeFjKPtpp+vxUekLgKDl+qGL7o3/c1RPRE6zz
	WvIc4yF2D52GBnP4sK7EUt8pJudeQX1/bUXIOexU88EZOCm1iZo6Rs53hGIb+eRl
	goWusF4LmPB6KHPFZ/J4fw2iUTW0Se5SE0v2Bp+ucYCTscOZkQaZmv5z+bqD+YWe
	+MEPyVC7QVw60csmYF+0OZWiZE1g6pR/fJuJMwJ4Eh/JJ5hdhRG1P96Fo5GX3xu0
	ByC/xBWDjqDmviFMKkDVb9ciRyV1wxN+0ZhOkCoxSQp41nC4g7bW9pe/9KaoTjlB
	qyLz4Q==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qferynr7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 14 Oct 2025 08:05:07 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-27eca7298d9so232923435ad.0
        for <linux-media@vger.kernel.org>; Tue, 14 Oct 2025 01:05:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760429106; x=1761033906;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TohgtehwDVHty+ULvWSXoitH8DcYULF1gTlXe69tEp4=;
        b=kPvZfOt5F9ZJoUJhvqt1inQnM5EMAehUwjSLWzfYLQqCZsjWF54l1YGjwt5Kr+H25b
         jpPEiOwl2fm4fwSJPzzRAMQEftue+rdR+FlGT3RYtDZZffY5hOSuQU+xM63gIJan1obx
         nAPuzASIk5eKDTaKTGXUcuzgh9ts8dBGJlewA939GmimY6IyCBiyiKT5wMOB6giUJbiw
         j0mlPFGBkuuj2861ezyAdawzEsA8h+/Z9Eeho1tcNtPLWH80owiwnePBnmZrph0re0Zj
         1naGfJS7o1T29WSxa7H1mK2E+vgQqryfxkgZHvxuA/u9s78KwhqUebWnb8Yl24gCQkCG
         Nzcg==
X-Gm-Message-State: AOJu0Yz1+/asWHdlZYtWkjHk6DU82vuItLQDSx1PDZpsyF6glD+Lp7Ax
	3OkKA8r28PaC0RDNvchT8VaNxcEqz0vurWTkARM//HiPJh7YS4guTH9hH/uDUIbfORjzkG+cyrJ
	AqkzFcIDlPxWPINSBk5ogNv64HfqWoVlQO4ximo4hYmuX/JPlDNaiA2vv5YsjmfzIVg==
X-Gm-Gg: ASbGncvwIdL3N/Wpx0CDZ0mhlVxE6RShsywqNT4n1ne67V887mFTRX0YLEWwyl0YXTt
	Usxm52lgTRkF4V80Kr9SM7Vipr3oXt8T04xf7/75+9B+JlKF7VnDD0LlHoOcVbiVQLu4s9azd3E
	fMXxPGuuH6m+qdOtPoAaykKLiI2hvnptSqUyzVWEIgBt1WshtMBBmNZ/23H/MvQ+shqxYUNskoH
	OYafsSOv4CjMZPEHFnhXw96D/0Nqp+UK+rjEwxlWwnmqVpn6AU9VQ3Z3syneo0qJoBOdjO0miI4
	8rcnTEY6hwk27Ebswnu6Up24GQUZ5R+IYVjvb3qXegj+sxl++9mXJ3/T8DgayB0SjdaHbBv/
X-Received: by 2002:a17:903:298c:b0:265:982a:d450 with SMTP id d9443c01a7336-290273ffbf1mr319471065ad.40.1760429105747;
        Tue, 14 Oct 2025 01:05:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEA2ajQYyHouSrivPNGIJsHLd6bwbUKsLk8cUAVy5DcqXYK/a4jrkdpzGizUr6belJdKucTkg==
X-Received: by 2002:a17:903:298c:b0:265:982a:d450 with SMTP id d9443c01a7336-290273ffbf1mr319470415ad.40.1760429104837;
        Tue, 14 Oct 2025 01:05:04 -0700 (PDT)
Received: from [10.206.101.41] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034f35382sm156603235ad.85.2025.10.14.01.05.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Oct 2025 01:05:04 -0700 (PDT)
Message-ID: <b97c5e01-f1d2-c3c9-8b9a-b5bb9a0c556e@oss.qualcomm.com>
Date: Tue, 14 Oct 2025 13:34:59 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v3 3/8] media: iris: stop copying r/o data
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251013-iris-sc7280-v3-0-f3bceb77a250@oss.qualcomm.com>
 <20251013-iris-sc7280-v3-3-f3bceb77a250@oss.qualcomm.com>
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20251013-iris-sc7280-v3-3-f3bceb77a250@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=R64O2NRX c=1 sm=1 tr=0 ts=68ee0433 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=5vdO8cqwvGNAp3eIJKMA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: MbeTtblx_gHh80DKBlWBpRIW0iqaC0ed
X-Proofpoint-ORIG-GUID: MbeTtblx_gHh80DKBlWBpRIW0iqaC0ed
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX+zY52Hz2udsM
 DAsEDR8Zng6XU5Z+u8r8tZ+zoH7sW/mWLMO9rPhRwVH5loHYEm/PSckRWt3RrnpoEspn63Nc1AE
 DBCNQyMqByl7/AsM0qc0qhVZBnvsOwCZu2QpFopeRPSQdWwCMleojbCUM4xX3DYqeRcu4rMb8zL
 L8JB76V1u5AnuhRRBtNSNQrMze1JJdes3niFrzDDY7INfM7BnLtt/eh4n2BbVDDn2J6hoOHG5AG
 7n5elMN0t6nxPV1hEsAObn68Y9sYkqd+2Hv8mwvVGhWcu+BckZ3fSW/vDR2RtEueW2ulSpdip3y
 aqH1euqdREQwOoRVlT+omK4znEqJTyMAuzLn+bEekaQUSq8JGOqIQjXj61YMcYCgOYdJ3w2UF2Z
 KP8U/hvP1F3yDK/6UHQY5LONTugZEQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110018


On 10/13/2025 7:38 AM, Dmitry Baryshkov wrote:
> Most of the platform_inst_caps data is read-only. In order to lower the
> amount of memory consumed by the driver, store the value and the
> corresponding index in the read-write data and use the rest via the
> pointer to r/o capability data.
> 
> Keep all read-only flags inside platform_inst_fw_cap.flags and transform
> CAP_FLAG_CLIENT_SET (which is being set per-instance once the client
> changes any of the controls) into the boolean field inside struct
> platform_inst_fw_cap_value.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_core.h       |   4 +-
>  drivers/media/platform/qcom/iris/iris_ctrls.c      | 238 ++++++++++-----------
>  drivers/media/platform/qcom/iris/iris_instance.h   |   3 +-
>  .../platform/qcom/iris/iris_platform_common.h      |   8 +-
>  drivers/media/platform/qcom/iris/iris_vdec.c       |   5 +-
>  drivers/media/platform/qcom/iris/iris_venc.c       |   5 +-
>  6 files changed, 135 insertions(+), 128 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_core.h b/drivers/media/platform/qcom/iris/iris_core.h
> index fb194c967ad4f9b5e00cd74f0d41e0b827ef14db..b5037ae8c71921753c165a86a277a4a4b5083b30 100644
> --- a/drivers/media/platform/qcom/iris/iris_core.h
> +++ b/drivers/media/platform/qcom/iris/iris_core.h
> @@ -115,8 +115,8 @@ struct iris_core {
>  	struct delayed_work			sys_error_handler;
>  	struct list_head			instances;
>  	/* encoder and decoder have overlapping caps, so two different arrays are required */
> -	struct platform_inst_fw_cap		inst_fw_caps_dec[INST_FW_CAP_MAX];
> -	struct platform_inst_fw_cap		inst_fw_caps_enc[INST_FW_CAP_MAX];
> +	struct platform_inst_fw_cap_value	inst_fw_caps_dec[INST_FW_CAP_MAX];
> +	struct platform_inst_fw_cap_value	inst_fw_caps_enc[INST_FW_CAP_MAX];

pls add documentation update

>  };
>  
>  int iris_core_init(struct iris_core *core);
> diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
> index 9da050aa1f7ce8152dfa46a706e2c27adfb5d6ce..0e9adb3982a49cfd7cbe5110cfd5f573f0f7bb38 100644
> --- a/drivers/media/platform/qcom/iris/iris_ctrls.c
> +++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
> @@ -194,26 +194,28 @@ static int iris_op_s_ctrl(struct v4l2_ctrl *ctrl)
>  {
>  	struct iris_inst *inst = container_of(ctrl->handler, struct iris_inst, ctrl_handler);
>  	enum platform_inst_fw_cap_type cap_id;
> -	struct platform_inst_fw_cap *cap;
> +	unsigned int cap_idx;
>  	struct vb2_queue *q;
>  
> -	cap = &inst->fw_caps[0];
>  	cap_id = iris_get_cap_id(ctrl->id);
>  	if (!iris_valid_cap_id(cap_id))
>  		return -EINVAL;
>  
> +	cap_idx = inst->fw_caps[cap_id].idx;
> +
>  	q = v4l2_m2m_get_src_vq(inst->m2m_ctx);
>  	if (vb2_is_streaming(q) &&
> -	    (!(inst->fw_caps[cap_id].flags & CAP_FLAG_DYNAMIC_ALLOWED)))
> +	    (!(inst->inst_fw_caps[cap_id].flags & CAP_FLAG_DYNAMIC_ALLOWED)))
>  		return -EINVAL;
>  
> -	cap[cap_id].flags |= CAP_FLAG_CLIENT_SET;
> +	inst->fw_caps[cap_id].client_set = true;
>  
>  	inst->fw_caps[cap_id].value = ctrl->val;
>  
>  	if (vb2_is_streaming(q)) {
> -		if (cap[cap_id].set)
> -			cap[cap_id].set(inst, cap_id);
> +
> +		if (inst->inst_fw_caps[cap_idx].set)
> +			inst->inst_fw_caps[cap_idx].set(inst, cap_id);
>  	}
>  
>  	return 0;
> @@ -225,13 +227,14 @@ static const struct v4l2_ctrl_ops iris_ctrl_ops = {
>  
>  int iris_ctrls_init(struct iris_inst *inst)
>  {
> -	struct platform_inst_fw_cap *cap = &inst->fw_caps[0];
>  	u32 num_ctrls = 0, ctrl_idx = 0, idx = 0;
>  	u32 v4l2_id;
>  	int ret;
>  
>  	for (idx = 1; idx < INST_FW_CAP_MAX; idx++) {
> -		if (iris_get_v4l2_id(cap[idx].cap_id))
> +		unsigned int cap_idx = inst->fw_caps[idx].idx;

Read below comment first. Applying that comment here,

cap_idx = inst->fw_caps[3].idx = 0;

> +
> +		if (iris_get_v4l2_id(inst->inst_fw_caps[cap_idx].cap_id))

Here, inst->inst_fw_caps[0].cap_id would be first cap in platform caps, which is
incorrect.

>  			num_ctrls++;

If you print this, it comes to very high number than the controls which is
actually need to be initialized.

>  	}
>  
> @@ -245,9 +248,11 @@ int iris_ctrls_init(struct iris_inst *inst)
>  		return ret;
>  
>  	for (idx = 1; idx < INST_FW_CAP_MAX; idx++) {
> +		unsigned int cap_idx = inst->fw_caps[idx].idx;
> +		const struct platform_inst_fw_cap *cap = &inst->inst_fw_caps[cap_idx];
>  		struct v4l2_ctrl *ctrl;
>  
> -		v4l2_id = iris_get_v4l2_id(cap[idx].cap_id);
> +		v4l2_id = iris_get_v4l2_id(cap->cap_id);
>  		if (!v4l2_id)
>  			continue;
>  
> @@ -256,21 +261,21 @@ int iris_ctrls_init(struct iris_inst *inst)
>  			goto error;
>  		}
>  
> -		if (cap[idx].flags & CAP_FLAG_MENU) {
> +		if (inst->inst_fw_caps[cap_idx].flags & CAP_FLAG_MENU) {
>  			ctrl = v4l2_ctrl_new_std_menu(&inst->ctrl_handler,
>  						      &iris_ctrl_ops,
>  						      v4l2_id,
> -						      cap[idx].max,
> -						      ~(cap[idx].step_or_mask),
> -						      cap[idx].value);
> +						      cap[cap_idx].max,
> +						      ~(cap[cap_idx].step_or_mask),
> +						      inst->fw_caps[idx].value);
>  		} else {
>  			ctrl = v4l2_ctrl_new_std(&inst->ctrl_handler,
>  						 &iris_ctrl_ops,
>  						 v4l2_id,
> -						 cap[idx].min,
> -						 cap[idx].max,
> -						 cap[idx].step_or_mask,
> -						 cap[idx].value);
> +						 cap[cap_idx].min,
> +						 cap[cap_idx].max,
> +						 cap[cap_idx].step_or_mask,
> +						 inst->fw_caps[idx].value);
>  		}
>  		if (!ctrl) {
>  			ret = -EINVAL;
> @@ -312,14 +317,8 @@ void iris_session_init_caps(struct iris_core *core)
>  		if (!iris_valid_cap_id(cap_id))
>  			continue;
>  
> -		core->inst_fw_caps_dec[cap_id].cap_id = caps[i].cap_id;
> -		core->inst_fw_caps_dec[cap_id].min = caps[i].min;
> -		core->inst_fw_caps_dec[cap_id].max = caps[i].max;
> -		core->inst_fw_caps_dec[cap_id].step_or_mask = caps[i].step_or_mask;
> +		core->inst_fw_caps_dec[cap_id].idx = i;

Consider a case when one of the cap is not present for a target, then idx and
cap_id would not match, and any further usage to map each other would go wrong.
Please keep idx and cap_id in sync so that driver can use it as key to pull out
from inst_fw_caps.

>  		core->inst_fw_caps_dec[cap_id].value = caps[i].value;
> -		core->inst_fw_caps_dec[cap_id].flags = caps[i].flags;
> -		core->inst_fw_caps_dec[cap_id].hfi_id = caps[i].hfi_id;
> -		core->inst_fw_caps_dec[cap_id].set = caps[i].set;
>  	}
>  
>  	caps = core->iris_platform_data->inst_fw_caps_enc;
> @@ -330,29 +329,23 @@ void iris_session_init_caps(struct iris_core *core)
>  		if (!iris_valid_cap_id(cap_id))
>  			continue;
>  
> -		core->inst_fw_caps_enc[cap_id].cap_id = caps[i].cap_id;
> -		core->inst_fw_caps_enc[cap_id].min = caps[i].min;
> -		core->inst_fw_caps_enc[cap_id].max = caps[i].max;
> -		core->inst_fw_caps_enc[cap_id].step_or_mask = caps[i].step_or_mask;
> +		core->inst_fw_caps_enc[cap_id].idx = i;

The above comment is directly seen on encoder, where the cap_id in platform data
is not available in serial order for the given SOC.

For SM8250, the cap_id 3 is not present in the platform data, so when idx 3 is
used as cap_idx to pick the cap from inst_fw_caps, it returns 0 as the cap_id,
which is incorrect as it points to first cap in inst_fw_caps. This happens for
all cases when idx is used for cap_id which is not defined for that SOC.

[ 1234.157453] iris_session_init_caps: cap_id: 9 idx: 0
[ 1234.167761] iris_session_init_caps: cap_id: 1 idx: 1
[ 1234.178240] iris_session_init_caps: cap_id: 2 idx: 2

===> cap_id: 3 would have idx:0

[ 1234.188498] iris_session_init_caps: cap_id: 4 idx: 3
[ 1234.198734] iris_session_init_caps: cap_id: 5 idx: 4
[ 1234.208954] iris_session_init_caps: cap_id: 16 idx: 5
[ 1234.219354] iris_session_init_caps: cap_id: 18 idx: 6
[ 1234.229735] iris_session_init_caps: cap_id: 20 idx: 7

>  		core->inst_fw_caps_enc[cap_id].value = caps[i].value;
> -		core->inst_fw_caps_enc[cap_id].flags = caps[i].flags;
> -		core->inst_fw_caps_enc[cap_id].hfi_id = caps[i].hfi_id;
> -		core->inst_fw_caps_enc[cap_id].set = caps[i].set;
>  	}
>  }
>  
>  static u32 iris_get_port_info(struct iris_inst *inst,
> -			      enum platform_inst_fw_cap_type cap_id)
> +			      unsigned int cap_idx)
>  {
>  	if (inst->domain == DECODER) {
> -		if (inst->fw_caps[cap_id].flags & CAP_FLAG_INPUT_PORT)
> +		if (inst->inst_fw_caps[cap_idx].flags & CAP_FLAG_INPUT_PORT)
>  			return HFI_PORT_BITSTREAM;
> -		else if (inst->fw_caps[cap_id].flags & CAP_FLAG_OUTPUT_PORT)
> +		else if (inst->inst_fw_caps[cap_idx].flags & CAP_FLAG_OUTPUT_PORT)
>  			return HFI_PORT_RAW;
>  	} else {
> -		if (inst->fw_caps[cap_id].flags & CAP_FLAG_INPUT_PORT)
> +		if (inst->inst_fw_caps[cap_idx].flags & CAP_FLAG_INPUT_PORT)
>  			return HFI_PORT_RAW;
> -		else if (inst->fw_caps[cap_id].flags & CAP_FLAG_OUTPUT_PORT)
> +		else if (inst->inst_fw_caps[cap_idx].flags & CAP_FLAG_OUTPUT_PORT)
>  			return HFI_PORT_BITSTREAM;
>  	}
>  
> @@ -362,12 +355,13 @@ static u32 iris_get_port_info(struct iris_inst *inst,
>  int iris_set_u32_enum(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
>  {
>  	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
> +	unsigned int cap_idx = inst->fw_caps[cap_id].idx;
>  	u32 hfi_value = inst->fw_caps[cap_id].value;
> -	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
> +	u32 hfi_id = inst->inst_fw_caps[cap_idx].hfi_id;
>  
>  	return hfi_ops->session_set_property(inst, hfi_id,
>  					     HFI_HOST_FLAGS_NONE,
> -					     iris_get_port_info(inst, cap_id),
> +					     iris_get_port_info(inst, cap_idx),
>  					     HFI_PAYLOAD_U32_ENUM,
>  					     &hfi_value, sizeof(u32));
>  }
> @@ -375,12 +369,13 @@ int iris_set_u32_enum(struct iris_inst *inst, enum platform_inst_fw_cap_type cap
>  int iris_set_u32(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
>  {
>  	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
> +	unsigned int cap_idx = inst->fw_caps[cap_id].idx;
>  	u32 hfi_value = inst->fw_caps[cap_id].value;
> -	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
> +	u32 hfi_id = inst->inst_fw_caps[cap_idx].hfi_id;
>  
>  	return hfi_ops->session_set_property(inst, hfi_id,
>  					     HFI_HOST_FLAGS_NONE,
> -					     iris_get_port_info(inst, cap_id),
> +					     iris_get_port_info(inst, cap_idx),
>  					     HFI_PAYLOAD_U32,
>  					     &hfi_value, sizeof(u32));
>  }
> @@ -389,7 +384,8 @@ int iris_set_stage(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id
>  {
>  	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
>  	struct v4l2_format *inp_f = inst->fmt_src;
> -	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
> +	unsigned int cap_idx = inst->fw_caps[cap_id].idx;
> +	u32 hfi_id = inst->inst_fw_caps[cap_idx].hfi_id;
>  	u32 height = inp_f->fmt.pix_mp.height;
>  	u32 width = inp_f->fmt.pix_mp.width;
>  	u32 work_mode = STAGE_2;
> @@ -401,7 +397,7 @@ int iris_set_stage(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id
>  
>  	return hfi_ops->session_set_property(inst, hfi_id,
>  					     HFI_HOST_FLAGS_NONE,
> -					     iris_get_port_info(inst, cap_id),
> +					     iris_get_port_info(inst, cap_idx),
>  					     HFI_PAYLOAD_U32,
>  					     &work_mode, sizeof(u32));
>  }
> @@ -409,12 +405,13 @@ int iris_set_stage(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id
>  int iris_set_pipe(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
>  {
>  	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
> +	unsigned int cap_idx = inst->fw_caps[cap_id].idx;
> +	u32 hfi_id = inst->inst_fw_caps[cap_idx].hfi_id;
>  	u32 work_route = inst->fw_caps[PIPE].value;
> -	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
>  
>  	return hfi_ops->session_set_property(inst, hfi_id,
>  					     HFI_HOST_FLAGS_NONE,
> -					     iris_get_port_info(inst, cap_id),
> +					     iris_get_port_info(inst, cap_idx),
>  					     HFI_PAYLOAD_U32,
>  					     &work_route, sizeof(u32));
>  }
> @@ -422,19 +419,13 @@ int iris_set_pipe(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
>  int iris_set_profile(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
>  {
>  	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
> -	u32 hfi_id, hfi_value;
> -
> -	if (inst->codec == V4L2_PIX_FMT_H264) {
> -		hfi_id = inst->fw_caps[PROFILE_H264].hfi_id;
> -		hfi_value = inst->fw_caps[PROFILE_H264].value;
> -	} else {
> -		hfi_id = inst->fw_caps[PROFILE_HEVC].hfi_id;
> -		hfi_value = inst->fw_caps[PROFILE_HEVC].value;
> -	}
> +	unsigned int cap_idx = inst->fw_caps[cap_id].idx;
> +	u32 hfi_id = inst->inst_fw_caps[cap_idx].hfi_id;
> +	u32 hfi_value = inst->fw_caps[cap_id].value;
>  
>  	return hfi_ops->session_set_property(inst, hfi_id,
>  					     HFI_HOST_FLAGS_NONE,
> -					     iris_get_port_info(inst, cap_id),
> +					     iris_get_port_info(inst, cap_idx),
>  					     HFI_PAYLOAD_U32_ENUM,
>  					     &hfi_value, sizeof(u32));
>  }
> @@ -442,19 +433,13 @@ int iris_set_profile(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_
>  int iris_set_level(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
>  {
>  	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
> -	u32 hfi_id, hfi_value;
> -
> -	if (inst->codec == V4L2_PIX_FMT_H264) {
> -		hfi_id = inst->fw_caps[LEVEL_H264].hfi_id;
> -		hfi_value = inst->fw_caps[LEVEL_H264].value;
> -	} else {
> -		hfi_id = inst->fw_caps[LEVEL_HEVC].hfi_id;
> -		hfi_value = inst->fw_caps[LEVEL_HEVC].value;
> -	}
> +	unsigned int cap_idx = inst->fw_caps[cap_id].idx;
> +	u32 hfi_id = inst->inst_fw_caps[cap_idx].hfi_id;
> +	u32 hfi_value = inst->fw_caps[cap_id].value;
>  
>  	return hfi_ops->session_set_property(inst, hfi_id,
>  					     HFI_HOST_FLAGS_NONE,
> -					     iris_get_port_info(inst, cap_id),
> +					     iris_get_port_info(inst, cap_idx),
>  					     HFI_PAYLOAD_U32_ENUM,
>  					     &hfi_value, sizeof(u32));
>  }
> @@ -462,20 +447,19 @@ int iris_set_level(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id
>  int iris_set_profile_level_gen1(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
>  {
>  	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
> -	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
> +	unsigned int cap_idx = inst->fw_caps[cap_id].idx;
> +	u32 hfi_id = inst->inst_fw_caps[cap_idx].hfi_id;
>  	struct hfi_profile_level pl;
>  
> -	if (inst->codec == V4L2_PIX_FMT_H264) {
> -		pl.profile = inst->fw_caps[PROFILE_H264].value;
> +	pl.profile = inst->fw_caps[cap_id].value;
> +	if (inst->codec == V4L2_PIX_FMT_H264)
>  		pl.level = inst->fw_caps[LEVEL_H264].value;
> -	} else {
> -		pl.profile = inst->fw_caps[PROFILE_HEVC].value;
> +	else
>  		pl.level = inst->fw_caps[LEVEL_HEVC].value;
> -	}
>  
>  	return hfi_ops->session_set_property(inst, hfi_id,
>  					     HFI_HOST_FLAGS_NONE,
> -					     iris_get_port_info(inst, cap_id),
> +					     iris_get_port_info(inst, cap_idx),
>  					     HFI_PAYLOAD_U32_ENUM,
>  					     &pl, sizeof(u32));
>  }
> @@ -484,7 +468,8 @@ int iris_set_header_mode_gen1(struct iris_inst *inst, enum platform_inst_fw_cap_
>  {
>  	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
>  	u32 header_mode = inst->fw_caps[cap_id].value;
> -	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
> +	unsigned int cap_idx = inst->fw_caps[cap_id].idx;
> +	u32 hfi_id = inst->inst_fw_caps[cap_idx].hfi_id;
>  	u32 hfi_val;
>  
>  	if (header_mode == V4L2_MPEG_VIDEO_HEADER_MODE_SEPARATE)
> @@ -494,7 +479,7 @@ int iris_set_header_mode_gen1(struct iris_inst *inst, enum platform_inst_fw_cap_
>  
>  	return hfi_ops->session_set_property(inst, hfi_id,
>  					 HFI_HOST_FLAGS_NONE,
> -				     iris_get_port_info(inst, cap_id),
> +				     iris_get_port_info(inst, cap_idx),
>  				     HFI_PAYLOAD_U32,
>  				     &hfi_val, sizeof(u32));
>  }
> @@ -504,7 +489,8 @@ int iris_set_header_mode_gen2(struct iris_inst *inst, enum platform_inst_fw_cap_
>  	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
>  	u32 prepend_sps_pps = inst->fw_caps[PREPEND_SPSPPS_TO_IDR].value;
>  	u32 header_mode = inst->fw_caps[cap_id].value;
> -	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
> +	unsigned int cap_idx = inst->fw_caps[cap_id].idx;
> +	u32 hfi_id = inst->inst_fw_caps[cap_idx].hfi_id;
>  	u32 hfi_val;
>  
>  	if (prepend_sps_pps)
> @@ -516,7 +502,7 @@ int iris_set_header_mode_gen2(struct iris_inst *inst, enum platform_inst_fw_cap_
>  
>  	return hfi_ops->session_set_property(inst, hfi_id,
>  					 HFI_HOST_FLAGS_NONE,
> -				     iris_get_port_info(inst, cap_id),
> +				     iris_get_port_info(inst, cap_idx),
>  				     HFI_PAYLOAD_U32_ENUM,
>  				     &hfi_val, sizeof(u32));
>  }
> @@ -526,7 +512,8 @@ int iris_set_bitrate(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_
>  	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
>  	u32 entropy_mode = inst->fw_caps[ENTROPY_MODE].value;
>  	u32 bitrate = inst->fw_caps[cap_id].value;
> -	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
> +	unsigned int cap_idx = inst->fw_caps[cap_id].idx;
> +	u32 hfi_id = inst->inst_fw_caps[cap_idx].hfi_id;
>  	u32 max_bitrate;
>  
>  	if (inst->codec == V4L2_PIX_FMT_HEVC)
> @@ -541,7 +528,7 @@ int iris_set_bitrate(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_
>  
>  	return hfi_ops->session_set_property(inst, hfi_id,
>  					 HFI_HOST_FLAGS_NONE,
> -				     iris_get_port_info(inst, cap_id),
> +				     iris_get_port_info(inst, cap_idx),
>  				     HFI_PAYLOAD_U32,
>  				     &bitrate, sizeof(u32));
>  }
> @@ -552,12 +539,13 @@ int iris_set_peak_bitrate(struct iris_inst *inst, enum platform_inst_fw_cap_type
>  	u32 rc_mode = inst->fw_caps[BITRATE_MODE].value;
>  	u32 peak_bitrate = inst->fw_caps[cap_id].value;
>  	u32 bitrate = inst->fw_caps[BITRATE].value;
> -	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
> +	unsigned int cap_idx = inst->fw_caps[cap_id].idx;
> +	u32 hfi_id = inst->inst_fw_caps[cap_idx].hfi_id;
>  
>  	if (rc_mode != V4L2_MPEG_VIDEO_BITRATE_MODE_CBR)
>  		return 0;
>  
> -	if (inst->fw_caps[cap_id].flags & CAP_FLAG_CLIENT_SET) {
> +	if (inst->fw_caps[cap_id].client_set) {
>  		if (peak_bitrate < bitrate)
>  			peak_bitrate = bitrate;
>  	} else {
> @@ -568,7 +556,7 @@ int iris_set_peak_bitrate(struct iris_inst *inst, enum platform_inst_fw_cap_type
>  
>  	return hfi_ops->session_set_property(inst, hfi_id,
>  					 HFI_HOST_FLAGS_NONE,
> -				     iris_get_port_info(inst, cap_id),
> +				     iris_get_port_info(inst, cap_idx),
>  				     HFI_PAYLOAD_U32,
>  				     &peak_bitrate, sizeof(u32));
>  }
> @@ -579,7 +567,8 @@ int iris_set_bitrate_mode_gen1(struct iris_inst *inst, enum platform_inst_fw_cap
>  	u32 bitrate_mode = inst->fw_caps[BITRATE_MODE].value;
>  	u32 frame_rc = inst->fw_caps[FRAME_RC_ENABLE].value;
>  	u32 frame_skip = inst->fw_caps[FRAME_SKIP_MODE].value;
> -	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
> +	unsigned int cap_idx = inst->fw_caps[cap_id].idx;
> +	u32 hfi_id = inst->inst_fw_caps[cap_idx].hfi_id;
>  	u32 rc_mode = 0;
>  
>  	if (!frame_rc)
> @@ -595,7 +584,7 @@ int iris_set_bitrate_mode_gen1(struct iris_inst *inst, enum platform_inst_fw_cap
>  
>  	return hfi_ops->session_set_property(inst, hfi_id,
>  					 HFI_HOST_FLAGS_NONE,
> -				     iris_get_port_info(inst, cap_id),
> +				     iris_get_port_info(inst, cap_idx),
>  				     HFI_PAYLOAD_U32_ENUM,
>  				     &rc_mode, sizeof(u32));
>  }
> @@ -606,7 +595,8 @@ int iris_set_bitrate_mode_gen2(struct iris_inst *inst, enum platform_inst_fw_cap
>  	u32 bitrate_mode = inst->fw_caps[BITRATE_MODE].value;
>  	u32 frame_rc = inst->fw_caps[FRAME_RC_ENABLE].value;
>  	u32 frame_skip = inst->fw_caps[FRAME_SKIP_MODE].value;
> -	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
> +	unsigned int cap_idx = inst->fw_caps[cap_id].idx;
> +	u32 hfi_id = inst->inst_fw_caps[cap_idx].hfi_id;
>  	u32 rc_mode = 0;
>  
>  	if (!frame_rc)
> @@ -622,7 +612,7 @@ int iris_set_bitrate_mode_gen2(struct iris_inst *inst, enum platform_inst_fw_cap
>  
>  	return hfi_ops->session_set_property(inst, hfi_id,
>  					 HFI_HOST_FLAGS_NONE,
> -				     iris_get_port_info(inst, cap_id),
> +				     iris_get_port_info(inst, cap_idx),
>  				     HFI_PAYLOAD_U32_ENUM,
>  				     &rc_mode, sizeof(u32));
>  }
> @@ -631,7 +621,8 @@ int iris_set_entropy_mode_gen1(struct iris_inst *inst, enum platform_inst_fw_cap
>  {
>  	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
>  	u32 entropy_mode = inst->fw_caps[cap_id].value;
> -	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
> +	unsigned int cap_idx = inst->fw_caps[cap_id].idx;
> +	u32 hfi_id = inst->inst_fw_caps[cap_idx].hfi_id;
>  	u32 hfi_val;
>  
>  	if (inst->codec != V4L2_PIX_FMT_H264)
> @@ -642,7 +633,7 @@ int iris_set_entropy_mode_gen1(struct iris_inst *inst, enum platform_inst_fw_cap
>  
>  	return hfi_ops->session_set_property(inst, hfi_id,
>  					 HFI_HOST_FLAGS_NONE,
> -				     iris_get_port_info(inst, cap_id),
> +				     iris_get_port_info(inst, cap_idx),
>  				     HFI_PAYLOAD_U32,
>  				     &hfi_val, sizeof(u32));
>  }
> @@ -651,7 +642,8 @@ int iris_set_entropy_mode_gen2(struct iris_inst *inst, enum platform_inst_fw_cap
>  {
>  	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
>  	u32 entropy_mode = inst->fw_caps[cap_id].value;
> -	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
> +	unsigned int cap_idx = inst->fw_caps[cap_id].idx;
> +	u32 hfi_id = inst->inst_fw_caps[cap_idx].hfi_id;
>  	u32 profile;
>  
>  	if (inst->codec != V4L2_PIX_FMT_H264)
> @@ -667,7 +659,7 @@ int iris_set_entropy_mode_gen2(struct iris_inst *inst, enum platform_inst_fw_cap
>  
>  	return hfi_ops->session_set_property(inst, hfi_id,
>  					 HFI_HOST_FLAGS_NONE,
> -				     iris_get_port_info(inst, cap_id),
> +				     iris_get_port_info(inst, cap_idx),
>  				     HFI_PAYLOAD_U32,
>  				     &entropy_mode, sizeof(u32));
>  }
> @@ -678,32 +670,33 @@ int iris_set_min_qp(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_i
>  	u32 i_qp_enable = 0, p_qp_enable = 0, b_qp_enable = 0;
>  	u32 i_frame_qp = 0, p_frame_qp = 0, b_frame_qp = 0;
>  	u32 min_qp_enable = 0, client_qp_enable = 0;
> -	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
> +	unsigned int cap_idx = inst->fw_caps[cap_id].idx;
> +	u32 hfi_id = inst->inst_fw_caps[cap_idx].hfi_id;
>  	u32 hfi_val;
>  
>  	if (inst->codec == V4L2_PIX_FMT_H264) {
> -		if (inst->fw_caps[MIN_FRAME_QP_H264].flags & CAP_FLAG_CLIENT_SET)
> +		if (inst->fw_caps[MIN_FRAME_QP_H264].client_set)
>  			min_qp_enable = 1;
>  		if (min_qp_enable ||
> -		    (inst->fw_caps[I_FRAME_MIN_QP_H264].flags & CAP_FLAG_CLIENT_SET))
> +		    (inst->fw_caps[I_FRAME_MIN_QP_H264].client_set))
>  			i_qp_enable = 1;
>  		if (min_qp_enable ||
> -		    (inst->fw_caps[P_FRAME_MIN_QP_H264].flags & CAP_FLAG_CLIENT_SET))
> +		    (inst->fw_caps[P_FRAME_MIN_QP_H264].client_set))
>  			p_qp_enable = 1;
>  		if (min_qp_enable ||
> -		    (inst->fw_caps[B_FRAME_MIN_QP_H264].flags & CAP_FLAG_CLIENT_SET))
> +		    (inst->fw_caps[B_FRAME_MIN_QP_H264].client_set))
>  			b_qp_enable = 1;
>  	} else {
> -		if (inst->fw_caps[MIN_FRAME_QP_HEVC].flags & CAP_FLAG_CLIENT_SET)
> +		if (inst->fw_caps[MIN_FRAME_QP_HEVC].client_set)
>  			min_qp_enable = 1;
>  		if (min_qp_enable ||
> -		    (inst->fw_caps[I_FRAME_MIN_QP_HEVC].flags & CAP_FLAG_CLIENT_SET))
> +		    (inst->fw_caps[I_FRAME_MIN_QP_HEVC].client_set))
>  			i_qp_enable = 1;
>  		if (min_qp_enable ||
> -		    (inst->fw_caps[P_FRAME_MIN_QP_HEVC].flags & CAP_FLAG_CLIENT_SET))
> +		    (inst->fw_caps[P_FRAME_MIN_QP_HEVC].client_set))
>  			p_qp_enable = 1;
>  		if (min_qp_enable ||
> -		    (inst->fw_caps[B_FRAME_MIN_QP_HEVC].flags & CAP_FLAG_CLIENT_SET))
> +		    (inst->fw_caps[B_FRAME_MIN_QP_HEVC].client_set))
>  			b_qp_enable = 1;
>  	}
>  
> @@ -731,7 +724,7 @@ int iris_set_min_qp(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_i
>  
>  	return hfi_ops->session_set_property(inst, hfi_id,
>  					 HFI_HOST_FLAGS_NONE,
> -				     iris_get_port_info(inst, cap_id),
> +				     iris_get_port_info(inst, cap_idx),
>  				     HFI_PAYLOAD_32_PACKED,
>  				     &hfi_val, sizeof(u32));
>  }
> @@ -742,32 +735,33 @@ int iris_set_max_qp(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_i
>  	u32 i_qp_enable = 0, p_qp_enable = 0, b_qp_enable = 0;
>  	u32 max_qp_enable = 0, client_qp_enable;
>  	u32 i_frame_qp, p_frame_qp, b_frame_qp;
> -	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
> +	unsigned int cap_idx = inst->fw_caps[cap_id].idx;
> +	u32 hfi_id = inst->inst_fw_caps[cap_idx].hfi_id;
>  	u32 hfi_val;
>  
>  	if (inst->codec == V4L2_PIX_FMT_H264) {
> -		if (inst->fw_caps[MAX_FRAME_QP_H264].flags & CAP_FLAG_CLIENT_SET)
> +		if (inst->fw_caps[MAX_FRAME_QP_H264].client_set)
>  			max_qp_enable = 1;
>  		if (max_qp_enable ||
> -		    (inst->fw_caps[I_FRAME_MAX_QP_H264].flags & CAP_FLAG_CLIENT_SET))
> +		    (inst->fw_caps[I_FRAME_MAX_QP_H264].client_set))
>  			i_qp_enable = 1;
>  		if (max_qp_enable ||
> -		    (inst->fw_caps[P_FRAME_MAX_QP_H264].flags & CAP_FLAG_CLIENT_SET))
> +		    (inst->fw_caps[P_FRAME_MAX_QP_H264].client_set))
>  			p_qp_enable = 1;
>  		if (max_qp_enable ||
> -		    (inst->fw_caps[B_FRAME_MAX_QP_H264].flags & CAP_FLAG_CLIENT_SET))
> +		    (inst->fw_caps[B_FRAME_MAX_QP_H264].client_set))
>  			b_qp_enable = 1;
>  	} else {
> -		if (inst->fw_caps[MAX_FRAME_QP_HEVC].flags & CAP_FLAG_CLIENT_SET)
> +		if (inst->fw_caps[MAX_FRAME_QP_HEVC].client_set)
>  			max_qp_enable = 1;
>  		if (max_qp_enable ||
> -		    (inst->fw_caps[I_FRAME_MAX_QP_HEVC].flags & CAP_FLAG_CLIENT_SET))
> +		    (inst->fw_caps[I_FRAME_MAX_QP_HEVC].client_set))
>  			i_qp_enable = 1;
>  		if (max_qp_enable ||
> -		    (inst->fw_caps[P_FRAME_MAX_QP_HEVC].flags & CAP_FLAG_CLIENT_SET))
> +		    (inst->fw_caps[P_FRAME_MAX_QP_HEVC].client_set))
>  			p_qp_enable = 1;
>  		if (max_qp_enable ||
> -		    (inst->fw_caps[B_FRAME_MAX_QP_HEVC].flags & CAP_FLAG_CLIENT_SET))
> +		    (inst->fw_caps[B_FRAME_MAX_QP_HEVC].client_set))
>  			b_qp_enable = 1;
>  	}
>  
> @@ -796,7 +790,7 @@ int iris_set_max_qp(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_i
>  
>  	return hfi_ops->session_set_property(inst, hfi_id,
>  					 HFI_HOST_FLAGS_NONE,
> -				     iris_get_port_info(inst, cap_id),
> +				     iris_get_port_info(inst, cap_idx),
>  				     HFI_PAYLOAD_32_PACKED,
>  				     &hfi_val, sizeof(u32));
>  }
> @@ -806,7 +800,8 @@ int iris_set_frame_qp(struct iris_inst *inst, enum platform_inst_fw_cap_type cap
>  	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
>  	u32 i_qp_enable = 0, p_qp_enable = 0, b_qp_enable = 0, client_qp_enable;
>  	u32 i_frame_qp, p_frame_qp, b_frame_qp;
> -	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
> +	unsigned int cap_idx = inst->fw_caps[cap_id].idx;
> +	u32 hfi_id = inst->inst_fw_caps[cap_idx].hfi_id;
>  	struct vb2_queue *q;
>  	u32 hfi_val;
>  
> @@ -822,18 +817,18 @@ int iris_set_frame_qp(struct iris_inst *inst, enum platform_inst_fw_cap_type cap
>  		b_qp_enable = 1;
>  	} else {
>  		if (inst->codec == V4L2_PIX_FMT_H264) {
> -			if (inst->fw_caps[I_FRAME_QP_H264].flags & CAP_FLAG_CLIENT_SET)
> +			if (inst->fw_caps[I_FRAME_QP_H264].client_set)
>  				i_qp_enable = 1;
> -			if (inst->fw_caps[P_FRAME_QP_H264].flags & CAP_FLAG_CLIENT_SET)
> +			if (inst->fw_caps[P_FRAME_QP_H264].client_set)
>  				p_qp_enable = 1;
> -			if (inst->fw_caps[B_FRAME_QP_H264].flags & CAP_FLAG_CLIENT_SET)
> +			if (inst->fw_caps[B_FRAME_QP_H264].client_set)
>  				b_qp_enable = 1;
>  		} else {
> -			if (inst->fw_caps[I_FRAME_QP_HEVC].flags & CAP_FLAG_CLIENT_SET)
> +			if (inst->fw_caps[I_FRAME_QP_HEVC].client_set)
>  				i_qp_enable = 1;
> -			if (inst->fw_caps[P_FRAME_QP_HEVC].flags & CAP_FLAG_CLIENT_SET)
> +			if (inst->fw_caps[P_FRAME_QP_HEVC].client_set)
>  				p_qp_enable = 1;
> -			if (inst->fw_caps[B_FRAME_QP_HEVC].flags & CAP_FLAG_CLIENT_SET)
> +			if (inst->fw_caps[B_FRAME_QP_HEVC].client_set)
>  				b_qp_enable = 1;
>  		}
>  	}
> @@ -857,7 +852,7 @@ int iris_set_frame_qp(struct iris_inst *inst, enum platform_inst_fw_cap_type cap
>  
>  	return hfi_ops->session_set_property(inst, hfi_id,
>  					 HFI_HOST_FLAGS_NONE,
> -				     iris_get_port_info(inst, cap_id),
> +				     iris_get_port_info(inst, cap_idx),
>  				     HFI_PAYLOAD_32_PACKED,
>  				     &hfi_val, sizeof(u32));
>  }
> @@ -866,7 +861,8 @@ int iris_set_qp_range(struct iris_inst *inst, enum platform_inst_fw_cap_type cap
>  {
>  	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
>  	struct hfi_quantization_range_v2 range;
> -	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
> +	unsigned int cap_idx = inst->fw_caps[cap_id].idx;
> +	u32 hfi_id = inst->inst_fw_caps[cap_idx].hfi_id;
>  
>  	if (inst->codec == V4L2_PIX_FMT_HEVC) {
>  		range.min_qp.qp_packed = inst->fw_caps[MIN_FRAME_QP_HEVC].value;
> @@ -878,7 +874,7 @@ int iris_set_qp_range(struct iris_inst *inst, enum platform_inst_fw_cap_type cap
>  
>  	return hfi_ops->session_set_property(inst, hfi_id,
>  					 HFI_HOST_FLAGS_NONE,
> -				     iris_get_port_info(inst, cap_id),
> +				     iris_get_port_info(inst, cap_idx),
>  				     HFI_PAYLOAD_32_PACKED,
>  				     &range, sizeof(range));
>  }
> @@ -886,7 +882,7 @@ int iris_set_qp_range(struct iris_inst *inst, enum platform_inst_fw_cap_type cap
>  int iris_set_properties(struct iris_inst *inst, u32 plane)
>  {
>  	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
> -	struct platform_inst_fw_cap *cap;
> +	const struct platform_inst_fw_cap *cap;
>  	int ret;
>  	u32 i;
>  
> @@ -895,7 +891,9 @@ int iris_set_properties(struct iris_inst *inst, u32 plane)
>  		return ret;
>  
>  	for (i = 1; i < INST_FW_CAP_MAX; i++) {
> -		cap = &inst->fw_caps[i];
> +		unsigned int cap_idx = inst->fw_caps[i].idx;
> +
> +		cap = &inst->inst_fw_caps[cap_idx];
>  		if (!iris_valid_cap_id(cap->cap_id))
>  			continue;
>  
> diff --git a/drivers/media/platform/qcom/iris/iris_instance.h b/drivers/media/platform/qcom/iris/iris_instance.h
> index 5982d7adefeab80905478b32cddba7bd4651a691..39d74bef4d188abb919c372b7529d1d0773bd96a 100644
> --- a/drivers/media/platform/qcom/iris/iris_instance.h
> +++ b/drivers/media/platform/qcom/iris/iris_instance.h
> @@ -82,7 +82,8 @@ struct iris_inst {
>  	struct completion		completion;
>  	struct completion		flush_completion;
>  	u32				flush_responses_pending;
> -	struct platform_inst_fw_cap	fw_caps[INST_FW_CAP_MAX];
> +	struct platform_inst_fw_cap_value fw_caps[INST_FW_CAP_MAX];

Please name this as fw_caps_val

> +	const struct platform_inst_fw_cap *inst_fw_caps;

Please keep it as fw_caps only, else while deref it looks like inst->inst...

Also update the documentations for the struct members update/add

>  	struct iris_buffers		buffers[BUF_TYPE_MAX];
>  	u32				fw_min_count;
>  	enum iris_inst_state		state;
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index 5ffc1874e8c6362b1c650e912c230e9c4e3bd160..104ff38219e30e6d52476d44b54338c55ef2ca7b 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -148,7 +148,7 @@ enum platform_inst_fw_cap_flags {
>  	CAP_FLAG_MENU			= BIT(1),
>  	CAP_FLAG_INPUT_PORT		= BIT(2),
>  	CAP_FLAG_OUTPUT_PORT		= BIT(3),
> -	CAP_FLAG_CLIENT_SET		= BIT(4),
> +	// BIT(4)
>  	CAP_FLAG_BITMASK		= BIT(5),
>  	CAP_FLAG_VOLATILE		= BIT(6),
>  };
> @@ -165,6 +165,12 @@ struct platform_inst_fw_cap {
>  		   enum platform_inst_fw_cap_type cap_id);
>  };
>  
> +struct platform_inst_fw_cap_value {
> +	unsigned int idx;
> +	s64 value;
> +	bool client_set;
> +};
> +
>  struct bw_info {
>  	u32 mbs_per_sec;
>  	u32 bw_ddr;
> diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
> index ae13c3e1b426bfd81a7b46dc6c3ff5eb5c4860cb..72559497e81c30373711e9b113582039f1fb5153 100644
> --- a/drivers/media/platform/qcom/iris/iris_vdec.c
> +++ b/drivers/media/platform/qcom/iris/iris_vdec.c
> @@ -55,8 +55,9 @@ int iris_vdec_inst_init(struct iris_inst *inst)
>  	inst->buffers[BUF_OUTPUT].min_count = iris_vpu_buf_count(inst, BUF_OUTPUT);
>  	inst->buffers[BUF_OUTPUT].size = f->fmt.pix_mp.plane_fmt[0].sizeimage;
>  
> -	memcpy(&inst->fw_caps[0], &core->inst_fw_caps_dec[0],
> -	       INST_FW_CAP_MAX * sizeof(struct platform_inst_fw_cap));
> +	memcpy(inst->fw_caps, core->inst_fw_caps_dec,
> +	       sizeof(inst->fw_caps));
> +	inst->inst_fw_caps = core->iris_platform_data->inst_fw_caps_dec;
>  
>  	return iris_ctrls_init(inst);
>  }
> diff --git a/drivers/media/platform/qcom/iris/iris_venc.c b/drivers/media/platform/qcom/iris/iris_venc.c
> index 099bd5ed4ae0294725860305254c4cad1ec88d7e..3d1d481f8048305ef9a9bf0cb435ebca68563105 100644
> --- a/drivers/media/platform/qcom/iris/iris_venc.c
> +++ b/drivers/media/platform/qcom/iris/iris_venc.c
> @@ -68,8 +68,9 @@ int iris_venc_inst_init(struct iris_inst *inst)
>  	inst->operating_rate = DEFAULT_FPS;
>  	inst->frame_rate = DEFAULT_FPS;
>  
> -	memcpy(&inst->fw_caps[0], &core->inst_fw_caps_enc[0],
> -	       INST_FW_CAP_MAX * sizeof(struct platform_inst_fw_cap));
> +	memcpy(inst->fw_caps, core->inst_fw_caps_enc,
> +	       sizeof(inst->fw_caps));
> +	inst->inst_fw_caps = core->iris_platform_data->inst_fw_caps_enc;
>  
>  	return iris_ctrls_init(inst);
>  }
> 

