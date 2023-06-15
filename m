Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3399D7312DA
	for <lists+linux-media@lfdr.de>; Thu, 15 Jun 2023 10:57:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239296AbjFOI5s (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Jun 2023 04:57:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230102AbjFOI5q (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Jun 2023 04:57:46 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC360171F
        for <linux-media@vger.kernel.org>; Thu, 15 Jun 2023 01:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686819421;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=f7pRvgmAloaq6blk58+Ew20Qigso81a1YYYW7uhVr3w=;
        b=OPgxekwWJnMxdRhXK6Vpe7pf+vO0yqe7I1XZ35qy+nMoFh4KKuw4YUEzlElzP+S999ShsS
        nG5DOwLuDAUOkjXkZibjSFxuZUcv0RhO2TRq0wBhKArpOrlJIFf5K9kqOaLqAom3Y4H/wP
        ZvKfs4k07t2eGLMvfpEVSIQ7ZMr+T8g=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-88-HlgJWjTVN8Sw3GCoWme0tg-1; Thu, 15 Jun 2023 04:57:00 -0400
X-MC-Unique: HlgJWjTVN8Sw3GCoWme0tg-1
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-516af4b585aso828485a12.1
        for <linux-media@vger.kernel.org>; Thu, 15 Jun 2023 01:56:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686819419; x=1689411419;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f7pRvgmAloaq6blk58+Ew20Qigso81a1YYYW7uhVr3w=;
        b=NoyiqTYTy8Wx3oeSPvLqPkRv2M7jpw8rzh80rR8RYh6NcBtZQEBsAq5eZUhAE7hGBh
         Sa2ThvtNkOPJlk//A4INk8feMt6DFh8g1+yO3/R5KoJ0DUnaYNTVZdiW5EU3+zXwvxZF
         qYW0aCuZw44BXHyKbY5vZbbQJo896HnegLOTrxUQjoIbnwfveE4dQ2f+rmpHErkfkwlH
         yi+oxWSyL1CyZWQyFbEVGavFh2SrQF4xGoN8Sja9pi7ci0uLeV9awyBV6l7Izo1MOvMH
         84nA1onXGiorrP5RM9j2pYKxcYmq6QIMsmfzP33d2SZILAXy617SuF6frPi+63xi0emr
         iafg==
X-Gm-Message-State: AC+VfDzOHEi/MjQ0yCPuUEphyV8dSYDsdRuvAMLAXQcmtxaC+cd5Y2HQ
        ok/O8QsDFW0rj9uAu44C0EN/xspH0aPyxPQVlhl0t0J3hlwAsYakg7Mw5sQbRCxLqsebKHFMmWV
        /6t0Xy+nf8EtAewmCNMNV3yM=
X-Received: by 2002:a50:ed83:0:b0:514:9e47:4319 with SMTP id h3-20020a50ed83000000b005149e474319mr4284115edr.5.1686819418812;
        Thu, 15 Jun 2023 01:56:58 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5X2ADJivEUCIYABRDTAXxaF0UHaD3+cenpmhNdNhLr/QG2JO+jr2Enejrt8OvHne610jrEVw==
X-Received: by 2002:a50:ed83:0:b0:514:9e47:4319 with SMTP id h3-20020a50ed83000000b005149e474319mr4284105edr.5.1686819418536;
        Thu, 15 Jun 2023 01:56:58 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id w25-20020a056402129900b0051659c6d50csm8614200edv.22.2023.06.15.01.56.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jun 2023 01:56:56 -0700 (PDT)
Message-ID: <d6e1a86a-b278-5c26-5be8-ade2ca70cf51@redhat.com>
Date:   Thu, 15 Jun 2023 10:56:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 1/5] media: Add MIPI CCI register access helper
 functions
Content-Language: en-US, nl
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        linux-media@vger.kernel.org
References: <20230614192343.57280-1-hdegoede@redhat.com>
 <20230614192343.57280-2-hdegoede@redhat.com>
 <ZIolnOxs29H8EUmC@kekkonen.localdomain>
 <20230614213429.GA28757@pendragon.ideasonboard.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230614213429.GA28757@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 6/14/23 23:34, Laurent Pinchart wrote:
> Hello,
> 
> On Wed, Jun 14, 2023 at 08:39:56PM +0000, Sakari Ailus wrote:
>> On Wed, Jun 14, 2023 at 09:23:39PM +0200, Hans de Goede wrote:
>>> The CSI2 specification specifies a standard method to access camera sensor
>>> registers called "Camera Control Interface (CCI)".
>>>
>>> This uses either 8 or 16 bit (big-endian wire order) register addresses
>>> and supports 8, 16, 24 or 32 bit (big-endian wire order) register widths.
>>>
>>> Currently a lot of Linux camera sensor drivers all have their own custom
>>> helpers for this, often copy and pasted from other drivers.
>>>
>>> Add a set of generic helpers for this so that all sensor drivers can
>>> switch to a single common implementation.
>>>
>>> These helpers take an extra optional "int *err" function parameter,
>>> this can be used to chain a bunch of register accesses together with
>>> only a single error check at the end, rather then needing to error
>>> check each individual register access. The first failing call will
>>> set the contents of err to a non 0 value and all other calls will
>>> then become no-ops.
>>>
>>> Link: https://lore.kernel.org/linux-media/59aefa7f-7bf9-6736-6040-39551329cd0a@redhat.com/
>>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>>> ---
>>> Changes in v2:
>>> - Drop cci_reg_type enum
>>> - Make having an encoded reg-width mandatory rather then using 0 to encode
>>>   8 bit width making reg-addresses without an encoded width default to
>>>   a width of 8
>>> - Add support for 64 bit wide registers
> 
> I'm in two minds about this. This means that the read and write
> functions take a u64 argument, which will be less efficient on 32-bit
> platforms. I think it would be possible, with some macro magic, to
> accept different argument sizes, but maybe that's a micro-optimization
> that would actually result in worse code. 
> 
> 64-bit support could be useful, but as far as I can tell, it's not used
> in this series, so maybe we could leave this for later ?

Besides Sakari mentioning a sensor driver being in the works
which needs this. Adding 64 bit support later is troublesome
because it will change the prototype of cci_read, specically
the return by reference val will change from u32 *val to
u64 *val, requiring changing all the callers.

So if anything now is the time to change this.

As for this being slower on 32 bit archs. We are talking about
code here which is ultimately transferring data over 400 KHz
i2c. The i2c is always going to be the bottleneck and if we
want / need to optimize this we really need to focus on
reducing unnecessary i2c transfers first.

>>> - Introduce a new cci_reg_sequence struct with 64 bit reg values for 64 bit
>>>   support and without the delay_us field
> 
> This consumes extra memory too. Is it an issue ?

Compared to v1 this does not consume extra memory since
this drops the delay_us field.

It does consume extra memory to still adding a new
cci_reg_sequence struct with 2 32 bit members. But
given that any hw using sensor drivers is going to
need to have multiple buffers to store the sensor
data with each buffer consuming megabytes of RAM
I'm not really worried about growing the size of
a couple of fixed register init lists by a bit.

As for your other minor review comments I agree and I'll
fix them all for the next version.

Regards,

Hans


