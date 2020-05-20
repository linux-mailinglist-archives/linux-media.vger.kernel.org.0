Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A34A1DB4AD
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2020 15:12:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726548AbgETNMw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 May 2020 09:12:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726435AbgETNMw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 May 2020 09:12:52 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3400C061A0E;
        Wed, 20 May 2020 06:12:51 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 110E02A2C40
Message-ID: <4182e7477c43e6b5d93311de4b86f8274a0913a6.camel@collabora.com>
Subject: Re: [PATCH v4 1/3] media: rkvdec: Fix .buf_prepare
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     Tomasz Figa <tfiga@chromium.org>, kernel@collabora.com,
        Jonas Karlman <jonas@kwiboo.se>,
        Heiko Stuebner <heiko@sntech.de>,
        Alexandre Courbot <acourbot@chromium.org>,
        Jeffrey Kardatzke <jkardatzke@chromium.org>,
        gustavo.padovan@collabora.com,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>
Date:   Wed, 20 May 2020 10:12:40 -0300
In-Reply-To: <2c69a8d6-3402-15e8-1b19-49b8591ae1d8@xs4all.nl>
References: <20200518174011.15543-1-ezequiel@collabora.com>
         <20200518174011.15543-2-ezequiel@collabora.com>
         <2c69a8d6-3402-15e8-1b19-49b8591ae1d8@xs4all.nl>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.0-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 2020-05-20 at 15:07 +0200, Hans Verkuil wrote:
> On 18/05/2020 19:40, Ezequiel Garcia wrote:
> > The driver should only set the payload on .buf_prepare
> > if the buffer is CAPTURE type, or if an OUTPUT buffer
> > has a zeroed payload.
> > 
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
> >  		if (vb2_plane_size(vb, i) < sizeimage)
> >  			return -EINVAL;
> >  	}
> > -	vb2_set_plane_payload(vb, 0, f->fmt.pix_mp.plane_fmt[0].sizeimage);
> > +
> > +	/*
> > +	 * Buffer's bytesused is written by the driver for CAPTURE buffers,
> > +	 * or if the application passed zero bytesused on an OUTPUT buffer.
> > +	 */
> > +	if (!V4L2_TYPE_IS_OUTPUT(vq->type) ||
> > +	    (V4L2_TYPE_IS_OUTPUT(vq->type) && !vb2_get_plane_payload(vb, 0)))
> > +		vb2_set_plane_payload(vb, 0,
> > +				      f->fmt.pix_mp.plane_fmt[0].sizeimage);
> 
> This should just be:
> 
> 	if (!V4L2_TYPE_IS_OUTPUT(vq->type))
> 		vb2_set_plane_payload(vb, 0, f->fmt.pix_mp.plane_fmt[0].sizeimage);
> 
> If the application passes 0 as bytesused, then 1) a warning will be generated
> by the v4l2 core and 2) the v4l2 core will set bytesused to the length of the
> buffer. See vb2_fill_vb2_v4l2_buffer() in videobuf2-v4l2.c.
> 
> Some old drivers explicitly allow bytesused to be 0 for an output queue to
> signal end-of-stream, but that's only supported if the allow_zero_bytesused
> flag is set in the vb2_queue, and that shall not be used for new drivers
> since it is deprecated functionality.
> 

Ah, good catch. I'll get you a v5.

Thanks,
Ezequiel

