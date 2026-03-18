Return-Path: <linux-media+bounces-56235-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mE+4AHr9umlHeAIAu9opvQ
	(envelope-from <linux-media+bounces-56235-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 20:31:06 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B6042C207A
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 20:31:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 27AC63138675
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 19:30:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B02F53F20E2;
	Wed, 18 Mar 2026 19:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="JzY20WIx"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DB123F1665
	for <linux-media@vger.kernel.org>; Wed, 18 Mar 2026 19:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773862218; cv=none; b=PYAstmgJOJw3aQXzlEWsSd0T/ZBZo70XoXlcowZVh2IKXxrjryfW7u8SH5Agj1+ZGdtLRTvvg7+RWqYikjL2J/X0Z1RdtCwq4pWc9BN3imfsgBIMobLQzvaR0lZBX0CLibDT66Gl08v6wedd+nh905BbgGq56Cg7zMo3CYuEom4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773862218; c=relaxed/simple;
	bh=zfH39KZAZ8561ady7j8AXDu1jSpQ8OltUVtsipAAyHs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eHPenbgFBNKYGeQjvyM/Vx5reQbETBqSt6twGGSDmLT+aL/ZLC8XnOBlJqge65HoWfzSpPJW2ZoZv2bZWzvzm7GvLzGkKhQ7IdCbIn7QOHNNVz0VK1smxHRZttiSFIxKbZmgQ4t7gwGDgjpI5i60WY7ICDWKqkDxo2MbBCSo6XY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=JzY20WIx; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-661cfb9f3aaso407712a12.2
        for <linux-media@vger.kernel.org>; Wed, 18 Mar 2026 12:30:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773862214; x=1774467014; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PfG53FdFHO3yJtcMLaRcRRXPW6yYOHZLq4AssQN7ONU=;
        b=JzY20WIxBTr8q+ZWt1eQzWb6iF1NosQwU7GBLiUxnbYF85ArAhN3894o7eTOoEgKdP
         OO+RAMOA/bJyp1pueLw64ScevwQImSEC6L8YdwE1OnSCattpU741GRCujR1wPgw6npIq
         vTNe/t2HiP16p11p2MXb1kybop5Qaub47H998=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773862214; x=1774467014;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PfG53FdFHO3yJtcMLaRcRRXPW6yYOHZLq4AssQN7ONU=;
        b=NAHKjZTvOc7X6WxtifY8rMPfN3Xn3B/FBB286ZaEqNjc4pv9p9v/rfhmD8ozrIGKVE
         8K5amlLo/J7i4qqCLeYI1duItx99NpyO4oALVcS/LRafcpXnefalUAn8WPxU5j2GLpUV
         YiBhpBQtr54IdPa68JuZ4EHO9LMesP7lF+rzGVGRzgBROjGl6aYsyqEhomF0RTK+qDb3
         Zv1EqcnxZg9xn4uAUJb7Go5hhn1e4MAElvSS4qM2gpvmoPjW6IviIciSIRomN25xjJL8
         KmmwmqCLQbgniezzjplUDpXoH+Vlc4LSTS9nr4K0VcYbmwP8mL4hz7/Ts2xZ+hmdHYo6
         OiMQ==
X-Forwarded-Encrypted: i=1; AJvYcCUMkKgDEVvnziQMtYMWKG/VUozh7SF7lgUXXwjSKzV7LANDFFRBpwni6+EXE0uZLSgdBN/bgK66ZvQNpQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxUslW4lj5nN9sFZAB6SMBqjukOeOdZWPmVB2nW+PgYrnVFypiH
	1pKGXMcZJyf8XRTKgAnqS+db2FQ2uaI4Uy7Hpn4Mxf5kUmzl2iJXKzmNlmKZ/e/2qH2hBUWoDBP
	OWcmOqy54
X-Gm-Gg: ATEYQzxjwrQMkaTr7Qxsawy8iHQsJpIMPRTfm6t7bdxmr4IAJ11brhCIU4mo8o+zfrM
	GsZWXEQ723wYxyc/aD/YKeUdr9rQ6eCWnvZiqnNAeBtKxCi8SU/d9oU3gK9E1xEwwunMG/ADuoh
	hAayFrdHrsQlFAgvV8fIb/9EpBNjSdOPRfnmyBYAZI2WNSAohzTzGZ9eiKlYUrR4/prlbYGWA1U
	ZCh8lv+5b57NNSEyNmOvURCYBslsfn098GAmH32lzeSu9749boopYtJNxzdWL0KA7ozsZwwhr+K
	dQrmWSU9kYFSkVWbP9smkCqXaoJRbs92g1DBIUxUmFx9gOlEgrq5jLWwPo1/Ax1tpdFQBK2t+7T
	3VX7LgrJV8tdWPyyjr+Bc9gC22IIpnPZd7z4RD9anxWUGp9MSfJzNrstcDPWUnK7am3acUAVvmH
	arZTTjeL+noNIW+inFNBzoqg3SauUXU0HgwLlOT0FmviN+eI07oW5fClWvvpV0
X-Received: by 2002:a05:6402:2746:b0:660:475:9403 with SMTP id 4fb4d7f45d1cf-667b2c197d8mr3093361a12.29.1773862214373;
        Wed, 18 Mar 2026 12:30:14 -0700 (PDT)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com. [209.85.208.48])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-667afa57131sm2223430a12.12.2026.03.18.12.30.11
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 12:30:13 -0700 (PDT)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-66732a99928so517549a12.0
        for <linux-media@vger.kernel.org>; Wed, 18 Mar 2026 12:30:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWhQfG0SnCdTgdwMUv7XakpQ2m4CzRuq3Veu8rlHHA9iYF+f7cSTwCzhO3CDAfkbTASRXVzM/p99TA9eQ==@vger.kernel.org
