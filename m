Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CFE177135F0
	for <lists+linux-media@lfdr.de>; Sat, 27 May 2023 19:55:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229637AbjE0Rzg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 27 May 2023 13:55:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229472AbjE0Rze (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 27 May 2023 13:55:34 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B509DE
        for <linux-media@vger.kernel.org>; Sat, 27 May 2023 10:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1685210086;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=E8eJ/cXDkAmlYB3L6yJyK01/JHnXRcbD7xaxDyk7iTU=;
        b=K39PdStgtKIu6FzfI0313V2l2islxwfgQyudsB/QaDkPAoxxO/Jl11cHW6LFv/hwIoKstu
        OKkEZ3j3MdlLmELL5+/yO0j9yzx5i7voaiw6PmNf59P5RrTCwLldnpBqv/45wXSCq5ap+I
        /V2phRu3rim2UVUWjIKaecC0sVo0A9U=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-178-QYjI1LnUOaGVqKlfs6jCTQ-1; Sat, 27 May 2023 13:54:43 -0400
X-MC-Unique: QYjI1LnUOaGVqKlfs6jCTQ-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-94a34e35f57so170882266b.3
        for <linux-media@vger.kernel.org>; Sat, 27 May 2023 10:54:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685210082; x=1687802082;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E8eJ/cXDkAmlYB3L6yJyK01/JHnXRcbD7xaxDyk7iTU=;
        b=JMiyNyy6n/Ue6hA0bkesKGfT/LFWOT0XHZJ5jJ0CovXYza+Yf+PEGbNmDIN6fdMut4
         soQtvDY8ke78Tk1u8RC8d/Cnhgc/XPi7gNnST+5RZIllfUhj0EoGuAGAoFR0Ess5Q3LG
         tWvEPrq9DvyU2784sL/84ZJ5QD70mHc/udh22e35xqtOMkwazzNz8iI/MYZ20gePuD1q
         TXolMTaTptaLSpSDPoR149OfMYLIzje9Z5ZpiPyHE0kyVLFxXK9qr/sCXULZBx4+n0jB
         yaDv9ZDG4YNuBol6o90gEUh0i7ts3d0F5Ym75pa1LOKIhq7z7xQya2Xvw8h4GgsptYKE
         5k6Q==
X-Gm-Message-State: AC+VfDxmjPngKwijccWMnNVpK/9nVJgeEvlfwCPDbgU6EXnG9u31pkg6
        rCVYKp3bkjveDZxPRNt6OvTZfs2CABS4Y+TwSgpMO07ADxyiMg02Gxl7yR5sXiGwSrdWNAVt5W+
        LxBptlb/M2A617/gSROoFaGY=
X-Received: by 2002:a17:907:70b:b0:965:d18b:f03a with SMTP id xb11-20020a170907070b00b00965d18bf03amr6913263ejb.58.1685210082648;
        Sat, 27 May 2023 10:54:42 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5yoMMDWiis+yTe+JXsJtl4DUk8Lys+TDdbwmh/+SDqIocKPM+9g3hvwCRMJHoRsmxuUDQXYw==
X-Received: by 2002:a17:907:70b:b0:965:d18b:f03a with SMTP id xb11-20020a170907070b00b00965d18bf03amr6913243ejb.58.1685210082388;
        Sat, 27 May 2023 10:54:42 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id uz16-20020a170907119000b00965a56f82absm3656320ejb.212.2023.05.27.10.54.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 27 May 2023 10:54:41 -0700 (PDT)
Message-ID: <b037dbd7-a95d-00cb-7763-f6e244626b13@redhat.com>
Date:   Sat, 27 May 2023 19:54:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] media: atomisp: Fix buffer overrun in gmin_get_var_int()
Content-Language: en-US, nl
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        Dan Carpenter <dan.carpenter@linaro.org>
References: <20230527155136.61957-1-hdegoede@redhat.com>
 <CAHp75Vf7bCQp+vJH02yJjmooxZSgNna5sRQ=UEq=4LmsDZPsFQ@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75Vf7bCQp+vJH02yJjmooxZSgNna5sRQ=UEq=4LmsDZPsFQ@mail.gmail.com>
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

Hi,

On 5/27/23 18:55, Andy Shevchenko wrote:
> On Sat, May 27, 2023 at 6:51 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Not all functions used in gmin_get_var_int() update len to the actual
>> length of the returned string. So len may still have its initial value
>> of the length of val[] when "val[len] = 0;" is run to ensure 0 termination.
>>
>> If this happens we end up writing one beyond the bounds of val[], fix this.
>>
>> Note this is a quick fix for this since the entirety of
>> atomisp_gmin_platform.c will be removed once all atomisp sensor
>> drivers have been moved over to runtime-pm + v4l2-async device
>> registration.
> 
> ...
> 
>> Closes: https://lore.kernel.org/linux-media/26f37e19-c240-4d77-831d-ef3f1a4dd51d@kili.mountain/
> 
> Is this a new official tag? (Just to my surprise)

Yes, I was surprised too, checkpatch.pl now wants a Closes: tag
after a Reported-by: one, rather then a Link: tag.

> 
> ...
> 
>> -       char val[CFG_VAR_NAME_MAX];
>> -       size_t len = sizeof(val);
>> +       char val[CFG_VAR_NAME_MAX + 1];
>> +       size_t len = CFG_VAR_NAME_MAX;
> 
> Why not sizeof() - 1? At least it will be a single point when change
> can be made and not breaking again in a similar way the code.

I wanted to make the buffer one byte bigger to make room for
the terminating 0, not 1 bute smaller.

Regards,

Hams

