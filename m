Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C65E4FAE5D
	for <lists+linux-media@lfdr.de>; Sun, 10 Apr 2022 17:08:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240065AbiDJPKY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 10 Apr 2022 11:10:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235249AbiDJPKX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 10 Apr 2022 11:10:23 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5ECDE6210A
        for <linux-media@vger.kernel.org>; Sun, 10 Apr 2022 08:08:12 -0700 (PDT)
Received: from pendragon.ideasonboard.com (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id CC261482;
        Sun, 10 Apr 2022 17:08:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1649603289;
        bh=Q2q4QxELOi4YVANAFY802ARSSBviqYsKZCRJhrvtdM8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GIfu+bnqIWVOj4lTHyhraUuX1lSq0DmANr0UDDUdEpilOQmgE0wHdUuQvrF3kOo9W
         xHvNs++eljtuX+dJOBOs4FERn0kALF+yZY2sEUmAAnteeUKVi/dpMhBZGtvgk1rwCw
         jtHL+l5NnFt7iOFjrzlt7ZqmYC6hmVVHUKI38dzo=
Date:   Sun, 10 Apr 2022 18:08:07 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Subject: Re: [PATCH] media: v4l2-async: Use endpoints in
 __v4l2_async_nf_add_fwnode_remote()
Message-ID: <YlLy1yXSjpNgP7Zh@pendragon.ideasonboard.com>
References: <20220321145134.29820-1-laurent.pinchart@ideasonboard.com>
 <164953294830.22830.18350472818944012018@Monstersaurus>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <164953294830.22830.18350472818944012018@Monstersaurus>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Kieran,

On Sat, Apr 09, 2022 at 08:35:48PM +0100, Kieran Bingham wrote:
> Quoting Laurent Pinchart (2022-03-21 14:51:34)
> > From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > 
> > Matching on device fwnode handles is deprecated in favour of endpoint
> > fwnode handles. Switch the __v4l2_async_nf_add_fwnode_remote() function
> > to use the latter. The match code handles backward compatibility by
> > falling by to the device fwnode handle, so this shouldn't introduce any
> 
> s/by/back/ ?

Indeed.

> It sounds like this helps move other devices towards endpoint matching
> more generically too, but I expect there will still be more specifics to
> handle in receiver drivers?
> 
> And indeed the whole point of the fallback case was to make them
> compatible... so:
> 
> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> 
> 
> But I suspect this needs some testing on platforms that haven't yet
> moved to endpoint matching.. ?

The more testing the better :-)

> > regression.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > ---
> >  drivers/media/v4l2-core/v4l2-async.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
> > index 0404267f1ae4..67d7f445d429 100644
> > --- a/drivers/media/v4l2-core/v4l2-async.c
> > +++ b/drivers/media/v4l2-core/v4l2-async.c
> > @@ -662,7 +662,7 @@ __v4l2_async_nf_add_fwnode_remote(struct v4l2_async_notifier *notif,
> >         struct v4l2_async_subdev *asd;
> >         struct fwnode_handle *remote;
> >  
> > -       remote = fwnode_graph_get_remote_port_parent(endpoint);
> > +       remote = fwnode_graph_get_remote_endpoint(endpoint);
> >         if (!remote)
> >                 return ERR_PTR(-ENOTCONN);
> >  

-- 
Regards,

Laurent Pinchart
