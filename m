Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6CF846B6622
	for <lists+linux-media@lfdr.de>; Sun, 12 Mar 2023 14:10:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229649AbjCLNKW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 12 Mar 2023 09:10:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbjCLNKU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 12 Mar 2023 09:10:20 -0400
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D66C146097
        for <linux-media@vger.kernel.org>; Sun, 12 Mar 2023 06:10:19 -0700 (PDT)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
        by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
        id 1pbLSr-0002eF-Bo; Sun, 12 Mar 2023 14:10:17 +0100
Message-ID: <73bec5a8-98f7-5dca-3b34-cb6fe0b61249@leemhuis.info>
Date:   Sun, 12 Mar 2023 14:10:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 14/17] media: i2c: imx290: Initialize runtime PM before
 subdev
Content-Language: en-US, de-DE
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        regressions@lists.linux.dev, Guenter Roeck <linux@roeck-us.net>
References: <20230116144454.1012-1-laurent.pinchart@ideasonboard.com>
 <20230116144454.1012-15-laurent.pinchart@ideasonboard.com>
 <20230227175245.GA3728693@roeck-us.net>
From:   "Linux regression tracking (Thorsten Leemhuis)" 
        <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <20230227175245.GA3728693@roeck-us.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1678626619;f20dfb61;
X-HE-SMSGID: 1pbLSr-0002eF-Bo
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 27.02.23 18:52, Guenter Roeck wrote:
> On Mon, Jan 16, 2023 at 04:44:51PM +0200, Laurent Pinchart wrote:
>> Initializing the subdev before runtime PM means that no subdev
>> initialization can interact with the runtime PM framework. This can be
>> problematic when modifying controls, as the .s_ctrl() handler commonly
>> calls pm_runtime_get_if_in_use(). These code paths are not trivial,
>> making the driver fragile and possibly causing subtle bugs.
>>
>> To make the subdev initialization more robust, initialize runtime PM
>> first.
>>
>> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>> Acked-by: Alexander Stein <alexander.stein@ew.tq-group.com>
>> ---
> 
> This patch results in
> 
> Error log:
> <stdin>:1517:2: warning: #warning syscall clone3 not implemented [-Wcpp]
> drivers/media/i2c/imx290.c:1090:12: error: 'imx290_runtime_suspend' defined but not used [-Werror=unused-function]
>  1090 | static int imx290_runtime_suspend(struct device *dev)
>       |            ^~~~~~~~~~~~~~~~~~~~~~
> drivers/media/i2c/imx290.c:1082:12: error: 'imx290_runtime_resume' defined but not used [-Werror=unused-function]
>  1082 | static int imx290_runtime_resume(struct device *dev)
> 
> if PM runtime support is disabled( alpha:allmodconfig, csky:allmodconfig,
> and others).

Looks like Guenter never got a reply, but from a recent kernelci report
it looks like above warning still happens:
https://lore.kernel.org/all/640bceb7.a70a0220.af8cd.146b@mx.google.com/

Laurent, do you still have it on your radar?

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
If I did something stupid, please tell me, as explained on that page.

#regzbot poke
