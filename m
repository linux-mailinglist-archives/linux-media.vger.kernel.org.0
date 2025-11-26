Return-Path: <linux-media+bounces-47726-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A8409C87A92
	for <lists+linux-media@lfdr.de>; Wed, 26 Nov 2025 02:13:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6298F3A9FB0
	for <lists+linux-media@lfdr.de>; Wed, 26 Nov 2025 01:13:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B5F82F7AD2;
	Wed, 26 Nov 2025 01:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NWo5DtQc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JbkifzY8"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C30422F60A4
	for <linux-media@vger.kernel.org>; Wed, 26 Nov 2025 01:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764119590; cv=none; b=u+xJIji8UCaJyRBQHC/XuNjT52gH4ioBuItX+IyQIlyQktZiWqETd5e3Xg1Bt5NiSWPIwCVMFeGUJTnK5yNpBPNtHVXbQc//ZjPk6G2MLnzDKxfKQwXHF6OdC8y7ADVfJ2CcBKi+1jtnce7gUzNb9vih06gmOghAzSpsFD1Gy/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764119590; c=relaxed/simple;
	bh=PEUucwAbtlApOMeePyYfxIc/Dt2KhDGIy/f0I9xYmH4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HMazHwOftSHLGJwOC+TqySxW7FZ8vMkVfUvTDvh6j9MptToa9u2ojnBEPIdzG2xG58pEeXeaz8Z3HooKRRStUoeVJsPINypGr2BOrfTRMfFu+exGO7RizYDhGAgQ+4YlHY8md8+aPd1FyIBSsuppd8U7gTqzXoReMoXQoaj8wJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NWo5DtQc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JbkifzY8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5API25XT2659070
	for <linux-media@vger.kernel.org>; Wed, 26 Nov 2025 01:13:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=prAN8wjJmgsa83ldd4vAxryi
	3yPKicYjvD8xCOJLEzg=; b=NWo5DtQcvf7jO/FQtnOTMwq1jTDPhycXUpYE5Tlv
	0gdbj1+yxUtKpSYJNicZ0WS5aL0HEzX5Ic3m1zWvbYBIlCr8YXWyP0z63r3NdFuY
	3FQE5ex6fCzCmcWmrjA3iZ0oOoHV1biCiCCwvK33eAVoTqCmutOARKil0ARFrmCK
	MQ27lByvJmYbFjGwcCoaMRnVnJT7P4BTx9sxaaLNtcyB5fIVxHPKW6HUMYsE3780
	e73K1oMeg5c6aJfRcwN+Vl1k6b5Xa2UbVj5dyuRQFM+rZBAZDgK96lDaIDlgfMUq
	UePNyaH5gHEhoT9TlkZv2GA62k3UjnAA90frDk6Kpf9kXg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ana9xaag2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 26 Nov 2025 01:13:07 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b22ab98226so2265402685a.2
        for <linux-media@vger.kernel.org>; Tue, 25 Nov 2025 17:13:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764119587; x=1764724387; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=prAN8wjJmgsa83ldd4vAxryi3yPKicYjvD8xCOJLEzg=;
        b=JbkifzY8Gh58lzq2CMgRtZgw/FL58/NtmDqtamfyF6sLbDLswka+AHF+h9HxFj5CNl
         SxdXtQ8cvTSQ6l/L+1TIsblp9GO7/nb+feW4wmLjrnxPGG3GPGfAnI+qORLOYmOfmGi5
         gxrNXS7hWj425F0qlFHNTtwPXpFIwl4hYYm5M9azH19pN1qFYwR5AK2G2eLNH0qwQZoP
         B+7qnIrjWPqyOiqSYgJssbozhW4opdxqhamf1MkhirT8o4KYnurFTUVKK6vzjMYlxgQ/
         dNvhT9lc835rHRaqZvzb/qRH428ZXklR0U5fC3OXdB/NvgrWYVPhpbxO+Xxn7vlku6Ka
         yBlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764119587; x=1764724387;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=prAN8wjJmgsa83ldd4vAxryi3yPKicYjvD8xCOJLEzg=;
        b=ZlOtlSuDSfv+z27suUsg7sgKXvANsUwt4eB47Wp4DYvirKqt492kpRRe4EO7J/YU1d
         VLU8m+rXVjMnACSrWc8AgTj1s3efy9RPMsZh2RYnaQ8Oo+91muKKQNdQ+CZrPBAUrg3H
         e8ohmbQyFM8PXxbWzbs7yhaShn6cjRd646ZfTJv7d1J2UP92klYKk+XuDP62TVoAWMpa
         XmpAx83CRBiGG4Gu0u2ARAW2QKG0MxDojomMIvvCrn7JZ2J5TAmEjoWADYdsgTacYSZt
         UL0kVRM1l3aN9T+ii9bOIf9VKD3sz/jpYMVmxxFrQZSK2/z+OSsqdW/82s84cMmCs3k3
         nE1w==
