Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 503841C82C
	for <lists+linux-media@lfdr.de>; Tue, 14 May 2019 14:05:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726332AbfENMFg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 May 2019 08:05:36 -0400
Received: from casper.infradead.org ([85.118.1.10]:40108 "EHLO
        casper.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726279AbfENMFg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 May 2019 08:05:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=ltcpjB0bFV22YP0JdXBysZbD9UpoeMR1HkwpICyttcs=; b=plQd8oV1wLELb0cW23y4/R8HvU
        eBt83b0mavQvcxT5czvElraIcQxU27FeTNcdxJIeYGhnqcooinpxIxdTcs5L1RwXMOkelI1xbTsxB
        xz7OALBRBparMArgkunvBhYO3l4kqnBq0sUMfGFv++dnlkX4nlRG5ONryTUcZ2/OX2CR/czNSRtml
        Wq5+rpo2dbkA2TWWzfAWLfMoRt2BqRwCMvx+y5ejj6JhlK7y0PfWkBxgGNZgRBpyvuLF21EKwk9zR
        TZo8Ht24BXK1Hh33KERezKHGjBlSbX9nAD9XgIrGPhioaU2Kc7zVdd2R4h79yyoEXMqbEjjKpH62S
        CMb6cKiQ==;
Received: from [179.179.44.200] (helo=coco.lan)
        by casper.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1hQWBZ-0004j8-LR; Tue, 14 May 2019 12:05:34 +0000
Date:   Tue, 14 May 2019 09:05:28 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Tomasz Borowczyk <tomboro88@gmail.com>
Cc:     linux-media@vger.kernel.org
Subject: Re: cx231xx with 3 grabbers
Message-ID: <20190514090528.78965584@coco.lan>
In-Reply-To: <CAM+RvBRfLUPS7uaQG3Drj_oSX1ACj7cCT_fMM9o9NSwr=6JT3Q@mail.gmail.com>
References: <CAM+RvBRfLUPS7uaQG3Drj_oSX1ACj7cCT_fMM9o9NSwr=6JT3Q@mail.gmail.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Tue, 14 May 2019 00:18:31 +0200
Tomasz Borowczyk <tomboro88@gmail.com> escreveu:

> Hello linux-media.
> 
> I use cx231xx driver with my August Vgb100 USB video grabber. It works
> great. It automatically detects my device and I can watch the video
> from analog camera on my Raspberry Pi, and I am very happy about how
> it works.
> 
> But there is a catch. I want to connect 3 such cameras to my Raspberry
> Pi. When there are connected 2 of them, I can watch video from both of
> them without problems. When there are connected 3 adapters, I can
> watch the video from all three cameras, but the picture from one of
> them is flickering and blurring between blue screen and the correct
> data. And no matter in what order I connect them to the Raspberry, the
> problem exists always on the same adapter.
> The same problem exists when I connect the cameras to my laptop
> running Raspbian desktop.
> This could suggest that the one adapter is a little defective, but it
> works okay when there are connected only two adapters, or when it is
> the only connected. Also when I disconnect it and connect again to USB
> port, I can see correct image. But when I start to play picture from
> another camera, and then go back to the "defective" one, it flickers
> again. How can I find the reason of the problem?

The problem is related to the maximum bandwidth that an USB 2.0
provides. Most audio and video devices like cameras use an type of
USB package, called ISOC, with allows reserving bandwidth for them.
It actually reserves a number of USB slots. The maximum is 980 slots
per second, if I'm not mistaken.

The actual number of allocated slots depends on the resolution, 
format, package size, number of frames per second, etc. 

I don't have the numbers for cx231xx, but, with em28xx, a 640x480,
16 bits per pixel, 30 frames per second video uses about 60% of
the available USB 2.0 bandwidth. So, even two cameras at full
res can be too much.

I guess you can consider your self lucky to be able of having
two cameras working :-)

If you need more than that, you'll need to use a machine with
multiple USB buses and connect each camera on a different
bus.

Thanks,
Mauro
