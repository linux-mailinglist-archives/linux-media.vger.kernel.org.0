Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4175398064
	for <lists+linux-media@lfdr.de>; Wed, 21 Aug 2019 18:40:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729643AbfHUQkd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Aug 2019 12:40:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:57608 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728806AbfHUQkd (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Aug 2019 12:40:33 -0400
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 27AE22339F;
        Wed, 21 Aug 2019 16:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1566405632;
        bh=eLVhmjLNhIMLZZjdqWDukswrRlkV0kuXO3dS9QrC/aU=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=IdqhTaUrH8ylMxq2eaVChVjp1DLFMiNAP91pxJOzldiPcbNQ1FLreYnx8wWl5YtIK
         EsjjJj69ldHa/PgtAsQw7+NgLs1xqf+0XnGGTYXRfNPLdAe/N9vPCppd6gVvMRllRD
         weTqJ/6/+iGvy6EpFqWFjL3xf2DxzQ8EnzjwjnY0=
Received: by mail-lf1-f48.google.com with SMTP id b17so2292799lff.7;
        Wed, 21 Aug 2019 09:40:32 -0700 (PDT)
X-Gm-Message-State: APjAAAX3xqocWgcOf5RgBzc13tgMYxSN2beSrRi5rwfyqzQTmAUqnuii
        J/e1znW5SMdLX4HLNwojn1tqOOiJKhaoftn8jkY=
X-Google-Smtp-Source: APXvYqwT/36UbVBX6mo7+xkO8e2JanFOODu9B3xjLG9XlzyxH4yIuiugMn/CvKnM9WXnCEWyDwVmzXHNJGzCDTOl6Lg=
X-Received: by 2002:a19:82c3:: with SMTP id e186mr18643045lfd.18.1566405630317;
 Wed, 21 Aug 2019 09:40:30 -0700 (PDT)
MIME-Version: 1.0
References: <20190820094027.4144-1-ribalda@kernel.org> <20190820094027.4144-2-ribalda@kernel.org>
 <1566315769.3030.20.camel@pengutronix.de>
In-Reply-To: <1566315769.3030.20.camel@pengutronix.de>
From:   Ricardo Ribalda Delgado <ribalda@kernel.org>
Date:   Wed, 21 Aug 2019 18:40:13 +0200
X-Gmail-Original-Message-ID: <CAPybu_0bNN7E6wqYXZkFC=5y=rHxteHVsMd0moeVWb7m8yy3NA@mail.gmail.com>
Message-ID: <CAPybu_0bNN7E6wqYXZkFC=5y=rHxteHVsMd0moeVWb7m8yy3NA@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] Documentation: media: Describe V4L2_CID_UNIT_CELL_SIZE
To:     Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Philipp

On Tue, Aug 20, 2019 at 5:42 PM Philipp Zabel <p.zabel@pengutronix.de> wrote:
>
> On Tue, 2019-08-20 at 11:40 +0200, Ricardo Ribalda Delgado wrote:
> > New control to pass to userspace the width/height of a pixel. Which is
> > needed for calibration and lens selection.
> >
> > Signed-off-by: Ricardo Ribalda Delgado <ribalda@kernel.org>
> > ---
> >  Documentation/media/uapi/v4l/ext-ctrls-camera.rst | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/Documentation/media/uapi/v4l/ext-ctrls-camera.rst b/Documentation/media/uapi/v4l/ext-ctrls-camera.rst
> > index 51c1d5c9eb00..b43047d4e7a1 100644
> > --- a/Documentation/media/uapi/v4l/ext-ctrls-camera.rst
> > +++ b/Documentation/media/uapi/v4l/ext-ctrls-camera.rst
> > @@ -510,6 +510,14 @@ enum v4l2_scene_mode -
> >      value down. A value of zero stops the motion if one is in progress
> >      and has no effect otherwise.
> >
> > +``V4L2_CID_UNIT_CELL_SIZE (struct)``
> > +    This control returns the unit cell size in nanometres. The struct provides
> > +    the width and the height in separated fields to take into consideration
> > +    asymmetric pixels and/or hardware binning.
> > +    The unit cell consist on the whole area of the pixel, sensitive and
> > +    non-sensitive.
>
> "consists of", otherwise this looks unambiguous to me.
>
Thanks, fixing on v3. Will send after I get more feedback



> I'm not sure if it is required to add a table for struct v4l2_area,
> similarly to the other compound controls.
>
> > +    This control is required for automatic calibration sensors/cameras.
> > +
> >  .. [#f1]
> >     This control may be changed to a menu control in the future, if more
> >     options are required.
>
> regards
> Philipp