X-Forwarded-Encrypted: i=1; AJvYcCVSm2s6a1bHt7KFqEdfAzfnRQkyuWmzCm6tlQlHRytsHOpYhPFfP0fB7oyah/qHXFRpFWFVrSZh2KpTqQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/rgLrptoUviHxT1b5OK+nnu7TmNj3B8llx0LQYAYhGLAYXxPV
	J9fI4BtAyU8K7KARdAatCxU1dw96EXUtLoiIdIXH3FeE0tI8Xr/qQZY2cEgcCFoSYiMtaRyZV76
	ScXHh9tzf9YTCdlUvWmSsz9SORxtJM2qhZs6VWibd+NKiNtF0pNg6jwDHCpOa1ZsDQQ==
X-Gm-Gg: ASbGncsvN+S22UmY/WL53KqU4eymgfxiQ36kXXsT/sneZZpCb4dZJL4pYtNDHHV7l3e
	3ZaOFXtWm5U+4nPeR3S99YLYUTQnztC0g0hbzU7xoEpRorgKYLsbF0dAHt1P1vstbzThA7WdY4+
	GqfZgHFkKHf1INnQk0hL63YVgVnuR9pzsAZmP2shdhQXYELoGWQ4D8zbuQAv1vwCuS4ZQbLrXsf
	2jmr4bVq6V8rqRTsRwSn96Iqz7pWXjQy7rxxfRmMU0h3ErxXKPhUAQ79ZSi5s/ff2642DaOR1uS
	pyPMtGODhVobBrCCiTrLCWPmlGzP7WfDqO+ecKQjsblc47b+NaooiwksP62OYsEroA7CLkO7fiY
	ibMh8hOf1ILiiR8d5NMB6aeExw0WkTz5aAYzxK7nzJQjdOqaxz8N32xg5uEHphqr1XyR/2qjEyX
	hxZzzWnnwbKI5Bcl5XcAQPMss=
X-Received: by 2002:a05:620a:4623:b0:8b1:ed55:e4f0 with SMTP id af79cd13be357-8b33d22542cmr2493019285a.39.1764119586895;
        Tue, 25 Nov 2025 17:13:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH5UefQ4KVrSMEfqb4noheVestKPUsxTe5Q2DhkKkqIPcQCwSpdkGN4gJQlMEtZr17XVFC8Uw==
X-Received: by 2002:a05:620a:4623:b0:8b1:ed55:e4f0 with SMTP id af79cd13be357-8b33d22542cmr2493016785a.39.1764119586436;
        Tue, 25 Nov 2025 17:13:06 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5969dbc597bsm5580314e87.69.2025.11.25.17.13.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 17:13:04 -0800 (PST)
Date: Wed, 26 Nov 2025 03:13:00 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Viswanath Boma <quic_vboma@quicinc.com>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org, Mecid <mecid@mecomediagroup.de>,
        Renjiang Han <renjiang.han@oss.qualcomm.com>
Subject: Re: [PATCH v2] media: venus: vdec: restrict EOS addr quirk to IRIS2
 only
Message-ID: <wq7kaelokxqxkxxi5cvp7sz2az5hlam4nyyt4v55zrgei3jsyo@yyefysdsw3co>
References: <20251125-venus-vp9-fix-v2-1-8bfcea128b95@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251125-venus-vp9-fix-v2-1-8bfcea128b95@oss.qualcomm.com>
X-Proofpoint-GUID: -yoITijPhONMJZR-6RABE1e3y-3rjVw9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDAwNyBTYWx0ZWRfX6hiAPROc+nNl
 se2FyBBJr67iZIe7/a+O6vo9xVJ3yW81SpUOXWc4QgLfCRUffG1EJPDrk9+kNmLC4ib98DfKCQA
 K1nFXnpCW53bUS2MZ33r0eFXRgbphAV1Rvt0Z6Q26lvm1HzX2WklE7ArmtHRki2uXM3TwEobzin
 G9x7JN7XQsSiuRkkqOFcKpn5zXENuNXtHnd/y8GpV7GHavDyhiE0w9KZcVS9/l6Q0R5x7V87HFw
 VqmuoGqza5wCFqzvBqZbxtv0bkAxoI2yFjmZ89c9MQ/xV8ui4Sut8X9WAZ9Ja2yn4H1ltUzejFg
 XvWGFCe7nbNEpx30OLj1aaLEb0S4drH2wDw058RaIK+4wSEjiuTy/1WmI26NQeLsc9/WPx0C3bq
 9zL0xzfIb5eWQLuB1/iRRsjeHvn/Bw==
