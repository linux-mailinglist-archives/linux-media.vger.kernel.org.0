Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 707816B957
	for <lists+linux-media@lfdr.de>; Wed, 17 Jul 2019 11:34:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726580AbfGQJdw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Jul 2019 05:33:52 -0400
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:43019 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725941AbfGQJdv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Jul 2019 05:33:51 -0400
X-Originating-IP: 86.250.200.211
Received: from aptenodytes (lfbn-1-17395-211.w86-250.abo.wanadoo.fr [86.250.200.211])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id A14BAC000D;
        Wed, 17 Jul 2019 09:33:48 +0000 (UTC)
Date:   Wed, 17 Jul 2019 11:33:48 +0200
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     Nishka Dasgupta <nishkadg.linux@gmail.com>
Cc:     maxime.ripard@bootlin.com, mchehab@kernel.org,
        gregkh@linuxfoundation.org, wens@csie.org,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] staging: media: sunxi: Replace function
 cedrus_check_format()
Message-ID: <20190717093348.GB26951@aptenodytes>
References: <20190703081317.22795-1-nishkadg.linux@gmail.com>
 <20190703081317.22795-2-nishkadg.linux@gmail.com>
 <20190705102650.GB1645@aptenodytes>
 <1c5bd5a6-757e-2bce-6adf-6dafbf6956a6@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1c5bd5a6-757e-2bce-6adf-6dafbf6956a6@gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On Fri 05 Jul 19, 17:43, Nishka Dasgupta wrote:
> On 05/07/19 3:56 PM, Paul Kocialkowski wrote:
> > Hi,
> > 
> > On Wed 03 Jul 19, 13:43, Nishka Dasgupta wrote:
> > > Remove function cedrus_check_format as all it does is call
> > > cedrus_find_format.
> > > Rename cedrus_find_format to cedrus_check_format to maintain
> > > compatibility with call sites.
> > > Issue found with Coccinelle.
> > 
> > Maybe we could have a !! or a bool cast to make coccinelle happy here?
> 
> Coccinelle didn't flag the type mismatch, just the single-line functions. I
> could add the bool cast then?

Looks like I failed to follow-up on this in due time, sorry.

Yes a bool cast would definitely be welcome :)

Cheers,

Paul

> Thanking you,
> Nishka
> 
> > Cheers,
> > 
> > Paul
> > 
> > > Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>
> > > ---
> > >   drivers/staging/media/sunxi/cedrus/cedrus_video.c | 10 ++--------
> > >   1 file changed, 2 insertions(+), 8 deletions(-)
> > > 
> > > diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_video.c b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
> > > index 0ec31b9e0aea..d5cc9ed04fd2 100644
> > > --- a/drivers/staging/media/sunxi/cedrus/cedrus_video.c
> > > +++ b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
> > > @@ -55,8 +55,8 @@ static inline struct cedrus_ctx *cedrus_file2ctx(struct file *file)
> > >   	return container_of(file->private_data, struct cedrus_ctx, fh);
> > >   }
> > > -static bool cedrus_find_format(u32 pixelformat, u32 directions,
> > > -			       unsigned int capabilities)
> > > +static bool cedrus_check_format(u32 pixelformat, u32 directions,
> > > +				unsigned int capabilities)
> > >   {
> > >   	struct cedrus_format *fmt;
> > >   	unsigned int i;
> > > @@ -76,12 +76,6 @@ static bool cedrus_find_format(u32 pixelformat, u32 directions,
> > >   	return false;
> > >   }
> > > -static bool cedrus_check_format(u32 pixelformat, u32 directions,
> > > -				unsigned int capabilities)
> > > -{
> > > -	return cedrus_find_format(pixelformat, directions, capabilities);
> > > -}
> > > -
> > >   static void cedrus_prepare_format(struct v4l2_pix_format *pix_fmt)
> > >   {
> > >   	unsigned int width = pix_fmt->width;
> > > -- 
> > > 2.19.1
> > > 
> > 
> 

-- 
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com
