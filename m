Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A5E207A1FD0
	for <lists+linux-media@lfdr.de>; Fri, 15 Sep 2023 15:26:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235281AbjION1C (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Sep 2023 09:27:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235233AbjION1C (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Sep 2023 09:27:02 -0400
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B188D171C
        for <linux-media@vger.kernel.org>; Fri, 15 Sep 2023 06:26:55 -0700 (PDT)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 38FClVHt008712;
        Fri, 15 Sep 2023 15:26:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
        message-id:date:mime-version:subject:to:cc:references:from
        :in-reply-to:content-type:content-transfer-encoding; s=
        selector1; bh=dMmP3dOjMQ2njmdlY/1PCjGVw9QkxSBy90b+exOlfxE=; b=SH
        VQldM5HMafc1C7bJb+EGz+y+6yHi9pamLxEDkxIXAvRVYlfuFP5Cf/F762iYydOK
        X50RFtnaenFgfyxYh24FX1XpHvvQUv2Wea0NlpxQyoJBWFJjYc8Kf17Gtn6ld6tL
        QZyOF3VhWuQaf1AU+XJAXNz+/sSBDwA5FxevXfD215RgN2i++DhQ3RnJtRcB6bfK
        Pb3WBkFbfjG++P3n8yE0luaAhOG8VX1vZ5hy8qYXGOn4xL1Bb2gf7jRBwLgnuW9Z
        t7trsoC6f5V+N6+3ykI6B9XDXkw2drxwQQZ+sAimGrk4N7idPVrgw5zIZ49d9iB5
        QG13YMC9pGSQ35/Yo6Iw==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3t2y7nnnu9-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 15 Sep 2023 15:26:41 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 76A5D100056;
        Fri, 15 Sep 2023 15:26:39 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6EF982309F0;
        Fri, 15 Sep 2023 15:26:39 +0200 (CEST)
Received: from [10.252.4.8] (10.252.4.8) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 15 Sep
 2023 15:26:39 +0200
Message-ID: <ab2b1627-aaeb-554f-fa94-1574f8d4e607@foss.st.com>
Date:   Fri, 15 Sep 2023 15:26:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH] media: i2c: Use pm_runtime_resume_and_get()
Content-Language: en-US
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        <linux-media@vger.kernel.org>
CC:     Sakari Ailus <sakari.ailus@iki.fi>,
        Martin Kepplinger <martink@posteo.de>,
        Daniel Scally <djrscally@gmail.com>,
        Sylvain Petinot <sylvain.petinot@foss.st.com>
References: <20230914172054.31825-1-laurent.pinchart@ideasonboard.com>
From:   Benjamin Mugnier <benjamin.mugnier@foss.st.com>
In-Reply-To: <20230914172054.31825-1-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.252.4.8]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-15_10,2023-09-14_01,2023-05-22_02
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

Just tested it on the vgxy61. Thanks for cleaning the
pm_runtime_put_autosuspend part.

On 9/14/23 19:20, Laurent Pinchart wrote:
> diff --git a/drivers/media/i2c/st-vgxy61.c b/drivers/media/i2c/st-vgxy61.c
> index 30f82ca344c4..5dbfb04b3124 100644
> --- a/drivers/media/i2c/st-vgxy61.c
> +++ b/drivers/media/i2c/st-vgxy61.c
> @@ -1170,14 +1170,9 @@ static int vgxy61_stream_enable(struct vgxy61_dev *sensor)
>  	if (ret)
>  		return ret;
>  
> -	ret = pm_runtime_get_sync(&client->dev);
> -	if (ret < 0) {
> -		pm_runtime_put_autosuspend(&client->dev);
> +	ret = pm_runtime_resume_and_get(&client->dev);
> +	if (ret)
>  		return ret;
> -	}
> -
> -	/* pm_runtime_get_sync() can return 1 as a valid return code */
> -	ret = 0;
>  
>  	vgxy61_write_reg(sensor, VGXY61_REG_FORMAT_CTRL,
>  			 get_bpp_by_code(sensor->fmt.code), &ret);

Acked-By: Benjamin Mugnier <benjamin.mugnier@foss.st.com>

-- 
Regards,

Benjamin
