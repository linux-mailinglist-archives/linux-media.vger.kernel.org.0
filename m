Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E23A0702FF1
	for <lists+linux-media@lfdr.de>; Mon, 15 May 2023 16:34:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239271AbjEOOeJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 May 2023 10:34:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241943AbjEOOeF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 May 2023 10:34:05 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A70572705
        for <linux-media@vger.kernel.org>; Mon, 15 May 2023 07:33:37 -0700 (PDT)
Received: from pendragon.ideasonboard.com (p7097156-ipoefx.ipoe.ocn.ne.jp [153.231.19.155])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1B3697E1;
        Mon, 15 May 2023 16:32:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1684161171;
        bh=q440gIjz2olfc2UIzE9A/T427Qdcv28N3pFGzlTx7EM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jHmheP1KM5JmemX0TDrtWDG6511Tzxvpdi+YdW0idieRl50pYzNGYmlvYOairlATW
         377POSZonPF7I6GFQTq1M+aP032RXLwxHEXqnc80VpqyPB6gaH8QP0+/q1T3QZa3BR
         jVkXxXHTZp+g9DpvW/f7wbpbBXzvlNEKt41Mmq7E=
Date:   Mon, 15 May 2023 17:32:58 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     linux-media@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH v2 5/7] media: uvcvideo: Increment intervals pointer at
 end of parsing
Message-ID: <20230515143258.GA30231@pendragon.ideasonboard.com>
References: <20230506071427.28108-1-laurent.pinchart@ideasonboard.com>
 <20230506071427.28108-6-laurent.pinchart@ideasonboard.com>
 <CANiDSCsLvcsym2nscNuw3oZsZvAnuWO8OD9PGk3==5Wn6oU2rw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CANiDSCsLvcsym2nscNuw3oZsZvAnuWO8OD9PGk3==5Wn6oU2rw@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ricardo,

On Mon, May 15, 2023 at 03:22:13PM +0200, Ricardo Ribalda wrote:
> On Sat, 6 May 2023 at 09:14, Laurent Pinchart wrote:
> >
> > The intervals pointer is incremented for each interval when parsing the
> > format descriptor. This doesn't cause any issue as such, but gets in the
> > way of constifying some pointers. Modify the parsing code to index the
> > intervals pointer as an array and increment it in one go at end of
> > parsing.
> >
> > Careful readers will notice that the maxIntervalIndex variable is set to
> > 1 instead of n - 2 when bFrameIntervalType has a zero value. This is
> > functionally equivalent, as n is equal to 3 in that case.
> >
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>
> Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
>
> > ---
> >  drivers/media/usb/uvc/uvc_driver.c | 10 +++++++---
> >  1 file changed, 7 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> > index 446bd8ff128c..11e4fa007f3f 100644
> > --- a/drivers/media/usb/uvc/uvc_driver.c
> > +++ b/drivers/media/usb/uvc/uvc_driver.c
> > @@ -370,6 +370,8 @@ static int uvc_parse_format(struct uvc_device *dev,
> >          */
> >         while (buflen > 2 && buffer[1] == USB_DT_CS_INTERFACE &&
> >                buffer[2] == ftype) {
> > +               unsigned int maxIntervalIndex;
> > +
> >                 frame = &format->frames[format->nframes];
> >                 if (ftype != UVC_VS_FRAME_FRAME_BASED)
> >                         n = buflen > 25 ? buffer[25] : 0;
> > @@ -418,7 +420,7 @@ static int uvc_parse_format(struct uvc_device *dev,
> >
> >                 for (i = 0; i < n; ++i) {
> >                         interval = get_unaligned_le32(&buffer[26+4*i]);
> > -                       *(*intervals)++ = interval ? interval : 1;
> > +                       (*intervals)[i] = interval ? interval : 1;
> >                 }
> >
> >                 /*
> > @@ -440,11 +442,11 @@ static int uvc_parse_format(struct uvc_device *dev,
> >                                 * frame->wWidth * frame->wHeight / 8;
> >
> >                 /* Clamp the default frame interval to the boundaries. */
> > -               n -= frame->bFrameIntervalType ? 1 : 2;
> > +               maxIntervalIndex = frame->bFrameIntervalType ? n - 1 : 1;
> 
> Maybe it is worth mentioning that bFrameIntervalType == 0 is a
> continuous interval. idex 0 is min and 1 is max.

I'll update the comment to

                /*
                 * Clamp the default frame interval to the boundaries. A zero
                 * bFrameIntervalType value indicates a continuous frame
                 * interval range, with dwFrameInterval[0] storing the minimum
                 * value and dwFrameInterval[1] storing the maximum value.
                 */

> >                 frame->dwDefaultFrameInterval =
> >                         clamp(frame->dwDefaultFrameInterval,
> >                               frame->dwFrameInterval[0],
> > -                             frame->dwFrameInterval[n]);
> > +                             frame->dwFrameInterval[maxIntervalIndex]);
> >
> >                 /*
> >                  * Some devices report frame intervals that are not functional.
> > @@ -463,6 +465,8 @@ static int uvc_parse_format(struct uvc_device *dev,
> >                         (100000000 / frame->dwDefaultFrameInterval) % 10);
> >
> >                 format->nframes++;
> > +               *intervals += n;
> > +
> >                 buflen -= buffer[0];
> >                 buffer += buffer[0];
> >         }

-- 
Regards,

Laurent Pinchart
