Return-Path: <linux-media+bounces-44031-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 80F30BC6FD0
	for <lists+linux-media@lfdr.de>; Thu, 09 Oct 2025 02:16:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A28A64E48AD
	for <lists+linux-media@lfdr.de>; Thu,  9 Oct 2025 00:16:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 090E71684A4;
	Thu,  9 Oct 2025 00:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Or1jK3MM"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1035E36124
	for <linux-media@vger.kernel.org>; Thu,  9 Oct 2025 00:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759968972; cv=none; b=rE1++7oqFENeJdQ8BIlcJ/awoGw/kZR4TmozEatrDZVpAt02hqjAFjMzMhlucl4num5yG9Rm3oBiowFlq/COJtCl/8Fk6Mulabx+p7FtHppjQHyKQDY7jdEeZYYAOITXfgGpVYo6ONpXudCaLn2gRnD9oWv17cmR63GjZug7f90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759968972; c=relaxed/simple;
	bh=9P2UuZfyLde79jztqRTF7xV24Frl6wIZFMOHPPr7Yjc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UtFEk9bg82NcObaHn7N8uYzL5XBFE5jOktavVsFaD+KSTmFzogK/L65+lv0GS2btlDyIxSmbHOeUc5j5LVS0AKgigPMxkhsW9GIkPzg/d2Auy3Qmkb1RcElkN997wnwGd60u8OLvJ7P+N64+G5Roos5fO7LCLFqp3zEiKcjfvaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Or1jK3MM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 598I5KmL001413
	for <linux-media@vger.kernel.org>; Thu, 9 Oct 2025 00:16:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dJZI990cPhiKEcupHn1z/ZmL
	7wedpaV86BBbV5UT1D8=; b=Or1jK3MMk9qWodsJj+eU31JIaGGvH/FJHT65sDhK
	+7JQUX5F9Lfulii9AEddr/4sIS6vEOI4d0aAGZnUXoSC/s+zXAVKhOk+SutKVt/q
	czjAqmS4PRAkfURN+5EXmPcwzcwEKTDoYaeU/ClfKNSz6qBmTB5MjdvAFYw1DdMr
	iThEp/L+DNPf1hgla2krBPlDvCwi+xCaRDQkz0jd6FeVq7Nj/IHIQDWRMzPdfkst
	nDSgBPKZ3YRF855nm/uIs2mZZyVH4hOzHeXzTGh/sn8EKRhHiX5GYFQSTwkkayep
	cQV9JqoKszJxP44h0ipKc8NE+11UA1oSW7EpgEYVNTJANA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4kry4y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 09 Oct 2025 00:16:09 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4df60ea7a1bso12914331cf.2
        for <linux-media@vger.kernel.org>; Wed, 08 Oct 2025 17:16:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759968968; x=1760573768;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dJZI990cPhiKEcupHn1z/ZmL7wedpaV86BBbV5UT1D8=;
        b=cc3dN7RUCjcKls5Ius29Zh3mUsYK7v/RNBzo+gGgMPr93HrmwOVyDq5fUf5yZrXAap
         NiFmzPX5eHB0h599XfF+1wHwvMiE4NmETUcG9AEe0M/COlQVW0SvcqpUBukbfPPXUwfV
         La2KxGDjYZ/UkfIdV+6gkcOtk71ziGAcwJ8BJH6lWDCKdlNH7Ujowz+phjfKZu6fhy8f
         bibTJegG6FooR3tltXP1R3YzG5WJ4h246uuZodIOqylnlE0Ly29yRpHhWNs7Jk5B8WO0
         M/JX/jCI1DJTc1+OHBNHdRnejk1JsDClPpV0kQKhQdu8ddhSl5fClq56Sz570jTX2a6O
         vnzw==
X-Forwarded-Encrypted: i=1; AJvYcCV0t5+lgOOnpAOwSYjBubyrLw5xANL4UZbr71qL2u2HVUDLuGcFQrR20g0JrOf5ezkeY5wFfhVX1M503Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+VDdp3oAMHAGFro0sMks+esK0PF1kPYhro2kry4uRQphpeuLD
	PX9dkbNsFYj+yfqXozEeOOeRpawhA5O5/cUe2fqihSYoaNZn7dV6VzoiiT9rLWahxhN3QNBH/IP
	Lwbd3cToQHIK+o6XzzUSmQi0lKErhiyY1qjwQKdvZo9BkGraBowN6/L1YBsqLIlDAzA==
