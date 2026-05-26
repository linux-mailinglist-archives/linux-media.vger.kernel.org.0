Return-Path: <linux-media+bounces-62753-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mKnpH6FRFWqmUQcAu9opvQ
	(envelope-from <linux-media+bounces-62753-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 09:54:09 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 193AE5D2134
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 09:54:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 980B1302DF65
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 07:53:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 901073CC7E4;
	Tue, 26 May 2026 07:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nsyg1ER3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VRXpxD/P"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 060413B9927
	for <linux-media@vger.kernel.org>; Tue, 26 May 2026 07:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779782027; cv=none; b=Mq0T+TN7biDKyIoxecQXYdTTJO9WJ0VjYMqWpLyQDGVIgfIHGAtM6MtQhUtoupm25r7vBqsZlaak57wh418PhyL3dHQyFJN7GOIE62nfSbP95fp59K9YR7wLH1TzC8XQBrNqNpqNem+sFk54m7zaEnwT2cUSt/ZIMJMmORFT5DI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779782027; c=relaxed/simple;
	bh=FQItYE5lhOgysObmk/9s1tt32WG7yWkaKTC+0wxlmaQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r2Rx1fp/WRUO8GTPRUJTRKObChAaJKdm1TVQQS9sgpwvbeallFJbDXf7EoYPJ6r80qEWUWaytgwKaJ7wkvKcujnQv3z0FYFuuOviSGeN2l91Bg2p2CSAIJyyPdQcwH0nhLV7dAvF1fB7eHGlrYEllOckHzmY/3+GbWc33TGEtVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nsyg1ER3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VRXpxD/P; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64Q2URXe4117444
	for <linux-media@vger.kernel.org>; Tue, 26 May 2026 07:53:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OuL8yKBdugShDKTmzUjZs0KnNoPZVA0o6dUNMSnFCgQ=; b=nsyg1ER3Mn1HiMIs
	tGfFWi4/CKUC/lVPWG6EF/pdLEXCxmskLy4FCCMNi4/gmKME+wZB7J/28q6BmWQR
	6vCbd9HGPvlUAHHF0FKh1OvjEZ80v5erbm7qlIimv0pOa2wNiRsMNYA1hPJeJDAn
	S5YFDnAjGspA5whZlVxvo8fjXwwvtgd+Mkx1TSy3WDkKYfG0hgjHuK3B65o4HPEx
	7RrF3ntJxS8J20sOsnFXOlyt+G75tENULnxj05REOkj9CbTR7Ku/eDNVLr+DSRej
	qs6mrxmpae6XXt8GPhqxU+r0jgApmzOql5rSyknK8FFKeQfjQSJqTJH4bMbC0gLj
	mPS6SQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecqudarr7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 26 May 2026 07:53:43 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2f3eb8f3419so3606208eec.1
        for <linux-media@vger.kernel.org>; Tue, 26 May 2026 00:53:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779782023; x=1780386823; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OuL8yKBdugShDKTmzUjZs0KnNoPZVA0o6dUNMSnFCgQ=;
        b=VRXpxD/PVQhTwBnRff5qBWaQTu5QupZXPMGqyjLR7IxBKVO1uTYcSEqY0hAfy7Wwep
         aUAHw828l5XbipvNNWNkZtEtCD6ETJhHxAQyi19JVysjcsrmVyQ4zUeIqHlGVocHa12Y
         3FER3lW8r3So1oypLGT8oL7AUA0j/5un8eoUH70QyPzeHkHICwOmBeOvU7k4IOTvbSf7
         2R/pKc1u9+W869qTLPoWsQAto5K6cS3kl7JPNWX2Iv/05us0kb6VwD8CTXNmmjnJnh5+
         ISHPTkZmHER74un5tc/dn0cfEdmVm+cPisuVM+zh+/QJWBtYED5x4Essus7sI91SutYm
         7hWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779782023; x=1780386823;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OuL8yKBdugShDKTmzUjZs0KnNoPZVA0o6dUNMSnFCgQ=;
        b=jLEi6IbzcBkYElI7bGUOSGEL0OttKw4PwSsNYM1eSLKohcnIF6gL1DvocjsGhc5Jat
         oWPfiL8W1QmL9scTBDd4RzaVTj9rLKwTEfGWk6hBrUy7pXpTtSLvinZwr0qfeMIt4bHF
         CGUJXQ1UKIQmXq/wLde8o8LeDz7MS9BfFPHlKLLzd/q0HyXIpImtWKzXHi1jhQ3LIvNF
         NDSdFBLoDOmg+OP+H0tkPqmLDA1iy3DXRULkAWyt5/smv1jEv2LZwv8nJH8vZmU1ve1D
         ndlorGlz7tmRrQUcAEuYZLmUXlY0rTK80qT1ZkfHw2QJ+2LxTLxuT+1Pa0i+OEWNcP70
         B0Aw==
X-Gm-Message-State: AOJu0YzuGzXm9ma5k3BuDPQQrV9nLavqLvnLLt8cVFLjdfyBVcnyXlMn
	/IOgq4YE8eli+TKJqp711Pp6QCV8RxCr/oAoOPxa6z5ylLmKzxQLGP6Z9Zn/OaGRqS8GAqAyofv
	CTlvS3YQfGIkCXm9Y7EJ/2BHY6cG6OYpq/xCIirzv6Kz6LQnBZguf/gdM8SzHDMIMTg==
X-Gm-Gg: Acq92OHnXJeSW6+sUFLVuZdnvvxubqTkNxKzgLlu66X9JCbR0OX6H3tVaPbCt82v9XN
	0rrxyWHUJ+Ek+jaZmBPtwYTuFW2HG9KtPpf2tQ9BtuUX9gbzoi6k6wMXOMw5DJhSTCtl/T0bcQB
	ApX2pXHSSX3cdvXISaKeivncrUuQBV7JR4bCXeoDQvgYicm946ItYUR10xIuCyqubLJsbgGOYbK
	22X156IMinFzgtfWFgV3xmyaneBG2FZXdEDut6bWJJKWa7m56fmSzGsioTANRkCp+d8mYN6Bz1q
	0chBiEaCP0QGoc+poyeb42RTJgB3dOSb6tRqDTU0+yLziQVfK+V9awYM/avp8/NzAGry9b9c+UQ
	5bQ8uQvvfvB5PUAOR/nrU34B3G3QWAJL2IEFYop6nKFKdA2gnPx+o
X-Received: by 2002:a05:7301:d0f:b0:2ed:e15:c923 with SMTP id 5a478bee46e88-30449142740mr7787211eec.31.1779782022799;
        Tue, 26 May 2026 00:53:42 -0700 (PDT)
X-Received: by 2002:a05:7301:d0f:b0:2ed:e15:c923 with SMTP id 5a478bee46e88-30449142740mr7787195eec.31.1779782022220;
        Tue, 26 May 2026 00:53:42 -0700 (PDT)
Received: from [10.68.116.254] ([146.0.26.16])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30451f1fd1csm9838346eec.8.2026.05.26.00.53.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 May 2026 00:53:41 -0700 (PDT)
Message-ID: <fa26f61e-86b6-4612-afae-7726e3b35c4b@oss.qualcomm.com>
Date: Tue, 26 May 2026 13:23:36 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/6] media: qcom: iris: add support for decoding 10bit
 formats
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20260521-topic-sm8x50-iris-10bit-decoding-v4-0-8ff8fce3f904@linaro.org>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260521-topic-sm8x50-iris-10bit-decoding-v4-0-8ff8fce3f904@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: WxV7vtJi4esD_xUSzdlPUKsWrnmctqU2
X-Proofpoint-GUID: WxV7vtJi4esD_xUSzdlPUKsWrnmctqU2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDA2OCBTYWx0ZWRfX7b+inxmVVAN0
 1Js3uR1vkXhaAYg6T1zoH2AYuzXcDq5VetXsKr+R1COydIxqxcyoVWj7ZQOMkRapXjCNwkEpS/N
 DIfdvUUk/jjBOtWTPFgl94jjh8FdII3680HmL+8ARo1EHs5LX5IFVUTns6+Op8R9iBtn1sSldAP
 mrbF0xTMtcUH/r1ZkrNw9944r1yqjkllcnckZv4l8txhb71t28O9dcwQ3aQpIkhRBbMdY9yfGSM
 CnB4i4K9wgMr1gLpTHmjDfZiDqFf08To858IWLTkCubir7zdTMiYrpq6012e0hiPD2Jmy4VKXYn
 ieqLOo2YrQQefPXO6WWG4H61tYsZavD5mbmtERH5AOH8d5G8Xu/zl8Nu91cGoMPW0HtBaymLCPh
 WV83dvV7MC9hQFzSvXq5ddP/0FWIkwuob4/TPfQ2aV5k4oOkGaxzpU/RlotCmm6m4J8zwmDbsHy
 xwwpKJqpBT9wguTRWJg==
