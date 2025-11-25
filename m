Return-Path: <linux-media+bounces-47686-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C7CC83FC1
	for <lists+linux-media@lfdr.de>; Tue, 25 Nov 2025 09:30:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AC3B63A448E
	for <lists+linux-media@lfdr.de>; Tue, 25 Nov 2025 08:30:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 910442D877D;
	Tue, 25 Nov 2025 08:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L8DNJsBf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OAfZKzb1"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E7D518CC13
	for <linux-media@vger.kernel.org>; Tue, 25 Nov 2025 08:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764059407; cv=none; b=RXskHrsH669J0eDUm4dBfbZtspPazok7SRQ8YvhbEhSZZIdVWbi7mEK5UxeJaseDrX+cStZ7J9U46aMPBP/TTxJ6ckQL1ZF6/dh9EiqeSK1g+2JPScdWpQLxe9dux6WWskRZLAUgy9bqW4U9Uuew3tmT34xQ7A4XSnkMKUTnr7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764059407; c=relaxed/simple;
	bh=1WGnCPpqJeTAwS8EdLDCPzsN4OcItdcygFfMHCjnnbE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mXxsO8ZyobufitAipyFxTOJJ+7moxwugVFPqo3eObYYuyREywsoNiP/g/JZT3kkz9F4DnB3f6mlqDg2dE6aySQq9KZsa5FU4vqaUHLZveuUkv3Y08qqrtKPye+TI1ZwRjW7ZkQMtg4jLLVjUNsbCE2lV5epHD/tmOonVKAn9tS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L8DNJsBf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OAfZKzb1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AP2gts01848032
	for <linux-media@vger.kernel.org>; Tue, 25 Nov 2025 08:30:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aN/ITqgje9DsJoOFZoFInVa0RQ6d3+W13hTAW9KIbbM=; b=L8DNJsBfT0+qDKh2
	qtmTk/43Vaq3bU1AIrvj+yYg6R0sccOrux3jCOUMOgITb+aOiwAHIh9V1OMD7rqA
	nkJ8hqsQMw6LLuKBA0qdMEOngOjDjbU6Yq9FZ7yPeIRbYS0FxC2zVM0Bsi7szLJU
	FpT7qsnlHsankM/SFhX5IgHEaMB9ePdkPQ4BNgI74bZMX9r0hkULy8gyqDOawWDF
	VsYnOn1kXq8RWh8/4q2oSg7FTZXrO+qSCQA3HslCAE67N9nhNT0Ab1MUCE2PkbdC
	WmDTDe83btf5AC6iTfxhDJTySzHxHHSTMLumFy/VXTIGJLehABSYLu+tQt6RBpzo
	WHRp8Q==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4amu6qabdb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 25 Nov 2025 08:30:02 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-343daf0f38aso5461030a91.3
        for <linux-media@vger.kernel.org>; Tue, 25 Nov 2025 00:30:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764059402; x=1764664202; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aN/ITqgje9DsJoOFZoFInVa0RQ6d3+W13hTAW9KIbbM=;
        b=OAfZKzb1KPeGG1zKbXKtWtLexCzgRef6JLvK7MJneL1cREmkJfnkGBYO72A9BwNc/p
         LATTMJmPTN3R8H//5U7AWlA+iqeZcQWH1qJKZWPTL8MvP23tQpjOCttP/I9RfnDndv4S
         TYPhjZE88GnT+rX33d+pCNErHINUFShkoP321pJvovC8TIzPSfBj7SYDfVfpqaGTn0om
         GX285mVZXeGyQ/372+tmrTw6EEIPJmDDKxWhSzi3sZqatRZbmEXTBpzLj9N750oFNiFr
         v4UYjNXZXEHUtMUNNMGT95eM7DQJHjiQ+8mKdj2UvnxPwRkfv4hm/MI1jMGMoYrwY1Qd
         W3ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764059402; x=1764664202;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aN/ITqgje9DsJoOFZoFInVa0RQ6d3+W13hTAW9KIbbM=;
        b=jDxAc1pbzjVu9o6AG9SFJrUN6BJbYGRoF8p0+oumIykxxww8b7OrxAMD64AfTu9N+K
         v1tryeue3Vb+u4ufFe/zqNr0nj6ILT77JsMQg21/cn4afl2Fsz6tUddJjcTLNBfMM3pF
         ewFIb/tqkkHIL4YC6pxNBKr3+NfvRuTntBDon5XZh22dDnuMCQu9yQ0G7y5xX2p2tP/g
         +PZx5P/QDfZy62P5+mmfJfgkLOR8GKoU/e8QHhXUccq6bkX9SaONS8GlRvHtzu+ZMRST
         YktfdDEELBlTs22B5poJl7z/+YVsoKJk75w4aptmZltYbMaV0HfuP6voLXLbGadMs5ma
         5JYA==
