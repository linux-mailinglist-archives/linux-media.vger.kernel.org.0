Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E050264604F
	for <lists+linux-media@lfdr.de>; Wed,  7 Dec 2022 18:35:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229735AbiLGRfQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Dec 2022 12:35:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229658AbiLGRfP (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Dec 2022 12:35:15 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B45AF112D
        for <linux-media@vger.kernel.org>; Wed,  7 Dec 2022 09:34:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1670434460;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=n6/4Q4pwt+cF8sFNjo//xzNzN9rDRivP1g1o0CIxlmQ=;
        b=RXKYRtVkMc/X4opUg259FqxTD1lbr803fq/Y6nJSXuAgmfwIYEaITYOoBQWH1yN35Qc+WR
        KswkTG8rfJG2itx8qs2UfNZM/JJxT7eXMT59PKm3CqrrcT02R1PuWtXnP2/yrk4zxC0It3
        UVVCc2GrHBwD/DMVN/4ka+Osefvl2zA=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-389-3TsPFvacPvO_OK4F_dexGQ-1; Wed, 07 Dec 2022 12:34:19 -0500
X-MC-Unique: 3TsPFvacPvO_OK4F_dexGQ-1
Received: by mail-ed1-f69.google.com with SMTP id b13-20020a056402350d00b00464175c3f1eso10352603edd.11
        for <linux-media@vger.kernel.org>; Wed, 07 Dec 2022 09:34:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n6/4Q4pwt+cF8sFNjo//xzNzN9rDRivP1g1o0CIxlmQ=;
        b=snsulK4fTCFOd6Ni6FsPR8E80ATAaa3wO9SHBOBFDWt6irguV/Zo+qmkf5aI3EjcX6
         DGDYNLdpafCM1C/je0LSyrZ95SZtNYo6DLuTJXTIjwGUB2lDwBiZyBm4IAsE9imO/4N2
         6CojR06PTv2G5a2nIg27VUGtFiO3CbcQWPoH6YqUoLJJuE9N96yN4+A5/Mb+Y/IeJ6RE
         SRmHt+UgKB1q/SIh9WjQJ6JIiOfMqQREabriyApE6Em8KWxoP42x0sFSDhSfrmKEFjN8
         SMAwfu9dJgcQbn5njZijumODksM0BgbWbfi6jYJQBvqDeyNKUgU/YPs4/Omox6Pgg8Iu
         cA2A==
X-Gm-Message-State: ANoB5pmSmNzHImQKwlZwBTiyk27OLM2sVOJjZWuMmD19WNGSFGhOzD3h
        Jrr3ajU63riSzl2c/gPx2qFSHWyLTMlzDQMjX5pGTVMNr22SH0cVHhvjM6r9iqr6BpCrrODnPEw
        HkSgsYrFYmQwgEpAbA9tu9cc=
X-Received: by 2002:a17:907:728c:b0:7c1:10cf:b81c with SMTP id dt12-20020a170907728c00b007c110cfb81cmr5741924ejc.315.1670434458692;
        Wed, 07 Dec 2022 09:34:18 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4wkxW9nHXlND5SKUeGA+gKkRbIEgiBnzvLobc2NJ+C1wQ25sCBlMMYmFfTe91AYQ/4ad0eyA==
X-Received: by 2002:a17:907:728c:b0:7c1:10cf:b81c with SMTP id dt12-20020a170907728c00b007c110cfb81cmr5741908ejc.315.1670434458523;
        Wed, 07 Dec 2022 09:34:18 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id c10-20020a17090618aa00b007ad9c826d75sm8673109ejf.61.2022.12.07.09.34.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Dec 2022 09:34:17 -0800 (PST)
Message-ID: <145bc531-9f3f-4f80-26e1-25bd281ea791@redhat.com>
Date:   Wed, 7 Dec 2022 18:34:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 0/6] ov5693/int3472: Privacy LED handling changes + IPU6
 compatibility
Content-Language: en-US, nl
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Daniel Scally <djrscally@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     platform-driver-x86@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kate Hsuan <hpa@redhat.com>,
        Mark Pearson <markpearson@lenovo.com>,
        linux-media@vger.kernel.org
