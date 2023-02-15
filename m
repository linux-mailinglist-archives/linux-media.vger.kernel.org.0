Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8D9E16976A3
	for <lists+linux-media@lfdr.de>; Wed, 15 Feb 2023 07:52:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233361AbjBOGwI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Feb 2023 01:52:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229551AbjBOGwH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Feb 2023 01:52:07 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE40034C10;
        Tue, 14 Feb 2023 22:52:06 -0800 (PST)
Received: from [192.168.1.15] (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 31C6627C;
        Wed, 15 Feb 2023 07:52:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1676443925;
        bh=HRfaLevOMzeMaksMeacMQFXPjO2lQc37hPbqgWcvB+g=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=Wvdgmz0gjkM1XGwgrBrd8hQt3ea755ko3fKMnNmrnvLXbG5U7iBcbQBHxl5h+uM1Y
         oLxi2iaBfT0jKvTT9kOq+c9hg99MmEMYEjAvETz06y3TrY7w9sBxFtH5sKBdApI80W
         3wLHLgzCG9+twXk4uBhILep96q6dk+RdcHSjfxLk=
Message-ID: <48dfcbb3-a281-b05e-f665-df76bee7e9f3@ideasonboard.com>
Date:   Wed, 15 Feb 2023 08:52:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3] media: renesas: vsp1: Add underrun debug print
Content-Language: en-US
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20230214164223.184920-1-tomi.valkeinen+renesas@ideasonboard.com>
 <Y+wH59GVBf1J5u8X@pendragon.ideasonboard.com>
From:   Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
In-Reply-To: <Y+wH59GVBf1J5u8X@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 15/02/2023 00:15, Laurent Pinchart wrote:
> Hi Tomi,
> 
> Thank you for the patch.
> 
> On Tue, Feb 14, 2023 at 06:42:23PM +0200, Tomi Valkeinen wrote:
>> Print underrun interrupts with ratelimited print.
>>
>> Note that we don't enable the underrun interrupt. If we have underruns,
>> we don't want to get flooded with interrupts about them. It's enough to
>> see that an underrun happened at the end of a frame.
>>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
>> ---
>>
>> Changes in v3:
>> - Reset underrun counter when enabling VSP
>>
>> I have to say I'm not familiar enough with the VSP driver to say if
>> these are the correct places where to reset the counters.
> 
> It's fine. We could factor it out to a clear function, but it's not
> worth it if there's nothing else to factor out. It could be done later.
> 
>> There's also a
>> possibility of a race, but my assumption is that we cannot get underrun
>> interrupts for the WPF we are currently enabling.
> 
> It should be fine.
> 
>> Also, I realized the underrun counter could be moved to struct
>> vsp1_rwpf, but as that's used also for RPF, I didn't do that change.
> 
> Another option would be to store it in the pipeline structure, as a
> pipeline has one and only one WPF. What do you think ?

Hmm, the pipe is allocated and assigned as needed, isn't it? So in the 
irq handler we might get an underflow with !pipe. We could skip the 
print in that case, of course.

Is a pipe allocated every time VSP is started? Or does the allocation 
normally happen only once? If the former, then if the counter was stored 
in the pipe, that would handle clearing the counter automatically.

  Tomi

