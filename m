Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D590755D679
	for <lists+linux-media@lfdr.de>; Tue, 28 Jun 2022 15:16:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232880AbiF0JkT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Jun 2022 05:40:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232176AbiF0JkR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Jun 2022 05:40:17 -0400
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 309F3614A
        for <linux-media@vger.kernel.org>; Mon, 27 Jun 2022 02:40:15 -0700 (PDT)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25R7mAUU015017;
        Mon, 27 Jun 2022 11:40:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=o7dfOl4S6u/3Ojhlka+sdSby2aZu6UTszEhV542U3es=;
 b=2rHsEkg7pZBd2U48NeKhr6YNtEF9MQiu+yZKNIfv4car7CxxqOUj2kpKq6+VP1Y2JncH
 Rw/U4iFraMvRFvqYWWjp5qiqXCAxWexH54FeQcdL0qzevVu/CXT4mZGxkavER7DjPaHk
 5jDJ6WAkyB5HXd2dZPPo8yqrSUdxnvuzdm9D+rAMX/XgRT9UAT8WDbHRDcx3MpK4FZq0
 /IhuAfRyXPyEF4clC9qC6mkh3QxREnN9pn0JvGWM10wRdK4r/tMccB0gL0d8tA5bohrd
 HHi5D38c8vuWEs8QEr6R4AC+x6E+VuFFgJcXNcLio/WxjR5FcS1S4Xu7gBdvvoDEYKOD tQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3gwqsm8uxv-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 27 Jun 2022 11:40:10 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5D8AB10002A;
        Mon, 27 Jun 2022 11:40:09 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 59286216EC3;
        Mon, 27 Jun 2022 11:40:09 +0200 (CEST)
Received: from [10.201.21.143] (10.75.127.46) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Mon, 27 Jun
 2022 11:40:08 +0200
Message-ID: <9f6cff45-1894-23b5-afe7-49986e65ab5d@foss.st.com>
Date:   Mon, 27 Jun 2022 11:40:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] media: stm32: dcmi: Drop always NULL sd_state from
 dcmi_pipeline_s_fmt()
Content-Language: en-US
To:     Marek Vasut <marex@denx.de>, <linux-media@vger.kernel.org>
CC:     Alain Volmat <alain.volmat@foss.st.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Amelie DELAUNAY <amelie.delaunay@foss.st.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Philippe CORNU <philippe.cornu@foss.st.com>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>
References: <20220618222354.478227-1-marex@denx.de>
From:   Hugues FRUCHET <hugues.fruchet@foss.st.com>
In-Reply-To: <20220618222354.478227-1-marex@denx.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-06-27_06,2022-06-24_01,2022-06-22_01
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Marek,

Thanks for the patch.

Acked-by: Hugues Fruchet <hugues.fruchet@st.com>

BR,
Hugues.

On 6/19/22 00:23, Marek Vasut wrote:
> The second argument is always NULL, stop passing it to the function.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Alain Volmat <alain.volmat@foss.st.com>
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Amelie DELAUNAY <amelie.delaunay@foss.st.com>
> Cc: Hugues FRUCHET <hugues.fruchet@foss.st.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Philippe CORNU <philippe.cornu@foss.st.com>
> Cc: linux-stm32@st-md-mailman.stormreply.com
> Cc: linux-arm-kernel@lists.infradead.org
> ---
>   drivers/media/platform/st/stm32/stm32-dcmi.c | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/st/stm32/stm32-dcmi.c b/drivers/media/platform/st/stm32/stm32-dcmi.c
> index 56f4e04bc7c49..ec54b5ecfd544 100644
> --- a/drivers/media/platform/st/stm32/stm32-dcmi.c
> +++ b/drivers/media/platform/st/stm32/stm32-dcmi.c
> @@ -622,7 +622,6 @@ static struct media_entity *dcmi_find_source(struct stm32_dcmi *dcmi)
>   }
>   
>   static int dcmi_pipeline_s_fmt(struct stm32_dcmi *dcmi,
> -			       struct v4l2_subdev_state *sd_state,
>   			       struct v4l2_subdev_format *format)
>   {
>   	struct media_entity *entity = &dcmi->source->entity;
> @@ -664,7 +663,7 @@ static int dcmi_pipeline_s_fmt(struct stm32_dcmi *dcmi,
>   			format->format.width, format->format.height);
>   
>   		fmt.pad = pad->index;
> -		ret = v4l2_subdev_call(subdev, pad, set_fmt, sd_state, &fmt);
> +		ret = v4l2_subdev_call(subdev, pad, set_fmt, NULL, &fmt);
>   		if (ret < 0) {
>   			dev_err(dcmi->dev, "%s: Failed to set format 0x%x %ux%u on \"%s\":%d pad (%d)\n",
>   				__func__, format->format.code,
> @@ -1115,7 +1114,7 @@ static int dcmi_set_fmt(struct stm32_dcmi *dcmi, struct v4l2_format *f)
>   	mf->width = sd_framesize.width;
>   	mf->height = sd_framesize.height;
>   
> -	ret = dcmi_pipeline_s_fmt(dcmi, NULL, &format);
> +	ret = dcmi_pipeline_s_fmt(dcmi, &format);
>   	if (ret < 0)
>   		return ret;
>   
