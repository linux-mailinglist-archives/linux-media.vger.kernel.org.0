Return-Path: <linux-media+bounces-60893-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CKIPHm+Q/WnWfgAAu9opvQ
	(envelope-from <linux-media+bounces-60893-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 08 May 2026 09:27:43 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D8424F3000
	for <lists+linux-media@lfdr.de>; Fri, 08 May 2026 09:27:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7CB4530066B6
	for <lists+linux-media@lfdr.de>; Fri,  8 May 2026 07:27:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F214346ADC;
	Fri,  8 May 2026 07:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BSSKMI3K";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iL+BApj5"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1370343216
	for <linux-media@vger.kernel.org>; Fri,  8 May 2026 07:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778225253; cv=none; b=gkrj/he+8D/1oBB+X6yvIOpHOk4nd+4rEyPbF2CsYNmP2sc7R66u7cTQeghYZhkZYHq/wOYseGQLruks6+u9nbBtpcuXbFCd2tWfSRpOapdOboABhRi4XPo4lrDJ2bi1SQyU2jHWjibz5jYhDcXKbBh7JuaYxgK+Rl3wvz9X8rU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778225253; c=relaxed/simple;
	bh=h/jkCUd2ruwH9pEy58uPwqgeJW51j7zZVJoFeNgSSQI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n1r5WOh/PIkz82SzsRd+meZutYOSMwEr/i5Kxd2UzXjx6guh4HxGJcL0riWq1oxx9E6bSUGip7p3M5iHp8EnJig77b1GofaPWK4v4kPg3SMArd8DiTatY6/0OJ064km6hozzSTnqoZJqtwSTzWtUt7nHqjmXrCdhyN6apewvA+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BSSKMI3K; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iL+BApj5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6485Ievt2531303
	for <linux-media@vger.kernel.org>; Fri, 8 May 2026 07:27:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CYWXjnyUn/GJRbc5n3pzVtMfi5XIFZFB+50xAVvCi1U=; b=BSSKMI3KymR08DmS
	bgY/7iQ0Woah5wkZNsvera4wYtxBXgPnKYx+3eXDIVo3JI50TxzFdm9THESQOAzB
	0Ma3Pb8HGeXekdLSDjPy7Dwc2fbKC/BrLNPt7Zid1h9e+6YwCLP1xN7ri0P1wQ5w
	PDCq6lzjbHGd4A6XmjzvGGE3KnISFzKe4p9jqc98ax1Xs1LR+vsPih26izK7TpHd
	21DVW8mUh7xHN+Y86xnwXl5Id6pg8ST0t61W/MM/Jr2zSNDSNa+niHcsME668dZV
	wzfX7rUmQoHSP1Twri2h4I6wHqimAoRb+JbetJ+B5gmtM5+SeCX501eCiuUBHezx
	JmtgDA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e10m9t7rn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 08 May 2026 07:27:28 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b458add85aso17918585ad.2
        for <linux-media@vger.kernel.org>; Fri, 08 May 2026 00:27:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778225248; x=1778830048; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CYWXjnyUn/GJRbc5n3pzVtMfi5XIFZFB+50xAVvCi1U=;
        b=iL+BApj5q9fq6avFSx7uxy0AlerdKKnhzJAu5OXZrCxf9giL+cQQe0E7D5/GIlmtwt
         Y7QvTxslIgl9N78B8RwpHxLn2XMgGA5+9uBC4L59Rx14UGw7G5ftdhPQdZ01qYV7cvTL
         jlGmN461YT2TlxSVF00gkF2r7wqwyAJE8Zesl3hW3WZ3jhb6ckdfZcSRwAR/R9wxS4+S
         IaxWmW4QeIzaH73RzXe+xNxDlTUGPmEpRjlSzw9BlH5d86dCBr8v+TU42fEUfOlz/oVM
         HrfVpj6PzFmDIvWOfTDKkcWdbqe1OwCMPJPG4uJKUNl6sQA2gS86m3cyQSOyF7rVjTo1
         Cerw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778225248; x=1778830048;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CYWXjnyUn/GJRbc5n3pzVtMfi5XIFZFB+50xAVvCi1U=;
        b=VimfsP/QCf3bw8wgDrnCb780FqRg3EEJZqkq3nQFM0zdCLpictTSzE8TG3pihIwzRN
         QB76NZfqVpYP2suTcecMsMFV7e168RRrfyRvkW+MKCifL7xfVX8BIUxZKMgzP9ODLTLL
         xAy6qnTdxBG6P9+iZtkd2LdSRXiyxvco6fV9Ks1PkvAfl+KGiY7uWxNTgoGBNP1miL7e
         XCFJmZP8rWZU3D9MXxs2PeybUty904LipLYI2wjWJr4zq4sgXhZwvGhnQ6lPzYwvW0QU
         djU5Ou2WGmsXqkCoWR5AGvL+pZkHEx1Ww/1DEUL/nDdTGZK5Pi78gMVbuk1IhNhT93Zs
         cZIw==
X-Gm-Message-State: AOJu0YyroRJ170CWAUaTXGISZnONPE9s42d+qAoaFW2/AdOkD5hvfGNE
	i4IpyQzYqZxpfgbJnhG80LBD5bCX3gXr4XhzGQS72xHK10eEAQhxEtazhVUmEqSYkbyqrdbSpBB
	Rf+KTqgBFdjKMSYGmPec2uJ58knqZVLwj0pXdO4f6x5aUL2e2BWcC4YPYNoRrRHU3jw==
X-Gm-Gg: Acq92OHGTFwNpxK+zXXtdzj0Xbz9MYL1l2PInXkV+w+HyaVI/sR2C4xGIjJmK+qg1Xx
	J4StckyIJ8f249zJXA8uuQ9iuJe8FlTyN8epeWbL75PQihLLNPMI/PWJDwyTvXEu/LQN+/+DL/V
	hA1vRpesXFn95IQ3EAjf326nuU0NVD1Iy/htH9d015laIU561HXkRZEBe0mqpnKPYQ8Y1en/Os5
	snHBrUlI0z4rm6PsZaull+GTGGgG5xQKdiMnJbK5BUm9Liy9NV4CVBPG+qZs/I8l+wplKVdbDaD
	dK55Xa4nAVQfvKe76teUGU7cVZWcTL3kRTVYTnn+VQXGhcraf9FGDPBp6OpGT1Dhb/xYfj43I/G
	Bl0Tk04lvv0J++6yO+yVKxwO1uZNT6C6jswFpY+PimzvlBzHIlDaCfA==
X-Received: by 2002:a17:902:f78d:b0:2ba:ba5c:2524 with SMTP id d9443c01a7336-2baba5c26d4mr62580685ad.11.1778225247997;
        Fri, 08 May 2026 00:27:27 -0700 (PDT)
X-Received: by 2002:a17:902:f78d:b0:2ba:ba5c:2524 with SMTP id d9443c01a7336-2baba5c26d4mr62580395ad.11.1778225247344;
        Fri, 08 May 2026 00:27:27 -0700 (PDT)
Received: from [10.206.105.200] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1e6199csm15529705ad.55.2026.05.08.00.27.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 May 2026 00:27:27 -0700 (PDT)
Message-ID: <1c37ad66-4f85-86f4-fa34-06f150ad10d8@oss.qualcomm.com>
Date: Fri, 8 May 2026 12:57:20 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 12/16] media: iris: implement support for the Agatti
 platform
