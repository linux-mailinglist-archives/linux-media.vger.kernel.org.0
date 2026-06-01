Return-Path: <linux-media+bounces-63227-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0KvdI/1LHWphYgkAu9opvQ
	(envelope-from <linux-media+bounces-63227-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 11:08:13 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 012E361C202
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 11:08:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2A26E3053FC8
	for <lists+linux-media@lfdr.de>; Mon,  1 Jun 2026 09:02:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A69DA38D41C;
	Mon,  1 Jun 2026 09:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cN6mKzMk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aLArjJtw"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91FD6388876
	for <linux-media@vger.kernel.org>; Mon,  1 Jun 2026 09:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780304527; cv=none; b=f/kv1qOkRV3TuTm5jp/XRZsyv0hOhaHhtxdkU2t35jQE4wdUNkxtIVON3HC/vG1sf0GUcVs77UMIECVFoGjsUKGzn6MAWCnzlK/qEYBkpNSu8ZcgdLXDCLg7C3Bt7wiz/cLDEbbVVNyvBkrcChF/TAFfScLpSzhWDMLfNKgVN3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780304527; c=relaxed/simple;
	bh=3h8879JkSZpSCeWrhJ0XrEIK2E6BgJsTnDHFwS0aI1A=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=sGhDWKOX1djiNwVVnlXsk+vTL+BD9FXBUx1AVe7zKKjEmbWrswwX+dZsDYDXYccEFvblXjSE5i7g1hV5No0977C6TSCj1xf3QMvFWHFFWPUVLyq2W9DYj/R28XCu+CiuvJ0ydxQpUcE1n673Vy8yDno0pg0HmRotO9b+qgaCrnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cN6mKzMk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aLArjJtw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6518eFmZ1214161
	for <linux-media@vger.kernel.org>; Mon, 1 Jun 2026 09:02:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A8Fcl7RcpePYv/OdkYiyfIi7pLQtVF88LojW5YUqeQs=; b=cN6mKzMk11GktzVd
	HLxr7qNNNBa4i6g0KdcSgqRF9537tGHP5Cqhkq9wdl+KXDSVMQBsg45ZKEKhSgr9
	B5zxkvR0A3GqWe+QJ8cOdkQ61XzZuH+V7fThYiiYOX+HR++W0jj8HSI3tMPmyhuG
	Y4fir27ZzQoAjW1WOhb05Qung+sLUZFLRxlKW4e7/rVQga+YdVMvfBBOuoLOF9FI
	2wn+1jR/RYCcrj1wdXubWTDczy/mRgsDbVQ2su8RsTX4NyHT5N2mv+croh8XBlFx
	y5vLPcrru58WVdzhvT9pneF+4GC4Tq7tjW7z4EKUABuYdFguYc1uZFPzrGAUJd3q
	TLQR7Q==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eh6s9837t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 01 Jun 2026 09:02:04 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-84240683a82so931554b3a.1
        for <linux-media@vger.kernel.org>; Mon, 01 Jun 2026 02:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780304524; x=1780909324; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=A8Fcl7RcpePYv/OdkYiyfIi7pLQtVF88LojW5YUqeQs=;
        b=aLArjJtwmNUBVHPGbbdrw9OSebI5IMKzBBDyE58RQ37JITDpH/W3K1xiflD/Isxui6
         GoEDg/QlpiPHqJ4UUANmbGiuUiZMBGDPbb6ORPrBWJpdA5meIJ+FgAe+8qkEHUhuKauv
         cg+oajQRoZdZ4pv3MIm0q8WYSadq+qbrljvzY5ZbmFLoWf3ImL1PyM663L5W0qUepBXx
         9SZkTGGtS5/EeNFQFhnXlr/cV+c7zyrBbGoRs8TS/72ljNbjnm3qJD8Hg7ZduYpogWOd
         3b9qzEWFSu19cL/4MBHrB8iXu6yHNXCOZliUrvUR5HG5htVthh+m0Oegk3unW+Oe99y6
         ZCqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780304524; x=1780909324;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A8Fcl7RcpePYv/OdkYiyfIi7pLQtVF88LojW5YUqeQs=;
        b=FveE2ZhMMXsQbENOh+OSXAar6ePpkODOEeyExD5k0W6/JFpm7KOOc6jBK9R0CSYtx8
         JEFYZTtnNPv8xMFQFSeoBQ5iNriGhvUSgD3FgqmuvClTYyJOv7iTJqwrQ9T8VitLXdVF
         KYRyFfir6h9Rigu3K8bxw4NxiMXZsHBK1ktLdfcrJMx1Hl+8lIa+48KPe3SAV7egdYc9
         JB+hsVjhoEWfYuNZYoASZXb/Ij0N2oMRZNXoQm18wbprofgH9WhfGOQkoUXTuOHwpM0u
         t+7wuHyvwgomFV6kejPSjlrXb6uDVGpOiVhFloUiaLBSzgx/foYq1iQssu8lk/+sPw/6
         A2Gg==
X-Forwarded-Encrypted: i=1; AFNElJ8+zm7rwzf7t+k3lCdeMrA2z5bf3fu7PuFQdOU21OtN5aGaYgK659UnmWT6MIDD/evDCAb8eHFGXnLJOg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywwqs51KVml2iP0Ymn0YXsVs0WrvVL4J+U/OwJlEWH+mC+ap4Ja
	LcPJiJCnbLcp1LaNRKZ7wbaJRmRX39INssqHO3rTc+nJtHzyZ3/raQdG0tBzvpdLNFCEKi6/3vL
	GXNCa0UAmDqlC9vG4GIhbSniO8kIqFWPIaOzpmDWQYezDI2ArHSV+5WmNYjDdDwdvnw==
X-Gm-Gg: Acq92OEkaR0SES0M921SmEiV+xJizBZDNEBZ9vaLhvVvnMOvTUXjeWgmiSiDeCEApuo
	PkcYZalnT9EZtb/zUK39pwKbiDi2JrZlUcZA0rAAt3iN5hN8Tdv1gI0egT5h58Ky5oaCEUfX3Sm
	KW++cQ0QwxwgpOSWwlcvZRPMsF1gV3vamL6Mk0Q9hh51beANsmL0/RZnwpi+e34MCpLnwIsdIcb
	gGEho7o2CbbEOsK+uhrz7cA8FLWIOTWsW5TPxagGj95hcLFV5zeatZgA80rroGzw1K1KB2SMQdq
	RRq6Zfn9GSFGidYrxP7QA9y2Li2L8GbC1mMmm3eo3GTrhy/6xzXnPhZF55fkpOdPl9HhvSl/kxY
	oNYzIe0auxoVya9lo/wwxUH+kniit3akJ9Y11cAh9kZj2lM2Nhtxo0zdJVwB7cGIIsmKcYbsmKX
	P1ZbqODjV76KZKlbbTwyag0YBCfw==
X-Received: by 2002:a05:6a00:2e94:b0:842:63f5:d097 with SMTP id d2e1a72fcca58-84263f5d3e5mr72090b3a.3.1780304523522;
        Mon, 01 Jun 2026 02:02:03 -0700 (PDT)
X-Received: by 2002:a05:6a00:2e94:b0:842:63f5:d097 with SMTP id d2e1a72fcca58-84263f5d3e5mr72048b3a.3.1780304522923;
        Mon, 01 Jun 2026 02:02:02 -0700 (PDT)
Received: from [10.249.19.49] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84214b6797esm11009710b3a.26.2026.06.01.02.01.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jun 2026 02:02:02 -0700 (PDT)
Message-ID: <ff2e9b4f-57c2-4fcb-b5f5-66f8f07b7b02@oss.qualcomm.com>
Date: Mon, 1 Jun 2026 17:01:57 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: wangao.wang@oss.qualcomm.com, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [PATCH v4 0/6] media: qcom: iris: add support for decoding 10bit
 formats
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20260521-topic-sm8x50-iris-10bit-decoding-v4-0-8ff8fce3f904@linaro.org>
Content-Language: en-US
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
In-Reply-To: <20260521-topic-sm8x50-iris-10bit-decoding-v4-0-8ff8fce3f904@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: BrkiWcV-5vD0J5B14xmk4P0Gad9BE6MH
X-Proofpoint-GUID: BrkiWcV-5vD0J5B14xmk4P0Gad9BE6MH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDA5MCBTYWx0ZWRfXzfE/HOL71f7C
 OvKmohWzke6cFpbBd371/VOg2UVKL7DoMCdJRkM8YsT3jFDpiTKZ3dJDq0re4+anNU+5562sGtW
 RDtD/GikhlCqYX5tHmCGMyOP/lEhzYf2HN5S+/k/odUFJck9VS0BAcy+ogZBglwjUu0joBt7GUq
 UnULdPUXbP9TouLNTA6sk5mpvwgdv1j/r12qAoT1dE9ZLUY5KhU3egQqqfoqvcmbW7ricZNMtE+
 GgNT6kzVbE+J9SZDWr3TBE7pxgxQw0J62j3Mw3/WlSLBSaLeVnjLH0f3+mf2ZXNrX+7AqOfCPjL
 t6qCOAL77VjPpZ7mwkgjkoVQlss4J52Kka9Z+oul7ovSw8635+GWVr4DJNap1s4bSK6ChzyC6ED
 r1I8r386SVJEEJKgdXQOln262nB6Vkn89Ew0mAyRIwPZL8VZqsX0cN+wBS8WQSXSgqYTgkDKUcj
 oBNQ7SVO3+phKbCMPcw==
X-Authority-Analysis: v=2.4 cv=Zo7d7d7G c=1 sm=1 tr=0 ts=6a1d4a8c cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=e5mUnYsNAAAA:8 a=bC-a23v3AAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=MmTAwMZlFViELlrkKGwA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
 a=Vxmtnl_E_bksehYqCbjh:22 a=FO4_E8m0qiDe52t0p3_H:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010090
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-63227-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,linaro.org:email,gitlab.freedesktop.org:url];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wangao.wang@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 012E361C202
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 2026/5/21 17:24, Neil Armstrong wrote:
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
> v4l2-compliance results on SM8550 & SM8650:
> 
> $ v4l2-compliance -d /dev/video1 -s
> v4l2-compliance 1.33.0-5456, 64 bits, 64-bit time_t
> v4l2-compliance SHA: 8aa593bda182 2026-04-11 10:54:25
> 
> Compliance test for iris_driver device /dev/video1:
> 
> Driver Info:
> 	Driver name      : iris_driver
> 	Card type        : Iris Encoder
> 	Bus info         : platform:aa00000.video-codec
> 	Driver version   : 7.0.0
> 	Capabilities     : 0x84204000
> 		Video Memory-to-Memory Multiplanar
> 		Streaming
> 		Extended Pix Format
> 		Device Capabilities
> 	Device Caps      : 0x04204000
> 		Video Memory-to-Memory Multiplanar
> 		Streaming
> 		Extended Pix Format
> 	Detected Stateful Encoder
> 
> Required ioctls:
> 	test VIDIOC_QUERYCAP: OK
> 	test invalid ioctls: OK
> 
> Allow for multiple opens:
> 	test second /dev/video1 open: OK
> 	test VIDIOC_QUERYCAP: OK
> 	test VIDIOC_G/S_PRIORITY: OK
> 	test for unlimited opens: OK
> 
> Debug ioctls:
> 	test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
> 	test VIDIOC_LOG_STATUS: OK (Not Supported)
> 
> Input ioctls:
> 	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
> 	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> 	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
> 	test VIDIOC_ENUMAUDIO: OK (Not Supported)
> 	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
> 	test VIDIOC_G/S_AUDIO: OK (Not Supported)
> 	Inputs: 0 Audio Inputs: 0 Tuners: 0
> 
> Output ioctls:
> 	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
> 	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> 	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
> 	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
> 	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
> 	Outputs: 0 Audio Outputs: 0 Modulators: 0
> 
> Input/Output configuration ioctls:
> 	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
> 	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
> 	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
> 	test VIDIOC_G/S_EDID: OK (Not Supported)
> 
> Control ioctls:
> 	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
> 	test VIDIOC_QUERYCTRL: OK
> 	test VIDIOC_G/S_CTRL: OK
> 	test VIDIOC_G/S/TRY_EXT_CTRLS: OK
> 	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
> 	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
> 	Standard Controls: 43 Private Controls: 0
> 
> Format ioctls:
> 	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
> 	test VIDIOC_G/S_PARM: OK
> 	test VIDIOC_G_FBUF: OK (Not Supported)
> 	test VIDIOC_G_FMT: OK
> 	test VIDIOC_TRY_FMT: OK
> 	test VIDIOC_S_FMT: OK
> 	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
> 	test Cropping: OK
> 	test Composing: OK (Not Supported)
> 	test Scaling: OK (Not Supported)
> 
> Codec ioctls:
> 	test VIDIOC_(TRY_)ENCODER_CMD: OK
> 	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
> 	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
> 
> Buffer ioctls:
> 	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
> 	test CREATE_BUFS maximum buffers: OK
> 	test VIDIOC_REMOVE_BUFS: OK
> 	test VIDIOC_EXPBUF: OK
> 	test Requests: OK (Not Supported)
> 	test blocking wait: OK
> 
> Test input 0:
> 
> Streaming ioctls:
> 	test read/write: OK (Not Supported)
> 	Video Capture Multiplanar: Captured 61 buffers
> 	test MMAP (select, REQBUFS): OK
> 	Video Capture Multiplanar: Captured 61 buffers
> 	test MMAP (epoll, REQBUFS): OK
> 	Video Capture Multiplanar: Captured 61 buffers
> 	test MMAP (select, CREATE_BUFS): OK
> 	Video Capture Multiplanar: Captured 61 buffers
> 	test MMAP (epoll, CREATE_BUFS): OK
> 	test USERPTR (select): OK (Not Supported)
> 	test DMABUF: Cannot test, specify --expbuf-device
> 
> Total for iris_driver device /dev/video1: 54, Succeeded: 54, Failed: 0, Warnings: 0
> 
> $ v4l2-compliance -d /dev/video0 -s5 --stream-from=test_video_10s.h264
> v4l2-compliance 1.33.0-5456, 64 bits, 64-bit time_t
> v4l2-compliance SHA: 8aa593bda182 2026-04-11 10:54:25
> 
> Compliance test for iris_driver device /dev/video0:
> 
> Driver Info:
> 	Driver name      : iris_driver
> 	Card type        : Iris Decoder
> 	Bus info         : platform:aa00000.video-codec
> 	Driver version   : 7.0.0
> 	Capabilities     : 0x84204000
> 		Video Memory-to-Memory Multiplanar
> 		Streaming
> 		Extended Pix Format
> 		Device Capabilities
> 	Device Caps      : 0x04204000
> 		Video Memory-to-Memory Multiplanar
> 		Streaming
> 		Extended Pix Format
> 	Detected Stateful Decoder
> 
> Required ioctls:
> 	test VIDIOC_QUERYCAP: OK
> 	test invalid ioctls: OK
> 
> Allow for multiple opens:
> 	test second /dev/video0 open: OK
> 	test VIDIOC_QUERYCAP: OK
> 	test VIDIOC_G/S_PRIORITY: OK
> 	test for unlimited opens: OK
> 
> Debug ioctls:
> 	test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
> 	test VIDIOC_LOG_STATUS: OK (Not Supported)
> 
> Input ioctls:
> 	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
> 	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> 	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
> 	test VIDIOC_ENUMAUDIO: OK (Not Supported)
> 	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
> 	test VIDIOC_G/S_AUDIO: OK (Not Supported)
> 	Inputs: 0 Audio Inputs: 0 Tuners: 0
> 
> Output ioctls:
> 	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
> 	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> 	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
> 	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
> 	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
> 	Outputs: 0 Audio Outputs: 0 Modulators: 0
> 
> Input/Output configuration ioctls:
> 	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
> 	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
> 	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
> 	test VIDIOC_G/S_EDID: OK (Not Supported)
> 
> Control ioctls:
> 	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
> 	test VIDIOC_QUERYCTRL: OK
> 	test VIDIOC_G/S_CTRL: OK
> 	test VIDIOC_G/S/TRY_EXT_CTRLS: OK
> 	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
> 	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
> 	Standard Controls: 12 Private Controls: 0
> 
> Format ioctls:
> 	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
> 	test VIDIOC_G/S_PARM: OK (Not Supported)
> 	test VIDIOC_G_FBUF: OK (Not Supported)
> 	test VIDIOC_G_FMT: OK
> 	test VIDIOC_TRY_FMT: OK
> 	test VIDIOC_S_FMT: OK
> 	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
> 	test Cropping: OK
> 	test Composing: OK
> 	test Scaling: OK (Not Supported)
> 
> Codec ioctls:
> 	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
> 	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
> 	test VIDIOC_(TRY_)DECODER_CMD: OK
> 
> Buffer ioctls:
> 	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
> 	test CREATE_BUFS maximum buffers: OK
> 	test VIDIOC_REMOVE_BUFS: OK
> 	test VIDIOC_EXPBUF: OK
> 	test Requests: OK (Not Supported)
> 	test blocking wait: OK
> 
> Test input 0:
> 
> Streaming ioctls:
> 	test read/write: OK (Not Supported)
> the input file is smaller than 7077888 bytes
> 	Video Capture Multiplanar: Captured 601 buffers
> 	test MMAP (select, REQBUFS): OK
> the input file is smaller than 7077888 bytes
> 	Video Capture Multiplanar: Captured 601 buffers
> 	test MMAP (epoll, REQBUFS): OK
> the input file is smaller than 7077888 bytes
> 	Video Capture Multiplanar: Captured 601 buffers
> 	test MMAP (select, CREATE_BUFS): OK
> the input file is smaller than 7077888 bytes
> 	Video Capture Multiplanar: Captured 601 buffers
> 	test MMAP (epoll, CREATE_BUFS): OK
> 	test USERPTR (select): OK (Not Supported)
> 	test DMABUF: Cannot test, specify --expbuf-device
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
> 

Tested-by: Wangao Wang <wangao.wang@oss.qualcomm.com>

-- 
Best Regards,
Wangao


