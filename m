Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C5DB4EBE1F
	for <lists+linux-media@lfdr.de>; Wed, 30 Mar 2022 11:55:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245061AbiC3J5N (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Mar 2022 05:57:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245057AbiC3J5M (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Mar 2022 05:57:12 -0400
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [IPv6:2a01:488:42:1000:50ed:8234::])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4984986E3C;
        Wed, 30 Mar 2022 02:55:27 -0700 (PDT)
Received: from ip4d144895.dynamic.kabel-deutschland.de ([77.20.72.149] helo=[192.168.66.200]); authenticated
        by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
        id 1nZV2y-0006by-KS; Wed, 30 Mar 2022 11:55:24 +0200
Message-ID: <1fc02de2-890e-e8e8-0ab6-aba62a333de5@leemhuis.info>
Date:   Wed, 30 Mar 2022 11:55:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: Bug 215726 - si2157.c: mention name of the missing firmware file
Content-Language: en-US
To:     Robert Schlabbach <robert_s@gmx.net>
Cc:     Antti Palosaari <crope@iki.fi>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        chmooreck@gmail.com
References: <5f660108-8812-383c-83e4-29ee0558d623@leemhuis.info>
 <trinity-2ca61ae4-4f05-454d-94fd-d41e1afbec2f-1648581688394@3c-app-gmx-bs54>
From:   Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <trinity-2ca61ae4-4f05-454d-94fd-d41e1afbec2f-1648581688394@3c-app-gmx-bs54>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1648634127;7f8e3be1;
X-HE-SMSGID: 1nZV2y-0006by-KS
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 29.03.22 21:21, Robert Schlabbach wrote:
> 
> the patch linked in the bugzilla ticket:
> https://lore.kernel.org/linux-media/6f84b7f4-3ede-ae55-e99b-a9d4108c80e2@gmail.com/
> should indeed fix the issue.

Ahh, the comment mentioning it was added shortly after I sent my mail.
#regzbot monitor:
https://lore.kernel.org/linux-media/6f84b7f4-3ede-ae55-e99b-a9d4108c80e2@gmail.com/

Adding Piotr, the patches' author to the CC, who also replied.

BTW: that patch is afaics missing a Fixes tag specifying the culprit and
a `Cc: stable@vger.kernel.org # 5.17.x` tag to make sure it's quickly
backported to the stable tree, as among others explained here:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/handling-regressions.rst

> The error was that the rom_id and required
> fields were swapped in the table, so the non-zero rom_id was taken as a
> "true" required boolean value, thus incorrectly evaluating that the
> chip requires a firmware file to operate when in fact it does not.

> I have tested the patch and found it worked for me. But I do not know
> how to push this further along:
> https://patchwork.linuxtv.org/project/linux-media/patch/6f84b7f4-3ede-ae55-e99b-a9d4108c80e2@gmail.com/

Mauro, what's up here? The patch fixes a regression and thus afaics
should quickly find its way towards mainline to get it into the stable
tree, as explained in the (bran new) document linked above.

Ciao, Thorsten

> Gesendet: Dienstag, 29. März 2022 um 10:33 Uhr
> Von: "Thorsten Leemhuis" <regressions@leemhuis.info>
> An: "Antti Palosaari" <crope@iki.fi>, "Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>, "Robert Schlabbach" <robert_s@gmx.net>
> Cc: "regressions@lists.linux.dev" <regressions@lists.linux.dev>, az0123456@gmx.de, "Linux Media Mailing List" <linux-media@vger.kernel.org>, "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>
> Betreff: Bug 215726 - si2157.c: mention name of the missing firmware file
> Hi, this is your Linux kernel regression tracker.
> 
> I noticed a regression report in bugzilla.kernel.org that afaics nobody
> acted upon since it was reported about a week ago, that's why I decided
> to forward it to the lists and all people that seemed to be relevant
> here. To quote from https://bugzilla.kernel.org/show_bug.cgi?id=215726 :
> 
>> I get the following error messages when trying to use si2157.ko in linux 5.17:
>> si2157 13-0060: found a 'Silicon Labs Si2157-A30 ROM 0x50'
>> si2157 13-0060: Can't continue without a firmware
>> I did work in linux 5.16.16 without a firmware file. Unfortunately the driver does not tell me the name of the missing firmware file.
> 
> Could somebody take a look into this? Or was this discussed somewhere
> else already? Or even fixed?
> 
> 
