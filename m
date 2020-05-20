Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02EA21DC20E
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2020 00:31:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728550AbgETWbC convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Wed, 20 May 2020 18:31:02 -0400
Received: from mailoutvs40.siol.net ([185.57.226.231]:51865 "EHLO
        mail.siol.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728270AbgETWbC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 May 2020 18:31:02 -0400
Received: from localhost (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTP id 5F0AD521CA5;
        Thu, 21 May 2020 00:30:58 +0200 (CEST)
X-Virus-Scanned: amavisd-new at psrvmta09.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
        by localhost (psrvmta09.zcs-production.pri [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id WVPCA-mzMnE8; Thu, 21 May 2020 00:30:58 +0200 (CEST)
Received: from mail.siol.net (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTPS id E1B7A521CA2;
        Thu, 21 May 2020 00:30:57 +0200 (CEST)
Received: from jernej-laptop.localnet (cpe-194-152-20-232.static.triera.net [194.152.20.232])
        (Authenticated sender: jernej.skrabec@siol.net)
        by mail.siol.net (Postfix) with ESMTPA id 6D5FC521C9C;
        Thu, 21 May 2020 00:30:57 +0200 (CEST)
From:   Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@siol.net>
To:     mripard@kernel.org, paul.kocialkowski@bootlin.com,
        Nicolas Dufresne <nicolas@ndufresne.ca>
Cc:     mchehab@kernel.org, gregkh@linuxfoundation.org, wens@csie.org,
        hverkuil-cisco@xs4all.nl, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] media: cedrus: Add support for VP8 decoding
Date:   Thu, 21 May 2020 00:30:56 +0200
Message-ID: <2875977.BS6FNRR2HQ@jernej-laptop>
In-Reply-To: <ee0aa12fdf1655c4e563b8fc9753a5ab5e52f4cf.camel@ndufresne.ca>
References: <20200520210129.132816-1-jernej.skrabec@siol.net> <ee0aa12fdf1655c4e563b8fc9753a5ab5e52f4cf.camel@ndufresne.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
Content-Type: text/plain; charset="iso-8859-1"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Dne sreda, 20. maj 2020 ob 23:43:40 CEST je Nicolas Dufresne napisal(a):
> Le mercredi 20 mai 2020 à 23:01 +0200, Jernej Skrabec a écrit :
> > VP8 in Cedrus shares same engine as H264.
> > 
> > Note that it seems necessary to call bitstream parsing functions,
> > to parse frame header, otherwise decoded image is garbage. This is
> > contrary to what is driver supposed to do. However, values are not
> > really used, so this might be acceptable. It's possible that bitstream
> 
> Have you verified that all values passed through controls are not used
> ? To remain a stateless driver, there is no requirement for parsed data
> to be used, the only requirement is that the reference are used.
> Otherwise doing parallel decoding of two stream of different stream
> would be broken. Have you verified that parallel decoding is working as
> expected ?

I'm not sure if you understand what I meant. Although userspace app parses 
frame header and fills all data in VP8 control, driver parses frame header 
again, using HW bitstream parsing functionality in cedrus_read_header(). 
Without that second header parsing in HW, decoded image is garbage. Note that 
cedrus_read_header() discards all parsed values and relies on those provided 
in controls.

This parsing doesn't cause any problems with parallel decoding or anything. 
It's done during frame decoding job, so it doesn't affect any state. It's just 
that we shouldn't need to parse header in driver because all data is already 
provided in controls. It seems that Cedrus core was never tested without that 
HW frame header parsing. I found out that HEVC and H264 frames can sometimes 
also be wrongly decoded if no bitstream parsing function is triggered in HW 
before final decoding.

I spend a lot of time trying to avoid that header parsing, but I couldn't find 
any way around it.

In another words, Cedrus VPU provides two functionalities - HW bitstream 
parsing (to speed up header parsing) and video decoding. One would thought 
that video decoding can be used independently, if all data from header is 
already known, but it can't be.

Best regards,
Jernej

> 
> > parsing functions set some internal VPU state, which is later necessary
> > for proper decoding. Biggest suspect is "VP8 probs update" trigger.
> > 
> > Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> > ---
> > 
> >  drivers/staging/media/sunxi/cedrus/Makefile   |   3 +-
> >  drivers/staging/media/sunxi/cedrus/cedrus.c   |   8 +
> >  drivers/staging/media/sunxi/cedrus/cedrus.h   |  15 +
> >  .../staging/media/sunxi/cedrus/cedrus_dec.c   |   5 +
> >  .../staging/media/sunxi/cedrus/cedrus_hw.c    |   1 +
> >  .../staging/media/sunxi/cedrus/cedrus_regs.h  |  80 ++
> >  .../staging/media/sunxi/cedrus/cedrus_video.c |   9 +
> >  .../staging/media/sunxi/cedrus/cedrus_vp8.c   | 699 ++++++++++++++++++
> >  8 files changed, 819 insertions(+), 1 deletion(-)
> >  create mode 100644 drivers/staging/media/sunxi/cedrus/cedrus_vp8.c



