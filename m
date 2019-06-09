Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E19193A57F
	for <lists+linux-media@lfdr.de>; Sun,  9 Jun 2019 14:37:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728471AbfFIMhY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 9 Jun 2019 08:37:24 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:55968 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728319AbfFIMhY (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 9 Jun 2019 08:37:24 -0400
Received: from pendragon.ideasonboard.com (unknown [IPv6:2a02:a03f:44f0:8500:ca05:8177:199c:fed4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1C8B55D;
        Sun,  9 Jun 2019 14:37:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1560083842;
        bh=4VmSD1fCDWtQKOT00EP3E9/y9AXxX4fON/WD3caVHSY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fRRy8z5S8Ld9QuyxX7ihZhDH4S+/cuMZCY7OE9fZI/KrQAVEdXn7ecYhVXRWV2hHD
         XRkfWf6EkJTTLE6A0bVCCjUnUp71vkY5zk6Eif3xUJk7mRWOu9nmfbT6ivY5DwI6gl
         cLHEgSEvyhvQnoH/MFBTGXMuxtX7FtWffwZ7tbyE=
Date:   Sun, 9 Jun 2019 15:37:08 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH] v4l: rcar-fcp: Read IP version register at probe time
Message-ID: <20190609123708.GF4778@pendragon.ideasonboard.com>
References: <20190608125331.29146-1-laurent.pinchart+renesas@ideasonboard.com>
 <CAMuHMdUobhMrDYBoYVo091re7LGrYEGgCsXbMh8a4MrF4zoP7g@mail.gmail.com>
 <20190609100845.GA4778@pendragon.ideasonboard.com>
 <CAMuHMdVBT0bVb-e3dDEz0-SP0GA+xoq3qrjXv66rFr9CVkHiEQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAMuHMdVBT0bVb-e3dDEz0-SP0GA+xoq3qrjXv66rFr9CVkHiEQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Geert,

On Sun, Jun 09, 2019 at 01:51:24PM +0200, Geert Uytterhoeven wrote:
> On Sun, Jun 9, 2019 at 12:09 PM Laurent Pinchart wrote:
> > On Sun, Jun 09, 2019 at 10:06:19AM +0200, Geert Uytterhoeven wrote:
> > > On Sat, Jun 8, 2019 at 2:55 PM Laurent Pinchart wrote:
> > > > This helps identifying the IP core version, for debugging purpose only
> > > > for now.
> > > >
> > > > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > >
> > > Thanks for your patch!
> > >
> > > > --- a/drivers/media/platform/rcar-fcp.c
> > > > +++ b/drivers/media/platform/rcar-fcp.c
> 
> > > > +       if (IS_ERR(fcp->iomem))
> > > > +               return PTR_ERR(fcp->iomem);
> > > > +
> > > > +       pm_runtime_get_sync(&pdev->dev);
> > > > +       version = rcar_fcp_read(fcp, FCP_VCR);
> > >
> > > Please note that rcar_fcp_read() does not exist in upstream nor next,
> > > and linux-renesas-soc hasn't seen the patch that added it.
> >
> > That's why it was added in this patch :-)
> 
> Bummer... Do you plan to have other users?
> If not, I'd just open-code this single-line function.

Yes, with FNCL support there should be other users.

-- 
Regards,

Laurent Pinchart
