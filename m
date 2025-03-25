Return-Path: <linux-media+bounces-28648-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5500BA6E966
	for <lists+linux-media@lfdr.de>; Tue, 25 Mar 2025 06:56:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D0AFC16E4FE
	for <lists+linux-media@lfdr.de>; Tue, 25 Mar 2025 05:56:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03E681AB531;
	Tue, 25 Mar 2025 05:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ACi0tCWY"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 522241A5BBE;
	Tue, 25 Mar 2025 05:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742882165; cv=none; b=eugWonmI+rhqQpGQ625PN8A8mibJHxzkBtDNkx0jQxMjqVCy497B9LkbRW6b++BSeO3yOIU5ud+wRu6G+uOA/l/vzi6qcPUMRgimjln9Kgl1fMUaZe95zmiywV6edH+bwrY2V3JE0ic5Kdi/jawFCNCdp+EvPEVuAp0HLD2KSC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742882165; c=relaxed/simple;
	bh=9j22DB61e8MLKocwCu9eFZfZ/VHtm9E70w5QhxAtMuw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R1IONNpZRvZvrH4IWgLqeeRMC0Gz1fYEKKKiLsk0zEiQgUqTDhIeMooiq1ueKPTEJqAQHVLzUmBSlyI/pc8lz1qGlTvbepBprEVPHnw9T7fWXAWdWWV2ZXYqza2VxOURB63DPuFZbRKQkycrQpNtCMbSZV9K3XAP4rO7OWClazM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ACi0tCWY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CD9FC4CEE8;
	Tue, 25 Mar 2025 05:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742882164;
	bh=9j22DB61e8MLKocwCu9eFZfZ/VHtm9E70w5QhxAtMuw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ACi0tCWY9CCPWWBmn4FNu0V3otcA+yUdgkb2YfLA1dKZNHitj6Rn91VN5+oQjSjkZ
	 2D2rSFB84KXVpSP4BSgGuRn6zqpPXyHXLoH5THWaU8J2J02Zpv9CzS91aFVk3Pbn82
	 2Jy3iZN3xBPEIPMnWhG4QmHcmro21enIi4lnzpAOQZwEiYdBkm019YDo57T98VFyNE
	 jhvcWlDV6F4sJk6DXDd43Fv9k8abUhuehltzNBquIMsIagQHOL9B1FWdjVRXxM/uuO
	 kIzxiiv98XSMH9tW5Ea9bmXC0sohW6LW6Tu0ixpNF2dRmCIFg9Bu/mZPNKBf56r7od
	 bZK5SZFYmDyrQ==
Date: Tue, 25 Mar 2025 11:25:54 +0530
From: Sumit Garg <sumit.garg@kernel.org>
To: Jens Wiklander <jens.wiklander@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
	op-tee@lists.trustedfirmware.org,
	linux-arm-kernel@lists.infradead.org,
	Olivier Masse <olivier.masse@nxp.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Yong Wu <yong.wu@mediatek.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>,
	"T . J . Mercier" <tjmercier@google.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	azarrabi@qti.qualcomm.com, Simona Vetter <simona.vetter@ffwll.ch>,
	Daniel Stone <daniel@fooishbar.org>
Subject: Re: [PATCH v6 03/10] optee: account for direction while converting
 parameters
Message-ID: <Z-JFagmbZBQd0hoM@sumit-X1>
References: <20250305130634.1850178-1-jens.wiklander@linaro.org>
 <20250305130634.1850178-4-jens.wiklander@linaro.org>
 <Z9K2RQYuXSJc8Y1E@sumit-X1>
 <CAHUa44H5Zc_POJ_RWaVd4iFVagRkFaN+8Ajs=19FKboZapbQHw@mail.gmail.com>
 <Z9vfD4UWSrqSTPnP@sumit-X1>
 <CAHUa44HY-jZCoDXKnx-f4gBoABRVdh1+6PA1AYHSva9aL=rDAA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHUa44HY-jZCoDXKnx-f4gBoABRVdh1+6PA1AYHSva9aL=rDAA@mail.gmail.com>