X-Authority-Analysis: v=2.4 cv=Sfj6t/Ru c=1 sm=1 tr=0 ts=69265423 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=vnrCTU9D9aip1Mwo_JEA:9
 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: -yoITijPhONMJZR-6RABE1e3y-3rjVw9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 spamscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511260007

On Tue, Nov 25, 2025 at 11:04:19AM +0530, Dikshita Agarwal wrote:
> On SM8250 (IRIS2) with firmware older than 1.0.087, the firmware could

Hmm, interesting. In linux-firmware we have VIDEO.IR.1.0-00005-PROD-4
for SM8250 firmware. This version wouldn't be parsed at all for SM8250
(nor does it follow the format string). Why? Would you please fix
version parsing for this firmware?

> not handle a dummy device address for EOS buffers, so a NULL device
> address is sent instead. The existing check used IS_V6() alongside a
> firmware version gate:
> 
>     if (IS_V6(core) && is_fw_rev_or_older(core, 1, 0, 87))
>         fdata.device_addr = 0;
>     else
> 	fdata.device_addr = 0xdeadb000;
> 
> However, SC7280 which is also V6, uses a firmware string of the form
> "1.0.<commit-hash>", which the version parser translates to 1.0.0. This

I still think that using commit-hash is a mistake. It doesn't allow any
version checks.

> unintentionally satisfies the `is_fw_rev_or_older(..., 1, 0, 87)`
> condition on SC7280. Combined with IS_V6() matching there as well, the
> quirk is incorrectly applied to SC7280, causing VP9 decode failures.
> 
> Constrain the check to IRIS2 (SM8250) only, which is the only platform
> that needed this quirk, by replacing IS_V6() with IS_IRIS2(). This
> restores correct behavior on SC7280 (no forced NULL EOS buffer address).
> 
> Fixes: 47f867cb1b63 ("media: venus: fix EOS handling in decoder stop command")
> Cc: stable@vger.kernel.org
> Reported-by: Mecid <mecid@mecomediagroup.de>
> Closes: https://github.com/qualcomm-linux/kernel-topics/issues/222
> Co-developed-by: Renjiang Han <renjiang.han@oss.qualcomm.com>
> Signed-off-by: Renjiang Han <renjiang.han@oss.qualcomm.com>
> Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> ---
> Changes in v2:
> - Fixed email address for Mecid (Konrad)
> - Added inline comment for the quirk (Konrad)
> - Link to v1: https://lore.kernel.org/r/20251124-venus-vp9-fix-v1-1-2ff36d9f2374@oss.qualcomm.com
> ---
>  drivers/media/platform/qcom/venus/vdec.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
> index 4a6641fdffcf79705893be58c7ec5cf485e2fab9..6b3d5e59133e6902353d15c24c8bbaed4fcb6808 100644
> --- a/drivers/media/platform/qcom/venus/vdec.c
> +++ b/drivers/media/platform/qcom/venus/vdec.c
> @@ -565,7 +565,13 @@ vdec_decoder_cmd(struct file *file, void *fh, struct v4l2_decoder_cmd *cmd)
>  
>  		fdata.buffer_type = HFI_BUFFER_INPUT;
>  		fdata.flags |= HFI_BUFFERFLAG_EOS;
> -		if (IS_V6(inst->core) && is_fw_rev_or_older(inst->core, 1, 0, 87))
> +
> +		/* Send NULL EOS addr for only IRIS2 (SM8250),for firmware <= 1.0.87.
> +		 * SC7280 also reports "1.0.<hash>" parsed as 1.0.0; restricting to IRIS2
> +		 * avoids misapplying this quirk and breaking VP9 decode on SC7280.
> +		 */
> +
> +		if (IS_IRIS2(inst->core) && is_fw_rev_or_older(inst->core, 1, 0, 87))
>  			fdata.device_addr = 0;
>  		else
>  			fdata.device_addr = 0xdeadb000;
> 
> ---
> base-commit: 1f2353f5a1af995efbf7bea44341aa0d03460b28
> change-id: 20251121-venus-vp9-fix-1ff602724c02
> 
> Best regards,
> -- 
> Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> 

-- 
With best wishes
Dmitry

