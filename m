Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 790314FB5A2
	for <lists+linux-media@lfdr.de>; Mon, 11 Apr 2022 10:09:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239038AbiDKIMA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 Apr 2022 04:12:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235172AbiDKIL7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 Apr 2022 04:11:59 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FA312ED6C
        for <linux-media@vger.kernel.org>; Mon, 11 Apr 2022 01:09:43 -0700 (PDT)
Received: from [192.168.1.111] (91-156-85-209.elisa-laajakaista.fi [91.156.85.209])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 42B2230C;
        Mon, 11 Apr 2022 10:09:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1649664581;
        bh=9MyKLZuGd2/XtaP89i5RgMVgdqoqfUhVQaKUkyNHSZg=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=UScO1zUAIHe4NG0Eg+HDhheobqzu3zRqhp7EOcjf+3mEuR8MvpNDAsp/2oRHSLUKR
         DRTLPGT72J9xm344r8ZsIxCC022VYxnCD1MrQ5f2bYjLziaFZhpEZ4Nr9Ka3LL1Mjy
         Zn3cc/TBo+fQx0RRECU5PvYmUlr/XgaRi5hPhrjA=
Message-ID: <745a501e-8e9f-550c-c45c-333de731bb68@ideasonboard.com>
Date:   Mon, 11 Apr 2022 11:09:38 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [sailus-media-tree:master 28/30]
 drivers/media/v4l2-core/v4l2-subdev.c:342:1: error: implicit declaration of
 function 'v4l2_subdev_lock_and_get_active_state' is invalid in C99
Content-Language: en-US
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org
References: <202204090350.ZbhpomcE-lkp@intel.com>
 <YlCsnbp3oftzLyfz@paasikivi.fi.intel.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <YlCsnbp3oftzLyfz@paasikivi.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 09/04/2022 00:43, Sakari Ailus wrote:
> Moi,
> 
> On Sat, Apr 09, 2022 at 04:09:35AM +0800, kernel test robot wrote:
>> tree:   git://linuxtv.org/sailus/media_tree.git master
>> head:   bd1d801f302289ddbf86ff6c38fcc91aef8e7609
>> commit: 3f1a6a471c6a8b5ba772cb82538ad03fa0255e7c [28/30] media: subdev: add locking wrappers to subdev op wrappers
>> config: arm-randconfig-r022-20220408 (https://download.01.org/0day-ci/archive/20220409/202204090350.ZbhpomcE-lkp@intel.com/config)
>> compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c29a51b3a257908aebc01cd7c4655665db317d66)
>> reproduce (this is a W=1 build):
>>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>>          chmod +x ~/bin/make.cross
>>          # install arm cross compiling tool for clang build
>>          # apt-get install binutils-arm-linux-gnueabi
>>          git remote add sailus-media-tree git://linuxtv.org/sailus/media_tree.git
>>          git fetch --no-tags sailus-media-tree master
>>          git checkout 3f1a6a471c6a8b5ba772cb82538ad03fa0255e7c
>>          # save the config file to linux build tree
>>          mkdir build_dir
>>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/media/v4l2-core/
>>
>> If you fix the issue, kindly add following tag as appropriate
>> Reported-by: kernel test robot <lkp@intel.com>
>>
>> All error/warnings (new ones prefixed by >>):
>>
>>>> drivers/media/v4l2-core/v4l2-subdev.c:342:1: error: implicit declaration of function 'v4l2_subdev_lock_and_get_active_state' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
>>     DEFINE_STATE_WRAPPER(get_fmt, struct v4l2_subdev_format);
>>     ^
>>     drivers/media/v4l2-core/v4l2-subdev.c:335:12: note: expanded from macro 'DEFINE_STATE_WRAPPER'
>>                             state = v4l2_subdev_lock_and_get_active_state(sd); \
> 
> I guess this happens if MC is disabled? Maybe something else, too?

I looked at this and while I can "fix" this easily by dropping the 
wrapper for !MC, I feel I'm a bit confused what features are supported 
depending on the kconfig. And this is important for the streams API too.

So we always have v4l2-subdev when media framework is enabled. On top of 
that, we may have CONFIG_MEDIA_CONTROLLER, which adds media controller, 
links, pads. And on top of that we may have CONFIG_VIDEO_V4L2_SUBDEV_API 
which adds the uAPI for subdevs.

Is the following correct, and is there something important missing from 
below:

No CONFIG_MEDIA_CONTROLLER (and thus no CONFIG_VIDEO_V4L2_SUBDEV_API):

- Have struct v4l2_subdev_pad_ops, although we don't have pads. What 
does it mean to call a pad op if there are no pads? Or do we have pads, 
but it's just a subdev driver internal decision on how to handle a pad 
op for, say, pad 2?

- Have struct v4l2_subdev_state, as it's required by 
v4l2_subdev_pad_ops, but afaics state is always NULL. And the state 
contains pad configs, and we don't have pads, so if !MC we don't have 
state in practice.

- If the above if true, should we hide struct v4l2_subdev_state behind 
CONFIG_MEDIA_CONTROLLER, and just do "struct v4l2_subdev_state;", so 
that null state pointers would compile? It would reveal any accidental 
uses of the state if !MC.

CONFIG_MEDIA_CONTROLLER:
- Adds pads
- Adds active state

CONFIG_VIDEO_V4L2_SUBDEV_API:
- Adds try state
- Adds subdev ioctls

  Tomi
