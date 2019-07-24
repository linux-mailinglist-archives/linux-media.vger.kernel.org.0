Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 76533731B9
	for <lists+linux-media@lfdr.de>; Wed, 24 Jul 2019 16:34:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726990AbfGXOeT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Jul 2019 10:34:19 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:44841 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726709AbfGXOeS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Jul 2019 10:34:18 -0400
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1hqILR-0001NT-Mg; Wed, 24 Jul 2019 16:34:17 +0200
Message-ID: <1563978854.2914.15.camel@pengutronix.de>
Subject: Re: [PATCH 01/14] v4l2-ioctl.c: OR flags in v4l_fill_fmtdesc(), not
 don't overwrite
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org
Cc:     Maxime Jourdan <mjourdan@baylibre.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Boris Brezillon <boris.brezillon@collabora.com>
Date:   Wed, 24 Jul 2019 16:34:14 +0200
In-Reply-To: <8559fd11-e6b7-092d-08b3-dc92f92ee089@xs4all.nl>
References: <20190724110523.29248-1-hverkuil-cisco@xs4all.nl>
         <20190724110523.29248-2-hverkuil-cisco@xs4all.nl>
         <1563974568.2914.11.camel@pengutronix.de>
         <8559fd11-e6b7-092d-08b3-dc92f92ee089@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.22.6-1+deb9u2 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 2019-07-24 at 15:30 +0200, Hans Verkuil wrote:
> On 7/24/19 3:22 PM, Philipp Zabel wrote:
> > On Wed, 2019-07-24 at 13:05 +0200, Hans Verkuil wrote:
> > > If a driver sets a FMT flag in the enum_fmt op, then that will be
> > > ignored since v4l_fill_fmtdesc() overwrites it again.
> > > 
> > > v4l_fill_fmtdesc() should OR its flag, not overwrite it.
> > > 
> > > Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> > > ---
> > >  drivers/media/v4l2-core/v4l2-ioctl.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> > > index 80efc581e3f9..911a20f915c5 100644
> > > --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> > > +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> > > @@ -1390,7 +1390,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
> > >  
> > >  	if (descr)
> > >  		WARN_ON(strscpy(fmt->description, descr, sz) < 0);
> > > -	fmt->flags = flags;
> > > +	fmt->flags |= flags;
> > >  }
> > >  
> > >  static int v4l_enum_fmt(const struct v4l2_ioctl_ops *ops,
> > 
> > If the enum_fmt op does not write fmt->flags, will it not contain the
> > value provided by userspace at this point? I think p->flags must be
> > cleared in v4l2_enum_fmt() with this change, before the enum_fmt op is
> > called.
> 
> All fields after 'type' in struct v4l2_fmtdesc are cleared by the core:
> search for INFO_FL_CLEAR(v4l2_fmtdesc, type) in v4l2-ioctl.c.
> 
> So 'flags' is already zeroed when this function is called.

Got it, thanks. In that case,

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
