Return-Path: <linux-media+bounces-29151-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8557FA77CD4
	for <lists+linux-media@lfdr.de>; Tue,  1 Apr 2025 15:53:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E055B1891168
	for <lists+linux-media@lfdr.de>; Tue,  1 Apr 2025 13:51:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 449F9204C02;
	Tue,  1 Apr 2025 13:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VuIDe06o"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAB2D2046B7
	for <linux-media@vger.kernel.org>; Tue,  1 Apr 2025 13:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743515472; cv=none; b=rNHhxAuLo7Lsz+HE9HKaweyauOpFYx/vDoNDahhYxGPbSF+Ipz1YPqoyUdwwNSdXU8fZhfSeIwlUZxG1/WMaGk98Ad0yR60EBcFtSPHa1y6wvnrhQPXIa0uIFVeqmHVjTm+3jVdT9wNskV3jILBecKYMkIZ5yzVvch6VTVnj1i4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743515472; c=relaxed/simple;
	bh=cJHdw/SsXvwzTeojpzNk0Lii9hQwvDDM9GFbyohVqzU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d3EUOr23arriS72H5vnhL6mnSXiRvdhFTTxag5ZORM65TeU6UkSgf+WhiBqtmq4bPK6ckTLAAfLbFFji0yVSqVKVn/Bsrfis0GoTX5hgY92lKX+P3Ic2NmVkQJjOmFi6YCZtXa1sgl3nOMm+Xzh0RPbSgtroZsToQq61NkYW+68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VuIDe06o; arc=none smtp.client-ip=209.85.161.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-6021d118877so2932893eaf.2
        for <linux-media@vger.kernel.org>; Tue, 01 Apr 2025 06:51:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743515468; x=1744120268; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zIusq3t3q8ieulIg3RYZkwZIMxw/wJQCVWu56ex/OJA=;
        b=VuIDe06o2P3Fd47S5hBXjNgn14qmGkK6z8kMh2nsjKtGXtXS5n3Kf+G6tFvdqOf8Cl
         VRlJVEkiI/MA71YwlOCeY+9w3Df5R+HDAfnbZ19K0NAJs5Zknz2VQTi9l3hg5BrBIab6
         W0+QtPVAyZhiUuqvRH6VhITNXd+YTHTtqsitl52L90pjbnxuqgAGT7BLLcoTcv4l2m64
         vVxKONy2jbTJJyEHVG+gfxi5DPe7Y/eieGcthdmuo1vnzwGcMu67Uhn3qVxlxYsdOf4z
         Uo+LTiLVH1+UUERCldh/40etq8Iyw7ZMaIhCPmR+b/I0RLQOMxDAwUfNYGjBGMdsXaRi
         quAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743515468; x=1744120268;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zIusq3t3q8ieulIg3RYZkwZIMxw/wJQCVWu56ex/OJA=;
        b=WXbrB2nq7Xc42A72wU66F7nZ4b1N1Qp9bD7rGfbbn4c5DXHROvWiKD3EhSwaMEANYE
         pKvYmo91jSawFLniAVK0uM31SzcLXIbcVHfotObOcb4tp8/DimOTX+PRCFkd8XTDEBQl
         HBwD4nU/sCt1BnOzoaB1oe40k1wAaP8R16KxsFGglOC+clFKMk2ZZOxdOy4xZMGyETUP
         A8E+3H0FNuBrCKOEI+NtXwYfkMW7bgNUn4feCMuzXMnAL/5DmZphTTeaYqtWbuMMn+3t
         sQObtG7kumZMGwqnbsobMgtqYFbu3721H9gXiMvmE1OFscf4GUOa6tgp57OrRIbaLaBw
         b4tQ==
X-Forwarded-Encrypted: i=1; AJvYcCWRALY36PHzN3tHUx1x/i7bDqtdgmOk9WnK8IZ6GFd8STaCdqf1cpG1DD+eJDt4NbrmRpWYohZcnCwdwA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxCFS2dZraqVd5//ZT2+6QVc2XxhmoDW3461y7yHVwIOAez7ruI
	r5cAkl8caBm+ZFGdX/UTdx/mtBtPPwM7M650353DIcabgOyPplM5NyaSoMQ7VCK0w3q7Dm8ViYe
	vXJQBRZQKZt+KRLPCtH5nyvwOMPHVTcR+ef+VSA==
