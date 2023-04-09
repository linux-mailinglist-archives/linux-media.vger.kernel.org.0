Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 192AE6DBFF0
	for <lists+linux-media@lfdr.de>; Sun,  9 Apr 2023 15:10:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229502AbjDINKa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 9 Apr 2023 09:10:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229462AbjDINKa (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 9 Apr 2023 09:10:30 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E62C40DE
        for <linux-media@vger.kernel.org>; Sun,  9 Apr 2023 06:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1681045782;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=c5YmQZZIloFXvDd8K8JWPXYaqpH7SC8zdHi98Lhz8BI=;
        b=POEo2cG3/F9g/geGPmsyDa+zsD98EIOp2pA33bqMmokqXkkLFUofyXFKGa1NguXIkWXnQm
        RRw8BqaUymWMfXxtDY5c2vtszg6jVOS2dP53IZlIh3tN30BjgHC9dn/Vfn3igU49+NcV0Q
        7Rxdw5pI/0jXmADaTjSTK/UdEDtzG4o=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-382-JWPb_mo6Nd2ytJFnl-LQJA-1; Sun, 09 Apr 2023 09:09:41 -0400
X-MC-Unique: JWPb_mo6Nd2ytJFnl-LQJA-1
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-504899365c9so458562a12.0
        for <linux-media@vger.kernel.org>; Sun, 09 Apr 2023 06:09:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681045778; x=1683637778;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c5YmQZZIloFXvDd8K8JWPXYaqpH7SC8zdHi98Lhz8BI=;
        b=FUNGohJcWxVMMrItDGaVqGKkQVGCq+OOZLTmc89zqZpEkYHmXqPp26uFsldprujOaf
         A+c9CD4w1YQT1IszOKUdI8Jy68IihRAVeGwxkYv32KNNeYkLVdRXi28s6uISte8I4OBy
         /XNCfdDGsaFZhUk0K+8gBt8ZozKvtAImtB7Na8/pN5ysL+71BBen+1c5Nhzbiu9OvNKm
         RjIktd+Ly/nVrKFrR7yWQnudTKUmFe6Ex46LQTEJTZxSue169ezWfENh7yM9v3u+6ofA
         ELZg4FcZco7dc35VpkV2GXJfb+R/sg/A84LbVoojhKaAHHGRpteqA1peMWD3UUhWwTh0
         WoJA==
X-Gm-Message-State: AAQBX9eeLlNRrY9L3M+qSULqaeAEFA86CkDUDaWRbow94/5lvPct1pJR
        cR62u89t19PI6YamFM4o9pOEks2o+lTJ9qN1/welG8/ahrblQgbls3ThMKozCc3f/l+jdVB6qys
        BXF1lpt4GMYSWUA4+FuCKcT4=
X-Received: by 2002:a05:6402:b2e:b0:504:91ce:7b69 with SMTP id bo14-20020a0564020b2e00b0050491ce7b69mr2733977edb.22.1681045778595;
        Sun, 09 Apr 2023 06:09:38 -0700 (PDT)
X-Google-Smtp-Source: AKy350YZVqXL7SpwvAn3PSit5J87YxJnMkuycC+oZ4kh4wyXnI7qMQfyBfwTuLZuBqreCQUzWf7p2Q==
X-Received: by 2002:a05:6402:b2e:b0:504:91ce:7b69 with SMTP id bo14-20020a0564020b2e00b0050491ce7b69mr2733956edb.22.1681045778242;
        Sun, 09 Apr 2023 06:09:38 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id u2-20020a50c2c2000000b00501c96564b5sm3888240edf.93.2023.04.09.06.09.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Apr 2023 06:09:37 -0700 (PDT)
Message-ID: <ada1cc14-3607-a48b-cdea-7d72ba4db3d1@redhat.com>
Date:   Sun, 9 Apr 2023 15:09:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 00/28] media: atomisp: Further sensor rework + exotic
 features removal
Content-Language: en-US, nl
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kate Hsuan <hpa@redhat.com>, Tsuchiya Yuto <kitakar@gmail.com>,
        Andy Shevchenko <andy@kernel.org>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
References: <20230401145926.596216-1-hdegoede@redhat.com>
 <CAHp75Vd8kcr0YCU7_oCSc8YqW5ZarP4RpQLexGV10A-auZi=Fg@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75Vd8kcr0YCU7_oCSc8YqW5ZarP4RpQLexGV10A-auZi=Fg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Andy,

