Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4451C59BADA
	for <lists+linux-media@lfdr.de>; Mon, 22 Aug 2022 10:06:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233490AbiHVIET (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Aug 2022 04:04:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233393AbiHVIEE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Aug 2022 04:04:04 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 452092CDEA
        for <linux-media@vger.kernel.org>; Mon, 22 Aug 2022 01:03:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1661155379;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=OcGMrHwXxery3fNfqLaGaKLxZkus6uNZDMgbem/2nFM=;
        b=dA3XccPXmfYle+H/uVi4TRYVbWTZgR75Og9Uc9D7IJcaLPbxrA4sL1hsi7SnapNfQ/tXic
        NZFqCPmRh2gt4AVkeg89uAYAxrw/Y6aQdtQE0/a0wyVzkTWHwSgom4pXtu1QEMgHDqOxWG
        HnWvXQeBZWzbdyYxhjECLJ1LwnEKCFU=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-661-R3vWdyELPCiVO3d--YEVig-1; Mon, 22 Aug 2022 04:02:58 -0400
X-MC-Unique: R3vWdyELPCiVO3d--YEVig-1
Received: by mail-ed1-f71.google.com with SMTP id z20-20020a05640235d400b0043e1e74a495so6578196edc.11
        for <linux-media@vger.kernel.org>; Mon, 22 Aug 2022 01:02:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=OcGMrHwXxery3fNfqLaGaKLxZkus6uNZDMgbem/2nFM=;
        b=htU4p79ZYGhleWIOdtl3RxvFZ9K2bzUMj7ABKbY6Vhb85zWgAgQrQNPI1ZQmLqNBkX
         kvxdKlR/EduZbnF68+4GvLzoyrpjKlh0BrFrv4npQSNhfZ7b4McOQL33S5Xwjjre4lnR
         S5K9JciEamiYeypsuXdgANTjC9xYvZRYP4ftJ9s8LNmkblwne8uH4gpL8oLB/+fSv5CH
         WMZFwUfo5gP9MDlc46kGI/7GG9nAEk84qi2F0AQ5H6vK+dxBF89hxPRYjRodSzXDmmC2
         C1zojic+MRUdlj/mcaNlP03ggEvxNokbNnWFosQwF9qtHQllYdyuMAn1sksntrFBopCX
         WDBw==
X-Gm-Message-State: ACgBeo25fasnspudFBafQ+u4SNj7bl8vM/mirFMNy2CFzpOuComYRIV3
        n9oQNQ/1gL1QOWMqPc4SmgrqIHDR5/lyNWTW21UNo+KApD07NUfjRPCK0TZuxMbdOU0vyFQTOin
        9tvyEsSY368eZyI39cySe3p0=
X-Received: by 2002:a05:6402:3681:b0:446:ba68:573f with SMTP id ej1-20020a056402368100b00446ba68573fmr3719941edb.137.1661155377267;
        Mon, 22 Aug 2022 01:02:57 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6Gfim5h1SgIV/zy7BtMc/ezzHDZEzqwL1iP/GBBwg4aVt3oJszr8kbB08Z744PGCKfrL9F3A==
X-Received: by 2002:a05:6402:3681:b0:446:ba68:573f with SMTP id ej1-20020a056402368100b00446ba68573fmr3719931edb.137.1661155377126;
        Mon, 22 Aug 2022 01:02:57 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id o26-20020a170906289a00b0071cbc7487e1sm5784243ejd.69.2022.08.22.01.02.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Aug 2022 01:02:56 -0700 (PDT)
Message-ID: <3834201e-95a3-02e7-c549-e5630fb64892@redhat.com>
Date:   Mon, 22 Aug 2022 10:02:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 01/13] media: atomisp_gmin_platform: Switch to use
 acpi_evaluate_dsm_typed()
Content-Language: en-US
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Andy Shevchenko <andy@kernel.org>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        "andrey.i.trufanov" <andrey.i.trufanov@gmail.com>,
        Fabio Aiuto <fabioaiuto83@gmail.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-staging@lists.linux.dev,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20220821215027.461344-1-hdegoede@redhat.com>
 <CAHp75VfV-goir434sZfwLhoCZbu48uZ0pcwdjfG7WzX_-eVuPw@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75VfV-goir434sZfwLhoCZbu48uZ0pcwdjfG7WzX_-eVuPw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 8/22/22 00:31, Andy Shevchenko wrote:
> On Mon, Aug 22, 2022 at 12:50 AM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>>
>> The acpi_evaluate_dsm_typed() provides a way to check the type of the
>> object evaluated by _DSM call. Use it instead of open coded variant.
>>
>> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>> Link: https://lore.kernel.org/r/20220730155905.90091-1-andriy.shevchenko@linux.intel.com
>> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
>> Tested-by: Hans de Goede <hdegoede@redhat.com>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> 
> Thanks!
> I believe the v2 of this patch (when it was sent standalone) has been
> Acked by Sakari. But I might be wrong.

You are right:
https://lore.kernel.org/linux-media/Yud2hzq3JQBzf+oK@paasikivi.fi.intel.com/

So let me add that here, then patchwork should pick it up:

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Regards,

Hans

