Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0DA8BC97E9
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2019 07:21:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727191AbfJCFVe convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Thu, 3 Oct 2019 01:21:34 -0400
Received: from mailoutvs34.siol.net ([185.57.226.225]:48537 "EHLO
        mail.siol.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725763AbfJCFVd (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Oct 2019 01:21:33 -0400
Received: from localhost (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTP id B0B825212B8;
        Thu,  3 Oct 2019 07:21:30 +0200 (CEST)
X-Virus-Scanned: amavisd-new at psrvmta10.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
        by localhost (psrvmta10.zcs-production.pri [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id fiKaRxyZbaY9; Thu,  3 Oct 2019 07:21:30 +0200 (CEST)
Received: from mail.siol.net (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTPS id 57E7852128A;
        Thu,  3 Oct 2019 07:21:30 +0200 (CEST)
Received: from jernej-laptop.localnet (cpe-86-58-59-25.static.triera.net [86.58.59.25])
        (Authenticated sender: jernej.skrabec@siol.net)
        by mail.siol.net (Postfix) with ESMTPA id EA2655212B8;
        Thu,  3 Oct 2019 07:21:29 +0200 (CEST)
From:   Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@siol.net>
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc:     mripard@kernel.org, mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        gregkh@linuxfoundation.org, wens@csie.org,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] media: cedrus: improvements
Date:   Thu, 03 Oct 2019 07:21:29 +0200
Message-ID: <8173759.PpYHodOKdy@jernej-laptop>
In-Reply-To: <20191002222307.GD24151@aptenodytes>
References: <20191002193553.1633467-1-jernej.skrabec@siol.net> <20191002222307.GD24151@aptenodytes>
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Dne četrtek, 03. oktober 2019 ob 00:23:07 CEST je Paul Kocialkowski 
napisal(a):
> Hi,
> 
> On Wed 02 Oct 19, 21:35, Jernej Skrabec wrote:
> > This is continuation of https://lkml.org/lkml/2019/5/30/1459 with several
> > patches removed (2 merged, others needs redesign) and one added.
> 
> Thanks for the continued effort on this, these fixes are greatly appreciated
> (and more generally, all the work you are putting into cedrus)!
> 
> Although I've been out of the loop on cedrus, it is very nice to see
> development happening. Keep up the good work!

Thanks! Those fixes are just cleaned up version of patches I'm using in 
LibreELEC for some time now. I hate maintaining out-of-tree patches over a 
long period, so pushing them upstream is beneficial for all :)

I'll send more improvements once your HEVC patches are merged.

Best regards,
Jernej

> 
> Cheers,
> 
> Paul
> 
> > Patch 1 fixes h264 playback issue which happens in rare cases.
> > 
> > Patch 2 sets PPS default reference index count in register from PPS
> > control. Currently it was set to values from slice control.
> > 
> > Patch 3 replaces direct accesses to capture queue from m2m contex with
> > helpers which was designed exactly for that. It's also safer since
> > helpers do some checks.
> > 
> > Best regards,
> > Jernej
> > 
> > Jernej Skrabec (3):
> >   media: cedrus: Fix decoding for some H264 videos
> >   media: cedrus: Fix H264 default reference index count
> >   media: cedrus: Use helpers to access capture queue
> >  
> >  drivers/staging/media/sunxi/cedrus/cedrus.h   |  8 +++-
> >  .../staging/media/sunxi/cedrus/cedrus_h264.c  | 46 ++++++++++++++-----
> >  .../staging/media/sunxi/cedrus/cedrus_regs.h  |  3 ++
> >  3 files changed, 44 insertions(+), 13 deletions(-)




