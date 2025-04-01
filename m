Return-Path: <linux-media+bounces-29109-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 40C6CA7764B
	for <lists+linux-media@lfdr.de>; Tue,  1 Apr 2025 10:23:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E8C10188D6EB
	for <lists+linux-media@lfdr.de>; Tue,  1 Apr 2025 08:22:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE21B1E9B34;
	Tue,  1 Apr 2025 08:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="U0oJ10Xg"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D7501E261F
	for <linux-media@vger.kernel.org>; Tue,  1 Apr 2025 08:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743495724; cv=none; b=D5M0NLWPd6Pq+ruTZYpplas/lnB5FCPN8w30spmfkm8T2wsm0PlY2XnCNvQjIx6ksGIDBPh/hbxHGbVtnFfWS+9TFEok5ryn6fndO7hZZrW7FNg2JjSyycat8054rrVINbEppKWnXnG0dGy2ZYLYdpqaLOobBnjSJa18fxnn8j0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743495724; c=relaxed/simple;
	bh=z4vXR10yjmbL21hxSn4I0YwwMEg/10EW3deSYFKsKqA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Cjk7ZUnABfrOLrfPey7Vmd3cT/g6+4yTaecPKfRTpXT7HbK7EvkbMUSeuFF6GCnll3Ipx3KcrXZ1ZNK2TAXGAwn6iq5CydXWs3A0n8TLCp9fYP4ngnFSTbZoMofEMnnknbFLYP6ta0JuAmfc+2LH/lYEiOhQcnxU5OZ5f8/Uqhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=U0oJ10Xg; arc=none smtp.client-ip=209.85.160.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-2c6ed7ec0a5so1943635fac.1
        for <linux-media@vger.kernel.org>; Tue, 01 Apr 2025 01:22:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743495721; x=1744100521; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yiyUylgNj0KhP1gV9OJYcgs4XinI2xVJqn29LGEvQAQ=;
        b=U0oJ10Xg2/NkEwkAN/AxrmlrO3zc3CQ4tAXTLLq5p2v0jHkqjtjmbCluR8LiiO5cat
         ME6LVSHB9Nmiju/J950GYdcmw0rKbasj7+/4FsSLjnmWFMal1MaSVKdRQnoMAHaS7zFp
         3xDLhKZV4ooXLuyR1avS9qVZPZzpBIPQGk7y+pI+SyeTchbIS1PShjpKtKxwEjp6p7lu
         QuVjxAJyG14t1FXem67v5mZPHw+MullprjfXY8NuWjcetscWYB9Y6PK+9+AFrbrTVTCh
         YPpBR6MlaaVO2xkjwgd3t7q+Dn7ypTY3ED93P+xB8+jAyFyLN9BYm6OLOi5YOZmf3C95
         KrMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743495721; x=1744100521;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yiyUylgNj0KhP1gV9OJYcgs4XinI2xVJqn29LGEvQAQ=;
        b=QRjMogN7NirVDTAm2ByKdLWnQrp10jXtNcSer+c7Aut197gK/R93j0PxT2/wD1StAm
         43iLx+iwIH0zEx07RXamun80uGNVjzQ5fdhxMuqeXVETL6kPEag8s+Kpb5OBrDVfVxrk
         2XbK00ePYOVbBy4Gv9O5Duzd5qLuYFjcDgysQDLLtPf1tz2K8LzU681xZQBebnN9RTx/
         s4VQDTggd8nSJk7Tq8xRWzm1CNbAo6C4gYjyk7ncpFo5q7nY2e8DhNqUM+xkEUHTqFrr
         hrY9/JSI7j4oF/Frp4imNKfdMshEQcG62CwfmP3FzfQrPV8GwaMQigLJVLqkdLYyyMm6
         me8g==
X-Forwarded-Encrypted: i=1; AJvYcCVILeD5PBT+0X4WHhKwPxaptImdxsYeMdurGj5uHYtfhzcQSPNHSrTrcgudxC6+b1RufS4Wzo+jHICcCQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwoFVcRGx0fXa1d3i1gg7E4MqVswnWclsBtOqk3fJmJiURVIpn2
	8yCKD9kcbzfnByZUitwr1fiC67ZSkSElXGRbhL8H4JmLNLqdJCSUxwDFp3umx7Nzn6CdYLjyK+i
	3GoDcKcFyJsHiX9P+PlmUroUR6mqmqUNrXcEGmA==
