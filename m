Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A2D696A7C93
	for <lists+linux-media@lfdr.de>; Thu,  2 Mar 2023 09:27:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229486AbjCBI1c (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Mar 2023 03:27:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229447AbjCBI1b (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Mar 2023 03:27:31 -0500
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71E3538656
        for <linux-media@vger.kernel.org>; Thu,  2 Mar 2023 00:27:30 -0800 (PST)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
        by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
        id 1pXeHg-0003NJ-JS; Thu, 02 Mar 2023 09:27:28 +0100
Message-ID: <cb03d97f-ae48-4090-e14b-354373a2ebe3@leemhuis.info>
Date:   Thu, 2 Mar 2023 09:27:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [GIT FIXES FOR v6.3] Venus fixes
Content-Language: en-US, de-DE
To:     Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        linux-media@vger.kernel.org
References: <20230302060413.67239-1-stanimir.k.varbanov@gmail.com>
From:   "Linux regression tracking (Thorsten Leemhuis)" 
        <regressions@leemhuis.info>
Cc:     Javier Martinez Canillas <javierm@redhat.com>,
        Vikash Garodia <vgarodia@qti.qualcomm.com>,
        Linux kernel regressions list <regressions@lists.linux.dev>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <20230302060413.67239-1-stanimir.k.varbanov@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1677745650;0a88d297;
X-HE-SMSGID: 1pXeHg-0003NJ-JS
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 02.03.23 07:04, Stanimir Varbanov wrote:
> 
> This pull request includes a fix for regression in venus hardware reset.
> The reverted commit has been merged in v6.2. 
> 
> Please pull.
> 
> regards,
> Stan
> 
> The following changes since commit 3e62aba8284de0994a669d07983299242e68fe72:
> 
>   media: imx-mipi-csis: Check csis_fmt validity before use (2023-02-26 11:21:33 +0100)
> 
> are available in the Git repository at:
> 
>   git://linuxtv.org/svarbanov/media_tree.git tags/tag-venus-fixes-for-v6.3
> 
> for you to fetch changes up to 1440cfcf24db8c50d929d3c35ab6f87f868fa628:
> 
>   Revert "venus: firmware: Correct non-pix start and end addresses" (2023-03-02 07:52:10 +0200)
> 
> ----------------------------------------------------------------
> Venus fixes for v6.3
> 
> ----------------------------------------------------------------
> Javier Martinez Canillas (1):
>       Revert "venus: firmware: Correct non-pix start and end addresses"

Good to see that this finally is heading towards mainline, thx.

What about the other venus regression[1] Javier provided this patch for:

https://patchwork.kernel.org/project/linux-media/patch/20230210081835.2054482-1-javierm@redhat.com/

[1] as pointed out earlier in
https://lore.kernel.org/all/87edq9hj4w.fsf@minerva.mail-host-address-is-not-set/

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
If I did something stupid, please tell me, as explained on that page.

#regzbot ^backmonitor:
https://lore.kernel.org/all/20230207102254.1446461-1-javierm@redhat.com/
