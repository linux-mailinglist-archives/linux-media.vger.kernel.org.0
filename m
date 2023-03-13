Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1F0CD6B7A52
	for <lists+linux-media@lfdr.de>; Mon, 13 Mar 2023 15:28:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231365AbjCMO2u (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Mar 2023 10:28:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231343AbjCMO2t (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Mar 2023 10:28:49 -0400
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64C1624BE4
        for <linux-media@vger.kernel.org>; Mon, 13 Mar 2023 07:28:48 -0700 (PDT)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
        by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
        id 1pbjAK-0001IM-5U; Mon, 13 Mar 2023 15:28:44 +0100
Message-ID: <7ef0357c-1bd8-7598-4c4e-9d795b5f0abd@leemhuis.info>
Date:   Mon, 13 Mar 2023 15:28:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [GIT FIXES FOR v6.3] Venus fixes
Content-Language: en-US, de-DE
From:   Thorsten Leemhuis <regressions@leemhuis.info>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Javier Martinez Canillas <javierm@redhat.com>,
        Vikash Garodia <vgarodia@qti.qualcomm.com>,
        Linux kernel regressions list <regressions@lists.linux.dev>,
        linux-media@vger.kernel.org,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
References: <20230302060413.67239-1-stanimir.k.varbanov@gmail.com>
 <cb03d97f-ae48-4090-e14b-354373a2ebe3@leemhuis.info>
In-Reply-To: <cb03d97f-ae48-4090-e14b-354373a2ebe3@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1678717728;7352f37a;
X-HE-SMSGID: 1pbjAK-0001IM-5U
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 02.03.23 09:27, Linux regression tracking (Thorsten Leemhuis) wrote:
> On 02.03.23 07:04, Stanimir Varbanov wrote:
>>
>> This pull request includes a fix for regression in venus hardware reset.
>> The reverted commit has been merged in v6.2. 
>>
>> Please pull.

Mauro: any reason why this is still not pulled? It fixes a regression
that made it into 6.2 and the revert was now posted 34 days ago, hence
it would be good if this could finally go to Linus, so that it can be
backported to stable.

BTW, Stan: What...

>> The following changes since commit 3e62aba8284de0994a669d07983299242e68fe72:
>>
>>   media: imx-mipi-csis: Check csis_fmt validity before use (2023-02-26 11:21:33 +0100)
>>
>> are available in the Git repository at:
>>
>>   git://linuxtv.org/svarbanov/media_tree.git tags/tag-venus-fixes-for-v6.3
>>
>> for you to fetch changes up to 1440cfcf24db8c50d929d3c35ab6f87f868fa628:
>>
>>   Revert "venus: firmware: Correct non-pix start and end addresses" (2023-03-02 07:52:10 +0200)
>>
>> ----------------------------------------------------------------
>> Venus fixes for v6.3
>>
>> ----------------------------------------------------------------
>> Javier Martinez Canillas (1):
>>       Revert "venus: firmware: Correct non-pix start and end addresses"
> 
> Good to see that this finally is heading towards mainline, thx.
> 
> What about the other venus regression[1] Javier provided this patch for:
>
> https://patchwork.kernel.org/project/linux-media/patch/20230210081835.2054482-1-javierm@redhat.com/

...about this revert from Feb, 10th? There was some discussion recently,
but it would to get this finally resolved, too.

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
If I did something stupid, please tell me, as explained on that page.

#regzbot poke
#regzbot ignore-activity