X-Gm-Gg: ASbGnctjqTs4x0UWV6FKhz6QPXujpF5Jk1XzOCX9cqPWMBi0tzxUj3XW46Hrx98zkBa
	AoNh265m+Uh9cRlXg2G8nvpMqQF5otaq2RCBRnE8lhg3DSGxjqngpLxNJJxBw25qZjFewV/8KFh
	Vnr7tJlcNO37J9FG+vl7PJ8LBap+o=
X-Google-Smtp-Source: AGHT+IHQrLip9KtlOqxbbez8ZnW6S7GCS3wdzafpheotUg4HikBKc88AjJXrfgSQp1f5tosuW11aL0SlwQS0uy8o6Lo=
X-Received: by 2002:a05:6870:4d1b:b0:29e:27b6:bea5 with SMTP id
 586e51a60fabf-2cbcf765f94mr7162033fac.25.1743495721029; Tue, 01 Apr 2025
 01:22:01 -0700 (PDT)
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
 <Z-JFagmbZBQd0hoM@sumit-X1> <CAHUa44HXHwR1_LbjG6T5OqnafXiS4-kHeKjV9TurGORx3SsprQ@mail.gmail.com>
 <Z-uZfdU94J5yPU78@sumit-X1>
In-Reply-To: <Z-uZfdU94J5yPU78@sumit-X1>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Tue, 1 Apr 2025 10:21:49 +0200
X-Gm-Features: AQ5f1Jq7caI7eI2iG0axymTG4KA8wqjbCG7bG2dfLRLI_4bbEaejFDQ1A6KndhA
Message-ID: <CAHUa44F_kKjarz46NVRJ5oeJNOZfSsPN=-JcHz2FZwLMDiPawg@mail.gmail.com>
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