X-Gm-Gg: ASbGncsSY61zfpFao9DfAeW2DX94efsdmKNRjFOKb+FbF2Igy1Mkq4FCI1ilR7YmNN6
	skNhC4N8g5Yo+/NZZguankX0c5amUMOTPqn+lpHeWDSq2PHmZADdjbnCo/GCXuFdrdCokxn2E4z
	70pDYBamqg4nV/fcQMwhAkE1wMLMs=
X-Google-Smtp-Source: AGHT+IHhKU7zM7FnAe1ACnMG0P5I0HmZ0lANvcNQ6103vOjL0vgT9JbztJ1GF5YXgWkzMVl8uyuwCNmODb+yo2T0GrE=
X-Received: by 2002:a05:6871:151:b0:2bc:7811:5bb8 with SMTP id
 586e51a60fabf-2cbcf5599a4mr6753646fac.18.1743515467552; Tue, 01 Apr 2025
 06:51:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250305130634.1850178-1-jens.wiklander@linaro.org>
 <20250305130634.1850178-7-jens.wiklander@linaro.org> <Z-JSNoALMOoyfOXu@sumit-X1>
 <CAHUa44FMou3O+2MeRtEe+WDjoGdB_3U56Z0RUpFLMFR1ebTkKQ@mail.gmail.com> <Z-un1sJNHUKiOoFf@sumit-X1>
In-Reply-To: <Z-un1sJNHUKiOoFf@sumit-X1>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Tue, 1 Apr 2025 15:50:55 +0200
X-Gm-Features: AQ5f1Jo75X7IJFBt6HmdmHpnPTXqv8pVc2-cWa8DxOUCyGj4bRoJ0Jn-E4eACkc
Message-ID: <CAHUa44Gg4hpGMTwZpm5PVJLc5QHo5dWSu+=umyoH77gv-N4n=g@mail.gmail.com>
Subject: Re: [PATCH v6 06/10] tee: new ioctl to a register tee_shm from a
 dmabuf file descriptor
To: Sumit Garg <sumit.garg@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	op-tee@lists.trustedfirmware.org, linux-arm-kernel@lists.infradead.org, 
	Olivier Masse <olivier.masse@nxp.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Yong Wu <yong.wu@mediatek.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, "T . J . Mercier" <tjmercier@google.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, azarrabi@qti.qualcomm.com, 
	Simona Vetter <simona.vetter@ffwll.ch>, Daniel Stone <daniel@fooishbar.org>, 
	Etienne Carriere <etienne.carriere@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 1, 2025 at 10:46=E2=80=AFAM Sumit Garg <sumit.garg@kernel.org> =
wrote:
>
> On Tue, Mar 25, 2025 at 12:17:20PM +0100, Jens Wiklander wrote:
> > Hi Sumit,
> >
> > On Tue, Mar 25, 2025 at 7:50=E2=80=AFAM Sumit Garg <sumit.garg@kernel.o=
rg> wrote:
> > >
> > > Hi Jens,
> > >
> > > On Wed, Mar 05, 2025 at 02:04:12PM +0100, Jens Wiklander wrote:
> > > > From: Etienne Carriere <etienne.carriere@linaro.org>
> > > >
> > > > Enable userspace to create a tee_shm object that refers to a dmabuf
> > > > reference.
> > > >
> > > > Userspace registers the dmabuf file descriptor as in a tee_shm obje=
ct.
> > > > The registration is completed with a tee_shm file descriptor return=
ed to
> > > > userspace.
> > > >
> > > > Userspace is free to close the dmabuf file descriptor now since all=
 the
> > > > resources are now held via the tee_shm object.
> > > >
> > > > Closing the tee_shm file descriptor will release all resources used=
 by the
