Return-Path: <linux-media+bounces-22700-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 14C079E530E
	for <lists+linux-media@lfdr.de>; Thu,  5 Dec 2024 11:55:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BECAD2887A0
	for <lists+linux-media@lfdr.de>; Thu,  5 Dec 2024 10:55:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90F381D8E01;
	Thu,  5 Dec 2024 10:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZHL7oRhk"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ECD01D8DEE
	for <linux-media@vger.kernel.org>; Thu,  5 Dec 2024 10:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733396131; cv=none; b=a4coiNKzkStDA3zJTmLsG6C0sLAmEuD1U9cGBciM+K17ifCbNN1acQqSl6lttEKQst/rk13Aw22mU1neV1O4TkdHxI7AR5OyqnMSzZvbeR5g1wPYwfwx3hlD9j4Q+oPkrXVm8QG2a1rrhcdNYi8DvqaJwYBF+MwoEFZGH8WDsks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733396131; c=relaxed/simple;
	bh=QrV4oGinlxFXL9KwSiiXdDKSefxJDTqR3xDEQ7Ai4gg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DZNaWL4WpajPIe1vTBvOfhQYdk1/b2E+RTZAm0Wm5G3WmDznlWbJEiv42smu68pHZ8TeQdK7kRLuWwuFO6h1IBhtdoKx76RBx7rr5KEXi4+/TxJEmsQAJeb5LrDXv3MZwFZkRQ99AyE5h80wGqmnfssOzgMEcQMFtgpRrLcg2TQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZHL7oRhk; arc=none smtp.client-ip=209.85.160.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-29e3721ded9so518468fac.0
        for <linux-media@vger.kernel.org>; Thu, 05 Dec 2024 02:55:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733396127; x=1734000927; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mcud7I5JiovuE8Jaohme85mCqGYx3lG0/HsoBiy64I4=;
        b=ZHL7oRhkRtsqOv+/Z3Mvsnq4H9VxVp9WHzrT7qj3ul6V0o8UxIskkWCk49vXkq0dJ9
         2r+1MByiTMjwkIwR7G437/HJ3N5zQ+sesYG3hT3YSIAj2Uo/JIs+HqBFyrfE+dQ4+hhz
         oCkCjYISad5QS1WdaaZnZECeic/rs4nmwypkBpCzsX90yCznyQg/e9zC4V+jijGf/P6n
         Ro9TL2rHOya5sa0Mazr61Yik2Z+QsMrn9sUIlCjNkfn24fsys6J4x8JsNBBt8Sb0QUK/
         H8Wl5qp/N9ReKfCX9yuVThjM5lSbsrpyNA1j6wQ+BZR4gXSJ+ljz0apuj0oRqQ6+3cSv
         v4EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733396127; x=1734000927;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mcud7I5JiovuE8Jaohme85mCqGYx3lG0/HsoBiy64I4=;
        b=HdvOdLwo4CI4sIDaQO244MAZA7NdVu8CrvM4fDpWrU2AfOICDWo4M9jp/Vouzp3vJk
         ChQ65CbCYxI8OfbS/bnWeSdxRerx6rj/BRO6Jh86J70xpYvlS4XP287dNb2Ttdjnv3wC
         DCn5CkZdMe/hMlrfc2Wg3JPBj8aLPC/0B8oWya3LFBNIE+9za/xV6Ai0AFm6jLRgVd/L
         iSuPHTtznE8cf5BbkmQ/3leguJzj3zZ9LHG/gJnoUi8KGJmgMM9CeuPh5tIWCuhBFqC2
         qTENsWFUbr++wo2kZSfFxUoJTrQGS1H+s7MtKH8K93U1nV9K1qb42NE1o5LKqklfe/Px
         wL+Q==
X-Forwarded-Encrypted: i=1; AJvYcCU2daA/Nx+NZHb/mvDu0kk59r2lOTEsqClDJ0ZjrJFJKjSg66lMOVb8sy5P/hmI2qDs9hNKAhmWWZSFeg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwptIViD1RHFgRBRRDalYZjRLtBnJDMOC5AofzGSnk7+X5mB9w4
	5d9OwdAxnkK3cl6DU4LJLrOgLVSx1Y0RHnJTAoM5yC53S6oZletcR1lMgpgKBkgHWGcT3I/BE1G
	eJWQWCzha6LX7OE/B9QWFJYza/O+92nvNFu9fNSKvcyd6RL+d
X-Gm-Gg: ASbGncv+o2hZ+B/hDYjTZE0BMDP7k/H1FzBUCLadJoEQji4hSrTnuv4FnCVbPP4+ulh
	4t8Bfkh0D5JHvljkPU2UPOath4fa+uAc=
