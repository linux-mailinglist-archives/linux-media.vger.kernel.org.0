Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27F9F3C527A
	for <lists+linux-media@lfdr.de>; Mon, 12 Jul 2021 12:50:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346584AbhGLHqk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Jul 2021 03:46:40 -0400
Received: from relay11.mail.gandi.net ([217.70.178.231]:44279 "EHLO
        relay11.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349637AbhGLHo1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Jul 2021 03:44:27 -0400
Received: (Authenticated sender: jacopo@jmondi.org)
        by relay11.mail.gandi.net (Postfix) with ESMTPSA id B94CE100008;
        Mon, 12 Jul 2021 07:41:30 +0000 (UTC)
Date:   Mon, 12 Jul 2021 09:42:20 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        linux-media@vger.kernel.org,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>,
        Michal Simek <michal.simek@xilinx.com>
Subject: Re: [PATCH v7 08/27] media: entity: Add has_route entity operation
Message-ID: <20210712074220.wwpullv252hdwpnv@uno.localdomain>
References: <20210524104408.599645-1-tomi.valkeinen@ideasonboard.com>
 <20210524104408.599645-9-tomi.valkeinen@ideasonboard.com>
 <20210708124310.ievjt7effrkc6g6d@uno.localdomain>
 <20210711152626.GC3@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210711152626.GC3@paasikivi.fi.intel.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On Sun, Jul 11, 2021 at 06:26:26PM +0300, Sakari Ailus wrote:
> On Thu, Jul 08, 2021 at 02:43:10PM +0200, Jacopo Mondi wrote:
> > Hi Tomi,
> >    a small note
> >
> > On Mon, May 24, 2021 at 01:43:49PM +0300, Tomi Valkeinen wrote:
> > > From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > >
> > > The optional operation can be used by entities to report whether two
> > > pads are internally connected.
> > >
> > > While at there, fix a Sphinx compiler warning in a comment block a few
> > > lines above.
> > >
> > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > Signed-off-by: Michal Simek <michal.simek@xilinx.com>
> > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > > Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> > > ---
> > >  include/media/media-entity.h | 7 +++++++
> > >  1 file changed, 7 insertions(+)
> > >
> > > diff --git a/include/media/media-entity.h b/include/media/media-entity.h
> > > index 516d73a2941e..ad4020b2df65 100644
> > > --- a/include/media/media-entity.h
> > > +++ b/include/media/media-entity.h
> > > @@ -187,6 +187,7 @@ enum media_pad_signal_type {
> > >   * @flags:	Pad flags, as defined in
> > >   *		:ref:`include/uapi/linux/media.h <media_header>`
> > >   *		(seek for ``MEDIA_PAD_FL_*``)
> > > + *
> > >   * .. note::
> > >   *
> > >   *    @stream_count reference count must never be negative, but is a signed
> > > @@ -214,6 +215,10 @@ struct media_pad {
> > >   * @link_validate:	Return whether a link is valid from the entity point of
> > >   *			view. The media_pipeline_start() function
> > >   *			validates all links by calling this operation. Optional.
> > > + * @has_route:		Return whether a route exists inside the entity between
> > > + *			two given pads. Pads are passed to the operation ordered
> > > + *			by index. Optional: If the operation isn't implemented
> >
> > According to the next patch, this doesn't seem to be 'Optional:' :)
>
> How? Few drivers will implement this in the end, and that's been taken into
> account in code AFAIU.

What I meant is that it's not optional that all pads are considered
connected if the op is not implemented. Or maybe this should have read
as "Implementing the operation is optional" ?

>
> --
> Sakari Ailus
