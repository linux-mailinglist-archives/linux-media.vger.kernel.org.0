Return-Path: <linux-media+bounces-65569-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id s3taEu71O2pcgggAu9opvQ
	(envelope-from <linux-media+bounces-65569-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 17:21:18 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DDAA6BF962
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 17:21:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="E6C/xDrz";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=V4VjWRDp;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65569-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-65569-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 86DDA318375A
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 15:10:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C11B3D9DC4;
	Wed, 24 Jun 2026 15:10:15 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EDB73CDBB7
	for <linux-media@vger.kernel.org>; Wed, 24 Jun 2026 15:10:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782313814; cv=none; b=fZJCs3Cp5EB76+WLC9RMwU5WRf9YfL0VWcmDxZcnK9VjkrnPrtDoe9+pM2zLaBE5k7nQG4jV6/d5r8+3/8qA5Nh5IpMdnh6ha6lo5PPSXdIvUgswko2cUcmi6v13Xl+6NhKavDT1Rt4dF5249EKSGxChTygjyooGcjFUJggDn5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782313814; c=relaxed/simple;
	bh=D/S5IuAJPNT644Gs0AW27oQ0aC5JKgWjrTwbcieJiYA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EDcl/0c9oFuEAKbwZYxpQ+JtN5p1aGNe+QDyX7qZNtxbl8gbP/CJGLZPxwwUoHrWdanx1R9qUWW6fq9O+pHgrSe+ca/7AiRZ3557s0HE7XldY3K2P2vMFsfQv6kPtxJ8mF+paQZKuppwP7usEzJN5j+aMU/GjisOsbk6dpKY31k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E6C/xDrz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V4VjWRDp; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65OEfT1V3441313
	for <linux-media@vger.kernel.org>; Wed, 24 Jun 2026 15:10:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CEyzklSSRwOjLFDtorsDC03GX9euxE4wNWuU+QT1/5E=; b=E6C/xDrzzITLjNZS
	iYA6GYr0nrVi6ROX6YIno6iL8wQyzTqoUJYfrMTLjtOzzkCz/23JaXg7aFf8J28S
	xEAO4v6OgMMqU3Bm0cAqn5hviuxeW7+N9bhKx4QdfVGvNOZopEf2hTkcQTD3zMxv
	jSoGrchDn7i0S6akfEPWekvP61ampCfsV8H3DwFYvLxyd6SagxZeM0BclfHL+h/N
	NspH4jC/Yt7BqByIIOQCPyRddRXQ6N56w++lCECLfCPa5dMTAc8+aG7kkarg7MVj
	BxwfMFiQAb2r0g2VLnXHNDqb8Yz4q8bP/ffNDpnQnxv2xdFjUNXwym16eLmn7IEK
	v7aHjw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0apq1ske-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 24 Jun 2026 15:10:11 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c7ee3952d6so3867555ad.1
        for <linux-media@vger.kernel.org>; Wed, 24 Jun 2026 08:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782313810; x=1782918610; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CEyzklSSRwOjLFDtorsDC03GX9euxE4wNWuU+QT1/5E=;
        b=V4VjWRDpOilw+HMZemvjN5Z3rwWs6h55q9dzUc3/xpPj2TbkrXsHtFGHJ1aJ4fVF0W
         1sXQYPbkQRw7kqT+QCaDRKF5LwMIFjDZH8YU0cgC1McrC4Zbnb+7ud60CIC+cvS+avL0
         1IXgrNy0aiZ6p21pFNuEunRzRtZGWyu/SjlHRU1B1GjTweK0/HQvhqGZMB5ELIz+rPxU
         tsKYRyFzf2AzaXtND+BjuKm849fh0KeeY9A2JxlFtL/A/5Rz35yEWUsSv44zI/gw19jy
         5tMXsbIkUmoXWISlDuFmQ4gGn/yckaHrQBl36jZeAsEFg4A2vejVIz6Yra7YG19blKVT
         OZ8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782313810; x=1782918610;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CEyzklSSRwOjLFDtorsDC03GX9euxE4wNWuU+QT1/5E=;
        b=CLnTQuIcWCo1SRQxC0ve5FCy/oSQgzGxgOYL6/o9I2qtiZNavVxXy0jgePXr25z3Dp
         E+jTAbf7DU7s+MWmKaWj2W1hrfJu8haLz7EU7JF/S0UlskRwIRp3luZRnznmVVtF+mCg
         Pe43kx6kpnnIXIvTh4mBm+Py0Ebe/RpYymD/Vjx3c3FusZrcUI6NOI2+FAjtXs5HNNLO
         qa08LAY2CVO3l8ct27o2Pe38BAKMkIaOD3Tx0kOkfFOrUC0H0shn3xMUfiqxqOfGKEQX
         O+Q46CoNfxdndxoW0NTdC5VL2O1pXuo+EtN0SQdAMmO5IhZLD2WsBima76GxGy8fIcfn
         1Q8w==
X-Gm-Message-State: AOJu0Yy9g51VfPT8cmlw3jjO2wEE6aaNwBUSIslVIGENGFCEiZOMLvL3
	0beHso2jTo4OLQ48cBVTVjoiG9zVweSrdRFf0TszIeQri+iuG11vKSNtWr8IaYh1HaoHdY7YdZI
	vxAoGGSFoTM79J2vdvHpT4hr6TEIUsScHDWg0VkeLv4dCIZTAOZLlGQhrA+poauUDmw==
X-Gm-Gg: AfdE7cnz+++81Mwdvdoou/JwZR1NlL2CHPX5iOR0Tw87Jww1sbqH9Qk8zoOWUtixdx4
	9ziC58Qyft/x9dB8DbQCEC00gfICjdN8W+8GBuHp2jstVrQV3AgCSoUd6v67e7WNeFbzYVrUIGE
	3AYANiJQTpWTs6bN6LJckQOkToXqRYMTFG7D0KK6L+gobS01AXToSYdx55u1TFLWxpI0KN+oyxr
	xFHmbIXwva/chaYWKuEaAdAWf/GsdeTg9pmC66Q73p2ww+oaGR20tbtF3KBoxlqXibXi83ucwmc
	u04K8Q/qUMcULLeHKcwCrYERUGd22dZXqY2CddJd4hv4vne/jxSUqBRbYVnXrtndjemQ6iegrTT
	eS015KZcd35DfswPOvwPp+RpoIaFjv7Q+PAdba+MV7hLh
X-Received: by 2002:a17:903:1107:b0:2ba:7881:948d with SMTP id d9443c01a7336-2c7e1412c1fmr37650745ad.1.1782313809929;
        Wed, 24 Jun 2026 08:10:09 -0700 (PDT)
X-Received: by 2002:a17:903:1107:b0:2ba:7881:948d with SMTP id d9443c01a7336-2c7e1412c1fmr37650275ad.1.1782313809257;
        Wed, 24 Jun 2026 08:10:09 -0700 (PDT)
Received: from [10.204.101.214] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7f5ae5ecfsm367535ad.21.2026.06.24.08.10.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jun 2026 08:10:08 -0700 (PDT)
Message-ID: <09f6f0bd-6bde-4dbf-9be7-623c17232b16@oss.qualcomm.com>
Date: Wed, 24 Jun 2026 20:40:02 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 13/16] media: iris: Introduce buffer size calculations
 for AR50LT
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
References: <20260616-iris-ar50lt-v5-0-583b42770b6a@oss.qualcomm.com>
 <20260616-iris-ar50lt-v5-13-583b42770b6a@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260616-iris-ar50lt-v5-13-583b42770b6a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDEyNyBTYWx0ZWRfX6seUbz8yDhL5
 82BCPXaZ87b/q71vm/cK2GvqZQzAtHjBjxIEKosfEXLzkVffCIj9s4sOzYGw1UasaJ/sW4CTRL7
 OAh5cKOrxdwnzXXAfuBC74aEsguhIjU=
