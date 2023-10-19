Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 087607CFBCB
	for <lists+linux-media@lfdr.de>; Thu, 19 Oct 2023 15:56:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345906AbjJSN4X (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Oct 2023 09:56:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345892AbjJSN4U (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Oct 2023 09:56:20 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEBDC185
        for <linux-media@vger.kernel.org>; Thu, 19 Oct 2023 06:56:15 -0700 (PDT)
Received: from pendragon.ideasonboard.com (aztw-30-b2-v4wan-166917-cust845.vm26.cable.virginm.net [82.37.23.78])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 10C9B25A;
        Thu, 19 Oct 2023 15:56:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1697723766;
        bh=ebAYLmKWWzX8Hl+CJ3IrkrPDgz40wKZMlyswkRh5Jf4=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=kK4TtPFROdA5cvL/u4tgxLRv6cHsHUzjJFFPckZFjb5ymS0CO/x+YmIEFFEe6IdbU
         8LacHlGSD3Ax8xDCXfGecUANjgbhtkKypIOqLBA87QKrR35qoCUBByJOF1iflVo9Ti
         4uS27JQKcetEt5cmPOTHt4fb4Tji3YTJSJ0iOs2E=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20231019082147.384723-5-umang.jain@ideasonboard.com>
References: <20231019082147.384723-1-umang.jain@ideasonboard.com> <20231019082147.384723-5-umang.jain@ideasonboard.com>
Subject: Re: [PATCH v1 4/4] staging: vc04: Convert vchiq_log_trace() to use dynamic debug
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Stefan Wahren <stefan.wahren@i2se.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Dan Carpenter <error27@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Umang Jain <umang.jain@ideasonboard.com>
To:     Umang Jain <umang.jain@ideasonboard.com>,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org, linux-staging@lists.linux.dev
Date:   Thu, 19 Oct 2023 14:56:11 +0100
Message-ID: <169772377126.630990.2608088137462550139@ping.linuxembedded.co.uk>
User-Agent: alot/0.10
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Quoting Umang Jain (2023-10-19 09:21:47)
> Move vchiq_log_trace() custom logging wrapper based on printk
> to use dynamic debug. The log category is dictated by enum
> vchiq_log_category which will become the part of the trace
> string format that will be logged to dynamic debug (for grep).
>=20
> All the vchiq_log_trace() calls are adjusted to use the
> modified wrapper.
>=20
> vchiq_log_dump_mem() doesn't has access to struct device pointer.
> It will be logged to dynamic debug by passing NULL to vchiq_log_trace()
> which shall log it using pr_debug().
>=20
> Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
> ---
>  .../interface/vchiq_arm/vchiq_arm.c           | 45 ++++++++++-------
>  .../interface/vchiq_arm/vchiq_core.c          | 50 +++++++++++--------
>  .../interface/vchiq_arm/vchiq_core.h          |  8 +--
>  .../interface/vchiq_arm/vchiq_dev.c           |  4 +-
>  4 files changed, 64 insertions(+), 43 deletions(-)
>=20
> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.=
c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> index b4d20f9a4e47..61e7e9b0dd2f 100644
> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> @@ -259,7 +259,8 @@ create_pagelist(struct vchiq_instance *instance, char=
 *buf, char __user *ubuf,
>         pagelist =3D dma_alloc_coherent(instance->state->dev, pagelist_si=
ze, &dma_addr,
>                                       GFP_KERNEL);
> =20
> -       vchiq_log_trace(vchiq_arm_log_level, "%s - %pK", __func__, pageli=
st);
> +       vchiq_log_trace(instance->state->dev, VCHIQ_ARM,
> +                       "%s - %pK", __func__, pagelist);
> =20
>         if (!pagelist)
>                 return NULL;
> @@ -410,8 +411,8 @@ free_pagelist(struct vchiq_instance *instance, struct=
 vchiq_pagelist_info *pagel
>         struct page **pages =3D pagelistinfo->pages;
>         unsigned int num_pages =3D pagelistinfo->num_pages;
> =20
> -       vchiq_log_trace(vchiq_arm_log_level, "%s - %pK, %d",
> -                       __func__, pagelistinfo->pagelist, actual);
> +       vchiq_log_trace(instance->state->dev, VCHIQ_ARM,
> +                       "%s - %pK, %d", __func__, pagelistinfo->pagelist,=
 actual);
> =20
>         /*
>          * NOTE: dma_unmap_sg must be called before the
> @@ -717,7 +718,8 @@ int vchiq_initialise(struct vchiq_instance **instance=
_out)
>         ret =3D 0;
> =20
>  failed:
> -       vchiq_log_trace(vchiq_core_log_level, "%s(%p): returning %d", __f=
unc__, instance, ret);
> +       vchiq_log_trace(state->dev, VCHIQ_CORE,
> +                       "%s(%p): returning %d", __func__, instance, ret);
> =20
>         return ret;
>  }
> @@ -750,7 +752,8 @@ int vchiq_shutdown(struct vchiq_instance *instance)
> =20
>         mutex_unlock(&state->mutex);
> =20
> -       vchiq_log_trace(vchiq_core_log_level, "%s(%p): returning %d", __f=
unc__, instance, status);
> +       vchiq_log_trace(state->dev, VCHIQ_CORE,
> +                       "%s(%p): returning %d", __func__, instance, statu=
s);
> =20
>         free_bulk_waiter(instance);
>         kfree(instance);
> @@ -770,7 +773,8 @@ int vchiq_connect(struct vchiq_instance *instance)
>         struct vchiq_state *state =3D instance->state;
> =20
>         if (mutex_lock_killable(&state->mutex)) {
> -               vchiq_log_trace(vchiq_core_log_level, "%s: call to mutex_=
lock failed", __func__);
> +               vchiq_log_trace(state->dev, VCHIQ_CORE,
> +                               "%s: call to mutex_lock failed", __func__=
);
>                 status =3D -EAGAIN;
>                 goto failed;
>         }
> @@ -782,7 +786,8 @@ int vchiq_connect(struct vchiq_instance *instance)
>         mutex_unlock(&state->mutex);
> =20
>  failed:
> -       vchiq_log_trace(vchiq_core_log_level, "%s(%p): returning %d", __f=
unc__, instance, status);
> +       vchiq_log_trace(state->dev, VCHIQ_CORE,
> +                       "%s(%p): returning %d", __func__, instance, statu=
s);
> =20
>         return status;
>  }
> @@ -813,7 +818,8 @@ vchiq_add_service(struct vchiq_instance *instance,
>                 status =3D -EINVAL;
>         }
> =20
> -       vchiq_log_trace(vchiq_core_log_level, "%s(%p): returning %d", __f=
unc__, instance, status);
> +       vchiq_log_trace(state->dev, VCHIQ_CORE,
> +                       "%s(%p): returning %d", __func__, instance, statu=
s);
> =20
>         return status;
>  }
> @@ -844,7 +850,8 @@ vchiq_open_service(struct vchiq_instance *instance,
>         }
> =20
>  failed:
> -       vchiq_log_trace(vchiq_core_log_level, "%s(%p): returning %d", __f=
unc__, instance, status);
> +       vchiq_log_trace(state->dev, VCHIQ_CORE,
> +                       "%s(%p): returning %d", __func__, instance, statu=
s);
> =20
>         return status;
>  }
> @@ -1014,7 +1021,8 @@ add_completion(struct vchiq_instance *instance, enu=
m vchiq_reason reason,
>         while ((insert - instance->completion_remove) >=3D MAX_COMPLETION=
S) {
>                 /* Out of space - wait for the client */
>                 DEBUG_TRACE(SERVICE_CALLBACK_LINE);
> -               vchiq_log_trace(vchiq_arm_log_level, "%s - completion que=
ue full", __func__);
> +               vchiq_log_trace(instance->state->dev, VCHIQ_CORE,
> +                               "%s - completion queue full", __func__);
>                 DEBUG_COUNT(COMPLETION_QUEUE_FULL_COUNT);
>                 if (wait_for_completion_interruptible(&instance->remove_e=
vent)) {
>                         vchiq_log_debug(instance->state->dev, VCHIQ_ARM,
> @@ -1102,7 +1110,7 @@ service_callback(struct vchiq_instance *instance, e=
num vchiq_reason reason,
>         vchiq_service_get(service);
>         rcu_read_unlock();
> =20
> -       vchiq_log_trace(vchiq_arm_log_level,
> +       vchiq_log_trace(service->state->dev, VCHIQ_ARM,
>                         "%s - service %lx(%d,%p), reason %d, header %lx, =
instance %lx, bulk_userdata %lx",
>                         __func__, (unsigned long)user_service, service->l=
ocalport,
>                         user_service->userdata, reason, (unsigned long)he=
ader,
> @@ -1115,7 +1123,8 @@ service_callback(struct vchiq_instance *instance, e=
num vchiq_reason reason,
>                         spin_unlock(&msg_queue_spinlock);
>                         DEBUG_TRACE(SERVICE_CALLBACK_LINE);
>                         DEBUG_COUNT(MSG_QUEUE_FULL_COUNT);
> -                       vchiq_log_trace(vchiq_arm_log_level, "%s - msg qu=
eue full", __func__);
> +                       vchiq_log_trace(service->state->dev, VCHIQ_ARM,
> +                                       "%s - msg queue full", __func__);
>                         /*
>                          * If there is no MESSAGE_AVAILABLE in the comple=
tion
>                          * queue, add one
> @@ -1463,8 +1472,8 @@ vchiq_use_internal(struct vchiq_state *state, struc=
t vchiq_service *service,
>         local_uc =3D ++arm_state->videocore_use_count;
>         ++(*entity_uc);
> =20
> -       vchiq_log_trace(vchiq_susp_log_level, "%s %s count %d, state coun=
t %d", __func__, entity,
> -                       *entity_uc, local_uc);
> +       vchiq_log_trace(state->dev, VCHIQ_SUSPEND, "%s %s count %d, state=
 count %d",
> +                       __func__, entity, *entity_uc, local_uc);
> =20
>         write_unlock_bh(&arm_state->susp_res_lock);
> =20
> @@ -1483,7 +1492,7 @@ vchiq_use_internal(struct vchiq_state *state, struc=
t vchiq_service *service,
>         }
> =20
>  out:
> -       vchiq_log_trace(vchiq_susp_log_level, "%s exit %d", __func__, ret=
);
> +       vchiq_log_trace(state->dev, VCHIQ_SUSPEND, "%s exit %d", __func__=
, ret);
>         return ret;
>  }
> =20
> @@ -1521,14 +1530,14 @@ vchiq_release_internal(struct vchiq_state *state,=
 struct vchiq_service *service)
>         --arm_state->videocore_use_count;
>         --(*entity_uc);
> =20
> -       vchiq_log_trace(vchiq_susp_log_level, "%s %s count %d, state coun=
t %d", __func__, entity,
> -                       *entity_uc, arm_state->videocore_use_count);
> +       vchiq_log_trace(state->dev, VCHIQ_SUSPEND, "%s %s count %d, state=
 count %d",
> +                       __func__, entity, *entity_uc, arm_state->videocor=
e_use_count);
> =20
>  unlock:
>         write_unlock_bh(&arm_state->susp_res_lock);
> =20
>  out:
> -       vchiq_log_trace(vchiq_susp_log_level, "%s exit %d", __func__, ret=
);
> +       vchiq_log_trace(state->dev, VCHIQ_SUSPEND, "%s exit %d", __func__=
, ret);
>         return ret;
>  }
> =20
> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core=
.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
> index 43c900b0729b..fb1a57bb0178 100644
> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
> @@ -467,7 +467,7 @@ make_service_callback(struct vchiq_service *service, =
enum vchiq_reason reason,
>  {
>         int status;
> =20
> -       vchiq_log_trace(vchiq_core_log_level, "%d: callback:%d (%s, %pK, =
%pK)",
> +       vchiq_log_trace(service->state->dev, VCHIQ_CORE, "%d: callback:%d=
 (%s, %pK, %pK)",
>                         service->state->id, service->localport, reason_na=
mes[reason],
>                         header, bulk_userdata);
>         status =3D service->base.callback(service->instance, reason, head=
er, service->handle,
> @@ -771,7 +771,7 @@ process_free_data_message(struct vchiq_state *state, =
u32 *service_found,
>                          * it has dropped below its quota
>                          */
>                         complete(&quota->quota_event);
> -                       vchiq_log_trace(vchiq_core_log_level, "%d: pfq:%d=
 %x@%pK - slot_use->%d",
> +                       vchiq_log_trace(state->dev, VCHIQ_CORE, "%d: pfq:=
%d %x@%pK - slot_use->%d",
>                                         state->id, port, header->size, he=
ader, count - 1);
>                 } else {
>                         vchiq_log_error(state->dev, VCHIQ_CORE,
> @@ -817,7 +817,7 @@ process_free_queue(struct vchiq_state *state, u32 *se=
rvice_found,
>                  */
>                 rmb();
> =20
> -               vchiq_log_trace(vchiq_core_log_level, "%d: pfq %d=3D%pK %=
x %x",
> +               vchiq_log_trace(state->dev, VCHIQ_CORE, "%d: pfq %d=3D%pK=
 %x %x",
>                                 state->id, slot_index, data, local->slot_=
queue_recycle,
>                                 slot_queue_available);
> =20
> @@ -988,7 +988,7 @@ queue_message(struct vchiq_state *state, struct vchiq=
_service *service,
>                        ((tx_end_index !=3D quota->previous_tx_index) &&
>                         (quota->slot_use_count =3D=3D quota->slot_quota))=
) {
>                         spin_unlock(&quota_spinlock);
> -                       vchiq_log_trace(vchiq_core_log_level,
> +                       vchiq_log_trace(state->dev, VCHIQ_CORE,
>                                         "%d: qm:%d %s,%zx - quota stall (=
msg %d, slot %d)",
>                                         state->id, service->localport, ms=
g_type_str(type), size,
>                                         quota->message_use_count, quota->=
slot_use_count);
> @@ -1083,7 +1083,7 @@ queue_message(struct vchiq_state *state, struct vch=
iq_service *service,
>                 spin_unlock(&quota_spinlock);
> =20
>                 if (slot_use_count)
> -                       vchiq_log_trace(vchiq_core_log_level,
> +                       vchiq_log_trace(state->dev, VCHIQ_CORE,
>                                         "%d: qm:%d %s,%zx - slot_use->%d =
(hdr %p)", state->id,
>                                         service->localport, msg_type_str(=
VCHIQ_MSG_TYPE(msgid)),
>                                         size, slot_use_count, header);
> @@ -1219,7 +1219,7 @@ queue_message_sync(struct vchiq_state *state, struc=
t vchiq_service *service,
>                         ? service->base.fourcc
>                         : VCHIQ_MAKE_FOURCC('?', '?', '?', '?');
> =20
> -               vchiq_log_trace(vchiq_sync_log_level,
> +               vchiq_log_trace(state->dev, VCHIQ_SYNC,
>                                 "Sent Sync Msg %s(%u) to %c%c%c%c s:%u d:=
%d len:%d",
>                                 msg_type_str(VCHIQ_MSG_TYPE(msgid)), VCHI=
Q_MSG_TYPE(msgid),
>                                 VCHIQ_FOURCC_AS_4CHARS(svc_fourcc), VCHIQ=
_MSG_SRCPORT(msgid),
> @@ -1313,8 +1313,10 @@ notify_bulks(struct vchiq_service *service, struct=
 vchiq_bulk_queue *queue,
>  {
>         int status =3D 0;
> =20
> -       vchiq_log_trace(vchiq_core_log_level, "%d: nb:%d %cx - p=3D%x rn=
=3D%x r=3D%x", service->state->id,
> -                       service->localport, (queue =3D=3D &service->bulk_=
tx) ? 't' : 'r',
> +       vchiq_log_trace(service->state->dev, VCHIQ_CORE,
> +                       "%d: nb:%d %cx - p=3D%x rn=3D%x r=3D%x",
> +                       service->state->id, service->localport,
> +                       (queue =3D=3D &service->bulk_tx) ? 't' : 'r',
>                         queue->process, queue->remote_notify, queue->remo=
ve);
> =20
>         queue->remote_notify =3D queue->process;
> @@ -1438,9 +1440,11 @@ abort_outstanding_bulks(struct vchiq_service *serv=
ice,
>  {
>         int is_tx =3D (queue =3D=3D &service->bulk_tx);
> =20
> -       vchiq_log_trace(vchiq_core_log_level, "%d: aob:%d %cx - li=3D%x r=
i=3D%x p=3D%x",
> -                       service->state->id, service->localport, is_tx ? '=
t' : 'r',
> -                       queue->local_insert, queue->remote_insert, queue-=
>process);
> +       vchiq_log_trace(service->state->dev, VCHIQ_CORE,
> +                       "%d: aob:%d %cx - li=3D%x ri=3D%x p=3D%x",
> +                       service->state->id, service->localport,
> +                       is_tx ? 't' : 'r', queue->local_insert,
> +                       queue->remote_insert, queue->process);
> =20
>         WARN_ON((int)(queue->local_insert - queue->process) < 0);
>         WARN_ON((int)(queue->remote_insert - queue->process) < 0);
> @@ -1780,7 +1784,7 @@ parse_message(struct vchiq_state *state, struct vch=
iq_header *header)
>                                         state->id, msg_type_str(type), he=
ader, remoteport,
>                                         localport, bulk->actual, &bulk->d=
ata);
> =20
> -                       vchiq_log_trace(vchiq_core_log_level, "%d: prs:%d=
 %cx li=3D%x ri=3D%x p=3D%x",
> +                       vchiq_log_trace(state->dev, VCHIQ_CORE, "%d: prs:=
%d %cx li=3D%x ri=3D%x p=3D%x",
>                                         state->id, localport,
>                                         (type =3D=3D VCHIQ_MSG_BULK_RX_DO=
NE) ? 'r' : 't',
>                                         queue->local_insert, queue->remot=
e_insert, queue->process);
> @@ -1796,12 +1800,12 @@ parse_message(struct vchiq_state *state, struct v=
chiq_header *header)
>                 }
>                 break;
>         case VCHIQ_MSG_PADDING:
> -               vchiq_log_trace(vchiq_core_log_level, "%d: prs PADDING@%p=
K,%x",
> +               vchiq_log_trace(state->dev, VCHIQ_CORE, "%d: prs PADDING@=
%pK,%x",
>                                 state->id, header, size);
>                 break;
>         case VCHIQ_MSG_PAUSE:
>                 /* If initiated, signal the application thread */
> -               vchiq_log_trace(vchiq_core_log_level, "%d: prs PAUSE@%pK,=
%x",
> +               vchiq_log_trace(state->dev, VCHIQ_CORE, "%d: prs PAUSE@%p=
K,%x",
>                                 state->id, header, size);
>                 if (state->conn_state =3D=3D VCHIQ_CONNSTATE_PAUSED) {
>                         vchiq_log_error(state->dev, VCHIQ_CORE,
> @@ -1818,7 +1822,7 @@ parse_message(struct vchiq_state *state, struct vch=
iq_header *header)
>                 vchiq_set_conn_state(state, VCHIQ_CONNSTATE_PAUSED);
>                 break;
>         case VCHIQ_MSG_RESUME:
> -               vchiq_log_trace(vchiq_core_log_level, "%d: prs RESUME@%pK=
,%x",
> +               vchiq_log_trace(state->dev, VCHIQ_CORE, "%d: prs RESUME@%=
pK,%x",
>                                 state->id, header, size);
>                 /* Release the slot mutex */
>                 mutex_unlock(&state->slot_mutex);
> @@ -2059,7 +2063,7 @@ sync_func(void *v)
>                         svc_fourcc =3D service
>                                 ? service->base.fourcc
>                                 : VCHIQ_MAKE_FOURCC('?', '?', '?', '?');
> -                       vchiq_log_trace(vchiq_sync_log_level,
> +                       vchiq_log_trace(state->dev, VCHIQ_SYNC,
>                                         "Rcvd Msg %s from %c%c%c%c s:%d d=
:%d len:%d",
>                                         msg_type_str(type), VCHIQ_FOURCC_=
AS_4CHARS(svc_fourcc),
>                                         remoteport, localport, size);
> @@ -2088,7 +2092,7 @@ sync_func(void *v)
>                         break;
> =20
>                 case VCHIQ_MSG_DATA:
> -                       vchiq_log_trace(vchiq_sync_log_level, "%d: sf DAT=
A@%pK,%x (%d->%d)",
> +                       vchiq_log_trace(state->dev, VCHIQ_SYNC, "%d: sf D=
ATA@%pK,%x (%d->%d)",
>                                         state->id, header, size, remotepo=
rt, localport);
> =20
>                         if ((service->remoteport =3D=3D remoteport) &&
> @@ -3132,7 +3136,7 @@ int vchiq_bulk_transfer(struct vchiq_instance *inst=
ance, unsigned int handle,
>         mutex_unlock(&state->slot_mutex);
>         mutex_unlock(&service->bulk_mutex);
> =20
> -       vchiq_log_trace(vchiq_core_log_level, "%d: bt:%d %cx li=3D%x ri=
=3D%x p=3D%x",
> +       vchiq_log_trace(state->dev, VCHIQ_CORE, "%d: bt:%d %cx li=3D%x ri=
=3D%x p=3D%x",
>                         state->id, service->localport, dir_char, queue->l=
ocal_insert,
>                         queue->remote_insert, queue->process);
> =20
> @@ -3668,10 +3672,16 @@ void vchiq_log_dump_mem(const char *label, u32 ad=
dr, const void *void_mem, size_
>                 }
>                 *s++ =3D '\0';
> =20
> +               /* TODO: Since this is memory dump, it is better suited a=
s debugfs entry only
> +                * and prevent it from getting in dynamic debug log?
> +                *
> +                * In any case, some suggestions are required here.
> +                * Convert to pr_debug() for now.
> +                */


I suspect it depends on how the callers are using this. Will they now
have lines which are off by default, while these memory dumps get
output?

What impact does basing this on top of Stefen Wahrens "[PATCH RFC]
staging: vchiq_arm: move state dump to debugfs" series have here?



>                 if (label && (*label !=3D '\0'))
> -                       vchiq_log_trace(VCHIQ_LOG_TRACE, "%s: %08x: %s", =
label, addr, line_buf);
> +                       vchiq_log_trace(NULL, VCHIQ_CORE, "%s: %08x: %s",=
 label, addr, line_buf);
>                 else
> -                       vchiq_log_trace(VCHIQ_LOG_TRACE, "%08x: %s", addr=
, line_buf);
> +                       vchiq_log_trace(NULL, VCHIQ_CORE, "%s: %08x: %s",=
 label, addr, line_buf);
> =20
>                 addr +=3D 16;
>                 mem +=3D 16;
> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core=
.h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
> index d0682a3e7a46..6f78527774b8 100644
> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
> @@ -77,9 +77,11 @@ static inline const char *log_category_str(enum vchiq_=
log_category c)
>         do { dev_dbg(dev, "%s debug: " fmt, log_category_str(cat), ##__VA=
_ARGS__); } while (0)
>  #endif
>  #ifndef vchiq_log_trace
> -#define vchiq_log_trace(cat, fmt, ...) \
> -       do { if (cat >=3D VCHIQ_LOG_TRACE) \
> -               printk(VCHIQ_LOG_PREFIX fmt "\n", ##__VA_ARGS__); } while=
 (0)
> +#define vchiq_log_trace(dev, cat, fmt, ...) \
> +       do { if (dev !=3D NULL) \
> +               dev_dbg(dev, "%s trace: " fmt, log_category_str(cat), ##_=
_VA_ARGS__); \
> +            else \
> +               pr_debug("%s trace: " fmt, log_category_str(cat), ##__VA_=
ARGS__); } while (0)
>  #endif
> =20
>  #define VCHIQ_SLOT_MASK        (VCHIQ_SLOT_SIZE - 1)
> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c
> index 4aea0a8fca49..f3208ea61e1d 100644
> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c
> @@ -582,7 +582,7 @@ vchiq_ioctl(struct file *file, unsigned int cmd, unsi=
gned long arg)
>         long ret =3D 0;
>         int i, rc;
> =20
> -       vchiq_log_trace(vchiq_arm_log_level,
> +       vchiq_log_trace(instance->state->dev, VCHIQ_ARM,
>                         "%s - instance %pK, cmd %s, arg %lx", __func__, i=
nstance,
>                         ((_IOC_TYPE(cmd) =3D=3D VCHIQ_IOC_MAGIC) && (_IOC=
_NR(cmd) <=3D VCHIQ_IOC_MAX)) ?
>                         ioctl_names[_IOC_NR(cmd)] : "<invalid>", arg);
> @@ -874,7 +874,7 @@ vchiq_ioctl(struct file *file, unsigned int cmd, unsi=
gned long arg)
>                                 instance, (_IOC_NR(cmd) <=3D VCHIQ_IOC_MA=
X) ?
>                                 ioctl_names[_IOC_NR(cmd)] : "<invalid>", =
status, ret);
>         } else {
> -               vchiq_log_trace(vchiq_arm_log_level,
> +               vchiq_log_trace(service->state->dev, VCHIQ_ARM,
>                                 "  ioctl instance %pK, cmd %s -> status %=
d, %ld",
>                                 instance, (_IOC_NR(cmd) <=3D VCHIQ_IOC_MA=
X) ?
>                                 ioctl_names[_IOC_NR(cmd)] : "<invalid>", =
status, ret);
> --=20
> 2.40.1
>
