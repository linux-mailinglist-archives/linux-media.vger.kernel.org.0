Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19E3635A429
	for <lists+linux-media@lfdr.de>; Fri,  9 Apr 2021 18:58:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233577AbhDIQ6S (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Apr 2021 12:58:18 -0400
Received: from mail-pf1-f174.google.com ([209.85.210.174]:43993 "EHLO
        mail-pf1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233038AbhDIQ6R (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Apr 2021 12:58:17 -0400
Received: by mail-pf1-f174.google.com with SMTP id q5so4618328pfh.10
        for <linux-media@vger.kernel.org>; Fri, 09 Apr 2021 09:58:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=xxus+lkjOnk6WEuny5oPkaqxPJUAToEDH4J1GoMdhYo=;
        b=XmWLKLRFAi7tn7YTZp6quMg3SeIx0gpmHTsJdU7NgZlizPITSTVDDloyZx8sumfyso
         ceMGZ8+4/qG9tx5E1pIb4XHZZ9uX4J+KPBImeYxrliv6OwqwOTvWf1JCPm2hhKj083tJ
         iipIH4bOG8jNRV32rPbbTsNDjRbhhMjIcIh6QPju5K35nFs1DINR999QTq3QPaJifk53
         aiE4taror/aWacljBSyvbY/5nqx4fo4eVvJt6gCoQBgzsdBTp3QpqpRIZ8agabbl1uUy
         MVQpuHYVsA+9XPXH3gNiNbLvnJCuJMOrVUTDJ/2q9PUNL+mmv6V2Mwl6FHf9MDulEKmt
         vVeQ==
X-Gm-Message-State: AOAM531xRo8m0mbv5kWo/pa9Mwu8+KcN4LM/Z6EMbNam5kgdYay2zS7H
        cVjlNfxkX2YWXWk3L6HRxOQ=
X-Google-Smtp-Source: ABdhPJzWmNhuNYZdaU/Xc1cgRMcd6bYPxKG68nF1nBEfLT6XxHHHfbb1y6WS3sNn4x4uaH77k3P6tg==
X-Received: by 2002:a62:6546:0:b029:21f:4bea:3918 with SMTP id z67-20020a6265460000b029021f4bea3918mr13333208pfb.47.1617987484244;
        Fri, 09 Apr 2021 09:58:04 -0700 (PDT)
Received: from 42.do-not-panic.com (42.do-not-panic.com. [157.230.128.187])
        by smtp.gmail.com with ESMTPSA id b7sm2755387pfi.42.2021.04.09.09.58.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Apr 2021 09:58:03 -0700 (PDT)
Received: by 42.do-not-panic.com (Postfix, from userid 1000)
        id 997BA40256; Fri,  9 Apr 2021 16:58:02 +0000 (UTC)
Date:   Fri, 9 Apr 2021 16:58:02 +0000
From:   Luis Chamberlain <mcgrof@kernel.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Lukas Middendorf <kernel@tuxforce.de>, linux-media@vger.kernel.org,
        Antti Palosaari <crope@iki.fi>
Subject: Re: [PATCH 1/2] media: si2168: request caching of firmware to make
 it available on resume
Message-ID: <20210409165802.GG4332@42.do-not-panic.com>
References: <20200813214538.8474-1-kernel@tuxforce.de>
 <cec1f815-1505-869c-88ae-362c2a4bf0b4@tuxforce.de>
 <20210409132957.08d7c7bf@coco.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210409132957.08d7c7bf@coco.lan>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Apr 09, 2021 at 01:29:57PM +0200, Mauro Carvalho Chehab wrote:
> Em Thu, 1 Apr 2021 16:42:26 +0200
> Lukas Middendorf <kernel@tuxforce.de> escreveu:
> 
> > Hi,
> > 
> > I see this (or a similar fix) has not yet been included in 5.12-rc5.
> > Any further problems or comments regarding this patch? It still applies 
> > cleanly to current git master and the problem is still relevant.
> 
> Well, I fail to see why si2168 is so special that it would require it...
> 
> on a quick check, it sounds that there's just a single driver using this
> kAPI:
> 
> 	drivers/net/wireless/mediatek/mt7601u/mcu.c:            return firmware_request_cache(dev->dev, MT7601U_FIRMWARE);
> 
> while there are several drivers on media that require firmware.
> 
> Btw, IMHO, the better would be to reload the firmware at resume
> time, instead of caching it, just like other media drivers.

Mauro,

Here is the thing. If we have a race to a filesystem (it calls
submit_bio()) after resume but before thaw you can end up in
a situation where async read waits forever as the read never
hit hardware.

Fixing this is part of the work I had tried long ago by removing
the kthread freezer from filesystems [0] which allow proper
filesystem freeze/thaw during suspend / resume. I am picking
this work up in the meantime.

The firmware cache resolves these races by caching firmware
in case its needed on resume. However, if a driver never
actually had called request_firmware() upon bootup, then
the firmware was never cached and the call to request_firmware()
on resume will actually trigger a submit_bio().

In my tests the race does trigger a forever wait on XFS and btrfs, but
not on ext4. But in any case, I can put a stop gap to these issues
by issuing a try lock on the usermode helper lock prior to a direct
fs read, however that's just a hack, and preference is to just resolve
this by getting drivers to properly call request_firmware() before
thaw. The commit log for the one user you mentioned explains well why
that driver needed it, commit d723522b0be4 ("mt7601u: use
firmware_request_cache() to address cache on reboot") was added
since the device may sometimes retain the firmware on the hardware
device upon reboot, and in such case not trigger a request_firmware()
call on reboot on the driver side.

If such cases happen on other drivers, they can use that.

Its not clear to me from looking at the media APIs whether or not
all drivers are always properly calling the request_firmware() API
on suspend, prior to resume. If not that needs to be fixed.

  Luis
