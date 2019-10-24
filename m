Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C768AE348E
	for <lists+linux-media@lfdr.de>; Thu, 24 Oct 2019 15:44:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393718AbfJXNn5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Oct 2019 09:43:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:35274 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390977AbfJXNn5 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Oct 2019 09:43:57 -0400
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2E1CA21872;
        Thu, 24 Oct 2019 13:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1571924635;
        bh=caSJPvAyaGnacOClomQ1HCfNRqauq+PIcyVlnhrA6XI=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=tUa0Pg2Mn3DvNc6g2InTIhVUe2oTAODOSrgEYn+XRxvy6ZmrAOrFKaQOst92uuLBv
         S2JT3ThsRk5QEXP4sUlFhdnwyxQAIQXUoiMBgk9TbC2MUBCIOlXv7xk/OclQPV869c
         Avr220gPzM4n7H/1UF9mH9zBRsWClxGquhMFZEl8=
Received: by mail-lj1-f176.google.com with SMTP id u22so7091590lji.7;
        Thu, 24 Oct 2019 06:43:55 -0700 (PDT)
X-Gm-Message-State: APjAAAW843DnVNtoMEx79QiMR3E1dU9Oiqr/aj0hf60mEYzNUMRnDF/n
        7K19WZNNJnkU7jyZG8djqumYIknGcjjnUPo+z6o=
X-Google-Smtp-Source: APXvYqzONfnyNEwRsWpMnM9gNIgiRSukkKKMwEXSa9QMdk8AsXyfGNhvzssWnDDRpo2MxLwilM9jDntvj1Q+BKD6ips=
X-Received: by 2002:a2e:9848:: with SMTP id e8mr7727758ljj.148.1571924633210;
 Thu, 24 Oct 2019 06:43:53 -0700 (PDT)
MIME-Version: 1.0
References: <20191024123526.4778-1-ribalda@kernel.org> <20191024133333.GE3966@mara.localdomain>
In-Reply-To: <20191024133333.GE3966@mara.localdomain>
From:   Ricardo Ribalda Delgado <ribalda@kernel.org>
Date:   Thu, 24 Oct 2019 15:43:36 +0200
X-Gmail-Original-Message-ID: <CAPybu_2hdvq_M-8X0_-MVxSjaJ8H0x+zDRaa4Cf=b0PQtVnzmQ@mail.gmail.com>
Message-ID: <CAPybu_2hdvq_M-8X0_-MVxSjaJ8H0x+zDRaa4Cf=b0PQtVnzmQ@mail.gmail.com>
Subject: Re: [PATCH v2] Documentation: media: *_DEFAULT targets for subdevs
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari

Lets say the user wants to select the active pixels. He needs to set
the crop and the compose.

1) he gets V4L2_SEL_TGT_CROP_DEFAULT

2) he sets V4L2_SEL_TGT_CROP

How does he knows which compose to use? What if the compose starts at
(0,0) instead of (32,32)....?

I think it is easier if

3) he gets V4L2_SEL_TGT_COMPOSE_DEFAULT

4) he sets V4L2_SEL_TGT_COMPOSE

This is similar as how we do it today with a v4l2_device. What if we
simply replicate that behaviour?


Best regards

On Thu, Oct 24, 2019 at 3:32 PM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> Hi Ricardo,
>
> On Thu, Oct 24, 2019 at 02:35:25PM +0200, Ricardo Ribalda Delgado wrote:
> > Some sensors have optical blanking areas, this is, pixels that are
> > painted and do not account for light, only noise.
> >
> > These special pixels are very useful for calibrating the sensor, but
> > should not be displayed on a DEFAULT target.
> >
> > Signed-off-by: Ricardo Ribalda Delgado <ribalda@kernel.org>
> > ---
> >
> > v2: Changes by Sakari Ailus <sakari.ailus@linux.intel.com>
> >
> > Only change CROP_DEFAULT
> >
> >  Documentation/media/uapi/v4l/v4l2-selection-targets.rst | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> >
> > diff --git a/Documentation/media/uapi/v4l/v4l2-selection-targets.rst b/Documentation/media/uapi/v4l/v4l2-selection-targets.rst
> > index f74f239b0510..41c6674ec283 100644
> > --- a/Documentation/media/uapi/v4l/v4l2-selection-targets.rst
> > +++ b/Documentation/media/uapi/v4l/v4l2-selection-targets.rst
> > @@ -38,8 +38,10 @@ of the two interfaces they are used.
> >      * - ``V4L2_SEL_TGT_CROP_DEFAULT``
> >        - 0x0001
> >        - Suggested cropping rectangle that covers the "whole picture".
> > +        This includes only active pixels and excludes other non-active
> > +        pixels such as black pixels.
> > +      - Yes
> >        - Yes
> > -      - No
> >      * - ``V4L2_SEL_TGT_CROP_BOUNDS``
> >        - 0x0002
> >        - Bounds of the crop rectangle. All valid crop rectangles fit inside
> > @@ -61,7 +63,7 @@ of the two interfaces they are used.
> >        - 0x0101
> >        - Suggested composition rectangle that covers the "whole picture".
> >        - Yes
> > -      - No
> > +      - Yes
>
> This is COMPOSE_DEFAULT that wasn't meant to be changed. So with this chunk
> dropped,
>
> Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>
>
> >      * - ``V4L2_SEL_TGT_COMPOSE_BOUNDS``
> >        - 0x0102
> >        - Bounds of the compose rectangle. All valid compose rectangles fit
>
> --
> Sakari Ailus
> sakari.ailus@linux.intel.com
