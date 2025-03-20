Return-Path: <linux-media+bounces-28532-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 84D47A6A6A1
	for <lists+linux-media@lfdr.de>; Thu, 20 Mar 2025 14:01:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2BB853B7F80
	for <lists+linux-media@lfdr.de>; Thu, 20 Mar 2025 13:01:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA76C1DF27C;
	Thu, 20 Mar 2025 13:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GOMtSaDR"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 648F9179BC
	for <linux-media@vger.kernel.org>; Thu, 20 Mar 2025 13:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742475673; cv=none; b=TL/U6p4R1HDcYG3q0ejt9RMtXckNqxTBH2vuYyFG9tbNP9hzbc3Es8Ds6LCg8nNDjV36oDqqF3GN2Pl1ACNnTETIf/hSBVGad0Irmmz6NFED7R6smSnu9BpcD8xJUfIUEEdmBzuQChfDpGmjfIaN7g/IX7ndGYXU8Vzskh1KhZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742475673; c=relaxed/simple;
	bh=c9gJuYkEB6S4q6yZj/iXbiiROOeGgszdUG9DzSJp/bE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DBA2JRcLASNxR/H/IhCT/KTlQamYRKGwJeRMT5osPVY7iGp5Pz9OIHt83t8HPuXZYhX/V2TiDaSCZuPKu37QMECOtTdVDx6a6rCk4hvYNVLcNuMd69FbHZpMZ+S8GNO34dvqxqA71gGKBsHgEMruAESwtAU74bqQHToZ3uq8Afc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GOMtSaDR; arc=none smtp.client-ip=209.85.161.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-5fc6cd89f85so364015eaf.1
        for <linux-media@vger.kernel.org>; Thu, 20 Mar 2025 06:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742475669; x=1743080469; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6+yMktsFjcXwHGeZP7s6JArkbmDxE6SXJWbsTPxURm4=;
        b=GOMtSaDRLJJWZ7SVHF08vU9tgkqIUULT98kgTZPA7czxl8/efu0k6qODAeSEGPcCqc
         OEwwbamDWUjaIR2gorbpOvn94p7Lj+cevya6z98IRzI0z5kZOq8oI+Imoj4XhYHsLx0d
         IKyTuTZjx6yeyBkE8RMwmFEu3Gq+0drXsIXWgLbyuKaBJ0C2fqwga+rL5FqWOBoH0uO3
         3PVljo1hm2Gl+xScThdE/TMaAWm/Nwalkv6Ie8cxlU6KgRlajWgaoZ+9enq0KHxq4bnB
         963jgK8ZezuWE54PSTpB9dnATS0GfhZekVPYdYpybpPKe3udA1nCHyaJSvtIqo+WK1BN
         LR1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742475669; x=1743080469;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6+yMktsFjcXwHGeZP7s6JArkbmDxE6SXJWbsTPxURm4=;
        b=oW9kx2DEd10Yv+tTyR/x+JSqWSyFEw6j56BrVygXCDgASAX2bBRFCFCwNf9WLHxnZ/
         OaEb/6ZQh7C3cOPCsLTWpkfYgJK0YvYHkGsqgv65fm4k3Za+/7ONoBhmo1nxavLL1udw
         SaehgDXVHLgRApDH2HYrl4gFDz/cY69NqEvIBBEbqhoGYAWb5wSSfG1rWbo5O3Nht/HV
         uLENxFUCot4tBEudQ28A/ehBiD0rT+qLx4/011TFFAH3T2YQ5q2Z+tIK07pvrEJnOiTD
         B6YJ65/PBoZY3J5tujg/XRyUH0hDrAVs8gOi88Yqgi+Jc9rD5KQPX0e485g464AE+AfF
         t3cQ==
X-Forwarded-Encrypted: i=1; AJvYcCUEnb9aAEhnx9s9M19Symz9fLBr64qtKSbEiGViBjcJyfA1Pw8jFV+4cuI4nN62z+uSj8w+hH3fXDZ/FA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyIJA+BMNdTWaNQWneClrqfBf7uzayJWqiQiHjxF2809OgAw5dr
	on0/UNbJpA0aqRJTptrgDKPSxgHVhffvSwb42nGzmhK+a4Z5bDFUhMd1379A/qiSFg2qqtEHRtr
	mFDH6Rh2epau2LUntQpwrcJSTNMXIxEE8tAjkaA==
