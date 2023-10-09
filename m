Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7C1D47BE39C
	for <lists+linux-media@lfdr.de>; Mon,  9 Oct 2023 16:54:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344471AbjJIOyC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Oct 2023 10:54:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344513AbjJIOxx (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Oct 2023 10:53:53 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 019159E
        for <linux-media@vger.kernel.org>; Mon,  9 Oct 2023 07:53:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1696863188;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=pq5FGSLXOzmAGpYCBQpAokjf/iKUwyLNOzcp5eZQyYw=;
        b=RPMmXmJXIa4I3sDc8sI2U9fQDJzK8vYg+FfGG71yMTdJECfPmK0G97g4gYFUB/xi1Sj+dU
        CuMYe4MpK4Y3SWlNEXGHj0HE30pDINBFXeITvf/q/62sNukYcXRGaPomQ+S0ZweqqwVJ2x
        mNU2JvWV94ATwIS5U9HXvdCY0UPy2tM=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-628--KWNIBBDM9CxW6FiUpMa5g-1; Mon, 09 Oct 2023 10:52:57 -0400
X-MC-Unique: -KWNIBBDM9CxW6FiUpMa5g-1
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-52310058f1eso6476002a12.0
        for <linux-media@vger.kernel.org>; Mon, 09 Oct 2023 07:52:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696863175; x=1697467975;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pq5FGSLXOzmAGpYCBQpAokjf/iKUwyLNOzcp5eZQyYw=;
        b=ui4DfOLVu4Po9VkKMxq4cSRejJ9nXhVk1VLcnzF9q1pb0Ac/G5eP5ftVfy3JWVBj+k
         +12q7YHuzi210XS5FmO3AO+3lmmzXhUj/aTNAd/N15YDNUVkUvO5PxN+fDW12dfFaDKu
         yxXmTA2G9UgTVZnubss5SZrvrDIHCsEKJaLmR4vSF+AO3SL1/AK8pOg7xVUPqPhDbHDT
         BMd6D8wiBpRUyuf6EhcdwjuKAiYzq5OqCn5Ieu35Zlm8WjU2JjPfSsi87RWyFj/kNAvE
         XWbW4orCH0bDmzWde/TvYL5GFRYS90lU6By/EQYxlPb61He+eBTm1s+we8R2stz982Q2
         kRmQ==
X-Gm-Message-State: AOJu0YwYPdEfuaEKWMnxGPNXZFSI3qDlkSAWHQuK+clsL3O7nbu39HzU
        q+Ji8tmi18r/73/ok55uE7fHGoNDnprstPHXW+mQ/ZzAJ2ojyUAMttaTGG97VqZrl7NGFA7E4MF
        ge7ANax+AOt3BN1dOMZj7OZbdB56QAHs=
X-Received: by 2002:a05:6402:278c:b0:51e:5bd5:fe7e with SMTP id b12-20020a056402278c00b0051e5bd5fe7emr11109519ede.17.1696863175616;
        Mon, 09 Oct 2023 07:52:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHOpqZTTkVVOuyjymaowwxk0wwoKEYjlZdF4v2+SBwUo19uilnFKSAQDH38lxZ1hK3Q6xkutQ==
X-Received: by 2002:a05:6402:278c:b0:51e:5bd5:fe7e with SMTP id b12-20020a056402278c00b0051e5bd5fe7emr11109509ede.17.1696863175283;
        Mon, 09 Oct 2023 07:52:55 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id x19-20020aa7d393000000b005330b2d1904sm6242605edq.71.2023.10.09.07.52.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Oct 2023 07:52:54 -0700 (PDT)
Message-ID: <e0816f84-7c5f-9689-effd-de9d6fc71291@redhat.com>
Date:   Mon, 9 Oct 2023 16:52:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 3/9] staging: media: atomisp: improve unwinding
Content-Language: en-US, nl
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org
References: <cover.1696586632.git.hverkuil-cisco@xs4all.nl>
 <97bf2e6dcba166ba77a9c35e3fe7b0f20a0abf7a.1696586632.git.hverkuil-cisco@xs4all.nl>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <97bf2e6dcba166ba77a9c35e3fe7b0f20a0abf7a.1696586632.git.hverkuil-cisco@xs4all.nl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 10/6/23 12:08, Hans Verkuil wrote:
> This fixes two smatch warnings:
> 
> drivers/staging/media/atomisp/pci/atomisp_cmd.c:2779 atomisp_cp_dvs_6axis_config() warn: missing unwind goto?
> drivers/staging/media/atomisp/pci/atomisp_cmd.c:2878 atomisp_cp_morph_table() warn: missing unwind goto?
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> CC: Hans de Goede <hdegoede@redhat.com>
> ---
>  .../staging/media/atomisp/pci/atomisp_cmd.c    | 18 ++++++++++++------
>  1 file changed, 12 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
> index a54be2d20c58..759233a7ba50 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
> @@ -2771,12 +2771,16 @@ int atomisp_cp_dvs_6axis_config(struct atomisp_sub_device *asd,
>  			css_param->dvs_6axis = NULL;
>  
>  			dvs_6axis_config = ia_css_dvs2_6axis_config_allocate(stream);
> -			if (!dvs_6axis_config)
> -				return -ENOMEM;
> +			if (!dvs_6axis_config) {
> +				ret = -ENOMEM;
> +				goto error;
> +			}
>  		} else if (!dvs_6axis_config) {
>  			dvs_6axis_config = ia_css_dvs2_6axis_config_allocate(stream);
> -			if (!dvs_6axis_config)
> -				return -ENOMEM;
> +			if (!dvs_6axis_config) {
> +				ret = -ENOMEM;
> +				goto error;
> +			}
>  		}
>  
>  		dvs_6axis_config->exp_id = source_6axis_config->exp_id;
> @@ -2874,8 +2878,10 @@ int atomisp_cp_morph_table(struct atomisp_sub_device *asd,
>  		morph_table = atomisp_css_morph_table_allocate(
>  				source_morph_table->width,
>  				source_morph_table->height);
> -		if (!morph_table)
> -			return -ENOMEM;
> +		if (!morph_table) {
> +			ret = -ENOMEM;
> +			goto error;
> +		}
>  
>  		for (i = 0; i < IA_CSS_MORPH_TABLE_NUM_PLANES; i++) {
>  			if (copy_from_compatible(morph_table->coordinates_x[i],

There are 2 : "morph_table = atomisp_css_morph_table_allocate(...)"
statements in this function in both branches of the
if (IS_ISP2401) { ... } else { ... } block, shouldn't both cases
get the goto error treatment ?

Otherwise this looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans

