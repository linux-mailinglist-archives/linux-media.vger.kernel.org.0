Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 032A911DAF6
	for <lists+linux-media@lfdr.de>; Fri, 13 Dec 2019 01:12:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731513AbfLMAMm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Dec 2019 19:12:42 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:56694 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731295AbfLMAMm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Dec 2019 19:12:42 -0500
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B281D440;
        Fri, 13 Dec 2019 01:12:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1576195959;
        bh=q7+PzftOpW7kWfLrX5kDBoWt+echFEY9YwOmkpZA0Ho=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=dFG8aT+m7xKE1kIvi+//gFzbHrNuP7+mjmGjzJafpBEjO+SdtCoUC7GVXVJfbC6AJ
         9U9PNAOF9eoCmYwWN2j3gU/MQ0zgMWUjZ3CqBhMm4gXFyanbO8Eq/e1hiWJomuEJyu
         D4UAfnshjTRwM+giezvmMuKIRHvW1YcSNHbV/jJ4=
Date:   Fri, 13 Dec 2019 02:12:30 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] uvcvideo: Also validate buffers in BULK mode
Message-ID: <20191213001230.GG4892@pendragon.ideasonboard.com>
References: <2206409.jVpTcjFX6j@avalon>
 <20180605234607.5334-1-nicolas.dufresne@collabora.com>
 <b30648712504dedd388ac13100afc43beba9408a.camel@collabora.com>
 <2a6629b95f9c8a5f41ec783ef2e39f5cba8e7a20.camel@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2a6629b95f9c8a5f41ec783ef2e39f5cba8e7a20.camel@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Nicolas,

On Mon, Dec 09, 2019 at 09:30:44PM -0500, Nicolas Dufresne wrote:
> Le lundi 09 décembre 2019 à 21:27 -0500, Nicolas Dufresne a écrit :
> > Le mardi 05 juin 2018 à 19:46 -0400, Nicolas Dufresne a écrit :
> > > Just like for ISOC, validate the decoded BULK buffer size when possible.
> > > This avoids sending corrupted or partial buffers to userspace, which may
> > > lead to application crash or run-time failure.
> > > 
> > > Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> > 
> > Ping. That was a year and a half ago and still applies.
> 
> Please ignore, I was looking into the wrong branch by accident. Please,
> update patchwork, that might also help to avoid confusion.

Unless someone has changed the patch status in the last few days without
telling me, it was already marked as accepted.

> > > ---
> > >  drivers/media/usb/uvc/uvc_video.c | 9 +++------
> > >  1 file changed, 3 insertions(+), 6 deletions(-)
> > > 
> > > diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> > > index aa0082fe5833..025ffac196f3 100644
> > > --- a/drivers/media/usb/uvc/uvc_video.c
> > > +++ b/drivers/media/usb/uvc/uvc_video.c
> > > @@ -1234,6 +1234,7 @@ static void uvc_video_next_buffers(struct uvc_streaming *stream,
> > >  		*meta_buf = uvc_queue_next_buffer(&stream->meta.queue,
> > >  						  *meta_buf);
> > >  	}
> > > +	uvc_video_validate_buffer(stream, *video_buf);
> > >  	*video_buf = uvc_queue_next_buffer(&stream->queue, *video_buf);
> > >  }
> > >  
> > > @@ -1258,10 +1259,8 @@ static void uvc_video_decode_isoc(struct urb *urb, struct uvc_streaming *stream,
> > >  		do {
> > >  			ret = uvc_video_decode_start(stream, buf, mem,
> > >  				urb->iso_frame_desc[i].actual_length);
> > > -			if (ret == -EAGAIN) {
> > > -				uvc_video_validate_buffer(stream, buf);
> > > +			if (ret == -EAGAIN)
> > >  				uvc_video_next_buffers(stream, &buf, &meta_buf);
> > > -			}
> > >  		} while (ret == -EAGAIN);
> > >  
> > >  		if (ret < 0)
> > > @@ -1277,10 +1276,8 @@ static void uvc_video_decode_isoc(struct urb *urb, struct uvc_streaming *stream,
> > >  		uvc_video_decode_end(stream, buf, mem,
> > >  			urb->iso_frame_desc[i].actual_length);
> > >  
> > > -		if (buf->state == UVC_BUF_STATE_READY) {
> > > -			uvc_video_validate_buffer(stream, buf);
> > > +		if (buf->state == UVC_BUF_STATE_READY)
> > >  			uvc_video_next_buffers(stream, &buf, &meta_buf);
> > > -		}
> > >  	}
> > >  }
> > >  

-- 
Regards,

Laurent Pinchart
