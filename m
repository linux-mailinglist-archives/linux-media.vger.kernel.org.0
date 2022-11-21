Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 92F2863223A
	for <lists+linux-media@lfdr.de>; Mon, 21 Nov 2022 13:35:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230449AbiKUMfH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Nov 2022 07:35:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230430AbiKUMfA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Nov 2022 07:35:00 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86B4838A7
        for <linux-media@vger.kernel.org>; Mon, 21 Nov 2022 04:33:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1669034028;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=meVOHhXRBgs9gnMyNYKv3EIny7niHjL9J4IgWMFVG/A=;
        b=CFKMfCbk0y9fjrBDGlvp9oDByPFnhqlHiAXSQBuHM+NTqWw/Ue7gDeHc5i4a0b4/rrAutG
        vN7M7wqqQivx8ifmy8Z6aJUFq1dt+bnjXZ255I4N7lF/JBm51BYenFTK7lnECMmouCFI+J
        vdmmiFNJX8I+y66mDzkepKwTqCk/RyE=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-439-JAuqIA-rM3SXnILkyH0-tw-1; Mon, 21 Nov 2022 07:33:47 -0500
X-MC-Unique: JAuqIA-rM3SXnILkyH0-tw-1
Received: by mail-ed1-f72.google.com with SMTP id w17-20020a056402269100b00461e28a75ccso6711735edd.8
        for <linux-media@vger.kernel.org>; Mon, 21 Nov 2022 04:33:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=meVOHhXRBgs9gnMyNYKv3EIny7niHjL9J4IgWMFVG/A=;
        b=1bR89AgTUXNbwePQc/wS+oC3C2yx2VOtl39MOjxbRTSQSOidHrJ8QO9FZOvCpImpJD
         hqSL8VX4d72ZuYzuHGu8SEzwOV50UW9x3dqHZ1e7kzsgX3NfT5H+uZ7SgyRBRpnVRVEs
         qt5AV5g5kuPyd+AZfbepgNvXrBGzJ+dfM2lHZUrAXfBlZFgpF1yodxFh8ef3Oho9wICg
         7k5CP9q4hMW5RfvHlphhrddV1W803vNdhFiiUJUw+7rfh0GuZJfBAwzlpOtMb7UBhWQg
         UloBFG2vPHzAV4DVgekrxj0rRj7tl8bg1egdWW55kv//l+5QqdPdfz/ghrwiqetNAEmb
         GP3w==
X-Gm-Message-State: ANoB5pkExHuFl1GPce7iq0xBMuzXlVGD0wiMDq2KPsCM2lVLAVtqZtN/
        Wuc5ZWiUQtOCJv1yuxLaXJ//c6oGMqNbnViboMYTLmGxRosZlbxI/8z2pEXTDUz4P2lE/PqocCG
        pl65vfzNdqTWjXqqczhUrDd8=
X-Received: by 2002:a05:6402:2993:b0:462:845:ba98 with SMTP id eq19-20020a056402299300b004620845ba98mr15798961edb.12.1669034026241;
        Mon, 21 Nov 2022 04:33:46 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4eCgznlypt31HXqg6iFHx71IOJT/sT0aWZv0mN5+IPcESAXjncwsMlflLBdRBSbnG1BWtvEQ==
X-Received: by 2002:a05:6402:2993:b0:462:845:ba98 with SMTP id eq19-20020a056402299300b004620845ba98mr15798943edb.12.1669034026087;
        Mon, 21 Nov 2022 04:33:46 -0800 (PST)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id v10-20020a170906292a00b0078e0973d1f5sm4975532ejd.0.2022.11.21.04.33.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Nov 2022 04:33:45 -0800 (PST)
Message-ID: <81220468-86d3-d6ff-07aa-0c5c72c08df2@redhat.com>
Date:   Mon, 21 Nov 2022 13:33:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH 17/20] media: atomisp: Move calling of css_[un]init() to
 power_on()/_off()
Content-Language: en-US
To:     Andy Shevchenko <andy@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
References: <20221120224101.746199-1-hdegoede@redhat.com>
 <20221120224101.746199-18-hdegoede@redhat.com>
 <Y3tBc4u/oZ6jacrm@smile.fi.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Y3tBc4u/oZ6jacrm@smile.fi.intel.com>
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

Hi,

On 11/21/22 10:14, Andy Shevchenko wrote:
> On Sun, Nov 20, 2022 at 11:40:58PM +0100, Hans de Goede wrote:
>> atomisp_css_init() is always called after calling atomisp_power_on()
>> either directly or through getting a runtime-pm reference.
>>
>> Likewise atomisp_css_uninit() is always called after calling
>> atomisp_power_off().
>>
>> Move the call site of these 2 functions to inside atomisp_power_on() /
>> atomisp_power_off() to make this more explicit.
> 
> ...
> 
>>  	dev_dbg(isp->dev, "%s\n", __func__);
>> -	atomisp_css_uninit(isp);
>> +
>>  	ret = atomisp_power_off(isp->dev);
>>  	if (ret < 0)
>>  		dev_err(isp->dev, "atomisp_power_off failed, %d\n", ret);
>>  
>>  	ret = atomisp_power_on(isp->dev);
>> -	if (ret < 0)
>> +	if (ret < 0) {
>>  		dev_err(isp->dev, "atomisp_power_on failed, %d\n", ret);
>> -
>> -	ret = atomisp_css_init(isp);
>> -	if (ret)
> 
>>  		isp->isp_fatal_error = true;
> 
> This was only set when css_init() failed, now it may be set even when
> power_on() fails. Why is it not a problem? Commit message doesn't shed
> a light on this change.

Failing to power-on the device is pretty fatal too, but this is indeed
a behavior change. I have updated the commit message to reflect this.

Regards,

Hans