X-Google-Smtp-Source: AGHT+IHlwPY5xDLgAp8+7rewqyZjwLcOsvOVnN31rI+fQNuV2Cjqu6sNj+5VwMTxAnipNmlIqTvLbcqCcQ2ahUgu/cw=
X-Received: by 2002:a05:6871:729c:b0:29e:3a95:a25 with SMTP id
 586e51a60fabf-29e886a884fmr9661813fac.19.1733396127233; Thu, 05 Dec 2024
 02:55:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241128150927.1377981-1-jens.wiklander@linaro.org>
 <20241128150927.1377981-3-jens.wiklander@linaro.org> <CAFA6WYPEqCWyvD=pCj6DEkZWN9SCfXMnq4tKbSx1-e8UmgXb=Q@mail.gmail.com>
 <CAHUa44H0go3fSMt_jreWz4EQgYvo8GOZ5woc-x5Cyi680oWZWw@mail.gmail.com> <CAFA6WYNJQEjs29AniqC7mdmo7Fe+fCmW1kFcJ1Z2HSjQQ36LBw@mail.gmail.com>
In-Reply-To: <CAFA6WYNJQEjs29AniqC7mdmo7Fe+fCmW1kFcJ1Z2HSjQQ36LBw@mail.gmail.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Thu, 5 Dec 2024 11:55:14 +0100
Message-ID: <CAHUa44G2=6tCvnJN2xkkg+UHJ58-0sK+BJSJyCU27aXWqPJy9g@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] optee: account for direction while converting parameters
To: Sumit Garg <sumit.garg@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	op-tee@lists.trustedfirmware.org, linux-arm-kernel@lists.infradead.org, 
	Olivier Masse <olivier.masse@nxp.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Yong Wu <yong.wu@mediatek.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, "T . J . Mercier" <tjmercier@google.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, azarrabi@qti.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 3, 2024 at 11:35=E2=80=AFAM Sumit Garg <sumit.garg@linaro.org> =
wrote:
>
> On Tue, 3 Dec 2024 at 15:58, Jens Wiklander <jens.wiklander@linaro.org> w=
rote:
> >
> > Hi Sumit,
> >
> > On Tue, Dec 3, 2024 at 9:27=E2=80=AFAM Sumit Garg <sumit.garg@linaro.or=
g> wrote:
> > >
> > > Hi Jens,
> > >
> > > On Thu, 28 Nov 2024 at 20:39, Jens Wiklander <jens.wiklander@linaro.o=
rg> wrote:
> > > >
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
> > >
> > > Is this patch just a refactoring of TEE params handling? Or are we
> > > fixing a real ABI issue here? Also, is this required for restricted
> > > shared memory support to work? Just asking if we want to consider it
> > > as a fix for backporting or if we can handle this refactoring patch
> > > independently of this series?
> >
> > This is needed in this series. Without this patch, it might get
> > confusing when converting back in from_msg_param() callback since an
> > allocated restricted SHM can be using the sec_world_id of the pool and
> > that doesn't translate back well. params_to_user() in
> > drivers/tee/tee_core.c already takes the direction into account so it
> > wouldn't spread to user-space.
>
> Thanks Jens for the clarification, if you can update the commit text
> accordingly will help clarify the motivation for the change.

Sure, I'll update.

