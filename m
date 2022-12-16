Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5A5F064EDCA
	for <lists+linux-media@lfdr.de>; Fri, 16 Dec 2022 16:23:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231300AbiLPPXD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Dec 2022 10:23:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231394AbiLPPW4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Dec 2022 10:22:56 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFD64537CC
        for <linux-media@vger.kernel.org>; Fri, 16 Dec 2022 07:22:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1671204131;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=XLjDVQMOaQDf9kCy2gWjQIFoZeoTcfdAcAIX6l6ffTc=;
        b=Q4Wn/lm1XqJsurNdJGY331Btn9pcjZVe7qdwc0TE8KJ2xCFJUeI2tvjHTFk4spn8VLuDmk
        yjpwO/h4lXYYflwTGTauT15b1L6SdH+mnxwGeGKR7S1COMximDVpUDlBBHJLi+9Q/kaH47
        gZvwHPFVM6NHe55/eLgMIswtFEFYo6c=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-196-xzzwxJ7qNEu7VK2iCrv-pw-1; Fri, 16 Dec 2022 10:22:09 -0500
X-MC-Unique: xzzwxJ7qNEu7VK2iCrv-pw-1
Received: by mail-ed1-f71.google.com with SMTP id z16-20020a05640235d000b0046d0912ae25so2124282edc.5
        for <linux-media@vger.kernel.org>; Fri, 16 Dec 2022 07:22:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XLjDVQMOaQDf9kCy2gWjQIFoZeoTcfdAcAIX6l6ffTc=;
        b=xKkulhpYDHcnCHAK/ePCAsLirjE/h1WoaGLGr6qpHNOQET1DPvOidG274bEyHC18qD
         YK1HgGbYwTYa+Gf74c9w3WAvwB596MWAiQc/JnjPenXgojYPrKE/rAO2weDitNDPhkqb
         DurxPW3a5d31QVFlFlQk/S1OBnwbhGsmwCy17QongjK/ljXeI29nldq+LIXEmsQuam2+
         EH0T0yveHLf5BmitbpM8aIlHLCRIe1pZto8Mi2pxrdVDFj5PYaDpA2goLXU1NRVto1fw
         VRlPaWnpgh+ys3U3LFqqPmzQmj/uWDvxnfJBnGix+vlAEIr26e019AjNGnKmRWVlSPhj
         aVWg==
X-Gm-Message-State: ANoB5pmLKpAxen7/eTV+r1mZ4dBjWJn43vmhi9RiYlLsyJdU4a2z2CEr
        2cw8qCzn/KFKKGtu3p/vVd8GtvWF9nk9aqtz6uBSHO+oBgU2216IUh79EFoQ4rbeBXcBLQ3O9u7
        xtYMRx3MzceMSJHrJhqRYwHk=
X-Received: by 2002:a17:906:3890:b0:7b2:8a6d:e946 with SMTP id q16-20020a170906389000b007b28a6de946mr28045627ejd.30.1671204128011;
        Fri, 16 Dec 2022 07:22:08 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7YYX/dyJtVTWTDIjqC/iuZkmA+xylzHt6PG1KRCEos6AnmV3ZVyXX7leNzo2uc0QR61mFheQ==
X-Received: by 2002:a17:906:3890:b0:7b2:8a6d:e946 with SMTP id q16-20020a170906389000b007b28a6de946mr28045612ejd.30.1671204127847;
        Fri, 16 Dec 2022 07:22:07 -0800 (PST)
Received: from ?IPV6:2001:1c00:2a07:3a01:67e5:daf9:cec0:df6? (2001-1c00-2a07-3a01-67e5-daf9-cec0-0df6.cable.dynamic.v6.ziggo.nl. [2001:1c00:2a07:3a01:67e5:daf9:cec0:df6])
        by smtp.gmail.com with ESMTPSA id kv5-20020a17090778c500b007b29eb8a4dbsm987367ejc.13.2022.12.16.07.22.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Dec 2022 07:22:07 -0800 (PST)
Message-ID: <1f784f94-cbb1-79db-3796-ec5c21c9e8e2@redhat.com>
Date:   Fri, 16 Dec 2022 16:22:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v3 01/11] leds: led-class: Add missing put_device() to
 led_put()
To:     Andy Shevchenko <andy@kernel.org>
Cc:     Mark Gross <markgross@kernel.org>, Pavel Machek <pavel@ucw.cz>,
        Lee Jones <lee@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Daniel Scally <djrscally@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-gpio@vger.kernel.org, Kate Hsuan <hpa@redhat.com>,
        Mark Pearson <markpearson@lenovo.com>,
        Andy Yeh <andy.yeh@intel.com>, Yao Hao <yao.hao@intel.com>,
        linux-media@vger.kernel.org
References: <20221216113013.126881-1-hdegoede@redhat.com>
 <20221216113013.126881-2-hdegoede@redhat.com>
 <Y5x0IdXiczdc73qV@smile.fi.intel.com> <Y5x4z6N5ZjdomP4c@smile.fi.intel.com>
Content-Language: en-US
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Y5x4z6N5ZjdomP4c@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 12/16/22 14:55, Andy Shevchenko wrote:
> On Fri, Dec 16, 2022 at 03:35:29PM +0200, Andy Shevchenko wrote:
>> On Fri, Dec 16, 2022 at 12:30:03PM +0100, Hans de Goede wrote:
> 
> ...
> 
>>>  	led_cdev = dev_get_drvdata(led_dev);
>>>  
>>> -	if (!try_module_get(led_cdev->dev->parent->driver->owner))
>>> +	if (!try_module_get(led_cdev->dev->parent->driver->owner)) {
>>> +		put_device(led_cdev->dev);
>>>  		return ERR_PTR(-ENODEV);
>>> +	}
>>>  
>>>  	return led_cdev;
>>
>> ...
>>
>>>  void led_put(struct led_classdev *led_cdev)
>>>  {
>>>  	module_put(led_cdev->dev->parent->driver->owner);
>>> +	put_device(led_cdev->dev);
>>
>> Hmm... It was in the original submission.
>>
>> https://lore.kernel.org/linux-leds/1443605522-1118-2-git-send-email-tomi.valkeinen@ti.com/
> 
> ...
> 
>> Nevertheless, shouldn't you put device before putting module? (It may need to
>> save the owner of the driver, I think.)
> 
> I think this is wrong, the symmetry is kept correct in your patch.

Right, the line above dereferences led_cdev->dev, so the put()
must be done after that line.

Regards,

Hans

