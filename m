Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BBF4E73C523
	for <lists+linux-media@lfdr.de>; Sat, 24 Jun 2023 02:25:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231298AbjFXAZZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 23 Jun 2023 20:25:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229461AbjFXAZY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 23 Jun 2023 20:25:24 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5520E26A9
        for <linux-media@vger.kernel.org>; Fri, 23 Jun 2023 17:25:20 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 904072C6;
        Sat, 24 Jun 2023 02:24:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1687566281;
        bh=NAEZURojuPsv/2J9Wg247kwpG3CyYh38piJa7xCkNmg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=XkPtxP0RP+phM/cNYJ/8v7cBXG1dqRnfx5ZedBm2dCmRVPNCd1FTurytv2XCE06v5
         ztj8ww/wcxdHAm+ylJgV18b1KG0w36gGlj8P9KYY7Q6z0T5asiAof1T5/td/WiNWLF
         Y4Sdwr4nzIYA+z+GTBTCFeN9oGZ+xP2HWKb6mLSA=
Date:   Sat, 24 Jun 2023 03:25:17 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Poncho <poncho@spahan.ch>
Cc:     linux-media@vger.kernel.org,
        Ricardo Ribalda <ribalda@chromium.org>,
        "Linux regression tracking (Thorsten Leemhuis)" 
        <regressions@leemhuis.info>, regressions@lists.linux.dev
Subject: Re: [PATCH] media: uvcvideo: Fix menu count handling for userspace
 XU mappings
Message-ID: <20230624002517.GF1669@pendragon.ideasonboard.com>
References: <20230606170919.GJ25679@pendragon.ideasonboard.com>
 <20230606171150.12875-1-laurent.pinchart@ideasonboard.com>
 <785fcf0b-3f63-a0da-3eea-f57124e99e15@spahan.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <785fcf0b-3f63-a0da-3eea-f57124e99e15@spahan.ch>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

On Wed, Jun 21, 2023 at 05:26:39PM +0200, Poncho wrote:
> Hi Laurent
> 
> Friendly ping. I think this patch was forgotten.

Thanks for the reminder. I'll send a pull request for v6.6.

> On 06.06.23 19:11, Laurent Pinchart wrote:
> > When commit 716c330433e3 ("media: uvcvideo: Use standard names for
> > menus") reworked the handling of menu controls, it inadvertently
> > replaced a GENMASK(n - 1, 0) with a BIT_MASK(n). The latter isn't
> > equivalent to the former, which broke adding XU mappings from userspace.
> > Fix it.
> > 
> > Reported-by: Poncho <poncho@spahan.ch>
> > Link: https://lore.kernel.org/linux-media/468a36ec-c3ac-cb47-e12f-5906239ae3cd@spahan.ch/
> > Fixes: 716c330433e3 ("media: uvcvideo: Use standard names for menus")
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> > This is untested. Poncho, would you be able to test this patch to see if
> > it fixes your issue ?
> > ---
> >   drivers/media/usb/uvc/uvc_v4l2.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> > index 5ac2a424b13d..f4988f03640a 100644
> > --- a/drivers/media/usb/uvc/uvc_v4l2.c
> > +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> > @@ -45,7 +45,7 @@ static int uvc_control_add_xu_mapping(struct uvc_video_chain *chain,
> >   	map->menu_names = NULL;
> >   	map->menu_mapping = NULL;
> >   
> > -	map->menu_mask = BIT_MASK(xmap->menu_count);
> > +	map->menu_mask = GENMASK(xmap->menu_count - 1, 0);
> >   
> >   	size = xmap->menu_count * sizeof(*map->menu_mapping);
> >   	map->menu_mapping = kzalloc(size, GFP_KERNEL);

-- 
Regards,

Laurent Pinchart
