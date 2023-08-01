Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 350F276AB3F
	for <lists+linux-media@lfdr.de>; Tue,  1 Aug 2023 10:43:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231958AbjHAInF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Aug 2023 04:43:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232244AbjHAImy (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 1 Aug 2023 04:42:54 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED354E4E
        for <linux-media@vger.kernel.org>; Tue,  1 Aug 2023 01:42:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1690879326;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=9rPtp1JsKKmm98kVQDKyU/n9Q96SyQX6Fd69zYctC2w=;
        b=A5e3cbevOnawyBvXmIOKWjPmaWBEdp0Jq8dIvbV7sEWouTIMVHb84IazVR1GkPl+gZms2P
        doWrJNIBgaz0lbjlrg1NMbO4yrUuVplDFXkQM19K8lvciTgSOSQ1msZ3OR/o+Ai0l3kX7B
        C14VSdF6DNcbdozRSElLfrR73rBCtFs=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-507-YS2_xZ_tNoqyvV9JmMErnw-1; Tue, 01 Aug 2023 04:42:04 -0400
X-MC-Unique: YS2_xZ_tNoqyvV9JmMErnw-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-993d5006993so397248666b.3
        for <linux-media@vger.kernel.org>; Tue, 01 Aug 2023 01:42:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690879323; x=1691484123;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9rPtp1JsKKmm98kVQDKyU/n9Q96SyQX6Fd69zYctC2w=;
        b=C3HoQJUvQ7zQ4yeGaIbT8w1HxpqQzJ3KKW9zOZp5Hcp1mJ4utDMkYV1awSgqqUVbKa
         SEKrdZKuPUCSlUlt648gFUdcbpIPJckhEaGEjDvjuKRe70Grvhe4seqGOd/tNNzzru/R
         WOrodndDST051Sef92LsjwitT5Wut1dEkOBgka1xFf0Undq9L7jsFvSHX4nk9AnOtocw
         /BjQrM3YRbELIfxNylpfdmzOxGLZd9U2wc0RTYGy82mXsHcVTmIF5tHoust2DdUyNyPr
         JD9p/l42i876kwFeF/LrzxHXzxaEWyAwEbEPZMjNlFc5SAxDSq2k8VPghzcgSQvK9HHE
         ns2Q==
X-Gm-Message-State: ABy/qLaassZ0d7tJlTLEyt2wNk343xKl2W6QdL7Ts5JZipvlkNfcuBSg
        vRt97sXo4Cr9kHOqmhwVzDC8YMtxdbG3esNcBrTBZ/HfgK2T9H0nzFcTx6DFwoRh1Gbc6EK/Kuq
        Dn+Ha+aNEhkdc0LB2TME/YkK+kEbkx8o=
X-Received: by 2002:a17:906:846d:b0:99b:f66a:3189 with SMTP id hx13-20020a170906846d00b0099bf66a3189mr1907731ejc.8.1690879323275;
        Tue, 01 Aug 2023 01:42:03 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGglyTSaFdbihANqjNaTaAdRzdWRK0K9t1gTCmMBBlJ6MvdY4stAR93WbefXLIbU/NsUEVyCA==
X-Received: by 2002:a17:906:846d:b0:99b:f66a:3189 with SMTP id hx13-20020a170906846d00b0099bf66a3189mr1907710ejc.8.1690879322963;
        Tue, 01 Aug 2023 01:42:02 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id br9-20020a170906d14900b0099bc8bd9066sm7358247ejb.150.2023.08.01.01.42.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Aug 2023 01:42:02 -0700 (PDT)
Message-ID: <2b59b6a6-11ec-4894-0760-f4481c83ea5d@redhat.com>
Date:   Tue, 1 Aug 2023 10:42:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 21/29] media: ov2680: Make setting the mode algorithm
 based
Content-Language: en-US, nl
To:     Dan Scally <dan.scally@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rui Miguel Silva <rmfrfs@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        Tommaso Merciai <tomm.merciai@gmail.com>,
        linux-media@vger.kernel.org
References: <20230627131830.54601-1-hdegoede@redhat.com>
 <20230627131830.54601-22-hdegoede@redhat.com>
 <3b803ec2-30e0-8d5e-06b2-ac8695b0d624@ideasonboard.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <3b803ec2-30e0-8d5e-06b2-ac8695b0d624@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 7/3/23 10:50, Dan Scally wrote:
> Hi Hans
> 
> On 27/06/2023 15:18, Hans de Goede wrote:
>> Instead of using a long fixed register settings list for each resolution,
>> calculate the register settings based on the requested width + height.
>>
>> This is based on atomisp-ov2680 commit 0611888592df ("media: atomisp:
>> ov2680: Make setting the modes algorithm based").
>>
>> This will allow future enhancements like adding hblank and vblank controls
>> and adding selection support.
>>
>> This also adds properly prgramming the ISP window and setting
> 
> 
> s/prgramming/programming
> 
> 
> This looks mostly good but I have one query down below.

<snip>

>> @@ -609,15 +580,20 @@ static int ov2680_enum_frame_size(struct v4l2_subdev *sd,
>>                     struct v4l2_subdev_state *sd_state,
>>                     struct v4l2_subdev_frame_size_enum *fse)
>>   {
>> -    int index = fse->index;
>> +    static const struct v4l2_frmsize_discrete ov2680_frame_sizes[] = {
>> +        { 1600, 1200 },
>> +        { 1280,  720 },
>> +        {  800,  600 },
>> +    };
>> +    u32 index = fse->index;
>>   -    if (index >= OV2680_MODE_MAX || index < 0)
>> +    if (index >= ARRAY_SIZE(ov2680_frame_sizes))
>>           return -EINVAL;
>>   -    fse->min_width = ov2680_mode_data[index].width;
>> -    fse->min_height = ov2680_mode_data[index].height;
>> -    fse->max_width = ov2680_mode_data[index].width;
>> -    fse->max_height = ov2680_mode_data[index].height;
>> +    fse->min_width = ov2680_frame_sizes[index].width;
>> +    fse->min_height = ov2680_frame_sizes[index].height;
>> +    fse->max_width = ov2680_frame_sizes[index].width;
>> +    fse->max_height = ov2680_frame_sizes[index].height;
>>         return 0;
>>   }
> 
> 
> Unless I'm missing something, .set_fmt() will let you set any arbitrary frame size you like within the bounds of the ov2680's pixel array. That's good, but why then should this callback only report the three discrete sizes?

The later added selection (crop-target) support makes it possible for consumers of this driver to find out the real resolution + explicitly set a crop, rather then doing this through s_fmt.

Just like how the ov5693 driver is doing. The ov5693 driver just lists the full + binned size in ov2680_enum_frame_size().

I was a bit reluctant to do this here to break any potential existing users of the drivers, but :

1. Given the poor state of the driver before I doubt that there are any actual users
2. Jacopo has asked me to change the gain control CID which is also an API break

I think we might just as well go ahead here and only list the full + binned sizes like the ov5693 code does. So I'll go an update that for v4.

Regards,

Hans

