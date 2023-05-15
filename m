Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 34CB4702FF8
	for <lists+linux-media@lfdr.de>; Mon, 15 May 2023 16:34:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241373AbjEOOel (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 May 2023 10:34:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241798AbjEOOeT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 May 2023 10:34:19 -0400
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com [IPv6:2607:f8b0:4864:20::735])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7033712B
        for <linux-media@vger.kernel.org>; Mon, 15 May 2023 07:34:04 -0700 (PDT)
Received: by mail-qk1-x735.google.com with SMTP id af79cd13be357-7577ef2fa31so2685406885a.0
        for <linux-media@vger.kernel.org>; Mon, 15 May 2023 07:34:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1684161243; x=1686753243;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZyfpHS19yB8cKEX9hxd6VfI5oCJ35NXa22+BtTTcUd8=;
        b=PBLuU+lJ/ugUKNgcqczjLQ39/Xc+GEzhZOlOWnltEvVNGNOsbuVHPOqTZLSM8oK5PW
         lVTyWXVGcdKu1rwD2TulP0XmIgDdbeVwMjHSoeyZTSqoYeucQ5KZbqjg/5bXZXLHPTtr
         ezaiUflI5iR8VN2rEK+PDDtsF0bYKeDC1PUlg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684161243; x=1686753243;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZyfpHS19yB8cKEX9hxd6VfI5oCJ35NXa22+BtTTcUd8=;
        b=fwBwH0/lzyKfaI3VEpCzfqg3RJA3igirI+/sj7kNUInkTO61Vl89RVOFmyIEzJoo3p
         gjfVj41H8rPXHO1ElcXn5ZqyLAdaTg4OyeyTFQeFs+sUSfLCMN9a2Hw06qJifqr/oIrs
         VmFQWGZBa47zpbQFkx/G2MDzAGKMcPVUaCWg1C5brlUiTOe5zf6FOgOB80YuUvzVuQ41
         zXDS02blKSw2rvz34c67Ac2gs/h3eFtuSTZNorR9/rUToVq05wvhROi2tXpeD7OjNfkV
         4jWbDF7naOTz2ptzeaIJP6uCSw2jJ3hfF0DO1jvUhh6WhicOv2stmh1vw/wE5kYT6pdw
         Up6g==
X-Gm-Message-State: AC+VfDz2Fy7ajR21iScIARYqd58hyHICnJdu3V7CcTGeRSaBylWKYlpe
        yQBqy2aCnfPGaoBWPGfgi6fGi6LJwI7pjP2OHYY=
X-Google-Smtp-Source: ACHHUZ7yEBvL79QH9rC664UPvg8wX2bDQ4O1rhY8bZsELoqdG+jdb4Pwd0QeDPw1JzwrggWH7125NA==
X-Received: by 2002:a05:6214:262d:b0:5f1:6a6a:f556 with SMTP id gv13-20020a056214262d00b005f16a6af556mr59564682qvb.16.1684161242993;
        Mon, 15 May 2023 07:34:02 -0700 (PDT)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com. [209.85.222.177])
        by smtp.gmail.com with ESMTPSA id j3-20020a0cab83000000b0061ac0b43a16sm4905477qvb.103.2023.05.15.07.34.02
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 May 2023 07:34:02 -0700 (PDT)
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-759413d99afso432103185a.1
        for <linux-media@vger.kernel.org>; Mon, 15 May 2023 07:34:02 -0700 (PDT)
X-Received: by 2002:ad4:5f8e:0:b0:616:5755:ca5d with SMTP id
 jp14-20020ad45f8e000000b006165755ca5dmr57419062qvb.4.1684161242074; Mon, 15
 May 2023 07:34:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230506071427.28108-1-laurent.pinchart@ideasonboard.com>
 <20230506071427.28108-6-laurent.pinchart@ideasonboard.com>
 <CANiDSCsLvcsym2nscNuw3oZsZvAnuWO8OD9PGk3==5Wn6oU2rw@mail.gmail.com> <20230515143258.GA30231@pendragon.ideasonboard.com>
