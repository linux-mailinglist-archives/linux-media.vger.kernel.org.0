Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 46BAE4B9E6F
	for <lists+linux-media@lfdr.de>; Thu, 17 Feb 2022 12:14:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238756AbiBQLOt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Feb 2022 06:14:49 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:40622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236104AbiBQLOs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Feb 2022 06:14:48 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B2172AEDB9
        for <linux-media@vger.kernel.org>; Thu, 17 Feb 2022 03:14:33 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 11F2CB8216A
        for <linux-media@vger.kernel.org>; Thu, 17 Feb 2022 11:14:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCA8AC340E8;
        Thu, 17 Feb 2022 11:14:29 +0000 (UTC)
Message-ID: <3192902d-b04a-d59a-aea5-1fbd31c20fef@xs4all.nl>
Date:   Thu, 17 Feb 2022 12:14:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: Kernel hangs after DVB patch from July 2021 with Hauppauge WinTV
 dualHD
Content-Language: en-US
To:     =?UTF-8?Q?Maximilian_B=c3=b6hm?= <maximilian.boehm@elbmurf.de>,
        Pavel Skripkin <paskripkin@gmail.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     sashal@kernel.org, linux-media@vger.kernel.org,
        Brad Love <brad@nextdimension.cc>
References: <6a72a37b-e972-187d-0322-16336e12bdc5@elbmurf.de>
 <20211218101519.756c027d@coco.lan>
 <45306193-deec-d1a3-d74d-41dc361b36d9@gmail.com>
 <e7c54b23-d163-ef33-3f62-c25b72e30aa8@elbmurf.de>
 <c6dcf627-047f-8726-0c4e-aa2a9ae12da9@gmail.com>
 <5c891c4a-7a02-18b7-c4c1-8429fcd3366f@elbmurf.de>
 <12440c22-9f69-740d-bcfd-3b6bf0e4dcc1@gmail.com>
 <23b3f65c-8f52-6109-d5ca-52ee12da6115@elbmurf.de>
 <afdd8f33-9d75-7e73-b7b6-a0363e316beb@gmail.com>
 <a0e25415-2db7-bea0-b00c-f1b4bf84d0d6@gmail.com>
 <a0ba3685-8c59-cb89-7f81-280c38a92c40@elbmurf.de>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <a0ba3685-8c59-cb89-7f81-280c38a92c40@elbmurf.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Maximilian,

On 20/01/2022 20:29, Maximilian Böhm wrote:
> Hey Pavel,
> 
> I would prefer reverting your use-after-free change. I’m still on Linux 5.15.2 to avoid this issue. I’m not sure if I understand your last mails correctly, did you already revert the change or did you
> just offer to do it? Anyway, reverting locally wouldn’t be feasible long-term.
> If I could help eliminating this bug, I would gladly offer my system for a remote hacking session via ssh or Teamviewer or try other patch ideas.

I wonder if this patch:

https://patchwork.linuxtv.org/project/linux-media/patch/20220122074500.429184-1-dzm91@hust.edu.cn/

is perhaps related to this issue? Can you test if this patch solves your issue?

If not, then I'll apply Pavel's revert patch for 5.18.

Regards,

	Hans

> 
> Btw, found this forum thread describing the same original problem (which is forcing me to use usbreset after standby) on Windows, so this probably is a bug in the tuner hardware, not in the Linux
> driver: https://www.dvbviewer.tv/forum/topic/63002-hauppauge-wintv-dualhd-stick-geht-oft-nicht-nach-standby/
> 
> If I were to submit an official "device quirk" for the Linux kernel, would it be affected of your use-after-free change too? Nobody knows, I guess?
> 
> Regards
> Maximilian Böhm
> 
> Am 06.01.22 um 12:57 schrieb Pavel Skripkin:
>>> Anyway, you can revert my patch locally and use your device. I
>>> understand, that this approach is the best one, but anyway revert will
>>                
>>                  ^^^^
>>
>> I've missed "not". Please, don't get me wrong :) Reverting something
>> locally to work with upstream device is never a good thing.
>>
>>
>>
>> With regards,
>> Pavel Skripkin

