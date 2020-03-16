Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B01AA1868B1
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2020 11:07:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730493AbgCPKHc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Mar 2020 06:07:32 -0400
Received: from mail.netline.ch ([148.251.143.178]:40175 "EHLO
        netline-mail3.netline.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730430AbgCPKHc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Mar 2020 06:07:32 -0400
X-Greylist: delayed 582 seconds by postgrey-1.27 at vger.kernel.org; Mon, 16 Mar 2020 06:07:31 EDT
Received: from localhost (localhost [127.0.0.1])
        by netline-mail3.netline.ch (Postfix) with ESMTP id 104992A6042;
        Mon, 16 Mar 2020 10:57:48 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
        by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
        with LMTP id 2PtkzY5dlS6y; Mon, 16 Mar 2020 10:57:47 +0100 (CET)
Received: from thor (252.80.76.83.dynamic.wline.res.cust.swisscom.ch [83.76.80.252])
        by netline-mail3.netline.ch (Postfix) with ESMTPSA id 8F0442A6016;
        Mon, 16 Mar 2020 10:57:47 +0100 (CET)
Received: from localhost ([::1])
        by thor with esmtp (Exim 4.93)
        (envelope-from <michel@daenzer.net>)
        id 1jDmVH-000X4G-3f; Mon, 16 Mar 2020 10:57:47 +0100
Subject: Re: [Mesa-dev] Plumbing explicit synchronization through the Linux
 ecosystem
To:     =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>,
        Jason Ekstrand <jason@jlekstrand.net>
Cc:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        xorg-devel <xorg-devel@lists.x.org>,
        Maling list - DRI developers 
        <dri-devel@lists.freedesktop.org>,
        "wayland-devel @ lists . freedesktop . org" 
        <wayland-devel@lists.freedesktop.org>,
        Discussion of the development of and with GStreamer 
        <gstreamer-devel@lists.freedesktop.org>,
        ML mesa-dev <mesa-dev@lists.freedesktop.org>,
        linux-media@vger.kernel.org
References: <CAOFGe94jy2VYDPbkMW8ZuNdAeM+HS8sM1OAYFGd9JKc1V7PVOQ@mail.gmail.com>
 <CAAxE2A4q9sZDz8vSLAvT0HH4BGukf8Ug68eqSV1ojqrm_5uFFg@mail.gmail.com>
 <170e13edbb0.27ad.c6988b7ea6112e3e892765a0d4287e0c@jlekstrand.net>
 <CAAxE2A6hMs2Ngd4zEv+hEJnEUKmPDuXmeWUaUU-4YCTRHNzr1w@mail.gmail.com>
From:   =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>
Message-ID: <e470a1d0-cf91-5811-d280-322e005888a8@daenzer.net>
Date:   Mon, 16 Mar 2020 10:57:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAAxE2A6hMs2Ngd4zEv+hEJnEUKmPDuXmeWUaUU-4YCTRHNzr1w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-CA
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 2020-03-16 4:50 a.m., Marek Olšák wrote:
> The synchronization works because the Mesa driver waits for idle (drains
> the GFX pipeline) at the end of command buffers and there is only 1
> graphics queue, so everything is ordered.
> 
> The GFX pipeline runs asynchronously to the command buffer, meaning the
> command buffer only starts draws and doesn't wait for completion. If the
> Mesa driver didn't wait at the end of the command buffer, the command
> buffer would finish and a different process could start execution of its
> own command buffer while shaders of the previous process are still running.
> 
> If the Mesa driver submits a command buffer internally (because it's full),
> it doesn't wait, so the GFX pipeline doesn't notice that a command buffer
> ended and a new one started.
> 
> The waiting at the end of command buffers happens only when the flush is
> external (Swap buffers, glFlush).
> 
> It's a performance problem, because the GFX queue is blocked until the GFX
> pipeline is drained at the end of every frame at least.
> 
> So explicit fences for SwapBuffers would help.

Not sure what difference it would make, since the same thing needs to be
done for explicit fences as well, doesn't it?


-- 
Earthling Michel Dänzer               |               https://redhat.com
Libre software enthusiast             |             Mesa and X developer
