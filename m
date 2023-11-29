Return-Path: <linux-media+bounces-1302-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F23A7FCC92
	for <lists+linux-media@lfdr.de>; Wed, 29 Nov 2023 03:11:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1BFAB28335A
	for <lists+linux-media@lfdr.de>; Wed, 29 Nov 2023 02:11:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59F3D33D8;
	Wed, 29 Nov 2023 02:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-media@vger.kernel.org
Received: from ex01.ufhost.com (ex01.ufhost.com [61.152.239.75])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF557198D;
	Tue, 28 Nov 2023 18:11:03 -0800 (PST)
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 8EF8924E29A;
	Wed, 29 Nov 2023 10:10:55 +0800 (CST)
Received: from EXMBX162.cuchost.com (172.16.6.72) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 29 Nov
 2023 10:10:54 +0800
Received: from [192.168.125.107] (113.72.145.176) by EXMBX162.cuchost.com
 (172.16.6.72) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 29 Nov
 2023 10:10:53 +0800
Message-ID: <cc617644-029e-4671-8231-a2b01627a08f@starfivetech.com>
Date: Wed, 29 Nov 2023 10:10:50 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: staging: starfive: camss: fix off by one in
 isp_enum_mbus_code()
To: Dan Carpenter <dan.carpenter@linaro.org>, Jack Zhu
	<jack.zhu@starfivetech.com>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	<linux-media@vger.kernel.org>, <linux-staging@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <kernel-janitors@vger.kernel.org>
References: <7d222638-2d19-466d-8dd4-9e1ceb1d46f3@moroto.mountain>
Content-Language: en-US
From: Changhuang Liang <changhuang.liang@starfivetech.com>
In-Reply-To: <7d222638-2d19-466d-8dd4-9e1ceb1d46f3@moroto.mountain>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX162.cuchost.com
 (172.16.6.72)
X-YovoleRuleAgent: yovoleflag



On 2023/11/28 22:40, Dan Carpenter wrote:
> These > comparisons should be >=.  The formats->fmts[] array is either
> a pointer to isp_formats_sink[] or isp_formats_source[] respectively.
> 
> Fixes: e57854628f58 ("media: staging: media: starfive: camss: Add ISP driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Reviewed-by: Changhuang Liang <changhuang.liang@starfivetech.com>

> ---
>  drivers/staging/media/starfive/camss/stf-isp.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/media/starfive/camss/stf-isp.c b/drivers/staging/media/starfive/camss/stf-isp.c
> index 893dbd8cddc8..98d61d71c31b 100644
> --- a/drivers/staging/media/starfive/camss/stf-isp.c
> +++ b/drivers/staging/media/starfive/camss/stf-isp.c
> @@ -120,7 +120,7 @@ static int isp_enum_mbus_code(struct v4l2_subdev *sd,
>  	const struct stf_isp_format_table *formats;
>  
>  	if (code->pad == STF_ISP_PAD_SINK) {
> -		if (code->index > ARRAY_SIZE(isp_formats_sink))
> +		if (code->index >= ARRAY_SIZE(isp_formats_sink))
>  			return -EINVAL;
>  
>  		formats = &isp_dev->formats[SINK_FORMATS_INDEX];
> @@ -128,7 +128,7 @@ static int isp_enum_mbus_code(struct v4l2_subdev *sd,
>  	} else {
>  		struct v4l2_mbus_framefmt *sink_fmt;
>  
> -		if (code->index > ARRAY_SIZE(isp_formats_source))
> +		if (code->index >= ARRAY_SIZE(isp_formats_source))
>  			return -EINVAL;
>  
>  		sink_fmt = v4l2_subdev_state_get_format(state,

