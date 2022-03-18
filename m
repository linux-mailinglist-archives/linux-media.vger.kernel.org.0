Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 862AD4DE39D
	for <lists+linux-media@lfdr.de>; Fri, 18 Mar 2022 22:39:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237606AbiCRVkl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Mar 2022 17:40:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230216AbiCRVkl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Mar 2022 17:40:41 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9B822AE9FE;
        Fri, 18 Mar 2022 14:39:21 -0700 (PDT)
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7C93AEE;
        Fri, 18 Mar 2022 22:39:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1647639559;
        bh=B1wT1f99SlOv/ymqDdpBiFSzaIiKoXcCPP62XlXKt3s=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=h0gDqrGxj2S0o4CvOZHnyO7lVaKwsZ1NFyoadverYt0m9Q3tZ3wSFRp/ne3+NEmTH
         AGLKIWkLYtmr1FtxJuZeqjY3N98RXOa06xKHmrcBiEaqH3P+L6qyFYHJk1xjtz7kGP
         7yEZ7egzIite8hOZokRwPsq/cUiDh+TM4WZ7bDx0=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220318211446.11543-2-laurent.pinchart+renesas@ideasonboard.com>
References: <20220318211446.11543-1-laurent.pinchart+renesas@ideasonboard.com> <20220318211446.11543-2-laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH 1/3] media: videobuf2-v4l2: Expose vb2_queue_is_busy() to drivers
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Tomasz Figa <tfiga@chromium.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        linux-media@vger.kernel.org
Date:   Fri, 18 Mar 2022 21:39:16 +0000
Message-ID: <164763955645.2211712.6934401489254152753@Monstersaurus>
User-Agent: alot/0.10
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

