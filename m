Return-Path: <linux-media+bounces-55725-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QLrpAogxtGn4igAAu9opvQ
	(envelope-from <linux-media+bounces-55725-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 16:47:20 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6341A2864F2
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 16:47:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 13AB132012A1
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 15:41:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9E3F3BFE2A;
	Fri, 13 Mar 2026 15:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wyq2R13q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jWMcsWqW"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 374A43C279B
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 15:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773416507; cv=none; b=brKl3FM/vosJp2W2YWnFNrk8VpubCNCLDzpWiP9EgG1ufS1qyx8R0321hi8QFf4I61VAjO6+QfgQNk6yxyFCioniTyH2mxjCEyAKXdTdKWLmKgfuZ7dQ2/AaVCHiCoOxVQthHzsgi6E/HsJxfxVPope1BuNL7hquImrik8VIO+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773416507; c=relaxed/simple;
	bh=MaiIry6g1HGAhKzGVifNyMsE7l9EPQrOe+s3ZJ/XqnY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MCVWpIzPnyYqiaDySWDZFdJOPckKz3MZjkIY30wEKF/dErOb8/VXHzp8ynO7BxNnq2TibcCgB7WQmdU+s1yzv3ALRW026aq0h760dVfxmFdelL4cSA1tPUEJM/8Nf8H/SSGbzCTGATwOoJfPvQicsu5Kw6K0lzhMG5zp2f53bEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wyq2R13q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jWMcsWqW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62DD8oGn793568
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 15:41:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3huDFL/uMHzUyF/m5Jbypl50
	A1EHb0E/+PjkLmvRWTo=; b=Wyq2R13q9o/OD7KN1zwANuwq3sI3bpjvBs5kTnpz
	szKqQYaGWr6fRxkPO4H5OsyUuJ5OzJPHpKH5jip8P5aInYOBF0iijWdALEO6Y/cR
	grEralZ51vN/COja16IW+SEBJqOSNoSYDUNsabRyYaURSVLLGaR0Bw49DgFw9DhM
	a+L/3D2QRCGdyGhiA969NEWYNzcNsHmyc0GFIUB8cH/LjKsF4okWqDYnGglz/fQl
	uX2ELVnCGDS217qoVTuI8gig7SNb7RxPV5Vw6/kWSNhhBvFWpXvINJRdKcZEvoiR
	EWg4d9l+mD/Kci4iEXUIgkPZ9jxo2GAjFjCY5tHPBp/llA==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvdnt1v0m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 15:41:44 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-56b252a4ce2so26911088e0c.3
        for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 08:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773416503; x=1774021303; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3huDFL/uMHzUyF/m5Jbypl50A1EHb0E/+PjkLmvRWTo=;
        b=jWMcsWqWs+6Sme/WL2/PeQGV4fnEYKDBOyz2HiapoDysO1VpIwG8clofBMy3ujkC7v
         UNabBhxseKtInmtlsyNBkI20uspKlBAjTGre3U4sC8MOiU8sL1kQKS4e4IpX33P9BwHA
         KgtNneYhRzV9CzV/oaOduTGHFF97lLhc7UrVstNmUeUjMvANkT9uwh1aENqIv8exeGHc
         NuLGZTTB6EpscJtUuAjOPB9iMi6bwwc+mGm163TSzooVcas3O5wHST8LuuKLITmHCvT0
         AGqyeSXxnHq0ITIMIusFbOeDAfL7ePRBKL/LMHR/XJ2vsjN0G1pfMITc3q5mxjLyZeAo
         o6SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773416503; x=1774021303;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3huDFL/uMHzUyF/m5Jbypl50A1EHb0E/+PjkLmvRWTo=;
        b=eeDBoe9YloY24Hgw4M6TpNNGQmvMi186SFOl2qcvAlXpRMFzL7xeL98s7rkhWSl3z5
         co1L+SvVy0ksMwps3QVnFICXYvNFT1D+YVXzjVMAynT3q0xzsbMtgtdioKQZilzJh7k2
         qTUGDfG6R40+ajDB41704c16Mm1b2psydwNf5dWKEQlxnaBrSS4KOTOzFumRMb5dgON0
         RzNJLLkBjSHmjdYQZ14mJ0bejtWWDgr4yBk1uOqrh4wLKFeP2M94PJ3H/Jhmqhj8JM75
         8RERrEAqyyMnJtrXszUIxekvNBwaV1lA2lVAik1y8pYMeox46vNvZlpdyZOd35rwxS7R
         HnRw==
X-Forwarded-Encrypted: i=1; AJvYcCUVKlLaJ8lZg3w3DLDoF0Tpnoy4fdpnNRTXrNIkLEA4NybIb4nJV0rQc1vIf7/cyJx/zgJ12IJStkCTGA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyf/jBlGlRTZRZRlF6GONX0czYskM2p8mcnqDICM0Ka50DdW13T
	womoIFGpIbruRs8VwcnHXBj9i+sjeZs3tdb1otwJCKYiZlSOj2DxDaVDwURA4sE1IRGCuHR9q9B
	aPimjsVVS/MEJybkdF5lVmv8/4jK5TwnG/2W8pmmZ/QtzavhXJrBG5eliBFYByIVs4Q==
X-Gm-Gg: ATEYQzyd3lMqTCn6heDT7xAoy3syF708JQ7+1FIk6usPhtUn/QOv6K6xcWLXxm5uTFO
	A0fRSnPdUVg1wBMNuMDV9SJ6dARmOYzTUhT3NeKvKOhWuS1d14EkF54FJJ9qagwmw8XyvaKb4WU
	t+03bu3u0TpqgzEolyZg256/b3mEpAJ6+jabjvFpGMcefTcakVbWvfKVsyu5XScTn9jJiGDZhoY
	TWRIi0WkouDW9TcCjKqfdrWWWSiH6QCDJ0mhoMLO5nC9PcpAcbdeEMoQyyS1v5JL4dVyQ5ylkB1
	zsDr667j6WgKlspys+kLW/B+t0YzgMayKEOTTK/tE+1yyhQUjZCO+aQ+ATWkhwL2Ryofd8EYlH4
	/ESeFrbmMxy8B/cOvOj6pajJEdqRxFiTydTDpvd5duwDZxis4W8o8PieN/8ZvOhYoQna7dAblI0
	eqLPx32ZLttu6bDI1oN0M27WiGl1aPb+inudw=
X-Received: by 2002:a05:6102:508c:b0:600:a2:1397 with SMTP id ada2fe7eead31-6020e5345d4mr1755113137.25.1773416503375;
        Fri, 13 Mar 2026 08:41:43 -0700 (PDT)
X-Received: by 2002:a05:6102:508c:b0:600:a2:1397 with SMTP id ada2fe7eead31-6020e5345d4mr1755102137.25.1773416502957;
        Fri, 13 Mar 2026 08:41:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a67e5ed6esm14182221fa.23.2026.03.13.08.41.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 08:41:41 -0700 (PDT)
Date: Fri, 13 Mar 2026 17:41:40 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [PATCH v3 5/7] media: iris: add helper to select context bank
 device
Message-ID: <5a33eitlctupl5b65zr33kukfgru22qldkmfiyzlq6buczttmk@5nayj7qea3fq>
References: <20260313-kaanapali-iris-v3-0-9c0d1a67af4b@oss.qualcomm.com>
 <20260313-kaanapali-iris-v3-5-9c0d1a67af4b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260313-kaanapali-iris-v3-5-9c0d1a67af4b@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=KZrfcAYD c=1 sm=1 tr=0 ts=69b43038 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=m0VDa53i6esOPautn7AA:9 a=CjuIK1q_8ugA:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-GUID: KnE7iAqhec3glfHAegUfw366Z4kZOOvX
X-Proofpoint-ORIG-GUID: KnE7iAqhec3glfHAegUfw366Z4kZOOvX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDEyNSBTYWx0ZWRfX0EZ51LPtG7IA
 6JJgsBdKdpXLLiCIKQGE3XhkB/8bqqP6iH8eMfbkFAcL7fULhdQ3Idp/60IsuPusjNQJSVpvf1y
 +ez8brs3VdQwiiYvQPiaqulCLqyR7gD8CmGLzbr6MqHghNbKGmyto+P/83RW016Eh1/6tjJhAYZ
 o0b52/L70IfUDH0TTQTJyJhiGepL26iwQDzV5J846ElgHbtrmuHIPp05IylSERhCgS9HUBviQqr
 5JzRX2fU+ZI5oPwiaqb1TS+WmjdfObeD+/568aGT5GNCfKXVmQr5niP698L9r8q9Vy3qVZNGJsE
 0d06RuBas3jtm8sHp+H7pvGPf0yY2cIr4geangBcjGB5kI4ipp0D7GZ7TiimRJ7xkOfBqidLeoB
 z+J2zdcFKi3gzKazWcIYaRPy55772cLpUpOpayX9hMrTLgNO74E42FWu7nz62t/PKYFnEpD4cw+
 C+Fqb1deMQVXwEVwYOw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 malwarescore=0 impostorscore=0 adultscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130125
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-55725-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6341A2864F2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 13, 2026 at 06:49:39PM +0530, Vikash Garodia wrote:
> Depending on the buffer type (input, output, internal and interface
> queues), associated context bank is selected, if available. Fallback to
> parent device for backward compatibility.
> 
> Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_buffer.c    |  7 ++--
>  drivers/media/platform/qcom/iris/iris_hfi_queue.c | 16 +++++----
>  drivers/media/platform/qcom/iris/iris_resources.c | 41 +++++++++++++++++++++++
>  drivers/media/platform/qcom/iris/iris_resources.h |  2 ++
>  drivers/media/platform/qcom/iris/iris_vidc.c      |  4 +--
>  5 files changed, 58 insertions(+), 12 deletions(-)
> 
> @@ -187,3 +188,43 @@ int iris_create_child_device_and_map(struct iris_core *core, const struct iris_c
>  
>  	return 0;
>  }
> +
> +enum iris_buffer_region iris_get_region(struct iris_inst *inst, enum iris_buffer_type buffer_type)
> +{
> +	switch (buffer_type) {
> +	case BUF_INPUT:
> +		if (inst->domain == ENCODER)
> +			return IRIS_PIXEL_REGION;
> +		else
> +			return IRIS_BITSTREAM_REGION;
> +	case BUF_OUTPUT:
> +		if (inst->domain == ENCODER)
> +			return IRIS_BITSTREAM_REGION;
> +		else
> +			return IRIS_PIXEL_REGION;
> +	case BUF_BIN:
> +		return IRIS_BITSTREAM_REGION;
> +	case BUF_DPB:
> +	case BUF_PARTIAL:
> +	case BUF_SCRATCH_2:
> +	case BUF_VPSS:
> +		return IRIS_PIXEL_REGION;
> +	case BUF_ARP:
> +	case BUF_COMV:
> +	case BUF_LINE:
> +	case BUF_NON_COMV:
> +	case BUF_PERSIST:
> +		return IRIS_NON_PIXEL_REGION;
> +	default:
> +		dev_err(inst->core->dev, "unknown buffer type: %d\n", buffer_type);
> +		return IRIS_UNKNOWN_REGION;
> +	}
> +}
> +
> +struct device *iris_get_cb_dev(struct iris_core *core, enum iris_buffer_region region)

Are you going to call these two functions separately? If not, it's
easier to squash them.

> +{
> +	if (core->cb_devs[region])
> +		return core->cb_devs[region];
> +
> +	return core->dev;
> +}

-- 
With best wishes
Dmitry