In-Reply-To: <20230515143258.GA30231@pendragon.ideasonboard.com>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Mon, 15 May 2023 16:33:51 +0200
X-Gmail-Original-Message-ID: <CANiDSCtzU2RKx0KM1VVy-gVvo+-3yJnRAYhNcYRL_GALks+LTQ@mail.gmail.com>
Message-ID: <CANiDSCtzU2RKx0KM1VVy-gVvo+-3yJnRAYhNcYRL_GALks+LTQ@mail.gmail.com>
Subject: Re: [PATCH v2 5/7] media: uvcvideo: Increment intervals pointer at
 end of parsing
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent

On Mon, 15 May 2023 at 16:33, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Ricardo,
>
> On Mon, May 15, 2023 at 03:22:13PM +0200, Ricardo Ribalda wrote:
> > On Sat, 6 May 2023 at 09:14, Laurent Pinchart wrote:
> > >
> > > The intervals pointer is incremented for each interval when parsing the
> > > format descriptor. This doesn't cause any issue as such, but gets in the
> > > way of constifying some pointers. Modify the parsing code to index the
> > > intervals pointer as an array and increment it in one go at end of
> > > parsing.
> > >
> > > Careful readers will notice that the maxIntervalIndex variable is set to
> > > 1 instead of n - 2 when bFrameIntervalType has a zero value. This is
> > > functionally equivalent, as n is equal to 3 in that case.
> > >
> > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >
> > Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> >
> > > ---
> > >  drivers/media/usb/uvc/uvc_driver.c | 10 +++++++---
> > >  1 file changed, 7 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> > > index 446bd8ff128c..11e4fa007f3f 100644
> > > --- a/drivers/media/usb/uvc/uvc_driver.c
> > > +++ b/drivers/media/usb/uvc/uvc_driver.c
> > > @@ -370,6 +370,8 @@ static int uvc_parse_format(struct uvc_device *dev,
> > >          */
> > >         while (buflen > 2 && buffer[1] == USB_DT_CS_INTERFACE &&
> > >                buffer[2] == ftype) {
> > > +               unsigned int maxIntervalIndex;
> > > +
> > >                 frame = &format->frames[format->nframes];
> > >                 if (ftype != UVC_VS_FRAME_FRAME_BASED)
> > >                         n = buflen > 25 ? buffer[25] : 0;
> > > @@ -418,7 +420,7 @@ static int uvc_parse_format(struct uvc_device *dev,
> > >
> > >                 for (i = 0; i < n; ++i) {
> > >                         interval = get_unaligned_le32(&buffer[26+4*i]);
> > > -                       *(*intervals)++ = interval ? interval : 1;
> > > +                       (*intervals)[i] = interval ? interval : 1;
> > >                 }
> > >
> > >                 /*
> > > @@ -440,11 +442,11 @@ static int uvc_parse_format(struct uvc_device *dev,
> > >                                 * frame->wWidth * frame->wHeight / 8;
> > >
> > >                 /* Clamp the default frame interval to the boundaries. */
> > > -               n -= frame->bFrameIntervalType ? 1 : 2;
> > > +               maxIntervalIndex = frame->bFrameIntervalType ? n - 1 : 1;
> >
> > Maybe it is worth mentioning that bFrameIntervalType == 0 is a
> > continuous interval. idex 0 is min and 1 is max.
>
> I'll update the comment to
>
>                 /*
>                  * Clamp the default frame interval to the boundaries. A zero
>                  * bFrameIntervalType value indicates a continuous frame
>                  * interval range, with dwFrameInterval[0] storing the minimum
>                  * value and dwFrameInterval[1] storing the maximum value.
>                  */
>
Thanks! It looks much better :)


> > >                 frame->dwDefaultFrameInterval =
> > >                         clamp(frame->dwDefaultFrameInterval,
> > >                               frame->dwFrameInterval[0],
> > > -                             frame->dwFrameInterval[n]);
> > > +                             frame->dwFrameInterval[maxIntervalIndex]);
> > >
> > >                 /*
> > >                  * Some devices report frame intervals that are not functional.
> > > @@ -463,6 +465,8 @@ static int uvc_parse_format(struct uvc_device *dev,
> > >                         (100000000 / frame->dwDefaultFrameInterval) % 10);
> > >
> > >                 format->nframes++;
> > > +               *intervals += n;
> > > +
> > >                 buflen -= buffer[0];
> > >                 buffer += buffer[0];
> > >         }
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda
