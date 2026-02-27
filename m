Return-Path: <linux-media+bounces-53772-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kJ19No//oWl4yAQAu9opvQ
	(envelope-from <linux-media+bounces-53772-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 21:33:19 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 545D51BDAD5
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 21:33:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ECC8030E26ED
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 20:28:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E333477986;
	Fri, 27 Feb 2026 20:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nK2X3KtX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UwNXmDUj"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61BAB34F491
	for <linux-media@vger.kernel.org>; Fri, 27 Feb 2026 20:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772224110; cv=none; b=qxtRQA72SITbIzuJbmQA1FOisVNoONSayMQ8YeDfKGYKmKPlm6hfKJSrqIvFG7lpIIaJb5dONQzeTfJ0//rRQWvQHin+E0JM4ZZg/Bm/u9J2PbnU/PX9tCR1Vqu2nCyYDmeWJVXV9KiCswlT0hfgCHWMGzh5d2avXFZj90TqyGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772224110; c=relaxed/simple;
	bh=ubRpnnZCa3BtxGeTQH8/24NroyvQw+/jfEMurUW7GwQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bgxqdm+1WRnTLp66P90Dbag4aUHyR9LRo8r1ekUyps0vqAhjnbfAgCfMRAie6oPSbQfDG+lXm6gNGWcJoMn1QlTpfNsKd5m1howiv0dWSfm25LfN8FZsVN+497BqyyZtxxKHvSRxEHdyrqj1V9n5ER4SU1PTKpqxuis58XGs/FM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nK2X3KtX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UwNXmDUj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61RH0IH9065323
	for <linux-media@vger.kernel.org>; Fri, 27 Feb 2026 20:28:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=lXz8uYqb+tpPwbAm+qmdqDbm
	VqPyxZKSrLTUZphOd/U=; b=nK2X3KtXtku82Y76wPMRZmUpj+8CT6L0uOmOgU3E
	L2BNQubsByoq8ptEwCyi5yH/pBdKpE3uCef79vOGcWJUbE0pDE0Q8/KxclSTQOgE
	vGm3V3CtiS3FodsjQ99+0YzzLBA2jZxABdWsJzIEAhOIGbfw7njRxnKhSY1W0Ib3
	AgNdgQApkYjlETglgOr2ZF9PBCRm3zKPPw4VO7V4EXffwXJdoZZ6XkKRVzIDnwep
	pglHMArpoTuAHbxb5x4uKbNlOBK9jR9kiIiM64RY1VoQI2TalU3hZ7EbRDW8yD1h
	ur0ZFOjaN1pimiJUixUXyJv5DYfLuJUN9PiXYsj9RV7tXQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cka2xhq7r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 27 Feb 2026 20:28:28 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb4b8e9112so202796685a.2
        for <linux-media@vger.kernel.org>; Fri, 27 Feb 2026 12:28:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772224108; x=1772828908; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lXz8uYqb+tpPwbAm+qmdqDbmVqPyxZKSrLTUZphOd/U=;
        b=UwNXmDUjsvA8SxvLFCUTJzimGt0XpUQBEs5QW9TrTKFPuZ/O37xAotqLL6nr2Svd9k
         TsmAjP6SBxa2k8nRk/05w/4r5agzBaL/sZpDBjEGpXVfUwsRZ8rZfkpxY6inoSblk+Uf
         aVLtBymZuDKFAZR3jiaisSDwNF4c4uLom/g7Spaz0kHO+ccSvA7P/eP2I4yYAtykBCMP
         G1BBHXYYmeIFRar1JR3HlgLdJQ9id6nCgZDvooZ9sqlMcvxDEalAe7aCUJTF3+2DZyIK
         NN432ssfmRcmR432dOPV5qQeaO9K38BZurLYTmG4khcRnGAC1FkEBHI/+lfzwgz2usCk
         PvvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772224108; x=1772828908;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lXz8uYqb+tpPwbAm+qmdqDbmVqPyxZKSrLTUZphOd/U=;
        b=mWrwdc7+R9XZyGOK/ZVhqUg6vDitPxqeG6UOmRxH1F/clcaGpU31F9EvuOtmAC+NRg
         GCagw1NUIfnJ35G1jBoV6KiKAiVrzNzGJYeGLyHz5MzZ4xMUcsOfHCuMYO/G8xCiKA0I
         sshyvGk5RQMJ+E44HGVilkdmMLLTHWiagFTGp4p0SkbXzbbtxO1DQ02G6dtALsKcil/E
         7OrvMnkTViX4LMXIOiBktrAD0lH+x34d5nt0VfVGOzTAh/gclJnDv8dhOMLv0e4n2Y9x
         ggYR9SzwPhwADiHr0D25eBeReWxF4SvPX3hmreHPenFGt13K0oSLCLKumuxaCWV8kEp9
         /IuQ==
X-Forwarded-Encrypted: i=1; AJvYcCWWPQjIzeclvqRtfj/7yl2ITXU4wylq1a3C7NRow9Cmux5K6VxlXtoAsJOmmDwDMBjHDy6DOpGrH7Fhfg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzl7V6K6QgBIhLWApu2SH5u3EjWu6EuhBbuNgtnXbq+QW1Bj/QY
	UtOAEMJJHu6GOji3emV/Q8+lOmBcOgX6FmKQqSmnrkDHgB+Nq0mowYcnnZeaY+DpEUo30Hnryfb
	iImxQM+lWwjmzEpqZUnzfi16dy+azNImr5ja9LL+S5S1Ezq5DKOSXslS2Aae6Z3VGiA==
X-Gm-Gg: ATEYQzwvkGu/dGXJ5xEFuXur9e1HOw9TLPBXuQVnsXsvvrhPOMZnDFnO2pwGoWp0diu
	ebtLoE0Z/nv1TzVYp/2R8ecydGYpT65z7AFsbut7MU5ZOTabO65VisFPE+zeKxsTmaBetf4KaQq
	5rqQ8WLxSk9h7bu2zQcE8zvW4hvTZq+eP4WKwFWr+YrTAwjyz61c1tuPlKPJTtojLe+JbR/UDlg
	jG+pxGxfxzRwbY0yZG9V0b9AZll6cg6L4mSeemgLRJ82tZ0oAHCAU4KedMJ4rLMmm8nsTQNQ1+H
	Sn97xzcPC3q5z8gCbcZQ/AVFUC52O8bqVXLxlcZIFtx9YQ7vwAjMBdIeicqnOE/v8RHbsYmVfny
	1ihf7EmnRQrC83mBlIYzcwPB4xDuMsIjQ0jcfoInQhXXWzj38oTw1EX/jR6wTChPsPZ4pe6ENnD
	uaz1Sd3YPGBRzId1MNwZycyypdF7oX/nmdTzc=
X-Received: by 2002:a05:620a:4891:b0:8c7:a53:4d17 with SMTP id af79cd13be357-8cbc8e863f5mr527247085a.21.1772224107555;
        Fri, 27 Feb 2026 12:28:27 -0800 (PST)
X-Received: by 2002:a05:620a:4891:b0:8c7:a53:4d17 with SMTP id af79cd13be357-8cbc8e863f5mr527242385a.21.1772224107036;
        Fri, 27 Feb 2026 12:28:27 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-389f30179e9sm15051161fa.33.2026.02.27.12.28.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 12:28:26 -0800 (PST)
Date: Fri, 27 Feb 2026 22:28:24 +0200
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
Subject: Re: [PATCH v2 6/7] media: iris: add iris4 specific H265 line buffer
 calculation
Message-ID: <cbwz5wtd55enswdi2zvvy3d66nsxlemyzdypheibvljnewmkax@kybx63aveepn>
References: <20260227-kaanapali-iris-v2-0-850043ac3933@oss.qualcomm.com>
 <20260227-kaanapali-iris-v2-6-850043ac3933@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260227-kaanapali-iris-v2-6-850043ac3933@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=BOC+bVQG c=1 sm=1 tr=0 ts=69a1fe6c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=BuJnJetHAO0UpRBxyx0A:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: mb2FuhxnZRWQNRupUN7gMgBGl1ZNrmq-
X-Proofpoint-ORIG-GUID: mb2FuhxnZRWQNRupUN7gMgBGl1ZNrmq-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDE3OSBTYWx0ZWRfX032l7mwt5Qjt
 ShnKniPjPSeRx1IRJJS1nfrEq6ajBUc0hi7bBM3QUwTNHEMWtNOtMBNfu85leJUNrPwae7JdjM6
 /UePxeDyyEgBVS+XuIzkn7zy5q2aaW6cKJf/wvz0XdsYbZSie9x1TJqvYEYrG9JT8JHhS0XCrtV
 EQbgypbMXVDwonKFmNAFcGnH1syqnuY1x3cE+hAZkhEedHZqGSVWQ0HGL9ZOcZbHsqVKYg6uvwG
 gvvK6v8Z7xoB+k+g+VJCX4ugKwji8YB0Mo09JMcPHEH0B+0jMqAOiKa+ixKG//Y3eLUH2Ngx9Iu
 Sox/ndi7OpQapTC0/3XneWj2v/03QQg+WCO9b4k3zGnFRYcLadjXfDfKoRG918aBlfTsoH1SB2w
 Vtu//cUjY9W03jgARYf411AiZn+Zh3AhKjdbnQaRG6NqKWEND+2aJBmStIi0fV6ESCGqcvblyl1
 Ko9oLZILECOOUAUcC5w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_04,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 spamscore=0 suspectscore=0 phishscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602270179
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-53772-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 545D51BDAD5
X-Rspamd-Action: no action

On Fri, Feb 27, 2026 at 07:41:22PM +0530, Vikash Garodia wrote:
> The H265 decoder line buffer size calculation for iris4 (VPU4) was
> previously reusing the iris3 formula. While this works for most
> resolutions, certain configurations require a larger buffer size on
> iris4, causing firmware errors during decode. This resolves firmware
> failures seen with specific test vectors on kaanapali (iris4), and fixes
> the following failing fluster tests
> - PICSIZE_C_Bossen_1
> - WPP_E_ericsson_MAIN_2

This reminds me of the commit fixing SC7280 support. Should SC7280 or
all VPU2.0 platforms also use separate formula?

> 
> Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_vpu_buffer.c | 51 +++++++++++++++++++++-
>  1 file changed, 50 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
> index 9270422c16019ba658ee8813940cb9110ad030a1..a4d599c49ce9052b609b9cedf65f669ba78b5407 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
> @@ -1755,6 +1755,55 @@ static u32 hfi_vpu4x_buffer_line_vp9d(u32 frame_width, u32 frame_height, u32 _yu
>  	return lb_size + dpb_obp_size;
>  }
>  
> +static u32 hfi_vpu4x_buffer_line_h265d(u32 frame_width, u32 frame_height, bool is_opb,
> +				       u32 num_vpp_pipes)
> +{
> +	u32 num_lcu_per_pipe, fe_left_lb, se_left_lb, vsp_left_lb, top_lb, qp_size,
> +	    dpb_obp = 0, lcu_size = 16;
> +
> +	num_lcu_per_pipe = (DIV_ROUND_UP(frame_height, lcu_size) / num_vpp_pipes) +
> +			   (DIV_ROUND_UP(frame_height, lcu_size) % num_vpp_pipes);
> +
> +	fe_left_lb = ALIGN((DMA_ALIGNMENT * num_lcu_per_pipe), DMA_ALIGNMENT) *
> +				FE_LFT_CTRL_LINE_NUMBERS;
> +	fe_left_lb += ALIGN((DMA_ALIGNMENT * 2 * num_lcu_per_pipe), DMA_ALIGNMENT) *
> +				FE_LFT_DB_DATA_LINE_NUMBERS;
> +	fe_left_lb += ALIGN((DMA_ALIGNMENT * num_lcu_per_pipe), DMA_ALIGNMENT);
> +	fe_left_lb += ALIGN((DMA_ALIGNMENT * 2 * num_lcu_per_pipe), DMA_ALIGNMENT);
> +	fe_left_lb += ALIGN((DMA_ALIGNMENT * 8 * num_lcu_per_pipe), DMA_ALIGNMENT) *
> +				FE_LFT_LR_DATA_LINE_NUMBERS;
> +
> +	if (is_opb)
> +		dpb_obp = size_dpb_opb(frame_height, lcu_size) * num_vpp_pipes;
> +
> +	se_left_lb = max_t(u32, (ALIGN(frame_height, BUFFER_ALIGNMENT_16_BYTES) >> 3) *
> +				MAX_SE_NBR_CTRL_LCU16_LINE_BUFFER_SIZE,
> +				max_t(u32, (ALIGN(frame_height, BUFFER_ALIGNMENT_32_BYTES) >> 3) *
> +				MAX_SE_NBR_CTRL_LCU32_LINE_BUFFER_SIZE,
> +				(ALIGN(frame_height, BUFFER_ALIGNMENT_64_BYTES) >> 3) *
> +				MAX_SE_NBR_CTRL_LCU64_LINE_BUFFER_SIZE));
> +
> +	vsp_left_lb = ALIGN(DIV_ROUND_UP(frame_height, BUFFER_ALIGNMENT_64_BYTES) *
> +				H265_NUM_TILE_ROW, DMA_ALIGNMENT);
> +
> +	top_lb = ALIGN((DMA_ALIGNMENT * DIV_ROUND_UP(frame_width, lcu_size)), DMA_ALIGNMENT) *
> +				FE_TOP_CTRL_LINE_NUMBERS;
> +	top_lb += ALIGN(DMA_ALIGNMENT * 2 * DIV_ROUND_UP(frame_width, lcu_size), DMA_ALIGNMENT) *
> +				FE_TOP_DATA_LUMA_LINE_NUMBERS;
> +	top_lb += ALIGN(DMA_ALIGNMENT * 2 * (DIV_ROUND_UP(frame_width, lcu_size) + 1),
> +			DMA_ALIGNMENT) * FE_TOP_DATA_CHROMA_LINE_NUMBERS;
> +	top_lb += ALIGN(ALIGN(frame_width, BUFFER_ALIGNMENT_64_BYTES) * 2, DMA_ALIGNMENT);
> +	top_lb += ALIGN(ALIGN(frame_width, BUFFER_ALIGNMENT_64_BYTES) * 6, DMA_ALIGNMENT);
> +	top_lb += size_h265d_lb_vsp_top(frame_width, frame_height);
> +
> +	qp_size = size_h265d_qp(frame_width, frame_height);
> +
> +	return ((ALIGN(dpb_obp, DMA_ALIGNMENT) + ALIGN(se_left_lb, DMA_ALIGNMENT) +
> +		ALIGN(vsp_left_lb, DMA_ALIGNMENT)) * num_vpp_pipes) +
> +		ALIGN(fe_left_lb, DMA_ALIGNMENT) + ALIGN(top_lb, DMA_ALIGNMENT) +
> +		ALIGN(qp_size, DMA_ALIGNMENT);
> +}
> +
>  static u32 iris_vpu4x_dec_line_size(struct iris_inst *inst)
>  {
>  	u32 num_vpp_pipes = inst->core->iris_platform_data->num_vpp_pipe;
> @@ -1770,7 +1819,7 @@ static u32 iris_vpu4x_dec_line_size(struct iris_inst *inst)
>  	if (inst->codec == V4L2_PIX_FMT_H264)
>  		return hfi_buffer_line_h264d(width, height, is_opb, num_vpp_pipes);
>  	else if (inst->codec == V4L2_PIX_FMT_HEVC)
> -		return hfi_buffer_line_h265d(width, height, is_opb, num_vpp_pipes);
> +		return hfi_vpu4x_buffer_line_h265d(width, height, is_opb, num_vpp_pipes);
>  	else if (inst->codec == V4L2_PIX_FMT_VP9)
>  		return hfi_vpu4x_buffer_line_vp9d(width, height, out_min_count, is_opb,
>  						  num_vpp_pipes);
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

