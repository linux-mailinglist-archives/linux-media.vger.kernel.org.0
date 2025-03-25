Return-Path: <linux-media+bounces-28660-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 296EBA6EBF1
	for <lists+linux-media@lfdr.de>; Tue, 25 Mar 2025 09:50:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7FB71169E4C
	for <lists+linux-media@lfdr.de>; Tue, 25 Mar 2025 08:50:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BD0419E96B;
	Tue, 25 Mar 2025 08:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LxZ1ivLZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A56271A0BCF
	for <linux-media@vger.kernel.org>; Tue, 25 Mar 2025 08:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742892650; cv=none; b=fgtBYIEQgHP50aZTkiHpdT9F5kw9dI7xgiyrhP3Te9OQc1xuUXDg6+fxpn4pPhWBfoWgahOV8RHtrtLgY6kORIa+dWHpWel3d9WUuwwr7+S82UlYN+rSMllITvUd61CW4G78yASYE+fqFnvZtROxoUQKn40HXLUhvGDaGBv3IGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742892650; c=relaxed/simple;
	bh=suynEf135kmKoe6SMoab+SuhQWn2VGyHbdm7fjDtc4E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gMnt1hLo5pFbPBAKMkehC6GXhEn6d611l2jO1N0YHZBibeU9m5goh7xbZGX5Ek58wYhwhXzsyvSJqNNARYLMZ26/L6/n08UUU8F9LlhLPpvoXwivMpu5P2kUGasa1d9LaGd5TtB8v+SkTDqyme/s05YCdvzGQha503NjSCVHWmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LxZ1ivLZ; arc=none smtp.client-ip=209.85.161.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-6003d977ab7so3121905eaf.2
        for <linux-media@vger.kernel.org>; Tue, 25 Mar 2025 01:50:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742892647; x=1743497447; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5eOMTRp7OLNI3VGicdgRH0lRnyRYz67Gt/EAnTu6nbQ=;
        b=LxZ1ivLZjzNUb2kBVCGTPconFc9SyrqteY8oaneQxiy/RkGRRvtkDkoKrqLoIKwCM6
         4UdAVpZZtVNDo5Xq5lBJflQX2s1A8zniFv8VodP8QNJmFO8kRdh1Eb9jwygqbHFK5rrT
         /wM0ahtCglA2jLzZB5eii5VP4XRhqJNVs/Lg+MofsaELhRRBbHQEd/B5VmR14IzTHGV4
         JGHkaLBsfB1nqMFTeGY+O6xhdUly91/9WGI1qZQvWDeDr05KdPhWYCorD6IpirlyTfF+
         yjb3rO3dFYJzAldrseKoDJfrvpthVSODm3exCA/Vkbrphuk2tlJPQjnCqVFtOVWTYniU
         ylog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742892647; x=1743497447;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5eOMTRp7OLNI3VGicdgRH0lRnyRYz67Gt/EAnTu6nbQ=;
        b=q0+y5CeBN03MiaNGegi1W6A8x8E7mLTB+Sq0L8BPf7WTFG79ZPcaxANWwpyhL7ip0+
         Su2tty8JYggyjH74C6Lq+ttvvg2qa238EfUmFQ7a0rMrOzkgjcudFmkL1K5SPkR/F5Mq
         +dDYKxXd8/WNl17gpQk/7/gkDw5qH2VMdE3bXdVXU6mEidCH2v2x5ujGIbcwr8kDehVa
         h5120LV6PUTMDHPYW3c02BEk+wmALo1ledXeE4mPc9FsyvKpaRUjsPDeSQ1bF61QWbjg
         7ADLfdff8e17DvwRpNjRDPshc0sJdEKv5q74RhIYP4ZKTh//VOzgblFHxacbhGUf33g+
         XAXA==