X-Gm-Gg: ASbGncv8Qz3zj+9V+9qbl6tFnfjqfr/fdDWna4wu/hXZZFaUEFA/HZp7YY2efIWGk1Z
	KRyJeD9voUjy29HTKWPNZ9A4yW227adlorxmgQnX9V7tR9Pwyv78weE9DOmHfkEj9ypfSZX5o0R
	i7XnlN0foY3D10STF/VBYtYlg0HcqRTNvCxgBJuiXRKFf6YuvqONbb2N1Ozf6aocLlmWQKjfD/e
	gOCx/qkIafJo6Sr14AEoCoM+wE4ISh6V3WofbX5JBWCPe+SZlTz8+kxQMmq3OycBCdo/AFIkti5
	O/f7XI9iOlKYmWUlbNGeS0eKNdP3V2t4x2beg23cubUfZSO/9ANx/g4PAXjQ4C+qDh/PbtzVtOD
	Rjd//oe3f967S81LYrXVMiEFmRvyp0DSkmKkDTV5m2OhFbu2oUavbCkHv1w==
X-Received: by 2002:a05:622a:400b:b0:4b7:9f86:8705 with SMTP id d75a77b69052e-4e6ead5c61cmr65441241cf.65.1759968967634;
        Wed, 08 Oct 2025 17:16:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHwFXlgUuHcfzLU3WPMp9WV1TrH+Y9SK4xU03O2HVIo4YAIphVfPQnmwW+42AaHDBudLsn2nQ==
X-Received: by 2002:a05:622a:400b:b0:4b7:9f86:8705 with SMTP id d75a77b69052e-4e6ead5c61cmr65440931cf.65.1759968967163;
        Wed, 08 Oct 2025 17:16:07 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-375f3a1a4ccsm23603381fa.27.2025.10.08.17.16.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 17:16:04 -0700 (PDT)
Date: Thu, 9 Oct 2025 03:16:02 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/8] media: iris: stop copying r/o data
Message-ID: <rmeerm4hqcdxqjmylbfep7enswzrypqfyhl2yka554m7mo4y3s@4ycpb6eeojpe>
References: <20251008-iris-sc7280-v1-0-def050ba5e1f@oss.qualcomm.com>
 <MNE6-NWyEnaQyvn4In-jfg6F21lf0p0GgcEsRO6lM610hKJwSHgpSoefqJ7PROY_eWIuyd08U3G5bDI8ufq0aQ==@protonmail.internalid>
 <20251008-iris-sc7280-v1-3-def050ba5e1f@oss.qualcomm.com>
 <b58f9dd3-6ace-474f-98ad-a5b9c5f0cf17@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b58f9dd3-6ace-474f-98ad-a5b9c5f0cf17@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX6DhCznIXeFmJ
 da/9AVAEZwH0xrmqozE3pS3eit1zp5ozfUAoNb/BrW5XFm4bicYcNNQak1+RC8bsXrDGe6Xn+b6
 cBlAcJC+OhEDKVLGvjEEui0EIe74xeF0v266ju6e3lW2L7fKvbW5jE3U/Zm/DAQOefM+ghG3KUX
 FkE/7LCnBD6m3AdlEcXgJdo2C0sznj116iziSCVP2R142FzGOwHMPHnKHHaN6RaeNWzBeMk6e/a
 4o41j0EIl6jnCDuhvbZ4Hi9/FyxzmBl9ytEACbZBEMldplx5BLmrSNcfkF910a8cUNlcmQJg5ls
 1q3GOn53j+2gPBRWxuFVUA5x2M9F5ZtmVFlcYKNC/R5Xkqn2Pxhl4UOg4NQh1SLBPluvTgY7mFX
 WGA2+oFMkzLqqcTOE232BSi4yNkuqA==
X-Authority-Analysis: v=2.4 cv=CbcFJbrl c=1 sm=1 tr=0 ts=68e6fec9 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=hHaQWnhJ5brMnfOsllkA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: nopFfOizt217M4iqUYNCHDcNdviUBL-z
X-Proofpoint-ORIG-GUID: nopFfOizt217M4iqUYNCHDcNdviUBL-z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_08,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 malwarescore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121

On Thu, Oct 09, 2025 at 12:48:00AM +0100, Bryan O'Donoghue wrote:
> On 08/10/2025 05:33, Dmitry Baryshkov wrote:
> > Most of the platform_inst_caps data is read-only. In order to lower the
> > amount of memory consumed by the driver, store the value and the
> > corresponding indice in the read-write data and use the rest via the
> > pointer to r/o capability data.
> 
> corresponding index

Ack