X-Gm-Message-State: AOJu0YzwnvLj9+mMoJTipbjnFI6+wTj3fTalmKuSswbHMe0rbkX/CBT0
	Yf8qBdFyg7tnq6Ps2AgL0y2o2ENWJpgzk/NiJk0DdeTXqrOgwb45aR1cM5k7vpCVnc1cLp1X2a7
	DvgYBD6PcoaikcRUufeuzGSB/dodkCWxyxvb7sFMLD3z+77ajC1CVc0u2okyBNC239Q==
X-Gm-Gg: ASbGncuSJtahdN5/5MdJhA0DW5e6TDSwP0jz0a/WLTcL0mYGoDViBb/78MNoNzgB7il
	0U4MSwcVOI4nn86SwX5E7TKZsgcV2uQnAzYo/WW0Sbi9NUKAxXS/3gGIgepNML6rXP+0yRMUfIk
	Dnz+g7ItriYGuzaPMNZTfoNtSFOxxZT5Nac5z7SEpHr3D8ShNT2nBnrDfIT/ama0GoqEkUQD3PP
	h/+54naFj7Vg+He5V0wertRQQc9LaMnusDff0g+zv26r8ptLzC2GplUVgr6epJxYV4Jh+iaGaEB
	Lm/t7Nr7uzcTF/yUapUqUw2GoUV6F413cSOtDE77tZFgKwz0HJHo8ZOAFRn4Y8grKA/yvb8AQzH
	hcoLXoM5smpUm0DaUmQJhfzw29THDQ5Zk9srIX52tqw==
X-Received: by 2002:a17:90b:1b07:b0:32e:e18a:3691 with SMTP id 98e67ed59e1d1-3475ed7d924mr1895478a91.35.1764059401919;
        Tue, 25 Nov 2025 00:30:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG++wtm47j635PYUJgwWeknG9+9pitqDlWstYuhsyrLEo7OawPfrMHpHKk0KUPh1Cj1arWeKQ==
X-Received: by 2002:a17:90b:1b07:b0:32e:e18a:3691 with SMTP id 98e67ed59e1d1-3475ed7d924mr1895457a91.35.1764059401369;
        Tue, 25 Nov 2025 00:30:01 -0800 (PST)
Received: from [10.0.0.3] ([106.222.230.111])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3472692ee4csm15711134a91.12.2025.11.25.00.29.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Nov 2025 00:30:00 -0800 (PST)
Message-ID: <e409f318-cd50-5a7d-7f46-a928ea544597@oss.qualcomm.com>
Date: Tue, 25 Nov 2025 13:59:56 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] media: venus: assign unique bus_info strings for encoder
 and decoder
