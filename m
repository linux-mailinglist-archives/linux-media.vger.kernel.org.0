Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 78291764EE8
	for <lists+linux-media@lfdr.de>; Thu, 27 Jul 2023 11:12:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233840AbjG0JMj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Jul 2023 05:12:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233766AbjG0JMW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Jul 2023 05:12:22 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4368B2D75
        for <linux-media@vger.kernel.org>; Thu, 27 Jul 2023 01:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1690448240;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=3nkc4+dPbAiWFlEGHXf8u9z3FP9uwQsYJ7g6Duaf3to=;
        b=eEpGjFGO4BdJdjp8En//eo6koMmydEL6oGDckCAe95gFzexiVHAWwTEHdZVOsl0PGymWwh
        zDWojfADaKu88x7tzozvXXi87ftXQDp5cMlFrXwMytSJJlpK+ySCaEtEN6pjTGmaJE4LmO
        uaDnVyHy5fdcf3taRzKI/wjM7QVeLkw=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-686-cq3rFxh-ME-cGZjeVJECog-1; Thu, 27 Jul 2023 04:57:19 -0400
X-MC-Unique: cq3rFxh-ME-cGZjeVJECog-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-94f7a2b21fdso42335266b.2
        for <linux-media@vger.kernel.org>; Thu, 27 Jul 2023 01:57:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690448238; x=1691053038;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3nkc4+dPbAiWFlEGHXf8u9z3FP9uwQsYJ7g6Duaf3to=;
        b=CiAuGr3WUNIts2/S/AFRgLHadwSQmIUdLh40mUaOuEhZ5aLTaFkqyzgfhCTyY41WyP
         NstojCdZgb7ep+np9jxVsZDzVXpWJkdMmIUtkBdzxWy0+diPH+cBKClFTONHijoKTaAS
         MiOpATqSxxLyJwLZSvrPsRdj+xgjVsDKmHsOpbIaxSEFLl+Dc0uLQv+DNuk+lQhC8Zmt
         Z/7VGuKKDALwln3kp4BqdXCd3mJkX8z3vHdJ9gRMkM+7bR6YPo2f7/bxKif+97GiDSNC
         4DyGIBQT2QYixvIbIp1NZDDkMXSL28yOP472OjzcVFuNwduuLfMPOonEddY7V/vdZm+A
         qMeg==
X-Gm-Message-State: ABy/qLbUc2567Trkd3f6Y12y7bnGgRCs4j7XQED4fz+LJJvp0M+qiTM9
        qMdnh/vM8R0ZGEQE0ONQJkvppMM+xC8g4uFrMZEytQH8kFLIyVwlDcOngc6JK9IdvyVZDwcQFY1
        konbbLqIxwpGymQgsPEu7ngCINGPFmY8=
X-Received: by 2002:a17:906:3199:b0:99b:bc51:8ca7 with SMTP id 25-20020a170906319900b0099bbc518ca7mr1399109ejy.1.1690448237884;
        Thu, 27 Jul 2023 01:57:17 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHSOArl/JjslRsGcr8fTQsEq6JU7jG+dwRs1XY5LKKsjHOmIYRb+FeOHRJ5Kvdr9+tYv5rEaw==
X-Received: by 2002:a17:906:3199:b0:99b:bc51:8ca7 with SMTP id 25-20020a170906319900b0099bbc518ca7mr1399101ejy.1.1690448237625;
        Thu, 27 Jul 2023 01:57:17 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id gy26-20020a170906f25a00b00992b7ff3993sm506316ejb.126.2023.07.27.01.57.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jul 2023 01:57:16 -0700 (PDT)
Message-ID: <8848c668-4736-a478-a277-e0cf1aa96ad4@redhat.com>
Date:   Thu, 27 Jul 2023 10:57:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [sailus-media-tree:master 9/20]
 drivers/media/i2c/ov5693.c:1280:17: warning: incompatible integer to pointer
 conversion assigning to 'struct regmap *' from 'int'
Content-Language: en-US, nl
To:     kernel test robot <lkp@intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
        linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <202307271517.dPa1bTSi-lkp@intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <202307271517.dPa1bTSi-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On 7/27/23 09:34, kernel test robot wrote:
> tree:   git://linuxtv.org/sailus/media_tree.git master
> head:   215e4463b11d94668b841368cb6882f3a2968148
> commit: 6ca0d78da91133ec78ecfbdaa7d066849b1b0c0c [9/20] media: ov5693: Convert to new CCI register access helpers
> config: arm-randconfig-r012-20230727 (https://download.01.org/0day-ci/archive/20230727/202307271517.dPa1bTSi-lkp@intel.com/config)
> compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
> reproduce: (https://download.01.org/0day-ci/archive/20230727/202307271517.dPa1bTSi-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202307271517.dPa1bTSi-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>    drivers/media/i2c/ov5693.c:1280:19: error: implicit declaration of function 'devm_cci_regmap_init_i2c' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
>            ov5693->regmap = devm_cci_regmap_init_i2c(client, 16);

This is caused by a mis-merge:

https://git.linuxtv.org/sailus/media_tree.git/commit/?id=6ca0d78da91133ec78ecfbdaa7d066849b1b0c0c

Shows that the "select V4L2_CCI_I2C" was added to the DW9768 Kconfig block instead of to the OV5693 block.

Regards,

Hans



