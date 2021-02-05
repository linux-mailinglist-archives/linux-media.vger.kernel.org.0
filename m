Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 540A13115D2
	for <lists+linux-media@lfdr.de>; Fri,  5 Feb 2021 23:44:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231674AbhBEWnH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 Feb 2021 17:43:07 -0500
Received: from mx2.suse.de ([195.135.220.15]:40868 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232257AbhBENDx (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 5 Feb 2021 08:03:53 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 6C6E7ACBA;
        Fri,  5 Feb 2021 13:03:03 +0000 (UTC)
Date:   Fri, 05 Feb 2021 14:03:03 +0100
Message-ID: <s5h1rdu4qgo.wl-tiwai@suse.de>
From:   Takashi Iwai <tiwai@suse.de>
To:     Andrew Lunn <andrew@lunn.ch>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Matwey V. Kornilov" <matwey@sai.msu.ru>,
        Robert Foss <robert.foss@linaro.org>
Subject: Re: [PATCH] media: pwc: Fix the URB buffer allocation
In-Reply-To: <YB0/wTjYqE9IgtXZ@lunn.ch>
References: <20210121202855.17400-1-tiwai@suse.de>
        <7afd0612-de36-60b1-6650-6f8de24a7145@xs4all.nl>
        <YB0/wTjYqE9IgtXZ@lunn.ch>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI/1.14.6 (Maruoka)
 FLIM/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL/10.8 Emacs/25.3
 (x86_64-suse-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI 1.14.6 - "Maruoka")
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, 05 Feb 2021 13:53:21 +0100,
Andrew Lunn wrote:
> 
> On Fri, Feb 05, 2021 at 01:36:43PM +0100, Hans Verkuil wrote:
> > Hi Takashi,
> > 
> > Thank you for this patch, but it clashes with another patch trying to do the same thing
> > that has already been merged in our tree:
> > 
> > https://patchwork.linuxtv.org/project/linux-media/patch/20210104170007.20625-1-matwey@sai.msu.ru/
> > 
> > I do prefer your patch over the one already merged since it is a bit simpler, but
> > shouldn't the calls to dma_sync_single_for_cpu() and dma_sync_single_for_device()
> > in pwc-if.c also use urb->dev->bus->controller?
> > 
> > Also, Matwey's patch uses urb->dev->bus->sysdev instead of urb->dev->bus->controller.
> > How does 'sysdev' relate to 'controller'? I think 'controller' is the right device to
> > use, but either seems to work when I test it with my pwc webcam.
> 
> Hi Hans
> 
> A quick grep in driver/usb show that all but one dma mapping operation
> use sysdev. The one other case uses controller. So the numbers suggest
> controller is wrong, sysdev is correct.

Indeed, looks so.  In most cases, this doesn't matter since both point
to the same device object.  In some cases like xhci-plat HCD, they
differ.  And sysdev  might be a better choice from the consistency
POV.

But this brought an interesting question, too.  eg. USB chipidea
HCD uses platform devices for both controller and sysdev, and I
couldn't find any DMA mask setup.  So, no matter what to use, the uwc
driver would be broken on this...  Maybe it's just not covered.

> But maybe ask GregKH?

To be certain, better to involve with USB people, yeah.


thanks,

Takashi