Content-Language: en-US
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
References: <20260507-iris-ar50lt-v1-0-d22cccedc3e2@oss.qualcomm.com>
 <20260507-iris-ar50lt-v1-12-d22cccedc3e2@oss.qualcomm.com>
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <20260507-iris-ar50lt-v1-12-d22cccedc3e2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: dWS4zkPy7Y1g64uxvKhv9IYT3zqpvtgc
X-Authority-Analysis: v=2.4 cv=VP3tWdPX c=1 sm=1 tr=0 ts=69fd9060 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=uPz0PI2pD1iAZVAWDUEA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDA3MyBTYWx0ZWRfX7abj72RbYTGl
 3R56TY8xdSE3zhQK3ldPV/yFXvuOcO4RuhSKPIj1O7dN3IFT83Wtg//Jlp322vNevKUphZwdihT
 DTi3VSLejLLBMyWGF215BrJgvQ4z/1rpHHzCOitsIDVi+SGF4r0Wy81c4NxIB+kUaFnqpGjI9mz
 rNiTuNFmMkLOSxYinQXn4D+FRPgQMqbJero+lHKpQ54AwHsuqa9pt2SS7b7VRsNjoPwGQqol4oC
 yUtczKCOrFuro7XsNhxSwmoyVmkFjFNhzWqyvVhc81BeH6OurpPPempab7YGOzyteD6Vqd6G12U
 2xHDqpDuLj6bgUJkySYqafsOZnBzdD+3hpwW/kGdEno4uRXQ2axwV79/F5eUfNXENCs5Uwj6hbp
 YFvomblBWarqmUKTO/2uVP7SFkbr5F8OP1Wtf2iMg8hFwId7ZfiQWJyEvMhPC6X0RM92s+JE74r
 YCtxJiEZBk6v4FZtnJQ==
