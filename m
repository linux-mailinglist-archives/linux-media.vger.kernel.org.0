Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 25CD86F3DFC
	for <lists+linux-media@lfdr.de>; Tue,  2 May 2023 08:58:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233018AbjEBG57 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 May 2023 02:57:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232991AbjEBG56 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 2 May 2023 02:57:58 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70CC6D7
        for <linux-media@vger.kernel.org>; Mon,  1 May 2023 23:57:56 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 51B99618AC
        for <linux-media@vger.kernel.org>; Tue,  2 May 2023 06:57:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5CC8C4339B;
        Tue,  2 May 2023 06:57:54 +0000 (UTC)
Message-ID: <f23204ec-ff42-5907-fa28-c1975a87f4e6@xs4all.nl>
Date:   Tue, 2 May 2023 08:57:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [BTTV] [FSL P50x0] [PASEMI] TV Time doesn't work anymore after
 dropping the overlay support
Content-Language: en-US
To:     Christian Zigotzky <chzigotzky@xenosoft.de>,
        linux-media@vger.kernel.org
Cc:     Darren Stevens <darren@stevens-zone.net>,
        mad skateman <madskateman@gmail.com>,
        "R.T.Dickinson" <rtd2@xtra.co.nz>
References: <94a617be-00b3-6dc8-eb7d-ae13c6fffae5@xenosoft.de>
 <cb82b6c1-035c-cc6b-2843-6b87ed6315ac@xenosoft.de>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <cb82b6c1-035c-cc6b-2843-6b87ed6315ac@xenosoft.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Christian,

On 01/05/2023 17:20, Christian Zigotzky wrote:
> Hello,
> 
> I created a patch for adding overlay support again. TV Time works without any problems again. [1]
> 
> Please find attached the patch for adding the removed overlay support back for BTTV cards.
> 
> Cheers,
> Christian
> 
> [1]
> - https://i.ibb.co/6NJmj1y/Kernel-6-4-alpha1-Power-PC.png
> - https://i.ibb.co/7rx0MyD/Kernel-6-4-alpha2-Power-PC.png
> 
> 
> On 26 April 2023 at 04:09 pm, Christian Zigotzky wrote:
>> Hello,
>>
>> TV Time doesn't work anymore on my Cyrus+ board with a FSL P50x0 PowerPC SoC [1] and on my P.A. Semi Nemo board [2] after dropping the overlay support [3]. It starts and then the whole computer
>> freezes.

I really don't want to put destructive overlay support back, it should not
be necessary. On an intel processor tvtime with bttv without overlay works
fine, so why doesn't it for these boards?

I wonder if it is a big vs little endian issue that crops up when there is
no overlay. At least, I assume these two boards are big endian?

Can you try to use v4l2-ctl to stream from bttv? E.g.: v4l2-ctl -d /dev/video0 --stream-mmap

If that works (note that this just captures without showing the output), then
the issue is likely with tvtime, not bttv. If v4l2-ctl fails, then try again
after applying this series:

https://patchwork.linuxtv.org/project/linux-media/cover/cover.1682995256.git.deborah.brouwer@collabora.com/

If it still fails, then there is likely a big endian problem in the bttv
driver that will need to be resolved.

If it is tvtime, then run with --verbose: hopefully that will give an indication
of which output driver it uses (Xv, DirectFB or SDL are the more likely candidates).

Note that I see no overlay support in the official tvtime repo:
https://git.linuxtv.org/tvtime.git/

It could be an output library that is handling that, though. But I need to know
how it is set up on the boards you use.

Regards,

	Hans

>>
>> I use the following BTTV cards.
>>
>> - WinTV Express with a BT878A chip
>> - Typhoon TView RDS + FM Stereo (BT878 chip)
>>
>> It would be really nice if we could get the overlay support back, because we love TV Time. [4]
>>
>> We use TV Time with connected TV receivers and game consoles.
>>
>> Thanks,
>> Christian
>>
>> [1] http://wiki.amiga.org/index.php?title=X5000
>> [2] https://en.wikipedia.org/wiki/AmigaOne_X1000
>> [3] https://patchwork.kernel.org/project/linux-media/patch/20230302125731.1124945-4-hverkuil-cisco@xs4all.nl/
>> [4] https://tvtime.sourceforge.net/

