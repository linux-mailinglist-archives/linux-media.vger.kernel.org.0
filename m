Return-Path: <linux-media+bounces-57120-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sXu9IZe/xGnp3AQAu9opvQ
	(envelope-from <linux-media+bounces-57120-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 06:09:43 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E7E632F420
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 06:09:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 66767303DD59
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 05:06:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81E5034C9AF;
	Thu, 26 Mar 2026 05:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TwloJN/E";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cwI1hLMv"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A208834CFD6
	for <linux-media@vger.kernel.org>; Thu, 26 Mar 2026 05:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774501578; cv=none; b=UTbUcPL8UyN07hJ2SX3z4lXvj0BFjKovZSYj66ZM95J5LcpA/sdNj5GYnODk30tqDyCx8L3qK8i3TpEMsQn87u59B05uavLLhCpwaB3AmVhRiWbTdT4hmNRPTrgmoFHtBjA1JXMUJuIFC5WsCI4rE5rEooiX2VYzoWtfKtn4i34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774501578; c=relaxed/simple;
	bh=ObpuUhEncOlpi8q4Llh/6L0oowq9gECOdciNqUeKjLk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aUs+zkDT6YEPSNgSL0OHVGrsTJj8N3zjaHqbjemgq+ZowTOkFD0Eqf71B/9FqGk2X8rqjeTRavcsH+6xyCEGe+gkVXJ4kmS5wSOp9O20fTDhS6vcgKELWV8RbTFXNkwndlzdYb9Cg7v902qzNaOrkm+9FpslLkpOS1VuBO0M2E0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TwloJN/E; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cwI1hLMv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62Q05hOs1432152
	for <linux-media@vger.kernel.org>; Thu, 26 Mar 2026 05:06:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kX/Q4tA/GGa5kkY3FZPPynvH5D47EXWFc+DBBlWPBDw=; b=TwloJN/EuipuqjgI
	ewx4ZWUoLxUzztkbX8sN4O8oWa/BefS83UksG56Ds8pzxKKR+CA2XsMKKwqOqSmh
	eiuDd3ojea2YJNNvzA1qhC3yC2Kj7G6xd4nLJk5DxcQhrSWb7HGiFeiyq1EKQ5qT
	wsZ1Xib8AuBQsGchz+JAQ3b5grWLJwMg8b/3RYd+2zRv4DV86uMTvfAyIDDL+Gvt
	aljeE66UU8CVMreOnssvgqueIsK8ZzD4A4gbebKZQVnv3IPWNDxJl/ubN+fgjlbO
	B0hl+kBG/o/rnEmvOimIr6LTNj6OAYbwoT/gs1qWH5AbU0014PcQWUyTQyoXV69I
	u7GWRw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4jc52eb0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 26 Mar 2026 05:06:16 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-35c1107da15so899287a91.2
        for <linux-media@vger.kernel.org>; Wed, 25 Mar 2026 22:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774501576; x=1775106376; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kX/Q4tA/GGa5kkY3FZPPynvH5D47EXWFc+DBBlWPBDw=;
        b=cwI1hLMvW0LbmNM9WMTrrVDey2DX8WdBvIpAGR8zMGGyGQe2v3xCVXzRwJvfI5UmF2
         LdjASPbxkHEGpUsdvrhc0tHU3aAo947EBA/kWX8FDdLx8DwEppGfJCv+2lnW7Lc0pTio
         F5S6qMVsjNfkM+2tLJZ42CCFhFwq1BiGZi1sEos84R/auFqo0x6iUppw75SXsO1xM+HE
         imUficZlwvfQPqoUV4LFvo4KSFS9yolbmrEv4QgYhqJYK8jEkZr2UxZJX5FWgFwbhI8h
         u6v5lMfY2qkTlkOpWAR/N36Adl09ZB9KxJB6mmtJzF9r+/9aTVQbpIcRS5vYgob0PYUe
         kGsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774501576; x=1775106376;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kX/Q4tA/GGa5kkY3FZPPynvH5D47EXWFc+DBBlWPBDw=;
        b=NvW4YGl2pwLf85fMFaPerspUzYfGPI2ItCXvFG9nk2W7c209QqRI23U4BCxxXMre0a
         XhqLuePXL1GwL7m/pzMQ+qJfE9/yid/g3GKVDLCbD+x1yohQMzjXE2wLwlIbyOCU9TUz
         gO1DurSBivxsHBjtusfhLlwzBcwHdODpl+Ae5Vjt2ttXxxfSExomu2NXiQVyMCOvr9rL
         jws4qv9aWbzWwGjlUBPMRe1I4lFM80XseWok3cjcXCVyMdPXEYDi95cDnU2dNbaAfoSj
         vn3fV5rzvH16SAK9JCgQAycnlzpQwrxB9FqAqu6MRrVPmH40xrbBCN1umVijZ/RRRdEf
         6PDg==
X-Forwarded-Encrypted: i=1; AJvYcCUYnb6XCiB5MezvHNWxhQtSBgvLEcfqyS8L4gP6+jFmjRm3NUm+S3W9ohbAx8+kd2aFQmcSDZn7rtpNiw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzO3LFQB7PEuvxbXsFnSEkTPIh3VlVHb+jV6TPQRT5VUY2KPuMW
	30IqTZjH0BdmvoL9sUjNVIxtSSACjufxA7BOxvr2L+jMvX5MtdkB3BjxaOwr6mtqd8VLSgXfAEX
	m57rimyhTLGPl7SiMLoj4vUm9Z2BsCBroIQRm8F3KcgMepxrE0cjbKkOne+rDWdSRLg==
X-Gm-Gg: ATEYQzyS9eAymj/XM7Po2B+uGDTZJHB9/XOhCPVLLi+ej660fZVJVlikolnqyKLAgOq
	R57qFzA+cLncs9Uv+2fIFWZwMg23S0eUZzTq81Y0P7z2uJvI8nj1bX8g3vJaM/pUx85/gf9WoNJ
	atAvIjJ2jDCD/g46aRHzJhx/pqN2d7ppmaJQli4x0CTTQt3+HU2USLAE1CYeEiVmKZemRHqH9W+
	SyGSONvvWWMuIVW4NZSoj16mTRsfltmmi5SjTtb3qocBY4QuUcZA1nOH7orUlMYJug+ReaZR3G4
	EAuY1n9y75sfD3xSxeD1jEstjhNqG2lD1TGIp1WyDkVfbmSRAqIp87FKBBswBSmdIqWZ4Cz5WYC
	EMqd1OmhiOteC5jUylrvK3FBDgz9CplwD2CfDvyhmoOicVIttlzlNYw==
X-Received: by 2002:a17:90b:4a03:b0:35b:9cd5:232e with SMTP id 98e67ed59e1d1-35c0dd95865mr5470187a91.29.1774501575448;
        Wed, 25 Mar 2026 22:06:15 -0700 (PDT)
X-Received: by 2002:a17:90b:4a03:b0:35b:9cd5:232e with SMTP id 98e67ed59e1d1-35c0dd95865mr5470167a91.29.1774501574933;
        Wed, 25 Mar 2026 22:06:14 -0700 (PDT)
Received: from [10.0.0.3] ([106.222.229.231])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c22d09429sm198541a91.17.2026.03.25.22.06.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 22:06:14 -0700 (PDT)
Message-ID: <56860faf-3f74-daeb-3d19-a35243172317@oss.qualcomm.com>
Date: Thu, 26 Mar 2026 10:36:05 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v4 3/9] media: iris: retrieve UBWC platform configuration
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
References: <20260125-iris-ubwc-v4-0-1ff30644ac81@oss.qualcomm.com>
 <20260125-iris-ubwc-v4-3-1ff30644ac81@oss.qualcomm.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20260125-iris-ubwc-v4-3-1ff30644ac81@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Fr_nP4eoYTeqBeyMEKRs4dfrFCvFHWaE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDAzNyBTYWx0ZWRfX3AB+WehOA8WO
 OCFr9uy3tzky4kEmGnmPSga1E558e/FkG0hWAPs8kpS8aeubH6bT4JOiY1BIjLdJPlAaG0CSQ0U
 CNg2nbjZJC53b07JwIvjPJcw4EDdSy8Jsu8hPKOw89+ZTM++zlj9h2vyvT3DOxuZ7n6yHKXFHQM
 voSm6mnZDm28n7vglMdLgTbLyGvXDkgSWJUIKaKA4svAw7TtII509WEaaIf0+Et8Y0EeVGZRJ9m
 uLMFbUxexOzUshofkahJ5C1EMFOmqsSnd48i2Ddm8Kd21lFN5NCqP+zVY7TdxMPayqw44rwiPN8
 9inbacnXXLhC4PeacPElLHewAriy/5MIsYnCWl7kgYv0fYXMcY+/AePxoqgp91eI0N0qPg7GCnV
 yKwLRtpE7/2iVtv19F6EKxW8x/f/JDpy42kpN/VNkNuQiY8EJutLU91crt0Q3SuOj/ASTHeFz/T
 Wc1m/SDTBO1WXX3hgvQ==