X-Proofpoint-ORIG-GUID: dWS4zkPy7Y1g64uxvKhv9IYT3zqpvtgc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 malwarescore=0 clxscore=1015 suspectscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080073
X-Rspamd-Queue-Id: 1D8424F3000
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-60893-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.30:email,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action


On 5/7/2026 12:12 PM, Dmitry Baryshkov wrote:
> Port support for the AR50Lt video codec core (present for example on the
> Agatti platform) to the Iris driver. Unlike more recent cores this
> generation doesn't have the PIPE property (as it always has only one
> pipe). Also, unlike newer platforms, buffer sizes are requested from the
> firmware instead of being calculated by the driver.
>
> Co-developed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/Makefile          |   1 +
>  drivers/media/platform/qcom/iris/iris_hfi_gen1.c   | 227 +++++++++++++++++++++
>  .../platform/qcom/iris/iris_platform_common.h      |   6 +
>  .../platform/qcom/iris/iris_platform_vpu_ar50lt.c  | 111 ++++++++++
>  drivers/media/platform/qcom/iris/iris_probe.c      |   4 +
>  drivers/media/platform/qcom/iris/iris_vpu_buffer.c |  13 ++
>  drivers/media/platform/qcom/iris/iris_vpu_buffer.h |   1 +
>  7 files changed, 363 insertions(+)
>
> diff --git a/drivers/media/platform/qcom/iris/Makefile b/drivers/media/platform/qcom/iris/Makefile
> index f1b204b95694..bbd1f724963e 100644
> --- a/drivers/media/platform/qcom/iris/Makefile
> +++ b/drivers/media/platform/qcom/iris/Makefile
> @@ -14,6 +14,7 @@ qcom-iris-objs += iris_buffer.o \
>               iris_hfi_queue.o \
>               iris_platform_vpu2.o \
>               iris_platform_vpu3x.o \
> +             iris_platform_vpu_ar50lt.o \
>               iris_power.o \
>               iris_probe.o \
>               iris_resources.o \
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
> index 60f51a1ba941..39f757b6e0a3 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
> @@ -284,3 +284,230 @@ const struct iris_firmware_data iris_hfi_gen1_data = {
>  	.enc_ip_int_buf_tbl = sm8250_enc_ip_int_buf_tbl,
>  	.enc_ip_int_buf_tbl_size = ARRAY_SIZE(sm8250_enc_ip_int_buf_tbl),
>  };
> +
> +static struct platform_inst_fw_cap iris_inst_fw_cap_gen1_ar50lt_dec[] = {

const?

> +	{
> +		.cap_id = STAGE,
> +		.min = STAGE_1,
> +		.max = STAGE_2,
> +		.step_or_mask = 1,
> +		.value = STAGE_2,
> +		.hfi_id = HFI_PROPERTY_PARAM_WORK_MODE,
> +		.set = iris_set_stage,
> +	},
> +};
> +
> +static const struct platform_inst_fw_cap inst_fw_cap_gen1_ar50lt_enc[] = {
> +	{
> +		.cap_id = STAGE,
> +		.min = STAGE_1,
> +		.max = STAGE_2,
> +		.step_or_mask = 1,
> +		.value = STAGE_2,
> +		.hfi_id = HFI_PROPERTY_PARAM_WORK_MODE,
> +		.set = iris_set_stage,
> +	},
> +	{
> +		.cap_id = PROFILE_H264,
> +		.min = V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE,
> +		.max = V4L2_MPEG_VIDEO_H264_PROFILE_MULTIVIEW_HIGH,
> +		.step_or_mask = BIT(V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE) |
> +				BIT(V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_BASELINE) |
> +				BIT(V4L2_MPEG_VIDEO_H264_PROFILE_MAIN) |
> +				BIT(V4L2_MPEG_VIDEO_H264_PROFILE_HIGH) |
> +				BIT(V4L2_MPEG_VIDEO_H264_PROFILE_STEREO_HIGH) |
> +				BIT(V4L2_MPEG_VIDEO_H264_PROFILE_MULTIVIEW_HIGH),
> +		.value = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH,
> +		.hfi_id = HFI_PROPERTY_PARAM_PROFILE_LEVEL_CURRENT,
> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
> +		.set = iris_set_profile_level_gen1,
> +	},
> +	{
> +		.cap_id = PROFILE_HEVC,
> +		.min = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN,
> +		.max = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE,
> +		.step_or_mask = BIT(V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN) |
> +				BIT(V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE),
> +		.value = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN,
> +		.hfi_id = HFI_PROPERTY_PARAM_PROFILE_LEVEL_CURRENT,
> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
> +		.set = iris_set_profile_level_gen1,
> +	},
> +	{
> +		.cap_id = LEVEL_H264,
> +		.min = V4L2_MPEG_VIDEO_H264_LEVEL_1_0,
> +		.max = V4L2_MPEG_VIDEO_H264_LEVEL_4_2,
> +		.step_or_mask = BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_0) |
> +				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1B) |
> +				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_1) |
> +				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_2) |
> +				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_3) |
> +				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_2_0) |
> +				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_2_1) |
> +				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_2_2) |
> +				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_3_0) |
> +				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_3_1) |
> +				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_3_2) |
> +				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_4_0) |
> +				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_4_1) |
> +				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_4_2),
> +		.value = V4L2_MPEG_VIDEO_H264_LEVEL_1_0,
> +		.hfi_id = HFI_PROPERTY_PARAM_PROFILE_LEVEL_CURRENT,
> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
> +		.set = iris_set_profile_level_gen1,
> +	},
> +	{
> +		.cap_id = LEVEL_HEVC,
> +		.min = V4L2_MPEG_VIDEO_HEVC_LEVEL_1,
> +		.max = V4L2_MPEG_VIDEO_HEVC_LEVEL_4_1,
> +		.step_or_mask = BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_1) |
> +				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_2) |
> +				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_2_1) |
> +				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_3) |
> +				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_3_1) |
> +				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_4) |
> +				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_4_1),
> +		.value = V4L2_MPEG_VIDEO_HEVC_LEVEL_1,
> +		.hfi_id = HFI_PROPERTY_PARAM_PROFILE_LEVEL_CURRENT,
> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
> +		.set = iris_set_profile_level_gen1,
> +	},
> +	{
> +		.cap_id = HEADER_MODE,
> +		.min = V4L2_MPEG_VIDEO_HEADER_MODE_SEPARATE,
> +		.max = V4L2_MPEG_VIDEO_HEADER_MODE_JOINED_WITH_1ST_FRAME,
> +		.step_or_mask = BIT(V4L2_MPEG_VIDEO_HEADER_MODE_SEPARATE) |
> +				BIT(V4L2_MPEG_VIDEO_HEADER_MODE_JOINED_WITH_1ST_FRAME),
> +		.value = V4L2_MPEG_VIDEO_HEADER_MODE_JOINED_WITH_1ST_FRAME,
> +		.hfi_id = HFI_PROPERTY_CONFIG_VENC_SYNC_FRAME_SEQUENCE_HEADER,
> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
> +		.set = iris_set_header_mode_gen1,
> +	},
> +	{
> +		.cap_id = BITRATE,
> +		.min = BITRATE_MIN,
> +		.max = BITRATE_MAX_AR50LT,
> +		.step_or_mask = BITRATE_STEP,
> +		.value = BITRATE_DEFAULT_AR50LT,
> +		.hfi_id = HFI_PROPERTY_CONFIG_VENC_TARGET_BITRATE,
> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
> +			CAP_FLAG_DYNAMIC_ALLOWED,
> +		.set = iris_set_bitrate,
> +	},
> +	{
> +		.cap_id = BITRATE_MODE,
> +		.min = V4L2_MPEG_VIDEO_BITRATE_MODE_VBR,
> +		.max = V4L2_MPEG_VIDEO_BITRATE_MODE_CBR,
> +		.step_or_mask = BIT(V4L2_MPEG_VIDEO_BITRATE_MODE_VBR) |
> +				BIT(V4L2_MPEG_VIDEO_BITRATE_MODE_CBR),
> +		.value = V4L2_MPEG_VIDEO_BITRATE_MODE_VBR,
> +		.hfi_id = HFI_PROPERTY_PARAM_VENC_RATE_CONTROL,
> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
> +		.set = iris_set_bitrate_mode_gen1,
> +	},
> +	{
> +		.cap_id = FRAME_SKIP_MODE,
> +		.min = V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_DISABLED,
> +		.max = V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_BUF_LIMIT,
> +		.step_or_mask = BIT(V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_DISABLED) |
> +				BIT(V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_BUF_LIMIT),
> +		.value = V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_DISABLED,
> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
> +	},
> +	{
> +		.cap_id = FRAME_RC_ENABLE,
> +		.min = 0,
> +		.max = 1,
> +		.step_or_mask = 1,
> +		.value = 1,
> +	},
> +	{
> +		.cap_id = GOP_SIZE,
> +		.min = 0,
> +		.max = (1 << 16) - 1,
> +		.step_or_mask = 1,
> +		.value = 30,
> +		.set = iris_set_u32
> +	},
> +	{
> +		.cap_id = ENTROPY_MODE,
> +		.min = V4L2_MPEG_VIDEO_H264_ENTROPY_MODE_CAVLC,
> +		.max = V4L2_MPEG_VIDEO_H264_ENTROPY_MODE_CABAC,
> +		.step_or_mask = BIT(V4L2_MPEG_VIDEO_H264_ENTROPY_MODE_CAVLC) |
> +				BIT(V4L2_MPEG_VIDEO_H264_ENTROPY_MODE_CABAC),
> +		.value = V4L2_MPEG_VIDEO_H264_ENTROPY_MODE_CAVLC,
> +		.hfi_id = HFI_PROPERTY_PARAM_VENC_H264_ENTROPY_CONTROL,
> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
> +		.set = iris_set_entropy_mode_gen1,
> +	},
> +	{
> +		.cap_id = MIN_FRAME_QP_H264,
> +		.min = MIN_QP_8BIT_AR50LT,
> +		.max = MAX_QP,
> +		.step_or_mask = 1,
> +		.value = MIN_QP_8BIT_AR50LT,
> +		.hfi_id = HFI_PROPERTY_PARAM_VENC_SESSION_QP_RANGE_V2,
> +		.flags = CAP_FLAG_OUTPUT_PORT,
> +		.set = iris_set_qp_range,
> +	},
> +	{
> +		.cap_id = MIN_FRAME_QP_HEVC,
> +		.min = MIN_QP_8BIT_AR50LT,
> +		.max = MAX_QP_HEVC,
> +		.step_or_mask = 1,
> +		.value = MIN_QP_8BIT_AR50LT,
> +		.hfi_id = HFI_PROPERTY_PARAM_VENC_SESSION_QP_RANGE_V2,
> +		.flags = CAP_FLAG_OUTPUT_PORT,
> +		.set = iris_set_qp_range,
> +	},
> +	{
> +		.cap_id = MAX_FRAME_QP_H264,
> +		.min = MIN_QP_8BIT_AR50LT,
> +		.max = MAX_QP,
> +		.step_or_mask = 1,
> +		.value = MAX_QP,
> +		.hfi_id = HFI_PROPERTY_PARAM_VENC_SESSION_QP_RANGE_V2,
> +		.flags = CAP_FLAG_OUTPUT_PORT,
> +		.set = iris_set_qp_range,
> +	},
> +	{
> +		.cap_id = MAX_FRAME_QP_HEVC,
> +		.min = MIN_QP_8BIT_AR50LT,
> +		.max = MAX_QP_HEVC,
> +		.step_or_mask = 1,
> +		.value = MAX_QP_HEVC,
> +		.hfi_id = HFI_PROPERTY_PARAM_VENC_SESSION_QP_RANGE_V2,
> +		.flags = CAP_FLAG_OUTPUT_PORT,
> +		.set = iris_set_qp_range,
> +	},
> +};
> +
> +static const u32 iris_hfi_gen2_ar50lt_dec_ip_int_buf_tbl[] = {
> +	BUF_BIN,
> +	BUF_SCRATCH_1,
> +};
> +
> +const struct iris_firmware_data iris_hfi_gen1_ar50lt_data = {
> +	.init_hfi_ops = &iris_hfi_gen1_sys_ops_init,
> +
> +	.inst_fw_caps_dec = iris_inst_fw_cap_gen1_ar50lt_dec,
> +	.inst_fw_caps_dec_size = ARRAY_SIZE(iris_inst_fw_cap_gen1_ar50lt_dec),
> +	.inst_fw_caps_enc = inst_fw_cap_gen1_ar50lt_enc,
> +	.inst_fw_caps_enc_size = ARRAY_SIZE(inst_fw_cap_gen1_ar50lt_enc),
> +
> +	.dec_input_config_params_default =
> +		sm8250_vdec_input_config_param_default,
> +	.dec_input_config_params_default_size =
> +		ARRAY_SIZE(sm8250_vdec_input_config_param_default),
> +	.enc_input_config_params = sm8250_venc_input_config_param,
> +	.enc_input_config_params_size =
> +		ARRAY_SIZE(sm8250_venc_input_config_param),
> +
> +	.dec_ip_int_buf_tbl = iris_hfi_gen2_ar50lt_dec_ip_int_buf_tbl,
> +	.dec_ip_int_buf_tbl_size = ARRAY_SIZE(iris_hfi_gen2_ar50lt_dec_ip_int_buf_tbl),
> +	.dec_op_int_buf_tbl = sm8250_dec_op_int_buf_tbl,
> +	.dec_op_int_buf_tbl_size = ARRAY_SIZE(sm8250_dec_op_int_buf_tbl),
> +
> +	.enc_ip_int_buf_tbl = sm8250_enc_ip_int_buf_tbl,
> +	.enc_ip_int_buf_tbl_size = ARRAY_SIZE(sm8250_enc_ip_int_buf_tbl),
> +};
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index 4a0895bf5720..f9763ea51c53 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -29,6 +29,10 @@ struct iris_inst;
>  #define DEFAULT_QP				20
>  #define BITRATE_DEFAULT			20000000
>  
> +#define BITRATE_MAX_AR50LT		100000000
> +#define BITRATE_DEFAULT_AR50LT		20000000
> +#define MIN_QP_8BIT_AR50LT		0
> +
>  enum stage_type {
>  	STAGE_1 = 1,
>  	STAGE_2 = 2,
> @@ -41,8 +45,10 @@ enum pipe_type {
>  };
>  
>  extern const struct iris_firmware_data iris_hfi_gen1_data;
> +extern const struct iris_firmware_data iris_hfi_gen1_ar50lt_data;
>  extern const struct iris_firmware_data iris_hfi_gen2_data;
>  
> +extern const struct iris_platform_data qcm2290_data;
>  extern const struct iris_platform_data qcs8300_data;
>  extern const struct iris_platform_data sc7280_data;
>  extern const struct iris_platform_data sm8250_data;
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu_ar50lt.c b/drivers/media/platform/qcom/iris/iris_platform_vpu_ar50lt.c
> new file mode 100644
> index 000000000000..76bebe012bd8
> --- /dev/null
> +++ b/drivers/media/platform/qcom/iris/iris_platform_vpu_ar50lt.c
> @@ -0,0 +1,111 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#include "iris_core.h"
> +#include "iris_ctrls.h"
> +#include "iris_hfi_gen2.h"
> +#include "iris_hfi_gen2_defines.h"
> +#include "iris_platform_common.h"
> +#include "iris_vpu_buffer.h"
> +#include "iris_vpu_common.h"
> +
> +#define WRAPPER_INTR_STATUS_A2HWD_BMSK		0x10
> +
> +const struct iris_firmware_desc iris_vpu_ar50lt_p1_gen1_s6_desc = {
> +	.firmware_data = &iris_hfi_gen1_ar50lt_data,
> +	.get_vpu_buffer_size = iris_vpu_ar50lt_gen1_buf_size,
> +	.fwname = "qcom/venus-6.0/venus.mbn",
> +};
> +
> +static const u32 iris_fmts_ar50lt_dec[] = {
> +	[IRIS_FMT_H264] = V4L2_PIX_FMT_H264,
> +	[IRIS_FMT_HEVC] = V4L2_PIX_FMT_HEVC,
> +	[IRIS_FMT_VP9] = V4L2_PIX_FMT_VP9,
> +};
> +
> +static const struct bw_info iris_bw_table_dec_ar50lt[] = {
> +	{ ((1920 * 1080) / 256) * 60, 1564000, },
> +	{ ((1920 * 1080) / 256) * 30,  791000, },
> +	{ ((1280 * 720) / 256) * 60,   688000, },
> +	{ ((1280 * 720) / 256) * 30,   347000, },
> +};
> +
> +static const struct icc_info iris_icc_info_ar50lt[] = {
> +	{ "cpu-cfg",    1000, 1000     },
> +	{ "video-mem",  1000, 6500000  },
> +};
> +
> +static const char * const iris_pmdomain_table_ar50lt[] = { "venus", "vcodec0" };
> +
> +static const char * const iris_opp_pd_table_ar50lt[] = { "cx" };
> +
> +static const struct platform_clk_data iris_clk_table_ar50lt[] = {
> +	{IRIS_CTRL_CLK,    "core"         },
> +	{IRIS_AXI_CLK,     "iface"        },
> +	{IRIS_AHB_CLK,     "bus"          },
> +	{IRIS_HW_CLK,      "vcodec0_core" },
> +	{IRIS_HW_AHB_CLK,  "vcodec0_bus"  },
> +	{IRIS_THROTTLE_CLK, "throttle"    },
> +};
> +
> +static const char * const iris_opp_clk_table_ar50lt[] = {
> +	"vcodec0_core",
> +	NULL,
> +};
> +
> +static const struct tz_cp_config tz_cp_config_ar50lt[] = {
> +	{
> +		.cp_start = 0,
> +		.cp_size = 0x25800000,
> +		.cp_nonpixel_start = 0x01000000,
> +		.cp_nonpixel_size = 0x24800000,
> +	},
> +};
> +
> +static struct platform_inst_caps platform_inst_cap_ar50lt = {
> +	.min_frame_width = 128,
> +	.max_frame_width = 1920,
> +	.min_frame_height = 128,
> +	.max_frame_height = 1920,
> +	.max_mbpf = (1920 * 1088) / 256,
> +	.mb_cycles_vpp = 440,
> +	.mb_cycles_fw = 733003,
> +	.mb_cycles_fw_vpp = 225975,
> +	.num_comv = 0,
> +	.max_frame_rate = 120,
> +	.max_operating_rate = 120,
> +};
> +
> +const struct iris_platform_data qcm2290_data = {
> +	.firmware_desc_gen1 = &iris_vpu_ar50lt_p1_gen1_s6_desc,
> +	.vpu_ops = &iris_vpu_ar50lt_ops,
> +	.icc_tbl = iris_icc_info_ar50lt,
> +	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_ar50lt),
> +	.bw_tbl_dec = iris_bw_table_dec_ar50lt,
> +	.bw_tbl_dec_size = ARRAY_SIZE(iris_bw_table_dec_ar50lt),
> +	.pmdomain_tbl = iris_pmdomain_table_ar50lt,
> +	.pmdomain_tbl_size = ARRAY_SIZE(iris_pmdomain_table_ar50lt),
> +	.opp_pd_tbl = iris_opp_pd_table_ar50lt,
> +	.opp_pd_tbl_size = ARRAY_SIZE(iris_opp_pd_table_ar50lt),
> +	.clk_tbl = iris_clk_table_ar50lt,
> +	.clk_tbl_size = ARRAY_SIZE(iris_clk_table_ar50lt),
> +	.opp_clk_tbl = iris_opp_clk_table_ar50lt,
> +	/* Upper bound of DMA address range */
> +	.dma_mask = 0xe0000000 - 1,
> +	.inst_iris_fmts = iris_fmts_ar50lt_dec,
> +	.inst_iris_fmts_size = ARRAY_SIZE(iris_fmts_ar50lt_dec),
> +	.inst_caps = &platform_inst_cap_ar50lt,
> +	.tz_cp_config_data = tz_cp_config_ar50lt,
> +	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_ar50lt),
> +	.num_vpp_pipe = 1,
> +	.no_rpmh = true,
> +	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
> +	.icc_ib_multiplier = 2,
> +	.max_session_count = 8,
> +	.max_core_mbpf = ((1920 * 1088) / 256) * 4,
> +	/* Concurrency: 1080p@30 decode + 1080p@30 encode */
> +	/* Concurrency: 3 * 1080p@30 decode */
> +	.max_core_mbps = (((1920 * 1088) / 256) * 90),
> +};
> diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
> index 7211d520eda3..070e09406d89 100644
> --- a/drivers/media/platform/qcom/iris/iris_probe.c
> +++ b/drivers/media/platform/qcom/iris/iris_probe.c
> @@ -356,6 +356,10 @@ static const struct dev_pm_ops iris_pm_ops = {
>  };
>  
>  static const struct of_device_id iris_dt_match[] = {
> +	{
> +		.compatible = "qcom,qcm2290-venus",
> +		.data = &qcm2290_data,
> +	},
>  	{
>  		.compatible = "qcom,qcs8300-iris",
>  		.data = &qcs8300_data,
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
> index 9270422c1601..125fb2d6960d 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
> @@ -2135,6 +2135,19 @@ u32 iris_vpu4x_buf_size(struct iris_inst *inst, enum iris_buffer_type buffer_typ
>  	return size;
>  }
>  
> +u32 iris_vpu_ar50lt_gen1_buf_size(struct iris_inst *inst, enum iris_buffer_type buffer_type)
> +{
> +	const struct iris_hfi_session_ops *hfi_ops = inst->hfi_session_ops;
> +	int ret;
> +
> +	/* return 0 on error to let the driver cope */
> +	ret = hfi_ops->session_get_property(inst, HFI_PROPERTY_CONFIG_BUFFER_REQUIREMENTS);
> +	if (ret)
> +		return 0;
> +
> +	return inst->buffers[buffer_type].size;
> +}
> +
>  static u32 internal_buffer_count(struct iris_inst *inst,
>  				 enum iris_buffer_type buffer_type)
>  {
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.h b/drivers/media/platform/qcom/iris/iris_vpu_buffer.h
> index 8c0d6b7b5de8..1d07137c70cd 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.h
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.h
> @@ -288,6 +288,7 @@ static inline u32 size_av1d_qp(u32 frame_width, u32 frame_height)
>  u32 iris_vpu_buf_size(struct iris_inst *inst, enum iris_buffer_type buffer_type);
>  u32 iris_vpu33_buf_size(struct iris_inst *inst, enum iris_buffer_type buffer_type);
>  u32 iris_vpu4x_buf_size(struct iris_inst *inst, enum iris_buffer_type buffer_type);
> +u32 iris_vpu_ar50lt_gen1_buf_size(struct iris_inst *inst, enum iris_buffer_type buffer_type);
>  int iris_vpu_buf_count(struct iris_inst *inst, enum iris_buffer_type buffer_type);
>  
>  #endif
>