Content-Language: en-US
To: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        vikash.garodia@oss.qualcomm.com, dikshita.agarwal@oss.qualcomm.com,
        bod@kernel.org, mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251121184306.218169-1-jorge.ramirez@oss.qualcomm.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20251121184306.218169-1-jorge.ramirez@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Uh6efLdEgScuqi_lxMz7Rmf_2sVpRNJ9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI1MDA2OCBTYWx0ZWRfX5JSLd+h0x74V
 PAJXAH4RZQ3DOC2v/MI1rRi5Z5/svgFN8zdP67rpky+X8JWBcLPQE6R0ckThRU4xugFaD+llaX0
 0/WmQwRBBPi3ecyT697StBfrX8D9XW46FG/f8uLeLaAFxwfzYsZNM8OmTnwMxzRtLeaybXXyisw
 ZtmAXztjSbAJq9zPuE+Qom/goNAyQbsvY7q0dXKjcT+mWeLOonPmDJpKmf3Ty31h2FHT/s/NMSA
 w5teH+FMDtrmmlY3ohTWGIUqrStbb5cvvvSRUQau2Se4oL8hH/vVGYbqv27oPFi3F60B1Yg/yYY
 SumoZbEfrGizx/Jc85CqEgjEwjEayqQpjRfWf4Xbk/J7xqOizW4QoZyu6YMOttDm0jigoVWRVi0
 5l9bIemUQC9e9V/nQ0Hr4SksAzw9KA==
X-Proofpoint-GUID: Uh6efLdEgScuqi_lxMz7Rmf_2sVpRNJ9
X-Authority-Analysis: v=2.4 cv=S6PUAYsP c=1 sm=1 tr=0 ts=6925690a cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=12FOtvgV4D2gsqRYbU+y8g==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=EtG1iFGsEZ1cC1LttdMA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511250068



On 11/22/2025 12:13 AM, Jorge Ramirez-Ortiz wrote:
> The Venus encoder and decoder video devices currently report the same
> bus_info string ("platform:qcom-venus").
> 
> Assign unique bus_info identifiers by appending ":dec" and ":enc" to the
> parent device name. With this change v4l2-ctl will display two separate
> logical devices
> 
> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/venus/vdec.c | 5 +++++
>  drivers/media/platform/qcom/venus/venc.c | 5 +++++
>  2 files changed, 10 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
> index 4a6641fdffcf..63f6ae1ff6ac 100644
> --- a/drivers/media/platform/qcom/venus/vdec.c
> +++ b/drivers/media/platform/qcom/venus/vdec.c
> @@ -433,9 +433,14 @@ vdec_g_selection(struct file *file, void *fh, struct v4l2_selection *s)
>  static int
>  vdec_querycap(struct file *file, void *fh, struct v4l2_capability *cap)
>  {
> +	struct venus_inst *inst = to_inst(file);
> +	struct venus_core *core = inst->core;
> +
>  	strscpy(cap->driver, "qcom-venus", sizeof(cap->driver));
>  	strscpy(cap->card, "Qualcomm Venus video decoder", sizeof(cap->card));
>  	strscpy(cap->bus_info, "platform:qcom-venus", sizeof(cap->bus_info));
> +	snprintf(cap->bus_info, sizeof(cap->bus_info),
> +		 "platform:%s:dec", dev_name(core->dev));

Is there a reason to keep both strscpy() and snprintf() for cap->bus_info?
The second call to snprintf() seems to overwrite the value set by
strscpy(), making the first assignment redundant. Would it be cleaner to
remove the strscpy() line and rely solely on snprintf()?

Thanks,
Dikshita
>  
>  	return 0;
>  }
> diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
> index b478b982a80d..520689f5533d 100644
> --- a/drivers/media/platform/qcom/venus/venc.c
> +++ b/drivers/media/platform/qcom/venus/venc.c
> @@ -144,9 +144,14 @@ static int venc_v4l2_to_hfi(int id, int value)
>  static int
>  venc_querycap(struct file *file, void *fh, struct v4l2_capability *cap)
>  {
> +	struct venus_inst *inst = to_inst(file);
> +	struct venus_core *core = inst->core;
> +
>  	strscpy(cap->driver, "qcom-venus", sizeof(cap->driver));
>  	strscpy(cap->card, "Qualcomm Venus video encoder", sizeof(cap->card));
>  	strscpy(cap->bus_info, "platform:qcom-venus", sizeof(cap->bus_info));
> +	snprintf(cap->bus_info, sizeof(cap->bus_info),
> +		 "platform:%s:enc", dev_name(core->dev));
>  
>  	return 0;
>  }

