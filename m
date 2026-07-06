Return-Path: <linux-media+bounces-66754-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id VeSUM524S2rIZAEAu9opvQ
	(envelope-from <linux-media+bounces-66754-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 06 Jul 2026 16:15:57 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EB42711D48
	for <lists+linux-media@lfdr.de>; Mon, 06 Jul 2026 16:15:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=D2GfBjLY;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="I/VwiPIg";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66754-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-66754-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 59301322879A
	for <lists+linux-media@lfdr.de>; Mon,  6 Jul 2026 12:42:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC2543FE35F;
	Mon,  6 Jul 2026 12:42:03 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E610039D3DA
	for <linux-media@vger.kernel.org>; Mon,  6 Jul 2026 12:42:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783341723; cv=none; b=H1ZVl3w9sQnQu+G0QqFBn8i2XPIAbnvkPOIlmB+mGjh5ij9MAo4MRdR9OnuSdquutL8UW/8DgkUjEUm+wqVTTw70UMtun9Lz68YSWqeVigyVdQcLDn98rjSppmRjQfLz8JuPiA4tUb/SCnKLYdpcR++u6dTwngvBSCpbtQmRLtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783341723; c=relaxed/simple;
	bh=5d5qoXwl6X/5EBmgduABc6v7RYTqWqznF2Ylbfa9TqA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bs9w+AY0B2oi8ScrOd8WRhhkLAGu/tYflkT8fk+NmRifWcWpm03XdIW3KMgp9UIxHgjEEvv3uJznGNhK+cxA/uu2y9lKlx36BCEpDHK4SY5UWM8RRs7j/u6H+ewgZciz84n19SXThYmokChSu18lGVOQRfde5w9YURPbUnxpGf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D2GfBjLY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I/VwiPIg; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxUux317157
	for <linux-media@vger.kernel.org>; Mon, 6 Jul 2026 12:42:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=E7a8FZgAvm2jtvI2nBoVIO8e
	/0jyCPrf9wufDVot4/A=; b=D2GfBjLYdRe1tLMLQF1YWlnizNBaOHEkRx8Eg8HC
	8dqKiG/a6cYKufC4d7/iy2x37ogIE8KIpXQQfO1F2NRU6qKQn4/tBO76n0uSD4Wm
	XUKDZZEOFmxCMuTZT3qej0eBsA14+iBArEWGQelS00rbBW/QIOMaa1EmsSLG1Cxa
	2IhW1DVVHbARbDv8B0iKq5EWnnUvLk4ObT+O+2Ddfa8PaJhwE1eAozGbpxmTJb6Y
	+ss/uWvVSojTX6HZYxRQO/dlqz6hzictxXfreMihG82MUlqoRkf6GHy7ajLfuAVf
	m/6mudTI+I2j7L3uK9a+fr/NMbTnYg00OQsW1NekaM90Ug==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f87q7h8mn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 06 Jul 2026 12:42:00 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-59ec1fcd5aaso4055907e0c.2
        for <linux-media@vger.kernel.org>; Mon, 06 Jul 2026 05:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783341720; x=1783946520; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=E7a8FZgAvm2jtvI2nBoVIO8e/0jyCPrf9wufDVot4/A=;
        b=I/VwiPIg4RrtHv/qZWchRqItPAoF28gzjUr9qwZrPGSBEYPrh/xsMfHrs2TS/iPQr/
         V6DZwCNvxKUOGJ9WbY7vOFUekWgRSmoUEM6gOWGZoPlKsZ4EfMMO4N5SVuDWjs/2sGMl
         ffepuc7aJ2co3ANxOn8QMkQ/4s/aHCUBKqmZf0lSsP1dSS3MSlejBXUwo2JIJ/CjUf/K
         qrnP3BaCDSoNdOz4grx51mxrJchuZxbV+6b8MiHmydHBINb5ZS8KSzggv1jeumbW6ISJ
         lOzqDJn9N5XqSSQRt0EKoAUqos4MBmiRVscdxeG9+KmNLF6Zqnu01eEn8Xuj2OHtJ2kn
         vKQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783341720; x=1783946520;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E7a8FZgAvm2jtvI2nBoVIO8e/0jyCPrf9wufDVot4/A=;
        b=m2WdSO/7Aboj0qbn13hIKiiSAbWz3BzdBl0JyA4kyrWXTQnhogCfUBrgjs/FOEISca
         61HZ7rcY7hr+bj0ATY+1Hg17fwaykyXQY6padGowIEcweQnQ1+aFmq8fETWaKb0GqClB
         WCLH5Q/OVkEVHlF+eOPDKqDg1v/kCyXNSJYa7mWZ7n/ca0lEWs3nkZ55z2ecwHBFhbJ3
         ZUI7C2XXcvyt+VWtBZMO/5FVGB75NXMtAhOMMevDticM0wg7fO/W/F4bM+8Wdz4aNpDW
         a7odG9OZupk1PEraLSSmDv6KDGBskpboDG4duJh9rLDfeUdaYKBk0nKQb5dPR1fxLPdL
         a6eA==
X-Gm-Message-State: AOJu0Yzl/RQVK0AAbJ24LL5iARAbbQyGDsavij4iVr4Gl5kl6K9BgNeF
	qnA1z5/9Qx2x05XPEHoTeUNnunOyjyabW3LmOi73axNBowr9cA0oCpTBKdHPBITTOJk7aHeOmCY
	n+fb892W3dF3I5S/gjIT3wb2KWvN31Qp8wFdR2UaMlpPHYK35FNL6+jTysh6CGHoyyg==
X-Gm-Gg: AfdE7cldUXMVdgKing0kxL+ebWSwjqaTTQnFgBLjDpoTi373Qqa0JLGmrCtFNKFUJvw
	TUFz/09Wn8CnuqfHFemjRGgKTmNidH6prHUDFz4OPlmyE4ZAlwxbgBRyJmAP2wNj2w9XXQjRSmj
	N6yEZqx+oOYNz26lYum3HPEkGSveWnOSfEURpoQCWYuoUks9aTHGSIdgNIEyyOf3+DmH8BhNXCG
	hhg8ipnBv13YR2RpkgXB5s0LXPjKli7Qn7QNnvLbe4O8iFY4D4Gg5/jfSu+BX/ulpdRJlBZfww5
	91w4NnKuZnIU641ccY7+o0oSNyEO/FaZu4fUo9Bq9Ks4qkpZmac/gd9EHIpEB1/wYpCv21P3eya
	y+EO2TUMUiE427fq2p7sAxOKWtfqKDAJrGXYEuqPodWcDA3mPAxV5geSMZ6bvxWN4pI3KtdxtI2
	BG4OQqCiWBr+CDpU3Pby88YgiC
X-Received: by 2002:a05:6122:1809:b0:5bc:58d:ce4 with SMTP id 71dfb90a1353d-5be8952c6d3mr190112e0c.0.1783341720077;
        Mon, 06 Jul 2026 05:42:00 -0700 (PDT)
X-Received: by 2002:a05:6122:1809:b0:5bc:58d:ce4 with SMTP id 71dfb90a1353d-5be8952c6d3mr190070e0c.0.1783341718729;
        Mon, 06 Jul 2026 05:41:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13bb685sm2849659e87.46.2026.07.06.05.41.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 05:41:57 -0700 (PDT)
Date: Mon, 6 Jul 2026 15:41:55 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, bryan.odonoghue@linaro.org,
        vladimir.zapolskiy@linaro.org, loic.poulain@oss.qualcomm.com,
        mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v4 1/5] media: qcom: camss: Populate CAMSS child devices
 via DT
