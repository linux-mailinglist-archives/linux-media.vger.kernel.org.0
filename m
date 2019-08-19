Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 63AF192566
	for <lists+linux-media@lfdr.de>; Mon, 19 Aug 2019 15:44:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727780AbfHSNoh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Aug 2019 09:44:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:51826 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727352AbfHSNoh (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Aug 2019 09:44:37 -0400
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BB7472147A;
        Mon, 19 Aug 2019 13:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1566222276;
        bh=QsuErG6G4JUwjRwQku8m4PfM2QFQt2pqw4Z7Fauyazw=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=sRbeMQI2hLo3ztUkq4zRTZmOA9zXBfJSALMcTm4OYNeMBD0zev0mm2uM9JkBxZpDt
         6XqveCbOoAGXkovrbf2/koOoP2DV78Izin2F7BF3e/Pj7rZPcsil8nNYeFSD4DtDqe
         1EaJgDNnioq1mpbkkWANx2HW7zobZQmswDmrap4k=
Received: by mail-lf1-f46.google.com with SMTP id c19so1432613lfm.10;
        Mon, 19 Aug 2019 06:44:35 -0700 (PDT)
X-Gm-Message-State: APjAAAWDHMefM31poM+7ODXlJScWOro0Xk+jqhtp75XpGRy1/pBmUIau
        P5J+PCftPy8Nunyn+f36LzhG/Inzfwf4NG+P/Ug=
X-Google-Smtp-Source: APXvYqyz7NLBbN3axNweTaTuLUwMgVk9m4VVlb6KOvN88gzu7SztPXHEMEThKzmVGHLLqFJesD9hiFu1PgrxUX/L+k0=
X-Received: by 2002:a05:6512:c1:: with SMTP id c1mr13183490lfp.35.1566222273877;
 Mon, 19 Aug 2019 06:44:33 -0700 (PDT)
MIME-Version: 1.0
References: <20190819121720.31345-1-ribalda@kernel.org> <20190819121720.31345-2-ribalda@kernel.org>
 <1566222134.3008.4.camel@pengutronix.de>
In-Reply-To: <1566222134.3008.4.camel@pengutronix.de>
From:   Ricardo Ribalda Delgado <ribalda@kernel.org>
Date:   Mon, 19 Aug 2019 15:44:16 +0200
X-Gmail-Original-Message-ID: <CAPybu_04Ho1h4WeZTR8GjKD-Q2USWSdO90spq+ECw5Lt5kfKOQ@mail.gmail.com>
Message-ID: <CAPybu_04Ho1h4WeZTR8GjKD-Q2USWSdO90spq+ECw5Lt5kfKOQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] Documentation: Describe V4L2_CID_PIXEL_SIZE
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

Completely agree. Maybe we should call the control unit cell size?, in
case in the future we need a control for the light sensitive area.

Best regards

On Mon, Aug 19, 2019 at 3:42 PM Philipp Zabel <p.zabel@pengutronix.de> wrote:
>
> On Mon, 2019-08-19 at 14:17 +0200, Ricardo Ribalda Delgado wrote:
> > New control to pass to userspace the width/height of a pixel. Which is
> > needed for 3D calibration and lens selection.
> >
> > Signed-off-by: Ricardo Ribalda Delgado <ribalda@kernel.org>
> > ---
> >  Documentation/media/uapi/v4l/ext-ctrls-camera.rst | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/Documentation/media/uapi/v4l/ext-ctrls-camera.rst b/Documentation/media/uapi/v4l/ext-ctrls-camera.rst
> > index 51c1d5c9eb00..670c57a6f622 100644
> > --- a/Documentation/media/uapi/v4l/ext-ctrls-camera.rst
> > +++ b/Documentation/media/uapi/v4l/ext-ctrls-camera.rst
> > @@ -510,6 +510,12 @@ enum v4l2_scene_mode -
> >      value down. A value of zero stops the motion if one is in progress
> >      and has no effect otherwise.
> >
> > +``V4L2_CID_PIXEL_SIZE (struct)``
> > +    This control returns the pixel size in nanometres. The struct provides
> > +    the width and the height in separated fields to take into consideration
> > +    asymmetric pixels and/or hardware binning.
> > +    This control is required for automatic calibration of the sensor.
> > +
> >  .. [#f1]
> >     This control may be changed to a menu control in the future, if more
> >     options are required.
>
> I suppose this is a common term, but should it be mentioned that pixel
> size is the same as unit cell size, and not necessarily the size of the
> light sensitive area? Just in case the effective fill-factor is < 100%.
>
> regards
> Philipp