X-Received: by 2002:a17:907:c11:b0:b97:a03c:6f4d with SMTP id
 a640c23a62f3a-b97f4b771eamr317718766b.56.1773862210826; Wed, 18 Mar 2026
 12:30:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260309-uvc-metadata-dmabuf-v1-0-fc8b87bd29c5@chromium.org>
 <20260309-uvc-metadata-dmabuf-v1-3-fc8b87bd29c5@chromium.org> <20260318192246.GC718539@killaraus.ideasonboard.com>
In-Reply-To: <20260318192246.GC718539@killaraus.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 18 Mar 2026 20:29:58 +0100
X-Gmail-Original-Message-ID: <CANiDSCu9DNoUX=D5Ywh6UxoswR=FF4S3BZYYJ_iqbizuQv43WQ@mail.gmail.com>
X-Gm-Features: AaiRm53wOLyBbEd3437BQUN4mtxj0GysK-Zm_CgFE-jST7s4OmyOAYSlsF2G8KI
Message-ID: <CANiDSCu9DNoUX=D5Ywh6UxoswR=FF4S3BZYYJ_iqbizuQv43WQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] media: uvcvideo: Allow userspace to increase the meta buffersize
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Yunke Cao <yunkec@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[chromium.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56235-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ribalda@chromium.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.994];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[chromium.org:dkim,chromium.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,ideasonboard.com:email]
X-Rspamd-Queue-Id: 7B6042C207A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Laurent

On Wed, 18 Mar 2026 at 20:22, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Mon, Mar 09, 2026 at 03:01:56PM +0000, Ricardo Ribalda wrote:
> > Now we have the metadata size hardcoded to 10 KiB, this is a value that
> > works fine for bulk cameras or frames with no extra metadata. But not
> > for all usecases.
> >
> > We have seen some cameras that produce more metadata per frame. Eg:
>
> Can you tell what camera that is ?

It is a pretty standard Sunplus camera. It should be producing frames
at 30fps, but it had AutoFramerate based on exposure enabled and the
real fps was 15.
As a result of that there was twice of empty packages.

If you are really curious I can try to dig the lsusb.
>
> > Frame 1 captured (Bytes: 11154)
> > Frame 2 captured (Bytes: 11616)
> > Frame 3 captured (Bytes: 11374)
> > Frame 4 captured (Bytes: 11132)
> > Frame 5 captured (Bytes: 11594)
> > Frame 6 captured (Bytes: 11352)
> > Frame 7 captured (Bytes: 11110)
> > Frame 8 captured (Bytes: 11572)
> > Frame 9 captured (Bytes: 11308)
> >
> > When this happens, the driver (correctly) marks the metadata as ERROR.
>
> Is the maximum metadata size queryable through an XU on your devices ?

There is no metadata in this device, just timing information.

In MSXU there is a contol to set the size of the metadata. It is in
kilobytes :S and pretty much every device I've seen implements it
incorrectly.

