Return-Path: <linux-media+bounces-3413-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A192D82872D
	for <lists+linux-media@lfdr.de>; Tue,  9 Jan 2024 14:36:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2002F1F249F8
	for <lists+linux-media@lfdr.de>; Tue,  9 Jan 2024 13:36:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 185B638FA4;
	Tue,  9 Jan 2024 13:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iKcH9UcT"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E987826AF7
	for <linux-media@vger.kernel.org>; Tue,  9 Jan 2024 13:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-40e43e489e4so30367565e9.1
        for <linux-media@vger.kernel.org>; Tue, 09 Jan 2024 05:35:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704807351; x=1705412151; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=t2co1xXH/5MsCZURhArN51U4YnQxpLB8CGJGS+wRZCI=;
        b=iKcH9UcTxBdMIVBAKshAxmetuhQEFZq5YowOS2puSRTjo083tpNo2jL1Axmg5zDhkw
         3pMpoVC13CwREXoWwPIWUrEOcArVffCm1OAQF7aRwu0z+6nIWjrjYQDs0X/NsfVX4QS5
         2VqEK3n1NTcfX77f58DtO0r1ek+6NyQRetS5m8ONUHDIsCWTEXhCFc7kWU0okvO9nmA/
         m++8tJs+A35q1Hs38XaOh0C1k2U3KPaAr45UQVKean2eFAGUFX2tYJIXj+cn6YALKb6d
         AmroBA5ereRjiLyBRyf6wyP0hkdwKDHoh/ltUct8KweJpWnPOq2ZRGyo8AhgNc5ITfks
         8Jrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704807351; x=1705412151;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t2co1xXH/5MsCZURhArN51U4YnQxpLB8CGJGS+wRZCI=;
        b=i8BNjzMitXGI/odUot96j7szuRta6/qMDkJL+XoqoDFKErqk5SauOFqk8f8H/rbsih
         ocoxEDIye6ZHv379CPvh6p3nMyDxlKI6Gt49ZQGFUL5cg9zFUQxatWHiKH+ZKZnZ5MvA
         MrNx/XYQEFduNFfw9BwLDxo86RyHpswiQfaqbJKp8+aWt04yZDWDY9+SX0I560KZGmDb
         0OLExuyi8+cKMWC7QNiEnqLZRwaNeiE8FD9iwKNLkOyPbJnEfMGdMiKJENXgcpVeujMw
         qZQJKt2xMWEKQcI8f+W0PY4D15G7RCnvyLVkTk3InNXvk6aOJk4rPf5F5Y247ckS6Z/T
         PTOA==
X-Gm-Message-State: AOJu0Ywhhh1X8e8vle8pQKP0rwvWd5/7TyfVjkcq6DlJerOweH5gajR2
	PNP/VcOltC3ssMtF3ruZ03g=
X-Google-Smtp-Source: AGHT+IF3z6sB1v6hReYf1OYkfdfLLkLxl2rD7JXMC/HGfGlnh8KR2vhCt2WfeaUbyFRsAeHL58H1tw==
X-Received: by 2002:a05:600c:8505:b0:40d:9208:ebc9 with SMTP id gw5-20020a05600c850500b0040d9208ebc9mr2827241wmb.12.1704807350920;
        Tue, 09 Jan 2024 05:35:50 -0800 (PST)
Received: from [192.168.50.250] (c-x59968899.customers.hiper-net.dk. [89.150.136.153])
        by smtp.gmail.com with ESMTPSA id r14-20020a17090638ce00b00a26f6b8be1csm1050468ejd.75.2024.01.09.05.35.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jan 2024 05:35:50 -0800 (PST)
Message-ID: <813554caaf98083462f6d2078779d16bf06cb56a.camel@gmail.com>
Subject: Re: [PATCH v2 11/15] media: intel/ipu6: input system video capture
 nodes
From: Andreas Helbech Kleist <andreaskleist@gmail.com>
To: bingbu.cao@intel.com, linux-media@vger.kernel.org, 
	sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com
Cc: andriy.shevchenko@linux.intel.com, hdegoede@redhat.com, 
 ilpo.jarvinen@linux.intel.com, claus.stovgaard@gmail.com,
 tfiga@chromium.org,  senozhatsky@chromium.org,
 tomi.valkeinen@ideasonboard.com,  bingbu.cao@linux.intel.com,
 tian.shu.qiu@intel.com, hongju.wang@intel.com
Date: Tue, 09 Jan 2024 14:35:48 +0100
In-Reply-To: <20231024112924.3934228-12-bingbu.cao@intel.com>
References: <20231024112924.3934228-1-bingbu.cao@intel.com>
	 <20231024112924.3934228-12-bingbu.cao@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu2 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Bingbu,

On Tue, 2023-10-24 at 19:29 +0800, bingbu.cao@intel.com wrote:
> From: Bingbu Cao <bingbu.cao@intel.com>
>=20
> Register v4l2 video device and setup the vb2 queue to
> support basic video capture. Video streaming callback
> will trigger the input system driver to construct a
> input system stream configuration for firmware based on
> data type and stream ID and then queue buffers to firmware
> to do capture.
>=20
> Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
> ---

...

> +++ b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c

...

> +static int video_release(struct file *file)
> +{
> +	return vb2_fop_release(file);
> +}

...


> +/*
> + * Do everything that's needed to initialise things related to video
> + * buffer queue, video node, and the related media entity. The caller
> + * is expected to assign isys field and set the name of the video
> + * device.
> + */
> +int ipu6_isys_video_init(struct ipu6_isys_video *av)
> +{
> +	struct v4l2_format format =3D {
> +		.type =3D V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
> +		.fmt.pix_mp =3D {
> +			.width =3D 1920,
> +			.height =3D 1080,
> +		},
> +	};
> +	int ret;
> +
> +	mutex_init(&av->mutex);
> +	av->vdev.device_caps =3D V4L2_CAP_STREAMING | V4L2_CAP_IO_MC |
> +			       V4L2_CAP_VIDEO_CAPTURE_MPLANE;
> +	av->vdev.vfl_dir =3D VFL_DIR_RX;
> +
> +	ret =3D ipu6_isys_queue_init(&av->aq);
> +	if (ret)
> +		goto out_free_watermark;
> +
> +	av->pad.flags =3D MEDIA_PAD_FL_SINK | MEDIA_PAD_FL_MUST_CONNECT;
> +	ret =3D media_entity_pads_init(&av->vdev.entity, 1, &av->pad);
> +	if (ret)
> +		goto out_ipu6_isys_queue_cleanup;
> +
> +	av->vdev.entity.ops =3D &entity_ops;
> +	av->vdev.release =3D video_device_release_empty;
> +	av->vdev.fops =3D &isys_fops;
> +	av->vdev.v4l2_dev =3D &av->isys->v4l2_dev;
> +	if (!av->vdev.ioctl_ops)
> +		av->vdev.ioctl_ops =3D &ioctl_ops_mplane;
> +	av->vdev.queue =3D &av->aq.vbq;
> +	av->vdev.lock =3D &av->mutex;
> +
> +	ipu6_isys_video_try_fmt_vid_mplane(av, &format.fmt.pix_mp);
> +	av->mpix =3D format.fmt.pix_mp;
> +
> +	set_bit(V4L2_FL_USES_V4L2_FH, &av->vdev.flags);
> +	video_set_drvdata(&av->vdev, av);
> +
> +	ret =3D video_register_device(&av->vdev, VFL_TYPE_VIDEO, -1);
> +	if (ret)
> +		goto out_media_entity_cleanup;
> +
> +	return ret;
> +
> +out_media_entity_cleanup:
> +	video_unregister_device(&av->vdev);
> +	media_entity_cleanup(&av->vdev.entity);
> +
> +out_ipu6_isys_queue_cleanup:
> +	ipu6_isys_queue_cleanup(&av->aq);
> +
> +out_free_watermark:
> +	mutex_destroy(&av->mutex);
> +
> +	return ret;
> +}
> +
> +void ipu6_isys_video_cleanup(struct ipu6_isys_video *av)
> +{
> +	video_unregister_device(&av->vdev);
> +	media_entity_cleanup(&av->vdev.entity);
> +	mutex_destroy(&av->mutex);
> +	ipu6_isys_queue_cleanup(&av->aq);
> +}

I believe you should use vb2_video_unregister_device here instead of
video_unregister_device in both ipu6_isys_video_init and
ipu6_isys_video_cleanup, and remove the call to
ipu6_isys_queue_cleanup.

Commit f729ef5796d8 from Hans Verkuil that added
vb2_video_unregister_device states: "If a driver calls
(_)vb2_fop_release(), then such a driver should also call
vb2_video_unregister_device() instead of video_unregister_device().
This helper will call vb2_queue_release() if a filehandle is marked as
 owner of the queue. This ensures that at unregister time any streaming
 is cancelled and all buffers are returned to userspace."


In my testing, using IPU4, this prevents some crashes when unbinding
the PCI device while streaming.

/Andreas