Quoting Laurent Pinchart (2022-03-18 21:14:44)
> vb2 queue ownership is managed by the ioctl handler helpers
> (vb2_ioctl_*). There are however use cases where drivers can benefit
> from checking queue ownership, for instance when open-coding an ioctl
> handler that needs to perform additional checks before calling the
> corresponding vb2 operation.
>=20
> Expose the vb2_queue_is_busy() function in the videobuf2-v4l2.h header,
> and change its first argument to a struct vb2_queue pointer as the
> function name implies it operates on a queue, not a video_device.
>=20
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.co=
m>
> ---
>  .../media/common/videobuf2/videobuf2-v4l2.c   | 26 +++++++------------
>  include/media/videobuf2-v4l2.h                | 23 ++++++++++++++--
>  2 files changed, 31 insertions(+), 18 deletions(-)
>=20
> diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/me=
dia/common/videobuf2/videobuf2-v4l2.c
> index 6edf4508c636..075d24ebf44c 100644
> --- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
> +++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> @@ -977,12 +977,6 @@ EXPORT_SYMBOL_GPL(vb2_poll);
>   * and so they simplify the driver code.
>   */
> =20
> -/* The queue is busy if there is a owner and you are not that owner. */
> -static inline bool vb2_queue_is_busy(struct video_device *vdev, struct f=
ile *file)
> -{
> -       return vdev->queue->owner && vdev->queue->owner !=3D file->privat=
e_data;
> -}
> -
>  /* vb2 ioctl helpers */
> =20
>  int vb2_ioctl_reqbufs(struct file *file, void *priv,
> @@ -997,7 +991,7 @@ int vb2_ioctl_reqbufs(struct file *file, void *priv,
>         p->flags =3D flags;
>         if (res)
>                 return res;
> -       if (vb2_queue_is_busy(vdev, file))
> +       if (vb2_queue_is_busy(vdev->queue, file))
>                 return -EBUSY;
>         res =3D vb2_core_reqbufs(vdev->queue, p->memory, p->flags, &p->co=
unt);
>         /* If count =3D=3D 0, then the owner has released all buffers and=
 he
> @@ -1026,7 +1020,7 @@ int vb2_ioctl_create_bufs(struct file *file, void *=
priv,
>                 return res !=3D -EBUSY ? res : 0;
>         if (res)
>                 return res;
> -       if (vb2_queue_is_busy(vdev, file))
> +       if (vb2_queue_is_busy(vdev->queue, file))
>                 return -EBUSY;
> =20
>         res =3D vb2_create_bufs(vdev->queue, p);
> @@ -1041,7 +1035,7 @@ int vb2_ioctl_prepare_buf(struct file *file, void *=
priv,
>  {
>         struct video_device *vdev =3D video_devdata(file);
> =20
> -       if (vb2_queue_is_busy(vdev, file))
> +       if (vb2_queue_is_busy(vdev->queue, file))
>                 return -EBUSY;
>         return vb2_prepare_buf(vdev->queue, vdev->v4l2_dev->mdev, p);
>  }
> @@ -1060,7 +1054,7 @@ int vb2_ioctl_qbuf(struct file *file, void *priv, s=
truct v4l2_buffer *p)
>  {
>         struct video_device *vdev =3D video_devdata(file);
> =20
> -       if (vb2_queue_is_busy(vdev, file))
> +       if (vb2_queue_is_busy(vdev->queue, file))
>                 return -EBUSY;
>         return vb2_qbuf(vdev->queue, vdev->v4l2_dev->mdev, p);
>  }
> @@ -1070,7 +1064,7 @@ int vb2_ioctl_dqbuf(struct file *file, void *priv, =
struct v4l2_buffer *p)
>  {
>         struct video_device *vdev =3D video_devdata(file);
> =20
> -       if (vb2_queue_is_busy(vdev, file))
> +       if (vb2_queue_is_busy(vdev->queue, file))
>                 return -EBUSY;
>         return vb2_dqbuf(vdev->queue, p, file->f_flags & O_NONBLOCK);
>  }
> @@ -1080,7 +1074,7 @@ int vb2_ioctl_streamon(struct file *file, void *pri=
v, enum v4l2_buf_type i)
>  {
>         struct video_device *vdev =3D video_devdata(file);
> =20
> -       if (vb2_queue_is_busy(vdev, file))
> +       if (vb2_queue_is_busy(vdev->queue, file))
>                 return -EBUSY;
>         return vb2_streamon(vdev->queue, i);
>  }
> @@ -1090,7 +1084,7 @@ int vb2_ioctl_streamoff(struct file *file, void *pr=
iv, enum v4l2_buf_type i)
>  {
>         struct video_device *vdev =3D video_devdata(file);
> =20
> -       if (vb2_queue_is_busy(vdev, file))
> +       if (vb2_queue_is_busy(vdev->queue, file))
>                 return -EBUSY;
>         return vb2_streamoff(vdev->queue, i);
>  }
> @@ -1100,7 +1094,7 @@ int vb2_ioctl_expbuf(struct file *file, void *priv,=
 struct v4l2_exportbuffer *p)
>  {
>         struct video_device *vdev =3D video_devdata(file);
> =20
> -       if (vb2_queue_is_busy(vdev, file))
> +       if (vb2_queue_is_busy(vdev->queue, file))
>                 return -EBUSY;
>         return vb2_expbuf(vdev->queue, p);
>  }
> @@ -1152,7 +1146,7 @@ ssize_t vb2_fop_write(struct file *file, const char=
 __user *buf,
>                 return -EINVAL;
>         if (lock && mutex_lock_interruptible(lock))
>                 return -ERESTARTSYS;
> -       if (vb2_queue_is_busy(vdev, file))
> +       if (vb2_queue_is_busy(vdev->queue, file))
>                 goto exit;
>         err =3D vb2_write(vdev->queue, buf, count, ppos,
>                        file->f_flags & O_NONBLOCK);
> @@ -1176,7 +1170,7 @@ ssize_t vb2_fop_read(struct file *file, char __user=
 *buf,
>                 return -EINVAL;
>         if (lock && mutex_lock_interruptible(lock))
>                 return -ERESTARTSYS;
> -       if (vb2_queue_is_busy(vdev, file))
> +       if (vb2_queue_is_busy(vdev->queue, file))
>                 goto exit;
>         err =3D vb2_read(vdev->queue, buf, count, ppos,
>                        file->f_flags & O_NONBLOCK);
> diff --git a/include/media/videobuf2-v4l2.h b/include/media/videobuf2-v4l=
2.h
> index b66585e304e2..1fb99583cd45 100644
> --- a/include/media/videobuf2-v4l2.h
> +++ b/include/media/videobuf2-v4l2.h
> @@ -302,10 +302,29 @@ __poll_t vb2_poll(struct vb2_queue *q, struct file =
*file, poll_table *wait);
>   * The following functions are not part of the vb2 core API, but are sim=
ple
>   * helper functions that you can use in your struct v4l2_file_operations,
>   * struct v4l2_ioctl_ops and struct vb2_ops. They will serialize if vb2_=
queue->lock
> - * or video_device->lock is set, and they will set and test vb2_queue->o=
wner
> - * to check if the calling filehandle is permitted to do the queuing ope=
ration.
> + * or video_device->lock is set, and they will set and test the queue ow=
ner
> + * (vb2_queue->owner) to check if the calling filehandle is permitted to=
 do the
> + * queuing operation.
>   */
> =20
> +/**
> + * vb2_queue_is_busy() - check if the queue is busy
> + * @q:         pointer to &struct vb2_queue with videobuf2 queue.
> + * @file:      file through which the vb2 queue access is performed
> + *
> + * The queue is considered busy if is has an owner and the owner is not =
the

 if it has

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> + * @file.
> + *
> + * Queue ownership is acquired and checked by some of the v4l2_ioctl_ops=
 helpers
> + * below. Drivers can also use this function directly when they need to
> + * open-code ioctl handlers, for instance to add additional checks betwe=
en the
> + * queue ownership test and the call to the corresponding vb2 operation.
> + */
> +static inline bool vb2_queue_is_busy(struct vb2_queue *q, struct file *f=
ile)
> +{
> +       return q->owner && q->owner !=3D file->private_data;
> +}
> +
>  /* struct v4l2_ioctl_ops helpers */
> =20
>  int vb2_ioctl_reqbufs(struct file *file, void *priv,
> --=20
> Regards,
>=20
> Laurent Pinchart
>