X-Authority-Analysis: v=2.4 cv=C9jZDwP+ c=1 sm=1 tr=0 ts=6a155187 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=3xFAF2x3o65iZn5cP+8M2w==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8
 a=KKAkSRfTAAAA:8 a=PPvw34hF8QDUbFAgV6MA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22 a=Vxmtnl_E_bksehYqCbjh:22 a=FO4_E8m0qiDe52t0p3_H:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-26_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260068
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:dkim,msgid.link:url,gitlab.freedesktop.org:url,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,linaro.org:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62753-lists,linux-media=lfdr.de];
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
X-Rspamd-Queue-Id: 193AE5D2134
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 5/21/2026 2:54 PM, Neil Armstrong wrote:
> This adds the plumbing to support decoding HEVC, VP9 and AV1
> streams into 10bit pixel formats, linear and compressed.
> 
> This has only been tested on SM8550 & SM8650 with HEVC, and was
> inspired by Venus, DRM MSM and the downstream vidc driver for the
> buffer calculations and HFI messages.
> 
> Gstreamer support for QC08 and QC10 need the MR at [1] to be applied,
> but NV12 and P010 works out of the box with mainline Gstreamer.
> 
> Fluster HEVC results on SM8650 using Gstreamer:
> 
> ./fluster.py run -ts JCT-VC-HEVC_V1 -d GStreamer-H.265-V4L2-Gst1.0 - 141/147
> The failing test case:
> - Pixel Format mismatch
>   - TSUNEQBD_A_MAIN10_Technicolor_2 - Gstreamer waits NV12 but decoder returns P010
> - Unsupported resolution
>   - PICSIZE_A_Bossen_1 - resolution is higher than max supported
>   - PICSIZE_B_Bossen_1 - resolution is higher than max supported
>   - WPP_D_ericsson_MAIN_2 - resolution is lower than min supported
>   - WPP_D_ericsson_MAIN10_2 - resolution is lower than min supported
> - CRC mismatch
>   - RAP_A_docomo_6
>

