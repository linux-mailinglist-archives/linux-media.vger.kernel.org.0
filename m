Return-Path: <linux-media+bounces-53399-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UNAFJTIon2nmZAQAu9opvQ
	(envelope-from <linux-media+bounces-53399-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 17:49:54 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A7BD19AF74
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 17:49:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C495C3086DFB
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 16:44:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4112438F954;
	Wed, 25 Feb 2026 16:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SjIVYZoO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Hlky7G3V"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8706C2DF132
	for <linux-media@vger.kernel.org>; Wed, 25 Feb 2026 16:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772037883; cv=none; b=NFmsrz5ZXny8L3afdx+v2APzYx3SD9roIHBxroF7rQp+9kWcpK9ostFQQFF0Awq3mH0oFvfYwUwivzVtAxrzhNLJamlDrRtj7DI5/6JPZh1lA/av6livm+IoIIfnvwPqRb4nVxQM0OeSZ0RucigwOpEYa0Xm9bHewWvbkDYfB24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772037883; c=relaxed/simple;
	bh=4+WhaYZVbC044qiWc0R3aALccnyRgLYAnX8GPvMvM1I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z0pCnJpfQpNLiD1+RI2mlmlJmwV7zOw51MvE9HQC5UaUgJhD6BQZc5KsO+WclUdiAthaMYENDC3Tm2t+2spg1TurWdLgqUZ4C8fAQfOAOl1L70COR/Z/S0U3dW/j308rkLZK3as3chSz14Ls0s7x2rBrjQ89eJ+QlyL9T9WISfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SjIVYZoO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Hlky7G3V; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61P9SCvK806692
	for <linux-media@vger.kernel.org>; Wed, 25 Feb 2026 16:44:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=FPLVcfKw5IWz8lzxbKMBoAuR
	iK8OHzaS6FYc9SRfd50=; b=SjIVYZoOxmm/St7Mv6HP3BSHibIqWVgEbi/UG6/b
	LyMKWL58HMmN8zqL7ATacHlwho7iXVyGpfN/z5V6rr3gJ8LGJT+M8IzrxQlFBInc
	i/4db5tRnqLDKXXjFnNM2fIY1iNgQeRBnJdntPs7PbPjvmz+nzFc1JDPcE0TxliQ
	i+/H5VJ39sHFdKhbCWrl9IYKA2wpnsMGZ3txmC+QURSKkqrTH/25wmpnJSDolEU4
	/B6pmXx4UFYpvRAlAsOpEl5B6dnoX4fsEwkVkGvnc3TG72kArIkLWi2Oik3Fotq+
	9xcQmm0NFkzZeoCEdqS8avoiDo9zsehxaUHS5qE/7IT1pQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4chr5pad3g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 25 Feb 2026 16:44:41 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-506ab115571so644348821cf.0
        for <linux-media@vger.kernel.org>; Wed, 25 Feb 2026 08:44:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772037880; x=1772642680; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FPLVcfKw5IWz8lzxbKMBoAuRiK8OHzaS6FYc9SRfd50=;
        b=Hlky7G3VcFVYCwx0YhgsxhCiMxk+yzsZwcydGiQQU/tgr52AJKF/P4KaOVU03c6TFr
         TZSjJ/qSKNmlc04BtyBsNs1O9JTytmjlWiKM9SOaVIy8OuE0s341QDCX4DWT55FJUxsA
         VU8VCkdO/M8/pnLJJZSl84w3zjrrxT0PH+bagebXKxb5NMBborHrhYijyVA6CrbL7Nuz
         ofc2/bJriollMzeq5CVrHxesWVnZlkbOcjGr0YPDDvKjdC2z73xwmZNA7CFIRxzCh+px
         BTyEbSqPGPHr76HC6p4DLXEI7Im4YaaulrMcJJGMNZsbWKSwpLLTXV8R6siloUxJXlui
         DTzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772037880; x=1772642680;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FPLVcfKw5IWz8lzxbKMBoAuRiK8OHzaS6FYc9SRfd50=;
        b=XrDxT6dFOvDEpSL1UsFRz3oZzyeYpZY8eY2dC8+BvwDztQeQgQO53eUMRUZid62HIk
         059w4VHwlvBdg+T/kGqh98ZDkCZvfUlgk94K9PZR+3varWA8FcG5O7ee6FuhZMysGkAD
         8gUx1/EtGu9j6ctmNao0DExcSMauicEEU7B7QMwRlsW/cOnQzhODPc5/YXBmWh+iZTE1
         Yqlt/nh9SS0FCQkdtoxaIAnVthL2uYB8I2b2+ONzjHrR8XssBUL3nQ4CndUPi9c5Ts6u
         EN2MA1uDAFkrdvRcwn3tjzeN1+fxjukxYfauVEN3H26o1D9OdsbJ/Q5fZ+XdykRo3Mjw
         o6fA==
X-Forwarded-Encrypted: i=1; AJvYcCX4O15V3RXuPYCsiiMqdbDNLo4mAqow+FofRFOwzypALHuofdnieIAWbhTstFLSGbUmJZ1ivXvUSxO43A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwZZpknhmtnZvruAhqO9qGbyMmdHCnP/eFnrCC46evTtppjEdkj
	c40ggEzLBz4vNY9P67MeGhtVlfi2j4GluWssUQ55OXo2N6/1qzE+B5ijTlGm4peXgLu0R74M4cs
	V0Bkphxu9VM/OFE4DCp6fv1kQsVML/CbMWsZeUbFmcQONzMXLefOTk891FOZ/owgnQhoS4jY34A
	==
X-Gm-Gg: ATEYQzyeMTLDyk3JfQ/UIB2qavmPl91RJPxGjEjdRfN0pWMA/i8cnFGqDZZ+HjEaAyY
	Esj/51eUesRq6X/YsdnH1eW2vx2EwVvrTEwgaYYXCIvgfXeCfWqFT4jiGUijvziZ6akcoU9whu9
	cGn/g3G+az/XUhmaE/a1YUecwaYjnghqH3TgZ3jPeCYr7Yd8hUS5p1G/cpmDLDVvPHEj9xXrGb2
	ndK33fMiGpZIU0azWUVGtu+dxyl0fbjvYQ+IoWbkwdTBzlo8zuj3DkODtBqUVuB4OvU87POisxz
	0+zcYOGOoOXipkmzxs8ygA+Zn5ElSUv/9GYpDnqRTeBWjT3Mm/upqWMjUboDBFHRViSFZzrM/eB
	a6O8vHKeH4NPPyjtUaFSa4jrwbLAQ5Cfj978HdFTv2WDebH/KYqf8mavfp0SW888r5sJLaiU8wu
	lzrA9IOlGJ1f2W5QccpoEYpFf3hbka04u/u/8=
X-Received: by 2002:a05:620a:294d:b0:8c6:ec8f:c8a1 with SMTP id af79cd13be357-8cb8ca71fc7mr2235413585a.44.1772037880519;
        Wed, 25 Feb 2026 08:44:40 -0800 (PST)
X-Received: by 2002:a05:620a:294d:b0:8c6:ec8f:c8a1 with SMTP id af79cd13be357-8cb8ca71fc7mr2235407985a.44.1772037879897;
        Wed, 25 Feb 2026 08:44:39 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-389a7b0d500sm27629641fa.46.2026.02.25.08.44.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 08:44:39 -0800 (PST)
Date: Wed, 25 Feb 2026 18:44:37 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: bryan.odonoghue@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, mchehab@kernel.org,
        vladimir.zapolskiy@linaro.org
Subject: Re: [PATCH] media: qcom: camss: Add debug message to camss-video
 format check
Message-ID: <32hsnxlqg6dzu3zjszuarn5tu73vpvwhf3u22wvrucznz6h4ub@xzuqhcayo2jv>
References: <20260225152211.766792-1-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260225152211.766792-1-loic.poulain@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDE2MSBTYWx0ZWRfX/rAtao7DvC8y
 CPdO3KtizKuJBFI29fnDeVZKq1yqlvAL2sBAjKyqOqbZKHvrnhmYd0J0l4OUm7sLpC2/KxB62um
 bQjzik9ht1zZepIyJmSfmGJ44hxgOtus5viC8rvAmFMrGplJ+0w0NC5XvcpqHjU+A88w5tbqhpH
 uPrwhP7ktv6r/YAuW51tel7AKbIoC2GFwjGvPeYBfIEfMGKwWO1SgERgwP0P5B7shCfRIt3B/Cd
 kWpJO1Qtp506ZpLtWbafsT03ZIZxPkn1/QQs7X1nVzmDdw/bAI9p2GqkO9k9Ke/NuIB9eRJYukk
 qA02TBuf+0+n6wj6BUGA+oafuqVc79QepELkGWL/2vBI4pJnaXqch7wqadj3orRXxdTjP6+5iYm
 WL2RCzBdW9vx7EcKJ/Tyyfx+Y5wBtKchTusJGDa8F3UpzT6KP6UGlw2lA/xUlbq7A+9ZhQJYn/o
 sPz8KN874sMT50SUWng==
X-Authority-Analysis: v=2.4 cv=GstPO01C c=1 sm=1 tr=0 ts=699f26f9 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=MSYuwrY0xV-Ka2yJnwAA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: HNXpJccyrT1DEXWED_d3oYQsFkg882IM
X-Proofpoint-ORIG-GUID: HNXpJccyrT1DEXWED_d3oYQsFkg882IM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_02,2026-02-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 phishscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602250161
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53399-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0A7BD19AF74
X-Rspamd-Action: no action

On Wed, Feb 25, 2026 at 04:22:11PM +0100, Loic Poulain wrote:
> Add a debug trace to video_check_format() to log both the subdev-reported
> format and the format requested by the video node. This makes it easier
> to diagnose mismatches between subdev output and the negotiated V4L2
> pixel format, as well as issues related to plane count, resolution, or
> field settings.
> 
> A small helper, print_fourcc(), is introduced to render fourcc codes in
> a readable way.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>  .../media/platform/qcom/camss/camss-video.c   | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-video.c b/drivers/media/platform/qcom/camss/camss-video.c
> index 0c76bc2cc574..601d5a43306f 100644
> --- a/drivers/media/platform/qcom/camss/camss-video.c
> +++ b/drivers/media/platform/qcom/camss/camss-video.c
> @@ -114,6 +114,19 @@ static int video_get_subdev_format(struct camss_video *video,
>  				    &video->formats[ret], video->bpl_alignment);
>  }
>  
> +static char *print_fourcc(u32 fmt)
> +{
> +	static char code[5];
> +
> +	code[0] = (unsigned char)(fmt & 0xff);
> +	code[1] = (unsigned char)((fmt >> 8) & 0xff);
> +	code[2] = (unsigned char)((fmt >> 16) & 0xff);
> +	code[3] = (unsigned char)((fmt >> 24) & 0xff);
> +	code[4] = '\0';

Any reason for not using %p4cc ?


-- 
With best wishes
Dmitry

