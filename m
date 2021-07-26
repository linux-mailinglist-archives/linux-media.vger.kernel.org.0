Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 206843D668D
	for <lists+linux-media@lfdr.de>; Mon, 26 Jul 2021 20:13:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232597AbhGZRcs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Jul 2021 13:32:48 -0400
Received: from mga12.intel.com ([192.55.52.136]:60968 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232927AbhGZRcr (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Jul 2021 13:32:47 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10057"; a="191886567"
X-IronPort-AV: E=Sophos;i="5.84,270,1620716400"; 
   d="scan'208";a="191886567"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2021 11:13:14 -0700
X-IronPort-AV: E=Sophos;i="5.84,270,1620716400"; 
   d="scan'208";a="436924856"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2021 11:13:10 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 3689C20138;
        Mon, 26 Jul 2021 21:13:07 +0300 (EEST)
Date:   Mon, 26 Jul 2021 21:13:07 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
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
Message-ID: <20210726181307.GF3@paasikivi.fi.intel.com>
References: <20210524104408.599645-1-tomi.valkeinen@ideasonboard.com>
 <20210524104408.599645-9-tomi.valkeinen@ideasonboard.com>
 <20210708124310.ievjt7effrkc6g6d@uno.localdomain>
 <20210711152626.GC3@paasikivi.fi.intel.com>
 <20210712074220.wwpullv252hdwpnv@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210712074220.wwpullv252hdwpnv@uno.localdomain>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jul 12, 2021 at 09:42:20AM +0200, Jacopo Mondi wrote:
> Hi Sakari,
> 
> On Sun, Jul 11, 2021 at 06:26:26PM +0300, Sakari Ailus wrote:
> > On Thu, Jul 08, 2021 at 02:43:10PM +0200, Jacopo Mondi wrote:
> > > Hi Tomi,
> > >    a small note
> > >
> > > On Mon, May 24, 2021 at 01:43:49PM +0300, Tomi Valkeinen wrote:
> > > > From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > >
> > > > The optional operation can be used by entities to report whether two
> > > > pads are internally connected.
> > > >
> > > > While at there, fix a Sphinx compiler warning in a comment block a few
> > > > lines above.
> > > >
> > > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > > Signed-off-by: Michal Simek <michal.simek@xilinx.com>
> > > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > > > Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> > > > ---
> > > >  include/media/media-entity.h | 7 +++++++
> > > >  1 file changed, 7 insertions(+)
> > > >
> > > > diff --git a/include/media/media-entity.h b/include/media/media-entity.h
> > > > index 516d73a2941e..ad4020b2df65 100644
> > > > --- a/include/media/media-entity.h
> > > > +++ b/include/media/media-entity.h
> > > > @@ -187,6 +187,7 @@ enum media_pad_signal_type {
> > > >   * @flags:	Pad flags, as defined in
> > > >   *		:ref:`include/uapi/linux/media.h <media_header>`
> > > >   *		(seek for ``MEDIA_PAD_FL_*``)
> > > > + *
> > > >   * .. note::
> > > >   *
> > > >   *    @stream_count reference count must never be negative, but is a signed
> > > > @@ -214,6 +215,10 @@ struct media_pad {
> > > >   * @link_validate:	Return whether a link is valid from the entity point of
> > > >   *			view. The media_pipeline_start() function
> > > >   *			validates all links by calling this operation. Optional.
> > > > + * @has_route:		Return whether a route exists inside the entity between
> > > > + *			two given pads. Pads are passed to the operation ordered
> > > > + *			by index. Optional: If the operation isn't implemented
> > >
> > > According to the next patch, this doesn't seem to be 'Optional:' :)
> >
> > How? Few drivers will implement this in the end, and that's been taken into
> > account in code AFAIU.
> 
> What I meant is that it's not optional that all pads are considered
> connected if the op is not implemented. Or maybe this should have read
> as "Implementing the operation is optional" ?

Fine for me. I don't think the old text was bad either though.

-- 
Sakari Ailus
