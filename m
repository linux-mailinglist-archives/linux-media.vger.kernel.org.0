Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0519C5814C4
	for <lists+linux-media@lfdr.de>; Tue, 26 Jul 2022 16:05:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233180AbiGZOFZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Jul 2022 10:05:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230430AbiGZOFY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Jul 2022 10:05:24 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6A0615FF6
        for <linux-media@vger.kernel.org>; Tue, 26 Jul 2022 07:05:22 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 786E0735;
        Tue, 26 Jul 2022 16:05:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1658844320;
        bh=BjrxfjD0Oh8Ii96Cfaz3qVc1XM5xBSREBxRy4ate+zM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KAOr3i55VQU4Pw1oA8HrELEu7yMfmI38+z9O4FbFkY87VtlU/I225/3v3OYzz95M0
         RiI5bJsRRKTsvpJJjr4xh2+yxblMBP0ogZUC25BIcdQPSqCBukV3z0spkAHl21U3kE
         NN5rhFv6Zp+/xoacdx8YkMfqx7wd4unNYEclcXmE=
Date:   Tue, 26 Jul 2022 17:05:15 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH] media: uvcvideo: Fix invalid pointer in
 uvc_ctrl_init_ctrl()
Message-ID: <Yt/0m0eNvr6n86qu@pendragon.ideasonboard.com>
References: <20220718121219.16079-1-laurent.pinchart@ideasonboard.com>
 <CANiDSCuSW4et50rjNi33z4mwhy6fAnub1cXZFJ2wUKaOObTD8Q@mail.gmail.com>
 <CANiDSCvh0Zy8PbMW5yFWfExjEzPTdvWGjYmGCw=eychHFs0sAw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CANiDSCvh0Zy8PbMW5yFWfExjEzPTdvWGjYmGCw=eychHFs0sAw@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ricardo,

On Tue, Jul 26, 2022 at 02:11:07PM +0200, Ricardo Ribalda wrote:
> Arghh
> 
> it seems like the merged version was not the latest version, so yes,
> this patch is needed.

Sorry about that :-S

> Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>

Mauro, this is a fix for v5.20, could you apply it to your tree ?

> By the way, are you still interested in this:
> 
> https://patchwork.linuxtv.org/project/linux-media/patch/20220617235610.321917-5-ribalda@chromium.org/
> 
> So I prepare a new version for it.

Thank you :-)

> On Tue, 26 Jul 2022 at 14:00, Ricardo Ribalda <ribalda@chromium.org> wrote:
> >
> > Hi Laurent
> >
> > Is this needed?
> >
> > It is already part of v8
> >
> > https://patchwork.linuxtv.org/project/linux-media/patch/20220617235610.321917-3-ribalda@chromium.org/
> >
> > On Mon, 18 Jul 2022 at 14:12, Laurent Pinchart
> > <laurent.pinchart@ideasonboard.com> wrote:
> > >
> > > The handling of per-device mappings introduced in commit 86f7ef773156
> > > ("media: uvcvideo: Add support for per-device control mapping
> > > overrides") overwrote the mapping variable after it was initialized and
> > > before it was used, leading to usage of an invalid pointer for devices
> > > with per-device mappings. Fix it.
> > >
> > > Fixes: 86f7ef773156 ("media: uvcvideo: Add support for per-device control mapping overrides")
> > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > ---
> > >  drivers/media/usb/uvc/uvc_ctrl.c | 8 +++++---
> > >  1 file changed, 5 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> > > index e4826a846861..8c208db9600b 100644
> > > --- a/drivers/media/usb/uvc/uvc_ctrl.c
> > > +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> > > @@ -2413,9 +2413,8 @@ static void uvc_ctrl_init_ctrl(struct uvc_video_chain *chain,
> > >  {
> > >         const struct uvc_control_info *info = uvc_ctrls;
> > >         const struct uvc_control_info *iend = info + ARRAY_SIZE(uvc_ctrls);
> > > -       const struct uvc_control_mapping *mapping = uvc_ctrl_mappings;
> > > -       const struct uvc_control_mapping *mend =
> > > -               mapping + ARRAY_SIZE(uvc_ctrl_mappings);
> > > +       const struct uvc_control_mapping *mapping;
> > > +       const struct uvc_control_mapping *mend;
> > >
> > >         /*
> > >          * XU controls initialization requires querying the device for control
> > > @@ -2468,6 +2467,9 @@ static void uvc_ctrl_init_ctrl(struct uvc_video_chain *chain,
> > >         }
> > >
> > >         /* Process common mappings next. */
> > > +       mapping = uvc_ctrl_mappings;
> > > +       mend = mapping + ARRAY_SIZE(uvc_ctrl_mappings);
> > > +
> > >         for (; mapping < mend; ++mapping) {
> > >                 if (uvc_entity_match_guid(ctrl->entity, mapping->entity) &&
> > >                     ctrl->info.selector == mapping->selector)
> > >
> > > base-commit: 8bd1dbf8d580c425605fb8936309a4e9745a7a95
> > > prerequisite-patch-id: 89d2dc61eb83afb89fb075a63e161ea0b87fdcc7
> > > prerequisite-patch-id: 01354ee4b874fea1acc040a23badff034588362f
> > > prerequisite-patch-id: 7ae47f109892b89675acbdc0c6bcc1487436ec78

-- 
Regards,

Laurent Pinchart
