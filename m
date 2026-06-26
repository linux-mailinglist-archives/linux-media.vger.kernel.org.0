Return-Path: <linux-media+bounces-65716-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +BqZN5lwPmqGGAkAu9opvQ
	(envelope-from <linux-media+bounces-65716-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2026 14:29:13 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A1486CCFCC
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2026 14:29:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=hiDHSZ8T;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="hYTY/aV7";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65716-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-65716-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CDA33301AA41
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2026 12:29:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC4323F4DF5;
	Fri, 26 Jun 2026 12:29:04 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAA9E3EB119
	for <linux-media@vger.kernel.org>; Fri, 26 Jun 2026 12:29:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782476944; cv=none; b=KcVcuuixq7PXbu7D0ggClOD3i6B5cQBz/Sau6yoP1rfLlfTD/1/QR692uaIOlYJfRf+29owirDENAlXj6bBiwvv/cu/AZBDtARnw3ColLwwbaYW5VC4CU7JCoiQQGgBpcFzhSxpDfFqkxSzPsnHrkzmcRprM6HCcRLbAb/4NUfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782476944; c=relaxed/simple;
	bh=kUgSR5KsygQYEF2nDWtkEb1J7x+iJgGLlPzbWfR/bkA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SGXhMNzsPNHeso9Jbt8bEttg1LMKPF3oRhwbN0FIqT2ghA4rxSkedSpjrLxmutb1WbOmt3KBUKTzWDHMo4DdPw+DvXtAM+BBd2w7kTwPAjVY2kLAogwzELM2gSyqUgtALkes9PK+IVpUfVq0azkXbkZWTIt8KH7pZvZstUb6Wc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hiDHSZ8T; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hYTY/aV7; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65QAcbew858102
	for <linux-media@vger.kernel.org>; Fri, 26 Jun 2026 12:29:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C3NUBPTaw/zfNyp/TidQS/rVhEmjEuvn75w3fbALFks=; b=hiDHSZ8TsZdBEkfx
	kv//5cKhg/MwiRcjl9eqi0GX7S5vr9n6GcNz2uJXbMeZfxWME6NUz7VWLhOmcy30
	Nt6twN64oao05MAlDeLfWLPZTW1n4KNeuZDK8WNxIMBIky0Vox9nYuCFFuHB4L1y
	mjaXlmRkO/L0lYzZ1rhgn6RnO+aPPFeCDPhIm4GlNrA2NDGEk1QhEHlXMS248vUc
	/htihulAB41jzYDgNAdkUU8wkwQOONrO/YKCz66UqS7fMX73An0in79Er6f0DYm8
	Ak89z7MbGgVrCohb/gZz6p6om1c74CzEuG5g4DcnmgWImEA7jTpYbH/quhFJlG5r
	BxZuzg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f1p2trsau-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 26 Jun 2026 12:29:01 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30bcbb34e57so1074132eec.1
        for <linux-media@vger.kernel.org>; Fri, 26 Jun 2026 05:29:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782476940; x=1783081740; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C3NUBPTaw/zfNyp/TidQS/rVhEmjEuvn75w3fbALFks=;
        b=hYTY/aV7U3lFXSoCKE+l+9xy8cDjEcpdVMTZ7wHbtPGGuLt/d7BRJe1+rV8HYYuAEK
         YDsoVdoPWua3KwYNU2C66Kmg0scyWD1TGW/bmu1hd61NPemTbIWUn3CkiMlVQk2rTBJN
         ntJ2ihmCnj7I700F4DgNSgU5xsFV0wmvhNJ1/xOCndbNBGLdNo5o8O5vUqyyve56bYTx
         uqdioqUg3XGxLWirObxymcL4Scvy5tgrVNDhiJPR1Vs4DkByYwjnk0Q1DZsBXQRLiVV5
         GO/FcP1HVK9oKp4BpTkyldqCdTy3pu7rQlxdRuROdctrLqZNiexW5z6sGMsY5y+P/V9u
         DcKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782476940; x=1783081740;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C3NUBPTaw/zfNyp/TidQS/rVhEmjEuvn75w3fbALFks=;
        b=Y62TIDOYr4TtzTIKNPBewRQYVCZaEfh8QJBNhC76xBxHt5karoQGT94Z/Aq0dt4egp
         +5JjeAJj4iVxyZD1CWg0ZOgDQx8Rwq1i+D7F4MIRWED60ygQob9jHXzIUzLJRGG8rpGi
         O6o1kTy6DmAE6Z9pVvtcFSlCl3mxvP/F9Or/PAEWA0x8nGpr5bcDa9sOXKmrh+2g6TD7
         KAW4y2kxcg8KCnw5B0+ivzcnEHuR4qSssHZYffISKRz3So+eaayJJpmXX8RkPGKxcnlG
         IkDykjjicOkGcHAar/CNfwDYgId850HyC9jAaoD5J2lV3s6r/L+jZjbA/qkAscxUy8Uq
         fdcg==
X-Gm-Message-State: AOJu0YwZB4legXoZM7zRS6KBySpVykADii7WIsI1mSCqGCRiBIBDAT2O
	eaEyhjOs0f3fpm6U3NRG3ufrBWiZbII1U6AANdJgfT/ImlvkAu296VDKZPjQGOwyiEFMPX0gcCj
	StPyktT+PL6SZwoSCwpfURVey0JrF74bb6ZaRufkPsiOIzJv4iL2aZzAefiLdivCkQ6Zj8+ZLfg
	==
X-Gm-Gg: AfdE7cm5ZFPtJWL0deCd680FbPXoljXj1sqGTi94vmmWQ9PC4y1XUS8815hHl4efI/6
	nnuUUuZgo/JbABI90N3fDFRRiqJ76QhMYgE29dRJav3oAbHiEU8f4+d+Nzpkea7djzW7mhFJRBf
	1ycI4Mh5muoN7CkzORREjk387IFoR+tWxu0LU+bFDE+eD+zqmHAcATZQLcXAnq6oXNQkEesuc3o
	Aod/dcwgecHmqCtoansnteJse6BlLl0DNNRzbuwDwPmBSF6y0BePfgeOvsoQp1+OEKz8cB8NIHP
	26ss66aMrtqOeVJrt5BYvXxyK+GRMbaEcsfOvGC54GhpIxX3EHp5AuQ5KCNyCL5WOoktcnUzg/y
	+tI4sVc86V7E9REmLnzSw1KppKUMp6Wzfqog7+xTVkyY=
X-Received: by 2002:a05:7300:e410:b0:30c:25fb:d28f with SMTP id 5a478bee46e88-30c84d81ba5mr5997692eec.25.1782476940397;
        Fri, 26 Jun 2026 05:29:00 -0700 (PDT)
X-Received: by 2002:a05:7300:e410:b0:30c:25fb:d28f with SMTP id 5a478bee46e88-30c84d81ba5mr5997669eec.25.1782476939753;
        Fri, 26 Jun 2026 05:28:59 -0700 (PDT)
Received: from [10.206.103.83] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c52c591sm24010255eec.7.2026.06.26.05.28.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jun 2026 05:28:59 -0700 (PDT)
Message-ID: <766404b0-2252-47e0-b728-be9985067569@oss.qualcomm.com>
Date: Fri, 26 Jun 2026 17:58:53 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Add support for multi_slice in iris encoder
To: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260428-iris_multi_slice-v1-1-92c327619ebf@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260428-iris_multi_slice-v1-1-92c327619ebf@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDEwMiBTYWx0ZWRfXyywVkSUds+L6
 q26wkVk6kO4+HgoTHVNNlOGG2qlVZjuUxt2sIbeHW+H41XuE6JgIkW6Ut9YX6EyFgQBq9bcrfVq
 cIRBENnWKrPeb7LF0iKYta0prrAjiXA=
X-Proofpoint-GUID: n5juo9A6rmYxEUv4KTntlH_lLFLgrxDf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDEwMiBTYWx0ZWRfXyZMzlQ3Kdrcm
 yXT3WcYMr9xJNlZD8dTEra6JggTZwFfMBww/sZMN0mGvcoMr0XhBcEak1Blz8rI32AqG2oEo2eA
 PA21EJDaCKPhXT2tgQdZR9jJuZDI7bj0VGYJ4kQtaU1LlGOPkuxLRwyqCE8ZukrwDmE0dZTG67k
 AZR82AVSfvPzIb+n3CLzzAj4eWna0Mx+XW4RAB4ruIFa5Dp75nV15L5nagX0WhZG4MqdhBu6KKI
 uhz3YxGs4z/pUOAbpnEXP/fh8XIXf+oQIHsQHJFkckIT/lYiv49q3busywyYIsbwzbKGdY+Pf0B
 uzvdMSaxGwHW+zVI6KZWAz+bsaYv5G4Xg9eWr7wcqNjXa3hij9Tf2ZrDdB+PEXikPAwrkSw4F8F
 QNEwPZZ/0RlUKFs+D3QOoO7buGwPYIHiUnBYjfYq2m8NmiZFuq99Xm/DJve/t11vO7GiTk7wens
 FutCL7c9HUjFRiTBq7w==
X-Proofpoint-ORIG-GUID: n5juo9A6rmYxEUv4KTntlH_lLFLgrxDf
X-Authority-Analysis: v=2.4 cv=IM8yzAvG c=1 sm=1 tr=0 ts=6a3e708d cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=25tEQDi2QS7NWzQBuUsA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_03,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606260102
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-65716-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:sachin.garg@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3A1486CCFCC


On 4/28/2026 12:44 PM, Sachin Kumar Garg wrote:
> Add multi-slice encoding support with MAX_MB and MAX_BYTES modes.
> 
> Clients can enable slice mode using V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MODE
> control and configure slice size via V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MAX_MB
> or V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MAX_BYTES controls.
> 
> Signed-off-by: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
> ---
> This series adds the support for multi slice feature in the

series ?

> Qualcomm Iris driver.
> 
> Multi-slice mode allows encoding a single frame into multiple slices,
> which can improve error resilience and enable parallel processing.
> The feature supports two slice modes:
> - MAX_MB mode: Slices are created based on macroblock count, controlled
>    via V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MAX_MB
> - MAX_BYTES mode: Slices are created based on byte size, controlled via
>    V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MAX_BYTES
> 
> Clients can enable slice mode using the
> V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MODE control.
> 
> This series adds multi-slice support for HFI Gen2 targets (SM8550 and later).
> Support for HFI Gen1 targets will be added in a follow-up series.
> 
> This Patch has been verified with GST level.

specify the platform tested.

> Command used:
> gst-launch-1.0 -v videotestsrc ! video/x-raw,format=NV12, \
> width=1280,height=720,framerate=30/1 ! v4l2h264enc output-io-mode=4 |
> capture-io-mode=4 extra-controls="controls,video_bitrate_mode=1, \
> slice_partitioning_method=1,number_of_mbs_in_a_slice=460;" \
> ! filesink location=/opt/test_enc.h264
> ---
>   drivers/media/platform/qcom/iris/iris_ctrls.c      | 89 ++++++++++++++++++++++
>   drivers/media/platform/qcom/iris/iris_ctrls.h      |  1 +
>   .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  2 +
>   .../platform/qcom/iris/iris_platform_common.h      |  3 +
>   .../media/platform/qcom/iris/iris_platform_gen2.c  | 31 ++++++++
>   5 files changed, 126 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
> index 3cec957580f5..52b92241e7f0 100644
> --- a/drivers/media/platform/qcom/iris/iris_ctrls.c
> +++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
> @@ -13,6 +13,15 @@
>   
>   #define CABAC_MAX_BITRATE 160000000
>   #define CAVLC_MAX_BITRATE 220000000
> +#define MAX_SLICES_PER_FRAME 10

can you reconfirm this if this is indeed limited to 10 ?

> +#define MAX_SLICES_FRAME_RATE 60
> +#define MAX_MB_SLICE_WIDTH 4096
> +#define MAX_MB_SLICE_HEIGHT 2160
> +#define MAX_BYTES_SLICE_WIDTH 1920
> +#define MAX_BYTES_SLICE_HEIGHT 1088
> +#define MIN_HEVC_SLICE_WIDTH 384
> +#define MIN_AVC_SLICE_WIDTH 192
> +#define MIN_SLICE_HEIGHT 128
>   
>   static inline bool iris_valid_cap_id(enum platform_inst_fw_cap_type cap_id)
>   {
> @@ -112,6 +121,12 @@ static enum platform_inst_fw_cap_type iris_get_cap_id(u32 id)
>   		return IR_TYPE;
>   	case V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD:
>   		return IR_PERIOD;
> +	case V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MODE:
> +		return SLICE_MODE;
> +	case V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MAX_BYTES:
> +		return SLICE_MAX_BYTES;
> +	case V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MAX_MB:
> +		return SLICE_MAX_MB;
>   	default:
>   		return INST_FW_CAP_MAX;
>   	}
> @@ -213,6 +228,12 @@ static u32 iris_get_v4l2_id(enum platform_inst_fw_cap_type cap_id)
>   		return V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE;
>   	case IR_PERIOD:
>   		return V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD;
> +	case SLICE_MODE:
> +		return V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MODE;
> +	case SLICE_MAX_BYTES:
> +		return V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MAX_BYTES;
> +	case SLICE_MAX_MB:
> +		return V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MAX_MB;
>   	default:
>   		return 0;
>   	}
> @@ -996,6 +1017,74 @@ int iris_set_ir_period(struct iris_inst *inst, enum platform_inst_fw_cap_type ca
>   					     &ir_period, sizeof(u32));
>   }
>   
> +int iris_set_slice_count(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
> +{
> +	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
> +	u32 slice_mode = inst->fw_caps[SLICE_MODE].value;
> +	u32 bitrate = inst->fw_caps[BITRATE].value;
> +	u32 rc_type = inst->fw_caps[BITRATE_MODE].value;
> +	u32 fps = inst->frame_rate;
> +	u32 output_width = inst->fmt_dst->fmt.pix_mp.width;
> +	u32 output_height = inst->fmt_dst->fmt.pix_mp.height;
> +	u32 mbpf = NUM_MBS_PER_FRAME(output_height, output_width);
> +	u32 max_width, max_height, min_width, min_height;
> +	u32 max_avg_slicesize, hfi_value, hfi_id;
> +
> +	if (slice_mode == V4L2_MPEG_VIDEO_MULTI_SLICE_MODE_SINGLE) {
> +		dev_dbg(inst->core->dev, "slice mode is: %u, ignore setting to fw\n", slice_mode);
> +		return 0;
> +	}
> +	if (!fps) {
> +		dev_err(inst->core->dev, "Invalid frame rate %d\n", fps);
> +		return -EINVAL;
> +	}
> +	if (fps > MAX_SLICES_FRAME_RATE ||
> +		(rc_type != HFI_RC_OFF && rc_type != HFI_RC_CBR_CFR &&
> +		rc_type != HFI_RC_CBR_VFR)) {
> +		dev_err(inst->core->dev, "slice unsupported, fps: %u, rc_type: %#x\n",
> +			fps, rc_type);
> +		return -EINVAL;
> +	}
> +
> +	max_width = (slice_mode == V4L2_MPEG_VIDEO_MULTI_SLICE_MODE_MAX_MB) ?
> +			MAX_MB_SLICE_WIDTH : MAX_BYTES_SLICE_WIDTH;
> +	max_height = (slice_mode == V4L2_MPEG_VIDEO_MULTI_SLICE_MODE_MAX_MB) ?
> +			MAX_MB_SLICE_HEIGHT : MAX_BYTES_SLICE_HEIGHT;
> +	min_width = (inst->codec == V4L2_PIX_FMT_HEVC) ?
> +			MIN_HEVC_SLICE_WIDTH : MIN_AVC_SLICE_WIDTH;
> +	min_height = MIN_SLICE_HEIGHT;

All these values are made into common setter, if there is a SOC, which 
supports different capabilities, these need to be redesigned. Can you 
see on how to make this platform specific capabilities and then make the 
checks generic to be used for all SOCs ?

> +
> +	if (output_width < min_width || output_height < min_height ||
> +		output_width > max_width || output_height > max_height) {
> +		dev_err(inst->core->dev, "slice unsupported, codec: %#x wxh: [%dx%d]\n",
> +			inst->codec, output_width, output_height);
> +		return -EINVAL;
> +	}
> +
> +	if (slice_mode == V4L2_MPEG_VIDEO_MULTI_SLICE_MODE_MAX_MB) {
> +		hfi_value = inst->fw_caps[SLICE_MAX_MB].value;
> +		hfi_value = max(hfi_value, mbpf / MAX_SLICES_PER_FRAME);
> +		if (inst->codec == V4L2_PIX_FMT_HEVC)
> +			hfi_value = (hfi_value + 3) / 4;
> +		hfi_id = inst->fw_caps[SLICE_MAX_MB].hfi_id;
> +	} else if (slice_mode == V4L2_MPEG_VIDEO_MULTI_SLICE_MODE_MAX_BYTES) {
> +		hfi_value = inst->fw_caps[SLICE_MAX_BYTES].value;
> +		if (rc_type != HFI_RC_OFF) {
> +			max_avg_slicesize = ((bitrate / fps) / 8) / MAX_SLICES_PER_FRAME;
> +			hfi_value = max(hfi_value, max_avg_slicesize);
> +		}
> +		hfi_id = inst->fw_caps[SLICE_MAX_BYTES].hfi_id;
> +	} else {
> +		return -EINVAL;
> +	}
> +
> +	return hfi_ops->session_set_property(inst, hfi_id,
> +					     HFI_HOST_FLAGS_NONE,
> +					     iris_get_port_info(inst, cap_id),
> +					     HFI_PAYLOAD_U32,
> +					     &hfi_value, sizeof(u32));
> +}
> +
>   int iris_set_properties(struct iris_inst *inst, u32 plane)
>   {
>   	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
> diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.h b/drivers/media/platform/qcom/iris/iris_ctrls.h
> index 9518803577bc..5280ee00d9a0 100644
> --- a/drivers/media/platform/qcom/iris/iris_ctrls.h
> +++ b/drivers/media/platform/qcom/iris/iris_ctrls.h
> @@ -35,6 +35,7 @@ int iris_set_qp_range(struct iris_inst *inst, enum platform_inst_fw_cap_type cap
>   int iris_set_rotation(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
>   int iris_set_flip(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
>   int iris_set_ir_period(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
> +int iris_set_slice_count(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
>   int iris_set_properties(struct iris_inst *inst, u32 plane);
>   
>   #endif
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
> index cecf771c55dd..8a27f246e114 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
> @@ -71,6 +71,8 @@ enum hfi_rate_control {
>   #define HFI_PROP_MIN_QP_PACKED			0x0300012f
>   #define HFI_PROP_MAX_QP_PACKED			0x03000130
>   #define HFI_PROP_IR_RANDOM_PERIOD		0x03000131
> +#define HFI_PROP_MULTI_SLICE_MB_COUNT		0x03000132
> +#define HFI_PROP_MULTI_SLICE_BYTES_COUNT	0x03000133
>   #define HFI_PROP_TOTAL_BITRATE			0x0300013b
>   #define HFI_PROP_MAX_GOP_FRAMES			0x03000146
>   #define HFI_PROP_MAX_B_FRAMES			0x03000147
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index 5a489917580e..05962d8fbb25 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -159,6 +159,9 @@ enum platform_inst_fw_cap_type {
>   	VFLIP,
>   	IR_TYPE,
>   	IR_PERIOD,
> +	SLICE_MODE,
> +	SLICE_MAX_BYTES,
> +	SLICE_MAX_MB,
>   	INST_FW_CAP_MAX,
>   };
>   
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> index 5da90d47f9c6..191154a8ab8d 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> @@ -18,6 +18,8 @@
>   
>   #define VIDEO_ARCH_LX 1
>   #define BITRATE_MAX				245000000
> +#define MAX_SLICE_MB_SIZE         \
> +	(((4096 + 15) >> 4) * ((2304 + 15) >> 4))
>   

Why is 2304 inconsistent with "MAX_MB_SLICE_HEIGHT 2160" ?

Regards,
Vikash