References: <20221129231149.697154-1-hdegoede@redhat.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20221129231149.697154-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi All,

On 11/30/22 00:11, Hans de Goede wrote:
> Hi All,
> 
> The out of tree IPU6 driver has moved to using the in kernel INT3472
> code for doing power-ctrl rather then doing their own thing (good!).
> 
> Some of the IPU6 devices with a discrete INT3472 ACPI device have a
> privacy-led GPIO. but no clk-enable GPIO. To make this work this series
> moves the privacy LED control from being integrated with the clk-provider
> to modelling the privacy LED as a separate GPIO. This also brings the
> discrete INT3472 ACPI device privacy LED handling inline with the privacy
> LED handling for INT3472 TPS68470 PMIC devices which I posted here:
> 
> https://lore.kernel.org/platform-driver-x86/20221128214408.165726-1-hdegoede@redhat.com/
> 
> This obsoletes my previous "[PATCH 0/3] platform/x86: int3472/discrete:
> Make it work with IPU6" series:
> 
> https://lore.kernel.org/platform-driver-x86/20221124200007.390901-1-hdegoede@redhat.com/
> 
> Mauro since laptops with IPU6 cameras are becoming more and more
> popular I would like to get this merged for 6.2 so that with 6.2
> users will be able to build the out of tree IPU6 driver without
> requiring patching their main kernel. I realize we are a bit
> late in the cycle, but can you please still take the ov5693 patch
> for 6.2 ? It is quite small / straight-forward and since it used
> gpiod_get_optional() it is a no-op without the rest of this series.
> 
> This series has been tested on:
> 
> - Lenovo ThinkPad X1 Yoga gen 7, IPU6, front: ov2740 with privacy LED
> - Dell Latitude 9420, IPU 6 with privacy LED on front
> - Mirosoft Surface Go, IPU3, front: ov5693 with privacy LED,
>                               back: ov8865 with privacy LED

There has once again been push-back against the concept using
plain GPIOs for the privacy LED controls rather then wrapping
this in a LED class device. This time in the related series
adding support for the privacy LED on the back of Surface Go
devices:

https://lore.kernel.org/platform-driver-x86/20221128214408.165726-1-hdegoede@redhat.com/

Given all the comments / requests to use the LED class for this
I'm going to attempt to do that, see the above thread for some
challenges which I already encountered while exploring LED class
usage for this + proposed solution for those (adding a lookup
table mechanism to the LED class code similar to the existing
GPIO lookup table support).

This will result in a partial rewrite of this series, so self
NACK for this version of the series.

Andy this also means that I will not be using your new str_high_low()
helper function. The code which could use this will likely stay
around, but given that I need to do a rewrite and then get ne
reviews, it would IMHO be better to just get your series starting with:

[PATCH v1 1/3] lib/string_helpers: Add missing header files to MAINTAINERS database

upstream independently and then later my code can be moved over
to the helper (or if the helper lands first maybe use it from
day one), either way it seems best to decouple the merging
of these 2 series from each other.

Regards,

Hans












> Hans de Goede (6):
>   media: ov5693: Add support for a privacy-led GPIO
>   platform/x86: int3472/discrete: Refactor GPIO to sensor mapping
>   platform/x86: int3472/discrete: Treat privacy LED as regular GPIO
>   platform/x86: int3472/discrete: Move GPIO request to
>     skl_int3472_register_clock()
>   platform/x86: int3472/discrete: Ensure the clk/power enable pins are
>     in output mode
>   platform/x86: int3472/discrete: Get the polarity from the _DSM entry
> 
>  drivers/media/i2c/ov5693.c                    | 10 ++
>  .../x86/intel/int3472/clk_and_regulator.c     | 35 +++++--
>  drivers/platform/x86/intel/int3472/common.h   |  4 +-
>  drivers/platform/x86/intel/int3472/discrete.c | 95 ++++++++-----------
>  4 files changed, 80 insertions(+), 64 deletions(-)
> 