<snip>


> 
> Total for iris_driver device /dev/video0: 54, Succeeded: 54, Failed: 0, Warnings: 0
> 
> [1] https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8195
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
> Changes in v4:
> - Picked review tags
> - Use u32 instead of __u32
> - Explicit DPB
> - Drop NULL and use >>1 in q10c buffer calc
> - Drop selicolon after switch statementr
> - Correctly align HFI_PROP_UBWC_STRIDE_SCANLINE entry

Its not very clear. Does this fix the issue reported here [1] ?

https://lore.kernel.org/linux-media/fb377b11-c54c-4bd9-bf12-cf19d6484c66@oss.qualcomm.com/

> - Rebase on media next tree after the file split
> - Link to v3: https://patch.msgid.link/20260511-topic-sm8x50-iris-10bit-decoding-v3-0-7fc049b93042@linaro.org
> 
> Changes in v3:
> - Added review tag on patch 1
> - Limited stride command to AV1 decoding only
> - Link to v2: https://patch.msgid.link/20260417-topic-sm8x50-iris-10bit-decoding-v2-0-c987b65a31d5@linaro.org
> 
> Changes in v2:
> - Fixed bug breaking 8bit decoding
> - Dropped filtering on G_FMT while waiting for soure change
> - Dropped format filtering on ENUMFMT
> - Switched ALIGN(x, 192) to roundup(x, 192) because ALIGN works only with Power Of Two numbers
> - Cleaned and refactors the width/height/stride calculations
> - Cleaned and redesigned the buffer calculations functions with proper comments and var names
> - Passed fluster and v4l2-compliance to check for non regression
> - Tested on SM8550
> - Added missing V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10 with made gstreamer fail decoding
> - Link to v1: https://patch.msgid.link/20260408-topic-sm8x50-iris-10bit-decoding-v1-0-428c1ec2e3f3@linaro.org
> 
> ---
> Neil Armstrong (6):
>        media: qcom: iris: add helpers for 8bit and 10bit formats
>        media: qcom: iris: add QC10C & P010 buffer size calculations
>        media: qcom: iris: gen2: add support for 10bit decoding
>        media: qcom: iris: vdec: update size and stride calculations for 10bit formats
>        media: qcom: iris: vdec: update find_format to handle 8bit and 10bit formats
>        media: qcom: iris: vdec: allow GEN2 decoding into 10bit format
> 
>   drivers/media/platform/qcom/iris/iris_buffer.c     | 195 ++++++++++++++++++++-
>   drivers/media/platform/qcom/iris/iris_hfi_gen2.c   |   8 +-
>   .../platform/qcom/iris/iris_hfi_gen2_command.c     |  75 +++++++-
>   .../platform/qcom/iris/iris_hfi_gen2_defines.h     |   1 +
>   .../platform/qcom/iris/iris_hfi_gen2_response.c    |  37 +++-
>   drivers/media/platform/qcom/iris/iris_instance.h   |   2 +
>   .../platform/qcom/iris/iris_platform_common.h      |   1 +
>   drivers/media/platform/qcom/iris/iris_utils.c      |  16 +-
>   drivers/media/platform/qcom/iris/iris_utils.h      |   2 +
>   drivers/media/platform/qcom/iris/iris_vdec.c       |  42 ++++-
>   10 files changed, 364 insertions(+), 15 deletions(-)
> ---
> base-commit: 86693e86019a7466be961fd4f45d407cc0b0ba0a
> change-id: 20260408-topic-sm8x50-iris-10bit-decoding-074c3ac7975c
> 
> Best regards,
> --
> Neil Armstrong <neil.armstrong@linaro.org>
> 

Regards,
Vikash