On 4/2/23 21:13, Andy Shevchenko wrote:
> On Sat, Apr 1, 2023 at 4:59 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Hi All,
>>
>> Here is another set of atomisp patches from yours truely.
>>
>> This basically consists of 2 parts:
>>
>> 1.  Further sensor driver modernization to work towards using standard
>>     v4l2 sensor drivers instead of atomisp specific copies
>> 1a. For some sensors some GPIOs have different polarity depending on
>>     which board they are on and the order in which GPIOs are listed in
>>     in the ACPI resources also is not consistent between boards.
>>     Fixing this without relying on per board DMI quirks requires parsing
>>     the results of a special Intel ACPI _DSM. Add a new
>>     v4l2_get_acpi_sensor_info() helper for this
>> 1b. Convert the gc0310 driver to use ACPI runtime pm instead of relying
>>     on the direct PMIC poking from atomisp_gmin_platform
>>
>> 2.  Further work on removing various exotic features, specifically
>>     prep work + remove support for streaming from 2 sensors at once,
>>     as discussed here:
>>     https://lore.kernel.org/linux-media/5309d845-063b-6dd9-529d-0f82654290f2@redhat.com/
> 
> Traditionally, for the non-commented ones:
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> 
> For the rest depending on the severity of the comment. Feel free to
> add my tag where it makes sense in your opinion (no discussion
> required).

Thank you for all the reviews. I've pushed a new version
addressing all your comments and adding your Reviewd-by to:

https://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux.git/log/?h=media-atomisp

I'll send out a pull-req to Mauro for this, wrapping up
the atomisp changes for this cycle.

Regards,

Hans



>> Hans de Goede (28):
>>   media: atomisp: Add v4l2_get_acpi_sensor_info() helper
>>   media: atomisp: ov2680: Use v4l2_get_acpi_sensor_info() for the GPIO
>>     lookups
>>   media: atomisp: ov2680: Error handling fixes
>>   media: atomisp: gc0310: Remove some unused structure definitions
>>   media: atomisp: gc0310: Remove GC0310_TOK_*
>>   media: atomisp: gc0310: Simplify gc0310_write_reg_array()
>>   media: atomisp: gc0310: Remove enum gc0310_tok_type
>>   media: atomisp: gc0310: Replace custom reg access functions with smbus
>>     helpers
>>   media: atomisp: gc0310: Remove non working flip-controls
>>   media: atomisp: gc0310: Remove read-only exposure control
>>   media: atomisp: gc0310: Drop custom ATOMISP_IOC_S_EXPOSURE support
>>   media: atomisp: gc0310: Add exposure and gain controls
>>   media: atomisp: gc0310: Add error_unlock label to s_stream()
>>   media: atomisp: gc0310: Modernize and simply set_fmt(), get_fmt(),
>>     etc.
>>   media: atomisp: gc0310: Delay power-on till streaming is started
>>   media: atomisp: gc0310: Add runtime-pm support
>>   media: atomisp: gc0310: Use devm_kzalloc() for data struct
>>   media: atomisp: gc0310: Switch over to ACPI powermanagement
>>   media: atomisp: Remove duplicate atomisp_[start|stop]_streaming
>>     prototypes
>>   media: atomisp: Remove continuous mode related code from
>>     atomisp_set_fmt()
>>   media: atomisp: Remove custom V4L2_CID_FMT_AUTO control
>>   media: atomisp: Remove snr_mbus_fmt local var from atomisp_try_fmt()
>>   media: atomisp: Remove unused ATOM_ISP_MAX_WIDTH_TMP and
>>     ATOM_ISP_MAX_HEIGHT_TMP
>>   media: atomisp: Remove atomisp_try_fmt() call from atomisp_set_fmt()
>>   media: atomisp: Drop support for streaming from 2 sensors at once
>>   media: atomisp: Remove struct atomisp_sub_device index field
>>   media: atomisp: gmin_platform: Make DMI quirks take precedence over
>>     the _DSM table
>>   media: atomisp: gmin_platform: Add Lenovo Ideapad Miix 310 gmin_vars
>>
>>  .../media/atomisp/i2c/atomisp-gc0310.c        | 999 ++++--------------
>>  .../media/atomisp/i2c/atomisp-ov2680.c        |  33 +-
>>  drivers/staging/media/atomisp/i2c/gc0310.h    | 416 +++-----
>>  drivers/staging/media/atomisp/i2c/ov2680.h    |   1 -
>>  .../media/atomisp/include/linux/atomisp.h     |   2 -
>>  .../atomisp/include/linux/atomisp_platform.h  |   2 +
>>  .../staging/media/atomisp/pci/atomisp_cmd.c   | 356 ++-----
>>  .../media/atomisp/pci/atomisp_compat.h        |   4 +-
>>  .../media/atomisp/pci/atomisp_compat_css20.c  |  89 +-
>>  .../staging/media/atomisp/pci/atomisp_fops.c  |   9 +-
>>  .../media/atomisp/pci/atomisp_gmin_platform.c | 289 ++++-
>>  .../media/atomisp/pci/atomisp_internal.h      |  20 +-
>>  .../staging/media/atomisp/pci/atomisp_ioctl.c |  64 +-
>>  .../staging/media/atomisp/pci/atomisp_ioctl.h |   3 -
>>  .../media/atomisp/pci/atomisp_subdev.c        | 111 +-
>>  .../media/atomisp/pci/atomisp_subdev.h        |   6 -
>>  .../staging/media/atomisp/pci/atomisp_v4l2.c  |  36 +-
>>  17 files changed, 844 insertions(+), 1596 deletions(-)
>>
>> --
>> 2.39.1
>>
> 
> 

