Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4F1A3762F82
	for <lists+linux-media@lfdr.de>; Wed, 26 Jul 2023 10:19:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229822AbjGZITE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Jul 2023 04:19:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230286AbjGZISF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Jul 2023 04:18:05 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0217165B3;
        Wed, 26 Jul 2023 01:07:48 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3A10B8D;
        Wed, 26 Jul 2023 10:06:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1690358808;
        bh=CKhmzJ56UgWNHoCThwkHdBEUTSxWCrCFRrFIdc0bWaE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=VVzMv6Xt/8EPe3v41U5IOcy+UFXJUCG9lS1XRbJf8FNCmkC25ReP8qqVnUfxqVW83
         zlNgwIiUNvRIgy93mHkY8OwObDa7ssq6HF136dokFbslsNXh5W7RohqySf8APO+iyg
         ZxhZ30hti1njNxlXXCKlX9p7BIruc3X0XYCdmNJE=
Date:   Wed, 26 Jul 2023 11:07:53 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        stable@kernel.org, Zubin Mithra <zsm@chromium.org>,
        Kai =?utf-8?Q?Wasserb=C3=A4ch?= <kai@dev.carbon-project.org>,
        Thorsten Leemhuis <linux@leemhuis.info>
Subject: Re: [PATCH v2] media: uvcvideo: Fix OOB read
Message-ID: <20230726080753.GX31069@pendragon.ideasonboard.com>
References: <20230717-uvc-oob-v2-1-c7745a8d5847@chromium.org>
 <20230725213451.GU31069@pendragon.ideasonboard.com>
 <CANiDSCttkqows7PZS823Jpk-CqK9Gz2rujF_R4SPDi=wcPJ2LA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CANiDSCttkqows7PZS823Jpk-CqK9Gz2rujF_R4SPDi=wcPJ2LA@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ricardo,

(CC'ing Kai and Thorsten who have added the check to checkpatch)

On Wed, Jul 26, 2023 at 08:24:50AM +0200, Ricardo Ribalda wrote:
> On Tue, 25 Jul 2023 at 23:34, Laurent Pinchart wrote:
> > On Thu, Jul 20, 2023 at 05:46:54PM +0000, Ricardo Ribalda wrote:
> > > If the index provided by the user is bigger than the mask size, we might do an
> > > out of bound read.
> > >
> > > CC: stable@kernel.org
> > > Fixes: 40140eda661e ("media: uvcvideo: Implement mask for V4L2_CTRL_TYPE_MENU")
> > > Reported-by: Zubin Mithra <zsm@chromium.org>
> >
> > checkpatch now requests a Reported-by tag to be immediately followed by
> > a Closes tag that contains the URL to the report. Could you please
> > provide that ?
>
> I saw that, but the URL is kind of private:
> 
> Closes: http://issuetracker.google.com/issues/289975230

Ah :-S I wonder if we should drop the Reported-by tag then ?

> > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > > ---
> > > Avoid reading index >= 31
> > > ---
> > > Changes in v2:
> > > - Use BITS_PER_TYPE instead of 32 (thanks Sergey).
> > > - Add Reported-by tag.
> > > - Link to v1: https://lore.kernel.org/r/20230717-uvc-oob-v1-1-f5b9b4aba3b4@chromium.org
> > > ---
> > >  drivers/media/usb/uvc/uvc_ctrl.c | 3 +++
> > >  1 file changed, 3 insertions(+)
> > >
> > > diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> > > index 5e9d3da862dd..e59a463c2761 100644
> > > --- a/drivers/media/usb/uvc/uvc_ctrl.c
> > > +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> > > @@ -1402,6 +1402,9 @@ int uvc_query_v4l2_menu(struct uvc_video_chain *chain,
> > >       query_menu->id = id;
> > >       query_menu->index = index;
> > >
> > > +     if (index >= BITS_PER_TYPE(mapping->menu_mask))
> > > +             return -EINVAL;
> > > +
> >
> > I'd move this a few lines up, before setting query_menu.
> 
> SGTM, I just wanted to clear all the fields to mimic the other error
> paths of the function.

I'm fine with that too if you prefer.

> > With those minor changes,
> >
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >
> > There's no need for a v3, I can handle the changes locally, but I need
> > the URL for the Closes tag.
> >
> > >       ret = mutex_lock_interruptible(&chain->ctrl_mutex);
> > >       if (ret < 0)
> > >               return -ERESTARTSYS;
> > >
> > > ---
> > > base-commit: fdf0eaf11452d72945af31804e2a1048ee1b574c
> > > change-id: 20230717-uvc-oob-4b0148a00417

-- 
Regards,

Laurent Pinchart
