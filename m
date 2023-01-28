Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 95B9067F6C6
	for <lists+linux-media@lfdr.de>; Sat, 28 Jan 2023 10:42:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233641AbjA1Jmi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 28 Jan 2023 04:42:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229599AbjA1Jmh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 28 Jan 2023 04:42:37 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3882B1E9ED
        for <linux-media@vger.kernel.org>; Sat, 28 Jan 2023 01:41:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1674898908;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=twR14cjllGUXLpKlnOdL7uubVR+CcOSrwvbCUlEF4yg=;
        b=ByAqBjFPIVe6TNUUXR91kJbxLz4wT1nkQOryGO2OQNUvSd7c1qumVYqwkjhTQB6cYPlcQa
        nn2zX4IsL8OYphcMEjO9Yvsb4yNvPhe6NiGcdqnelwDIV11nbNfs6CjTZ/pNX6Geestq9R
        5zkr38cs5Ixur9ORmgVBlcwoYFeDY+8=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-304-qTbhN-ICOI6X0YW-TOJfrQ-1; Sat, 28 Jan 2023 04:41:45 -0500
X-MC-Unique: qTbhN-ICOI6X0YW-TOJfrQ-1
Received: by mail-ed1-f71.google.com with SMTP id z18-20020a05640235d200b0049d84165065so5117493edc.18
        for <linux-media@vger.kernel.org>; Sat, 28 Jan 2023 01:41:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=twR14cjllGUXLpKlnOdL7uubVR+CcOSrwvbCUlEF4yg=;
        b=I1mX1WLauyT4otgXiTN95cZG7yyxA9TgQAtRvBP33/qZI2eKzZJJGdE2HGl98UW0C1
         BRC4+8ny1RSqjUHdDx8ZBVUUelmf6Mdh2uplzsUMm9y7AnsHr0XOMHuAK3UmBEiAkCMP
         gz8qPjbpz+nnxfrYfMg0pWcKV/Zyv44Yu6baMWuBDxP+ix+bBYJDO82pf9hPwwy/48ay
         5B6wNNvutbLRUADyLox9N6ESwxD0P89vdhjJVpy63xLKX/cwnuIYgkLnl6QvZCZaHK2Z
         j5oOd2fWQkAOQ0++saiW29pM8oP9KP+2Y4iTlq6ZXPfCjghXJYRAlcx0BfGFhJEYgR8n
         jgyg==
X-Gm-Message-State: AFqh2kpoi3iLRFEOnU3gY7PQqE4txmTPXFWIIcazVXlel6tiq6Z6qAwN
        gJp8gYeeW/FcKmtPOdFaLai1KoD0nYqA8ApHswgod1plk72G3mYOE4Z6wWC6fI7STY/ljH268pG
        jdZ2gKyFvjeIGOT8WfRPSB+o=
X-Received: by 2002:a17:907:8b08:b0:860:c12c:14fd with SMTP id sz8-20020a1709078b0800b00860c12c14fdmr47726564ejc.76.1674898904778;
        Sat, 28 Jan 2023 01:41:44 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsLWHdwigC9AWjgO/I5vHPQwk+KI0Cp2B38kYPAXsibJhvaTjuoQ0sruljT5mNLvxnF6Tby9g==
X-Received: by 2002:a17:907:8b08:b0:860:c12c:14fd with SMTP id sz8-20020a1709078b0800b00860c12c14fdmr47726543ejc.76.1674898904558;
        Sat, 28 Jan 2023 01:41:44 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id mb18-20020a170906eb1200b0084f7d38713esm3622593ejb.108.2023.01.28.01.41.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Jan 2023 01:41:44 -0800 (PST)
Message-ID: <579d96f3-83d3-8b0a-6760-ce1903936c1a@redhat.com>
Date:   Sat, 28 Jan 2023 10:41:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v6 3/5] platform/x86: int3472/discrete: Create a LED class
 device for the privacy LED
Content-Language: en-US, nl
To:     kernel test robot <lkp@intel.com>,
        Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Daniel Scally <djrscally@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, linux-gpio@vger.kernel.org,
        Kate Hsuan <hpa@redhat.com>,
        Mark Pearson <markpearson@lenovo.com>,
        Andy Yeh <andy.yeh@intel.com>, Hao Yao <hao.yao@intel.com>
References: <20230127203729.10205-4-hdegoede@redhat.com>
 <202301281537.fKVHsgf4-lkp@intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <202301281537.fKVHsgf4-lkp@intel.com>
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

On 1/28/23 08:24, kernel test robot wrote:
> Hi Hans,
> 
> I love your patch! Yet something to improve:
> 
> [auto build test ERROR on linus/master]
> [also build test ERROR on v6.2-rc5]
> [cannot apply to media-tree/master]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Hans-de-Goede/media-v4l2-core-Make-the-v4l2-core-code-enable-disable-the-privacy-LED-if-present/20230128-131233
> patch link:    https://lore.kernel.org/r/20230127203729.10205-4-hdegoede%40redhat.com
> patch subject: [PATCH v6 3/5] platform/x86: int3472/discrete: Create a LED class device for the privacy LED
> config: i386-randconfig-r004-20230123 (https://download.01.org/0day-ci/archive/20230128/202301281537.fKVHsgf4-lkp@intel.com/config)
> compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
> reproduce (this is a W=1 build):
>         # https://github.com/intel-lab-lkp/linux/commit/d71a1bce9c9ea0bd5b98920b2d72a5b0a36ca19d
>         git remote add linux-review https://github.com/intel-lab-lkp/linux
>         git fetch --no-tags linux-review Hans-de-Goede/media-v4l2-core-Make-the-v4l2-core-code-enable-disable-the-privacy-LED-if-present/20230128-131233
>         git checkout d71a1bce9c9ea0bd5b98920b2d72a5b0a36ca19d
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         make W=1 O=build_dir ARCH=i386 olddefconfig
>         make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/platform/
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
>    In file included from drivers/platform/x86/intel/int3472/discrete.c:17:
>>> drivers/platform/x86/intel/int3472/common.h:107:40: error: field 'lookup' has incomplete type
>      107 |                 struct led_lookup_data lookup;
>          |                                        ^~~~~~
> --
>    In file included from drivers/platform/x86/intel/int3472/led.c:7:
>>> drivers/platform/x86/intel/int3472/common.h:107:40: error: field 'lookup' has incomplete type
>      107 |                 struct led_lookup_data lookup;
>          |                                        ^~~~~~
>    drivers/platform/x86/intel/int3472/led.c: In function 'skl_int3472_register_pled':
>>> drivers/platform/x86/intel/int3472/led.c:57:9: error: implicit declaration of function 'led_add_lookup'; did you mean 'd_can_lookup'? [-Werror=implicit-function-declaration]
>       57 |         led_add_lookup(&int3472->pled.lookup);
>          |         ^~~~~~~~~~~~~~
>          |         d_can_lookup
>    drivers/platform/x86/intel/int3472/led.c: In function 'skl_int3472_unregister_pled':
>>> drivers/platform/x86/intel/int3472/led.c:71:9: error: implicit declaration of function 'led_remove_lookup' [-Werror=implicit-function-declaration]
>       71 |         led_remove_lookup(&int3472->pled.lookup);
>          |         ^~~~~~~~~~~~~~~~~
>    cc1: some warnings being treated as errors

As mentioned in the cover-letter this series depends on this immutable-branch:

https://lore.kernel.org/platform-driver-x86/Y9QGcA+9nlmOOy2d@google.com/

That branch not being present in the base used by LKP is what is causing this
error.

Regards,

Hans