Message-ID: <7agyvdlmpnvvjnhigs2plukv26johazvxw23qg62v6eroavkih@dz45xwot36mx>
References: <20260706071113.383215-1-atanas.filipov@oss.qualcomm.com>
 <20260706071113.383215-2-atanas.filipov@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260706071113.383215-2-atanas.filipov@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEyOSBTYWx0ZWRfXwVJRUbeOlzyJ
 MIeIDD+fx+FgUCSQ/guZ4tDYe9EVC7C6T7HJYyhx1D6dm9/i5fSDjQRtasUd/yW5tbqk9zvnLRQ
 6cH375Zezp/Gc7ugXwaGiW+JGXPutBmkWE4eH3Uerrm6HDu0KrshQsVmxeSljmGONZz9n/SaDvP
 wJPWW50l1Ztlg6fixBp/PbrM3agUbMHLodIfQQ+tN4uKVF+cYHGN80x25EshIeAWclpWkpou5L4
 KvtRkkjAhos95Xbqm8UorqITBqQG/QBJrZyQkmtJpq5Xj2W5o1wfBHIN/69UQHoD1eEUCvzCF3e
 Pq1npdyaROXK0omhp/XpwQCd2bY8EiKP3fBL5PBeIPNk35GlCngxesdVrTY1REO86pvRvMIb4yT
 hUP99UvF9pgU5B6CZW6qYyqxg+F09to1NCUhcZZKj4W9wj3nrSz4kXwigNKojtfz3EyLunIizS1
 DexMiXwAti3ZgpsKDsg==
X-Proofpoint-ORIG-GUID: tIALGOTFKgXvjhWUDdgiVjzESr2xcROc
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEyOSBTYWx0ZWRfX0vaYuOtjHK9q
 bVsiEoifIPeeKtKDQbI3IcF6WvqdoieQK1jDcVKD4zyRvhvoaSf8DQgpFfwJJRy+aHLL75aN5F/
 BjKL9ePUN76ID0Tg/Sg0EKCbIoNhabI=
X-Proofpoint-GUID: tIALGOTFKgXvjhWUDdgiVjzESr2xcROc
X-Authority-Analysis: v=2.4 cv=f9N4wuyM c=1 sm=1 tr=0 ts=6a4ba298 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=jnYD6DY7q27B8yBxuWgA:9 a=CjuIK1q_8ugA:10
 a=tNoRWFLymzeba-QzToBc:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060129
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-66754-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:email,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS(0.00)[m:atanas.filipov@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:bryan.odonoghue@linaro.org,m:vladimir.zapolskiy@linaro.org,m:loic.poulain@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6EB42711D48

On Mon, Jul 06, 2026 at 10:11:09AM +0300, Atanas Filipov wrote:
> From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> 
> Use devm_of_platform_populate() so that child nodes declared under the
> CAMSS device tree node (e.g. OPE) are automatically instantiated as
> platform devices. This is required now that CAMSS is modelled as a
> simple-bus and ISP blocks such as OPE are described as child nodes.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/camss/camss.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 2123f6388e3d..95e655a8b6aa 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -16,6 +16,7 @@
>  #include <linux/of.h>
>  #include <linux/of_device.h>
>  #include <linux/of_graph.h>
> +#include <linux/of_platform.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/pm_domain.h>
>  #include <linux/slab.h>
> @@ -5362,6 +5363,8 @@ static int camss_probe(struct platform_device *pdev)
>  	if (!camss)
>  		return -ENOMEM;
>  
> +	devm_of_platform_populate(dev);

Don't ignore the error code. Also, are the children ready to be probed
at this point? Usually, it should happen _After_ the camss is being
fully set up.

> +
>  	camss->res = of_device_get_match_data(dev);
>  
>  	atomic_set(&camss->ref_count, 0);
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

