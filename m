Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C96DE35A888
	for <lists+linux-media@lfdr.de>; Sat, 10 Apr 2021 00:02:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234602AbhDIWC0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Apr 2021 18:02:26 -0400
Received: from mail.tuxforce.de ([84.38.66.179]:37464 "EHLO mail.tuxforce.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234079AbhDIWCZ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 9 Apr 2021 18:02:25 -0400
Received: from [IPv6:2001:4dd5:b099:0:19b2:6b8c:f4bb:b22d] (2001-4dd5-b099-0-19b2-6b8c-f4bb-b22d.ipv6dyn.netcologne.de [IPv6:2001:4dd5:b099:0:19b2:6b8c:f4bb:b22d])
        by mail.tuxforce.de (Postfix) with ESMTPSA id 8158F52008B;
        Sat, 10 Apr 2021 00:02:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.tuxforce.de 8158F52008B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tuxforce.de;
        s=202009; t=1618005730;
        bh=e8mgnCm/9H29t4+D5TyoOos3P0dmVplwktxxbmf+DeY=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=kj3xdw/vMYkJ1hvKCaTk4zMDqc109LbSa5sSKB8VH3nRbVsqY+8fjlwfMN5Ru9PBZ
         OdLOGFCvOC5FaszLn44MjVMrZEdYfW6TPEUrGs42NBcN1f49jeTku3FisSWI9SSYK2
         asBXMlJ6gBf+Xgru/98oFf32NkTJYaaxql7UFLOpU0v21bWgeJCBjUucx6fPESuzSE
         +PkGBhDGWLCuo+kKt5ZjdXqkpWq7EeW9eTSsQWiaCKqOHutEKDusQZbPb2YvlPQdrK
         3HZazYxOY+6fbC3ppFwnheV3il8oSrSd0Dd3J9Zya/Uw0L20RrnWGwSq3nZ54SFC5K
         HKbirN3CskFSw==
Subject: Re: [PATCH 1/2] media: si2168: request caching of firmware to make it
 available on resume
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, Antti Palosaari <crope@iki.fi>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Lukas Middendorf <kernel@tuxforce.de>
References: <20200813214538.8474-1-kernel@tuxforce.de>
 <cec1f815-1505-869c-88ae-362c2a4bf0b4@tuxforce.de>
 <20210409132957.08d7c7bf@coco.lan>
From:   Lukas Middendorf <kernel@tuxforce.de>
Message-ID: <e6344feb-00ec-0955-67af-02f0331e8719@tuxforce.de>
Date:   Sat, 10 Apr 2021 00:02:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210409132957.08d7c7bf@coco.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 09/04/2021 13:29, Mauro Carvalho Chehab wrote:
> Well, I fail to see why si2168 is so special that it would require it...

The special case here is that si2168 does (try to) load the firmware for 
the first time during resume. Most other drivers that use firmware do it 
for the first time at boot (or when connecting the device) and therefore 
will automatically have their firmware cached for use on resume.

> on a quick check, it sounds that there's just a single driver using this
> kAPI:
> 
> 	drivers/net/wireless/mediatek/mt7601u/mcu.c:            return firmware_request_cache(dev->dev, MT7601U_FIRMWARE);
> 
> while there are several drivers on media that require firmware.

Any other driver that might load the firmware for the first time during 
resume also has to be fixed. On a quick glance it looks like the si2165 
for example might have the same problem. I think that at least all dvb 
frontends which load the firmware in init callback but not during probe 
are problematic.

The possible patch with the usermode helper lock by Luis causes uncached 
firmware loading on resume to fail very noisily instead of just stalling 
the system. That would show up other non-conformant drivers. There 
likely would be some more bug reports coming in from users which dislike 
the backtraces coming up in dmesg. You will likely want to fix the 
drivers before that happens.
The fact that this bug is only exposed now that btrfs is seeing more 
wide spread adoption does not make it less of a bug.

> Btw, IMHO, the better would be to reload the firmware at resume
> time, instead of caching it, just like other media drivers.

Loading the firmware on resume without it being cached is exactly what 
causes problems (see Luis' explanation). The caching is set up 
implicitly if the normal request_firmware() is used before suspend. The 
firmware does not stay in cache permanently. The firmware is just cached 
by the firmware loader api during suspend and cleaned again at the end 
of resume when proper file system access is possible again.

A really better solution would be to not load the firmware on resume in 
case it has not been previously loaded to the device (or not load it at 
all on resume since playback has to be restarted after suspend anyway). 
But it seems like the same init callback of the si2168 driver is called 
both at resume and when the device is being used and therefore does not 
easily allow for this. Likely the dvb_frontend api would have to be 
extended to have a separate callback for resume.
