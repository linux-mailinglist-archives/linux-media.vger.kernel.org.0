Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 201465BFAB9
	for <lists+linux-media@lfdr.de>; Wed, 21 Sep 2022 11:22:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231618AbiIUJWC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Sep 2022 05:22:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231479AbiIUJVj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Sep 2022 05:21:39 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0576659A
        for <linux-media@vger.kernel.org>; Wed, 21 Sep 2022 02:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1663752042;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=2aMfWfue1UCHey0VLGgoawQPLIUpGRvAMI5FdpJY29A=;
        b=hTR1yEkUrcnBJRVdgm+zcXaVO7p440M0pLSfWUc0jyq12DQW35+M/Q9O9spNB0ZwKSKHxj
        7HcwfHms2ZUiDcDpeJMVSA55mwsz8NlSJ+XHsrBo9zANbm652M18FmZX2Gkk6WExRdTKIr
        8hYikRjdjUI72bwg8WyClZZq1dvvpbM=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-587-NK14_WyzM1-QFOCeIDDgOw-1; Wed, 21 Sep 2022 05:20:40 -0400
X-MC-Unique: NK14_WyzM1-QFOCeIDDgOw-1
Received: by mail-ed1-f69.google.com with SMTP id w17-20020a056402269100b0045249bc17a9so3904260edd.9
        for <linux-media@vger.kernel.org>; Wed, 21 Sep 2022 02:20:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=2aMfWfue1UCHey0VLGgoawQPLIUpGRvAMI5FdpJY29A=;
        b=owgdLmxAGO67TcXL1sJl2Zy18778VK+75E0h4dYKJ7C322Ne3Tt0C6reNdjQ0RGKFs
         3K2qVGF+iOZhkYNldaogBWXpKpN3SqOxlYbEpG3dX99N7v9/eSmFzOXluyIieailrFG6
         LK0KOgXIjpZZQwkEv5Hlwm9VFw58JrJ42Ws4xnyS1TrqJfw/cQShdMRP8rwBlSc9g0jT
         UsheDv+16AIjddKpKTxNvXqAyagfHYhVpH8OowoE0TIjbscO80eFQORUflWuMwZ46i0W
         AI9KOU0oZxE8ZK6Ks6w8KTeQ5DpFmLRKAjwvbHtkVuMTzx0YaWew0ZsFUH/1dfyTS4Rh
         m+og==
X-Gm-Message-State: ACrzQf3G/aqvlk6Ahi3ClUIwDthUW1n0M2mruyvjiDNPKo5awZtugi9M
        3HIStKGCAOsBatbocuRiV+wCQAKcSVYr8Nx0H2x1rZRJvwazqfMYgvFVbr0osCgKOTEaPIeODY7
        OXV/DdTRU9fgYx0VSLmIUuQQ=
X-Received: by 2002:a17:906:5d0b:b0:77f:bc8d:361d with SMTP id g11-20020a1709065d0b00b0077fbc8d361dmr20023909ejt.379.1663752039569;
        Wed, 21 Sep 2022 02:20:39 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7YAWUNmfq0t9x+fKIUrtlSsnVXqg3OvnY0wHQh08Ls3JfwtZT/fv56bO7I/8VL5S8apIcPZA==
X-Received: by 2002:a17:906:5d0b:b0:77f:bc8d:361d with SMTP id g11-20020a1709065d0b00b0077fbc8d361dmr20023816ejt.379.1663752039293;
        Wed, 21 Sep 2022 02:20:39 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id l24-20020aa7c318000000b0044ee18e5f79sm1455946edq.28.2022.09.21.02.20.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Sep 2022 02:20:38 -0700 (PDT)
Message-ID: <7efd58ab-9486-a547-d69f-acb6300c6146@redhat.com>
Date:   Wed, 21 Sep 2022 11:20:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH 00/17] media: atomisp: further cleanups / unwanted code
 removal