X-Forwarded-Encrypted: i=1; AJvYcCX6oWv25FnYD4EsJAFABavEKa7vl9z+Cidc5JZvxJte+qmzFk9468XnbBRsFv9CvFvtz5MI8pkEHNlaHA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywx6YEbtz70yo4xNGJV1Q6nvCCeGiFnfUi2Li0DcB4yzeMsc0nO
	beqA4KURqxEpsLRR6bOe13KPpFoUUS5rz0WsPex8XtISvtgnJGhNhvNr3ALOuNsji5+1rIsv38O
	6V5B5h0SnydwugU5bIG752T26UqWmlO/FrmvWkw==
X-Gm-Gg: ASbGnctlLi06AQm1A5h2p2aQSYlLxjTjog85e2dMBo5sY76eF9u24ZGS/RkzPAt02u6
	0qN0l6SkskeUFLQKsKFbO9u+eUb7h9RGOohROFnTQqNzm/2OxHcrb1Ia0WPR3wqLwfifPlcuBY3
	jzaRlrVwxU7MlSqVyaXBB/moN5N1U=
X-Google-Smtp-Source: AGHT+IE1lc0Le+Xn4IPuxfRnWH1Z92SoqlO8A5APVOUx7ahbqOTcRxJtSaNA/0G1hYCe0KPtkwaeflutY9Bv2ysJ0iU=
X-Received: by 2002:a05:6871:c714:b0:2b8:84d7:ddd5 with SMTP id
 586e51a60fabf-2c78054a998mr9647125fac.39.1742892647207; Tue, 25 Mar 2025
 01:50:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250305130634.1850178-1-jens.wiklander@linaro.org>
 <20250305130634.1850178-4-jens.wiklander@linaro.org> <Z9K2RQYuXSJc8Y1E@sumit-X1>
 <CAHUa44H5Zc_POJ_RWaVd4iFVagRkFaN+8Ajs=19FKboZapbQHw@mail.gmail.com>
 <Z9vfD4UWSrqSTPnP@sumit-X1> <CAHUa44HY-jZCoDXKnx-f4gBoABRVdh1+6PA1AYHSva9aL=rDAA@mail.gmail.com>
 <Z-JFagmbZBQd0hoM@sumit-X1>
In-Reply-To: <Z-JFagmbZBQd0hoM@sumit-X1>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Tue, 25 Mar 2025 09:50:35 +0100
X-Gm-Features: AQ5f1JqCL9i7_V-pA06IP3-j62y0ZfeHI3kPwPORgKYNirOFYekFlp01JSrl9PM
Message-ID: <CAHUa44HXHwR1_LbjG6T5OqnafXiS4-kHeKjV9TurGORx3SsprQ@mail.gmail.com>
Subject: Re: [PATCH v6 03/10] optee: account for direction while converting parameters
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
	Simona Vetter <simona.vetter@ffwll.ch>, Daniel Stone <daniel@fooishbar.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 25, 2025 at 6:56=E2=80=AFAM Sumit Garg <sumit.garg@kernel.org> =
wrote:
>
> On Thu, Mar 20, 2025 at 02:00:57PM +0100, Jens Wiklander wrote:
> > Hi Sumit,
> >
> > On Thu, Mar 20, 2025 at 10:25=E2=80=AFAM Sumit Garg <sumit.garg@kernel.=
org> wrote:
> > >
> > > Hi Jens,
> > >
> > > On Mon, Mar 17, 2025 at 08:42:01AM +0100, Jens Wiklander wrote:
> > > > Hi Sumit,
> > > >
> > > > On Thu, Mar 13, 2025 at 11:41=E2=80=AFAM Sumit Garg <sumit.garg@ker=
nel.org> wrote:
> > > > >
> > > > > Hi Jens,
> > > > >
> > > > > On Wed, Mar 05, 2025 at 02:04:09PM +0100, Jens Wiklander wrote:
> > > > > > The OP-TEE backend driver has two internal function pointers to=
 convert
> > > > > > between the subsystem type struct tee_param and the OP-TEE type=
 struct
