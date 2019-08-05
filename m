Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 846A781EC5
	for <lists+linux-media@lfdr.de>; Mon,  5 Aug 2019 16:13:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729002AbfHEONp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 5 Aug 2019 10:13:45 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:54100 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726508AbfHEONo (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 5 Aug 2019 10:13:44 -0400
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id EF36828A3A8;
        Mon,  5 Aug 2019 15:13:41 +0100 (BST)
Date:   Mon, 5 Aug 2019 16:13:38 +0200
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        linux-media@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>, kernel@collabora.com,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Alexandre Courbot <acourbot@chromium.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [RFC PATCH 1/5] media: vb2: Add a helper to get the vb2 buffer
 attached to a request
Message-ID: <20190805161338.7df1e623@collabora.com>
In-Reply-To: <722ddb41-f7b8-afee-66a3-e99a571da5d7@xs4all.nl>
References: <20190805094827.11205-1-boris.brezillon@collabora.com>
        <20190805094827.11205-2-boris.brezillon@collabora.com>
        <722ddb41-f7b8-afee-66a3-e99a571da5d7@xs4all.nl>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 5 Aug 2019 10:12:53 -0300
Hans Verkuil <hverkuil@xs4all.nl> wrote:

> On 8/5/19 6:48 AM, Boris Brezillon wrote:
> > vb2_request_get_buf() returns the N-th buffer attached to a media
> > request.
> > 
> > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > ---
> >   .../media/common/videobuf2/videobuf2-core.c   | 23 +++++++++++++++++++
> >   include/media/videobuf2-core.h                | 11 +++++++++
> >   2 files changed, 34 insertions(+)
> > 
> > diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
> > index 4489744fbbd9..58769f0c8665 100644
> > --- a/drivers/media/common/videobuf2/videobuf2-core.c
> > +++ b/drivers/media/common/videobuf2/videobuf2-core.c
> > @@ -1416,6 +1416,29 @@ unsigned int vb2_request_buffer_cnt(struct media_request *req)
> >   }
> >   EXPORT_SYMBOL_GPL(vb2_request_buffer_cnt);
> >   
> > +struct vb2_buffer *vb2_request_get_buf(struct media_request *req,
> > +				       unsigned int idx)
> > +{
> > +	struct media_request_object *obj;
> > +	struct vb2_buffer *buf = NULL;
> > +	unsigned int nbufs = 0;
> > +	unsigned long flags;
> > +
> > +	spin_lock_irqsave(&req->lock, flags);
> > +	list_for_each_entry(obj, &req->objects, list) {
> > +		if (!vb2_request_object_is_buffer(obj) ||
> > +		    nbufs++ < idx)
> > +			continue;
> > +
> > +		buf = container_of(obj, struct vb2_buffer, req_obj);
> > +		break;
> > +	}
> > +	spin_unlock_irqrestore(&req->lock, flags);
> > +
> > +	return buf;
> > +}
> > +EXPORT_SYMBOL_GPL(vb2_request_get_buf);
> > +
> >   int vb2_core_prepare_buf(struct vb2_queue *q, unsigned int index, void *pb)
> >   {
> >   	struct vb2_buffer *vb;
> > diff --git a/include/media/videobuf2-core.h b/include/media/videobuf2-core.h
> > index 640aabe69450..febf3261a120 100644
> > --- a/include/media/videobuf2-core.h
> > +++ b/include/media/videobuf2-core.h
> > @@ -1222,4 +1222,15 @@ bool vb2_request_object_is_buffer(struct media_request_object *obj);
> >    */
> >   unsigned int vb2_request_buffer_cnt(struct media_request *req);
> >   
> > +/**
> > + * vb2_request_get_buf() - return the buffer at index @idx
> > + *
> > + * @req:	the request.
> > + * @idx:	index of the buffer in the req object list  
> 
> This is confusing: it suggests that you are talking about the buffer
> index itself (buf->index) instead of the nth buffer in the request.

How about:

@n: search for the Nth buffer in the req object list

> 
> Looks good otherwise.
> 
> Regards,
> 
> 	Hans
> 
> > + *
> > + * Return a vb2 buffer or NULL if there's no buffer at the specified index
> > + */
> > +struct vb2_buffer *vb2_request_get_buf(struct media_request *req,
> > +				       unsigned int idx);
> > +
> >   #endif /* _MEDIA_VIDEOBUF2_CORE_H */
> >   
> 