Content-Language: en-US
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Andy Shevchenko <andy@kernel.org>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
References: <20220911171653.568932-1-hdegoede@redhat.com>
 <Yx8bkW/ntNefoM18@smile.fi.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Yx8bkW/ntNefoM18@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 9/12/22 13:44, Andy Shevchenko wrote:
> On Sun, Sep 11, 2022 at 07:16:36PM +0200, Hans de Goede wrote:
>> Hi All,
>>
>> Here is another atomisp patch-series with further cleanups / unwanted code
>> removal. Note this mostly cleaning up things which I hit while I'm still
>> working towards converting the driver to videobuf2.
>>
>> The main goal of this series was to make the atomisp locking more like
>> that of other v4l2 drivers, which is acomplished in the
>> "media: atomisp: Use video_dev.lock for ioctl locking" patch.
> 
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> for non-commented/non-authored-by-me patches.

Thank you for all the reviews.

I'm currently preparing a pull-req for atomisp for Mauro. You can find
this series here now:
https://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux.git/log/?h=media-atomisp

For the indentation fixes you asked about for 16/17, see:
https://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux.git/commit/?h=media-atomisp&id=f9c9e7db01caaa1c1fa5a18d1505676c1bdcaeb0

Note I'm going to do a test-build + some quick local tests for this
and then I'll put a signed-tag on it and send out a pull-req.

So if you are still going to give your Reviewed-by for patch 1 + 16
it will likely be too late for me to process the tags, sorry.

Regards,

Hans


> 
>> Andy Shevchenko (1):
>>   media: atomisp_gmin_platform: Unexport and split camera_sensor_csi()
>>
>> Hans de Goede (16):
>>   media: atomisp: Use a normal mutex for the main lock
>>   media: atomisp: Remove unused lock member from struct
>>     atomisp_sub_device
>>   media: atomisp: Fix locking around asd->streaming read/write
>>   media: atomisp: Remove asd == NULL checks from ioctl handling
>>   media: atomisp: Add atomisp_pipe_check() helper
>>   media: atomisp: Remove watchdog timer
>>   media: atomisp: Move atomisp_streaming_count() check into
>>     __atomisp_css_recover()
>>   media: atomisp: Rework asd->streaming state update in
>>     __atomisp_streamoff()
>>   media: atomisp: Drop streamoff_mutex
>>   media: atomisp: Use video_dev.lock for ioctl locking
>>   media: atomisp: Remove a couple of not useful function wrappers
>>   media: atomisp: Drop unnecessary first_streamoff check
>>   media: atomisp: Make atomisp_set_raw_buffer_bitmap() static
>>   media: atomisp: Remove unused atomisp_css_get_dis_statistics()
>>   media: atomisp: Remove const/fixed camera_caps
>>   media: atomisp: Remove atomisp_source_pad_to_stream_id()
>>
>>  .../include/linux/atomisp_gmin_platform.h     |   2 -
>>  .../atomisp/include/linux/atomisp_platform.h  |  18 -
>>  .../staging/media/atomisp/pci/atomisp_cmd.c   | 581 ++----------------
>>  .../staging/media/atomisp/pci/atomisp_cmd.h   |   9 +-
>>  .../media/atomisp/pci/atomisp_compat.h        |   4 -
>>  .../media/atomisp/pci/atomisp_compat_css20.c  |  74 +--
>>  .../staging/media/atomisp/pci/atomisp_fops.c  |  87 +--
>>  .../media/atomisp/pci/atomisp_gmin_platform.c |  86 ++-
>>  .../media/atomisp/pci/atomisp_internal.h      |  39 +-
>>  .../staging/media/atomisp/pci/atomisp_ioctl.c | 567 ++++-------------
>>  .../staging/media/atomisp/pci/atomisp_ioctl.h |  10 +-
>>  .../media/atomisp/pci/atomisp_subdev.c        |  34 +-
>>  .../media/atomisp/pci/atomisp_subdev.h        |  24 +-
>>  .../staging/media/atomisp/pci/atomisp_v4l2.c  |  65 +-
>>  14 files changed, 267 insertions(+), 1333 deletions(-)
>>
>> -- 
>> 2.37.3
>>
> 