> 
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >   drivers/media/platform/qcom/iris/iris_core.h       |   4 +-
> >   drivers/media/platform/qcom/iris/iris_ctrls.c      | 238 ++++++++++-----------
> >   drivers/media/platform/qcom/iris/iris_instance.h   |   3 +-
> >   .../platform/qcom/iris/iris_platform_common.h      |   8 +-
> >   drivers/media/platform/qcom/iris/iris_vdec.c       |   5 +-
> >   drivers/media/platform/qcom/iris/iris_venc.c       |   5 +-
> >   6 files changed, 135 insertions(+), 128 deletions(-)
> > 
> > diff --git a/drivers/media/platform/qcom/iris/iris_core.h b/drivers/media/platform/qcom/iris/iris_core.h
> > index fb194c967ad4f9b5e00cd74f0d41e0b827ef14db..b5037ae8c71921753c165a86a277a4a4b5083b30 100644
> > --- a/drivers/media/platform/qcom/iris/iris_core.h
> > +++ b/drivers/media/platform/qcom/iris/iris_core.h
> > @@ -115,8 +115,8 @@ struct iris_core {
> >   	struct delayed_work			sys_error_handler;
> >   	struct list_head			instances;
> >   	/* encoder and decoder have overlapping caps, so two different arrays are required */
> > -	struct platform_inst_fw_cap		inst_fw_caps_dec[INST_FW_CAP_MAX];
> > -	struct platform_inst_fw_cap		inst_fw_caps_enc[INST_FW_CAP_MAX];
> > +	struct platform_inst_fw_cap_value	inst_fw_caps_dec[INST_FW_CAP_MAX];
> > +	struct platform_inst_fw_cap_value	inst_fw_caps_enc[INST_FW_CAP_MAX];
> >   };
> > 
> >   int iris_core_init(struct iris_core *core);
> > diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
> > index 9da050aa1f7ce8152dfa46a706e2c27adfb5d6ce..0e9adb3982a49cfd7cbe5110cfd5f573f0f7bb38 100644
> > --- a/drivers/media/platform/qcom/iris/iris_ctrls.c
> > +++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
> > @@ -194,26 +194,28 @@ static int iris_op_s_ctrl(struct v4l2_ctrl *ctrl)
> >   {
> >   	struct iris_inst *inst = container_of(ctrl->handler, struct iris_inst, ctrl_handler);
> >   	enum platform_inst_fw_cap_type cap_id;
> > -	struct platform_inst_fw_cap *cap;
> > +	unsigned int cap_idx;
> >   	struct vb2_queue *q;
> > 
> > -	cap = &inst->fw_caps[0];
> >   	cap_id = iris_get_cap_id(ctrl->id);
> >   	if (!iris_valid_cap_id(cap_id))
> >   		return -EINVAL;
> > 
> > +	cap_idx = inst->fw_caps[cap_id].idx;
> > +
> >   	q = v4l2_m2m_get_src_vq(inst->m2m_ctx);
> >   	if (vb2_is_streaming(q) &&
> > -	    (!(inst->fw_caps[cap_id].flags & CAP_FLAG_DYNAMIC_ALLOWED)))
> > +	    (!(inst->inst_fw_caps[cap_id].flags & CAP_FLAG_DYNAMIC_ALLOWED)))
> >   		return -EINVAL;
> > 
> > -	cap[cap_id].flags |= CAP_FLAG_CLIENT_SET;
> > +	inst->fw_caps[cap_id].client_set = true;
> 
> Why drop just this one bit - CAP_FLAG_CLIENT_SET.
> 
> Code seems neater with that bit retained in fw_caps to me, you have fewer
> LOC changed that way too.

The problem is that all other flags are read-only and they stay in
the constant struct platform_inst_fw_cap. The CAP_FLAG_CLIENT_SET is
dynamic and it is set for each instance. Initially I kept the flag and
copied the whole flag set, but it resulted in a bigger patch, because
all cap.flags lookups were now using inst->cap[id].flag (and there are
more than just CAP_FLAG_CLIENT_SET). In the end I decided that it's not
worth copying r/o flags, but instead we should separate r/o and r/w
data. Thus CAP_FLAG_CLIENT_SET ended up being a bool field. I think it's
more logical and easier to follow the code like this. If there are
multiple flags like this. we can always change the code to add
INST_FLAG_CLIENT_SET.

> 
> > 
> >   	inst->fw_caps[cap_id].value = ctrl->val;
> > 
> >   	if (vb2_is_streaming(q)) {
> > -		if (cap[cap_id].set)
> > -			cap[cap_id].set(inst, cap_id);
> > +
> > +		if (inst->inst_fw_caps[cap_idx].set)
> > +			inst->inst_fw_caps[cap_idx].set(inst, cap_id);
> >   	}
> > 
> >   	return 0;

-- 
With best wishes
Dmitry

