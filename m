Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C557764EF5
	for <lists+linux-media@lfdr.de>; Thu, 27 Jul 2023 11:13:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232376AbjG0JNb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Jul 2023 05:13:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234396AbjG0JNJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Jul 2023 05:13:09 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96A0E3A8B
        for <linux-media@vger.kernel.org>; Thu, 27 Jul 2023 01:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1690448375;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=wM6TEnn+NJffXTv9Y3Obw9sX6bbN14vizzC7Lcy1RP8=;
        b=W6l6bizATwX9RcZQLp5v0zh2VEOgJcJybC5woacq5WuQRc/V9PL2dWeT47jwyKXwgEKTRP
        8m7PQd1VJ3NJvQx36/jn7wLpYHCzSQ0VYgpY3AcposH5lXfaNaQmI0/jgksoujuqST8KFn
        ndvlWFkOl8ExAthf42U+DvBAnbdhDTg=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-515-CQ-XEbgYNqyEDbGgZexjtA-1; Thu, 27 Jul 2023 04:59:33 -0400
X-MC-Unique: CQ-XEbgYNqyEDbGgZexjtA-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-993d631393fso43579866b.0
        for <linux-media@vger.kernel.org>; Thu, 27 Jul 2023 01:59:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690448373; x=1691053173;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wM6TEnn+NJffXTv9Y3Obw9sX6bbN14vizzC7Lcy1RP8=;
        b=O6hAxIsh4vMZDSVIDLJHkugapx79Guxto8GgvnOq/wYethazY9p6Nhk7pQ6D5RkSRM
         x0tJ2Yv2UxgjhssnPCc+giiEi1JhWFUVHxdLD97flPh3+a0VOLbf8a4GupObAf5598jk
         L6cuclgt6rIPso5+s+LD+HH72fbwkR5t6jy2n7CHs8Pr2zJezNklmXA73oqMQMvTRrh+
         3Y1jIgSaIA3ScDcixXo6XnaBuHGw4u4JSAZtwfGw9lgn/IsH8KVl+rMdE06G05lx4TQ2
         xoalxvI3xxGoYzYf0YNj6CXrwyXyFI+6MHm7GAgMW4gTkjGkTDxRX5AJ1vnInID/UNQp
         TAQQ==
X-Gm-Message-State: ABy/qLZ+ZjHtU9yQdmk9PRMJ6lvoKJS9mTTpBNX30c6vuc9lJXOqu/td
        8cddKLKCWj6yfIxAehYVu6Ap6CW/wbvqUlZtpSqfrziyO3lRcdDpDtNtvKJwKefsriDhELWKRia
        jKdrVTIwDBBAvjrk4RTaQDnY=
X-Received: by 2002:a17:906:ca:b0:994:4f6a:dbb with SMTP id 10-20020a17090600ca00b009944f6a0dbbmr1496094eji.27.1690448372831;
        Thu, 27 Jul 2023 01:59:32 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFOGtxV672LHuBwo8IVK6mXlQeX9g+tGk4amvCV1LtLU0sPTvCxE0p04W52Jav0Wwzp9i9p5A==
X-Received: by 2002:a17:906:ca:b0:994:4f6a:dbb with SMTP id 10-20020a17090600ca00b009944f6a0dbbmr1496077eji.27.1690448372450;
        Thu, 27 Jul 2023 01:59:32 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id gw19-20020a170906f15300b0097404f4a124sm520959ejb.2.2023.07.27.01.59.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jul 2023 01:59:32 -0700 (PDT)
Message-ID: <777c616d-fd2b-b7d7-c6e6-6e374d42c5ae@redhat.com>
Date:   Thu, 27 Jul 2023 10:59:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [sailus-media-tree:master 10/20]
 drivers/media/i2c/imx290.c:1526:17: warning: incompatible integer to pointer
 conversion assigning to 'struct regmap *' from 'int'
Content-Language: en-US, nl
To:     kernel test robot <lkp@intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
        linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <202307271639.6vSx9BOA-lkp@intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <202307271639.6vSx9BOA-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On 7/27/23 10:16, kernel test robot wrote:
> tree:   git://linuxtv.org/sailus/media_tree.git master
> head:   215e4463b11d94668b841368cb6882f3a2968148
> commit: 51b1f81e3b15a4cf6c5c1bfd6bb14ff8bc9951fb [10/20] media: imx290: Convert to new CCI register access helpers
> config: arm-randconfig-r012-20230727 (https://download.01.org/0day-ci/archive/20230727/202307271639.6vSx9BOA-lkp@intel.com/config)
> compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
> reproduce: (https://download.01.org/0day-ci/archive/20230727/202307271639.6vSx9BOA-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202307271639.6vSx9BOA-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>    drivers/media/i2c/imx290.c:1526:19: error: implicit declaration of function 'devm_cci_regmap_init_i2c' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
>            imx290->regmap = devm_cci_regmap_init_i2c(client, 16);

This is caused by a mis-merge:

https://git.linuxtv.org/sailus/media_tree.git/commit/?id=51b1f81e3b15a4cf6c5c1bfd6bb14ff8bc9951fb

Shows that the "select V4L2_CCI_I2C" was added to the ADV748X Kconfig block instead of to the IMX290 block.

Regards,

Hans


p.s.

Thank you for merging this series.

