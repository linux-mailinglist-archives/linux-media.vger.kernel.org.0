Return-Path: <linux-media+bounces-56238-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WCTWJcn+ummAeAIAu9opvQ
	(envelope-from <linux-media+bounces-56238-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 20:36:41 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0840B2C210E
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 20:36:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E0BDF301F4A7
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 19:36:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 636993F211B;
	Wed, 18 Mar 2026 19:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="k41x4P/j"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A0AC331218;
	Wed, 18 Mar 2026 19:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773862597; cv=none; b=AhiRZapH5fTCF955ThC3IX841mkO5vI0lUdo6HFXxgKzVqO69R4Q2hYA1t4Uw5qmnkqU/o4ee6KGq4TJRM8HyseoKpW/pEM/K1lDt0L795f0hoaqldWT2/WcOHDRzHQfRHHn0YKjk1iKzRMpbynn5TflOZoZEiSzCf/fwjJ6UAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773862597; c=relaxed/simple;
	bh=bsnw+RJolqzojO4QQ0dHIIYpj3QDSR2Z7y+XezH0+wM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OcbfsD15TaPoqdqdDhdpHCZYYTsw7bo9iWn/jRdGpy4upKfkso3sbm1ud8n4AqiMYZAzPHU4w5MYbR9+HjG7tCX3x0i8GwqJvX2T4AAkTE2cgjXYFcMOvDbQPAlR/tsz/b56Vuctto0X1byMIxIxgPoyZzQFyP6jrsvpPRz6rik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=k41x4P/j; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id BE925308;
	Wed, 18 Mar 2026 20:35:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773862521;
	bh=bsnw+RJolqzojO4QQ0dHIIYpj3QDSR2Z7y+XezH0+wM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k41x4P/jDtChi/IxlLWH57E7fRcsNK8DhLKEBoqHFzelcnqb4t/UdZ438pFOGS5sY
	 U/sbs74GErMM5xj3fT5jZYjHnDuPBpfcQPc4K0B+xHaXG7WkxxRAVWYerxe/uO6KoQ
	 HygQ7Jhd/st17MeAAXgEwdpmcl2pB1HS+zTdmLe8=
Date: Wed, 18 Mar 2026 21:36:33 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Yunke Cao <yunkec@google.com>
Subject: Re: [PATCH 3/3] media: uvcvideo: Allow userspace to increase the
 meta buffersize
Message-ID: <20260318193633.GA720831@killaraus.ideasonboard.com>
References: <20260309-uvc-metadata-dmabuf-v1-0-fc8b87bd29c5@chromium.org>
 <20260309-uvc-metadata-dmabuf-v1-3-fc8b87bd29c5@chromium.org>
 <20260318192246.GC718539@killaraus.ideasonboard.com>
 <CANiDSCu9DNoUX=D5Ywh6UxoswR=FF4S3BZYYJ_iqbizuQv43WQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CANiDSCu9DNoUX=D5Ywh6UxoswR=FF4S3BZYYJ_iqbizuQv43WQ@mail.gmail.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56238-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.995];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[chromium.org:email,ideasonboard.com:dkim,ideasonboard.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,killaraus.ideasonboard.com:mid]
X-Rspamd-Queue-Id: 0840B2C210E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 18, 2026 at 08:29:58PM +0100, Ricardo Ribalda wrote:
> On Wed, 18 Mar 2026 at 20:22, Laurent Pinchart wrote:
> > On Mon, Mar 09, 2026 at 03:01:56PM +0000, Ricardo Ribalda wrote:
> > > Now we have the metadata size hardcoded to 10 KiB, this is a value that
> > > works fine for bulk cameras or frames with no extra metadata. But not
> > > for all usecases.
> > >
> > > We have seen some cameras that produce more metadata per frame. Eg:
> >
> > Can you tell what camera that is ?
> 
> It is a pretty standard Sunplus camera. It should be producing frames
> at 30fps, but it had AutoFramerate based on exposure enabled and the
> real fps was 15.
> As a result of that there was twice of empty packages.
> 
> If you are really curious I can try to dig the lsusb.

No, it's OK. I was wondering if it was anything special.

> > > Frame 1 captured (Bytes: 11154)
> > > Frame 2 captured (Bytes: 11616)
> > > Frame 3 captured (Bytes: 11374)
> > > Frame 4 captured (Bytes: 11132)
> > > Frame 5 captured (Bytes: 11594)
> > > Frame 6 captured (Bytes: 11352)
> > > Frame 7 captured (Bytes: 11110)
> > > Frame 8 captured (Bytes: 11572)
> > > Frame 9 captured (Bytes: 11308)
> > >
> > > When this happens, the driver (correctly) marks the metadata as ERROR.
> >
> > Is the maximum metadata size queryable through an XU on your devices ?
> 
> There is no metadata in this device, just timing information.
> 
> In MSXU there is a contol to set the size of the metadata. It is in
> kilobytes :S and pretty much every device I've seen implements it
> incorrectly.

Ah yes I remember you told me that. Lovely :-)