X-Proofpoint-GUID: I7WIlUvaslU8TBIKFw08e42jZEQ3cdU5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDEyNyBTYWx0ZWRfX/dC3QOoHmqcO
 /B/qkr/HvBXNQWZoiKyfhCUYqjH5pedQHE0i9aakBCqGJ8I6OHcjnbyAvnIBgQLGwLdaz8t2RfU
 RqcKMgLYMHhRVcfnP5yFx/0yC74WA2f0veJMjIFZoMjzNuzV0K2salamyXgStBUmGcG/zbGQxZW
 MyL/98eFWdQTTqtCIaRyyqPVmXGauhkMvSrMnDRZmYYqvJyAi2ZIANIeuez6um/T8AjXR9Qt6kM
 29EJRqcvtnHnIFBheZsUfMrXu1TZn0MDSkROW1FICRmRkfaMHPe3HCukL6mfQcSMo+A65v0Jnmq
 cXMApRu0mxbLVNtnwpRJ3psL/BcS4kuOiHomZTzseTlcL84aVdBlghl2zdXC6IB/sZWf3i062CI
 iOAoemLWB15S6um3lkBPxf5IlddVHA==
X-Authority-Analysis: v=2.4 cv=NpbhtcdJ c=1 sm=1 tr=0 ts=6a3bf353 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=E2Jh6DGDdsfDr_tZIxwA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: I7WIlUvaslU8TBIKFw08e42jZEQ3cdU5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_03,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 spamscore=0 suspectscore=0
 phishscore=0 malwarescore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2606240127
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-65569-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:busanna.reddy@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:dikshita.agarwal@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8DDAA6BF962



On 6/16/2026 5:34 AM, Dmitry Baryshkov wrote:
> From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> 
> Introduces AR50LT  buffer size calculation for both encoder and
> decoder. Reuse the buffer size calculation which are common, while
> adding the AR50LT specific ones separately.
> 
> Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_vpu_buffer.c | 401 +++++++++++++++++++++
>   drivers/media/platform/qcom/iris/iris_vpu_buffer.h |  37 ++
>   2 files changed, 438 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
> index 4a39b8fef52b..ca03d6570513 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
> @@ -50,6 +50,32 @@ static u32 hfi_buffer_bin_h264d(u32 frame_width, u32 frame_height, u32 num_vpp_p
>   	return size_h264d_hw_bin_buffer(n_aligned_w, n_aligned_h, num_vpp_pipes);
>   }
>   
> +static u32 size_h264d_hw_bin_buffer_ar50lt(u32 frame_width, u32 frame_height, u32 num_vpp_pipes)
> +{
> +	u32 size_yuv, size_bin_hdr, size_bin_res;
> +
> +	size_yuv = ((frame_width * frame_height * 3) >> 1);
> +	if (size_yuv <= 1920 * 1088 * 3 / 2) {
> +		size_bin_hdr = size_yuv * H264_CABAC_HDR_RATIO_SM_TOT;
> +		size_bin_res = size_yuv * H264_CABAC_RES_RATIO_SM_TOT;
> +	} else {
> +		size_bin_hdr = (size_yuv * 3) / 5;
> +		size_bin_res = (size_yuv * 3) / 2;
> +	}
> +	size_bin_hdr = ALIGN(size_bin_hdr, DMA_ALIGNMENT);
> +	size_bin_res = ALIGN(size_bin_res, DMA_ALIGNMENT);
> +
> +	return size_bin_hdr + size_bin_res;
> +}
> +
> +static u32 hfi_buffer_bin_h264d_ar50lt(u32 frame_width, u32 frame_height, u32 num_vpp_pipes)
> +{
> +	u32 n_aligned_h = ALIGN(frame_height, 16);
> +	u32 n_aligned_w = ALIGN(frame_width, 16);
> +
> +	return size_h264d_hw_bin_buffer_ar50lt(n_aligned_w, n_aligned_h, num_vpp_pipes);
> +}
> +
>   static u32 size_av1d_hw_bin_buffer(u32 frame_width, u32 frame_height, u32 num_vpp_pipes)
>   {
>   	u32 size_yuv, size_bin_hdr, size_bin_res;
> @@ -103,6 +129,21 @@ static u32 hfi_buffer_bin_vp9d(u32 frame_width, u32 frame_height, u32 num_vpp_pi
>   	return _size * num_vpp_pipes;
>   }
>   
> +static u32 hfi_buffer_bin_vp9d_ar50lt(u32 frame_width, u32 frame_height, u32 num_vpp_pipes)
> +{
> +	u32 size_yuv, size;
> +
> +	size_yuv = ALIGN(frame_width, 16) * ALIGN(frame_height, 16) * 3 / 2;
> +	size_yuv = ALIGN(size_yuv, DMA_ALIGNMENT);
> +
> +	size = ALIGN(((((MAX(size_yuv, VPX_DECODER_FRAME_BIN_BUFFER_SIZE)) * 6) / 5) /

MAX() or max() ?

> +		      num_vpp_pipes), DMA_ALIGNMENT) +
> +		ALIGN((((MAX(size_yuv, VPX_DECODER_FRAME_BIN_BUFFER_SIZE)) * 4) / num_vpp_pipes),
> +		      DMA_ALIGNMENT);
> +
> +	return size * num_vpp_pipes;
> +}
> +
>   static u32 hfi_buffer_bin_h265d(u32 frame_width, u32 frame_height, u32 num_vpp_pipes)
>   {
>   	u32 n_aligned_w = ALIGN(frame_width, 16);
> @@ -111,6 +152,32 @@ static u32 hfi_buffer_bin_h265d(u32 frame_width, u32 frame_height, u32 num_vpp_p
>   	return size_h265d_hw_bin_buffer(n_aligned_w, n_aligned_h, num_vpp_pipes);
>   }
>   
> +static u32 size_h265d_hw_bin_buffer_ar50lt(u32 frame_width, u32 frame_height, u32 num_vpp_pipes)
> +{
> +	u32 size_yuv, size_bin_hdr, size_bin_res;
> +
> +	size_yuv = ((frame_width * frame_height * 3) >> 1);
> +	if (size_yuv <= ((BIN_BUFFER_THRESHOLD * 3) >> 1)) {
> +		size_bin_hdr = size_yuv * H265_CABAC_HDR_RATIO_SM_TOT;
> +		size_bin_res = size_yuv * H265_CABAC_RES_RATIO_SM_TOT;
> +	} else {
> +		size_bin_hdr = (size_yuv * 41) / 50;
> +		size_bin_res = (size_yuv * 59) / 50;
> +	}
> +	size_bin_hdr = ALIGN(size_bin_hdr, DMA_ALIGNMENT);
> +	size_bin_res = ALIGN(size_bin_res, DMA_ALIGNMENT);
> +
> +	return size_bin_hdr + size_bin_res;
> +}
> +
> +static u32 hfi_buffer_bin_h265d_ar50lt(u32 frame_width, u32 frame_height, u32 num_vpp_pipes)
> +{
> +	u32 n_aligned_w = ALIGN(frame_width, 16);
> +	u32 n_aligned_h = ALIGN(frame_height, 16);
> +
> +	return size_h265d_hw_bin_buffer_ar50lt(n_aligned_w, n_aligned_h, num_vpp_pipes);
> +}
> +
>   static u32 hfi_buffer_comv_h264d(u32 frame_width, u32 frame_height, u32 _comv_bufcount)
>   {
>   	u32 frame_height_in_mbs = DIV_ROUND_UP(frame_height, 16);
> @@ -174,6 +241,14 @@ static u32 size_h264d_bse_cmd_buf(u32 frame_height)
>   		SIZE_H264D_BSE_CMD_PER_BUF;
>   }
>   
> +static u32 size_h264d_bse_cmd_buf_ar50lt(u32 frame_height)
> +{
> +	u32 height = ALIGN(frame_height, 32);
> +
> +	return min_t(u32, (DIV_ROUND_UP(height, 16) * 12), H264D_MAX_SLICE) *
> +		SIZE_H264D_BSE_CMD_PER_BUF;
> +}
> +
>   static u32 size_h265d_bse_cmd_buf(u32 frame_width, u32 frame_height)
>   {
>   	u32 _size = ALIGN(((ALIGN(frame_width, LCU_MAX_SIZE_PELS) / LCU_MIN_SIZE_PELS) *
> @@ -185,6 +260,18 @@ static u32 size_h265d_bse_cmd_buf(u32 frame_width, u32 frame_height)
>   	return _size;
>   }
>   
> +static u32 size_h265d_bse_cmd_buf_ar50lt(u32 frame_width, u32 frame_height)
> +{
> +	u32 _size = ALIGN(((ALIGN(frame_width, LCU_MAX_SIZE_PELS) / LCU_MIN_SIZE_PELS) *
> +			   (ALIGN(frame_height, LCU_MAX_SIZE_PELS) / LCU_MIN_SIZE_PELS)) *
> +			    NUM_HW_PIC_BUF, DMA_ALIGNMENT);
> +
> +	_size = min_t(u32, _size, H265D_MAX_SLICE_AR50LT + 1);
> +	_size = 2 * _size * SIZE_H265D_BSE_CMD_PER_BUF;
> +
> +	return _size;
> +}
> +
>   static u32 hfi_buffer_persist_h265d(u32 rpu_enabled)
>   {
>   	return ALIGN((SIZE_SLIST_BUF_H265 * NUM_SLIST_BUF_H265 +
> @@ -195,6 +282,13 @@ static u32 hfi_buffer_persist_h265d(u32 rpu_enabled)
>   		     DMA_ALIGNMENT);
>   }
>   
> +static u32 hfi_buffer_persist_h265d_ar50lt(void)
> +{
> +	return ALIGN((SIZE_SLIST_BUF_H265 * NUM_SLIST_BUF_H265 +
> +		      H265_NUM_TILE * sizeof(u32) + NUM_HW_PIC_BUF * SIZE_SEI_USERDATA),
> +		     DMA_ALIGNMENT);
> +}
> +
>   static inline
>   u32 hfi_iris3_vp9d_comv_size(void)
>   {
> @@ -212,6 +306,13 @@ static u32 hfi_buffer_persist_vp9d(void)
>   		HDR10_HIST_EXTRADATA_SIZE;
>   }
>   
> +static u32 hfi_buffer_persist_vp9d_ar50lt(void)
> +{
> +	return ALIGN(VP9_NUM_PROBABILITY_TABLE_BUF * VP9_PROB_TABLE_SIZE, DMA_ALIGNMENT) +
> +		ALIGN(hfi_iris3_vp9d_comv_size(), DMA_ALIGNMENT) +
> +		ALIGN(MAX_SUPERFRAME_HEADER_LEN, DMA_ALIGNMENT);
> +}
> +
>   static u32 size_h264d_vpp_cmd_buf(u32 frame_height)
>   {
>   	u32 size, height = ALIGN(frame_height, 32);
> @@ -222,6 +323,16 @@ static u32 size_h264d_vpp_cmd_buf(u32 frame_height)
>   	return size > VPP_CMD_MAX_SIZE ? VPP_CMD_MAX_SIZE : size;
>   }
>   
> +static u32 size_h264d_vpp_cmd_buf_ar50lt(u32 frame_height)
> +{
> +	u32 size, height = ALIGN(frame_height, 32);
> +
> +	size = min_t(u32, (DIV_ROUND_UP(height, 16) * 12), H264D_MAX_SLICE) *
> +		SIZE_H264D_VPP_CMD_PER_BUF;
> +
> +	return size > VPP_CMD_MAX_SIZE ? VPP_CMD_MAX_SIZE : size;
> +}
> +
>   static u32 hfi_buffer_persist_h264d(void)
>   {
>   	return ALIGN(SIZE_SLIST_BUF_H264 * NUM_SLIST_BUF_H264 +
> @@ -230,6 +341,11 @@ static u32 hfi_buffer_persist_h264d(void)
>   		    DMA_ALIGNMENT);
>   }
>   
> +static u32 hfi_buffer_persist_h264d_ar50lt(void)
> +{
> +	return ALIGN((SIZE_SLIST_BUF_H264 * NUM_SLIST_BUF_H264), DMA_ALIGNMENT);
> +}
> +
>   static u32 hfi_buffer_persist_av1d(u32 max_width, u32 max_height, u32 total_ref_count)
>   {
>   	u32 comv_size, size;
> @@ -255,6 +371,17 @@ static u32 hfi_buffer_non_comv_h264d(u32 frame_width, u32 frame_height, u32 num_
>   	return ALIGN(size, DMA_ALIGNMENT);
>   }
>   
> +static u32 hfi_buffer_non_comv_h264d_ar50lt(u32 frame_width, u32 frame_height, u32 num_vpp_pipes)
> +{
> +	u32 size_bse = size_h264d_bse_cmd_buf_ar50lt(frame_height);
> +	u32 size_vpp = size_h264d_vpp_cmd_buf_ar50lt(frame_height);
> +	u32 size = ALIGN(size_bse, DMA_ALIGNMENT) +
> +		ALIGN(size_vpp, DMA_ALIGNMENT) +
> +		ALIGN(SIZE_HW_PIC(SIZE_H264D_HW_PIC_T), DMA_ALIGNMENT);
> +
> +	return ALIGN(size, DMA_ALIGNMENT);
> +}
> +
>   static u32 size_h265d_vpp_cmd_buf(u32 frame_width, u32 frame_height)
>   {
>   	u32 _size = ALIGN(((ALIGN(frame_width, LCU_MAX_SIZE_PELS) / LCU_MIN_SIZE_PELS) *
> @@ -269,6 +396,20 @@ static u32 size_h265d_vpp_cmd_buf(u32 frame_width, u32 frame_height)
>   	return _size;
>   }
>   
> +static u32 size_h265d_vpp_cmd_buf_ar50lt(u32 frame_width, u32 frame_height)
> +{
> +	u32 _size = ALIGN(((ALIGN(frame_width, LCU_MAX_SIZE_PELS) / LCU_MIN_SIZE_PELS) *
> +			   (ALIGN(frame_height, LCU_MAX_SIZE_PELS) / LCU_MIN_SIZE_PELS)) *
> +			  NUM_HW_PIC_BUF, DMA_ALIGNMENT);
> +	_size = min_t(u32, _size, H265D_MAX_SLICE_AR50LT + 1);
> +	_size = ALIGN(_size, 4);
> +	_size = 2 * _size * SIZE_H265D_VPP_CMD_PER_BUF_AR50LT;
> +	if (_size > VPP_CMD_MAX_SIZE)
> +		_size = VPP_CMD_MAX_SIZE;
> +
> +	return _size;
> +}
> +
>   static u32 hfi_buffer_non_comv_h265d(u32 frame_width, u32 frame_height, u32 num_vpp_pipes)
>   {
>   	u32 _size_bse = size_h265d_bse_cmd_buf(frame_width, frame_height);
> @@ -285,6 +426,20 @@ static u32 hfi_buffer_non_comv_h265d(u32 frame_width, u32 frame_height, u32 num_
>   	return ALIGN(_size, DMA_ALIGNMENT);
>   }
>   
> +static u32 hfi_buffer_non_comv_h265d_ar50lt(u32 frame_width, u32 frame_height, u32 num_vpp_pipes)
> +{
> +	u32 _size_bse = size_h265d_bse_cmd_buf_ar50lt(frame_width, frame_height);
> +	u32 _size_vpp = size_h265d_vpp_cmd_buf_ar50lt(frame_width, frame_height);
> +	u32 _size = ALIGN(_size_bse, DMA_ALIGNMENT) +
> +		ALIGN(_size_vpp, DMA_ALIGNMENT) +
> +		ALIGN(2 * sizeof(u16) *
> +		(ALIGN(frame_width, LCU_MAX_SIZE_PELS) / LCU_MIN_SIZE_PELS) *
> +		(ALIGN(frame_height, LCU_MAX_SIZE_PELS) / LCU_MIN_SIZE_PELS), DMA_ALIGNMENT) +
> +		ALIGN(SIZE_HW_PIC(SIZE_H265D_HW_PIC_T), DMA_ALIGNMENT);
> +
> +	return ALIGN(_size, DMA_ALIGNMENT);
> +}
> +
>   static u32 size_vpss_lb(u32 frame_width, u32 frame_height)
>   {
>   	u32 opb_lb_wr_llb_y_buffer_size, opb_lb_wr_llb_uv_buffer_size;
> @@ -317,6 +472,13 @@ u32 size_h265d_lb_fe_top_data(u32 frame_width, u32 frame_height)
>   		(ALIGN(frame_width, 64) + 8) * 2;
>   }
>   
> +static inline
> +u32 size_h265d_lb_fe_top_data_ar50lt(u32 frame_width, u32 frame_height)
> +{
> +	return ALIGN(MAX_FE_NBR_DATA_LUMA_LINE_BUFFER_SIZE *
> +		(ALIGN(frame_width, 64) + 8), DMA_ALIGNMENT) * 2;
> +}
> +
>   static inline
>   u32 size_h265d_lb_fe_top_ctrl(u32 frame_width, u32 frame_height)
>   {
> @@ -348,6 +510,17 @@ u32 size_h265d_lb_se_left_ctrl(u32 frame_width, u32 frame_height)
>   		MAX_SE_NBR_CTRL_LCU64_LINE_BUFFER_SIZE));
>   }
>   
> +static inline
> +u32 size_h265d_lb_se_left_ctrl_ar50lt(u32 frame_width, u32 frame_height)
> +{
> +	return max_t(u32, ((frame_height + 16 - 1) / 8) *
> +		MAX_SE_NBR_CTRL_LCU16_LINE_BUFFER_SIZE_AR50LT,
> +		max_t(u32, ((frame_height + 32 - 1) / 8) *
> +		MAX_SE_NBR_CTRL_LCU32_LINE_BUFFER_SIZE_AR50LT,
> +		((frame_height + 64 - 1) / 8) *
> +		MAX_SE_NBR_CTRL_LCU64_LINE_BUFFER_SIZE_AR50LT));
> +}
> +
>   static inline
>   u32 size_h265d_lb_pe_top_data(u32 frame_width, u32 frame_height)
>   {
> @@ -355,6 +528,13 @@ u32 size_h265d_lb_pe_top_data(u32 frame_width, u32 frame_height)
>   		(ALIGN(frame_width, LCU_MIN_SIZE_PELS) / LCU_MIN_SIZE_PELS);
>   }
>   
> +static inline
> +u32 size_h265d_lb_pe_top_data_ar50lt(u32 frame_width, u32 frame_height)
> +{
> +	return MAX_PE_NBR_DATA_LCU64_LINE_BUFFER_SIZE_AR50LT *
> +		(ALIGN(frame_width, LCU_MIN_SIZE_PELS) / LCU_MIN_SIZE_PELS);
> +}
> +
>   static inline
>   u32 size_h265d_lb_vsp_top(u32 frame_width, u32 frame_height)
>   {
> @@ -404,6 +584,29 @@ u32 hfi_buffer_line_h265d(u32 frame_width, u32 frame_height, bool is_opb, u32 nu
>   	return ALIGN((_size + vpss_lb_size), DMA_ALIGNMENT);
>   }
>   
> +static inline
> +u32 hfi_buffer_line_h265d_ar50lt(u32 frame_width, u32 frame_height, bool is_opb, u32 num_vpp_pipes)
> +{
> +	u32 size;
> +
> +	size = ALIGN(size_h265d_lb_fe_top_data_ar50lt(frame_width, frame_height), DMA_ALIGNMENT) +
> +		ALIGN(size_h265d_lb_fe_top_ctrl(frame_width, frame_height), DMA_ALIGNMENT) +
> +		ALIGN(size_h265d_lb_fe_left_ctrl(frame_width, frame_height),
> +		      DMA_ALIGNMENT) * num_vpp_pipes +
> +		ALIGN(size_h265d_lb_se_left_ctrl_ar50lt(frame_width, frame_height),
> +		      DMA_ALIGNMENT) * num_vpp_pipes +
> +		ALIGN(size_h265d_lb_se_top_ctrl(frame_width, frame_height), DMA_ALIGNMENT) +
> +		ALIGN(size_h265d_lb_pe_top_data_ar50lt(frame_width, frame_height), DMA_ALIGNMENT) +
> +		ALIGN(size_h265d_lb_vsp_top(frame_width, frame_height), DMA_ALIGNMENT) +
> +		ALIGN(size_h265d_lb_vsp_left(frame_width, frame_height),
> +		      DMA_ALIGNMENT) * num_vpp_pipes +
> +		ALIGN(size_h265d_lb_recon_dma_metadata_wr(frame_width, frame_height),
> +		      DMA_ALIGNMENT) * 4 +
> +		ALIGN(size_h265d_qp(frame_width, frame_height), DMA_ALIGNMENT);
> +
> +	return ALIGN(size, DMA_ALIGNMENT);
> +}
> +
>   static inline
>   u32 size_vpxd_lb_fe_left_ctrl(u32 frame_width, u32 frame_height)
>   {
> @@ -438,6 +641,17 @@ u32 size_vpxd_lb_se_left_ctrl(u32 frame_width, u32 frame_height)
>   			   MAX_SE_NBR_CTRL_LCU64_LINE_BUFFER_SIZE));
>   }
>   
> +static inline
> +u32 size_vpxd_lb_se_left_ctrl_ar50lt(u32 frame_width, u32 frame_height)
> +{
> +	return max_t(u32, ((frame_height + 15) >> 4) *
> +		     MAX_SE_NBR_CTRL_LCU16_LINE_BUFFER_SIZE_AR50LT,
> +		     max_t(u32, ((frame_height + 31) >> 5) *
> +			   MAX_SE_NBR_CTRL_LCU32_LINE_BUFFER_SIZE_AR50LT,
> +			   ((frame_height + 63) >> 6) *
> +			   MAX_SE_NBR_CTRL_LCU64_LINE_BUFFER_SIZE_AR50LT));
> +}
> +
>   static inline
>   u32 size_vpxd_lb_recon_dma_metadata_wr(u32 frame_width, u32 frame_height)
>   {
> @@ -492,6 +706,19 @@ u32 hfi_iris3_vp9d_lb_size(u32 frame_width, u32 frame_height, u32 num_vpp_pipes)
>   		ALIGN(size_vp9d_qp(frame_width, frame_height), DMA_ALIGNMENT);
>   }
>   
> +static inline
> +u32 hfi_ar50lt_vp9d_lb_size(u32 frame_width, u32 frame_height, u32 num_vpp_pipes)
> +{
> +	return ALIGN(size_vpxd_lb_fe_left_ctrl(frame_width, frame_height), DMA_ALIGNMENT) *
> +		num_vpp_pipes +
> +		ALIGN(size_vpxd_lb_se_left_ctrl_ar50lt(frame_width, frame_height), DMA_ALIGNMENT) *
> +		num_vpp_pipes +
> +		ALIGN(size_vp9d_lb_vsp_top(frame_width, frame_height), DMA_ALIGNMENT) +
> +		ALIGN(size_vpxd_lb_se_top_ctrl(frame_width, frame_height), DMA_ALIGNMENT) +
> +		ALIGN(size_vp9d_lb_pe_top_data(frame_width, frame_height), DMA_ALIGNMENT) +
> +		ALIGN(size_vp9d_lb_fe_top_data(frame_width, frame_height), DMA_ALIGNMENT);
> +}
> +
>   static inline
>   u32 hfi_buffer_line_vp9d(u32 frame_width, u32 frame_height, u32 _yuv_bufcount_min, bool is_opb,
>   			 u32 num_vpp_pipes)
> @@ -507,6 +734,13 @@ u32 hfi_buffer_line_vp9d(u32 frame_width, u32 frame_height, u32 _yuv_bufcount_mi
>   	return _lb_size + vpss_lb_size + 4096;
>   }
>   
> +static inline
> +u32 hfi_buffer_line_vp9d_ar50lt(u32 frame_width, u32 frame_height, u32 _yuv_bufcount_min,
> +				bool is_opb, u32 num_vpp_pipes)
> +{
> +	return hfi_ar50lt_vp9d_lb_size(frame_width, frame_height, num_vpp_pipes);

pls keep same name across like "hfi_buffer_line_vp9d_ar50lt" and 
"hfi_ar50lt_vp9d_lb_size" or combine these 2 apis, as the one just calls 
the other.

> +}
> +
>   static u32 hfi_buffer_line_h264d(u32 frame_width, u32 frame_height,
>   				 bool is_opb, u32 num_vpp_pipes)
>   {
> @@ -529,6 +763,25 @@ static u32 hfi_buffer_line_h264d(u32 frame_width, u32 frame_height,
>   	return ALIGN((size + vpss_lb_size), DMA_ALIGNMENT);
>   }
>   
> +static u32 hfi_buffer_line_h264d_ar50lt(u32 frame_width, u32 frame_height,
> +					bool is_opb, u32 num_vpp_pipes)
> +{
> +	u32 size;
> +
> +	size = ALIGN(size_h264d_lb_fe_top_data_ar50lt(frame_width), DMA_ALIGNMENT) +
> +		ALIGN(size_h264d_lb_fe_top_ctrl_ar50lt(frame_width), DMA_ALIGNMENT) +
> +		ALIGN(size_h264d_lb_fe_left_ctrl(frame_height), DMA_ALIGNMENT) * num_vpp_pipes +
> +		ALIGN(size_h264d_lb_se_top_ctrl_ar50lt(frame_width), DMA_ALIGNMENT) +
> +		ALIGN(size_h264d_lb_se_left_ctrl_ar50lt(frame_height), DMA_ALIGNMENT) *
> +		num_vpp_pipes +
> +		ALIGN(size_h264d_lb_pe_top_data_ar50lt(frame_width), DMA_ALIGNMENT) +
> +		ALIGN(size_h264d_lb_vsp_top(frame_width), DMA_ALIGNMENT) +
> +		ALIGN(size_h264d_lb_recon_dma_metadata_wr(frame_height), DMA_ALIGNMENT) * 2 +
> +		ALIGN(size_h264d_qp(frame_width, frame_height), DMA_ALIGNMENT);
> +
> +	return ALIGN(size, DMA_ALIGNMENT);
> +}
> +
>   static u32 size_av1d_lb_opb_wr1_nv12_ubwc(u32 frame_width, u32 frame_height)
>   {
>   	u32 size, y_width, y_width_a = 128;
> @@ -724,6 +977,23 @@ static u32 iris_vpu_dec_bin_size(struct iris_inst *inst)
>   	return 0;
>   }
>   
> +static u32 iris_vpu_ar50lt_dec_bin_size(struct iris_inst *inst)
> +{
> +	u32 num_vpp_pipes = inst->core->iris_platform_data->num_vpp_pipe;
> +	struct v4l2_format *f = inst->fmt_src;
> +	u32 height = f->fmt.pix_mp.height;
> +	u32 width = f->fmt.pix_mp.width;
> +
> +	if (inst->codec == V4L2_PIX_FMT_H264)
> +		return hfi_buffer_bin_h264d_ar50lt(width, height, num_vpp_pipes);
> +	else if (inst->codec == V4L2_PIX_FMT_HEVC)
> +		return hfi_buffer_bin_h265d_ar50lt(width, height, num_vpp_pipes);
> +	else if (inst->codec == V4L2_PIX_FMT_VP9)
> +		return hfi_buffer_bin_vp9d_ar50lt(width, height, num_vpp_pipes);
> +
> +	return 0;
> +}
> +
>   static u32 iris_vpu_dec_comv_size(struct iris_inst *inst)
>   {
>   	u32 num_comv = VIDEO_MAX_FRAME;
> @@ -785,6 +1055,18 @@ static u32 iris_vpu_dec_persist_size(struct iris_inst *inst)
>   	return 0;
>   }
>   
> +static u32 iris_vpu_ar50lt_dec_persist_size(struct iris_inst *inst)
> +{
> +	if (inst->codec == V4L2_PIX_FMT_H264)
> +		return hfi_buffer_persist_h264d_ar50lt();
> +	else if (inst->codec == V4L2_PIX_FMT_HEVC)
> +		return hfi_buffer_persist_h265d_ar50lt();
> +	else if (inst->codec == V4L2_PIX_FMT_VP9)
> +		return hfi_buffer_persist_vp9d_ar50lt();
> +
> +	return 0;
> +}
> +
>   static u32 iris_vpu_dec_dpb_size(struct iris_inst *inst)
>   {
>   	if (iris_split_mode_enabled(inst))
> @@ -808,6 +1090,21 @@ static u32 iris_vpu_dec_non_comv_size(struct iris_inst *inst)
>   	return 0;
>   }
>   
> +static u32 iris_vpu_ar50lt_dec_non_comv_size(struct iris_inst *inst)
> +{
> +	u32 num_vpp_pipes = inst->core->iris_platform_data->num_vpp_pipe;

neither of below api uses this variable ?

> +	struct v4l2_format *f = inst->fmt_src;
> +	u32 height = f->fmt.pix_mp.height;
> +	u32 width = f->fmt.pix_mp.width;
> +
> +	if (inst->codec == V4L2_PIX_FMT_H264)
> +		return hfi_buffer_non_comv_h264d_ar50lt(width, height, num_vpp_pipes);
> +	else if (inst->codec == V4L2_PIX_FMT_HEVC)
> +		return hfi_buffer_non_comv_h265d_ar50lt(width, height, num_vpp_pipes);
> +
> +	return 0;
> +}
> +
>   static u32 iris_vpu_dec_line_size(struct iris_inst *inst)
>   {
>   	u32 num_vpp_pipes = inst->core->iris_platform_data->num_vpp_pipe;
> @@ -833,6 +1130,29 @@ static u32 iris_vpu_dec_line_size(struct iris_inst *inst)
>   	return 0;
>   }
>   
Regards,
Vikash

