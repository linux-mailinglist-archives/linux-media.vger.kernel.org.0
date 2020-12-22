Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4D622E0E94
	for <lists+linux-media@lfdr.de>; Tue, 22 Dec 2020 20:13:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726452AbgLVTMP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Dec 2020 14:12:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726246AbgLVTMO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Dec 2020 14:12:14 -0500
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net [IPv6:2605:2700:0:5::4713:9cab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 793A7C0613D3;
        Tue, 22 Dec 2020 11:11:34 -0800 (PST)
Received: from hatter.bewilderbeest.net (unknown [IPv6:2600:6c44:7f:ba20:1c66:ab2d:5a3:5a9e])
        (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: zev)
        by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 82E95806F7;
        Tue, 22 Dec 2020 11:11:32 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 thorn.bewilderbeest.net 82E95806F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
        s=thorn; t=1608664293;
        bh=Jb/eAFSraSSe36siZ7ttAXCaK7RraW2W9WezyRTcKok=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Sk0oHyGomWoDAgtkbg4sxv04aqH/T0JleemSI5w3FSx4IJ3NE5tXh5SFnGXLkVA6Q
         AV0eQ4POcVPhHYLiYdk8F2e5IIJncPdXAQxiMOBJAGMykwiLq+dpDtmOVtKEnQRlLZ
         iRLfUqQ8ezNnqoOc/QkWL3H8UR6VaAnBJkt1g19Q=
Date:   Tue, 22 Dec 2020 13:11:26 -0600
From:   Zev Weiss <zev@bewilderbeest.net>
To:     Joel Stanley <joel@jms.id.au>
Cc:     Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
        Ryan Chen <ryan_chen@aspeedtech.com>,
        Eddie James <eajames@linux.ibm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andrew Jeffery <andrew@aj.id.au>, linux-media@vger.kernel.org,
        OpenBMC Maillist <openbmc@lists.ozlabs.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-aspeed <linux-aspeed@lists.ozlabs.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/3] aspeed-video: add error message for unhandled
 interrupts
Message-ID: <20201222191126.uh3psmc4l74dulwb@hatter.bewilderbeest.net>
References: <20201215024542.18888-1-zev@bewilderbeest.net>
 <20201215024542.18888-2-zev@bewilderbeest.net>
 <CACPK8XfPCjBbjM2V1oiD=di6MD6ewJs0NFewA0=kZfx_eL29gQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CACPK8XfPCjBbjM2V1oiD=di6MD6ewJs0NFewA0=kZfx_eL29gQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Dec 21, 2020 at 10:34:26PM CST, Joel Stanley wrote:
>On Tue, 15 Dec 2020 at 02:46, Zev Weiss <zev@bewilderbeest.net> wrote:
>>
>> Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
>> ---
>>  drivers/media/platform/aspeed-video.c | 5 +++++
>>  1 file changed, 5 insertions(+)
>>
>> diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
>> index 7d98db1d9b52..eb02043532e3 100644
>> --- a/drivers/media/platform/aspeed-video.c
>> +++ b/drivers/media/platform/aspeed-video.c
>> @@ -562,6 +562,7 @@ static irqreturn_t aspeed_video_irq(int irq, void *arg)
>>  {
>>         struct aspeed_video *video = arg;
>>         u32 sts = aspeed_video_read(video, VE_INTERRUPT_STATUS);
>> +       u32 orig_sts = sts;
>>
>>         /*
>>          * Resolution changed or signal was lost; reset the engine and
>> @@ -639,6 +640,10 @@ static irqreturn_t aspeed_video_irq(int irq, void *arg)
>>         if (sts & VE_INTERRUPT_FRAME_COMPLETE)
>>                 sts &= ~VE_INTERRUPT_FRAME_COMPLETE;
>>
>> +       if (sts)
>> +               dev_err_ratelimited(video->dev, "unexpected interrupt asserted:"
>> +                                   " sts=%08x, orig_sts=%08x", sts, orig_sts);
>
>Do you want to do this before clearing the FRAME and CAPTURE bits?
>

My intent was to only issue the message for unexpectedly-asserted 
interrupts that aren't among the ones already known to happen despite 
being disabled -- basically just indicating that a new bit might need to 
be added to the spurious-interrupt mask added in the second patch.  (I 
included the orig_sts element in case there's any useful debugging 
information to be gleaned from what other interrupts got asserted along 
with it, which would also include FRAME, CAPTURE, and any others 
explicitly cleared.)

And incidentally, in the handful of instances I captured in which this 
problem arose, it seemed to be "sticky" in that it continued occurring 
on every frame until the device was reset, so it seems like it would be 
likely to lead to a fair amount of log spam for a condition where it's 
basically just "we're ignoring known misbehavior" and there's not much 
else to do about it.


Zev