> > > This patch let userspace set bigger buffersize via S_FMT.
> > >
> > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > > ---
> > >  drivers/media/usb/uvc/uvc_metadata.c | 9 +++++++--
> > >  drivers/media/usb/uvc/uvc_queue.c    | 2 +-
> > >  drivers/media/usb/uvc/uvcvideo.h     | 3 ++-
> > >  3 files changed, 10 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/drivers/media/usb/uvc/uvc_metadata.c b/drivers/media/usb/uvc/uvc_metadata.c
> > > index 0a906ae3f971..9de8aba1229e 100644
> > > --- a/drivers/media/usb/uvc/uvc_metadata.c
> > > +++ b/drivers/media/usb/uvc/uvc_metadata.c
> > > @@ -50,7 +50,7 @@ static int uvc_meta_v4l2_get_format(struct file *file, void *priv,
> > >               return -EINVAL;
> > >
> > >       fmt->dataformat = stream->meta.format;
> > > -     fmt->buffersize = UVC_METADATA_BUF_SIZE;
> > > +     fmt->buffersize = stream->meta.buffersize;
> > >
> > >       return 0;
> > >  }
> > > @@ -63,6 +63,7 @@ static int uvc_meta_v4l2_try_format(struct file *file, void *priv,
> > >       struct uvc_device *dev = stream->dev;
> > >       struct v4l2_meta_format *fmt = &format->fmt.meta;
> > >       u32 fmeta = V4L2_META_FMT_UVC;
> > > +     u32 buffersize;
> > >
> > >       if (format->type != vfh->vdev->queue->type)
> > >               return -EINVAL;
> > > @@ -74,10 +75,12 @@ static int uvc_meta_v4l2_try_format(struct file *file, void *priv,
> > >               }
> > >       }
> > >
> > > +     buffersize = max(UVC_METADATA_BUF_MIN_SIZE, fmt->buffersize);
> > > +
> > >       memset(fmt, 0, sizeof(*fmt));
> > >
> > >       fmt->dataformat = fmeta;
> > > -     fmt->buffersize = UVC_METADATA_BUF_SIZE;
> > > +     fmt->buffersize = buffersize;
> > >
> > >       return 0;
> > >  }
> > > @@ -103,6 +106,7 @@ static int uvc_meta_v4l2_set_format(struct file *file, void *priv,
> > >               return -EBUSY;
> > >
> > >       stream->meta.format = fmt->dataformat;
> > > +     stream->meta.buffersize = fmt->buffersize;
> > >
> > >       return 0;
> > >  }
> > > @@ -229,6 +233,7 @@ int uvc_meta_register(struct uvc_streaming *stream)
> > >       struct uvc_video_queue *queue = &stream->meta.queue;
> > >
> > >       stream->meta.format = V4L2_META_FMT_UVC;
> > > +     stream->meta.buffersize = UVC_METADATA_BUF_MIN_SIZE;
> > >
> > >       return uvc_register_video_device(dev, stream, queue,
> > >                                        V4L2_BUF_TYPE_META_CAPTURE,
> > > diff --git a/drivers/media/usb/uvc/uvc_queue.c b/drivers/media/usb/uvc/uvc_queue.c
> > > index 68ed2883edb2..89206f761006 100644
> > > --- a/drivers/media/usb/uvc/uvc_queue.c
> > > +++ b/drivers/media/usb/uvc/uvc_queue.c
> > > @@ -83,7 +83,7 @@ static int uvc_queue_setup(struct vb2_queue *vq,
> > >
> > >       switch (vq->type) {
> > >       case V4L2_BUF_TYPE_META_CAPTURE:
> > > -             size = UVC_METADATA_BUF_SIZE;
> > > +             size = stream->meta.buffersize;
> > >               break;
> > >
> > >       default:
> > > diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> > > index 9b4849fda12f..5ba698d2a23d 100644
> > > --- a/drivers/media/usb/uvc/uvcvideo.h
> > > +++ b/drivers/media/usb/uvc/uvcvideo.h
> > > @@ -409,7 +409,7 @@ struct uvc_stats_stream {
> > >       unsigned int max_sof;           /* Maximum STC.SOF value */
> > >  };
> > >
> > > -#define UVC_METADATA_BUF_SIZE 10240
> > > +#define UVC_METADATA_BUF_MIN_SIZE 10240
> >
> > I wondered if we should have a max limit to avoid letting userspace
> > starve system memory, but that can already be done through allocation of
> > arbitrarily large image buffers anyway. We need proper memory accounting
> > in V4L2.
> >
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >
> > >
> > >  /**
> > >   * struct uvc_copy_op: Context structure to schedule asynchronous memcpy
> > > @@ -482,6 +482,7 @@ struct uvc_streaming {
> > >       struct {
> > >               struct uvc_video_queue queue;
> > >               u32 format;
> > > +             u32 buffersize;
> > >       } meta;
> > >
> > >       /* Context data used by the bulk completion handler. */
> > >

-- 
Regards,

Laurent Pinchart

