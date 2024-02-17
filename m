Return-Path: <linux-media+bounces-5349-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A73FE859075
	for <lists+linux-media@lfdr.de>; Sat, 17 Feb 2024 16:21:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 396251F21AE0
	for <lists+linux-media@lfdr.de>; Sat, 17 Feb 2024 15:21:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CECA97CF0E;
	Sat, 17 Feb 2024 15:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="eN+42ZPU"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AED07CF09
	for <linux-media@vger.kernel.org>; Sat, 17 Feb 2024 15:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708183276; cv=none; b=aMQohHhvxES2/XT7k+A8z+9NOkXdyHokofvJEqvODnzXuZ8K06BZl8mbSYQKAGV/mdwD9Ql03jksUXPtJX0SE3c3YJpr40kUIMW/Tw010/eNdI1cwQvAu+3C8sOv1nagd4NQKW3DcOND2XASZnshTPj8iByou2exzbaC+l5Bo4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708183276; c=relaxed/simple;
	bh=DVg1rIwrd89oa5rJYFSCyqHJBtM7WwEdMOFexL2uDwo=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=c6yL0+DZNky+ROAnowiD0ocCbctVljFrpBwgCc+4RKFRmi0K+IEhq4FiSXaF5OZwRrYnSy6YbhuvYq0gxgtfZ1xUvx3gv4wLanLdazP+vk03Pj+g7U0FLHa16A8FkQpqwbXdKqjWIULOLwnvPrHYiaX0KWAjGBrRB39WWZyroJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=eN+42ZPU; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (aztw-30-b2-v4wan-166917-cust845.vm26.cable.virginm.net [82.37.23.78])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 068186B3;
	Sat, 17 Feb 2024 16:21:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1708183268;
	bh=DVg1rIwrd89oa5rJYFSCyqHJBtM7WwEdMOFexL2uDwo=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=eN+42ZPU4G3cbpg/RleZY+aE1DJY9c0K5FhrItNveUBprLdNcpB8GUX23V0KhaSTY
	 R37TFk/L4TwebvsqQvR2s3syVfTCzLVI0A5vNPeTperW+OaSwZJyReGCjbBOr1dt4w
	 h40CHytmG9yHzyI8rQ+9z9WBlMH0V0b4v5SJs3nw=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240217112438.15240-7-hdegoede@redhat.com>
References: <20240217112438.15240-1-hdegoede@redhat.com> <20240217112438.15240-7-hdegoede@redhat.com>
Subject: Re: [PATCH 6/9] media: atomisp: Add DMABUF support
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Kate Hsuan <hpa@redhat.com>, Tsuchiya Yuto <kitakar@gmail.com>, Yury Luneff <yury.lunev@gmail.com>, Nable <nable.maininbox@googlemail.com>, andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>, linux-media@vger.kernel.org, linux-staging@lists.linux.dev
To: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hdegoede@redhat.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>
Date: Sat, 17 Feb 2024 15:21:10 +0000
Message-ID: <170818327086.1206667.14052062863243784795@ping.linuxembedded.co.uk>
User-Agent: alot/0.10

Quoting Hans de Goede (2024-02-17 11:24:35)
> Add DMABUF support and while at it drop userptr support.
>=20
> Now that atomisp has been ported to videobuf2 this is trivial.

Seems 'too' easy, Nice.

Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

>=20
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/staging/media/atomisp/pci/atomisp_ioctl.c  | 1 +
>  drivers/staging/media/atomisp/pci/atomisp_subdev.c | 2 +-
>  2 files changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/=
staging/media/atomisp/pci/atomisp_ioctl.c
> index 74cf055cb09b..fa6c9f0ea6eb 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
> @@ -1666,6 +1666,7 @@ const struct v4l2_ioctl_ops atomisp_ioctl_ops =3D {
>         .vidioc_querybuf =3D vb2_ioctl_querybuf,
>         .vidioc_qbuf =3D atomisp_qbuf_wrapper,
>         .vidioc_dqbuf =3D atomisp_dqbuf_wrapper,
> +       .vidioc_expbuf =3D vb2_ioctl_expbuf,
>         .vidioc_streamon =3D vb2_ioctl_streamon,
>         .vidioc_streamoff =3D vb2_ioctl_streamoff,
>         .vidioc_default =3D atomisp_vidioc_default,
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_subdev.c b/drivers=
/staging/media/atomisp/pci/atomisp_subdev.c
> index 7f1ca05ce54a..8253b6faf8cd 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_subdev.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
> @@ -765,7 +765,7 @@ static int atomisp_init_subdev_pipe(struct atomisp_su=
b_device *asd,
> =20
>         /* Init videobuf2 queue structure */
>         pipe->vb_queue.type =3D V4L2_BUF_TYPE_VIDEO_CAPTURE;
> -       pipe->vb_queue.io_modes =3D VB2_MMAP | VB2_USERPTR;
> +       pipe->vb_queue.io_modes =3D VB2_MMAP | VB2_DMABUF;
>         pipe->vb_queue.buf_struct_size =3D sizeof(struct ia_css_frame);
>         pipe->vb_queue.ops =3D &atomisp_vb2_ops;
>         pipe->vb_queue.mem_ops =3D &vb2_vmalloc_memops;
> --=20
> 2.43.0
>

