Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9F6B767968D
	for <lists+linux-media@lfdr.de>; Tue, 24 Jan 2023 12:25:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233302AbjAXLZ5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Jan 2023 06:25:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233565AbjAXLZ4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Jan 2023 06:25:56 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 304728694
        for <linux-media@vger.kernel.org>; Tue, 24 Jan 2023 03:25:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1674559508;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=v1PHsqg4+jSCeazkAX0hBPJun41mBhpJj7P6tW7D+3E=;
        b=LN5itjXEFKvTBUr9YOOOb8Wvw4vO/mZtoay6sVff3sud1AnNe+bujqtdwEdWA7CnpUiHiO
        32aTX58JAgrp6p2iSDpFf5Z5rAs4ysO2kJ0Fqg9dn0zeN6Mzfl18aHHaq6hiff/2BBimgN
        idzpu5hIrOPSgKi1O2wHyX2hlSAk98w=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-621-Yuw54DW3PNeIHnFWqBZnUw-1; Tue, 24 Jan 2023 06:25:07 -0500
X-MC-Unique: Yuw54DW3PNeIHnFWqBZnUw-1
Received: by mail-ed1-f69.google.com with SMTP id z20-20020a05640240d400b0049e1b5f6175so10411525edb.8
        for <linux-media@vger.kernel.org>; Tue, 24 Jan 2023 03:25:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v1PHsqg4+jSCeazkAX0hBPJun41mBhpJj7P6tW7D+3E=;
        b=2zOSVi/BZPRX0xKsq8bIHQYEsmwuuD4t2y/VRsgp2uH+y59zafJsU8y1YStUUNojDM
         3Vqe0bhL+jkQ1vxfJ7no3240a0CD6yYrAEs+ZMuXc8NHrHVxIwxBIv3myto7tuuwxNve
         wbwduH8wlBn2SFSnTIvACkFBDM/gim2jjvATGvQF5ct9m2+e43fUGKcYOPe1VF2yLH6l
         zf52IEHPdaM93hdOWwxZOsGv9GAVFWEQRdCIGvAJlXt49YwiWSDuerS/f2eg5LXX5oe8
         0M4dJ+f9ZoGeQ+Sd6jLhQramQPasJAvRbZoNTeEp+GtG3VNYcYlCS/L4yD3QqUMhDwn3
         VQEQ==
X-Gm-Message-State: AFqh2kohleysZRQYnSPkbguDMSlNjpd7Vmr+VQ2L/JLRLbY+xNd0gjxu
        5poNSKKOK7ZvSv9/f1MtoGCDOWYsCu7EaqE4t10/VD0GKA+4eNrTFwoJPAFkN+s1YIST5D13rf/
        Q3maWvJqEbBejLvNlnnaPjhA=
X-Received: by 2002:a05:6402:28c7:b0:47e:f535:e9a0 with SMTP id ef7-20020a05640228c700b0047ef535e9a0mr31843231edb.24.1674559505962;
        Tue, 24 Jan 2023 03:25:05 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsEFtNuB3c2wqgZpNfJzICpWBfxb1idZ0g6D8jIT2Hw2sPJ9WTJtO+hBa5lpWDccCMJKC9yAQ==
X-Received: by 2002:a05:6402:28c7:b0:47e:f535:e9a0 with SMTP id ef7-20020a05640228c700b0047ef535e9a0mr31843216edb.24.1674559505773;
        Tue, 24 Jan 2023 03:25:05 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id g16-20020aa7c850000000b00494dcc5047asm917861edt.22.2023.01.24.03.25.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jan 2023 03:25:05 -0800 (PST)
Message-ID: <1645ddd5-0f08-fe1f-dfaa-45f3978a7416@redhat.com>
Date:   Tue, 24 Jan 2023 12:25:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 28/57] media: Add ovxxxx_16bit_addr_reg_helpers.h
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
 <20230123125205.622152-29-hdegoede@redhat.com>
 <Y87QvdlvLLLDhve/@smile.fi.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Y87QvdlvLLLDhve/@smile.fi.intel.com>
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

On 1/23/23 19:23, Andy Shevchenko wrote:
> On Mon, Jan 23, 2023 at 01:51:36PM +0100, Hans de Goede wrote:
>> The following drivers under drivers/media/i2c: ov08x40.c, ov13858.c,
>> ov13b10.c, ov2680.c, ov2685.c, ov2740.c, ov4689.c, ov5670.c,
>> ov5675.c, ov5695.c, ov8856.c, ov9282.c and ov9734.c,
>>
>> as well as various "atomisp" sensor drivers in drivers/staging, *all*
>> use register access helpers with the following function prototypes:
>>
>> int ovxxxx_read_reg(struct ovxxxx_dev *sensor, u16 reg,
>>                     unsigned int len, u32 *val);
>>
>> int ovxxxx_write_reg(struct ovxxxx_dev *sensor, u16 reg,
>>                      unsigned int len, u32 val);
>>
>> To read/write registers on Omnivision OVxxxx image sensors wich expect
>> a 16 bit register address in big-endian format and which have 1-3 byte
>> wide registers, in big-endian format (for the higher width registers).
>>
>> Add a new ovxxxx_16bit_addr_reg_helpers.h header file with static inline
>> versions of these register access helpers, so that this code duplication
>> can be removed.
> 
> 
> A couple more comments.
> 
> ...
> 
>> +#define ovxxxx_write_reg8(s, r, v)	ovxxxx_write_reg(s, r, 1, v)
>> +#define ovxxxx_write_reg16(s, r, v)	ovxxxx_write_reg(s, r, 2, v)
>> +#define ovxxxx_write_reg24(s, r, v)	ovxxxx_write_reg(s, r, 3, v)
> 
> Btw, we probably can use _Generic() for these...
> 
> ...
> 
>> +static inline int ovxxxx_mod_reg(struct i2c_client *client, u16 reg, u8 mask, u8 val)
> 
> Can we actually s/mod/update/ as it's more regular when we talk about IO
> accessor APIs?

Ack, I'll replace the mod with update.

Regards,

Hans