X-Proofpoint-ORIG-GUID: Fr_nP4eoYTeqBeyMEKRs4dfrFCvFHWaE
X-Authority-Analysis: v=2.4 cv=KaLfcAYD c=1 sm=1 tr=0 ts=69c4bec8 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=n9i7a1ABM4vdrNuulSdbnA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=74htzXLwVZE36vefv0kA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_01,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 adultscore=0 phishscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603260037
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-57120-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dikshita.agarwal@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0E7E632F420
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 1/25/2026 5:00 PM, Dmitry Baryshkov wrote:
> Specifying UBWC data in each driver doesn't scale and is prone to
> errors. Request UBWC data from the central database in preparation to
> using it through the rest of the driver.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> Tested-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/Kconfig      | 1 +
>  drivers/media/platform/qcom/iris/iris_core.h  | 4 ++++
>  drivers/media/platform/qcom/iris/iris_probe.c | 5 +++++
>  3 files changed, 10 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/iris/Kconfig b/drivers/media/platform/qcom/iris/Kconfig
> index 3c803a05305a..39b06de6c3e6 100644
> --- a/drivers/media/platform/qcom/iris/Kconfig
> +++ b/drivers/media/platform/qcom/iris/Kconfig
> @@ -5,6 +5,7 @@ config VIDEO_QCOM_IRIS
>          select V4L2_MEM2MEM_DEV
>          select QCOM_MDT_LOADER if ARCH_QCOM
>          select QCOM_SCM
> +        select QCOM_UBWC_CONFIG
>          select VIDEOBUF2_DMA_CONTIG
>          help
>            This is a V4L2 driver for Qualcomm iris video accelerator
> diff --git a/drivers/media/platform/qcom/iris/iris_core.h b/drivers/media/platform/qcom/iris/iris_core.h
> index fb194c967ad4..d10a03aa5685 100644
> --- a/drivers/media/platform/qcom/iris/iris_core.h
> +++ b/drivers/media/platform/qcom/iris/iris_core.h
> @@ -30,6 +30,8 @@ enum domain_type {
>  	DECODER	= BIT(1),
>  };
>  
> +struct qcom_ubwc_cfg_data;
> +
>  /**
>   * struct iris_core - holds core parameters valid for all instances
>   *
> @@ -52,6 +54,7 @@ enum domain_type {
>   * @resets: table of iris reset clocks
>   * @controller_resets: table of controller reset clocks
>   * @iris_platform_data: a structure for platform data
> + * @ubwc_cfg: UBWC configuration for the platform
>   * @state: current state of core
>   * @iface_q_table_daddr: device address for interface queue table memory
>   * @sfr_daddr: device address for SFR (Sub System Failure Reason) register memory
> @@ -95,6 +98,7 @@ struct iris_core {
>  	struct reset_control_bulk_data		*resets;
>  	struct reset_control_bulk_data		*controller_resets;
>  	const struct iris_platform_data		*iris_platform_data;
> +	const struct qcom_ubwc_cfg_data		*ubwc_cfg;
>  	enum iris_core_state			state;
>  	dma_addr_t				iface_q_table_daddr;
>  	dma_addr_t				sfr_daddr;
> diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
> index ddaacda523ec..492f85f518eb 100644
> --- a/drivers/media/platform/qcom/iris/iris_probe.c
> +++ b/drivers/media/platform/qcom/iris/iris_probe.c
> @@ -10,6 +10,7 @@
>  #include <linux/pm_opp.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/reset.h>
> +#include <linux/soc/qcom/ubwc.h>
>  
>  #include "iris_core.h"
>  #include "iris_ctrls.h"
> @@ -244,6 +245,10 @@ static int iris_probe(struct platform_device *pdev)
>  
>  	core->iris_platform_data = of_device_get_match_data(core->dev);
>  
> +	core->ubwc_cfg = qcom_ubwc_config_get_data();
> +	if (IS_ERR(core->ubwc_cfg))
> +		return PTR_ERR(core->ubwc_cfg);

Afterthought: This change assumes that the presence of a UBWC config
implies Iris UBWC support. However, some platforms (e.g. qcm2290) do have
UBWC data defined at the SoC level but do not support UBWC in the video
firmware, which could potentially surface during SYS_INIT if UBWC is
advertised unconditionally, so this might be worth double‑checking.

Thanks,
Dikshita

> +
>  	ret = devm_request_threaded_irq(core->dev, core->irq, iris_hfi_isr,
>  					iris_hfi_isr_handler, IRQF_TRIGGER_HIGH, "iris", core);
>  	if (ret)
> 

