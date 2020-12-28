Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C1F32E697D
	for <lists+linux-media@lfdr.de>; Mon, 28 Dec 2020 17:57:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729017AbgL1QwU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 28 Dec 2020 11:52:20 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:60134 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727673AbgL1QwT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Dec 2020 11:52:19 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 43A421F44240
Message-ID: <2c6c885efbfc7569f280e9ebd0aa307b56fd7901.camel@collabora.com>
Subject: Re: [PATCH] media: v4l2-async: Put fwnode after last access
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@collabora.com, Hans Verkuil <hverkuil@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Date:   Mon, 28 Dec 2020 13:51:29 -0300
In-Reply-To: <X+naygVCfh2QVh8P@pendragon.ideasonboard.com>
References: <20201228121725.133898-1-ezequiel@collabora.com>
         <X+naygVCfh2QVh8P@pendragon.ideasonboard.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.2-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 2020-12-28 at 15:16 +0200, Laurent Pinchart wrote:
> Hi Ezequiel,
> 
> Thank you for the patch.
> 
> On Mon, Dec 28, 2020 at 09:17:25AM -0300, Ezequiel Garcia wrote:
> > fwnode_handle_put() should be called after the fwnode
> > is last accessed. Fix it.
> > 
> > Fixes: b98158d837ef ("media: v4l2-async: Accept endpoints and devices for fwnode matching")
> > Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> > ---
> >  drivers/media/v4l2-core/v4l2-async.c | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
> > index e3ab003a6c85..1303c9b83138 100644
> > --- a/drivers/media/v4l2-core/v4l2-async.c
> > +++ b/drivers/media/v4l2-core/v4l2-async.c
> > @@ -78,6 +78,7 @@ static bool match_fwnode(struct v4l2_async_notifier *notifier,
> >         bool asd_fwnode_is_ep;
> >         bool sd_fwnode_is_ep;
> >         struct device *dev;
> > +       bool match;
> >  
> >         /*
> >          * Both the subdev and the async subdev can provide either an endpoint
> > @@ -113,9 +114,10 @@ static bool match_fwnode(struct v4l2_async_notifier *notifier,
> >                 other_fwnode = sd->fwnode;
> >         }
> >  
> > -       fwnode_handle_put(dev_fwnode);
> > +       match = (dev_fwnode == other_fwnode);
> >  
> > -       if (dev_fwnode != other_fwnode)
> 
> This only performs a pointer comparison, it doesn't access dev_fwnode. I
> don't think the change is necessary.
> 

Ah, of course. I'm always confused by this.

Thanks,
Ezequiel