X-Gm-Gg: ASbGncv3InqOZxekp1PdSNNCzu+NAy7BhigP/qXgBenR4wv08s577w+9rBjXj8BZQbN
	jXTfMN5luC9KpCWa3LWLcJt6z8DJr7e0GjFM3bt+QgtT+oxYsTajtjdF2+fWnmLfeSB5d7hiAFE
	9+kou8zlGW+4WAkMYv93nFNMO8Ok8A7Iyn5J6DFw==
X-Google-Smtp-Source: AGHT+IER3lKHIcEcdiIVPrJ7eloen80fgOB7PhdbTn8nzLcptKR7mRUWWhDSjhkLCICrC6XXoZNVwNg8WYZmtACVo/Q=
X-Received: by 2002:a05:6870:ab83:b0:2b7:fd8f:7ade with SMTP id
 586e51a60fabf-2c76334484amr2016430fac.33.1742475669160; Thu, 20 Mar 2025
 06:01:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250305130634.1850178-1-jens.wiklander@linaro.org>
 <20250305130634.1850178-4-jens.wiklander@linaro.org> <Z9K2RQYuXSJc8Y1E@sumit-X1>
 <CAHUa44H5Zc_POJ_RWaVd4iFVagRkFaN+8Ajs=19FKboZapbQHw@mail.gmail.com> <Z9vfD4UWSrqSTPnP@sumit-X1>
In-Reply-To: <Z9vfD4UWSrqSTPnP@sumit-X1>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Thu, 20 Mar 2025 14:00:57 +0100
X-Gm-Features: AQ5f1JqCC2vKgZCS03acwOcn_LV15c6BJFqVOmzZ6QYuBDoLBS5gBdANwGZwQY0
Message-ID: <CAHUa44HY-jZCoDXKnx-f4gBoABRVdh1+6PA1AYHSva9aL=rDAA@mail.gmail.com>
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

Hi Sumit,

On Thu, Mar 20, 2025 at 10:25=E2=80=AFAM Sumit Garg <sumit.garg@kernel.org>=
 wrote:
>
> Hi Jens,
>
> On Mon, Mar 17, 2025 at 08:42:01AM +0100, Jens Wiklander wrote:
> > Hi Sumit,
> >
> > On Thu, Mar 13, 2025 at 11:41=E2=80=AFAM Sumit Garg <sumit.garg@kernel.=
org> wrote:
> > >
> > > Hi Jens,
> > >
> > > On Wed, Mar 05, 2025 at 02:04:09PM +0100, Jens Wiklander wrote:
> > > > The OP-TEE backend driver has two internal function pointers to con=
vert
> > > > between the subsystem type struct tee_param and the OP-TEE type str=
uct
> > > > optee_msg_param.
> > > >
> > > > The conversion is done from one of the types to the other, which is=
 then
> > > > involved in some operation and finally converted back to the origin=
al
> > > > type. When converting to prepare the parameters for the operation, =
all
> > > > fields must be taken into account, but then converting back, it's e=
nough
> > > > to update only out-values and out-sizes. So, an update_out paramete=
r is
> > > > added to the conversion functions to tell if all or only some field=
s
> > > > must be copied.
> > > >
> > > > This is needed in a later patch where it might get confusing when
> > > > converting back in from_msg_param() callback since an allocated
> > > > restricted SHM can be using the sec_world_id of the used restricted
> > > > memory pool and that doesn't translate back well.
> > > >
> > > > Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> > > > ---
> > > >  drivers/tee/optee/call.c          | 10 ++--
> > > >  drivers/tee/optee/ffa_abi.c       | 43 +++++++++++++----
> > > >  drivers/tee/optee/optee_private.h | 42 +++++++++++------
> > > >  drivers/tee/optee/rpc.c           | 31 +++++++++----
> > > >  drivers/tee/optee/smc_abi.c       | 76 +++++++++++++++++++++++----=
----
> > > >  5 files changed, 144 insertions(+), 58 deletions(-)
> > > >
> > > > diff --git a/drivers/tee/optee/call.c b/drivers/tee/optee/call.c
> > > > index 16eb953e14bb..f1533b894726 100644
> > > > --- a/drivers/tee/optee/call.c
> > > > +++ b/drivers/tee/optee/call.c
> > > > @@ -400,7 +400,8 @@ int optee_open_session(struct tee_context *ctx,
> > > >       export_uuid(msg_arg->params[1].u.octets, &client_uuid);
> > > >
> > > >       rc =3D optee->ops->to_msg_param(optee, msg_arg->params + 2,
> > > > -                                   arg->num_params, param);
> > > > +                                   arg->num_params, param,
> > > > +                                   false /*!update_out*/);
> > > >       if (rc)
> > > >               goto out;
> > > >
> > > > @@ -427,7 +428,8 @@ int optee_open_session(struct tee_context *ctx,
> > > >       }
> > > >
> > > >       if (optee->ops->from_msg_param(optee, param, arg->num_params,
> > > > -                                    msg_arg->params + 2)) {
> > > > +                                    msg_arg->params + 2,
> > > > +                                    true /*update_out*/)) {
> > > >               arg->ret =3D TEEC_ERROR_COMMUNICATION;
> > > >               arg->ret_origin =3D TEEC_ORIGIN_COMMS;
> > > >               /* Close session again to avoid leakage */
> > > > @@ -541,7 +543,7 @@ int optee_invoke_func(struct tee_context *ctx, =
struct tee_ioctl_invoke_arg *arg,
> > > >       msg_arg->cancel_id =3D arg->cancel_id;
> > > >
> > > >       rc =3D optee->ops->to_msg_param(optee, msg_arg->params, arg->=
num_params,
> > > > -                                   param);
> > > > +                                   param, false /*!update_out*/);
> > > >       if (rc)
> > > >               goto out;
> > > >
> > > > @@ -551,7 +553,7 @@ int optee_invoke_func(struct tee_context *ctx, =
struct tee_ioctl_invoke_arg *arg,
> > > >       }
> > > >
> > > >       if (optee->ops->from_msg_param(optee, param, arg->num_params,
> > > > -                                    msg_arg->params)) {
> > > > +                                    msg_arg->params, true /*update=
_out*/)) {
> > > >               msg_arg->ret =3D TEEC_ERROR_COMMUNICATION;
> > > >               msg_arg->ret_origin =3D TEEC_ORIGIN_COMMS;
> > > >       }
> > > > diff --git a/drivers/tee/optee/ffa_abi.c b/drivers/tee/optee/ffa_ab=
i.c
> > > > index 4ca1d5161b82..e4b08cd195f3 100644
> > > > --- a/drivers/tee/optee/ffa_abi.c
> > > > +++ b/drivers/tee/optee/ffa_abi.c
> > > > @@ -122,15 +122,21 @@ static int optee_shm_rem_ffa_handle(struct op=
tee *optee, u64 global_id)
> > > >   */
> > > >
> > > >  static void from_msg_param_ffa_mem(struct optee *optee, struct tee=
_param *p,
> > > > -                                u32 attr, const struct optee_msg_p=
aram *mp)
> > > > +                                u32 attr, const struct optee_msg_p=
aram *mp,
> > > > +                                bool update_out)
> > > >  {
> > > >       struct tee_shm *shm =3D NULL;
> > > >       u64 offs_high =3D 0;
> > > >       u64 offs_low =3D 0;
> > > >
> > > > +     if (update_out) {
> > > > +             if (attr =3D=3D OPTEE_MSG_ATTR_TYPE_FMEM_INPUT)
> > > > +                     return;
> > > > +             goto out;
> > > > +     }
> > > > +
> > > >       p->attr =3D TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT +
> > > >                 attr - OPTEE_MSG_ATTR_TYPE_FMEM_INPUT;
> > > > -     p->u.memref.size =3D mp->u.fmem.size;
> > > >
> > > >       if (mp->u.fmem.global_id !=3D OPTEE_MSG_FMEM_INVALID_GLOBAL_I=
D)
> > > >               shm =3D optee_shm_from_ffa_handle(optee, mp->u.fmem.g=
lobal_id);
> > > > @@ -141,6 +147,8 @@ static void from_msg_param_ffa_mem(struct optee=
 *optee, struct tee_param *p,
> > > >               offs_high =3D mp->u.fmem.offs_high;
> > > >       }
> > > >       p->u.memref.shm_offs =3D offs_low | offs_high << 32;
> > > > +out:
> > > > +     p->u.memref.size =3D mp->u.fmem.size;
> > > >  }
> > > >
> > > >  /**
> > > > @@ -150,12 +158,14 @@ static void from_msg_param_ffa_mem(struct opt=
ee *optee, struct tee_param *p,
> > > >   * @params:  subsystem internal parameter representation
> > > >   * @num_params:      number of elements in the parameter arrays
> > > >   * @msg_params:      OPTEE_MSG parameters
> > > > + * @update_out: update parameter for output only
> > > >   *
> > > >   * Returns 0 on success or <0 on failure
> > > >   */
> > > >  static int optee_ffa_from_msg_param(struct optee *optee,
> > > >                                   struct tee_param *params, size_t =
num_params,
> > > > -                                 const struct optee_msg_param *msg=
_params)
> > > > +                                 const struct optee_msg_param *msg=
_params,
> > > > +                                 bool update_out)
> > > >  {
> > > >       size_t n;
> > > >
> > > > @@ -166,18 +176,20 @@ static int optee_ffa_from_msg_param(struct op=
tee *optee,
> > > >
> > > >               switch (attr) {
> > > >               case OPTEE_MSG_ATTR_TYPE_NONE:
> > > > +                     if (update_out)
> > > > +                             break;
> > > >                       p->attr =3D TEE_IOCTL_PARAM_ATTR_TYPE_NONE;
> > > >                       memset(&p->u, 0, sizeof(p->u));
> > > >                       break;
> > > >               case OPTEE_MSG_ATTR_TYPE_VALUE_INPUT:
> > > >               case OPTEE_MSG_ATTR_TYPE_VALUE_OUTPUT:
> > > >               case OPTEE_MSG_ATTR_TYPE_VALUE_INOUT:
> > > > -                     optee_from_msg_param_value(p, attr, mp);
> > > > +                     optee_from_msg_param_value(p, attr, mp, updat=
e_out);
> > > >                       break;
> > > >               case OPTEE_MSG_ATTR_TYPE_FMEM_INPUT:
> > > >               case OPTEE_MSG_ATTR_TYPE_FMEM_OUTPUT:
> > > >               case OPTEE_MSG_ATTR_TYPE_FMEM_INOUT:
> > > > -                     from_msg_param_ffa_mem(optee, p, attr, mp);
> > > > +                     from_msg_param_ffa_mem(optee, p, attr, mp, up=
date_out);
> > > >                       break;
> > > >               default:
> > > >                       return -EINVAL;
> > > > @@ -188,10 +200,16 @@ static int optee_ffa_from_msg_param(struct op=
tee *optee,
> > > >  }
> > > >
> > > >  static int to_msg_param_ffa_mem(struct optee_msg_param *mp,
> > > > -                             const struct tee_param *p)
> > > > +                             const struct tee_param *p, bool updat=
e_out)
> > > >  {
> > > >       struct tee_shm *shm =3D p->u.memref.shm;
> > > >
> > > > +     if (update_out) {
> > > > +             if (p->attr =3D=3D TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_I=
NPUT)
> > > > +                     return 0;
> > > > +             goto out;
> > > > +     }
> > > > +
> > > >       mp->attr =3D OPTEE_MSG_ATTR_TYPE_FMEM_INPUT + p->attr -
> > > >                  TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT;
> > > >
> > > > @@ -211,6 +229,7 @@ static int to_msg_param_ffa_mem(struct optee_ms=
g_param *mp,
> > > >               memset(&mp->u, 0, sizeof(mp->u));
> > > >               mp->u.fmem.global_id =3D OPTEE_MSG_FMEM_INVALID_GLOBA=
L_ID;
> > > >       }
> > > > +out:
> > > >       mp->u.fmem.size =3D p->u.memref.size;
> > > >
> > > >       return 0;
> > > > @@ -222,13 +241,15 @@ static int to_msg_param_ffa_mem(struct optee_=
msg_param *mp,
> > > >   * @optee:   main service struct
> > > >   * @msg_params:      OPTEE_MSG parameters
> > > >   * @num_params:      number of elements in the parameter arrays
> > > > - * @params:  subsystem itnernal parameter representation
> > > > + * @params:  subsystem internal parameter representation
> > > > + * @update_out: update parameter for output only
> > > >   * Returns 0 on success or <0 on failure
> > > >   */
> > > >  static int optee_ffa_to_msg_param(struct optee *optee,
> > > >                                 struct optee_msg_param *msg_params,
> > > >                                 size_t num_params,
> > > > -                               const struct tee_param *params)
> > > > +                               const struct tee_param *params,
> > > > +                               bool update_out)
> > > >  {
> > > >       size_t n;
> > > >
> > > > @@ -238,18 +259,20 @@ static int optee_ffa_to_msg_param(struct opte=
e *optee,
> > > >
> > > >               switch (p->attr) {
> > > >               case TEE_IOCTL_PARAM_ATTR_TYPE_NONE:
> > > > +                     if (update_out)
> > > > +                             break;
> > > >                       mp->attr =3D TEE_IOCTL_PARAM_ATTR_TYPE_NONE;
> > > >                       memset(&mp->u, 0, sizeof(mp->u));
> > > >                       break;
> > > >               case TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT:
> > > >               case TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_OUTPUT:
> > > >               case TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INOUT:
> > > > -                     optee_to_msg_param_value(mp, p);
> > > > +                     optee_to_msg_param_value(mp, p, update_out);
> > > >                       break;
> > > >               case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT:
> > > >               case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT:
> > > >               case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT:
> > > > -                     if (to_msg_param_ffa_mem(mp, p))
> > > > +                     if (to_msg_param_ffa_mem(mp, p, update_out))
> > > >                               return -EINVAL;
> > > >                       break;
> > > >               default:
> > >
> > > Can we rather handle it as follows to improve code readability and
> > > maintainence long term? Ditto for all other places.
> > >
> > > static int optee_ffa_to_msg_param(struct optee *optee,
> > >                                   struct optee_msg_param *msg_params,
> > >                                   size_t num_params,
> > >                                   const struct tee_param *params,
> > >                                   bool update_out)
> > > {
> > >         size_t n;
> > >
> > >         for (n =3D 0; n < num_params; n++) {
> > >                 const struct tee_param *p =3D params + n;
> > >                 struct optee_msg_param *mp =3D msg_params + n;
> > >
> > >                 if (update_out && (p->attr =3D=3D TEE_IOCTL_PARAM_ATT=
R_TYPE_NONE ||
> > >                      p->attr =3D=3D TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_I=
NPUT ||
> > >                      p->attr =3D=3D TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_=
INPUT))
> > >                     continue;
> >
> > You're missing updating the length field for memrefs.
> >
>
> Do we need to update length field for input memrefs when update_out is
> set? I don't see that happening in your existing patch too.

I'm sorry, I was unclear. The update_out parameter means only the
output fields should be updated, not the attribute, offsets, ids, etc.
That is, the length field for memrefs, and the value fields a, b, c
for value params. Some of the memrefs aren't translated one-to-one
with SDP, but the length field can and must be updated.

Cheers,
Jens

>
> -Sumit
>
> > Cheers,
> > Jens
> >
> > >
> > >                 switch (p->attr) {
> > >                 case TEE_IOCTL_PARAM_ATTR_TYPE_NONE:
> > >                         mp->attr =3D TEE_IOCTL_PARAM_ATTR_TYPE_NONE;
> > >                         memset(&mp->u, 0, sizeof(mp->u));
> > >                         break;
> > >                 case TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT:
> > >                 case TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_OUTPUT:
> > >                 case TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INOUT:
> > >                         optee_to_msg_param_value(mp, p);
> > >                         break;
> > >                 case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT:
> > >                 case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT:
> > >                 case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT:
> > >                         if (to_msg_param_ffa_mem(mp, p))
> > >                                 return -EINVAL;
> > >                         break;
> > >                 default:
> > >                         return -EINVAL;
> > >                 }
> > >         }
> > >
> > >         return 0;
> > > }
> > >
> > > -Sumit