>
> > This patch let userspace set bigger buffersize via S_FMT.
> >
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/media/usb/uvc/uvc_metadata.c | 9 +++++++--
> >  drivers/media/usb/uvc/uvc_queue.c    | 2 +-
> >  drivers/media/usb/uvc/uvcvideo.h     | 3 ++-
> >  3 files changed, 10 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_metadata.c b/drivers/media/usb/uvc/uvc_metadata.c
> > index 0a906ae3f971..9de8aba1229e 100644
> > --- a/drivers/media/usb/uvc/uvc_metadata.c
> > +++ b/drivers/media/usb/uvc/uvc_metadata.c
> > @@ -50,7 +50,7 @@ static int uvc_meta_v4l2_get_format(struct file *file, void *priv,
> >               return -EINVAL;
> >
> >       fmt->dataformat = stream->meta.format;
> > -     fmt->buffersize = UVC_METADATA_BUF_SIZE;
> > +     fmt->buffersize = stream->meta.buffersize;
> >
> >       return 0;
> >  }
> > @@ -63,6 +63,7 @@ static int uvc_meta_v4l2_try_format(struct file *file, void *priv,
> >       struct uvc_device *dev = stream->dev;
> >       struct v4l2_meta_format *fmt = &format->fmt.meta;
> >       u32 fmeta = V4L2_META_FMT_UVC;
> > +     u32 buffersize;
> >
> >       if (format->type != vfh->vdev->queue->type)
> >               return -EINVAL;
> > @@ -74,10 +75,12 @@ static int uvc_meta_v4l2_try_format(struct file *file, void *priv,
> >               }
> >       }
> >
> > +     buffersize = max(UVC_METADATA_BUF_MIN_SIZE, fmt->buffersize);
> > +
> >       memset(fmt, 0, sizeof(*fmt));
> >
> >       fmt->dataformat = fmeta;
> > -     fmt->buffersize = UVC_METADATA_BUF_SIZE;
> > +     fmt->buffersize = buffersize;
> >
> >       return 0;
> >  }
> > @@ -103,6 +106,7 @@ static int uvc_meta_v4l2_set_format(struct file *file, void *priv,
> >               return -EBUSY;
> >
> >       stream->meta.format = fmt->dataformat;
> > +     stream->meta.buffersize = fmt->buffersize;
> >
> >       return 0;
> >  }
> > @@ -229,6 +233,7 @@ int uvc_meta_register(struct uvc_streaming *stream)
> >       struct uvc_video_queue *queue = &stream->meta.queue;
> >
> >       stream->meta.format = V4L2_META_FMT_UVC;
> > +     stream->meta.buffersize = UVC_METADATA_BUF_MIN_SIZE;
> >
> >       return uvc_register_video_device(dev, stream, queue,
> >                                        V4L2_BUF_TYPE_META_CAPTURE,
> > diff --git a/drivers/media/usb/uvc/uvc_queue.c b/drivers/media/usb/uvc/uvc_queue.c
> > index 68ed2883edb2..89206f761006 100644
> > --- a/drivers/media/usb/uvc/uvc_queue.c
> > +++ b/drivers/media/usb/uvc/uvc_queue.c
> > @@ -83,7 +83,7 @@ static int uvc_queue_setup(struct vb2_queue *vq,
> >
> >       switch (vq->type) {
> >       case V4L2_BUF_TYPE_META_CAPTURE:
> > -             size = UVC_METADATA_BUF_SIZE;
> > +             size = stream->meta.buffersize;
> >               break;
> >
> >       default:
> > diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> > index 9b4849fda12f..5ba698d2a23d 100644
> > --- a/drivers/media/usb/uvc/uvcvideo.h
> > +++ b/drivers/media/usb/uvc/uvcvideo.h
> > @@ -409,7 +409,7 @@ struct uvc_stats_stream {
> >       unsigned int max_sof;           /* Maximum STC.SOF value */
> >  };
> >
> > -#define UVC_METADATA_BUF_SIZE 10240
> > +#define UVC_METADATA_BUF_MIN_SIZE 10240
>
> I wondered if we should have a max limit to avoid letting userspace
> starve system memory, but that can already be done through allocation of
> arbitrarily large image buffers anyway. We need proper memory accounting
> in V4L2.
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>
> >
> >  /**
> >   * struct uvc_copy_op: Context structure to schedule asynchronous memcpy
> > @@ -482,6 +482,7 @@ struct uvc_streaming {
> >       struct {
> >               struct uvc_video_queue queue;
> >               u32 format;
> > +             u32 buffersize;
> >       } meta;
> >
> >       /* Context data used by the bulk completion handler. */
> >
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda

