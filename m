Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A15291BBB0
	for <lists+linux-media@lfdr.de>; Mon, 13 May 2019 19:20:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731352AbfEMRUA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 May 2019 13:20:00 -0400
Received: from mail-qk1-f194.google.com ([209.85.222.194]:38361 "EHLO
        mail-qk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730220AbfEMRUA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 May 2019 13:20:00 -0400
Received: by mail-qk1-f194.google.com with SMTP id a64so2745167qkg.5
        for <linux-media@vger.kernel.org>; Mon, 13 May 2019 10:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version;
        bh=eJS6m3f6O3K3h3k8vjZE/t0D6LneZqo5mx2fyOqyNS4=;
        b=AD2JJUcptY7taQqdJNotVIBujrAS/vkYuvX+uhvgX6FfbZs9J/hjX4LMdX2alooy7Q
         01gShExww7vdubNakESV2PXX/ztd2rMk+WHdTz9OzI8hy7YLS2wbTEmQcQVZgkTOWKRG
         xnRbu/25smA28TwP0xX2BRxKhT8M9rAPEdxCBBbVK0cDjxdV9j+yxR8gmQpWoaOovYjY
         lrkayVpU9JQga1nGCGYn1rVn8DzdwU5xtl3Hs4sZQmWGXwUp7xtZ6ThexQgOr1klQg5e
         8sei/r86cI+nwKBOY5/EAmsaz47uptsZ668utswjYL1pSMb/B+VeVj/1WBw9N5S5uFr9
         dbBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version;
        bh=eJS6m3f6O3K3h3k8vjZE/t0D6LneZqo5mx2fyOqyNS4=;
        b=RNzFu9q2RyPowIntfT3RTopMuzJBGNpzx88OEirDnYDsC97NJxiV4j1uXcxs2sre9f
         1LaCdKExPjf35cqORXJDzV3IL55fWcd598RB40meoLQlCuleslNJFKW//zZJKEt1ZIKX
         6XUJhaU9ah4Ucn8nRuduqQw/81Pn4NiS7eD8VBgxFTqN+yEKUXFrD0e0Q3GUrPH6wgOY
         EX30WdLW8BKqhCR03h44UpuZ2z+ytwO49x254SOqQxRlHFXm+YTIYq9jaPxf+wgv1MPM
         3YZfTDMviaovhQTOXf/2yY9ZDbDGbZc2mPSKG3hczJXuRsELYd5lHFvqMj9JSfoW2kYr
         vm8g==
X-Gm-Message-State: APjAAAXqu7IStwohHt+Xvh5p95YbyiyI0K1L2oA+tF/XmVS/Znvz0Fcm
        EhE5zmgISNuHB2MNUVslyRb41A==
X-Google-Smtp-Source: APXvYqymAisY2dZ4g5ohYhAuT8PgurGXrw0Gt1SKH8ULxN+dDouKGVwEPyF6IhcmoB84dXN5YfN5VA==
X-Received: by 2002:a37:e402:: with SMTP id y2mr18240511qkf.200.1557767999021;
        Mon, 13 May 2019 10:19:59 -0700 (PDT)
Received: from tpx230-nicolas.collaboramtl (modemcable154.55-37-24.static.videotron.ca. [24.37.55.154])
        by smtp.gmail.com with ESMTPSA id n2sm3164979qkk.43.2019.05.13.10.19.56
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 13 May 2019 10:19:57 -0700 (PDT)
Message-ID: <2c6299e95ab0599d13fc8c884e54b43c00f19510.camel@ndufresne.ca>
Subject: Re: [RFC PATCH] vb2: add V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Thierry Reding <thierry.reding@gmail.com>
Date:   Mon, 13 May 2019 13:19:55 -0400
In-Reply-To: <3a18cca2-4d39-e000-3384-305e28b12025@xs4all.nl>
References: <87ad5e5c-088c-c5b6-f653-8936b8f334ab@xs4all.nl>
         <3a18cca2-4d39-e000-3384-305e28b12025@xs4all.nl>
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
        boundary="=-gdwYrJ2cvopOzSWCQfaA"
User-Agent: Evolution 3.32.1 (3.32.1-1.fc30) 
MIME-Version: 1.0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--=-gdwYrJ2cvopOzSWCQfaA
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lundi 13 mai 2019 =C3=A0 11:36 +0200, Hans Verkuil a =C3=A9crit :
> On 4/30/19 10:31 AM, Hans Verkuil wrote:
> > This RFC patch adds support for the V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF =
flag.
> > It also adds a new V4L2_BUF_CAP_SUPPORTS_M2M_HOLD_CAPTURE_BUF capabilit=
y and
> > a v4l2_m2m_release_capture_buf() helper function.
> >=20
> > Drivers should set vb2_queue->subsystem_flags to VB2_V4L2_FL_SUPPORTS_M=
2M_HOLD_CAPTURE_BUF
> > to indicate support for this flag.
> >=20
> > At the start of the device_run function drivers should first check if t=
he
> > current capture buffer should be released:
> >=20
> > if (v4l2_m2m_release_capture_buf(out_vb, cap_vb)) {
> > 	v4l2_m2m_buf_done(cap_vb, VB2_BUF_STATE_DONE);
> > 	v4l2_m2m_job_finish(...);
> > 	return;
> > }
> >=20
> > And at the end they should check (out_vb->flags & V4L2_BUF_FLAG_M2M_HOL=
D_CAPTURE_BUF)
> > and, if set, skip returning the capture buffer to vb2.
> >=20
> > This has only been compile tested, and this is missing the documentatio=
n. I would
> > like to know if this works in a real driver first before turning this i=
nto a proper
> > patch series.
>=20
> Ping!
>=20
> Did anyone have the opportunity (or is planning) to test if this patch ac=
tually works?

On my side, Boris is still working on getting the very basic of the
driver working, but this is in our queue.

>=20
> Regards,
>=20
> 	Hans
>=20
> > Regards,
> >=20
> > 	Hans
> >=20
> > Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> > ---
> > diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/=
media/common/videobuf2/videobuf2-v4l2.c
> > index fb9ac7696fc6..83372de9b815 100644
> > --- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
> > +++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> > @@ -50,7 +50,8 @@ module_param(debug, int, 0644);
> >  				 V4L2_BUF_FLAG_TIMESTAMP_MASK)
> >  /* Output buffer flags that should be passed on to the driver */
> >  #define V4L2_BUFFER_OUT_FLAGS	(V4L2_BUF_FLAG_PFRAME | V4L2_BUF_FLAG_BF=
RAME | \
> > -				 V4L2_BUF_FLAG_KEYFRAME | V4L2_BUF_FLAG_TIMECODE)
> > +				 V4L2_BUF_FLAG_KEYFRAME | V4L2_BUF_FLAG_TIMECODE | \
> > +				 V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF)
> >=20
> >  /*
> >   * __verify_planes_array() - verify that the planes array passed in st=
ruct
> > @@ -321,6 +322,8 @@ static int vb2_fill_vb2_v4l2_buffer(struct vb2_buff=
er *vb, struct v4l2_buffer *b
> >  		 */
> >  		vbuf->flags &=3D ~V4L2_BUF_FLAG_TIMECODE;
> >  		vbuf->field =3D b->field;
> > +		if (!(q->subsystem_flags & VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF=
))
> > +			vbuf->flags &=3D ~V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF;
> >  	} else {
> >  		/* Zero any output buffer flags as this is a capture buffer */
> >  		vbuf->flags &=3D ~V4L2_BUFFER_OUT_FLAGS;
> > @@ -659,6 +662,8 @@ static void fill_buf_caps(struct vb2_queue *q, u32 =
*caps)
> >  		*caps |=3D V4L2_BUF_CAP_SUPPORTS_USERPTR;
> >  	if (q->io_modes & VB2_DMABUF)
> >  		*caps |=3D V4L2_BUF_CAP_SUPPORTS_DMABUF;
> > +	if (q->subsystem_flags & VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF)
> > +		*caps |=3D V4L2_BUF_CAP_SUPPORTS_M2M_HOLD_CAPTURE_BUF;
> >  #ifdef CONFIG_MEDIA_CONTROLLER_REQUEST_API
> >  	if (q->supports_requests)
> >  		*caps |=3D V4L2_BUF_CAP_SUPPORTS_REQUESTS;
> > diff --git a/include/media/v4l2-mem2mem.h b/include/media/v4l2-mem2mem.=
h
> > index bb3e63d6bd1a..6af1d519938f 100644
> > --- a/include/media/v4l2-mem2mem.h
> > +++ b/include/media/v4l2-mem2mem.h
> > @@ -648,6 +648,38 @@ void v4l2_m2m_buf_copy_metadata(const struct vb2_v=
4l2_buffer *out_vb,
> >  				struct vb2_v4l2_buffer *cap_vb,
> >  				bool copy_frame_flags);
> >=20
> > +/**
> > + * v4l2_m2m_release_capture_buf() - check if the capture buffer should=
 be
> > + * released
> > + *
> > + * @out_vb: the output buffer
> > + * @cap_vb: the capture buffer
> > + *
> > + * This helper function returns true if the current capture buffer sho=
uld
> > + * be released to vb2. This is the case if the output buffer specified=
 that
> > + * the capture buffer should be held (i.e. not returned to vb2) AND if=
 the
> > + * timestamp of the capture buffer differs from the output buffer time=
stamp.
> > + *
> > + * This helper is to be called at the start of the device_run callback=
:
> > + *
> > + * if (v4l2_m2m_release_capture_buf(out_vb, cap_vb)) {
> > + *	v4l2_m2m_buf_done(cap_vb, VB2_BUF_STATE_DONE);
> > + *	v4l2_m2m_job_finish(...);
> > + *	return;
> > + * }
> > + *
> > + * This allows for multiple output buffers to be used to fill in a sin=
gle
> > + * capture buffer. This is typically used by stateless decoders where
> > + * multiple e.g. H.264 slices contribute to a single decoded frame.
> > + */
> > +static inline bool v4l2_m2m_release_capture_buf(const struct vb2_v4l2_=
buffer *out_vb,
> > +						const struct vb2_v4l2_buffer *cap_vb)
> > +{
> > +	return (out_vb->flags & V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF) &&
> > +		cap_vb->vb2_buf.copied_timestamp &&
> > +		out_vb->vb2_buf.timestamp !=3D cap_vb->vb2_buf.timestamp;
> > +}
> > +
> >  /* v4l2 request helper */
> >=20
> >  void v4l2_m2m_request_queue(struct media_request *req);
> > diff --git a/include/media/videobuf2-core.h b/include/media/videobuf2-c=
ore.h
> > index 22f3ff76a8b5..e9d99023c637 100644
> > --- a/include/media/videobuf2-core.h
> > +++ b/include/media/videobuf2-core.h
> > @@ -504,6 +504,8 @@ struct vb2_buf_ops {
> >   * @buf_ops:	callbacks to deliver buffer information.
> >   *		between user-space and kernel-space.
> >   * @drv_priv:	driver private data.
> > + * @subsystem_flags: Flags specific to the subsystem (V4L2/DVB/etc.). =
Not used
> > + *		by the vb2 core.
> >   * @buf_struct_size: size of the driver-specific buffer structure;
> >   *		"0" indicates the driver doesn't want to use a custom buffer
> >   *		structure type. for example, ``sizeof(struct vb2_v4l2_buffer)``
> > @@ -570,6 +572,7 @@ struct vb2_queue {
> >  	const struct vb2_buf_ops	*buf_ops;
> >=20
> >  	void				*drv_priv;
> > +	u32				subsystem_flags;
> >  	unsigned int			buf_struct_size;
> >  	u32				timestamp_flags;
> >  	gfp_t				gfp_flags;
> > diff --git a/include/media/videobuf2-v4l2.h b/include/media/videobuf2-v=
4l2.h
> > index 8a10889dc2fd..4e52427a4114 100644
> > --- a/include/media/videobuf2-v4l2.h
> > +++ b/include/media/videobuf2-v4l2.h
> > @@ -49,6 +49,9 @@ struct vb2_v4l2_buffer {
> >  	struct vb2_plane	planes[VB2_MAX_PLANES];
> >  };
> >=20
> > +/* VB2 V4L2 flags as set in vb2_queue.subsystem_flags */
> > +#define VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF (1 << 0)
> > +
> >  /*
> >   * to_vb2_v4l2_buffer() - cast struct vb2_buffer * to struct vb2_v4l2_=
buffer *
> >   */
> > diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videod=
ev2.h
> > index 1050a75fb7ef..26925d63ea05 100644
> > --- a/include/uapi/linux/videodev2.h
> > +++ b/include/uapi/linux/videodev2.h
> > @@ -907,11 +907,12 @@ struct v4l2_requestbuffers {
> >  };
> >=20
> >  /* capabilities for struct v4l2_requestbuffers and v4l2_create_buffers=
 */
> > -#define V4L2_BUF_CAP_SUPPORTS_MMAP	(1 << 0)
> > -#define V4L2_BUF_CAP_SUPPORTS_USERPTR	(1 << 1)
> > -#define V4L2_BUF_CAP_SUPPORTS_DMABUF	(1 << 2)
> > -#define V4L2_BUF_CAP_SUPPORTS_REQUESTS	(1 << 3)
> > -#define V4L2_BUF_CAP_SUPPORTS_ORPHANED_BUFS (1 << 4)
> > +#define V4L2_BUF_CAP_SUPPORTS_MMAP			(1 << 0)
> > +#define V4L2_BUF_CAP_SUPPORTS_USERPTR			(1 << 1)
> > +#define V4L2_BUF_CAP_SUPPORTS_DMABUF			(1 << 2)
> > +#define V4L2_BUF_CAP_SUPPORTS_REQUESTS			(1 << 3)
> > +#define V4L2_BUF_CAP_SUPPORTS_ORPHANED_BUFS		(1 << 4)
> > +#define V4L2_BUF_CAP_SUPPORTS_M2M_HOLD_CAPTURE_BUF	(1 << 5)
> >=20
> >  /**
> >   * struct v4l2_plane - plane info for multi-planar buffers
> > @@ -1033,6 +1034,8 @@ static inline __u64 v4l2_timeval_to_ns(const stru=
ct timeval *tv)
> >  #define V4L2_BUF_FLAG_IN_REQUEST		0x00000080
> >  /* timecode field is valid */
> >  #define V4L2_BUF_FLAG_TIMECODE			0x00000100
> > +/* Don't return the capture buffer until OUTPUT timestamp changes */
> > +#define V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF	0x00000200
> >  /* Buffer is prepared for queuing */
> >  #define V4L2_BUF_FLAG_PREPARED			0x00000400
> >  /* Cache handling flags */
> >=20

--=-gdwYrJ2cvopOzSWCQfaA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSScpfJiL+hb5vvd45xUwItrAaoHAUCXNmnOwAKCRBxUwItrAao
HImDAKC+zXFCvsAtt6tjCXGJn3Xpu28/2wCdHFcVLdsMlc7eSks9fYPp1o6cDTE=
=Ga2n
-----END PGP SIGNATURE-----

--=-gdwYrJ2cvopOzSWCQfaA--

