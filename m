Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 08A697265BF
	for <lists+linux-media@lfdr.de>; Wed,  7 Jun 2023 18:21:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231599AbjFGQVE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Jun 2023 12:21:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231234AbjFGQVC (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Jun 2023 12:21:02 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4981E47
        for <linux-media@vger.kernel.org>; Wed,  7 Jun 2023 09:20:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686154811;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=leDQvk6GCJ6UGvGZQwyCLpOzEB2aiUaJDSnRSybzK+4=;
        b=V2eoJGV/G0V+L10MU3f1UzXJygRtmZIbURc+1kOQo2KDjD1G7RmE94Ovx+ifeSfDe78TBv
        gaAqyl5v2LTK9incyRAR4JSxaJd1v/qO4JF5CIlKLy9Sehd2llhastCCwV/EEvPSx1F4M6
        CFqjo79y2LmoCxqG7rD9zn5gAXAfPWM=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-656-ED28zPAhOuq7dRnghBPEGw-1; Wed, 07 Jun 2023 12:20:10 -0400
X-MC-Unique: ED28zPAhOuq7dRnghBPEGw-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-977d4b0d9e3so325201266b.0
        for <linux-media@vger.kernel.org>; Wed, 07 Jun 2023 09:20:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686154809; x=1688746809;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=leDQvk6GCJ6UGvGZQwyCLpOzEB2aiUaJDSnRSybzK+4=;
        b=OgNdwnH3VEf/RsmrUy9mGutWCV5nXOshjIGQUWvxzAevzqSK79vWEqN3yHkBV1V3iI
         Aao4cAAMmzaDSTBuBFXk/eckJTWeugERlTtQbDg4Nw/3k+um5pX8qpLo9CsUt2WNAL7G
         eKssatyVB64PGO7CBY99E17gg7U7NXsdviuYw5chgITe+ph20R68pPTVZCeBDIHBYeJf
         dDPDKNKWCwZG8dcqfJdzOfe2Ej8Ma2Is1LYQ+jA2Vyh7KG3wQw3iEqVcbtvNMpDIDpwV
         nIkUP71tMBvY+tBcThWFe4QfxbRy3VFXR6ffYjmczXCA7jdpc890H0F2m84Y88zLtvLy
         ktBw==
X-Gm-Message-State: AC+VfDzUdwJWVvwuIvEsAUyj5EnxUr/KPhI3KGgH+oQZ4Cg3k0kKrMEF
        Z8ZloVyeWqcQprds3lNtMrszT1AOiAgM9SvOE3pPKmP+6aaURiDlQRtHEHeNIKvnyMWGycDaESW
        WKqLGB7DVOcumdUmzqurS3Uk=
X-Received: by 2002:a17:907:6d98:b0:973:d43f:5fdf with SMTP id sb24-20020a1709076d9800b00973d43f5fdfmr7000645ejc.61.1686154809541;
        Wed, 07 Jun 2023 09:20:09 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4PJirVo0hAQ4QkUsd43RNAVcTHxOGLEbbWa7IXM213AopFesTseVDAEDju8pK1cBcMnPSeag==
X-Received: by 2002:a17:907:6d98:b0:973:d43f:5fdf with SMTP id sb24-20020a1709076d9800b00973d43f5fdfmr7000625ejc.61.1686154809312;
        Wed, 07 Jun 2023 09:20:09 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id t16-20020a170906065000b009682b2b3d66sm7046688ejb.197.2023.06.07.09.20.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jun 2023 09:20:08 -0700 (PDT)
Message-ID: <1847f77d-0a14-8204-bdeb-cf30699f0acb@redhat.com>
Date:   Wed, 7 Jun 2023 18:20:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 1/3] media: Add MIPI CCI register access helper functions
Content-Language: en-US, nl
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, linux-media@vger.kernel.org
References: <20230606165808.70751-1-hdegoede@redhat.com>
 <20230606165808.70751-2-hdegoede@redhat.com>
 <CAHp75Vd6TPfZhPEDUdAj0Y7G8fQDPKQhmcY_tDWmN7VHBpXL0w@mail.gmail.com>
 <0760b8ba-0091-5270-5e46-9787a910bd6f@redhat.com>
 <ZIBxhg1LVL8+zBCE@kekkonen.localdomain>
 <CAHp75VeZe-aeusoeYgDh=6kGfxNUDexLvvwMdLTKe-k1_vtAwA@mail.gmail.com>
 <2f367370-1dcd-5246-4016-dfb06019eda6@redhat.com>
 <CAHp75VekdeW1P0-CvcdTCYryvq0DGkJ6JzCVtatVAgFDu5gJxA@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75VekdeW1P0-CvcdTCYryvq0DGkJ6JzCVtatVAgFDu5gJxA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 6/7/23 18:14, Andy Shevchenko wrote:
> On Wed, Jun 7, 2023 at 6:58 PM Hans de Goede <hdegoede@redhat.com> wrote:
>> On 6/7/23 17:40, Andy Shevchenko wrote:
>>> On Wed, Jun 7, 2023 at 3:01 PM Sakari Ailus
>>> <sakari.ailus@linux.intel.com> wrote:
>>>> On Wed, Jun 07, 2023 at 10:40:34AM +0200, Hans de Goede wrote:
>>>>> On 6/6/23 22:43, Andy Shevchenko wrote:
> 
> ...
> 
>>>>>               *val = __get_unaligned_be24(buf);
>>>
>>> __without double underscore prefix
>>
>> include/asm-generic/unaligned.h
>>
>> defines __get_unaligned_be24() and not get_unaligned_be24(), I guess because 24bit is not a standard register width.
> 
> Strange. Do you have some custom patches in the area?
> 
> https://elixir.bootlin.com/linux/v6.4-rc5/source/include/asm-generic/unaligned.h#L112
> https://elixir.bootlin.com/linux/v6.4-rc5/source/include/asm-generic/unaligned.h#L90

No I do not have any custom patches in that area; and the wrapper you
point to is right there...

I somehow missed it, sorry.

So I will drop the __ as requested when adding the switch-case implementation for v2.

Regards,

Hans

