Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 25A0163A889
	for <lists+linux-media@lfdr.de>; Mon, 28 Nov 2022 13:38:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230501AbiK1MiX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 28 Nov 2022 07:38:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230397AbiK1MiW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Nov 2022 07:38:22 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7314D12094
        for <linux-media@vger.kernel.org>; Mon, 28 Nov 2022 04:38:21 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 29DA1B80C93
        for <linux-media@vger.kernel.org>; Mon, 28 Nov 2022 12:38:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9A09C433C1;
        Mon, 28 Nov 2022 12:38:17 +0000 (UTC)
Message-ID: <8da04d22-779e-42c4-e3e0-23f7dc63aecb@xs4all.nl>
Date:   Mon, 28 Nov 2022 13:38:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [GIT PULL FOR v6.2] Various fixes and enhancements
Content-Language: en-US
To:     "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Smitha T Murthy <smitha.t@samsung.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
References: <ac74fda5-4160-1cd7-4ce1-bb8ad64aed51@xs4all.nl>
 <Y4Sh7W1qlljoD7vf@zx2c4.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <Y4Sh7W1qlljoD7vf@zx2c4.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jason,

On 11/28/22 12:56, Jason A. Donenfeld wrote:
> On Mon, Nov 28, 2022 at 11:04:51AM +0100, Hans Verkuil wrote:
>> The following changes since commit 3ab848bea7790583674a0e08eb5f8c1553d07751:
>>
>>   media: dt-bindings: s5p-mfc: Add new compatible string for Exynos3250 SoC (2022-11-25 11:33:17 +0000)
>>
>> are available in the Git repository at:
>>
>>   git://linuxtv.org/hverkuil/media_tree.git tags/br-v6.2i
> 
>> Jason A. Donenfeld (1):
>>       media: stv0288: use explicitly signed char
> 
> If this is for 6.2, rather than as a bug fix for 6.1, then please drop
> it from this pull, and I'll include it as part of the pull of all of
> these -funsigned-char fixes for 6.2, per Linus' request.

OK, it's dropped in v2 of my PR.

> 
> Note that I sent this for 6.1 and followed up on it several times, but
> my emails went entirely ignored, and then today I found this in my inbox,
> not because I was CC'd but because my lore search matches on my last
> name. During that time, I regularly checked the linux-media tree to see
> if you had applied it silently, but that also wasn't the case. So I'm
> pretty sure the "confusion" here is entirely on you for ignoring emails
> and not communicating.

Mauro is extremely busy, so last week I've been going through older patches
and picked this one up. It would have gone in for v6.2 :-)

Regards,

	Hans

> 
> So, anyway, please remove this patch from your pull.
> 
> Thanks,
> Jason

