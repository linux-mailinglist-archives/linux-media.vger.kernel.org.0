Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D633E6796A2
	for <lists+linux-media@lfdr.de>; Tue, 24 Jan 2023 12:30:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234021AbjAXLac (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Jan 2023 06:30:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234026AbjAXLab (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Jan 2023 06:30:31 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7BA82BF3A
        for <linux-media@vger.kernel.org>; Tue, 24 Jan 2023 03:29:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1674559782;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=iKvyGA3eKwxGhwNQQQ5wYVrvzSYRhmGXSO5oGhfNkrQ=;
        b=CYjivlG57rzsqnzbySuTucf/Hse12UXbkue31xC8dj5fE4iad4DP4taXTi4m93W7scG5Mm
        SRj9E8qdtDW4UDrpzUbtkFN0Xgr0VzRtYywaI4E1a8RoWQ7g8N/axDYj0xNJypOxyBVxFw
        H6/NXd9Bc/r0+NZb2ZOvGDAl0LW/1Oo=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-655-5Y0-pQw8Ndim2raPd8s6pQ-1; Tue, 24 Jan 2023 06:29:41 -0500
X-MC-Unique: 5Y0-pQw8Ndim2raPd8s6pQ-1
Received: by mail-ej1-f70.google.com with SMTP id sa32-20020a1709076d2000b0084d4593797eso9680850ejc.16
        for <linux-media@vger.kernel.org>; Tue, 24 Jan 2023 03:29:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iKvyGA3eKwxGhwNQQQ5wYVrvzSYRhmGXSO5oGhfNkrQ=;
        b=cm6y2ENp8wmQk5xwTWgxF/ginkC7vTSASCr3Shi408eWF1VVK3sj8A6zdp/61DAqqG
         lRxSzGTDO4SZHfnVqfowjWQdgaSoGhT6OQdBmZ74BQ/URFoqA0cuBWbWip5gx9EgV6BA
         QbowQ57uKuuW/Ka8vRtqWTcNG8mzHQJ0Sygb66OzEOVsHLG0I1gjMVL703Ned66+c2UJ
         ey2KM0teWFauimoNP6GbXSyogCH+MwrUe3aEuxwvyCOTrZ7V5WKo020q70B0BCAYgxbl
         SYYPpDODc8VcZmA11NK0PbjgnboEh8RLb8xIH8Jh3LlIXrDjzoSPz/AMOIcikCrN4kxS
         62hQ==
X-Gm-Message-State: AFqh2kphEvm0SshBPV1NPwL/5M+TrW26XqFkdFOc9mfSJRphbET8BNmF
        FazCOTqrTxxrNyXFqhKF0G5/olQDdm4D9wGhcJMPP5SaWVSSB4i+W6/zUV+R/insrd4w902um2V
        ZWQevEtdPPcmhHem5O0szbhs=
X-Received: by 2002:a17:907:a601:b0:877:a7ec:5ff with SMTP id vt1-20020a170907a60100b00877a7ec05ffmr15201252ejc.10.1674559778933;
        Tue, 24 Jan 2023 03:29:38 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvhVBg8FFeD/NQQUQhWdedsoSMLZip7WQnJFAsLlELR8ZNC1+Bt0uY89BKhV2vZad/NZlvWuA==
X-Received: by 2002:a17:907:a601:b0:877:a7ec:5ff with SMTP id vt1-20020a170907a60100b00877a7ec05ffmr15201232ejc.10.1674559778705;
        Tue, 24 Jan 2023 03:29:38 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a8-20020a17090680c800b0084d397e0938sm748722ejx.195.2023.01.24.03.29.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jan 2023 03:29:38 -0800 (PST)
Message-ID: <6c2e79f9-17df-ba7f-24a9-ca1ab8e480ca@redhat.com>
Date:   Tue, 24 Jan 2023 12:29:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 41/57] media: atomisp: ov2680: Fix frame_size list
Content-Language: en-US, nl
To:     Andy Shevchenko <andy@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
References: <20230123125205.622152-1-hdegoede@redhat.com>
 <20230123125205.622152-42-hdegoede@redhat.com>
 <Y8+29/sVriYtlUTx@smile.fi.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Y8+29/sVriYtlUTx@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 1/24/23 11:46, Andy Shevchenko wrote:
> On Mon, Jan 23, 2023 at 01:51:49PM +0100, Hans de Goede wrote:
>> 3 fixes for the framesize list:
>>
>> 1. Drop modes < 640x480, these are made by significant cropping,
>>    leading to such a small remainig field-of-view that they are
>>    not really usable
> 
> Wondering if we have an algo to actually scale instead of crop.

The sensor can "bin" the pixels, that is use every other pixel,
that already is used. Plain binning gives us 1600x1200 -> 800x600,
640x480 is binning + some cropping.

Regards,

Hans


> 
>> 2. 1616x1082 is presumably intended to be 1600x1080 + 16 pixels
>>    padding in both dimensions, but the height is wrong.
>>    Change this to 1616x1096.
>>
>> 3. The 800x600 mode is missing the 16 pixels padding and
>>    720x592 is missing 16 pixels padding in its width and
>>    the 720x576 base mode is a mode with non square pixels,
>>    while the sensor has square pixels.
>>    Replace both with 768x576 + 16 pixels padding -> 784x592
> 
> Reviewed-by: Andy Shevchenko <andy@kernel.org>
> 
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>  drivers/staging/media/atomisp/i2c/atomisp-ov2680.c | 8 ++------
>>  1 file changed, 2 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
>> index 432539dd274c..81fd36b09090 100644
>> --- a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
>> +++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
>> @@ -700,17 +700,13 @@ static int ov2680_enum_frame_size(struct v4l2_subdev *sd,
>>  {
>>  	static const struct v4l2_frmsize_discrete ov2680_frame_sizes[] = {
>>  		{ 1616, 1216 },
>> -		{ 1616, 1082 },
>> +		{ 1616, 1096 },
>>  		{ 1616,  916 },
>>  		{ 1456, 1096 },
>>  		{ 1296,  976 },
>>  		{ 1296,  736 },
>> -		{  800,  600 },
>> -		{  720,  592 },
>> +		{  784,  592 },
>>  		{  656,  496 },
>> -		{  336,  256 },
>> -		{  352,  288 },
>> -		{  176,  144 },
>>  	};
>>  	int index = fse->index;
>>  
>> -- 
>> 2.39.0
>>
> 