> > > > > > optee_msg_param.
> > > > > >
> > > > > > The conversion is done from one of the types to the other, whic=
h is then
> > > > > > involved in some operation and finally converted back to the or=
iginal
> > > > > > type. When converting to prepare the parameters for the operati=
on, all
> > > > > > fields must be taken into account, but then converting back, it=
's enough
> > > > > > to update only out-values and out-sizes. So, an update_out para=
meter is
> > > > > > added to the conversion functions to tell if all or only some f=
ields
> > > > > > must be copied.
> > > > > >
> > > > > > This is needed in a later patch where it might get confusing wh=
en
> > > > > > converting back in from_msg_param() callback since an allocated
> > > > > > restricted SHM can be using the sec_world_id of the used restri=
cted
> > > > > > memory pool and that doesn't translate back well.
> > > > > >
> > > > > > Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> > > > > > ---
> > > > > >  drivers/tee/optee/call.c          | 10 ++--
> > > > > >  drivers/tee/optee/ffa_abi.c       | 43 +++++++++++++----
> > > > > >  drivers/tee/optee/optee_private.h | 42 +++++++++++------
> > > > > >  drivers/tee/optee/rpc.c           | 31 +++++++++----
> > > > > >  drivers/tee/optee/smc_abi.c       | 76 +++++++++++++++++++++++=
--------
> > > > > >  5 files changed, 144 insertions(+), 58 deletions(-)
> > > > > >
> > > > > > diff --git a/drivers/tee/optee/call.c b/drivers/tee/optee/call.=
c
> > > > > > index 16eb953e14bb..f1533b894726 100644
> > > > > > --- a/drivers/tee/optee/call.c
> > > > > > +++ b/drivers/tee/optee/call.c
> > > > > > @@ -400,7 +400,8 @@ int optee_open_session(struct tee_context *=
ctx,
> > > > > >       export_uuid(msg_arg->params[1].u.octets, &client_uuid);
> > > > > >
> > > > > >       rc =3D optee->ops->to_msg_param(optee, msg_arg->params + =
2,
> > > > > > -                                   arg->num_params, param);
> > > > > > +                                   arg->num_params, param,
> > > > > > +                                   false /*!update_out*/);
> > > > > >       if (rc)
> > > > > >               goto out;
> > > > > >
> > > > > > @@ -427,7 +428,8 @@ int optee_open_session(struct tee_context *=
ctx,
> > > > > >       }
> > > > > >
> > > > > >       if (optee->ops->from_msg_param(optee, param, arg->num_par=
ams,
> > > > > > -                                    msg_arg->params + 2)) {
> > > > > > +                                    msg_arg->params + 2,
> > > > > > +                                    true /*update_out*/)) {
> > > > > >               arg->ret =3D TEEC_ERROR_COMMUNICATION;
> > > > > >               arg->ret_origin =3D TEEC_ORIGIN_COMMS;
> > > > > >               /* Close session again to avoid leakage */
> > > > > > @@ -541,7 +543,7 @@ int optee_invoke_func(struct tee_context *c=
tx, struct tee_ioctl_invoke_arg *arg,
> > > > > >       msg_arg->cancel_id =3D arg->cancel_id;
> > > > > >
> > > > > >       rc =3D optee->ops->to_msg_param(optee, msg_arg->params, a=
rg->num_params,
> > > > > > -                                   param);
> > > > > > +                                   param, false /*!update_out*=
/);
> > > > > >       if (rc)
> > > > > >               goto out;
> > > > > >
> > > > > > @@ -551,7 +553,7 @@ int optee_invoke_func(struct tee_context *c=
tx, struct tee_ioctl_invoke_arg *arg,
> > > > > >       }
> > > > > >
> > > > > >       if (optee->ops->from_msg_param(optee, param, arg->num_par=
ams,
> > > > > > -                                    msg_arg->params)) {
> > > > > > +                                    msg_arg->params, true /*up=
date_out*/)) {
> > > > > >               msg_arg->ret =3D TEEC_ERROR_COMMUNICATION;
> > > > > >               msg_arg->ret_origin =3D TEEC_ORIGIN_COMMS;
> > > > > >       }
> > > > > > diff --git a/drivers/tee/optee/ffa_abi.c b/drivers/tee/optee/ff=
a_abi.c
> > > > > > index 4ca1d5161b82..e4b08cd195f3 100644
> > > > > > --- a/drivers/tee/optee/ffa_abi.c
> > > > > > +++ b/drivers/tee/optee/ffa_abi.c
> > > > > > @@ -122,15 +122,21 @@ static int optee_shm_rem_ffa_handle(struc=
t optee *optee, u64 global_id)
> > > > > >   */
> > > > > >
> > > > > >  static void from_msg_param_ffa_mem(struct optee *optee, struct=
 tee_param *p,
> > > > > > -                                u32 attr, const struct optee_m=
sg_param *mp)
> > > > > > +                                u32 attr, const struct optee_m=
sg_param *mp,
> > > > > > +                                bool update_out)
> > > > > >  {
> > > > > >       struct tee_shm *shm =3D NULL;
> > > > > >       u64 offs_high =3D 0;
> > > > > >       u64 offs_low =3D 0;
> > > > > >
> > > > > > +     if (update_out) {
> > > > > > +             if (attr =3D=3D OPTEE_MSG_ATTR_TYPE_FMEM_INPUT)
> > > > > > +                     return;
> > > > > > +             goto out;
> > > > > > +     }
> > > > > > +
> > > > > >       p->attr =3D TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT +
> > > > > >                 attr - OPTEE_MSG_ATTR_TYPE_FMEM_INPUT;
> > > > > > -     p->u.memref.size =3D mp->u.fmem.size;
> > > > > >
> > > > > >       if (mp->u.fmem.global_id !=3D OPTEE_MSG_FMEM_INVALID_GLOB=
AL_ID)
> > > > > >               shm =3D optee_shm_from_ffa_handle(optee, mp->u.fm=
em.global_id);
> > > > > > @@ -141,6 +147,8 @@ static void from_msg_param_ffa_mem(struct o=
ptee *optee, struct tee_param *p,
> > > > > >               offs_high =3D mp->u.fmem.offs_high;
> > > > > >       }
> > > > > >       p->u.memref.shm_offs =3D offs_low | offs_high << 32;
> > > > > > +out:
> > > > > > +     p->u.memref.size =3D mp->u.fmem.size;
> > > > > >  }
> > > > > >
> > > > > >  /**
> > > > > > @@ -150,12 +158,14 @@ static void from_msg_param_ffa_mem(struct=
 optee *optee, struct tee_param *p,
> > > > > >   * @params:  subsystem internal parameter representation
> > > > > >   * @num_params:      number of elements in the parameter array=
s
> > > > > >   * @msg_params:      OPTEE_MSG parameters
> > > > > > + * @update_out: update parameter for output only
> > > > > >   *
> > > > > >   * Returns 0 on success or <0 on failure
> > > > > >   */
> > > > > >  static int optee_ffa_from_msg_param(struct optee *optee,
> > > > > >                                   struct tee_param *params, siz=
e_t num_params,
> > > > > > -                                 const struct optee_msg_param =
*msg_params)
> > > > > > +                                 const struct optee_msg_param =
*msg_params,
> > > > > > +                                 bool update_out)
> > > > > >  {
> > > > > >       size_t n;
> > > > > >
> > > > > > @@ -166,18 +176,20 @@ static int optee_ffa_from_msg_param(struc=
t optee *optee,
> > > > > >
> > > > > >               switch (attr) {
> > > > > >               case OPTEE_MSG_ATTR_TYPE_NONE:
> > > > > > +                     if (update_out)
> > > > > > +                             break;
> > > > > >                       p->attr =3D TEE_IOCTL_PARAM_ATTR_TYPE_NON=
E;
> > > > > >                       memset(&p->u, 0, sizeof(p->u));
> > > > > >                       break;
> > > > > >               case OPTEE_MSG_ATTR_TYPE_VALUE_INPUT:
> > > > > >               case OPTEE_MSG_ATTR_TYPE_VALUE_OUTPUT:
> > > > > >               case OPTEE_MSG_ATTR_TYPE_VALUE_INOUT:
> > > > > > -                     optee_from_msg_param_value(p, attr, mp);
> > > > > > +                     optee_from_msg_param_value(p, attr, mp, u=
pdate_out);
> > > > > >                       break;
> > > > > >               case OPTEE_MSG_ATTR_TYPE_FMEM_INPUT:
> > > > > >               case OPTEE_MSG_ATTR_TYPE_FMEM_OUTPUT:
> > > > > >               case OPTEE_MSG_ATTR_TYPE_FMEM_INOUT:
> > > > > > -                     from_msg_param_ffa_mem(optee, p, attr, mp=
);
> > > > > > +                     from_msg_param_ffa_mem(optee, p, attr, mp=
, update_out);
> > > > > >                       break;
> > > > > >               default:
> > > > > >                       return -EINVAL;
> > > > > > @@ -188,10 +200,16 @@ static int optee_ffa_from_msg_param(struc=
t optee *optee,
> > > > > >  }
> > > > > >
> > > > > >  static int to_msg_param_ffa_mem(struct optee_msg_param *mp,
> > > > > > -                             const struct tee_param *p)
> > > > > > +                             const struct tee_param *p, bool u=
pdate_out)
> > > > > >  {
> > > > > >       struct tee_shm *shm =3D p->u.memref.shm;
> > > > > >
> > > > > > +     if (update_out) {
> > > > > > +             if (p->attr =3D=3D TEE_IOCTL_PARAM_ATTR_TYPE_MEMR=
EF_INPUT)
> > > > > > +                     return 0;
> > > > > > +             goto out;
> > > > > > +     }
> > > > > > +
> > > > > >       mp->attr =3D OPTEE_MSG_ATTR_TYPE_FMEM_INPUT + p->attr -
> > > > > >                  TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT;
> > > > > >
> > > > > > @@ -211,6 +229,7 @@ static int to_msg_param_ffa_mem(struct opte=
e_msg_param *mp,
> > > > > >               memset(&mp->u, 0, sizeof(mp->u));
> > > > > >               mp->u.fmem.global_id =3D OPTEE_MSG_FMEM_INVALID_G=
LOBAL_ID;
> > > > > >       }
> > > > > > +out:
> > > > > >       mp->u.fmem.size =3D p->u.memref.size;
> > > > > >
> > > > > >       return 0;
> > > > > > @@ -222,13 +241,15 @@ static int to_msg_param_ffa_mem(struct op=
tee_msg_param *mp,
> > > > > >   * @optee:   main service struct
> > > > > >   * @msg_params:      OPTEE_MSG parameters
> > > > > >   * @num_params:      number of elements in the parameter array=
s
> > > > > > - * @params:  subsystem itnernal parameter representation
> > > > > > + * @params:  subsystem internal parameter representation
> > > > > > + * @update_out: update parameter for output only
> > > > > >   * Returns 0 on success or <0 on failure
> > > > > >   */
> > > > > >  static int optee_ffa_to_msg_param(struct optee *optee,
> > > > > >                                 struct optee_msg_param *msg_par=
ams,
> > > > > >                                 size_t num_params,
> > > > > > -                               const struct tee_param *params)
> > > > > > +                               const struct tee_param *params,
> > > > > > +                               bool update_out)
> > > > > >  {
> > > > > >       size_t n;
> > > > > >
> > > > > > @@ -238,18 +259,20 @@ static int optee_ffa_to_msg_param(struct =
optee *optee,
> > > > > >
> > > > > >               switch (p->attr) {
> > > > > >               case TEE_IOCTL_PARAM_ATTR_TYPE_NONE:
> > > > > > +                     if (update_out)
> > > > > > +                             break;
> > > > > >                       mp->attr =3D TEE_IOCTL_PARAM_ATTR_TYPE_NO=
NE;
> > > > > >                       memset(&mp->u, 0, sizeof(mp->u));
> > > > > >                       break;
> > > > > >               case TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT:
> > > > > >               case TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_OUTPUT:
> > > > > >               case TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INOUT:
> > > > > > -                     optee_to_msg_param_value(mp, p);
> > > > > > +                     optee_to_msg_param_value(mp, p, update_ou=
t);
> > > > > >                       break;
> > > > > >               case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT:
> > > > > >               case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT:
> > > > > >               case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT:
> > > > > > -                     if (to_msg_param_ffa_mem(mp, p))
> > > > > > +                     if (to_msg_param_ffa_mem(mp, p, update_ou=
t))
> > > > > >                               return -EINVAL;
> > > > > >                       break;
> > > > > >               default:
> > > > >
> > > > > Can we rather handle it as follows to improve code readability an=
d
> > > > > maintainence long term? Ditto for all other places.
> > > > >
> > > > > static int optee_ffa_to_msg_param(struct optee *optee,
> > > > >                                   struct optee_msg_param *msg_par=
ams,
> > > > >                                   size_t num_params,
> > > > >                                   const struct tee_param *params,
> > > > >                                   bool update_out)
> > > > > {
> > > > >         size_t n;
> > > > >
> > > > >         for (n =3D 0; n < num_params; n++) {
> > > > >                 const struct tee_param *p =3D params + n;
> > > > >                 struct optee_msg_param *mp =3D msg_params + n;
> > > > >
> > > > >                 if (update_out && (p->attr =3D=3D TEE_IOCTL_PARAM=
_ATTR_TYPE_NONE ||
> > > > >                      p->attr =3D=3D TEE_IOCTL_PARAM_ATTR_TYPE_VAL=
UE_INPUT ||
> > > > >                      p->attr =3D=3D TEE_IOCTL_PARAM_ATTR_TYPE_MEM=
REF_INPUT))
> > > > >                     continue;
> > > >
> > > > You're missing updating the length field for memrefs.
> > > >
> > >
> > > Do we need to update length field for input memrefs when update_out i=
s
> > > set? I don't see that happening in your existing patch too.
> >
> > I'm sorry, I was unclear. The update_out parameter means only the
> > output fields should be updated, not the attribute, offsets, ids, etc.
> > That is, the length field for memrefs, and the value fields a, b, c
> > for value params. Some of the memrefs aren't translated one-to-one
> > with SDP, but the length field can and must be updated.
>
> Isn't it rather better to add another attribute type to handled SDP
> special handling?

This isn't special handling, all parameters get the same treatment.
When updating a parameter after it has been used, this is all that
needs to be done, regardless of whether it's an SDP buffer. The
updates we did before this patch were redundant.

This patch was introduced in the v3 of this patch set, but I don't
think it's strictly needed any longer since SDP buffers are allocated
differently now. I think it's nice to only update what's needed when
translating back a parameter (just as in params_to_user() in
drivers/tee/tee_core.c), but if you don't like it, we can drop this
patch.

Cheers,
Jens

>
> -Sumit
>
> >
> > Cheers,
> > Jens
> >
> > >
> > > -Sumit
> > >
> > > > Cheers,
> > > > Jens
> > > >
> > > > >
> > > > >                 switch (p->attr) {
> > > > >                 case TEE_IOCTL_PARAM_ATTR_TYPE_NONE:
> > > > >                         mp->attr =3D TEE_IOCTL_PARAM_ATTR_TYPE_NO=
NE;
> > > > >                         memset(&mp->u, 0, sizeof(mp->u));
> > > > >                         break;
> > > > >                 case TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT:
> > > > >                 case TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_OUTPUT:
> > > > >                 case TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INOUT:
> > > > >                         optee_to_msg_param_value(mp, p);
> > > > >                         break;
> > > > >                 case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT:
> > > > >                 case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT:
> > > > >                 case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT:
> > > > >                         if (to_msg_param_ffa_mem(mp, p))
> > > > >                                 return -EINVAL;
> > > > >                         break;
> > > > >                 default:
> > > > >                         return -EINVAL;
> > > > >                 }
> > > > >         }
> > > > >
> > > > >         return 0;
> > > > > }
> > > > >
> > > > > -Sumit

