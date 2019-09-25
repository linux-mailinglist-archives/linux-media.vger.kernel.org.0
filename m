Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E8AFDBE6E4
	for <lists+linux-media@lfdr.de>; Wed, 25 Sep 2019 23:08:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390506AbfIYVIg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Sep 2019 17:08:36 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:45078 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2393339AbfIYVIc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Sep 2019 17:08:32 -0400
Received: by mail-lf1-f65.google.com with SMTP id r134so21875lff.12;
        Wed, 25 Sep 2019 14:08:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=srW9jBTOOY6Th2zbYsONLADra93j3oABkghJfbLyUPY=;
        b=XYuoKhZqedpq8sYEBJYkgFPF0k0NUft9dXLLdBuPWJBSWoUb4+UzJihCF7cBTV+dWH
         89CFldB8HceKSpX2HJEzXGmkZxzBDZFOES10b3lgcTk9fjBh2bImNZ6E7vng1kBnohW9
         WHVgD61kncJxb6/jPze8aEzNeY3wO+4TyjB4fTPA6fJNzDU9qK77Uld/keu0aOhD5VGW
         f2OJ16ZEUVobIPR8oPwGL5rpJou/3zRY4iGNNiFD95ZhRL7goOxjNAcmATWDJddFWSRT
         D2F7ss0dJZHifVBmbRDt4oN4lkRtUZpxIK+GGLqJD+TKPZYeGvjWO5Zl8Ziv7+3Xci3o
         Lw1w==
X-Gm-Message-State: APjAAAWxYmL5OlzXX/KiqJNaLfIADaOCNh85hnGx+H/bwS7HoAeOL4jr
        rTZtULx2TnaSrzq2U6hMJ79IYjjyU+Ic8fWoCvA=
X-Google-Smtp-Source: APXvYqx8uJU34gat2jj05a1JtfX2WAWEdWsZn7Myiddypxd4/D7fMgMYWcUSz0KVljn/0TFlPUSXHjp6/AlOkmR803Y=
X-Received: by 2002:ac2:4427:: with SMTP id w7mr16466lfl.143.1569445708615;
 Wed, 25 Sep 2019 14:08:28 -0700 (PDT)
MIME-Version: 1.0
References: <20190920135137.10052-1-ricardo@ribalda.com> <20190920135137.10052-5-ricardo@ribalda.com>
 <20190925083421.ronwsvmqeu5quxpx@uno.localdomain>
In-Reply-To: <20190925083421.ronwsvmqeu5quxpx@uno.localdomain>
From:   Ricardo Ribalda Delgado <ricardo@ribalda.com>
Date:   Wed, 25 Sep 2019 23:08:11 +0200
Message-ID: <CAPybu_3Q7S+t4SbxAM5NS4gFsAv532=O=w-+rH_fmah_5WWz4Q@mail.gmail.com>
Subject: Re: [PATCH v6 4/7] Documentation: media: Document V4L2_CTRL_TYPE_AREA
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo

On Wed, Sep 25, 2019 at 10:32 AM Jacopo Mondi <jacopo@jmondi.org> wrote:
>
> Hi Ricardo,
>
> On Fri, Sep 20, 2019 at 03:51:34PM +0200, Ricardo Ribalda Delgado wrote:
> > From: Ricardo Ribalda Delgado <ribalda@kernel.org>
> >
> > A struct v4l2_area containing the width and the height of a rectangular
> > area.
> >
> > Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
> > Signed-off-by: Ricardo Ribalda Delgado <ribalda@kernel.org>
> > ---
> >  Documentation/media/uapi/v4l/vidioc-queryctrl.rst | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/Documentation/media/uapi/v4l/vidioc-queryctrl.rst b/Documentation/media/uapi/v4l/vidioc-queryctrl.rst
> > index a3d56ffbf4cc..33aff21b7d11 100644
> > --- a/Documentation/media/uapi/v4l/vidioc-queryctrl.rst
> > +++ b/Documentation/media/uapi/v4l/vidioc-queryctrl.rst
> > @@ -443,6 +443,12 @@ See also the examples in :ref:`control`.
> >        - n/a
> >        - A struct :c:type:`v4l2_ctrl_mpeg2_quantization`, containing MPEG-2
> >       quantization matrices for stateless video decoders.
> > +    * - ``V4L2_CTRL_TYPE_AREA``
> > +      - n/a
> > +      - n/a
> > +      - n/a
> > +      - A struct :c:type:`v4l2_area`, containing the width and the height
> > +        of a rectangular area. Units depend on the use case.
>
> I recall Hans too was in favour of having min, max and step defined
> (and applied to both width and height).
>
He changed his mind :)

https://www.mail-archive.com/linux-media@vger.kernel.org/msg150103.html


> Really a minor issue from my side, feel free to keep it the way it is
> Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>
>
> Thanks
>    j
> >      * - ``V4L2_CTRL_TYPE_H264_SPS``
> >        - n/a
> >        - n/a
> > --
> > 2.23.0
> >



-- 
Ricardo Ribalda