On Thu, Mar 20, 2025 at 02:00:57PM +0100, Jens Wiklander wrote:
> Hi Sumit,
> 
> On Thu, Mar 20, 2025 at 10:25 AM Sumit Garg <sumit.garg@kernel.org> wrote:
> >
> > Hi Jens,
> >
> > On Mon, Mar 17, 2025 at 08:42:01AM +0100, Jens Wiklander wrote:
> > > Hi Sumit,
> > >
> > > On Thu, Mar 13, 2025 at 11:41 AM Sumit Garg <sumit.garg@kernel.org> wrote:
> > > >
> > > > Hi Jens,
> > > >
> > > > On Wed, Mar 05, 2025 at 02:04:09PM +0100, Jens Wiklander wrote:
> > > > > The OP-TEE backend driver has two internal function pointers to convert
> > > > > between the subsystem type struct tee_param and the OP-TEE type struct
> > > > > optee_msg_param.
> > > > >
> > > > > The conversion is done from one of the types to the other, which is then
> > > > > involved in some operation and finally converted back to the original
> > > > > type. When converting to prepare the parameters for the operation, all
> > > > > fields must be taken into account, but then converting back, it's enough
> > > > > to update only out-values and out-sizes. So, an update_out parameter is
> > > > > added to the conversion functions to tell if all or only some fields
> > > > > must be copied.
> > > > >
> > > > > This is needed in a later patch where it might get confusing when
> > > > > converting back in from_msg_param() callback since an allocated
> > > > > restricted SHM can be using the sec_world_id of the used restricted
> > > > > memory pool and that doesn't translate back well.
> > > > >
> > > > > Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> > > > > ---
> > > > >  drivers/tee/optee/call.c          | 10 ++--
> > > > >  drivers/tee/optee/ffa_abi.c       | 43 +++++++++++++----
> > > > >  drivers/tee/optee/optee_private.h | 42 +++++++++++------
> > > > >  drivers/tee/optee/rpc.c           | 31 +++++++++----
> > > > >  drivers/tee/optee/smc_abi.c       | 76 +++++++++++++++++++++++--------
> > > > >  5 files changed, 144 insertions(+), 58 deletions(-)
> > > > >
> > > > > diff --git a/drivers/tee/optee/call.c b/drivers/tee/optee/call.c
> > > > > index 16eb953e14bb..f1533b894726 100644
> > > > > --- a/drivers/tee/optee/call.c
> > > > > +++ b/drivers/tee/optee/call.c
> > > > > @@ -400,7 +400,8 @@ int optee_open_session(struct tee_context *ctx,
> > > > >       export_uuid(msg_arg->params[1].u.octets, &client_uuid);
> > > > >
> > > > >       rc = optee->ops->to_msg_param(optee, msg_arg->params + 2,
> > > > > -                                   arg->num_params, param);
> > > > > +                                   arg->num_params, param,
> > > > > +                                   false /*!update_out*/);
> > > > >       if (rc)
> > > > >               goto out;
> > > > >
> > > > > @@ -427,7 +428,8 @@ int optee_open_session(struct tee_context *ctx,
> > > > >       }
> > > > >
> > > > >       if (optee->ops->from_msg_param(optee, param, arg->num_params,
> > > > > -                                    msg_arg->params + 2)) {
> > > > > +                                    msg_arg->params + 2,
> > > > > +                                    true /*update_out*/)) {
> > > > >               arg->ret = TEEC_ERROR_COMMUNICATION;
> > > > >               arg->ret_origin = TEEC_ORIGIN_COMMS;
> > > > >               /* Close session again to avoid leakage */
> > > > > @@ -541,7 +543,7 @@ int optee_invoke_func(struct tee_context *ctx, struct tee_ioctl_invoke_arg *arg,
> > > > >       msg_arg->cancel_id = arg->cancel_id;
> > > > >
> > > > >       rc = optee->ops->to_msg_param(optee, msg_arg->params, arg->num_params,
> > > > > -                                   param);
> > > > > +                                   param, false /*!update_out*/);
> > > > >       if (rc)
> > > > >               goto out;
> > > > >
> > > > > @@ -551,7 +553,7 @@ int optee_invoke_func(struct tee_context *ctx, struct tee_ioctl_invoke_arg *arg,
> > > > >       }
> > > > >
> > > > >       if (optee->ops->from_msg_param(optee, param, arg->num_params,
> > > > > -                                    msg_arg->params)) {
> > > > > +                                    msg_arg->params, true /*update_out*/)) {
> > > > >               msg_arg->ret = TEEC_ERROR_COMMUNICATION;
> > > > >               msg_arg->ret_origin = TEEC_ORIGIN_COMMS;
> > > > >       }
> > > > > diff --git a/drivers/tee/optee/ffa_abi.c b/drivers/tee/optee/ffa_abi.c
> > > > > index 4ca1d5161b82..e4b08cd195f3 100644
> > > > > --- a/drivers/tee/optee/ffa_abi.c
> > > > > +++ b/drivers/tee/optee/ffa_abi.c
> > > > > @@ -122,15 +122,21 @@ static int optee_shm_rem_ffa_handle(struct optee *optee, u64 global_id)
> > > > >   */
> > > > >
> > > > >  static void from_msg_param_ffa_mem(struct optee *optee, struct tee_param *p,
> > > > > -                                u32 attr, const struct optee_msg_param *mp)
> > > > > +                                u32 attr, const struct optee_msg_param *mp,
> > > > > +                                bool update_out)
> > > > >  {
> > > > >       struct tee_shm *shm = NULL;
> > > > >       u64 offs_high = 0;
> > > > >       u64 offs_low = 0;
> > > > >
> > > > > +     if (update_out) {
> > > > > +             if (attr == OPTEE_MSG_ATTR_TYPE_FMEM_INPUT)
> > > > > +                     return;
> > > > > +             goto out;
> > > > > +     }
> > > > > +
> > > > >       p->attr = TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT +
> > > > >                 attr - OPTEE_MSG_ATTR_TYPE_FMEM_INPUT;
> > > > > -     p->u.memref.size = mp->u.fmem.size;
> > > > >
> > > > >       if (mp->u.fmem.global_id != OPTEE_MSG_FMEM_INVALID_GLOBAL_ID)
> > > > >               shm = optee_shm_from_ffa_handle(optee, mp->u.fmem.global_id);
> > > > > @@ -141,6 +147,8 @@ static void from_msg_param_ffa_mem(struct optee *optee, struct tee_param *p,
> > > > >               offs_high = mp->u.fmem.offs_high;
> > > > >       }
> > > > >       p->u.memref.shm_offs = offs_low | offs_high << 32;
> > > > > +out:
> > > > > +     p->u.memref.size = mp->u.fmem.size;
> > > > >  }
> > > > >
> > > > >  /**
> > > > > @@ -150,12 +158,14 @@ static void from_msg_param_ffa_mem(struct optee *optee, struct tee_param *p,
> > > > >   * @params:  subsystem internal parameter representation
> > > > >   * @num_params:      number of elements in the parameter arrays
> > > > >   * @msg_params:      OPTEE_MSG parameters
> > > > > + * @update_out: update parameter for output only
> > > > >   *
> > > > >   * Returns 0 on success or <0 on failure
> > > > >   */
> > > > >  static int optee_ffa_from_msg_param(struct optee *optee,
> > > > >                                   struct tee_param *params, size_t num_params,
> > > > > -                                 const struct optee_msg_param *msg_params)
> > > > > +                                 const struct optee_msg_param *msg_params,
> > > > > +                                 bool update_out)
> > > > >  {
> > > > >       size_t n;
> > > > >
> > > > > @@ -166,18 +176,20 @@ static int optee_ffa_from_msg_param(struct optee *optee,
> > > > >
> > > > >               switch (attr) {
> > > > >               case OPTEE_MSG_ATTR_TYPE_NONE:
> > > > > +                     if (update_out)
> > > > > +                             break;
> > > > >                       p->attr = TEE_IOCTL_PARAM_ATTR_TYPE_NONE;
> > > > >                       memset(&p->u, 0, sizeof(p->u));
> > > > >                       break;
> > > > >               case OPTEE_MSG_ATTR_TYPE_VALUE_INPUT:
> > > > >               case OPTEE_MSG_ATTR_TYPE_VALUE_OUTPUT:
> > > > >               case OPTEE_MSG_ATTR_TYPE_VALUE_INOUT:
> > > > > -                     optee_from_msg_param_value(p, attr, mp);
> > > > > +                     optee_from_msg_param_value(p, attr, mp, update_out);
> > > > >                       break;
> > > > >               case OPTEE_MSG_ATTR_TYPE_FMEM_INPUT:
> > > > >               case OPTEE_MSG_ATTR_TYPE_FMEM_OUTPUT:
> > > > >               case OPTEE_MSG_ATTR_TYPE_FMEM_INOUT:
> > > > > -                     from_msg_param_ffa_mem(optee, p, attr, mp);
> > > > > +                     from_msg_param_ffa_mem(optee, p, attr, mp, update_out);
> > > > >                       break;
> > > > >               default:
> > > > >                       return -EINVAL;
> > > > > @@ -188,10 +200,16 @@ static int optee_ffa_from_msg_param(struct optee *optee,
> > > > >  }
> > > > >
> > > > >  static int to_msg_param_ffa_mem(struct optee_msg_param *mp,
> > > > > -                             const struct tee_param *p)
> > > > > +                             const struct tee_param *p, bool update_out)
> > > > >  {
> > > > >       struct tee_shm *shm = p->u.memref.shm;
> > > > >
> > > > > +     if (update_out) {
> > > > > +             if (p->attr == TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT)
> > > > > +                     return 0;
> > > > > +             goto out;
> > > > > +     }
> > > > > +
> > > > >       mp->attr = OPTEE_MSG_ATTR_TYPE_FMEM_INPUT + p->attr -
> > > > >                  TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT;
> > > > >
> > > > > @@ -211,6 +229,7 @@ static int to_msg_param_ffa_mem(struct optee_msg_param *mp,
> > > > >               memset(&mp->u, 0, sizeof(mp->u));
> > > > >               mp->u.fmem.global_id = OPTEE_MSG_FMEM_INVALID_GLOBAL_ID;
> > > > >       }
> > > > > +out:
> > > > >       mp->u.fmem.size = p->u.memref.size;
> > > > >
> > > > >       return 0;
> > > > > @@ -222,13 +241,15 @@ static int to_msg_param_ffa_mem(struct optee_msg_param *mp,
> > > > >   * @optee:   main service struct
> > > > >   * @msg_params:      OPTEE_MSG parameters
> > > > >   * @num_params:      number of elements in the parameter arrays
> > > > > - * @params:  subsystem itnernal parameter representation
> > > > > + * @params:  subsystem internal parameter representation
> > > > > + * @update_out: update parameter for output only
> > > > >   * Returns 0 on success or <0 on failure
> > > > >   */
> > > > >  static int optee_ffa_to_msg_param(struct optee *optee,
> > > > >                                 struct optee_msg_param *msg_params,
> > > > >                                 size_t num_params,
> > > > > -                               const struct tee_param *params)
> > > > > +                               const struct tee_param *params,
> > > > > +                               bool update_out)
> > > > >  {
> > > > >       size_t n;
> > > > >
> > > > > @@ -238,18 +259,20 @@ static int optee_ffa_to_msg_param(struct optee *optee,
> > > > >
> > > > >               switch (p->attr) {
> > > > >               case TEE_IOCTL_PARAM_ATTR_TYPE_NONE:
> > > > > +                     if (update_out)
> > > > > +                             break;
> > > > >                       mp->attr = TEE_IOCTL_PARAM_ATTR_TYPE_NONE;
> > > > >                       memset(&mp->u, 0, sizeof(mp->u));
> > > > >                       break;
> > > > >               case TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT:
> > > > >               case TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_OUTPUT:
> > > > >               case TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INOUT:
> > > > > -                     optee_to_msg_param_value(mp, p);
> > > > > +                     optee_to_msg_param_value(mp, p, update_out);
> > > > >                       break;
> > > > >               case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT:
> > > > >               case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT:
> > > > >               case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT:
> > > > > -                     if (to_msg_param_ffa_mem(mp, p))
> > > > > +                     if (to_msg_param_ffa_mem(mp, p, update_out))
> > > > >                               return -EINVAL;
> > > > >                       break;
> > > > >               default:
> > > >
> > > > Can we rather handle it as follows to improve code readability and
> > > > maintainence long term? Ditto for all other places.
> > > >
> > > > static int optee_ffa_to_msg_param(struct optee *optee,
> > > >                                   struct optee_msg_param *msg_params,
> > > >                                   size_t num_params,
> > > >                                   const struct tee_param *params,
> > > >                                   bool update_out)
> > > > {
> > > >         size_t n;
> > > >
> > > >         for (n = 0; n < num_params; n++) {
> > > >                 const struct tee_param *p = params + n;
> > > >                 struct optee_msg_param *mp = msg_params + n;
> > > >
> > > >                 if (update_out && (p->attr == TEE_IOCTL_PARAM_ATTR_TYPE_NONE ||
> > > >                      p->attr == TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT ||
> > > >                      p->attr == TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT))
> > > >                     continue;
> > >
> > > You're missing updating the length field for memrefs.
> > >
> >
> > Do we need to update length field for input memrefs when update_out is
> > set? I don't see that happening in your existing patch too.
> 
> I'm sorry, I was unclear. The update_out parameter means only the
> output fields should be updated, not the attribute, offsets, ids, etc.
> That is, the length field for memrefs, and the value fields a, b, c
> for value params. Some of the memrefs aren't translated one-to-one
> with SDP, but the length field can and must be updated.

Isn't it rather better to add another attribute type to handled SDP
special handling?

-Sumit

> 
> Cheers,
> Jens
> 
> >
> > -Sumit
> >
> > > Cheers,
> > > Jens
> > >
> > > >
> > > >                 switch (p->attr) {
> > > >                 case TEE_IOCTL_PARAM_ATTR_TYPE_NONE:
> > > >                         mp->attr = TEE_IOCTL_PARAM_ATTR_TYPE_NONE;
> > > >                         memset(&mp->u, 0, sizeof(mp->u));
> > > >                         break;
> > > >                 case TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT:
> > > >                 case TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_OUTPUT:
> > > >                 case TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INOUT:
> > > >                         optee_to_msg_param_value(mp, p);
> > > >                         break;
> > > >                 case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT:
> > > >                 case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT:
> > > >                 case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT:
> > > >                         if (to_msg_param_ffa_mem(mp, p))
> > > >                                 return -EINVAL;
> > > >                         break;
> > > >                 default:
> > > >                         return -EINVAL;
> > > >                 }
> > > >         }
> > > >
> > > >         return 0;
> > > > }
> > > >
> > > > -Sumit

