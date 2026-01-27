Return-Path: <linux-media+bounces-51641-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GGCDGOuleGnVrgEAu9opvQ
	(envelope-from <linux-media+bounces-51641-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 27 Jan 2026 12:47:55 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DA57B93DBE
	for <lists+linux-media@lfdr.de>; Tue, 27 Jan 2026 12:47:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 30C103031327
	for <lists+linux-media@lfdr.de>; Tue, 27 Jan 2026 11:45:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B8C834B197;
	Tue, 27 Jan 2026 11:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KQP1Q1sT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Mv6EO279"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A72F9337BA1
	for <linux-media@vger.kernel.org>; Tue, 27 Jan 2026 11:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769514339; cv=none; b=g0So2nMwe2QcZWjzqTi8LN+2WtfPZuFSsSxTOaFSB1JdqBqJPWfJGc7MHf/2cwnyl4AHLeX80xJYHuJk8zdKqvCNJ22dO9achhS64dQ3s0cG5cZWsV1rDgZVLqGydFlQOggfW7kU6pJDKEq48MP5ZnN4oIghAkSZi8SEKmW4SQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769514339; c=relaxed/simple;
	bh=vC5aMIheQI/i5LOb8ieNJ8xBdQ2Nd6mfRPdPEfitCBo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ny6nuc8z2oXUaGBud4ugtaj54243FvzmkY7PQvy9Xrlph0mga9rU2iQcjNc+CwD3BSSUdTX3C7bZ/soMgqLboKfPxqOxRPAx9LhJW/jp0ZRy2kOIQmZ+lRMRJa/WGKBC9K7uuP52U+j1drCw0ArH9VkKYn/5MD0ezTajPlccnGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KQP1Q1sT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Mv6EO279; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60RA2oH93857584
	for <linux-media@vger.kernel.org>; Tue, 27 Jan 2026 11:45:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=jYN++O5MHPni7REvt15Xxqk3
	I7fUUxuK7gifc+cEAcM=; b=KQP1Q1sT3GHkqJK8U5+VNCDjkwh1x/829RDJTiAi
	7lXjJjnkl5iKBx/Rvm5lXfjr7KkJV+Mt4dJY4za+jE4K17/u6sr9hqiTLb1Yn47F
	5WdNvpKiYG7582PCf6qcm3Xe2bPEHtV6tIj62H69/EHTkxtRtp5wdvZmFAGw4aIi
	lu6XvYS2mFxrJ+nLV2pyu/slymXqSojJPtIhVFNVj0PI6Lv5oAoNb4t5WPrh6Y8W
	iAYTWLj7NHf5vUs7L833Ohz4dAtM6bUhlfV0iBGQGf3co6tbBUSt+vcAw3+43G56
	KTh66S32T6L0rN4RZGGLc9wWMHoDXHAxGXzcVWtKJ6/9tA==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxffs2hqd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 27 Jan 2026 11:45:36 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-93f59bf206dso7312559241.0
        for <linux-media@vger.kernel.org>; Tue, 27 Jan 2026 03:45:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769514331; x=1770119131; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jYN++O5MHPni7REvt15Xxqk3I7fUUxuK7gifc+cEAcM=;
        b=Mv6EO279kHGyQHNxHMDuBZHZ2FS3+JEC9ZLEGZP8MHin94CKv2735wG4//gn1jDUTS
         5kKYDvTFa5rFluyVe9LixrNU+lW1TFV1l2f2lzr/4mj3uOikpzM2KQOc33RUxa/cRYCj
         cPBvz4xcUjxWIPFTKjuXiFi05wHt3rvv5SMmX1l76fCdk1QMCdkGqWfyj2UT4cOtV4it
         6gvidpuCqdJCpq8cWqf3nWrq32NEjO1lIeBgZFbSma7Kv2OXANkuEz+as7qPsNrZRZe0
         nUeqOS7mt809ewqQWxsA1VJzDxIAagYjP3o451zkz0yESClEicdvqBK5xQ+jdGTfxv7o
         hs2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769514331; x=1770119131;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jYN++O5MHPni7REvt15Xxqk3I7fUUxuK7gifc+cEAcM=;
        b=BtxJOzkXolkx2QNMoVoxuH4kg1jClo4/y97lUW6rB/W4vT+NmKuumGjUiELCW38G9H
         4BsNkFhJjIvggwLj9Hn+5S8E75wP4gSlEZSwWrxv/JH/Ykb6SwStw4hV3xui3U/7oUqd
         QC4a5t85kSwBxNvbxtAEH+O/vWmvkmoWsRWAR9IAEaQee6OCndLEPdtWsbbuVGUDLAoh
         sHoepWjZbAKkILwyX3EjdgXR4+k7Yh1yuONh4Dw+vyiOZ9qnCEgR6kpLkt/FR7Pful6K
         f0n3r+t/gicqaJVn0y22H+Yv88K/k3bededRI4amHXHCpGY1sFRgDlL3uTjPu5oULkC2
         GbEQ==
X-Forwarded-Encrypted: i=1; AJvYcCVz0QjJtYB9BXUAOU4b5FiRHvxD5PXBYA0tBnbmpzT0FBQUstKljB0iAZjv5iJaCQfLDsS+c+1SfNQHqA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzqDNvKUWjhD2nPygdYm+rr2JubqyW4Sl23n9Cx/YMiFND8Epti
	F0UQ9acvFGdhIjrHpo/PnCkekq+ZsXqDuc+Hn8NA8JCBSrdWkIvQsJkJfjyJypGk+jaiWUy//BL
	eVIo1pDXhRkgg21A1PjNu0f/rDHbT59S7kvSdWUvj+f8m54b6SuEBeVuiYHQqH9kEaw==
X-Gm-Gg: AZuq6aIfWlk7m9fFvIkwd+pXrBxXrXI0bCvKuHb4wk4vBhzew0FQUwBSzCAk3h3Ddpc
	ypAYERw772CRxyvhMqOGHtJ0jQzSNmU+asQKpBXHH8Eb41mN+9RnsYFTDLxpoWkrskg3KJ4ugXj
	nzKPUsU4/2OrBLd4fKCEpSZzpsEsWtM2qQFk4rK6FRgwNL3xiHUXrSFZ4urExuKJOKWUyGLdegI
	YQnXyeoMk45FWq75GBrFvVmXHiMjuigcDXAXN01PvPwBjpiTCQ35zy2KVhSyXHVCldiKXWgS4Xo
	1QtgGmCuGCyf0Wdo7K5zBw79jo/sExzjTKemHl6T6myV+OuziaQZjpZ46+zleUQLY47Z9pb1mDo
	zvAFZSsy8lsGcHU0BOjpxQCLY8F13fotRMr5B5tKq0IkmB78YpUzKo++kG3qYlEefMVmR6/PnUR
	4W47EdhxDQFncjWAISquUSAJg=
X-Received: by 2002:a05:6102:4405:b0:5dd:b5a2:b590 with SMTP id ada2fe7eead31-5f72366e745mr585672137.16.1769514331064;
        Tue, 27 Jan 2026 03:45:31 -0800 (PST)
X-Received: by 2002:a05:6102:4405:b0:5dd:b5a2:b590 with SMTP id ada2fe7eead31-5f72366e745mr585642137.16.1769514330447;
        Tue, 27 Jan 2026 03:45:30 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59de48df7f6sm3450910e87.10.2026.01.27.03.45.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 03:45:29 -0800 (PST)
Date: Tue, 27 Jan 2026 13:45:27 +0200
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
        iommu@lists.linux.dev, Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Charan Teja Kalla <charan.kalla@oss.qualcomm.com>,
        Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
Subject: Re: [PATCH 3/7] of/iommu: add multi-map support
Message-ID: <hunwsdkmeo6efpv3yt3izkgmarelnubd74dywj3scryxrreq6p@njijwtoyjh46>
References: <20260126-kaanapali-iris-v1-0-e2646246bfc1@oss.qualcomm.com>
 <20260126-kaanapali-iris-v1-3-e2646246bfc1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260126-kaanapali-iris-v1-3-e2646246bfc1@oss.qualcomm.com>
X-Proofpoint-GUID: PH2MixjmZ7NdGiDzgT643ZqneaC4K8k6
X-Authority-Analysis: v=2.4 cv=YpcChoYX c=1 sm=1 tr=0 ts=6978a560 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=5JH2DIL-x3vr5n02JuwA:9
 a=CjuIK1q_8ugA:10 a=o1xkdb1NAhiiM49bd1HK:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: PH2MixjmZ7NdGiDzgT643ZqneaC4K8k6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDA5NiBTYWx0ZWRfX8wpDZ7fPTw3P
 uNjcjFLboQWjML5KSXPB759P01Zh6KZLrwRq5lk7v/D118KmYJ+vIngSmKU+v9VF0XWhH1PO5ds
 cQfInuNNN++/4S8YR6j3VHps1TnRXObp8HuyL+1DOytPtEU3PpLq/qUtiYrwh9iq6idxdXHKoej
 L2i6+tgNoUyxuDbF1WDbpis/kVm83RW49hDswcG1nHil7DuGVsPRMe/yAfNx56gQWjEUOLPK8MA
 kOLDTXw0mJwacUIALk99nVFrdty1okuQXTVjWOhwCLS53tsEfp1Op6TvUsA5PcRQmzvdAGtGeIX
 sFzI1p+xEjuAQ+wH2FAAJFa+HXCIL5j5vJO7UlWr/FnEwEA+X75LkH6A5ba2MHu8lou562iYPMN
 W2BNQufi8cwVZ3r7GM8KGJ12l/fcjOGXeQTXMwclR8ZXPuVO1QxZA3SR38zy9YJiB6R/vibSOIY
 1fCa/dvsqMsaLx0SF8A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-27_02,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 impostorscore=0 suspectscore=0
 spamscore=0 malwarescore=0 bulkscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270096
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-51641-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,arg.map_args.np:url,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
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
X-Rspamd-Queue-Id: DA57B93DBE
X-Rspamd-Action: no action

On Mon, Jan 26, 2026 at 05:55:46PM +0530, Vikash Garodia wrote:
> From: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
> 
> When multiple mappings are present for an input id, linux matches just
> the first one. There is a usecase[1] where all the mappings are to be
> maintained in parallel for an iommu-map entry of a same input id.

This contradicts the IOMMU idealogy (at least as far as I understood it
fom the maintainers): the device (driver) doesn't control which IOMMUs
are getting used. Instead _all_ defined entries should get used. For
iommu-map it means that if the map defines several entries for a single
function, then all entries should always get mapped.

> 
> Whether multi-map is needed is reported by the callers through the
> callback function passed, which is called for every input id match.
> 
> Since the requirement in the usecase[1] is for platform devices, not
> sure if it is really clean to maintain this decision on the bus type at
> the of_iommu layer or further to be from the respective
> iommu_driver->impl_ops().

This doesn't tell us, why do you want to control, which entries of the
map get used.

> 
> [1] https://lore.kernel.org/all/20250627-video_cb-v3-0-51e18c0ffbce@quicinc.com/
> 
> Signed-off-by: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
> Signed-off-by: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> ---
>  drivers/iommu/of_iommu.c | 36 ++++++++++++++++++++++++++++--------
>  drivers/of/base.c        | 38 ++++++++++++++++++++++++++++----------
>  include/linux/of.h       |  6 ++++++
>  3 files changed, 62 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/iommu/of_iommu.c b/drivers/iommu/of_iommu.c
> index 768eaddf927b0700b2497b08ea21611b1a1b5688..067bb2298973671e1eaf01bb2ea52df3d2a52a44 100644
> --- a/drivers/iommu/of_iommu.c
> +++ b/drivers/iommu/of_iommu.c
> @@ -16,6 +16,7 @@
>  #include <linux/pci.h>
>  #include <linux/slab.h>
>  #include <linux/fsl/mc.h>
> +#include <linux/platform_device.h>
>  
>  #include "iommu-priv.h"
>  
> @@ -41,22 +42,41 @@ static int of_iommu_xlate(struct device *dev,
>  	return ret;
>  }
>  
> +/*
> + * Callback to be called from of_map_id(), that tells if
> + * all the mappings for an input id to be maintained in
> + * parallel. Should this decission be from further layers,
> + * iommu_driver->impl_ops?
> + */
> +static int of_iommu_configure_cb(struct of_map_id_arg *arg)
> +{
> +	struct of_phandle_args *iommu_spec = &arg->map_args;
> +	struct device *dev = arg->dev;
> +	int err;
> +
> +	err = of_iommu_xlate(dev, iommu_spec);
> +	of_node_put(iommu_spec->np);
> +
> +	/* !iommu_spec->np may be from the bypassed translations */
> +	if (!err)
> +		err = (!arg->multi_map || !iommu_spec->np) ? 0 : -EAGAIN;
> +
> +	return err;
> +}
> +
>  static int of_iommu_configure_dev_id(struct device_node *master_np,
>  				     struct device *dev,
>  				     const u32 *id)
>  {
>  	struct of_map_id_arg arg = {
>  		.map_args = {},
> +		.cb = of_iommu_configure_cb,
> +		.dev = dev,
> +		/* Should this be pushed to iommu_driver->impl_ops? */
> +		.multi_map = dev_is_platform(dev),
>  	};
> -	int err;
> -
> -	err = of_map_iommu_id(master_np, *id, &arg);
> -	if (err)
> -		return err;
>  
> -	err = of_iommu_xlate(dev, &arg.map_args);
> -	of_node_put(arg.map_args.np);
> -	return err;
> +	return of_map_iommu_id(master_np, *id, &arg);
>  }
>  
>  static int of_iommu_configure_dev(struct device_node *master_np,
> diff --git a/drivers/of/base.c b/drivers/of/base.c
> index 606bef4f90e7d13bae4f7b0c45acd1755ad89826..a1c3c5954ec7e8eb3753c8fd782a1570f9eb9c17 100644
> --- a/drivers/of/base.c
> +++ b/drivers/of/base.c
> @@ -2122,14 +2122,21 @@ static bool of_check_bad_map(const __be32 *map, int len)
>  	return true;
>  }
>  
> -static int of_map_id_fill_output(struct of_map_id_arg *arg,
> -				 struct device_node *phandle_node, u32 id_or_offset,
> -				 const __be32 *out_base, u32 cells,
> -				 bool bypass)
> +/*
> + * Fill the id_out and target for the of_map_id() caller. Also
> + * call the callback passed to the of_map_id() as part of the arg
> + * that decides if to continue further search.
> + */
> +static int of_map_id_fill_arg(struct of_map_id_arg *arg,
> +			      struct device_node *phandle_node, u32 id_or_offset,
> +			      const __be32 *out_base, u32 cells,
> +			      bool bypass, bool *multi_id_map)
>  {
> +	int ret;
> +
>  	if (bypass) {
>  		arg->map_args.args[0] = id_or_offset;
> -		return 0;
> +		goto output;
>  	}
>  
>  	if (arg->map_args.np)
> @@ -2145,7 +2152,14 @@ static int of_map_id_fill_output(struct of_map_id_arg *arg,
>  
>  	arg->map_args.args_count = cells;
>  
> -	return 0;
> +output:
> +	/* pass the output for the callback, callers may further decide */
> +	ret =  arg->cb ? arg->cb(arg) : 0;
> +
> +	if (multi_id_map && ret == -EAGAIN)
> +		*multi_id_map = true;
> +
> +	return ret;
>  }
>  
>  /**
> @@ -2179,6 +2193,7 @@ int of_map_id(const struct device_node *np, u32 id, const char *map_name,
>  	int map_bytes, map_len, offset = 0;
>  	bool bad_map = false;
>  	const __be32 *map = NULL;
> +	bool multi_id_map = false;
>  
>  	if (!np || !map_name || !arg)
>  		return -EINVAL;
> @@ -2264,23 +2279,26 @@ int of_map_id(const struct device_node *np, u32 id, const char *map_name,
>  		if (masked_id < id_base || id_off >= id_len)
>  			continue;
>  
> -		ret = of_map_id_fill_output(arg, phandle_node, id_off, out_base, cells, false);
> +		ret = of_map_id_fill_arg(arg, phandle_node, id_off, out_base,
> +					 cells, false, &multi_id_map);
>  		if (ret == -EAGAIN)
>  			continue;
>  
>  		pr_debug("%pOF: %s, using mask %08x, id-base: %08x, out-base: %08x, length: %08x, id: %08x -> %08x\n",
>  			np, map_name, map_mask, id_base, be32_to_cpup(out_base),
>  			id_len, id, id_off + be32_to_cpup(out_base));
> -		return 0;
> +		return ret;
>  	}
>  
> +	if (multi_id_map)
> +		return 0;
> +
>  	pr_info("%pOF: no %s translation for id 0x%x on %pOF\n", np, map_name,
>  		id, arg->map_args.np  ? arg->map_args.np : NULL);
>  
>  bypass_translation:
>  	/* Bypasses translation */
> -	return of_map_id_fill_output(arg, NULL, id, 0, 0, true);
> -
> +	return of_map_id_fill_arg(arg, NULL, id, 0, 0, true, NULL);
>  err_map_len:
>  	pr_err("%pOF: Error: Bad %s length: %d\n", np, map_name, map_bytes);
>  	return -EINVAL;
> diff --git a/include/linux/of.h b/include/linux/of.h
> index 9efa6f93712c6024f05476f9fd39f3294f942ec1..abab73a76682351f5635c1127a6c899917525050 100644
> --- a/include/linux/of.h
> +++ b/include/linux/of.h
> @@ -25,6 +25,9 @@
>  typedef u32 phandle;
>  typedef u32 ihandle;
>  
> +struct of_map_id_arg;
> +typedef int (*of_map_id_cb)(struct of_map_id_arg *arg);
> +
>  struct property {
>  	char	*name;
>  	int	length;
> @@ -76,6 +79,9 @@ struct of_phandle_args {
>  
>  struct of_map_id_arg {
>  	struct of_phandle_args map_args;
> +	of_map_id_cb cb;
> +	struct device *dev;
> +	bool multi_map;
>  };
>  
>  struct of_phandle_iterator {
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

