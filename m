Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE5894886C6
	for <lists+linux-media@lfdr.de>; Sat,  8 Jan 2022 23:33:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234942AbiAHWdh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 8 Jan 2022 17:33:37 -0500
Received: from dfw.source.kernel.org ([139.178.84.217]:43482 "EHLO
        dfw.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229899AbiAHWdh (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 8 Jan 2022 17:33:37 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 1BC1860E8C
        for <linux-media@vger.kernel.org>; Sat,  8 Jan 2022 22:33:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACE8CC36AE9;
        Sat,  8 Jan 2022 22:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1641681216;
        bh=lE0J8q/dkhaiPBpvvFs6h0fzYvZj9RQpcxwnH+n4glc=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=tUquw66uH4k4FUBrJwsu0XnTpBpVLfBluYWEg+I0Jk72zm8Bd+Rwhs/qQg5HbbgEp
         PW+95dxkzdUGM8my1UwTqo7RrkQRsDkHF6gDLlPENrNvlzFz57lcpmMSIjfjEayEYE
         8IbAXXX1UecmZ/ngZRlH4b4fV+GBgsLL7k6pfbJqu+VOcQ8RhSHHV06XuxHOmMRi2h
         NYpVskbY6agg+7MQz3eoI6D+4F8uAKfBpSUyTi+yS821gjG6tKYbKe4VyBI17zDI4B
         VM+zldYC76yGPbEvMpGGLdEEhiltHFhxG0ZDfFdm/zGL6YqXBbVOl614Bw5H0HwPZ0
         Xp4cHVr3IC2LQ==
Date:   Sat, 8 Jan 2022 23:33:32 +0100
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Adam Stylinski <kungfujesus06@gmail.com>
Cc:     linux-media@vger.kernel.org
Subject: Re: DVB mmap API
Message-ID: <20220108233326.364c1edf@coco.lan>
In-Reply-To: <CAJwHY9W2ewhq7oUvgxUZpMJ77=9J=JavG=P2Q1pZC0b1XZiriw@mail.gmail.com>
References: <CAJwHY9W2ewhq7oUvgxUZpMJ77=9J=JavG=P2Q1pZC0b1XZiriw@mail.gmail.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Sat, 8 Jan 2022 12:34:59 -0500
Adam Stylinski <kungfujesus06@gmail.com> escreveu:

> Hello,
> 
> I'm probably just looking for a project of unnecessary complexity to
> take on but I couldn't help but notice there's been driver support for
> mmap on DVB devices in the Linux kernel now for a pretty long time.  I
> also noticed that it's been marked experimental since inception and
> that nothing seems to use it or have a real example of it for the DVB
> spec (v4lutils' dvb wrappers included).  Is there a grave reason this
> thing is still marked experimental?  It seems in theory like a good
> way to prevent context switches.

There's no grave reason why it is marked as experimental... it is just
that userspace apps don't use it yet, except for dvbv5-zap, when passing
an extra option to enable it.

> I'm nearly considering experimenting with modifying mythtv's DVB
> demuxing, tuning, and streaming routines to use this.  Not because I
> need to, mind you, it's just an ancient system and I'm trying to
> prevent every ounce of the occasional hiccup that happens.
> 
> https://www.kernel.org/doc/html/v5.15/userspace-api/media/dvb/dmx-mmap.html

It would be nice if MythTV and other apps would support MMAP.

If you have time, and want to do that, It sounds great to me.
You could also add support for it on Kaffeine - with already uses
libdvbv5 - so maybe it could be simpler to add support for it too.

Anyway, from my side it sounds welcomed to have userspace apps using
it. Once we have some application using it for a couple Kernel versions,
I guess I could just remove "experimental" from the Kernel drivers.

Thanks,
Mauro
