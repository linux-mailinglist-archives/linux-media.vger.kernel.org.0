Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4EE507265B0
	for <lists+linux-media@lfdr.de>; Wed,  7 Jun 2023 18:19:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233340AbjFGQTN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Jun 2023 12:19:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231783AbjFGQS5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Jun 2023 12:18:57 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07ED110D5
        for <linux-media@vger.kernel.org>; Wed,  7 Jun 2023 09:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686154688;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=7bNuVDxSIZ0sSyNaNVkZGQSsFkrUNSmZusgE1i6UmEw=;
        b=SQta8KoBjeVWuAeWjeOeu+LLinXzQzeP+Gn6DK9WZuTuJh2tKQjOKVg/KQFbtZWn+5DTxg
        9smAW/E16Vgjxs0LWzJ4wf//iyQBOA+KRvM5MtitltxXJ8e6PVPOm7gzxDXMcmj5QH2657
        7SgJk4e+D/10Z5WsEUp16E/E6vl7SyY=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-537-_vePPZDiPgW6_g05pgOPmA-1; Wed, 07 Jun 2023 12:18:06 -0400
X-MC-Unique: _vePPZDiPgW6_g05pgOPmA-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-970e0152da7so679287566b.2
        for <linux-media@vger.kernel.org>; Wed, 07 Jun 2023 09:18:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686154684; x=1688746684;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7bNuVDxSIZ0sSyNaNVkZGQSsFkrUNSmZusgE1i6UmEw=;
        b=MsLpwJNNznmJi+VXy8otqwuLGVnAgaaBfl4jiDV5/lOJc3XsiQlwH64w/L7aosr0tq
         hw46T3UCEqYaH4SeU0a2XfLc5YTZwV4MyrcoJ9LPScW3VtX5TNOT/7L7fQPicIUxl92h
         JEIZUJ4l0RwoECbuuBECHq7adZQi2aqHB2snVlMhtYSL/LDrUTsdgCPgfhzQDJQIzP1X
         ejdG1ScrF7b7rjvQRU67yAM1hvmSoZkVkaVK2G5YYQ543z3PVGe1JpNytL3Z/IAerE2R
         tg1H8YojbYMO517QQpBPDQFyM7dDEmjpz/JErYWbWSw00lZxj2xAj8dcKS1BgQgybwWO
         JU/w==
X-Gm-Message-State: AC+VfDw21TpDiDndfqmxU55+gNqkFqg6h6w0DBB49lwO5hzfpMz2TNFY
        NDouj3gmnPqDr2XHG40o3L1xPu3FiHY91qcKnDf2cS/PIeWUV2ClbZTmoMMP2HVKGMepv1g89rx
        1CBd5J0A52D65Qe3ygvqg9Js=
X-Received: by 2002:a17:907:72d0:b0:974:5ece:19a6 with SMTP id du16-20020a17090772d000b009745ece19a6mr7502935ejc.54.1686154684499;
        Wed, 07 Jun 2023 09:18:04 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ563U6SbNQTes0/dmS3/xdJ+4/9HvhrBZn1e8VP3t2syN/QbP0GYl2qji81dlPwkUUM8HpiIA==
X-Received: by 2002:a17:907:72d0:b0:974:5ece:19a6 with SMTP id du16-20020a17090772d000b009745ece19a6mr7502913ejc.54.1686154684258;
        Wed, 07 Jun 2023 09:18:04 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id w17-20020a1709060a1100b009655eb8be26sm7102533ejf.73.2023.06.07.09.18.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jun 2023 09:18:03 -0700 (PDT)
Message-ID: <323dfb7a-6dd0-f817-0b1e-e6b8117e42ea@redhat.com>
Date:   Wed, 7 Jun 2023 18:18:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 2/3] media: atomisp: ov2680: Convert to new CCI register
 access helpers
Content-Language: en-US, nl
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, linux-media@vger.kernel.org
References: <20230606165808.70751-1-hdegoede@redhat.com>
 <20230606165808.70751-3-hdegoede@redhat.com>
 <20230607160515.GH22127@pendragon.ideasonboard.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230607160515.GH22127@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 6/7/23 18:05, Laurent Pinchart wrote:

<snip>

>> -static struct ov2680_reg const ov2680_global_setting[] = {
>> +static const struct reg_sequence ov2680_global_setting[] = {
> 
> Maybe you could move this to the .c file and also move the v4l2_cci.h
> inclusion to the .c file ? Or this can be done on top, as I assume
> you'll merge the .h and .c files at some point anyway.

Actually since there already is a (quite old, somewhat broken)
driver/media/i2c/ov2680.c and since the atomisp code can work
with standard v4l2 sensor drivers now I have been porting all
the recent work don on atomisp-ov2680.c to driver/media/i2c/ov2680.c
(to avoid causing regressions for potential users of that).

As I mentioned elsewhere in the thread:

"""
So I'm not even sure if this patch should be merged, as I mentioned in the cover letter this one is mostly here to illustrate use of the new helpers.

I also wrote this patch to make porting recent atomisp-ov2680.c changes over to drivers/media/i2c/ov2680.c easier. Part of the series to get drivers/media/i2c/ov2680.c into shape is converting it to the new CCI helpers so that I could then easily copy over bits from the also converted atomisp-ov2680.c.

So it might be interesting to still merge this so that the latest state of atomisp-ov2680.c is easier to compare to drivers/media/i2c/ov2680.c if the need arises.
"""

So rather then merging the .h into .c the next patch I expect to
write for the atomisp-ov2680.c driver is a patch to drop it from
the kernel since it will be superseded by a proper standard
v4l2 sensor driver then :)

> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Thank you.

Regards,

Hans





> 
>>  	/* MIPI PHY, 0x10 -> 0x1c enable bp_c_hs_en_lat and bp_d_hs_en_lat */
>>  	{0x3016, 0x1c},
>>  
>> @@ -242,8 +181,6 @@ static struct ov2680_reg const ov2680_global_setting[] = {
>>  
>>  	/* DPC THRE RATIO 0x04 (4) -> 0x00 (0) */
>>  	{0x5792, 0x00},
>> -
>> -	{}
>>  };
>>  
>>  #endif
> 

