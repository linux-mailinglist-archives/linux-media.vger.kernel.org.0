Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DE6A56FDC94
	for <lists+linux-media@lfdr.de>; Wed, 10 May 2023 13:22:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236451AbjEJLWz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 May 2023 07:22:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236019AbjEJLWy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 May 2023 07:22:54 -0400
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B69A10D
        for <linux-media@vger.kernel.org>; Wed, 10 May 2023 04:22:53 -0700 (PDT)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34AA5OrS027340;
        Wed, 10 May 2023 13:22:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=USlqsdGhDytoazAU2YzvvLLts2hJaNO6e4Uyu5T/r1w=;
 b=jgUdQCoPtxTUho1r6TamgMg/Og4eP2GIDAdQxnGGDJ9O2iIwpKGA9e7VF4FKBWUGPqj4
 YckLQjQVxRJmuFoFeckSttS31jCy7sU2vyEQY7gZ1D/8EekDbpgCY7esvJS271ROZZRj
 jidCxBQBRwJpL/12v210M9EOkhQLmR5mbkv6fBjBRkrl3Hr8kpAFL73NcDGEfjHL3auu
 x9uOH/oivC3MuBVl8Ea3Yj5HSf1Q48D+VQ9oMVV/95u1urDzDixorp2v+mxhGMBqNK/t
 zo60FlRGSvN1rL04brRCvWwmRFAb4QzHoXatP7J6z93fd9vdljN23wHGjDvCfGZ4HnkS Ug== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3qf79hkh0g-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 10 May 2023 13:22:45 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 95B7410002A;
        Wed, 10 May 2023 13:22:44 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6A7E5218630;
        Wed, 10 May 2023 13:22:44 +0200 (CEST)
Received: from [10.129.167.26] (10.129.167.26) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Wed, 10 May
 2023 13:22:44 +0200
Message-ID: <67e9d3ee-88d9-c1d5-8b8d-928d047fb9f9@foss.st.com>
Date:   Wed, 10 May 2023 13:22:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 2/2] media: i2c: Propagate format from sink to source pad
Content-Language: en-US
To:     Daniel Scally <dan.scally@ideasonboard.com>,
        Sylvain Petinot <sylvain.petinot@foss.st.com>,
        Mickael Guene <mickael.guene@st.com>,
        "Sakari Ailus" <sakari.ailus@linux.intel.com>,
        <linux-media@vger.kernel.org>
CC:     <hugues.fruchet@foss.st.com>, <alain.volmat@foss.st.com>
References: <20230502103547.150918-1-dan.scally@ideasonboard.com>
 <20230502103547.150918-3-dan.scally@ideasonboard.com>
From:   Benjamin Mugnier <benjamin.mugnier@foss.st.com>
In-Reply-To: <20230502103547.150918-3-dan.scally@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.129.167.26]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-10_04,2023-05-05_01,2023-02-09_01
X-Spam-Status: No, score=-6.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Daniel,

Thank you for your patch.

On 5/2/23 12:35, Daniel Scally wrote:
> When setting formats on the sink pad, propagate the adjusted format
> over to the subdev's source pad. Use the MIPID02_SOURCE macro to fetch the pad's
> try format rather than relying on the pad field of the format to facilitate
> this - the function is specific to the source pad anyway.
> 
> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> ---
>  drivers/media/i2c/st-mipid02.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/st-mipid02.c b/drivers/media/i2c/st-mipid02.c
> index f20f87562bf1..04112f26bc9d 100644
> --- a/drivers/media/i2c/st-mipid02.c
> +++ b/drivers/media/i2c/st-mipid02.c
> @@ -750,7 +750,7 @@ static void mipid02_set_fmt_source(struct v4l2_subdev *sd,
>  	if (format->which != V4L2_SUBDEV_FORMAT_TRY)
>  		return;
>  
> -	*v4l2_subdev_get_try_format(sd, sd_state, format->pad) = format->format;
> +	*v4l2_subdev_get_try_format(sd, sd_state, MIPID02_SOURCE) = format->format;
>  }
>  
>  static void mipid02_set_fmt_sink(struct v4l2_subdev *sd,
> @@ -768,6 +768,9 @@ static void mipid02_set_fmt_sink(struct v4l2_subdev *sd,
>  		fmt = &bridge->fmt;
>  
>  	*fmt = format->format;
> +
> +	/* Propagate the format change to the source pad */
> +	mipid02_set_fmt_source(sd, sd_state, format);
>  }
>  
>  static int mipid02_set_fmt(struct v4l2_subdev *sd,
By running checkpatch, I got 2 warnings :

$ ./scripts/checkpatch.pl --strict --max-line-length=80
WARNING: Possible unwrapped commit description (prefer a maximum 75
chars per line)
#7:
over to the subdev's source pad. Use the MIPID02_SOURCE macro to fetch
the pad's

WARNING: line length of 83 exceeds 80 columns
#25: FILE: drivers/media/i2c/st-mipid02.c:753:
+	*v4l2_subdev_get_try_format(sd, sd_state, MIPID02_SOURCE) =
format->format;

Could you fix these in version 2 ? st-mipid02.c has other styling issues
but I'd like not to add new ones ;)

Other than that, the code looks fine for me.


Thank you.

-- 
Regards,

Benjamin
