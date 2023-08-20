Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5F71D7820AB
	for <lists+linux-media@lfdr.de>; Mon, 21 Aug 2023 00:56:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232087AbjHTW4A (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 20 Aug 2023 18:56:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230445AbjHTWz7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 20 Aug 2023 18:55:59 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34630A2
        for <linux-media@vger.kernel.org>; Sun, 20 Aug 2023 15:55:58 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B90B3FA2;
        Mon, 21 Aug 2023 00:54:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1692572081;
        bh=PYDC7FhQJ70s9+YCdKH8lElXaVYhQlPnRYBddCcP4F0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=LY7RNC58goh45TNR1kuJgg9ElOerX8K/hex1NftdMhWT1o404OQ13ZfxUuCcWd2z3
         dBgFDGdSfyVakUege3q/0PXxKgzSacEGw9AZ6gUyLhCz55ru7Yln05O71Fos7p/Anb
         tlKZo3a3bIlxQ69zX6SAopZzDaS9OyHQo8yhnOVk=
Date:   Mon, 21 Aug 2023 01:56:04 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     linux-media@vger.kernel.org,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [PATCH] media: v4l2-subdev: Document that routing support
 depends on streams
Message-ID: <20230820225604.GB10135@pendragon.ideasonboard.com>
References: <20230818155518.440-1-laurent.pinchart@ideasonboard.com>
 <ZN+Z4aYPNp+ymIw6@valkosipuli.retiisi.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZN+Z4aYPNp+ymIw6@valkosipuli.retiisi.eu>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On Fri, Aug 18, 2023 at 04:18:41PM +0000, Sakari Ailus wrote:
> On Fri, Aug 18, 2023 at 06:55:18PM +0300, Laurent Pinchart wrote:
> > Routing support, through the subdev .set_routing() operation, requires
> > the subdev to support streams. This is however not clearly documented
> > anywhere. Fix it by expanding the operation's documentation to indicate
> > that subdevs must set the V4L2_SUBDEV_FL_STREAMS flag.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> >  include/media/v4l2-subdev.h | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> > 
> > diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> > index b325df0d54d6..0b04ed1994b6 100644
> > --- a/include/media/v4l2-subdev.h
> > +++ b/include/media/v4l2-subdev.h
> > @@ -822,8 +822,9 @@ struct v4l2_subdev_state {
> >   *		     operation shall fail if the pad index it has been called on
> >   *		     is not valid or in case of unrecoverable failures.
> >   *
> > - * @set_routing: enable or disable data connection routes described in the
> > - *		 subdevice routing table.
> > + * @set_routing: Enable or disable data connection routes described in the
> > + *		 subdevice routing table. Subdevs that implement this operation
> > + *		 must set the V4L2_SUBDEV_FL_STREAMS flag.
> 
> Could we set the flag in the core when this op exists for a sub-device?

That won't work in all cases, as a driver could expose immutable routes
by creating them in the .init_cfg() function, without implementing
.set_routing().

Another option would be to check if the drivers has created routes after
the .init_cfg() called (indirectly) from v4l2_subdev_init_finalize(). It
may be a bit fragile though.

> We could do similarly for events when the sub-device has a control handler.

A subdev could generate non-control events too. In most cases I suppose
it would still create a control handler, but I don't think we should
require that.

> The device node should probably exist in almost all cases, but I'm not sure
> right now whether there is a reasonable test for it.

-- 
Regards,

Laurent Pinchart