On Tue, Apr 1, 2025 at 9:45=E2=80=AFAM Sumit Garg <sumit.garg@kernel.org> w=
rote:
>
> On Tue, Mar 25, 2025 at 09:50:35AM +0100, Jens Wiklander wrote:
> > On Tue, Mar 25, 2025 at 6:56=E2=80=AFAM Sumit Garg <sumit.garg@kernel.o=
rg> wrote:
> > >
> > > On Thu, Mar 20, 2025 at 02:00:57PM +0100, Jens Wiklander wrote:
> > > > Hi Sumit,
> > > >
> > > > On Thu, Mar 20, 2025 at 10:25=E2=80=AFAM Sumit Garg <sumit.garg@ker=
nel.org> wrote:
> > > > >
> > > > > Hi Jens,
> > > > >
> > > > > On Mon, Mar 17, 2025 at 08:42:01AM +0100, Jens Wiklander wrote:
> > > > > > Hi Sumit,
> > > > > >
> > > > > > On Thu, Mar 13, 2025 at 11:41=E2=80=AFAM Sumit Garg <sumit.garg=
@kernel.org> wrote:
> > > > > > >
> > > > > > > Hi Jens,
> > > > > > >
> > > > > > > On Wed, Mar 05, 2025 at 02:04:09PM +0100, Jens Wiklander wrot=
e:
> > > > > > > > The OP-TEE backend driver has two internal function pointer=
s to convert
> > > > > > > > between the subsystem type struct tee_param and the OP-TEE =
type struct
> > > > > > > > optee_msg_param.
> > > > > > > >
> > > > > > > > The conversion is done from one of the types to the other, =
which is then
> > > > > > > > involved in some operation and finally converted back to th=
e original
> > > > > > > > type. When converting to prepare the parameters for the ope=
ration, all
> > > > > > > > fields must be taken into account, but then converting back=
, it's enough
> > > > > > > > to update only out-values and out-sizes. So, an update_out =
parameter is
> > > > > > > > added to the conversion functions to tell if all or only so=
me fields
> > > > > > > > must be copied.
> > > > > > > >
> > > > > > > > This is needed in a later patch where it might get confusin=
g when
> > > > > > > > converting back in from_msg_param() callback since an alloc=
ated
> > > > > > > > restricted SHM can be using the sec_world_id of the used re=
stricted
> > > > > > > > memory pool and that doesn't translate back well.
> > > > > > > >
> > > > > > > > Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> > > > > > > > ---
> > > > > > > >  drivers/tee/optee/call.c          | 10 ++--
> > > > > > > >  drivers/tee/optee/ffa_abi.c       | 43 +++++++++++++----
> > > > > > > >  drivers/tee/optee/optee_private.h | 42 +++++++++++------
> > > > > > > >  drivers/tee/optee/rpc.c           | 31 +++++++++----
> > > > > > > >  drivers/tee/optee/smc_abi.c       | 76 +++++++++++++++++++=
++++--------
> > > > > > > >  5 files changed, 144 insertions(+), 58 deletions(-)
> > > > > > > >
> > > > > > > > diff --git a/drivers/tee/optee/call.c b/drivers/tee/optee/c=
all.c
> > > > > > > > index 16eb953e14bb..f1533b894726 100644
> > > > > > > > --- a/drivers/tee/optee/call.c
> > > > > > > > +++ b/drivers/tee/optee/call.c
> > > > > > > > @@ -400,7 +400,8 @@ int optee_open_session(struct tee_conte=
xt *ctx,
> > > > > > > >       export_uuid(msg_arg->params[1].u.octets, &client_uuid=
);
> > > > > > > >
> > > > > > > >       rc =3D optee->ops->to_msg_param(optee, msg_arg->param=
s + 2,
> > > > > > > > -                                   arg->num_params, param)=
;
> > > > > > > > +                                   arg->num_params, param,
> > > > > > > > +                                   false /*!update_out*/);
> > > > > > > >       if (rc)
> > > > > > > >               goto out;
> > > > > > > >
> > > > > > > > @@ -427,7 +428,8 @@ int optee_open_session(struct tee_conte=
xt *ctx,
> > > > > > > >       }
> > > > > > > >
> > > > > > > >       if (optee->ops->from_msg_param(optee, param, arg->num=
_params,
> > > > > > > > -                                    msg_arg->params + 2)) =
{
> > > > > > > > +                                    msg_arg->params + 2,
> > > > > > > > +                                    true /*update_out*/)) =
{
> > > > > > > >               arg->ret =3D TEEC_ERROR_COMMUNICATION;
> > > > > > > >               arg->ret_origin =3D TEEC_ORIGIN_COMMS;
> > > > > > > >               /* Close session again to avoid leakage */
> > > > > > > > @@ -541,7 +543,7 @@ int optee_invoke_func(struct tee_contex=
t *ctx, struct tee_ioctl_invoke_arg *arg,
> > > > > > > >       msg_arg->cancel_id =3D arg->cancel_id;
> > > > > > > >
> > > > > > > >       rc =3D optee->ops->to_msg_param(optee, msg_arg->param=
s, arg->num_params,
> > > > > > > > -                                   param);
> > > > > > > > +                                   param, false /*!update_=
out*/);
> > > > > > > >       if (rc)
> > > > > > > >               goto out;
> > > > > > > >
> > > > > > > > @@ -551,7 +553,7 @@ int optee_invoke_func(struct tee_contex=
t *ctx, struct tee_ioctl_invoke_arg *arg,
> > > > > > > >       }
> > > > > > > >
> > > > > > > >       if (optee->ops->from_msg_param(optee, param, arg->num=
_params,
> > > > > > > > -                                    msg_arg->params)) {
> > > > > > > > +                                    msg_arg->params, true =
/*update_out*/)) {
> > > > > > > >               msg_arg->ret =3D TEEC_ERROR_COMMUNICATION;
> > > > > > > >               msg_arg->ret_origin =3D TEEC_ORIGIN_COMMS;
> > > > > > > >       }
> > > > > > > > diff --git a/drivers/tee/optee/ffa_abi.c b/drivers/tee/opte=
e/ffa_abi.c
> > > > > > > > index 4ca1d5161b82..e4b08cd195f3 100644
> > > > > > > > --- a/drivers/tee/optee/ffa_abi.c
> > > > > > > > +++ b/drivers/tee/optee/ffa_abi.c
> > > > > > > > @@ -122,15 +122,21 @@ static int optee_shm_rem_ffa_handle(s=
truct optee *optee, u64 global_id)
> > > > > > > >   */
> > > > > > > >
> > > > > > > >  static void from_msg_param_ffa_mem(struct optee *optee, st=
ruct tee_param *p,
> > > > > > > > -                                u32 attr, const struct opt=
ee_msg_param *mp)
> > > > > > > > +                                u32 attr, const struct opt=
ee_msg_param *mp,
> > > > > > > > +                                bool update_out)
> > > > > > > >  {
> > > > > > > >       struct tee_shm *shm =3D NULL;
> > > > > > > >       u64 offs_high =3D 0;
> > > > > > > >       u64 offs_low =3D 0;
> > > > > > > >
> > > > > > > > +     if (update_out) {
> > > > > > > > +             if (attr =3D=3D OPTEE_MSG_ATTR_TYPE_FMEM_INPU=
T)
> > > > > > > > +                     return;
> > > > > > > > +             goto out;
> > > > > > > > +     }
> > > > > > > > +
> > > > > > > >       p->attr =3D TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT +
> > > > > > > >                 attr - OPTEE_MSG_ATTR_TYPE_FMEM_INPUT;
> > > > > > > > -     p->u.memref.size =3D mp->u.fmem.size;
> > > > > > > >
> > > > > > > >       if (mp->u.fmem.global_id !=3D OPTEE_MSG_FMEM_INVALID_=
GLOBAL_ID)
> > > > > > > >               shm =3D optee_shm_from_ffa_handle(optee, mp->=
u.fmem.global_id);
> > > > > > > > @@ -141,6 +147,8 @@ static void from_msg_param_ffa_mem(stru=
ct optee *optee, struct tee_param *p,
> > > > > > > >               offs_high =3D mp->u.fmem.offs_high;
> > > > > > > >       }
> > > > > > > >       p->u.memref.shm_offs =3D offs_low | offs_high << 32;
> > > > > > > > +out:
> > > > > > > > +     p->u.memref.size =3D mp->u.fmem.size;
> > > > > > > >  }
> > > > > > > >
> > > > > > > >  /**
> > > > > > > > @@ -150,12 +158,14 @@ static void from_msg_param_ffa_mem(st=
ruct optee *optee, struct tee_param *p,
> > > > > > > >   * @params:  subsystem internal parameter representation
> > > > > > > >   * @num_params:      number of elements in the parameter a=
rrays
> > > > > > > >   * @msg_params:      OPTEE_MSG parameters
> > > > > > > > + * @update_out: update parameter for output only
> > > > > > > >   *
> > > > > > > >   * Returns 0 on success or <0 on failure
> > > > > > > >   */
> > > > > > > >  static int optee_ffa_from_msg_param(struct optee *optee,
> > > > > > > >                                   struct tee_param *params,=
 size_t num_params,
> > > > > > > > -                                 const struct optee_msg_pa=
ram *msg_params)
> > > > > > > > +                                 const struct optee_msg_pa=
ram *msg_params,
> > > > > > > > +                                 bool update_out)
> > > > > > > >  {
> > > > > > > >       size_t n;
> > > > > > > >
> > > > > > > > @@ -166,18 +176,20 @@ static int optee_ffa_from_msg_param(s=
truct optee *optee,
> > > > > > > >
> > > > > > > >               switch (attr) {
> > > > > > > >               case OPTEE_MSG_ATTR_TYPE_NONE:
> > > > > > > > +                     if (update_out)
> > > > > > > > +                             break;
> > > > > > > >                       p->attr =3D TEE_IOCTL_PARAM_ATTR_TYPE=
_NONE;
> > > > > > > >                       memset(&p->u, 0, sizeof(p->u));
> > > > > > > >                       break;
> > > > > > > >               case OPTEE_MSG_ATTR_TYPE_VALUE_INPUT:
> > > > > > > >               case OPTEE_MSG_ATTR_TYPE_VALUE_OUTPUT:
> > > > > > > >               case OPTEE_MSG_ATTR_TYPE_VALUE_INOUT:
> > > > > > > > -                     optee_from_msg_param_value(p, attr, m=
p);
> > > > > > > > +                     optee_from_msg_param_value(p, attr, m=
p, update_out);
> > > > > > > >                       break;
> > > > > > > >               case OPTEE_MSG_ATTR_TYPE_FMEM_INPUT:
> > > > > > > >               case OPTEE_MSG_ATTR_TYPE_FMEM_OUTPUT:
> > > > > > > >               case OPTEE_MSG_ATTR_TYPE_FMEM_INOUT:
> > > > > > > > -                     from_msg_param_ffa_mem(optee, p, attr=
, mp);
> > > > > > > > +                     from_msg_param_ffa_mem(optee, p, attr=
, mp, update_out);
> > > > > > > >                       break;
> > > > > > > >               default:
> > > > > > > >                       return -EINVAL;
> > > > > > > > @@ -188,10 +200,16 @@ static int optee_ffa_from_msg_param(s=
truct optee *optee,
> > > > > > > >  }
> > > > > > > >
> > > > > > > >  static int to_msg_param_ffa_mem(struct optee_msg_param *mp=
,
> > > > > > > > -                             const struct tee_param *p)
> > > > > > > > +                             const struct tee_param *p, bo=
ol update_out)
> > > > > > > >  {
> > > > > > > >       struct tee_shm *shm =3D p->u.memref.shm;
> > > > > > > >
> > > > > > > > +     if (update_out) {
> > > > > > > > +             if (p->attr =3D=3D TEE_IOCTL_PARAM_ATTR_TYPE_=
MEMREF_INPUT)
> > > > > > > > +                     return 0;
> > > > > > > > +             goto out;
> > > > > > > > +     }
> > > > > > > > +
> > > > > > > >       mp->attr =3D OPTEE_MSG_ATTR_TYPE_FMEM_INPUT + p->attr=
 -
> > > > > > > >                  TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT;
> > > > > > > >
> > > > > > > > @@ -211,6 +229,7 @@ static int to_msg_param_ffa_mem(struct =
optee_msg_param *mp,
> > > > > > > >               memset(&mp->u, 0, sizeof(mp->u));
> > > > > > > >               mp->u.fmem.global_id =3D OPTEE_MSG_FMEM_INVAL=
ID_GLOBAL_ID;
> > > > > > > >       }
> > > > > > > > +out:
> > > > > > > >       mp->u.fmem.size =3D p->u.memref.size;
> > > > > > > >
> > > > > > > >       return 0;
> > > > > > > > @@ -222,13 +241,15 @@ static int to_msg_param_ffa_mem(struc=
t optee_msg_param *mp,
> > > > > > > >   * @optee:   main service struct
> > > > > > > >   * @msg_params:      OPTEE_MSG parameters
> > > > > > > >   * @num_params:      number of elements in the parameter a=
rrays
> > > > > > > > - * @params:  subsystem itnernal parameter representation
> > > > > > > > + * @params:  subsystem internal parameter representation
> > > > > > > > + * @update_out: update parameter for output only
> > > > > > > >   * Returns 0 on success or <0 on failure
> > > > > > > >   */
> > > > > > > >  static int optee_ffa_to_msg_param(struct optee *optee,
> > > > > > > >                                 struct optee_msg_param *msg=
_params,
> > > > > > > >                                 size_t num_params,
> > > > > > > > -                               const struct tee_param *par=
ams)
> > > > > > > > +                               const struct tee_param *par=
ams,
> > > > > > > > +                               bool update_out)
> > > > > > > >  {
> > > > > > > >       size_t n;
> > > > > > > >
> > > > > > > > @@ -238,18 +259,20 @@ static int optee_ffa_to_msg_param(str=
uct optee *optee,
> > > > > > > >
> > > > > > > >               switch (p->attr) {
> > > > > > > >               case TEE_IOCTL_PARAM_ATTR_TYPE_NONE:
> > > > > > > > +                     if (update_out)
> > > > > > > > +                             break;
> > > > > > > >                       mp->attr =3D TEE_IOCTL_PARAM_ATTR_TYP=
E_NONE;
> > > > > > > >                       memset(&mp->u, 0, sizeof(mp->u));
> > > > > > > >                       break;
> > > > > > > >               case TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT:
> > > > > > > >               case TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_OUTPUT:
> > > > > > > >               case TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INOUT:
> > > > > > > > -                     optee_to_msg_param_value(mp, p);
> > > > > > > > +                     optee_to_msg_param_value(mp, p, updat=
e_out);
> > > > > > > >                       break;
> > > > > > > >               case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT:
> > > > > > > >               case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT:
> > > > > > > >               case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT:
> > > > > > > > -                     if (to_msg_param_ffa_mem(mp, p))
> > > > > > > > +                     if (to_msg_param_ffa_mem(mp, p, updat=
e_out))
> > > > > > > >                               return -EINVAL;
> > > > > > > >                       break;
> > > > > > > >               default:
> > > > > > >
> > > > > > > Can we rather handle it as follows to improve code readabilit=
y and
> > > > > > > maintainence long term? Ditto for all other places.
> > > > > > >
> > > > > > > static int optee_ffa_to_msg_param(struct optee *optee,
> > > > > > >                                   struct optee_msg_param *msg=
_params,
> > > > > > >                                   size_t num_params,
> > > > > > >                                   const struct tee_param *par=
ams,
> > > > > > >                                   bool update_out)
> > > > > > > {
> > > > > > >         size_t n;
> > > > > > >
> > > > > > >         for (n =3D 0; n < num_params; n++) {
> > > > > > >                 const struct tee_param *p =3D params + n;
> > > > > > >                 struct optee_msg_param *mp =3D msg_params + n=
;
> > > > > > >
> > > > > > >                 if (update_out && (p->attr =3D=3D TEE_IOCTL_P=
ARAM_ATTR_TYPE_NONE ||
> > > > > > >                      p->attr =3D=3D TEE_IOCTL_PARAM_ATTR_TYPE=
_VALUE_INPUT ||
> > > > > > >                      p->attr =3D=3D TEE_IOCTL_PARAM_ATTR_TYPE=
_MEMREF_INPUT))
> > > > > > >                     continue;
> > > > > >
> > > > > > You're missing updating the length field for memrefs.
> > > > > >
> > > > >
> > > > > Do we need to update length field for input memrefs when update_o=
ut is
> > > > > set? I don't see that happening in your existing patch too.
> > > >
> > > > I'm sorry, I was unclear. The update_out parameter means only the
> > > > output fields should be updated, not the attribute, offsets, ids, e=
tc.
> > > > That is, the length field for memrefs, and the value fields a, b, c
> > > > for value params. Some of the memrefs aren't translated one-to-one
> > > > with SDP, but the length field can and must be updated.
> > >
> > > Isn't it rather better to add another attribute type to handled SDP
> > > special handling?
> >
> > This isn't special handling, all parameters get the same treatment.
> > When updating a parameter after it has been used, this is all that
> > needs to be done, regardless of whether it's an SDP buffer. The
> > updates we did before this patch were redundant.
> >
> > This patch was introduced in the v3 of this patch set, but I don't
> > think it's strictly needed any longer since SDP buffers are allocated
> > differently now. I think it's nice to only update what's needed when
> > translating back a parameter (just as in params_to_user() in
> > drivers/tee/tee_core.c), but if you don't like it, we can drop this
> > patch.
>
> params_to_user() doesn't take any additional parameter like "update_out"
> which is complicating the program flow here. Can't we rather follow
> similar practice for {to/from}_msg_param() APIs?

I'm afraid something special is needed. handle_rpc_supp_cmd() needs
all the fields to be updated, from_msg_param() prepares input and
attribute type may have changed when to_msg_param() is called.

Cheers,
Jens

