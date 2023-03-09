Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3B0F66B2473
	for <lists+linux-media@lfdr.de>; Thu,  9 Mar 2023 13:44:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230036AbjCIMom (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Mar 2023 07:44:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230037AbjCIMoi (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 Mar 2023 07:44:38 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D6775D8BA
        for <linux-media@vger.kernel.org>; Thu,  9 Mar 2023 04:43:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1678365836;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=VUO1ZoejbT14VIcDXM49iok3zwufVC87o5YMbxbo9wQ=;
        b=eCIOAtDwxIED6ZkkeSt49z58NBT5XZRJSgLh7ApBL3Qzz/UeALZzgTg6donIPE3oOl8cOS
        nm17zcB+seQpxxB0a7L3NqJ2FnveCFNn257zX/+GVaPuH4dzqcYAeF/V6+OcXt3Y+k5Syq
        iUZgJ5lvbYuo/fVLNWY4Zl6GCAnU6NE=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-166-87e6AwuzP0uENELeET4TmA-1; Thu, 09 Mar 2023 07:43:53 -0500
X-MC-Unique: 87e6AwuzP0uENELeET4TmA-1
Received: by mail-ed1-f72.google.com with SMTP id z14-20020a05640235ce00b004e07ddbc2f8so2754207edc.7
        for <linux-media@vger.kernel.org>; Thu, 09 Mar 2023 04:43:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678365831;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VUO1ZoejbT14VIcDXM49iok3zwufVC87o5YMbxbo9wQ=;
        b=haVXBpLtWUBGMnRndoLiBQ+F8hHiXgHswQpB8Q8gvl72yuN2UC7a29LxJXU0V+mqRd
         1Menr/nWevnJUqzkpsUXA5TYPmimfEVIDiyhp0mYGrf647EwZ2PRJMOLSMb4qfIqrReO
         rvmmTX3TkP8GcrSR24Lf2/0c6qotaGYSlMqHr6cjnm5oNzB+mJK2N4bRbDozGJpDoUdG
         1PCM7roJpsznI4OPfhxvqNsZdlZtQN8wjeL/5OUqEKKBDuqwvWDOiLHpsZrc6w4fMguQ
         ToX4Kot5nqUZpj9W4SgQJG7JQhIB41gBNRJf9miBUGIVuLCIXaBqWbhwJdkcLs6WDRex
         h5eA==
X-Gm-Message-State: AO0yUKVDSQRgBIEOOCescLNPdB1U6uKuoQah/2hQQlZTAfL8i7F03c6M
        WBlT1OMXQAYX97m2lDer38tZWf984VJT60hOhtGb+Am2Nhw7DyCWf3CYZ5Flz0Yn+dlDmDGTril
        YTIw3FUctF/4vuMQ2qdq6SWx9PBaLRUc=
X-Received: by 2002:a05:6402:18c:b0:4ef:9bf0:7177 with SMTP id r12-20020a056402018c00b004ef9bf07177mr8004336edv.9.1678365831869;
        Thu, 09 Mar 2023 04:43:51 -0800 (PST)
X-Google-Smtp-Source: AK7set90GwL+kTBS8y4Kd3C7yx+LeV5peJ3FqiMq/YcGzV8L/G2vTlHngrwJoZPDsEgFyP60D1zKeg==
X-Received: by 2002:a05:6402:18c:b0:4ef:9bf0:7177 with SMTP id r12-20020a056402018c00b004ef9bf07177mr8004322edv.9.1678365831633;
        Thu, 09 Mar 2023 04:43:51 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id lt21-20020a170906fa9500b008e267d7ec18sm8795186ejb.50.2023.03.09.04.43.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Mar 2023 04:43:51 -0800 (PST)
Message-ID: <89823804-7d23-334a-91b2-ea3c819232fd@redhat.com>
Date:   Thu, 9 Mar 2023 13:43:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 1/1] media: v4l: subdev: Make link validation safer
Content-Language: en-US, nl
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Kate Hsuan <hpa@redhat.com>
References: <20230309122716.1624141-1-sakari.ailus@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230309122716.1624141-1-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari, 

On 3/9/23 13:27, Sakari Ailus wrote:
> Link validation currently accesses invalid pointers if the link passed to it
> is not between two sub-devices. This is of course a driver bug.
> 
> Ignore the error but print a debug message, as this is how it used to work
> previously.
> 
> Fixes: a6b995ed03ff ("media: subdev: use streams in v4l2_subdev_link_validate()")
> Reported-by: Hans de Goede <hdegoede@redhat.com>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Reported-and-tested-by: Hans de Goede <hdegoede@redhat.com>

FWIW you have my Reported-by in there twice now ...

Regards,

Hans




> ---
>  drivers/media/v4l2-core/v4l2-subdev.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index 1bebcda2bd20c..dd911180ec899 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -1209,6 +1209,17 @@ int v4l2_subdev_link_validate(struct media_link *link)
>  	struct v4l2_subdev_state *source_state, *sink_state;
>  	int ret;
>  
> +	if (!is_media_entity_v4l2_subdev(link->sink->entity)) {
> +		pr_warn_once("entity \"%s\" not a V4L2 sub-device, driver bug!\n",
> +			     link->sink->entity->name);
> +		return 0;
> +	}
> +	if (!is_media_entity_v4l2_subdev(link->source->entity)) {
> +		pr_warn_once("entity \"%s\" not a V4L2 sub-device, driver bug!\n",
> +			     link->source->entity->name);
> +		return 0;
> +	}
> +
>  	sink_sd = media_entity_to_v4l2_subdev(link->sink->entity);
>  	source_sd = media_entity_to_v4l2_subdev(link->source->entity);
>  

