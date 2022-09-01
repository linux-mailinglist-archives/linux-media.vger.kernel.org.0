Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 696695A9BB6
	for <lists+linux-media@lfdr.de>; Thu,  1 Sep 2022 17:30:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234549AbiIAPaf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 1 Sep 2022 11:30:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234539AbiIAPaM (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 1 Sep 2022 11:30:12 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4BD11FCD1
        for <linux-media@vger.kernel.org>; Thu,  1 Sep 2022 08:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1662046203;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=cOt8ZISc3Gs9HW+RgYkEi+HF65y8hpbp/ZjyhOTB5WI=;
        b=VOorzRM2INNQKv680v6joRuwcXN2ipjbGZ9dklvqMtv5hwtIfDe2GmhDKTSpFqo7+FqNvS
        SZrl6ErsEB9ZwLPG7tHbi6TpuM98G0otO8ZdmyvEyXSoYdG4uJ8jt5OfDU3eJngUOC8Mhj
        UVobyUEGWMatuAy+cA8+BIoaWdOnfUY=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-638-jACDVEhkMXa0NGwhYSwABA-1; Thu, 01 Sep 2022 11:30:02 -0400
X-MC-Unique: jACDVEhkMXa0NGwhYSwABA-1
Received: by mail-ej1-f72.google.com with SMTP id gb33-20020a170907962100b00741496e2da1so6032088ejc.1
        for <linux-media@vger.kernel.org>; Thu, 01 Sep 2022 08:30:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=cOt8ZISc3Gs9HW+RgYkEi+HF65y8hpbp/ZjyhOTB5WI=;
        b=H+L+e9VNwnMp7X/73HiWAUG87jBT53wKhg6K/Yhm9sQtTuJz9nrQjHBL0yiXH+KHXk
         LkiOFwPIBBl/3o9BimLGo/7OtPyzwvP0lyd5bFomnZFFD/roQnJrzRs3aDzYI+TYG4l1
         IykXwGQA2KYDgnEDVf4iDV90R6JSX16Cru6LnwMgSONWUdT6H1EoV2G2jHzLAvOgC3Fs
         lHrHFM/sclTW1Q+wfrGUQCCvwCkYmFnYSBK8Y5nAK84bjAHyDfIqQRbvktSxy8/YSTd7
         ZSRfrpccpHDi+PoY67J2i3VbDXs50WdULc8ak597ehANgg+I8CVxJ4pS+Gp/AwU0+4WL
         Z28w==
X-Gm-Message-State: ACgBeo3L2SHBQpli+v9/5ShhnmK37k6gZ9bHOS/6LqU3DGaGiDSn0BHC
        G06sPspOmYlDPGg2t7xH0P+ahKBGB4qepecm/y6i+t2rxf2ht3/JXYj1znbUnogQahoxz7CH3KZ
        lkaiJUBvN2oiD70D6avqTy8M=
X-Received: by 2002:a05:6402:190d:b0:447:ed22:84eb with SMTP id e13-20020a056402190d00b00447ed2284ebmr25451504edz.379.1662046201509;
        Thu, 01 Sep 2022 08:30:01 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4ABFfXK/4RGMSNglfynARdsm+sCDeDBUdZoWaJRYdaxUfUjYhhME+tPKTCPO01URL8AnwW2A==
X-Received: by 2002:a05:6402:190d:b0:447:ed22:84eb with SMTP id e13-20020a056402190d00b00447ed2284ebmr25451484edz.379.1662046201324;
        Thu, 01 Sep 2022 08:30:01 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id q20-20020a170906b29400b0074b4e77ccc6sm398976ejz.151.2022.09.01.08.30.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Sep 2022 08:30:00 -0700 (PDT)
Message-ID: <d3f4b578-961c-fa46-a60c-8c8baadd4d95@redhat.com>
Date:   Thu, 1 Sep 2022 17:30:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 00/14] media: atomisp: More cleanups / code removal
Content-Language: en-US
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Andy Shevchenko <andy@kernel.org>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
References: <20220901094626.11513-1-hdegoede@redhat.com>
 <20220901170846.0fe20bf4@coco.lan>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220901170846.0fe20bf4@coco.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 9/1/22 17:08, Mauro Carvalho Chehab wrote:
> Em Thu,  1 Sep 2022 11:46:12 +0200
> Hans de Goede <hdegoede@redhat.com> escreveu:
> 
>> Hi Mauro,
>>
>> Here is a second set of atomisp cleanups / code removal.
>> This applies on top of my previous v2 series from here:
>> https://lore.kernel.org/linux-media/20220822150610.45186-1-hdegoede@redhat.com/
>>
>> I plan to do more atomisp work the coming few weeks. So I'm thinking
>> it might be better / easier for you if I just send you a pull-req based
>> on 6.0-rc1 with all atomisp patches bundled around rc5/rc6 time.
>>
>> Would that work for you ?
> 
> Yes, that works for me. I'm actually proritizing PRs over normal patches
> from media maintainers. As you're doing most of work on it, I can
> start picking PRs from you related to atomisp.

Sounds good.

Note I have also been picking up various small fixes from others both
for testing and to make sure they don't get lost. So I plan to include
those into the pull-req around rc5/6 time too.

Regards,

Hans



>> Dan Carpenter (1):
>>   media: atomisp: prevent integer overflow in sh_css_set_black_frame()
>>
>> Hans de Goede (13):
>>   media: atomisp: Fix device_caps reporting of the registered video-devs
>>   media: atomisp: Remove file-injection support
>>   media: atomisp: Remove atomisp_file_fops and atomisp_file_ioctl_ops
>>   media: atomisp: Remove the outq videobuf queue
>>   media: atomisp: Remove never set file_input flag
>>   media: atomisp: Remove the ACC device node
>>   media: atomisp: Remove some further ATOMISP_ACC_* related dead code
>>   media: atomisp: Remove empty atomisp_css_set_cont_prev_start_time()
>>     function
>>   media: atomisp: Split subdev and video-node registration into 2 steps
>>   media: atomisp: Register /dev/* nodes at the end of
>>     atomisp_pci_probe()
>>   media: atomisp: Remove loading mutex
>>   media: atomisp: Fix v4l2_fh resource leak on open errors
>>   media: atomisp: Simplify v4l2_fh_open() error handling
>>
>>  drivers/staging/media/atomisp/Makefile        |   1 -
>>  .../media/atomisp/include/linux/atomisp.h     |  14 --
>>  .../staging/media/atomisp/pci/atomisp_cmd.c   | 134 +---------
>>  .../staging/media/atomisp/pci/atomisp_cmd.h   |   2 -
>>  .../media/atomisp/pci/atomisp_compat.h        |   6 -
>>  .../media/atomisp/pci/atomisp_compat_css20.c  |  26 --
>>  .../staging/media/atomisp/pci/atomisp_file.c  | 229 ------------------
>>  .../staging/media/atomisp/pci/atomisp_file.h  |  44 ----
>>  .../staging/media/atomisp/pci/atomisp_fops.c  | 187 ++------------
>>  .../media/atomisp/pci/atomisp_internal.h      |  16 +-
>>  .../staging/media/atomisp/pci/atomisp_ioctl.c | 192 ++-------------
>>  .../staging/media/atomisp/pci/atomisp_ioctl.h |   4 -
>>  .../media/atomisp/pci/atomisp_subdev.c        |  95 ++------
>>  .../media/atomisp/pci/atomisp_subdev.h        |  47 +---
>>  .../staging/media/atomisp/pci/atomisp_v4l2.c  |  99 +++-----
>>  .../staging/media/atomisp/pci/atomisp_v4l2.h  |   3 -
>>  .../staging/media/atomisp/pci/sh_css_params.c |   4 +-
>>  17 files changed, 104 insertions(+), 999 deletions(-)
>>  delete mode 100644 drivers/staging/media/atomisp/pci/atomisp_file.c
>>  delete mode 100644 drivers/staging/media/atomisp/pci/atomisp_file.h
>>
> 
> 
> 
> Thanks,
> Mauro
> 

