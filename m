Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E769C54ADB8
	for <lists+linux-media@lfdr.de>; Tue, 14 Jun 2022 11:51:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351786AbiFNJvS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Jun 2022 05:51:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355226AbiFNJvC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Jun 2022 05:51:02 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 6C08F47AF3
        for <linux-media@vger.kernel.org>; Tue, 14 Jun 2022 02:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1655200236;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=LfV4iZ62wUryGJ0X4batHKgc5WIz6UL174/ZDzMhTdk=;
        b=Hc8LbXAQSg6kz2hFVf8nlKnvLa71spzDqLPOckiICBUKW15JBiEo+YgVrswr+jJRaxBhy3
        ZxdMFgWvybcyIkwHAN7y1zuYjsUSMKNveDgDc2ek0b/gSXXDG4stZu62KoujXk7QECTONM
        w5rEnplaC7U7ETopk+sEUyU+/YsNKEw=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-650-eP7bsZwcNv2BA4WMzIkSow-1; Tue, 14 Jun 2022 05:50:35 -0400
X-MC-Unique: eP7bsZwcNv2BA4WMzIkSow-1
Received: by mail-ed1-f69.google.com with SMTP id g7-20020a056402424700b0042dee9d11d0so5793507edb.3
        for <linux-media@vger.kernel.org>; Tue, 14 Jun 2022 02:50:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=LfV4iZ62wUryGJ0X4batHKgc5WIz6UL174/ZDzMhTdk=;
        b=1IZEKrZWm1Yl3FyC4go38K5FofFrQxE60ATmESVScZw3siZ8BtZJXOKFb9vneOBRyP
         bOjz+XYab9m5GP9kiFcude3JqDmGSivist8cBxhXzDHNK9Tuc+Gm/AuLeaFWmDZhPO2m
         nWafkzo7TSiTihATF1piJNLvJvL4P/+1Czd1f/jKoGHYcF5ddWN6L08mwK9HTJ9oaXyo
         MeqCp6DAeacco5PnL8ePjo+xmpqlPT7pYDKafoPnHA0jSyr1MnqhbyzoyhEzPnTGV0UP
         HWQC4yJbXNSh6pr4Y4n/Mz7xR19DcFXM858c2CY5as8iiOSBsBmi8nNsnIED8JXZZk0f
         GS6w==
X-Gm-Message-State: AJIora/diVIzy9rZZRjYPLwLjKmayTp40XI3Scnf8/AHL+vGWlsZOvj2
        TQpiSBevHxuNlF5UyL6Jrb3P/sdbKorLPDYf+70X8pyfmqOyBk1R0E/PBjpE3k+L3FHKCHtPm1P
        jCXjqCq9bDpijpsyl5iYTXt4=
X-Received: by 2002:a17:906:d84:b0:715:7f3d:403f with SMTP id m4-20020a1709060d8400b007157f3d403fmr3548978eji.406.1655200233865;
        Tue, 14 Jun 2022 02:50:33 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tF5zLN0VV8V8xb3W9JI4iDUF2ao1/yLGQUcpURLPeG6qmI8tGrhkR1FgodNIKBFVu1B8bl9Q==
X-Received: by 2002:a17:906:d84:b0:715:7f3d:403f with SMTP id m4-20020a1709060d8400b007157f3d403fmr3548952eji.406.1655200233645;
        Tue, 14 Jun 2022 02:50:33 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id io11-20020a17090780cb00b00715c322bda1sm3171379ejc.69.2022.06.14.02.50.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jun 2022 02:50:33 -0700 (PDT)
Message-ID: <655885f2-e3c4-2e26-7271-7032bae017c5@redhat.com>
Date:   Tue, 14 Jun 2022 11:50:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 00/40] media: atomisp: Various hmm and other cleanups
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
        linux-staging@lists.linux.dev
References: <20220613195137.8117-1-hdegoede@redhat.com>
 <CAHp75VcLfeN+y3S=AkMDjUyB3oS1k0j7pu4Ts7D9K35F3UkEbw@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75VcLfeN+y3S=AkMDjUyB3oS1k0j7pu4Ts7D9K35F3UkEbw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 6/14/22 11:25, Andy Shevchenko wrote:
> On Mon, Jun 13, 2022 at 9:51 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Hi All,
>>
>> I want to start writing a libcamera pipeline handler for the atomisp2,
>> but before I can do that I first need to fix mmap support in  atomisp2.
>>
>> My plan for this is to port the atomisp2 handler to videobuf2. To do that
>> I first need to understand the existing memory/buffer management so I've
>> started with cleaning up the hmm code (with a bit of a detour here and
>> there).
>>
>> This series is the result of that. There are likely more cleanups to
>> follow, but I've to focus on some other things for a bit. I hope to be
>> able to return to the cleanups + an eventual videobuf2 conversion soon.
> 
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> 
> For patches 1-8: The code wise it's good clean up, functionality it
> might be that intention was to implement it as some point, but looking
> into (internal) history of the driver development I believe it would
> require some firmware changes which is impossible for upstreamed
> version of the driver and as you noticed never productized that time.
> Hence, good that we got less LoCs after all.
> 
> For patches 9-13: I believe that patch 10 and 9 should be swapped in
> the series. Logically you drop caller first followed by (unused)
> callee.

Note the code removed in patch 9 was never called even before patch 10,
the removed calls in patch 10 were already "#if 0"-ed out. So there
is no bisect breakage here. With that said I get your point.

Regards,

Hans



