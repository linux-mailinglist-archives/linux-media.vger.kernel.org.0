Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F1C466D7FBF
	for <lists+linux-media@lfdr.de>; Wed,  5 Apr 2023 16:40:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237398AbjDEOkP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 Apr 2023 10:40:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237738AbjDEOkN (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 Apr 2023 10:40:13 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD1613A8E
        for <linux-media@vger.kernel.org>; Wed,  5 Apr 2023 07:40:10 -0700 (PDT)
Received: from pendragon.ideasonboard.com (softbank219059148246.bbtec.net [219.59.148.246])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2318D183F;
        Wed,  5 Apr 2023 16:40:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1680705609;
        bh=UvSZxqKv2Y5/rUonwq5aMnY4EJ6FzRPvZS+Fu5d9JDY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WgFBQDtDiyZy1m7M0NYacInf4q1ZET0Xp8gelu+O2ljud/e7fwIpGnwAPiFShdo19
         7YHckHY+el2cZaJLSau8MXc2XWOR88dlV0tlB9dGklK2J/KdDNPwdfaDqiJzu/8JCY
         B0F0ioA4u5Uq0wxMgfxPeU18x4Hs3K7WmwTTqBeo=
Date:   Wed, 5 Apr 2023 17:40:17 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     Max Staudt <mstaudt@chromium.org>, linux-media@vger.kernel.org
Subject: Re: [GIT PULL FOR v6.4] uvcvideo fix
Message-ID: <20230405144017.GA17034@pendragon.ideasonboard.com>
References: <20230325191656.GD9876@pendragon.ideasonboard.com>
 <CANiDSCt_ViUp-LszTyLamxXs6Ddx6FSzzfRsdyy6RC4y-5Cqww@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CANiDSCt_ViUp-LszTyLamxXs6Ddx6FSzzfRsdyy6RC4y-5Cqww@mail.gmail.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Mar 28, 2023 at 09:47:56AM +0200, Ricardo Ribalda wrote:
> Hi Mauro, Hi Laurent
> 
> Could you wait a bit before you take this one? I think we have found a
> cleaner way to do this.

Works for me. I should have time to review the new fix next week.

> On Sat, 25 Mar 2023 at 20:22, Laurent Pinchart wrote:
> >
> > Hi Mauro,
> >
> > The following changes since commit 71937240a472ee551ac8de0e7429b9d49884a388:
> >
> >   media: ov2685: Select VIDEO_V4L2_SUBDEV_API (2023-03-20 16:32:18 +0100)
> >
> > are available in the Git repository at:
> >
> >   git://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git tags/media-uvc-next-20230325
> >
> > for you to fetch changes up to 1681706c6b8a15fbc0d037b97c0f5e9cf9af67cc:
> >
> >   media: uvcvideo: Cancel async worker earlier (2023-03-25 20:59:49 +0200)
> >
> > ----------------------------------------------------------------
> > media: uvcvideo: Fix crash at disconnect time
> >
> > ----------------------------------------------------------------
> > Guenter Roeck (1):
> >       media: uvcvideo: Cancel async worker earlier
> >
> >  drivers/media/usb/uvc/uvc_ctrl.c   | 11 +++++++----
> >  drivers/media/usb/uvc/uvc_driver.c |  1 +
> >  drivers/media/usb/uvc/uvcvideo.h   |  1 +
> >  3 files changed, 9 insertions(+), 4 deletions(-)

-- 
Regards,

Laurent Pinchart
