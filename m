Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2AC56692118
	for <lists+linux-media@lfdr.de>; Fri, 10 Feb 2023 15:44:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231904AbjBJOoy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 Feb 2023 09:44:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232435AbjBJOon (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 Feb 2023 09:44:43 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B226D71027
        for <linux-media@vger.kernel.org>; Fri, 10 Feb 2023 06:43:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1676040235;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Fg7isv25GsAJhW7P8I98ofFRurVeZvcIJwmS+sUa6uQ=;
        b=CKDsvcm+LTwBmDAC9eZDbf69/7fTBaUMUsdj0nrYdtPrgvdykUSbynz4Xf+xpKSWL3FOdR
        tDpbZMli/aEzWmhuIif3QqQfSUk9oThUHLx0hoaYAUk3F4RiZSqycCaQcXM9ajMc/4Q301
        U2jl5NdCOfCchqgj/qxrY/3WC7AdnWI=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-629-AvqgbjVqMaywMRkeO6rnRw-1; Fri, 10 Feb 2023 09:43:54 -0500
X-MC-Unique: AvqgbjVqMaywMRkeO6rnRw-1
Received: by mail-ed1-f69.google.com with SMTP id o21-20020aa7dd55000000b004a245f58006so3727462edw.12
        for <linux-media@vger.kernel.org>; Fri, 10 Feb 2023 06:43:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Fg7isv25GsAJhW7P8I98ofFRurVeZvcIJwmS+sUa6uQ=;
        b=F3AB5jR99nyhNO86rTaI0c4WzRekTw77m2pgtNGWg9zaDnMMGuGKED3XUTWK3tFzzi
         4xVb1qfJr363x1rwD4BnfieJ5vmDW2kmXpskWMtcl7xrYepO0orOlHcKrGMP2aJm7ryG
         GlY65Cd4vaYCwcT9RZDd39k/y50ldrOo6qMpG2237Fns44Qgr7t6/LCImvoCr1MWlRVT
         c+EOIXQ+XP7Td8tT8/TxmRc6TAGatkpzuBJPe2EYgeGzLF9+x7FSVQJnq7r4GsAEzxh4
         GP7prsAbvNf7EKL6gD7lLesTwWzk4J1TOBOTvHXBEdDdG/yivXxw2xRtj1k1DL24P3Mf
         MH6w==
X-Gm-Message-State: AO0yUKVxMzEm2sAS6yYKO2X2ajX6iSmmnSJWUaXoWNnhzGcR8t1JSkjt
        xe/X8dM31fe0FMPO0ylh/UFFz/s0w7+V3W3boRB/z8luvc8231RVsGN4msIPfiP/xwA1iNVL3oU
        x5+hod/EQqliwBz64i+xDp6Q=
X-Received: by 2002:a17:907:3f91:b0:8ae:bb1d:45e4 with SMTP id hr17-20020a1709073f9100b008aebb1d45e4mr10554280ejc.26.1676040233242;
        Fri, 10 Feb 2023 06:43:53 -0800 (PST)
X-Google-Smtp-Source: AK7set8lKNPlEXwDw4UvbUeFXHmZ3VhLvmfcP20Mv0bTY+FYar2+bmnddVZKMDwJLQVszoWOSrnaNw==
X-Received: by 2002:a17:907:3f91:b0:8ae:bb1d:45e4 with SMTP id hr17-20020a1709073f9100b008aebb1d45e4mr10554263ejc.26.1676040233033;
        Fri, 10 Feb 2023 06:43:53 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id c20-20020a50f614000000b004ac089bb600sm434218edn.0.2023.02.10.06.43.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Feb 2023 06:43:52 -0800 (PST)
Message-ID: <8e4813ea-06a4-4e8a-4401-9d05af767377@redhat.com>
Date:   Fri, 10 Feb 2023 15:43:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 28/57] media: Add ovxxxx_16bit_addr_reg_helpers.h
Content-Language: en-US, nl
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Andy Shevchenko <andy@kernel.org>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
References: <20230123125205.622152-1-hdegoede@redhat.com>
 <20230123125205.622152-29-hdegoede@redhat.com>
 <Y+Nw32EZUZtq3esL@pendragon.ideasonboard.com>
 <026272d3-88d7-a67f-4942-5cba6c3eab86@redhat.com>
 <Y+UbIAVQZ5U0/U5U@pendragon.ideasonboard.com>
 <4e501e71-a226-a022-83e2-f53686ca07a7@redhat.com>
 <Y+YuRuHbs8kDZPNP@pendragon.ideasonboard.com>
 <3be27a04-21e5-5929-88a1-0159f554a36f@redhat.com>
 <Y+Yz3qPY3aiJ+bYZ@pendragon.ideasonboard.com>
 <30181cf6-7dc8-d75c-5d7a-93f483d4f045@redhat.com>
 <Y+ZEMTJZcbPAj+yk@kekkonen.localdomain>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Y+ZEMTJZcbPAj+yk@kekkonen.localdomain>
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

On 2/10/23 14:18, Sakari Ailus wrote:
> Hi Hans,
> 
> On Fri, Feb 10, 2023 at 01:47:49PM +0100, Hans de Goede wrote:
>>> And if someone dislikes having to pass NULL for the last argument, we
>>> could use some macro magic to accept both the 3 arguments and 4
>>> arguments variants.
>>>
>>> int __cci_write3(struct cci *cci, u32 reg, u32 val);
>>> int __cci_write4(struct cci *cci, u32 reg, u32 val, int *err);
>>>
>>> #define __cci_write(_1, _2, _3, _4, NAME, ...) NAME
>>> #define cci_write(...) __cci_write(__VA_ARGS__, __cci_write4, __cci_write3)(__VA_ARGS__)
>>
>> TBH this just feels like code obfuscation to me and it is also going
>> to write havoc with various smarted code-editors / IDEs which give
>> proptype info to the user while typing the function name.
>>
>> Having the extra ", NULL" there in calls which don't use / need
>> the *err thingie really is not a big deal IMHO.
> 
> It's still an eyesore if the driver doesn't use that pattern of register
> access error handling. I also prioritise source code itself rather than try
> to make it fit for a particular editor (which is neither Emacs nor Vim I
> suppose?).

vim and emacs also both have support for showing function prototypes,
but this is not only about breaking tooling like that.

My main objection is not that it confuses various tooling, it also confuses
me as a human if I'm trying to figure out what is going on. The kernel's
internal API documentation generally isn't great so I'm used to just look
at a functions implementation as an alternative. These sort of dark-magic
pre-compiler macros make it very hard for me *as a human* to figure out
what is going on.

So to me personally this level of code-obfuscation just to avoid 6 chars
", NULL" per function calls is very much not worth the making things
harder to understand level it adds.

I mean this will even allow mixing the 3 and 4 parameter variants
in a single .c file! That is just very very confusing and anti KISS.

Who knows maybe iso-c2023 or whatever will give us default function
arguments values? That would be a nice way to do this, the above
not so much IMHO.

So I won't be adding this per-processor (dark) magic to my patch-set
for this.

If people really want this they can add this in a follow-up patch-set.

Regards,

Hans