> 
> For the rest: To be continued...
> 
>> Hans de Goede (40):
>>   media: atomisp: remove the unused RAW_BUF_STRIDE macro
>>   media: atomisp: remove unused ia_css_frame_allocate_contiguous*()
>>     functions
>>   media: atomisp: drop contiguous argument from
>>     ia_css_frame_allocate_with_buffer_size()
>>   media: atomisp: drop contiguous argument from
>>     frame_allocate_with_data()
>>   media: atomisp: drop contiguous argument from frame_create()
>>   media: atomisp: drop IA_CSS_FRAME_FORMAT_MIPI support from
>>     ia_css_frame_init_planes()
>>   media: atomisp: drop contiguous flag from struct ia_css_frame
>>   media: atomisp: drop ATOMISP_MAP_FLAG_CONTIGUOUS
>>   media: atomisp: remove dynamic and reserved pool code
>>   media: atomisp: remove hmm_pool_[un]register()
>>   media: atomisp: remove hmm pool code
>>   media: atomisp: remove hmm_mem_stats
>>   media: atomisp: remove pool related kernel cmdline options
>>   media: atomisp: remove unused attribute argument from
>>     ia_css_frame_map()
>>   media: atomisp: drop hmm_page_type
>>   media: atomisp: removed unused hmm_bo_get_page_info() function
>>   media: atomisp: remove bogus comment above hmm_bo_allocated()
>>     prototype
>>   media: atomisp: remove private acceleration ioctls
>>   media: atomisp: remove atomisp_acc.c
>>   media: atomisp: remove unused atomisp_*css_* functions
>>   media: atomisp: asc.acc.pipeline is always NULL
>>   media: atomisp: remove no longer used atomisp_css_acc_done() function
>>   media: atomisp: remove atomisp_is_acc_enabled()
>>   media: atomisp: drop unused ATOMISP_ACC_FW_LOAD_* defines
>>   media: atomisp: drop ATOMISP_MAP_FLAG_CLEARED
>>   media: atomisp: drop unused ATOMISP_MAP_FLAG_* flags
>>   media: atomisp: remove unused hmm address translation functions
>>   media: atomisp: add hmm_create_from_userdata() helper
>>   media: atomisp: Simplify hmm_alloc() calls
>>   media: atomisp: drop highmem var/arg from the hmm code
>>   media: atomisp: drop HMM_BO_SHARE type
>>   media: atomisp: remove hmm_page_object
>>   media: atomisp: fix __get_frame_info() error handling
>>   media: atomisp: add error checking to atomisp_create_pipes_stream()
>>   media: atomisp: add error logging to
>>     atomisp_destroy_pipes_stream_force()
>>   media: atomisp: use atomisp_create_pipes_stream() in more places
>>   media: atomisp: use atomisp_css_update_stream() in more places
>>   media: atomisp: use atomisp_destroy_pipes_stream_force() in more
>>     places
>>   media: atomisp: remove force argument from
>>     __destroy_[stream[s]|pipe[s]]()
>>   media: atomisp: Add a notes.txt file
>>
>>  drivers/staging/media/atomisp/Makefile        |   3 -
>>  .../staging/media/atomisp/include/hmm/hmm.h   |  32 +-
>>  .../media/atomisp/include/hmm/hmm_bo.h        |  37 +-
>>  .../media/atomisp/include/hmm/hmm_common.h    |  26 -
>>  .../media/atomisp/include/hmm/hmm_pool.h      | 116 ----
>>  .../media/atomisp/include/linux/atomisp.h     | 146 ----
>>  drivers/staging/media/atomisp/notes.txt       |  30 +
>>  .../staging/media/atomisp/pci/atomisp_acc.c   | 625 ------------------
>>  .../staging/media/atomisp/pci/atomisp_acc.h   | 120 ----
>>  .../staging/media/atomisp/pci/atomisp_cmd.c   |  33 +-
>>  .../media/atomisp/pci/atomisp_compat.h        |  29 +-
>>  .../media/atomisp/pci/atomisp_compat_css20.c  | 365 ++--------
>>  .../atomisp/pci/atomisp_compat_ioctl32.h      |  58 --
>>  .../staging/media/atomisp/pci/atomisp_drvfs.c |   7 +-
>>  .../staging/media/atomisp/pci/atomisp_fops.c  |  13 -
>>  .../staging/media/atomisp/pci/atomisp_ioctl.c |  73 +-
>>  .../staging/media/atomisp/pci/atomisp_ioctl.h |   1 -
>>  .../media/atomisp/pci/atomisp_subdev.c        |   3 -
>>  .../media/atomisp/pci/atomisp_subdev.h        |  10 -
>>  .../staging/media/atomisp/pci/atomisp_v4l2.c  |  32 -
>>  drivers/staging/media/atomisp/pci/hmm/hmm.c   | 186 +-----
>>  .../staging/media/atomisp/pci/hmm/hmm_bo.c    | 261 ++------
>>  .../media/atomisp/pci/hmm/hmm_dynamic_pool.c  | 234 -------
>>  .../media/atomisp/pci/hmm/hmm_reserved_pool.c | 253 -------
>>  .../media/atomisp/pci/ia_css_frame_public.h   |  40 --
>>  .../kernels/sdis/sdis_1.0/ia_css_sdis.host.c  |   2 +-
>>  .../kernels/sdis/sdis_2/ia_css_sdis2.host.c   |   2 +-
>>  .../pci/isp/modes/interface/isp_const.h       |   6 -
>>  .../pci/runtime/debug/src/ia_css_debug.c      |   2 -
>>  .../runtime/frame/interface/ia_css_frame.h    |   7 +-
>>  .../atomisp/pci/runtime/frame/src/frame.c     | 105 +--
>>  .../pci/runtime/isp_param/src/isp_param.c     |   2 +-
>>  .../atomisp/pci/runtime/rmgr/src/rmgr_vbuf.c  |   3 +-
>>  .../atomisp/pci/runtime/spctrl/src/spctrl.c   |   2 +-
>>  drivers/staging/media/atomisp/pci/sh_css.c    |   5 -
>>  .../media/atomisp/pci/sh_css_firmware.c       |   2 +-
>>  .../staging/media/atomisp/pci/sh_css_mipi.c   |   3 +-
>>  .../staging/media/atomisp/pci/sh_css_params.c |  47 +-
>>  38 files changed, 205 insertions(+), 2716 deletions(-)
>>  delete mode 100644 drivers/staging/media/atomisp/include/hmm/hmm_pool.h
>>  create mode 100644 drivers/staging/media/atomisp/notes.txt
>>  delete mode 100644 drivers/staging/media/atomisp/pci/atomisp_acc.c
>>  delete mode 100644 drivers/staging/media/atomisp/pci/atomisp_acc.h
>>  delete mode 100644 drivers/staging/media/atomisp/pci/hmm/hmm_dynamic_pool.c
>>  delete mode 100644 drivers/staging/media/atomisp/pci/hmm/hmm_reserved_pool.c
>>
>> --
>> 2.36.0
>>
> 
> 