Thanks,
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
> > > >         export_uuid(msg_arg->params[1].u.octets, &client_uuid);
> > > >
> > > >         rc =3D optee->ops->to_msg_param(optee, msg_arg->params + 2,
> > > > -                                     arg->num_params, param);
> > > > +                                     arg->num_params, param,
> > > > +                                     false /*!update_out*/);
> > > >         if (rc)
> > > >                 goto out;
> > > >
> > > > @@ -427,7 +428,8 @@ int optee_open_session(struct tee_context *ctx,
> > > >         }
> > > >
> > > >         if (optee->ops->from_msg_param(optee, param, arg->num_param=
s,
> > > > -                                      msg_arg->params + 2)) {
> > > > +                                      msg_arg->params + 2,
> > > > +                                      true /*update_out*/)) {
> > > >                 arg->ret =3D TEEC_ERROR_COMMUNICATION;
> > > >                 arg->ret_origin =3D TEEC_ORIGIN_COMMS;
> > > >                 /* Close session again to avoid leakage */
> > > > @@ -541,7 +543,7 @@ int optee_invoke_func(struct tee_context *ctx, =
struct tee_ioctl_invoke_arg *arg,
> > > >         msg_arg->cancel_id =3D arg->cancel_id;
> > > >
> > > >         rc =3D optee->ops->to_msg_param(optee, msg_arg->params, arg=
->num_params,
> > > > -                                     param);
> > > > +                                     param, false /*!update_out*/)=
;
> > > >         if (rc)
> > > >                 goto out;
> > > >
> > > > @@ -551,7 +553,7 @@ int optee_invoke_func(struct tee_context *ctx, =
struct tee_ioctl_invoke_arg *arg,
> > > >         }
> > > >
> > > >         if (optee->ops->from_msg_param(optee, param, arg->num_param=
s,
> > > > -                                      msg_arg->params)) {
> > > > +                                      msg_arg->params, true /*upda=
te_out*/)) {
> > > >                 msg_arg->ret =3D TEEC_ERROR_COMMUNICATION;
> > > >                 msg_arg->ret_origin =3D TEEC_ORIGIN_COMMS;
> > > >         }
> > > > diff --git a/drivers/tee/optee/ffa_abi.c b/drivers/tee/optee/ffa_ab=
i.c
> > > > index f3af5666bb11..02e6175ac5f0 100644
> > > > --- a/drivers/tee/optee/ffa_abi.c
> > > > +++ b/drivers/tee/optee/ffa_abi.c
> > > > @@ -122,15 +122,21 @@ static int optee_shm_rem_ffa_handle(struct op=
tee *optee, u64 global_id)
> > > >   */
> > > >
> > > >  static void from_msg_param_ffa_mem(struct optee *optee, struct tee=
_param *p,
> > > > -                                  u32 attr, const struct optee_msg=
_param *mp)
> > > > +                                  u32 attr, const struct optee_msg=
_param *mp,
> > > > +                                  bool update_out)
> > > >  {
> > > >         struct tee_shm *shm =3D NULL;
> > > >         u64 offs_high =3D 0;
> > > >         u64 offs_low =3D 0;
> > > >
> > > > +       if (update_out) {
> > > > +               if (attr =3D=3D OPTEE_MSG_ATTR_TYPE_FMEM_INPUT)
> > > > +                       return;
> > > > +               goto out;
> > > > +       }
> > > > +
> > > >         p->attr =3D TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT +
> > > >                   attr - OPTEE_MSG_ATTR_TYPE_FMEM_INPUT;
> > > > -       p->u.memref.size =3D mp->u.fmem.size;
> > > >
> > > >         if (mp->u.fmem.global_id !=3D OPTEE_MSG_FMEM_INVALID_GLOBAL=
_ID)
> > > >                 shm =3D optee_shm_from_ffa_handle(optee, mp->u.fmem=
.global_id);
> > > > @@ -141,6 +147,8 @@ static void from_msg_param_ffa_mem(struct optee=
 *optee, struct tee_param *p,
> > > >                 offs_high =3D mp->u.fmem.offs_high;
> > > >         }
> > > >         p->u.memref.shm_offs =3D offs_low | offs_high << 32;
> > > > +out:
> > > > +       p->u.memref.size =3D mp->u.fmem.size;
> > > >  }
> > > >
> > > >  /**
> > > > @@ -150,12 +158,14 @@ static void from_msg_param_ffa_mem(struct opt=
ee *optee, struct tee_param *p,
> > > >   * @params:    subsystem internal parameter representation
> > > >   * @num_params:        number of elements in the parameter arrays
> > > >   * @msg_params:        OPTEE_MSG parameters
> > > > + * @update_out: update parameter for output only
> > > >   *
> > > >   * Returns 0 on success or <0 on failure
> > > >   */
> > > >  static int optee_ffa_from_msg_param(struct optee *optee,
> > > >                                     struct tee_param *params, size_=
t num_params,
> > > > -                                   const struct optee_msg_param *m=
sg_params)
> > > > +                                   const struct optee_msg_param *m=
sg_params,
> > > > +                                   bool update_out)
> > > >  {
> > > >         size_t n;
> > > >
> > > > @@ -166,18 +176,20 @@ static int optee_ffa_from_msg_param(struct op=
tee *optee,
> > > >
> > > >                 switch (attr) {
> > > >                 case OPTEE_MSG_ATTR_TYPE_NONE:
> > > > +                       if (update_out)
> > > > +                               break;
> > > >                         p->attr =3D TEE_IOCTL_PARAM_ATTR_TYPE_NONE;
> > > >                         memset(&p->u, 0, sizeof(p->u));
> > > >                         break;
> > > >                 case OPTEE_MSG_ATTR_TYPE_VALUE_INPUT:
> > > >                 case OPTEE_MSG_ATTR_TYPE_VALUE_OUTPUT:
> > > >                 case OPTEE_MSG_ATTR_TYPE_VALUE_INOUT:
> > > > -                       optee_from_msg_param_value(p, attr, mp);
> > > > +                       optee_from_msg_param_value(p, attr, mp, upd=
ate_out);
> > > >                         break;
> > > >                 case OPTEE_MSG_ATTR_TYPE_FMEM_INPUT:
> > > >                 case OPTEE_MSG_ATTR_TYPE_FMEM_OUTPUT:
> > > >                 case OPTEE_MSG_ATTR_TYPE_FMEM_INOUT:
> > > > -                       from_msg_param_ffa_mem(optee, p, attr, mp);
> > > > +                       from_msg_param_ffa_mem(optee, p, attr, mp, =
update_out);
> > > >                         break;
> > > >                 default:
> > > >                         return -EINVAL;
> > > > @@ -188,10 +200,16 @@ static int optee_ffa_from_msg_param(struct op=
tee *optee,
> > > >  }
> > > >
> > > >  static int to_msg_param_ffa_mem(struct optee_msg_param *mp,
> > > > -                               const struct tee_param *p)
> > > > +                               const struct tee_param *p, bool upd=
ate_out)
> > > >  {
> > > >         struct tee_shm *shm =3D p->u.memref.shm;
> > > >
> > > > +       if (update_out) {
> > > > +               if (p->attr =3D=3D TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF=
_INPUT)
> > > > +                       return 0;
> > > > +               goto out;
> > > > +       }
> > > > +
> > > >         mp->attr =3D OPTEE_MSG_ATTR_TYPE_FMEM_INPUT + p->attr -
> > > >                    TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT;
> > > >
> > > > @@ -211,6 +229,7 @@ static int to_msg_param_ffa_mem(struct optee_ms=
g_param *mp,
> > > >                 memset(&mp->u, 0, sizeof(mp->u));
> > > >                 mp->u.fmem.global_id =3D OPTEE_MSG_FMEM_INVALID_GLO=
BAL_ID;
> > > >         }
> > > > +out:
> > > >         mp->u.fmem.size =3D p->u.memref.size;
> > > >
> > > >         return 0;
> > > > @@ -222,13 +241,15 @@ static int to_msg_param_ffa_mem(struct optee_=
msg_param *mp,
> > > >   * @optee:     main service struct
> > > >   * @msg_params:        OPTEE_MSG parameters
> > > >   * @num_params:        number of elements in the parameter arrays
> > > > - * @params:    subsystem itnernal parameter representation
> > > > + * @params:    subsystem internal parameter representation
> > > > + * @update_out: update parameter for output only
> > > >   * Returns 0 on success or <0 on failure
> > > >   */
> > > >  static int optee_ffa_to_msg_param(struct optee *optee,
> > > >                                   struct optee_msg_param *msg_param=
s,
> > > >                                   size_t num_params,
> > > > -                                 const struct tee_param *params)
> > > > +                                 const struct tee_param *params,
> > > > +                                 bool update_out)
> > > >  {
> > > >         size_t n;
> > > >
> > > > @@ -238,18 +259,20 @@ static int optee_ffa_to_msg_param(struct opte=
e *optee,
> > > >
> > > >                 switch (p->attr) {
> > > >                 case TEE_IOCTL_PARAM_ATTR_TYPE_NONE:
> > > > +                       if (update_out)
> > > > +                               break;
> > > >                         mp->attr =3D TEE_IOCTL_PARAM_ATTR_TYPE_NONE=
;
> > > >                         memset(&mp->u, 0, sizeof(mp->u));
> > > >                         break;
> > > >                 case TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT:
> > > >                 case TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_OUTPUT:
> > > >                 case TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INOUT:
> > > > -                       optee_to_msg_param_value(mp, p);
> > > > +                       optee_to_msg_param_value(mp, p, update_out)=
;
> > > >                         break;
> > > >                 case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT:
> > > >                 case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT:
> > > >                 case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT:
> > > > -                       if (to_msg_param_ffa_mem(mp, p))
> > > > +                       if (to_msg_param_ffa_mem(mp, p, update_out)=
)
> > > >                                 return -EINVAL;
> > > >                         break;
> > > >                 default:
> > > > diff --git a/drivers/tee/optee/optee_private.h b/drivers/tee/optee/=
optee_private.h
> > > > index dc0f355ef72a..20eda508dbac 100644
> > > > --- a/drivers/tee/optee/optee_private.h
> > > > +++ b/drivers/tee/optee/optee_private.h
> > > > @@ -185,10 +185,12 @@ struct optee_ops {
> > > >                                 bool system_thread);
> > > >         int (*to_msg_param)(struct optee *optee,
> > > >                             struct optee_msg_param *msg_params,
> > > > -                           size_t num_params, const struct tee_par=
am *params);
> > > > +                           size_t num_params, const struct tee_par=
am *params,
> > > > +                           bool update_out);
> > > >         int (*from_msg_param)(struct optee *optee, struct tee_param=
 *params,
> > > >                               size_t num_params,
> > > > -                             const struct optee_msg_param *msg_par=
ams);
> > > > +                             const struct optee_msg_param *msg_par=
ams,
> > > > +                             bool update_out);
> > > >  };
> > > >
> > > >  /**
> > > > @@ -316,23 +318,35 @@ void optee_release(struct tee_context *ctx);
> > > >  void optee_release_supp(struct tee_context *ctx);
> > > >
> > > >  static inline void optee_from_msg_param_value(struct tee_param *p,=
 u32 attr,
> > > > -                                             const struct optee_ms=
g_param *mp)
> > > > +                                             const struct optee_ms=
g_param *mp,
> > > > +                                             bool update_out)
> > > >  {
> > > > -       p->attr =3D TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT +
> > > > -                 attr - OPTEE_MSG_ATTR_TYPE_VALUE_INPUT;
> > > > -       p->u.value.a =3D mp->u.value.a;
> > > > -       p->u.value.b =3D mp->u.value.b;
> > > > -       p->u.value.c =3D mp->u.value.c;
> > > > +       if (!update_out)
> > > > +               p->attr =3D TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT +
> > > > +                         attr - OPTEE_MSG_ATTR_TYPE_VALUE_INPUT;
> > > > +
> > > > +       if (attr =3D=3D OPTEE_MSG_ATTR_TYPE_VALUE_OUTPUT ||
> > > > +           attr =3D=3D OPTEE_MSG_ATTR_TYPE_VALUE_INOUT || !update_=
out) {
> > > > +               p->u.value.a =3D mp->u.value.a;
> > > > +               p->u.value.b =3D mp->u.value.b;
> > > > +               p->u.value.c =3D mp->u.value.c;
> > > > +       }
> > > >  }
> > > >
> > > >  static inline void optee_to_msg_param_value(struct optee_msg_param=
 *mp,
> > > > -                                           const struct tee_param =
*p)
> > > > +                                           const struct tee_param =
*p,
> > > > +                                           bool update_out)
> > > >  {
> > > > -       mp->attr =3D OPTEE_MSG_ATTR_TYPE_VALUE_INPUT + p->attr -
> > > > -                  TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT;
> > > > -       mp->u.value.a =3D p->u.value.a;
> > > > -       mp->u.value.b =3D p->u.value.b;
> > > > -       mp->u.value.c =3D p->u.value.c;
> > > > +       if (!update_out)
> > > > +               mp->attr =3D OPTEE_MSG_ATTR_TYPE_VALUE_INPUT + p->a=
ttr -
> > > > +                          TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT;
> > > > +
> > > > +       if (p->attr =3D=3D TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_OUTPUT |=
|
> > > > +           p->attr =3D=3D TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INOUT ||=
 !update_out) {
> > > > +               mp->u.value.a =3D p->u.value.a;
> > > > +               mp->u.value.b =3D p->u.value.b;
> > > > +               mp->u.value.c =3D p->u.value.c;
> > > > +       }
> > > >  }
> > > >
> > > >  void optee_cq_init(struct optee_call_queue *cq, int thread_count);
> > > > diff --git a/drivers/tee/optee/rpc.c b/drivers/tee/optee/rpc.c
> > > > index ebbbd42b0e3e..580e6b9b0606 100644
> > > > --- a/drivers/tee/optee/rpc.c
> > > > +++ b/drivers/tee/optee/rpc.c
> > > > @@ -63,7 +63,7 @@ static void handle_rpc_func_cmd_i2c_transfer(stru=
ct tee_context *ctx,
> > > >         }
> > > >
> > > >         if (optee->ops->from_msg_param(optee, params, arg->num_para=
ms,
> > > > -                                      arg->params))
> > > > +                                      arg->params, false /*!update=
_out*/))
> > > >                 goto bad;
> > > >
> > > >         for (i =3D 0; i < arg->num_params; i++) {
> > > > @@ -107,7 +107,8 @@ static void handle_rpc_func_cmd_i2c_transfer(st=
ruct tee_context *ctx,
> > > >         } else {
> > > >                 params[3].u.value.a =3D msg.len;
> > > >                 if (optee->ops->to_msg_param(optee, arg->params,
> > > > -                                            arg->num_params, param=
s))
> > > > +                                            arg->num_params, param=
s,
> > > > +                                            true /*update_out*/))
> > > >                         arg->ret =3D TEEC_ERROR_BAD_PARAMETERS;
> > > >                 else
> > > >                         arg->ret =3D TEEC_SUCCESS;
> > > > @@ -188,6 +189,7 @@ static void handle_rpc_func_cmd_wait(struct opt=
ee_msg_arg *arg)
> > > >  static void handle_rpc_supp_cmd(struct tee_context *ctx, struct op=
tee *optee,
> > > >                                 struct optee_msg_arg *arg)
> > > >  {
> > > > +       bool update_out =3D false;
> > > >         struct tee_param *params;
> > > >
> > > >         arg->ret_origin =3D TEEC_ORIGIN_COMMS;
> > > > @@ -200,15 +202,21 @@ static void handle_rpc_supp_cmd(struct tee_co=
ntext *ctx, struct optee *optee,
> > > >         }
> > > >
> > > >         if (optee->ops->from_msg_param(optee, params, arg->num_para=
ms,
> > > > -                                      arg->params)) {
> > > > +                                      arg->params, update_out)) {
> > > >                 arg->ret =3D TEEC_ERROR_BAD_PARAMETERS;
> > > >                 goto out;
> > > >         }
> > > >
> > > >         arg->ret =3D optee_supp_thrd_req(ctx, arg->cmd, arg->num_pa=
rams, params);
> > > >
> > > > +       /*
> > > > +        * Special treatment for OPTEE_RPC_CMD_SHM_ALLOC since inpu=
t is a
> > > > +        * value type, but the output is a memref type.
> > > > +        */
> > > > +       if (arg->cmd !=3D OPTEE_RPC_CMD_SHM_ALLOC)
> > > > +               update_out =3D true;
> > > >         if (optee->ops->to_msg_param(optee, arg->params, arg->num_p=
arams,
> > > > -                                    params))
> > > > +                                    params, update_out))
> > > >                 arg->ret =3D TEEC_ERROR_BAD_PARAMETERS;
> > > >  out:
> > > >         kfree(params);
> > > > @@ -270,7 +278,7 @@ static void handle_rpc_func_rpmb_probe_reset(st=
ruct tee_context *ctx,
> > > >
> > > >         if (arg->num_params !=3D ARRAY_SIZE(params) ||
> > > >             optee->ops->from_msg_param(optee, params, arg->num_para=
ms,
> > > > -                                      arg->params) ||
> > > > +                                      arg->params, false /*!update=
_out*/) ||
> > > >             params[0].attr !=3D TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_OUT=
PUT) {
> > > >                 arg->ret =3D TEEC_ERROR_BAD_PARAMETERS;
> > > >                 return;
> > > > @@ -280,7 +288,8 @@ static void handle_rpc_func_rpmb_probe_reset(st=
ruct tee_context *ctx,
> > > >         params[0].u.value.b =3D 0;
> > > >         params[0].u.value.c =3D 0;
> > > >         if (optee->ops->to_msg_param(optee, arg->params,
> > > > -                                    arg->num_params, params)) {
> > > > +                                    arg->num_params, params,
> > > > +                                    true /*update_out*/)) {
> > > >                 arg->ret =3D TEEC_ERROR_BAD_PARAMETERS;
> > > >                 return;
> > > >         }
> > > > @@ -324,7 +333,7 @@ static void handle_rpc_func_rpmb_probe_next(str=
uct tee_context *ctx,
> > > >
> > > >         if (arg->num_params !=3D ARRAY_SIZE(params) ||
> > > >             optee->ops->from_msg_param(optee, params, arg->num_para=
ms,
> > > > -                                      arg->params) ||
> > > > +                                      arg->params, false /*!update=
_out*/) ||
> > > >             params[0].attr !=3D TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_OUT=
PUT ||
> > > >             params[1].attr !=3D TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OU=
TPUT) {
> > > >                 arg->ret =3D TEEC_ERROR_BAD_PARAMETERS;
> > > > @@ -358,7 +367,8 @@ static void handle_rpc_func_rpmb_probe_next(str=
uct tee_context *ctx,
> > > >         params[0].u.value.b =3D rdev->descr.capacity;
> > > >         params[0].u.value.c =3D rdev->descr.reliable_wr_count;
> > > >         if (optee->ops->to_msg_param(optee, arg->params,
> > > > -                                    arg->num_params, params)) {
> > > > +                                    arg->num_params, params,
> > > > +                                    true /*update_out*/)) {
> > > >                 arg->ret =3D TEEC_ERROR_BAD_PARAMETERS;
> > > >                 return;
> > > >         }
> > > > @@ -384,7 +394,7 @@ static void handle_rpc_func_rpmb_frames(struct =
tee_context *ctx,
> > > >
> > > >         if (arg->num_params !=3D ARRAY_SIZE(params) ||
> > > >             optee->ops->from_msg_param(optee, params, arg->num_para=
ms,
> > > > -                                      arg->params) ||
> > > > +                                      arg->params, false /*!update=
_out*/) ||
> > > >             params[0].attr !=3D TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_IN=
PUT ||
> > > >             params[1].attr !=3D TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OU=
TPUT) {
> > > >                 arg->ret =3D TEEC_ERROR_BAD_PARAMETERS;
> > > > @@ -401,7 +411,8 @@ static void handle_rpc_func_rpmb_frames(struct =
tee_context *ctx,
> > > >                 goto out;
> > > >         }
> > > >         if (optee->ops->to_msg_param(optee, arg->params,
> > > > -                                    arg->num_params, params)) {
> > > > +                                    arg->num_params, params,
> > > > +                                    true /*update_out*/)) {
> > > >                 arg->ret =3D TEEC_ERROR_BAD_PARAMETERS;
> > > >                 goto out;
> > > >         }
> > > > diff --git a/drivers/tee/optee/smc_abi.c b/drivers/tee/optee/smc_ab=
i.c
> > > > index e9456e3e74cc..d1f79947f58a 100644
> > > > --- a/drivers/tee/optee/smc_abi.c
> > > > +++ b/drivers/tee/optee/smc_abi.c
> > > > @@ -81,20 +81,26 @@ static int optee_cpuhp_disable_pcpu_irq(unsigne=
d int cpu)
> > > >   */
> > > >
> > > >  static int from_msg_param_tmp_mem(struct tee_param *p, u32 attr,
> > > > -                                 const struct optee_msg_param *mp)
> > > > +                                 const struct optee_msg_param *mp,
> > > > +                                 bool update_out)
> > > >  {
> > > >         struct tee_shm *shm;
> > > >         phys_addr_t pa;
> > > >         int rc;
> > > >
> > > > +       if (update_out) {
> > > > +               if (attr =3D=3D OPTEE_MSG_ATTR_TYPE_TMEM_INPUT)
> > > > +                       return 0;
> > > > +               goto out;
> > > > +       }
> > > > +
> > > >         p->attr =3D TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT +
> > > >                   attr - OPTEE_MSG_ATTR_TYPE_TMEM_INPUT;
> > > > -       p->u.memref.size =3D mp->u.tmem.size;
> > > >         shm =3D (struct tee_shm *)(unsigned long)mp->u.tmem.shm_ref=
;
> > > >         if (!shm) {
> > > >                 p->u.memref.shm_offs =3D 0;
> > > >                 p->u.memref.shm =3D NULL;
> > > > -               return 0;
> > > > +               goto out;
> > > >         }
> > > >
> > > >         rc =3D tee_shm_get_pa(shm, 0, &pa);
> > > > @@ -103,18 +109,25 @@ static int from_msg_param_tmp_mem(struct tee_=
param *p, u32 attr,
> > > >
> > > >         p->u.memref.shm_offs =3D mp->u.tmem.buf_ptr - pa;
> > > >         p->u.memref.shm =3D shm;
> > > > -
> > > > +out:
> > > > +       p->u.memref.size =3D mp->u.tmem.size;
> > > >         return 0;
> > > >  }
> > > >
> > > >  static void from_msg_param_reg_mem(struct tee_param *p, u32 attr,
> > > > -                                  const struct optee_msg_param *mp=
)
> > > > +                                  const struct optee_msg_param *mp=
,
> > > > +                                  bool update_out)
> > > >  {
> > > >         struct tee_shm *shm;
> > > >
> > > > +       if (update_out) {
> > > > +               if (attr =3D=3D OPTEE_MSG_ATTR_TYPE_RMEM_INPUT)
> > > > +                       return;
> > > > +               goto out;
> > > > +       }
> > > > +
> > > >         p->attr =3D TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT +
> > > >                   attr - OPTEE_MSG_ATTR_TYPE_RMEM_INPUT;
> > > > -       p->u.memref.size =3D mp->u.rmem.size;
> > > >         shm =3D (struct tee_shm *)(unsigned long)mp->u.rmem.shm_ref=
;
> > > >
> > > >         if (shm) {
> > > > @@ -124,6 +137,8 @@ static void from_msg_param_reg_mem(struct tee_p=
aram *p, u32 attr,
> > > >                 p->u.memref.shm_offs =3D 0;
> > > >                 p->u.memref.shm =3D NULL;
> > > >         }
> > > > +out:
> > > > +       p->u.memref.size =3D mp->u.rmem.size;
> > > >  }
> > > >
> > > >  /**
> > > > @@ -133,11 +148,13 @@ static void from_msg_param_reg_mem(struct tee=
_param *p, u32 attr,
> > > >   * @params:    subsystem internal parameter representation
> > > >   * @num_params:        number of elements in the parameter arrays
> > > >   * @msg_params:        OPTEE_MSG parameters
> > > > + * @update_out:        update parameter for output only
> > > >   * Returns 0 on success or <0 on failure
> > > >   */
> > > >  static int optee_from_msg_param(struct optee *optee, struct tee_pa=
ram *params,
> > > >                                 size_t num_params,
> > > > -                               const struct optee_msg_param *msg_p=
arams)
> > > > +                               const struct optee_msg_param *msg_p=
arams,
> > > > +                               bool update_out)
> > > >  {
> > > >         int rc;
> > > >         size_t n;
> > > > @@ -149,25 +166,27 @@ static int optee_from_msg_param(struct optee =
*optee, struct tee_param *params,
> > > >
> > > >                 switch (attr) {
> > > >                 case OPTEE_MSG_ATTR_TYPE_NONE:
> > > > +                       if (update_out)
> > > > +                               break;
> > > >                         p->attr =3D TEE_IOCTL_PARAM_ATTR_TYPE_NONE;
> > > >                         memset(&p->u, 0, sizeof(p->u));
> > > >                         break;
> > > >                 case OPTEE_MSG_ATTR_TYPE_VALUE_INPUT:
> > > >                 case OPTEE_MSG_ATTR_TYPE_VALUE_OUTPUT:
> > > >                 case OPTEE_MSG_ATTR_TYPE_VALUE_INOUT:
> > > > -                       optee_from_msg_param_value(p, attr, mp);
> > > > +                       optee_from_msg_param_value(p, attr, mp, upd=
ate_out);
> > > >                         break;
> > > >                 case OPTEE_MSG_ATTR_TYPE_TMEM_INPUT:
> > > >                 case OPTEE_MSG_ATTR_TYPE_TMEM_OUTPUT:
> > > >                 case OPTEE_MSG_ATTR_TYPE_TMEM_INOUT:
> > > > -                       rc =3D from_msg_param_tmp_mem(p, attr, mp);
> > > > +                       rc =3D from_msg_param_tmp_mem(p, attr, mp, =
update_out);
> > > >                         if (rc)
> > > >                                 return rc;
> > > >                         break;
> > > >                 case OPTEE_MSG_ATTR_TYPE_RMEM_INPUT:
> > > >                 case OPTEE_MSG_ATTR_TYPE_RMEM_OUTPUT:
> > > >                 case OPTEE_MSG_ATTR_TYPE_RMEM_INOUT:
> > > > -                       from_msg_param_reg_mem(p, attr, mp);
> > > > +                       from_msg_param_reg_mem(p, attr, mp, update_=
out);
> > > >                         break;
> > > >
> > > >                 default:
> > > > @@ -178,20 +197,25 @@ static int optee_from_msg_param(struct optee =
*optee, struct tee_param *params,
> > > >  }
> > > >
> > > >  static int to_msg_param_tmp_mem(struct optee_msg_param *mp,
> > > > -                               const struct tee_param *p)
> > > > +                               const struct tee_param *p, bool upd=
ate_out)
> > > >  {
> > > >         int rc;
> > > >         phys_addr_t pa;
> > > >
> > > > +       if (update_out) {
> > > > +               if (p->attr =3D=3D TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF=
_INPUT)
> > > > +                       return 0;
> > > > +               goto out;
> > > > +       }
> > > > +
> > > >         mp->attr =3D OPTEE_MSG_ATTR_TYPE_TMEM_INPUT + p->attr -
> > > >                    TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT;
> > > >
> > > >         mp->u.tmem.shm_ref =3D (unsigned long)p->u.memref.shm;
> > > > -       mp->u.tmem.size =3D p->u.memref.size;
> > > >
> > > >         if (!p->u.memref.shm) {
> > > >                 mp->u.tmem.buf_ptr =3D 0;
> > > > -               return 0;
> > > > +               goto out;
> > > >         }
> > > >
> > > >         rc =3D tee_shm_get_pa(p->u.memref.shm, p->u.memref.shm_offs=
, &pa);
> > > > @@ -201,19 +225,27 @@ static int to_msg_param_tmp_mem(struct optee_=
msg_param *mp,
> > > >         mp->u.tmem.buf_ptr =3D pa;
> > > >         mp->attr |=3D OPTEE_MSG_ATTR_CACHE_PREDEFINED <<
> > > >                     OPTEE_MSG_ATTR_CACHE_SHIFT;
> > > > -
> > > > +out:
> > > > +       mp->u.tmem.size =3D p->u.memref.size;
> > > >         return 0;
> > > >  }
> > > >
> > > >  static int to_msg_param_reg_mem(struct optee_msg_param *mp,
> > > > -                               const struct tee_param *p)
> > > > +                               const struct tee_param *p, bool upd=
ate_out)
> > > >  {
> > > > +       if (update_out) {
> > > > +               if (p->attr =3D=3D TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF=
_INPUT)
> > > > +                       return 0;
> > > > +               goto out;
> > > > +       }
> > > > +
> > > >         mp->attr =3D OPTEE_MSG_ATTR_TYPE_RMEM_INPUT + p->attr -
> > > >                    TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT;
> > > >
> > > >         mp->u.rmem.shm_ref =3D (unsigned long)p->u.memref.shm;
> > > > -       mp->u.rmem.size =3D p->u.memref.size;
> > > >         mp->u.rmem.offs =3D p->u.memref.shm_offs;
> > > > +out:
> > > > +       mp->u.rmem.size =3D p->u.memref.size;
> > > >         return 0;
> > > >  }
> > > >
> > > > @@ -223,11 +255,13 @@ static int to_msg_param_reg_mem(struct optee_=
msg_param *mp,
> > > >   * @msg_params:        OPTEE_MSG parameters
> > > >   * @num_params:        number of elements in the parameter arrays
> > > >   * @params:    subsystem itnernal parameter representation
> > > > + * @update_out:        update parameter for output only
> > > >   * Returns 0 on success or <0 on failure
> > > >   */
> > > >  static int optee_to_msg_param(struct optee *optee,
> > > >                               struct optee_msg_param *msg_params,
> > > > -                             size_t num_params, const struct tee_p=
aram *params)
> > > > +                             size_t num_params, const struct tee_p=
aram *params,
> > > > +                             bool update_out)
> > > >  {
> > > >         int rc;
> > > >         size_t n;
> > > > @@ -238,21 +272,23 @@ static int optee_to_msg_param(struct optee *o=
ptee,
> > > >
> > > >                 switch (p->attr) {
> > > >                 case TEE_IOCTL_PARAM_ATTR_TYPE_NONE:
> > > > +                       if (update_out)
> > > > +                               break;
> > > >                         mp->attr =3D TEE_IOCTL_PARAM_ATTR_TYPE_NONE=
;
> > > >                         memset(&mp->u, 0, sizeof(mp->u));
> > > >                         break;
> > > >                 case TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT:
> > > >                 case TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_OUTPUT:
> > > >                 case TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INOUT:
> > > > -                       optee_to_msg_param_value(mp, p);
> > > > +                       optee_to_msg_param_value(mp, p, update_out)=
;
> > > >                         break;
> > > >                 case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT:
> > > >                 case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT:
> > > >                 case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT:
> > > >                         if (tee_shm_is_dynamic(p->u.memref.shm))
> > > > -                               rc =3D to_msg_param_reg_mem(mp, p);
> > > > +                               rc =3D to_msg_param_reg_mem(mp, p, =
update_out);
> > > >                         else
> > > > -                               rc =3D to_msg_param_tmp_mem(mp, p);
> > > > +                               rc =3D to_msg_param_tmp_mem(mp, p, =
update_out);
> > > >                         if (rc)
> > > >                                 return rc;
> > > >                         break;
> > > > --
> > > > 2.43.0
> > > >

