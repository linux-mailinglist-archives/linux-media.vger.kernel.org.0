Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F41A4679628
	for <lists+linux-media@lfdr.de>; Tue, 24 Jan 2023 12:06:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233512AbjAXLGe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Jan 2023 06:06:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232620AbjAXLG3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Jan 2023 06:06:29 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5136F43908
        for <linux-media@vger.kernel.org>; Tue, 24 Jan 2023 03:05:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1674558338;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=mldeiZ/0LilNfm4f6bf1Ojg1+ZCogrbaufjbQhZdAD4=;
        b=aOithe7Lxpwvv+GDbY7w695l/tpNiP0WIvbikzL1hkIEsNyj4IH3FvBaQ9Nu8I6jlEXYcR
        9QJOC0KovdClP3x0/xttGoVT2dDx2SIIJvg4awWpHrZTFmhm93LmCD2CYuyJtEqQdBqbj9
        TmMwErotLtp/GxToZmgsa7CJu/KueX4=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-80-21jZ-43wNC2jEuO84Yj0sw-1; Tue, 24 Jan 2023 06:05:37 -0500
X-MC-Unique: 21jZ-43wNC2jEuO84Yj0sw-1
Received: by mail-ej1-f71.google.com with SMTP id hr22-20020a1709073f9600b0086ffb73ac1cso9709109ejc.23
        for <linux-media@vger.kernel.org>; Tue, 24 Jan 2023 03:05:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mldeiZ/0LilNfm4f6bf1Ojg1+ZCogrbaufjbQhZdAD4=;
        b=LAaSxMjoXHiZ5CJOrnVJHOLbfoFJXnWSi1p1YVAblhVGB3k96lTXPo5G841pZWmtSo
         6h03jQheB1Fn7R614GdYyXtUsn7fLZy2fjHPl95GMz8yM1LQ4KS9V8s+iF+LI7UVCVPz
         CWYD0lt+bRFvLEx5mjQ/PRKqzlofGvb5hTYaDvSn9qzZPNMSJFK/uO3VhlHqHpDEsFxG
         mPGwI1ffOXWSUzyO0tAcp2NO3sLgSabig93Ige4ZKId782K0aazxJ39yut5S/gKm8kTs
         TeoRQCM4Sl5t0uBwCjuWJ6RW66GV8lgxWhKsYlOsNC6rd+WgorfuQ6FNyJkpwpKpWkRB
         h+uA==
X-Gm-Message-State: AFqh2koLC8rxJ5HuNMd9swgHhCU7E/iuweiCzAoZUtkJjRkf9EVSu74y
        KiXPYs26DnLjRcL4LNWKYfRRqn0AlMwPazf/xSYShzEGG1Tvzs4SE9/7crRf52W0KS/+OMu4Ios
        zVIsa/hetc8lDqkNVNECSGbs=
X-Received: by 2002:a17:907:2587:b0:847:410:ecf0 with SMTP id ad7-20020a170907258700b008470410ecf0mr25630299ejc.20.1674558336003;
        Tue, 24 Jan 2023 03:05:36 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtgPQHtzpYTYnB2IcCOyacyrwh8CF42BvHsvwfWOcRjuNm5j76ixtRWdYTFSeVKsE3vWcrecw==
X-Received: by 2002:a17:907:2587:b0:847:410:ecf0 with SMTP id ad7-20020a170907258700b008470410ecf0mr25630288ejc.20.1674558335805;
        Tue, 24 Jan 2023 03:05:35 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id s15-20020a170906454f00b00872c0bccab2sm741539ejq.35.2023.01.24.03.05.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jan 2023 03:05:35 -0800 (PST)
Message-ID: <19c0b6c3-ef5d-b56c-45fe-b15f98d0d4b2@redhat.com>
Date:   Tue, 24 Jan 2023 12:05:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 00/57] media: atomisp: Big power-management changes + lots
 of fixes
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
 <Y8+6euqoTP0GtlMN@smile.fi.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Y8+6euqoTP0GtlMN@smile.fi.intel.com>
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

Hi Andy,

On 1/24/23 12:01, Andy Shevchenko wrote:
> On Mon, Jan 23, 2023 at 01:51:08PM +0100, Hans de Goede wrote:
>> Hi All,
>>
>> Here is another set of patches resulting from my continued work
>> on cleaning up / improving the atomisp driver.
>>
>> The main changes here are power-management related, divided
>> into 2 sets:
>>
>> 1. Move the pm of the core atomisp device to its own custom PM
>>    domain. We turn the ISP on/off through the P-Unit and when
>>    off the PCI subsystem resume method complains about the PCI
>>    config space not being reachable. Changing to a custom PM
>>    domain fixes the logs getting filled with PCI subsys errors
>>    on every open of a /dev/video# node
>>
>> 2. Except for devices shipped with Android as factory image,
>>    all the DSDTs I have seen have proper ACPI pm code for
>>    the sensors. So we really should be using ACPI pm for this.
>>
>>    This series contains a lot of ov2680 patches, including
>>    reworking the controls (so that control changes can be
>>    delayed to stream on time instead of directly trying to do
>>    i2c writes to the turned off sensor). Basically modernizing
>>    the ov2680 driver a lot (there are still some atomisp-isms left).
>>
>>    And then finally after all the ov2680 cleanups it moves
>>    the ov2680 code over to using runtime-pm + ACPI pm,
>>    dropping all the direct PMIC + clk poking done by the
>>    atomisp_gmin_platform code.
>>
>> Besides that this also contains quite a few other fixes / cleanups
>> for things which I encountered during the way and it contains the
>> start of making the ov2722 driver work. With the changes present
>> in that driver I get a working (but very dark) stream. I expect
>> that once I add a proper exposure control this will start working
> 
> The non-commented patches were reviewed, but I'm not so familiar with the
> details of the functionality of the PM parts there. So I left them for others
> to review.

Thank you very much for reviewing this monster series!

I agree with all your code remarks / requested changes.

I'll make this changes in my personal tree and then prepare
a pull-req for Mauro with the updated patches.

I'll go over the couple of cases where you had questions
about things now.

I'll process the requested code changes (and add your Reviewed-by-s)
when I can make some time to work on this later this week.

Regards,

Hans

