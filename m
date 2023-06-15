Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B5F82731364
	for <lists+linux-media@lfdr.de>; Thu, 15 Jun 2023 11:17:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241297AbjFOJRl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Jun 2023 05:17:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229907AbjFOJRe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Jun 2023 05:17:34 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE7A219B5
        for <linux-media@vger.kernel.org>; Thu, 15 Jun 2023 02:16:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686820612;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=fszieq+i4P0P95WhMAl0SF2cRNprRZwDxpfmWR3xLes=;
        b=FFDt8sxjbIkIB7N6ivwINBmYtiYa+4OiG8fhT72a2n7hk3Gy917Wu5+JjYkoAAQvKPpnRZ
        4RcDEeR6nTG+ETS+JuGhiZvLSeOx/z3ypZAItRWQobbEVJlHmY7jKxOwiEdtUKbJnQCa57
        N/mKWJmTKZdm0pg6TSo66rONx9Z5Ul4=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-537-RcOKGlPuOPihF8E13hG3gQ-1; Thu, 15 Jun 2023 05:16:50 -0400
X-MC-Unique: RcOKGlPuOPihF8E13hG3gQ-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-9715654aba1so92051766b.0
        for <linux-media@vger.kernel.org>; Thu, 15 Jun 2023 02:16:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686820609; x=1689412609;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fszieq+i4P0P95WhMAl0SF2cRNprRZwDxpfmWR3xLes=;
        b=enfEqECfjz1dpsTyqXG+Hwjm1KPvUrgbFsP9CqXDUmaW/CSdeXDps2L0ekBhdYo3AU
         j6SsvZTAkH8quW4KKKS+B4b/Sibcq1d2+7qemta7ktDuZ5LrKVY5ZW+pGwKc2tf8fMnM
         GwkTFF7rzkM8w4WCB0/wHj7OW7MSdRrCNaYmlK/40KK2ZtknT741Jd84137lAelfrDYE
         S9+nHEa3BSi0JvISXCNDgPxd4LoG9lgLOBar3Vov9/IqAIqNufG5nZAjUYkr8W+YJv+g
         2qy5xW6hPSzeDIuL71wvEl7VMrSQ4JKBhIVMA8xJXz3A5YRzHUJfC4KAmxSaCCMOhWAi
         u+mw==
X-Gm-Message-State: AC+VfDwnX8BGW0y0RbeKUDlJCLA1QPuTLqGqMSJtuysiCrYEU9wc1e8h
        0xN0nDNJRqSlHimSzFAsRdSTYiNRMIM6qC4Pk28Kel4J7jT/EIfrMDn8a2oRL8jSHexP5WHLYve
        MtCfqL2nomMru3+VtVbeH5e4=
X-Received: by 2002:a17:907:2d07:b0:967:13a3:d82c with SMTP id gs7-20020a1709072d0700b0096713a3d82cmr4196681ejc.26.1686820608870;
        Thu, 15 Jun 2023 02:16:48 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4KTu61Z59Cg2OxYvRF24c/cfXn3GevH7bwO1FdDt/CEMOP8yHdyprQ5eqojs909PRobGKBQQ==
X-Received: by 2002:a17:907:2d07:b0:967:13a3:d82c with SMTP id gs7-20020a1709072d0700b0096713a3d82cmr4196673ejc.26.1686820608636;
        Thu, 15 Jun 2023 02:16:48 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id oq19-20020a170906cc9300b00977e0bcff1esm9200524ejb.10.2023.06.15.02.16.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jun 2023 02:16:47 -0700 (PDT)
Message-ID: <4087b38a-13f0-ade2-0a22-a7452b85c9be@redhat.com>
Date:   Thu, 15 Jun 2023 11:16:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 2/5] media: ov5693: Convert to new CCI register access
 helpers
Content-Language: en-US, nl
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        linux-media@vger.kernel.org
References: <20230614192343.57280-1-hdegoede@redhat.com>
 <20230614192343.57280-3-hdegoede@redhat.com>
 <CAHp75VdJd_2Wo06cyGgHDr9B+V9kV56oHWpc_EcUHeFSiFfMeA@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75VdJd_2Wo06cyGgHDr9B+V9kV56oHWpc_EcUHeFSiFfMeA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Andy,

On 6/14/23 22:13, Andy Shevchenko wrote:
> On Wed, Jun 14, 2023 at 10:24 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Use the new comon CCI register access helpers to replace the private
>> register access helpers in the ov5693 driver.
> 
> ...
> 
>>  struct ov5693_device {
>>         struct i2c_client *client;
>>         struct device *dev;
>> +       struct regmap *regmap;
> 
> I forgot what the conclusion was regarding this. Now we have a client
> (which embeds the struct device), struct device pointer (is it the
> same device?), and now regmap, associated with (yet another?) struct
> device.

All 3 device pointers will point to the same device.

I think that having both a struct device *dev and
a  struct regmap *regmap is fine even though the
dev can also be gotten from the regmap with 
regmap_get_device() note that regmap_get_device()
is not an inline, so it comes with some execution cost.

And when used to set a global dev helper var in
functions the compiler must always call it even if
the helper var is only used to log errors.

But I agree that the pre-existing situation of having
both a client and a dev pointer is unnecessary.

And I just checked and after these changes the client
pointer is unused, so I'll drop that for the next version.

Regards,

Hans




> 
>>         } ctrls;
>>  };
> 
> 
> 
> --
> With Best Regards,
> Andy Shevchenko
> 

