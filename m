Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C80A689E4F
	for <lists+linux-media@lfdr.de>; Mon, 12 Aug 2019 14:29:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728683AbfHLM3B (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Aug 2019 08:29:01 -0400
Received: from mailoutvs28.siol.net ([185.57.226.219]:55786 "EHLO
        mail.siol.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728242AbfHLM3B (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Aug 2019 08:29:01 -0400
X-Greylist: delayed 464 seconds by postgrey-1.27 at vger.kernel.org; Mon, 12 Aug 2019 08:28:59 EDT
Received: from localhost (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTP id 791135206FB;
        Mon, 12 Aug 2019 14:21:13 +0200 (CEST)
X-Virus-Scanned: amavisd-new at psrvmta10.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
        by localhost (psrvmta10.zcs-production.pri [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id gEiOe5RdhaUL; Mon, 12 Aug 2019 14:21:13 +0200 (CEST)
Received: from mail.siol.net (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTPS id 1E9B452379C;
        Mon, 12 Aug 2019 14:21:13 +0200 (CEST)
Received: from jernej-laptop.localnet (89-212-178-211.dynamic.t-2.net [89.212.178.211])
        (Authenticated sender: jernej.skrabec@siol.net)
        by mail.siol.net (Postfix) with ESMTPA id 7FD855206FB;
        Mon, 12 Aug 2019 14:21:12 +0200 (CEST)
From:   Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@siol.net>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     paul.kocialkowski@bootlin.com, maxime.ripard@bootlin.com,
        wens@csie.org, mchehab@kernel.org, gregkh@linuxfoundation.org,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/7] media: cedrus: Improvements/cleanup
Date:   Mon, 12 Aug 2019 14:21:11 +0200
Message-ID: <4636127.h7jaTrrqaR@jernej-laptop>
In-Reply-To: <274221f1-b2d2-83aa-d84b-e1c572a1b832@xs4all.nl>
References: <20190530211516.1891-1-jernej.skrabec@siol.net> <274221f1-b2d2-83aa-d84b-e1c572a1b832@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Dne ponedeljek, 12. avgust 2019 ob 14:12:21 CEST je Hans Verkuil napisal(a):
> On 5/30/19 11:15 PM, Jernej Skrabec wrote:
> > Here is first batch of random Cedrus improvements/cleanups. Only patch 2
> > has a change which raises a question about H264 controls.
> > 
> > Changes were tested on H3 SoC using modified ffmpeg and Kodi.
> > 
> > Please take a look.
> 
> This has been sitting in patchwork for quite some time. I've updated the
> status of the various patches and most needed extra work.
> 
> It seems that patches 4/7 and 5/7 are OK. Maxime, can you please confirm
> that these two are still valid? They apply cleanly on the latest master
> at least, but since they are a bit old I prefer to have confirmation that
> it's OK to merge them.

I'm not sure about patch 4, IIRC Boris Brezillon also wants to improve that 
area in separate series, but patch 5 should be safe to merge.

Anyway, I didn't post new version because I'm waiting on close-to-be-merged 
H264 and HEVC patch series to be actually merged.

Best regards,
Jernej

> 
> Regards,
> 
> 	Hans
> 
> > Best regards,
> > Jernej
> > 
> > Jernej Skrabec (7):
> >   media: cedrus: Disable engine after each slice decoding
> >   media: cedrus: Fix H264 default reference index count
> >   media: cedrus: Fix decoding for some H264 videos
> >   media: cedrus: Remove dst_bufs from context
> >   media: cedrus: Don't set chroma size for scale & rotation
> >   media: cedrus: Add infra for extra buffers connected to capture
> >   
> >     buffers
> >   
> >   media: cedrus: Improve H264 memory efficiency
> >  
> >  drivers/staging/media/sunxi/cedrus/cedrus.h   |  12 +-
> >  .../staging/media/sunxi/cedrus/cedrus_h264.c  | 115 ++++++++----------
> >  .../staging/media/sunxi/cedrus/cedrus_hw.c    |   4 +-
> >  .../staging/media/sunxi/cedrus/cedrus_video.c |  25 ++--
> >  4 files changed, 68 insertions(+), 88 deletions(-)




