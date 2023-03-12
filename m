Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C4646B670A
	for <lists+linux-media@lfdr.de>; Sun, 12 Mar 2023 15:00:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229877AbjCLOAE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 12 Mar 2023 10:00:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229846AbjCLOAD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 12 Mar 2023 10:00:03 -0400
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 288FD34F60
        for <linux-media@vger.kernel.org>; Sun, 12 Mar 2023 07:00:02 -0700 (PDT)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
        by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
        id 1pbMEy-0003SN-7U; Sun, 12 Mar 2023 15:00:00 +0100
Message-ID: <79488ad7-5709-235b-14b4-1518e989c7a3@leemhuis.info>
Date:   Sun, 12 Mar 2023 14:59:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 14/17] media: i2c: imx290: Initialize runtime PM before
 subdev
Content-Language: en-US, de-DE
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Linux regressions mailing list <regressions@lists.linux.dev>
Cc:     linux-media@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Guenter Roeck <linux@roeck-us.net>
References: <20230116144454.1012-1-laurent.pinchart@ideasonboard.com>
 <20230116144454.1012-15-laurent.pinchart@ideasonboard.com>
 <20230227175245.GA3728693@roeck-us.net>
 <73bec5a8-98f7-5dca-3b34-cb6fe0b61249@leemhuis.info>
 <20230312133435.GI2545@pendragon.ideasonboard.com>
From:   "Linux regression tracking (Thorsten Leemhuis)" 
        <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <20230312133435.GI2545@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1678629602;7094daa0;
X-HE-SMSGID: 1pbMEy-0003SN-7U
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 12.03.23 14:34, Laurent Pinchart wrote:
> On Sun, Mar 12, 2023 at 02:10:16PM +0100, Linux regression tracking (Thorsten Leemhuis) wrote:
>> On 27.02.23 18:52, Guenter Roeck wrote:
>>> On Mon, Jan 16, 2023 at 04:44:51PM +0200, Laurent Pinchart wrote:
>>>> Initializing the subdev before runtime PM means that no subdev
>>>> initialization can interact with the runtime PM framework. This can be
>>>> problematic when modifying controls, as the .s_ctrl() handler commonly
>>>> calls pm_runtime_get_if_in_use(). These code paths are not trivial,
>>>> making the driver fragile and possibly causing subtle bugs.
>>>>
>>>> To make the subdev initialization more robust, initialize runtime PM
>>>> first.
>>>>
>>>> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>>>> Acked-by: Alexander Stein <alexander.stein@ew.tq-group.com>
>>>> ---
>>>
>>> This patch results in
>>>
>>> Error log:
>>> <stdin>:1517:2: warning: #warning syscall clone3 not implemented [-Wcpp]
>>> drivers/media/i2c/imx290.c:1090:12: error: 'imx290_runtime_suspend' defined but not used [-Werror=unused-function]
>>>  1090 | static int imx290_runtime_suspend(struct device *dev)
>>>       |            ^~~~~~~~~~~~~~~~~~~~~~
>>> drivers/media/i2c/imx290.c:1082:12: error: 'imx290_runtime_resume' defined but not used [-Werror=unused-function]
>>>  1082 | static int imx290_runtime_resume(struct device *dev)
>>>
>>> if PM runtime support is disabled( alpha:allmodconfig, csky:allmodconfig,
>>> and others).
>>
>> Looks like Guenter never got a reply, but from a recent kernelci report
>> it looks like above warning still happens:
>> https://lore.kernel.org/all/640bceb7.a70a0220.af8cd.146b@mx.google.com/
>>
>> Laurent, do you still have it on your radar?
> 
> I don't. Arnd has sent a fix
> (https://lore.kernel.org/linux-media/20230207161316.293923-1-arnd@kernel.org),
> I've reviewed it, now I expect Sakari to pick it up and get it upstream.

Ahh, great, thx for taking the time and letting me know, much appreciated.

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
If I did something stupid, please tell me, as explained on that page.

P.S.: update the status

#regzbot monitor:
https://lore.kernel.org/linux-media/20230207161316.293923-1-arnd@kernel.org/
#regzbot fix: media: i2c: imx290: fix conditional function defintions
#regzbot ignore-activity