> > > > tee_shm object.
> > > >
> > > > This change only support dmabuf references that relates to physical=
ly
> > > > contiguous memory buffers.
>
> Let's try to reframe this commit message to say that new ioctl allows to
> register DMA buffers allocated from restricted/protected heaps with TEE
> subsystem.
>
> > > >
> > > > New tee_shm flag to identify tee_shm objects built from a registere=
d
> > > > dmabuf, TEE_SHM_DMA_BUF.
> > > >
> > > > Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
> > > > Signed-off-by: Olivier Masse <olivier.masse@nxp.com>
> > > > Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> > > > ---
> > > >  drivers/tee/tee_core.c    | 145 ++++++++++++++++++++++++++--------=
---
> > > >  drivers/tee/tee_private.h |   1 +
> > > >  drivers/tee/tee_shm.c     | 146 ++++++++++++++++++++++++++++++++++=
++--
> > > >  include/linux/tee_core.h  |   1 +
> > > >  include/linux/tee_drv.h   |  10 +++
> > > >  include/uapi/linux/tee.h  |  29 ++++++++
> > > >  6 files changed, 288 insertions(+), 44 deletions(-)
> > > >
> > >
> > > I am still trying to find if we really need a separate IOCTL to regis=
ter
> > > DMA heap with TEE subsystem. Can't we initialize tee_shm as a member =
of
> > > struct tee_heap_buffer in tee_dma_heap_alloc() where the allocation
> > > happens?
> >
> > No, that's not possible since we don't have a tee_context availble so
> > we can't assign an ID that userspace can use for this shm object.
> >
> > We could add new attribute types TEE_IOCTL_PARAM_ATTR_TYPE_MEMFD_*,
> > but it's a bit more complicated than that since we'd also need to
> > update for the life cycle.
>
> Okay, that's fair enough. Lets take this new IOCTL approach then.
>
> >
> >
> > > We can always find a reference back to tee_shm object from DMA
> > > buffer.
> >
> > Yes
> >
> > Cheers,
> > Jens
> >
> > >
> > > -Sumit
> > >
> > > > diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
> > > > index 685afcaa3ea1..3a71643766d5 100644
> > > > --- a/drivers/tee/tee_core.c
> > > > +++ b/drivers/tee/tee_core.c
> > > > @@ -353,6 +353,103 @@ tee_ioctl_shm_register(struct tee_context *ct=
x,
> > > >       return ret;
> > > >  }
> > > >
> > > > +static int
> > > > +tee_ioctl_shm_register_fd(struct tee_context *ctx,
> > > > +                       struct tee_ioctl_shm_register_fd_data __use=
r *udata)
> > > > +{
> > > > +     struct tee_ioctl_shm_register_fd_data data;
> > > > +     struct tee_shm *shm;
> > > > +     long ret;
> > > > +
> > > > +     if (copy_from_user(&data, udata, sizeof(data)))
> > > > +             return -EFAULT;
> > > > +
> > > > +     /* Currently no input flags are supported */
> > > > +     if (data.flags)
> > > > +             return -EINVAL;
> > > > +
> > > > +     shm =3D tee_shm_register_fd(ctx, data.fd);
> > > > +     if (IS_ERR(shm))
> > > > +             return -EINVAL;
> > > > +
> > > > +     data.id =3D shm->id;
> > > > +     data.flags =3D shm->flags;
> > > > +     data.size =3D shm->size;
> > > > +
> > > > +     if (copy_to_user(udata, &data, sizeof(data)))
> > > > +             ret =3D -EFAULT;
> > > > +     else
> > > > +             ret =3D tee_shm_get_fd(shm);
> > > > +
> > > > +     /*
> > > > +      * When user space closes the file descriptor the shared memo=
ry
> > > > +      * should be freed or if tee_shm_get_fd() failed then it will
> > > > +      * be freed immediately.
> > > > +      */
> > > > +     tee_shm_put(shm);
> > > > +     return ret;
> > > > +}
> > > > +
> > > > +static int param_from_user_memref(struct tee_context *ctx,
> > > > +                               struct tee_param_memref *memref,
> > > > +                               struct tee_ioctl_param *ip)
> > > > +{
> > > > +     struct tee_shm *shm;
> > > > +     size_t offs =3D 0;
> > > > +
> > > > +     /*
> > > > +      * If a NULL pointer is passed to a TA in the TEE,
> > > > +      * the ip.c IOCTL parameters is set to TEE_MEMREF_NULL
> > > > +      * indicating a NULL memory reference.
> > > > +      */
> > > > +     if (ip->c !=3D TEE_MEMREF_NULL) {
> > > > +             /*
> > > > +              * If we fail to get a pointer to a shared
> > > > +              * memory object (and increase the ref count)
> > > > +              * from an identifier we return an error. All
> > > > +              * pointers that has been added in params have
> > > > +              * an increased ref count. It's the callers
> > > > +              * responibility to do tee_shm_put() on all
> > > > +              * resolved pointers.
> > > > +              */
> > > > +             shm =3D tee_shm_get_from_id(ctx, ip->c);
> > > > +             if (IS_ERR(shm))
> > > > +                     return PTR_ERR(shm);
> > > > +
> > > > +             /*
> > > > +              * Ensure offset + size does not overflow
> > > > +              * offset and does not overflow the size of
> > > > +              * the referred shared memory object.
> > > > +              */
> > > > +             if ((ip->a + ip->b) < ip->a ||
> > > > +                 (ip->a + ip->b) > shm->size) {
> > > > +                     tee_shm_put(shm);
> > > > +                     return -EINVAL;
> > > > +             }
> > > > +
> > > > +             if (shm->flags & TEE_SHM_DMA_BUF) {
>
> This check is already done within tee_shm_get_parent_shm(), is it
> redundant here?

Yes, I'll remove it.

>
> > > > +                     struct tee_shm *parent_shm;
> > > > +
> > > > +                     parent_shm =3D tee_shm_get_parent_shm(shm, &o=
ffs);
> > > > +                     if (parent_shm) {
> > > > +                             tee_shm_put(shm);
> > > > +                             shm =3D parent_shm;
> > > > +                     }
> > > > +             }
> > > > +     } else if (ctx->cap_memref_null) {
> > > > +             /* Pass NULL pointer to OP-TEE */
> > > > +             shm =3D NULL;
> > > > +     } else {
> > > > +             return -EINVAL;
> > > > +     }
> > > > +
> > > > +     memref->shm_offs =3D ip->a + offs;
> > > > +     memref->size =3D ip->b;
> > > > +     memref->shm =3D shm;
> > > > +
> > > > +     return 0;
> > > > +}
> > > > +
> > > >  static int params_from_user(struct tee_context *ctx, struct tee_pa=
ram *params,
> > > >                           size_t num_params,
> > > >                           struct tee_ioctl_param __user *uparams)
> > > > @@ -360,8 +457,8 @@ static int params_from_user(struct tee_context =
*ctx, struct tee_param *params,
> > > >       size_t n;
> > > >
> > > >       for (n =3D 0; n < num_params; n++) {
> > > > -             struct tee_shm *shm;
> > > >               struct tee_ioctl_param ip;
> > > > +             int rc;
> > > >
> > > >               if (copy_from_user(&ip, uparams + n, sizeof(ip)))
> > > >                       return -EFAULT;
> > > > @@ -384,45 +481,10 @@ static int params_from_user(struct tee_contex=
t *ctx, struct tee_param *params,
> > > >               case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT:
> > > >               case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT:
> > > >               case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT:
> > > > -                     /*
> > > > -                      * If a NULL pointer is passed to a TA in the=
 TEE,
> > > > -                      * the ip.c IOCTL parameters is set to TEE_ME=
MREF_NULL
> > > > -                      * indicating a NULL memory reference.
> > > > -                      */
> > > > -                     if (ip.c !=3D TEE_MEMREF_NULL) {
> > > > -                             /*
> > > > -                              * If we fail to get a pointer to a s=
hared
> > > > -                              * memory object (and increase the re=
f count)
> > > > -                              * from an identifier we return an er=
ror. All
> > > > -                              * pointers that has been added in pa=
rams have
> > > > -                              * an increased ref count. It's the c=
allers
> > > > -                              * responibility to do tee_shm_put() =
on all
> > > > -                              * resolved pointers.
> > > > -                              */
> > > > -                             shm =3D tee_shm_get_from_id(ctx, ip.c=
);
> > > > -                             if (IS_ERR(shm))
> > > > -                                     return PTR_ERR(shm);
> > > > -
> > > > -                             /*
> > > > -                              * Ensure offset + size does not over=
flow
> > > > -                              * offset and does not overflow the s=
ize of
> > > > -                              * the referred shared memory object.
> > > > -                              */
> > > > -                             if ((ip.a + ip.b) < ip.a ||
> > > > -                                 (ip.a + ip.b) > shm->size) {
> > > > -                                     tee_shm_put(shm);
> > > > -                                     return -EINVAL;
> > > > -                             }
> > > > -                     } else if (ctx->cap_memref_null) {
> > > > -                             /* Pass NULL pointer to OP-TEE */
> > > > -                             shm =3D NULL;
> > > > -                     } else {
> > > > -                             return -EINVAL;
> > > > -                     }
> > > > -
> > > > -                     params[n].u.memref.shm_offs =3D ip.a;
> > > > -                     params[n].u.memref.size =3D ip.b;
> > > > -                     params[n].u.memref.shm =3D shm;
> > > > +                     rc =3D param_from_user_memref(ctx, &params[n]=
.u.memref,
> > > > +                                                 &ip);
> > > > +                     if (rc)
> > > > +                             return rc;
>
> This looks more of a refactoring, can we split it as a separate commit?

Sure

>
> > > >                       break;
> > > >               default:
> > > >                       /* Unknown attribute */
> > > > @@ -827,6 +889,8 @@ static long tee_ioctl(struct file *filp, unsign=
ed int cmd, unsigned long arg)
> > > >               return tee_ioctl_shm_alloc(ctx, uarg);
> > > >       case TEE_IOC_SHM_REGISTER:
> > > >               return tee_ioctl_shm_register(ctx, uarg);
> > > > +     case TEE_IOC_SHM_REGISTER_FD:
> > > > +             return tee_ioctl_shm_register_fd(ctx, uarg);
> > > >       case TEE_IOC_OPEN_SESSION:
> > > >               return tee_ioctl_open_session(ctx, uarg);
> > > >       case TEE_IOC_INVOKE:
> > > > @@ -1288,3 +1352,4 @@ MODULE_AUTHOR("Linaro");
> > > >  MODULE_DESCRIPTION("TEE Driver");
> > > >  MODULE_VERSION("1.0");
> > > >  MODULE_LICENSE("GPL v2");
> > > > +MODULE_IMPORT_NS("DMA_BUF");
> > > > diff --git a/drivers/tee/tee_private.h b/drivers/tee/tee_private.h
> > > > index 6c6ff5d5eed2..aad7f6c7e0f0 100644
> > > > --- a/drivers/tee/tee_private.h
> > > > +++ b/drivers/tee/tee_private.h
> > > > @@ -24,6 +24,7 @@ void teedev_ctx_put(struct tee_context *ctx);
> > > >  struct tee_shm *tee_shm_alloc_user_buf(struct tee_context *ctx, si=
ze_t size);
> > > >  struct tee_shm *tee_shm_register_user_buf(struct tee_context *ctx,
> > > >                                         unsigned long addr, size_t =
length);
> > > > +struct tee_shm *tee_shm_get_parent_shm(struct tee_shm *shm, size_t=
 *offs);
> > > >
> > > >  int tee_heap_update_from_dma_buf(struct tee_device *teedev,
> > > >                                struct dma_buf *dmabuf, size_t *offs=
et,
> > > > diff --git a/drivers/tee/tee_shm.c b/drivers/tee/tee_shm.c
> > > > index daf6e5cfd59a..8b79918468b5 100644
> > > > --- a/drivers/tee/tee_shm.c
> > > > +++ b/drivers/tee/tee_shm.c
> > > > @@ -4,6 +4,7 @@
> > > >   */
> > > >  #include <linux/anon_inodes.h>
> > > >  #include <linux/device.h>
> > > > +#include <linux/dma-buf.h>
> > > >  #include <linux/idr.h>
> > > >  #include <linux/io.h>
> > > >  #include <linux/mm.h>
> > > > @@ -15,6 +16,16 @@
> > > >  #include <linux/highmem.h>
> > > >  #include "tee_private.h"
> > > >
> > > > +/* extra references appended to shm object for registered shared m=
emory */
> > > > +struct tee_shm_dmabuf_ref {
> > > > +     struct tee_shm shm;
> > > > +     size_t offset;
> > > > +     struct dma_buf *dmabuf;
> > > > +     struct dma_buf_attachment *attach;
> > > > +     struct sg_table *sgt;
> > > > +     struct tee_shm *parent_shm;
> > > > +};
> > > > +
> > > >  static void shm_put_kernel_pages(struct page **pages, size_t page_=
count)
> > > >  {
> > > >       size_t n;
> > > > @@ -45,7 +56,23 @@ static void release_registered_pages(struct tee_=
shm *shm)
> > > >
> > > >  static void tee_shm_release(struct tee_device *teedev, struct tee_=
shm *shm)
> > > >  {
> > > > -     if (shm->flags & TEE_SHM_POOL) {
> > > > +     struct tee_shm *parent_shm =3D NULL;
> > > > +     void *p =3D shm;
> > > > +
> > > > +     if (shm->flags & TEE_SHM_DMA_BUF) {
> > > > +             struct tee_shm_dmabuf_ref *ref;
> > > > +
> > > > +             ref =3D container_of(shm, struct tee_shm_dmabuf_ref, =
shm);
> > > > +             parent_shm =3D ref->parent_shm;
> > > > +             p =3D ref;
> > > > +             if (ref->attach) {
> > > > +                     dma_buf_unmap_attachment(ref->attach, ref->sg=
t,
> > > > +                                              DMA_BIDIRECTIONAL);
> > > > +
> > > > +                     dma_buf_detach(ref->dmabuf, ref->attach);
> > > > +             }
> > > > +             dma_buf_put(ref->dmabuf);
> > > > +     } else if (shm->flags & TEE_SHM_POOL) {
> > > >               teedev->pool->ops->free(teedev->pool, shm);
> > > >       } else if (shm->flags & TEE_SHM_DYNAMIC) {
> > > >               int rc =3D teedev->desc->ops->shm_unregister(shm->ctx=
, shm);
> > > > @@ -57,9 +84,10 @@ static void tee_shm_release(struct tee_device *t=
eedev, struct tee_shm *shm)
> > > >               release_registered_pages(shm);
> > > >       }
> > > >
> > > > -     teedev_ctx_put(shm->ctx);
> > > > +     if (shm->ctx)
> > > > +             teedev_ctx_put(shm->ctx);
> > > >
> > > > -     kfree(shm);
> > > > +     kfree(p);
> > > >
> > > >       tee_device_put(teedev);
> > > >  }
> > > > @@ -169,7 +197,7 @@ struct tee_shm *tee_shm_alloc_user_buf(struct t=
ee_context *ctx, size_t size)
> > > >   * tee_client_invoke_func(). The memory allocated is later freed w=
ith a
> > > >   * call to tee_shm_free().
> > > >   *
> > > > - * @returns a pointer to 'struct tee_shm'
> > > > + * @returns a pointer to 'struct tee_shm' on success, and ERR_PTR =
on failure
> > > >   */
> > > >  struct tee_shm *tee_shm_alloc_kernel_buf(struct tee_context *ctx, =
size_t size)
> > > >  {
> > > > @@ -179,6 +207,116 @@ struct tee_shm *tee_shm_alloc_kernel_buf(stru=
ct tee_context *ctx, size_t size)
> > > >  }
> > > >  EXPORT_SYMBOL_GPL(tee_shm_alloc_kernel_buf);
> > > >
> > > > +struct tee_shm *tee_shm_register_fd(struct tee_context *ctx, int f=
d)
> > > > +{
> > > > +     struct tee_shm_dmabuf_ref *ref;
> > > > +     int rc;
> > > > +
> > > > +     if (!tee_device_get(ctx->teedev))
> > > > +             return ERR_PTR(-EINVAL);
> > > > +
> > > > +     teedev_ctx_get(ctx);
> > > > +
> > > > +     ref =3D kzalloc(sizeof(*ref), GFP_KERNEL);
> > > > +     if (!ref) {
> > > > +             rc =3D -ENOMEM;
> > > > +             goto err_put_tee;
> > > > +     }
> > > > +
> > > > +     refcount_set(&ref->shm.refcount, 1);
> > > > +     ref->shm.ctx =3D ctx;
> > > > +     ref->shm.id =3D -1;
> > > > +     ref->shm.flags =3D TEE_SHM_DMA_BUF;
> > > > +
> > > > +     ref->dmabuf =3D dma_buf_get(fd);
> > > > +     if (IS_ERR(ref->dmabuf)) {
> > > > +             rc =3D PTR_ERR(ref->dmabuf);
> > > > +             goto err_kfree_ref;
> > > > +     }
> > > > +
> > > > +     rc =3D tee_heap_update_from_dma_buf(ctx->teedev, ref->dmabuf,
> > > > +                                       &ref->offset, &ref->shm,
> > > > +                                       &ref->parent_shm);
> > > > +     if (!rc)
> > > > +             goto out;
> > > > +     if (rc !=3D -EINVAL)
> > > > +             goto err_put_dmabuf;
> > > > +
> > > > +     ref->attach =3D dma_buf_attach(ref->dmabuf, &ctx->teedev->dev=
);
> > > > +     if (IS_ERR(ref->attach)) {
> > > > +             rc =3D PTR_ERR(ref->attach);
> > > > +             goto err_put_dmabuf;
> > > > +     }
> > > > +
> > > > +     ref->sgt =3D dma_buf_map_attachment(ref->attach, DMA_BIDIRECT=
IONAL);
> > > > +     if (IS_ERR(ref->sgt)) {
> > > > +             rc =3D PTR_ERR(ref->sgt);
> > > > +             goto err_detach;
> > > > +     }
> > > > +
> > > > +     if (sg_nents(ref->sgt->sgl) !=3D 1) {
> > > > +             rc =3D PTR_ERR(ref->sgt->sgl);
> > > > +             goto err_unmap_attachement;
> > > > +     }
> > > > +
> > > > +     ref->shm.paddr =3D page_to_phys(sg_page(ref->sgt->sgl));
> > > > +     ref->shm.size =3D ref->sgt->sgl->length;
> > > > +
> > > > +out:
> > > > +     mutex_lock(&ref->shm.ctx->teedev->mutex);
> > > > +     ref->shm.id =3D idr_alloc(&ref->shm.ctx->teedev->idr, &ref->s=
hm,
> > > > +                             1, 0, GFP_KERNEL);
> > > > +     mutex_unlock(&ref->shm.ctx->teedev->mutex);
> > > > +     if (ref->shm.id < 0) {
> > > > +             rc =3D ref->shm.id;
> > > > +             if (ref->attach)
> > > > +                     goto err_unmap_attachement;
> > > > +             goto err_put_dmabuf;
> > > > +     }
> > > > +
> > > > +     return &ref->shm;
> > > > +
> > > > +err_unmap_attachement:
> > > > +     dma_buf_unmap_attachment(ref->attach, ref->sgt, DMA_BIDIRECTI=
ONAL);
> > > > +err_detach:
> > > > +     dma_buf_detach(ref->dmabuf, ref->attach);
> > > > +err_put_dmabuf:
> > > > +     dma_buf_put(ref->dmabuf);
> > > > +err_kfree_ref:
> > > > +     kfree(ref);
> > > > +err_put_tee:
> > > > +     teedev_ctx_put(ctx);
> > > > +     tee_device_put(ctx->teedev);
> > > > +
> > > > +     return ERR_PTR(rc);
> > > > +}
> > > > +EXPORT_SYMBOL_GPL(tee_shm_register_fd);
> > > > +
> > > > +struct tee_shm *tee_shm_get_parent_shm(struct tee_shm *shm, size_t=
 *offs)
> > > > +{
> > > > +     struct tee_shm *parent_shm =3D NULL;
> > > > +
> > > > +     if (shm->flags & TEE_SHM_DMA_BUF) {
> > > > +             struct tee_shm_dmabuf_ref *ref;
> > > > +
> > > > +             ref =3D container_of(shm, struct tee_shm_dmabuf_ref, =
shm);
> > > > +             if (ref->parent_shm) {
> > > > +                     /*
> > > > +                      * the shm already has one reference to
> > > > +                      * ref->parent_shm so we should be clear of 0=
.
> > > > +                      * We're getting another reference since the =
caller
> > > > +                      * of this function expects to put the return=
ed
> > > > +                      * parent_shm when it's done with it.
>
> This seems a bit complicated, can we rather inline this API as I can't
> see any other current user?

OK

Cheers,
Jens

>
> -Sumit
>
> > > > +                      */
> > > > +                     parent_shm =3D ref->parent_shm;
> > > > +                     refcount_inc(&parent_shm->refcount);
> > > > +                     *offs =3D ref->offset;
> > > > +             }
> > > > +     }
> > > > +
> > > > +     return parent_shm;
> > > > +}
> > > > +
> > > >  /**
> > > >   * tee_shm_alloc_priv_buf() - Allocate shared memory for a private=
ly shared
> > > >   *                         kernel buffer
> > > > diff --git a/include/linux/tee_core.h b/include/linux/tee_core.h
> > > > index 16ef078247ae..6bd833b6d0e1 100644
> > > > --- a/include/linux/tee_core.h
> > > > +++ b/include/linux/tee_core.h
> > > > @@ -28,6 +28,7 @@
> > > >  #define TEE_SHM_USER_MAPPED  BIT(1)  /* Memory mapped in user spac=
e */
> > > >  #define TEE_SHM_POOL         BIT(2)  /* Memory allocated from pool=
 */
> > > >  #define TEE_SHM_PRIV         BIT(3)  /* Memory private to TEE driv=
er */
> > > > +#define TEE_SHM_DMA_BUF              BIT(4)  /* Memory with dma-bu=
f handle */
> > > >
> > > >  #define TEE_DEVICE_FLAG_REGISTERED   0x1
> > > >  #define TEE_MAX_DEV_NAME_LEN         32
> > > > diff --git a/include/linux/tee_drv.h b/include/linux/tee_drv.h
> > > > index a54c203000ed..824f1251de60 100644
> > > > --- a/include/linux/tee_drv.h
> > > > +++ b/include/linux/tee_drv.h
> > > > @@ -116,6 +116,16 @@ struct tee_shm *tee_shm_alloc_kernel_buf(struc=
t tee_context *ctx, size_t size);
> > > >  struct tee_shm *tee_shm_register_kernel_buf(struct tee_context *ct=
x,
> > > >                                           void *addr, size_t length=
);
> > > >
> > > > +/**
> > > > + * tee_shm_register_fd() - Register shared memory from file descri=
ptor
> > > > + *
> > > > + * @ctx:     Context that allocates the shared memory
> > > > + * @fd:              Shared memory file descriptor reference
> > > > + *
> > > > + * @returns a pointer to 'struct tee_shm' on success, and ERR_PTR =
on failure
> > > > + */
> > > > +struct tee_shm *tee_shm_register_fd(struct tee_context *ctx, int f=
d);
> > > > +
> > > >  /**
> > > >   * tee_shm_free() - Free shared memory
> > > >   * @shm:     Handle to shared memory to free
> > > > diff --git a/include/uapi/linux/tee.h b/include/uapi/linux/tee.h
> > > > index d0430bee8292..1f9a4ac2b211 100644
> > > > --- a/include/uapi/linux/tee.h
> > > > +++ b/include/uapi/linux/tee.h
> > > > @@ -118,6 +118,35 @@ struct tee_ioctl_shm_alloc_data {
> > > >  #define TEE_IOC_SHM_ALLOC    _IOWR(TEE_IOC_MAGIC, TEE_IOC_BASE + 1=
, \
> > > >                                    struct tee_ioctl_shm_alloc_data)
> > > >
> > > > +/**
> > > > + * struct tee_ioctl_shm_register_fd_data - Shared memory registeri=
ng argument
> > > > + * @fd:              [in] File descriptor identifying the shared m=
emory
> > > > + * @size:    [out] Size of shared memory to allocate
> > > > + * @flags:   [in] Flags to/from allocation.
> > > > + * @id:              [out] Identifier of the shared memory
> > > > + *
> > > > + * The flags field should currently be zero as input. Updated by t=
he call
> > > > + * with actual flags as defined by TEE_IOCTL_SHM_* above.
> > > > + * This structure is used as argument for TEE_IOC_SHM_REGISTER_FD =
below.
> > > > + */
> > > > +struct tee_ioctl_shm_register_fd_data {
> > > > +     __s64 fd;
> > > > +     __u64 size;
> > > > +     __u32 flags;
> > > > +     __s32 id;
> > > > +};
> > > > +
> > > > +/**
> > > > + * TEE_IOC_SHM_REGISTER_FD - register a shared memory from a file =
descriptor
> > > > + *
> > > > + * Returns a file descriptor on success or < 0 on failure
> > > > + *
> > > > + * The returned file descriptor refers to the shared memory object=
 in kernel
> > > > + * land. The shared memory is freed when the descriptor is closed.
> > > > + */
> > > > +#define TEE_IOC_SHM_REGISTER_FD      _IOWR(TEE_IOC_MAGIC, TEE_IOC_=
BASE + 8, \
> > > > +                                  struct tee_ioctl_shm_register_fd=
_data)
> > > > +
> > > >  /**
> > > >   * struct tee_ioctl_buf_data - Variable sized buffer
> > > >   * @buf_ptr: [in] A __user pointer to a buffer
> > > > --
> > > > 2.43.0
> > > >

