Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8CB256316D6
	for <lists+linux-media@lfdr.de>; Sun, 20 Nov 2022 23:25:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229677AbiKTWZb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 20 Nov 2022 17:25:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229449AbiKTWZa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 20 Nov 2022 17:25:30 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 772CEF028
        for <linux-media@vger.kernel.org>; Sun, 20 Nov 2022 14:24:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1668983068;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=bsuiREUBAtxZhsYAijrEDfxF5vu/EWlEJis9HV/mqf4=;
        b=IGW5fni6cKpqfj7uJFiXS7/qz7iWBaqEN+PaYhQQNsusYEtzbIlbrDOMnX3KetLrtSk56P
        x/DHhKwXB6KJx+VPrE84hatAbYtXxC/bMtQB5D4YHaW5VqHfpefQbywma4Vl6AKUTV2Pep
        JcgeauorNOqBRz+geNvLPvrmdIyLw2w=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-650-UMZE-xXzPkqT9a3q4KXnDA-1; Sun, 20 Nov 2022 17:24:17 -0500
X-MC-Unique: UMZE-xXzPkqT9a3q4KXnDA-1
Received: by mail-ed1-f71.google.com with SMTP id m13-20020a056402510d00b0046913fa9291so3432818edd.6
        for <linux-media@vger.kernel.org>; Sun, 20 Nov 2022 14:24:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bsuiREUBAtxZhsYAijrEDfxF5vu/EWlEJis9HV/mqf4=;
        b=Zof1BuBiQxwy6tgexdhuy1C8ISxLQAp5+vOdiHXF+Fqxkkl4bJrcwsV+J296yLU/MA
         mDJ6XTNSkZT79U0YUOWlwsBedgdT/XwxyOoKiTvbTqLHCcxEPO/Qa4KeuYhzU14wyhP2
         nFb74ul+5pkR73+vigb869kupnIWdnxpcRVKhpGRr1ZrdivoUqJsXZWUf1YJT3ZQgdah
         mXL2S0gc5Zi4vySUibLDs6Z5FXIaDc+PCoxgYhT/zucHJel4re7sZQI6EN0D49virOt0
         ZeueRmiWDlyQAIf1pQhgQn4Hq3MI8Bkl6Mcm7uIQwmz+cfaa/q9WNAWJrMNhnNyVpEGx
         hnvg==
X-Gm-Message-State: ANoB5pkQsIulzZJc581tFBBSvrJs+4g85SwVw976/V6FIV9828qhzuug
        XvdTyirjjd/hY57G8An6Ql2m0JwYPfCACop7j2dNtqlafEtkAgfgbfWPe/XrGEuwPejbJL2hylj
        4/N8RwjjsO/Hu7EIGnN634EQ=
X-Received: by 2002:a05:6402:3644:b0:45f:c7f2:297d with SMTP id em4-20020a056402364400b0045fc7f2297dmr14043261edb.266.1668983056088;
        Sun, 20 Nov 2022 14:24:16 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6gGU+K9fqnOHZgwjB7Fkmw6we7sYQdwFIh5U7HS34ZoDGuDcYvgQyK9vVwWpOPUO3wt0af7A==
X-Received: by 2002:a05:6402:3644:b0:45f:c7f2:297d with SMTP id em4-20020a056402364400b0045fc7f2297dmr14043247edb.266.1668983055947;
        Sun, 20 Nov 2022 14:24:15 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id jg20-20020a170907971400b007a9c3831409sm4369113ejc.137.2022.11.20.14.24.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Nov 2022 14:24:15 -0800 (PST)
Message-ID: <754a31cf-491c-0bfb-1041-9aae93e3e3eb@redhat.com>
Date:   Sun, 20 Nov 2022 23:24:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2 17/17] media: atomisp: gc0310: Power on sensor from
 set_fmt() callback
Content-Language: en-US, nl
To:     Andy Shevchenko <andy@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
References: <20221020195533.114049-1-hdegoede@redhat.com>
 <20221020195533.114049-18-hdegoede@redhat.com>
 <Y3Iyh4Fqd81sFxlS@smile.fi.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Y3Iyh4Fqd81sFxlS@smile.fi.intel.com>
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

On 11/14/22 13:20, Andy Shevchenko wrote:
> On Thu, Oct 20, 2022 at 09:55:33PM +0200, Hans de Goede wrote:
>> Depending on which order userspace makes various v4l2 calls, the sensor
>> might still be powered down when set_fmt is called.
>>
>> What should really happen here is delay the writing of the mode-related
>> registers till streaming is started, but for now use the same quick fix
>> as the atomisp_ov2680 code and call power_up() from set_fmt() in
>> combination with keeping track of the power-state to avoid doing the
>> power-up sequence twice.
> 
> ...
> 
>> +	/* s_power has not been called yet for std v4l2 clients (camorama) */
>> +	power_up(sd);
> 
> if camorama is fixed, will this become a problem?

This is not a camorama issue but an issue with the atomisp2 + sensor driver
combination. camorama uses a slightly different order in which various
v4l2 ioctls are done so it needs the power_up() here. Note that power_up()
checks + sets a flag so that if it gets called multiple times it only does
the actual power-up once.

Regards,

Hans


