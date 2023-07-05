Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D367874828C
	for <lists+linux-media@lfdr.de>; Wed,  5 Jul 2023 12:52:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231924AbjGEKwl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 Jul 2023 06:52:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231565AbjGEKwk (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 Jul 2023 06:52:40 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCA84CE
        for <linux-media@vger.kernel.org>; Wed,  5 Jul 2023 03:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1688554315;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Qvewi30Cs+yBcVLxu4g/RVlXd0XiQ43RoLYzjKrpqDI=;
        b=D+Kr0eXUg5MGAU/Ls2zO26xmjtXkP97dHUnZcb4+Aa/unbcpfBE8yLU0H9TA9kVtqXS4yK
        oI/elZ6VVtSJ1f+5RISIpYBmmKoiaclDOh5IJ4cKgilOl0V8FDRq1sl3d4kXtorswbmluq
        W3xxdCC8nU6GxjMBp2+GDTIN6OkU5nc=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-267-bLSFLNoEOzeKnNPCwSs23Q-1; Wed, 05 Jul 2023 06:51:52 -0400
X-MC-Unique: bLSFLNoEOzeKnNPCwSs23Q-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-977e6c94186so462064066b.1
        for <linux-media@vger.kernel.org>; Wed, 05 Jul 2023 03:51:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688554311; x=1691146311;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Qvewi30Cs+yBcVLxu4g/RVlXd0XiQ43RoLYzjKrpqDI=;
        b=R8bgvn1f4MTW2g1qKv7BzBWqFH1OorV7hjtJpmz6kBrj1P5W4mMItPSIqCvTOCNwIY
         aMB0Ost1bpXZP0eFvphKjDFQmhjOQhuQq+58vF4J/p/1b46RzPDmFQNdeOnQv6c2JGuP
         EaU4ABwqMy2M6NskDB5V6ViF+ajuXclFXf6Tz0flgnMonwctit/gGvJQJI9BG4EXT5K0
         KFEbb9gytJk6aXr2Vs3XE9LMrabaj+D/k5T7iskgayynw/EJ3rYk+dfSWqeMrmsb5hSk
         YvAi0q1BQ6uIvkuTVQjOs80+nFGYm3Tn/5GNuJgNVMfYW8EHyQpGTw91lLMBtAgBLph0
         dihw==
X-Gm-Message-State: ABy/qLabyKnE2UaWDr2E3VqXbVMOptlb706KQA2g/UGDKTOHGb5Q7mKV
        1hYbGDS88m0MM3PEs5lV9IPGb5biUXQZ9SMNHP2YJTT9xBzka1Fg5W2yeCG2xE9q6w9XCf/iYXS
        DduHtzi60JDPHLutoBK5KBu8=
X-Received: by 2002:a17:907:375:b0:98e:933:28fe with SMTP id rs21-20020a170907037500b0098e093328femr11762883ejb.66.1688554311622;
        Wed, 05 Jul 2023 03:51:51 -0700 (PDT)
X-Google-Smtp-Source: APBJJlH/5V21TPBGyaPgXGd0qJIBsO28rJGsqX4nSnPOaURc7iZmXj0WLQ6yhpN/I39bgkENHjGI2g==
X-Received: by 2002:a17:907:375:b0:98e:933:28fe with SMTP id rs21-20020a170907037500b0098e093328femr11762867ejb.66.1688554311383;
        Wed, 05 Jul 2023 03:51:51 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id r21-20020a1709067fd500b00988781076e2sm14317341ejs.78.2023.07.05.03.51.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Jul 2023 03:51:50 -0700 (PDT)
Message-ID: <90079327-2d9c-8286-b1d9-a972567d7e60@redhat.com>
Date:   Wed, 5 Jul 2023 12:51:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 13/15] media: atomisp: csi2-bridge: Switch to new
 common ipu_bridge_init()
Content-Language: en-US, nl
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        Hao Yao <hao.yao@intel.com>, Bingbu Cao <bingbu.cao@intel.com>,
        linux-media@vger.kernel.org
References: <20230630110643.209761-1-hdegoede@redhat.com>
 <20230630110643.209761-14-hdegoede@redhat.com>
 <CAHp75Vcp9aoKOw-gPeXvJ9VuO5nGN=g5HHjAxWwNyNzo6J2Amw@mail.gmail.com>
 <26ce49af-1267-0a9d-5eb7-f15a94395328@redhat.com>
 <ZKVIIVCNKHebrnt1@kekkonen.localdomain>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <ZKVIIVCNKHebrnt1@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 7/5/23 12:38, Sakari Ailus wrote:
> Hi Hans,
> 
> On Tue, Jul 04, 2023 at 09:21:47PM +0200, Hans de Goede wrote:
>> Hi,
>>
>> On 6/30/23 16:45, Andy Shevchenko wrote:
>>>> +       sensor->lanes = gmin_cfg_get_int(adev, "CsiLanes", lanes);
>>>> +       if (sensor->lanes > IPU_MAX_LANES) {
>>>> +               dev_err(&adev->dev, "Invalid lane-count: %d\n", sensor->lanes);
>>>
>>> Yeah, I think we would be consistent in using the ACPI handle to print
>>> the messages from ACPI sensor devices.
>>
>> I do agree that we need to be consistent, but I regret having switched
>> to using the handle for this in the csi2-bridge code. The dmesg logs
>> this results in are much harder to read. Most devices typically have
>> 2 different sensors and normally it is quite easy to see in the logs
>> which GPIOs, etc. are being used for the sensor.
>>
>> But after the move to using the ACPI handle for logging the logs
>> show up prefixed with \_SB_.I2C2.CAM8 resp CAM2 rather then with
>> OVTI2680 and INT0310 making it much harder to figure on what
>> is going on (first need to do
>> "cat /sys/bus/i2c/devices/i2c-OVTI2680:00/firmware_node/path"
>> to find out which path belongs to which sensor).
> 
> In cases such as the above, the developer probably needs to address issues
> not in the sensor driver but in the ACPI tables (or in IPU bridge code). So
> for this reason I'd prefer printing the device path instead of the HID
> (which is also somewhat opaque).
> 
>>
>> So I would rather get rid of the handle based logging, because it
>> is very cumbersome to use.
> 
> The V4L2 async and fwnode frameworks use handles, too, for the same reason.
> 
> That said, I don't mind printing device names either. AFAIR Laurent
> actually proposed that recently for the V4L2 fwnode and even promised to
> send a patch. :-)

Hmm, ok. I'll keep the acpi_handle logging then and add a " %s:", dev_name() to
the logs so that we log both the ACPI handle path and the dev-name / HID.

>> I'll add an extra patch to the next version of the set to switch all
>> the logging to using the acpi_device for logging.

So this extra patch is going to add logging of the dev_name() instead then.

Regards,

Hans


