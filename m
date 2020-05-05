Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65C441C57A7
	for <lists+linux-media@lfdr.de>; Tue,  5 May 2020 15:59:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729088AbgEEN7q (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 May 2020 09:59:46 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:42496 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728346AbgEEN7q (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 May 2020 09:59:46 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 57E5B2A1C94
Message-ID: <c29fcc922a4917ac695043e605973ba9649f9c9b.camel@collabora.com>
Subject: Re: [PATCH v3 1/3] media: rkvdec: Fix .buf_prepare
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Tomasz Figa <tfiga@chromium.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        kernel@collabora.com, Jonas Karlman <jonas@kwiboo.se>,
        Heiko Stuebner <heiko@sntech.de>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Alexandre Courbot <acourbot@chromium.org>,
        Jeffrey Kardatzke <jkardatzke@chromium.org>,
        Gustavo Padovan <gustavo.padovan@collabora.com>
Date:   Tue, 05 May 2020 10:59:35 -0300
In-Reply-To: <CAAFQd5AWZFoPk2YTp2k8M7LvJshxw46-z+wK2VoM9EzB2CqiFA@mail.gmail.com>
References: <20200505134110.3435-1-ezequiel@collabora.com>
         <20200505134110.3435-2-ezequiel@collabora.com>
         <CAAFQd5AWZFoPk2YTp2k8M7LvJshxw46-z+wK2VoM9EzB2CqiFA@mail.gmail.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.0-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 2020-05-05 at 15:56 +0200, Tomasz Figa wrote:
> Hi Ezequiel,
> 
> On Tue, May 5, 2020 at 3:41 PM Ezequiel Garcia <ezequiel@collabora.com> wrote:
> > The driver should only set the payload on .buf_prepare
> > if the buffer is CAPTURE type, or if an OUTPUT buffer
> > has a zeroed payload.
> 
> Thanks for the patch. Just one question below.
> 
> Where does the requirement to set OUTPUT buffer bytesused to sizeimage
> if the original bytesused is 0 come from?
> 

If I'm reading english correctly, it's here:

https://www.kernel.org/doc/html/latest/media/uapi/v4l/buffer.html

"""
The number of bytes occupied by the data in the buffer. It depends on the negotiated data format and may change with each buffer for compressed
variable size data like JPEG images. Drivers must set this field when type refers to a capture stream, applications when it refers to an output
stream. If the application sets this to 0 for an output stream, then bytesused will be set to the size of the buffer (see the length field of this
struct) by the driver. For multiplanar formats this field is ignored and the planes pointer is used instead.
"""

Thanks!
Ezequiel

> Best regards,
> Tomasz
> 
> > Fix it.
> > 
> > Fixes: cd33c830448ba ("media: rkvdec: Add the rkvdec driver")
> > Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> > ---
> >  drivers/staging/media/rkvdec/rkvdec.c | 10 +++++++++-
> >  1 file changed, 9 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/staging/media/rkvdec/rkvdec.c b/drivers/staging/media/rkvdec/rkvdec.c
> > index 225eeca73356..4df2a248ab96 100644
> > --- a/drivers/staging/media/rkvdec/rkvdec.c
> > +++ b/drivers/staging/media/rkvdec/rkvdec.c
> > @@ -456,7 +456,15 @@ static int rkvdec_buf_prepare(struct vb2_buffer *vb)
> >                 if (vb2_plane_size(vb, i) < sizeimage)
> >                         return -EINVAL;
> >         }
> > -       vb2_set_plane_payload(vb, 0, f->fmt.pix_mp.plane_fmt[0].sizeimage);
> > +
> > +       /*
> > +        * Buffer's bytesused is written by the driver for CAPTURE buffers,
> > +        * or if the application passed zero bytesused on an OUTPUT buffer.
> > +        */
> > +       if (!V4L2_TYPE_IS_OUTPUT(vq->type) ||
> > +           (V4L2_TYPE_IS_OUTPUT(vq->type) && !vb2_get_plane_payload(vb, 0)))
> > +               vb2_set_plane_payload(vb, 0,
> > +                                     f->fmt.pix_mp.plane_fmt[0].sizeimage);
> >         return 0;
> >  }
> > 
> > --
> > 2.26.0.rc2
> > 


