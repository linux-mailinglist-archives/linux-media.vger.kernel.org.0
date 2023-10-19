Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7D6FE7CFB14
	for <lists+linux-media@lfdr.de>; Thu, 19 Oct 2023 15:32:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345619AbjJSNc6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Oct 2023 09:32:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235350AbjJSNc5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Oct 2023 09:32:57 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2AFC11D
        for <linux-media@vger.kernel.org>; Thu, 19 Oct 2023 06:32:50 -0700 (PDT)
Received: from pendragon.ideasonboard.com (aztw-30-b2-v4wan-166917-cust845.vm26.cable.virginm.net [82.37.23.78])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D161F25A;
        Thu, 19 Oct 2023 15:32:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1697722360;
        bh=316bzbTx/YYefGCH73PiL5Z3YruHqG1LCOFVIVhhWkY=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=L4og1ZTiKxsqzAPulAX3ugXqCn5dG5dxYxPshGksW+00SKPH8kZwa9soZEZno7UCe
         HbtUT4kAeCw8cfSmqCV26/dZ6o8Yv1Kl/vGlNwXOjGSUBNn3nJt3P9GZO6TiZ/dJag
         3DQ2mF5yNxLTCywYKshv004YGV/5OLPAJmHPvzZs=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20231019082147.384723-2-umang.jain@ideasonboard.com>
References: <20231019082147.384723-1-umang.jain@ideasonboard.com> <20231019082147.384723-2-umang.jain@ideasonboard.com>
Subject: Re: [PATCH v1 1/4] staging: vc04: Convert vchiq_log_error() to use dynamic debug
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
Date:   Thu, 19 Oct 2023 14:32:46 +0100
Message-ID: <169772236651.630990.9262062665932600878@ping.linuxembedded.co.uk>
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

Quoting Umang Jain (2023-10-19 09:21:44)
> Move vchiq_log_error() custom logging wrapper based on printk,
> to use dynamic debug. To categorise, enum vchiq_log_category
> has been introduced, which will become the part of the error
> string format that will be logged to dynamic debug (for grep).
>=20
> All the vchiq_log_error() calls are adjusted to use the
> dynamic debug wrapper. vchiq_loud_error_*() has been removed
> as a part of this patch and replaced with dev_err (so that
> they directly end up in kernel log, even if dynamic debug
> isn't enabled), which serves the purpose.

So far that looks quite reasonable to me. They all look like they are
'real error' messages indeed.


>=20
> For cases where struct device pointer `dev` is not available,
> NULL can be passed to vchiq_log_error() to log to dynamic debug
> using pr_debug().

That sounds reasonable.

I see two uses below. Maybe they could be inlined, but this way keeps
the category strings which may help a developer when grepping...



>=20
> Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
> ---
>  .../interface/vchiq_arm/vchiq_arm.c           |  36 ++++---
>  .../interface/vchiq_arm/vchiq_connected.c     |   2 +-
>  .../interface/vchiq_arm/vchiq_core.c          | 100 +++++++-----------
>  .../interface/vchiq_arm/vchiq_core.h          |  33 ++++--
>  .../interface/vchiq_arm/vchiq_dev.c           |  14 +--
>  5 files changed, 91 insertions(+), 94 deletions(-)
>=20
> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.=
c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> index eef9c8c06e66..fa4463bfc117 100644
> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> @@ -690,7 +690,8 @@ int vchiq_initialise(struct vchiq_instance **instance=
_out)
>                 usleep_range(500, 600);
>         }
>         if (i =3D=3D VCHIQ_INIT_RETRIES) {
> -               vchiq_log_error(vchiq_core_log_level, "%s: videocore not =
initialized\n", __func__);
> +               vchiq_log_error(state->dev, VCHIQ_CORE, "%s: videocore no=
t initialized\n",
> +                               __func__);
>                 ret =3D -ENOTCONN;
>                 goto failed;
>         } else if (i > 0) {
> @@ -700,7 +701,7 @@ int vchiq_initialise(struct vchiq_instance **instance=
_out)
> =20
>         instance =3D kzalloc(sizeof(*instance), GFP_KERNEL);
>         if (!instance) {
> -               vchiq_log_error(vchiq_core_log_level,
> +               vchiq_log_error(state->dev, VCHIQ_CORE,
>                                 "%s: error allocating vchiq instance\n", =
__func__);
>                 ret =3D -ENOMEM;
>                 goto failed;
> @@ -966,7 +967,8 @@ vchiq_blocking_bulk_transfer(struct vchiq_instance *i=
nstance, unsigned int handl
>         } else {
>                 waiter =3D kzalloc(sizeof(*waiter), GFP_KERNEL);
>                 if (!waiter) {
> -                       vchiq_log_error(vchiq_core_log_level, "%s - out o=
f memory", __func__);
> +                       vchiq_log_error(service->state->dev, VCHIQ_CORE,
> +                                       "%s - out of memory", __func__);
>                         return -ENOMEM;
>                 }
>         }
> @@ -1333,7 +1335,8 @@ vchiq_keepalive_vchiq_callback(struct vchiq_instanc=
e *instance,
>                                struct vchiq_header *header,
>                                unsigned int service_user, void *bulk_user)
>  {
> -       vchiq_log_error(vchiq_susp_log_level, "%s callback reason %d", __=
func__, reason);
> +       vchiq_log_error(instance->state->dev, VCHIQ_SUSPEND,
> +                       "%s callback reason %d", __func__, reason);
>         return 0;
>  }
> =20
> @@ -1357,22 +1360,22 @@ vchiq_keepalive_thread_func(void *v)
> =20
>         ret =3D vchiq_initialise(&instance);
>         if (ret) {
> -               vchiq_log_error(vchiq_susp_log_level, "%s vchiq_initialis=
e failed %d", __func__,
> -                               ret);
> +               vchiq_log_error(state->dev, VCHIQ_SUSPEND,
> +                               "%s vchiq_initialise failed %d", __func__=
, ret);
>                 goto exit;
>         }
> =20
>         status =3D vchiq_connect(instance);
>         if (status) {
> -               vchiq_log_error(vchiq_susp_log_level, "%s vchiq_connect f=
ailed %d", __func__,
> -                               status);
> +               vchiq_log_error(state->dev, VCHIQ_SUSPEND,
> +                               "%s vchiq_connect failed %d", __func__, s=
tatus);
>                 goto shutdown;
>         }
> =20
>         status =3D vchiq_add_service(instance, &params, &ka_handle);
>         if (status) {
> -               vchiq_log_error(vchiq_susp_log_level, "%s vchiq_open_serv=
ice failed %d", __func__,
> -                               status);
> +               vchiq_log_error(state->dev, VCHIQ_SUSPEND,
> +                               "%s vchiq_open_service failed %d", __func=
__, status);
>                 goto shutdown;
>         }
> =20
> @@ -1380,7 +1383,8 @@ vchiq_keepalive_thread_func(void *v)
>                 long rc =3D 0, uc =3D 0;
> =20
>                 if (wait_for_completion_interruptible(&arm_state->ka_evt)=
) {
> -                       vchiq_log_error(vchiq_susp_log_level, "%s interru=
pted", __func__);
> +                       vchiq_log_error(state->dev, VCHIQ_SUSPEND,
> +                                       "%s interrupted", __func__);
>                         flush_signals(current);
>                         continue;
>                 }
> @@ -1400,14 +1404,14 @@ vchiq_keepalive_thread_func(void *v)
>                         atomic_inc(&arm_state->ka_use_ack_count);
>                         status =3D vchiq_use_service(instance, ka_handle);
>                         if (status) {
> -                               vchiq_log_error(vchiq_susp_log_level,
> +                               vchiq_log_error(state->dev, VCHIQ_SUSPEND,
>                                                 "%s vchiq_use_service err=
or %d", __func__, status);
>                         }
>                 }
>                 while (rc--) {
>                         status =3D vchiq_release_service(instance, ka_han=
dle);
>                         if (status) {
> -                               vchiq_log_error(vchiq_susp_log_level,
> +                               vchiq_log_error(state->dev, VCHIQ_SUSPEND,
>                                                 "%s vchiq_release_service=
 error %d", __func__,
>                                                 status);
>                         }
> @@ -1444,7 +1448,7 @@ vchiq_use_internal(struct vchiq_state *state, struc=
t vchiq_service *service,
>                         service->client_id);
>                 entity_uc =3D &service->service_use_count;
>         } else {
> -               vchiq_log_error(vchiq_susp_log_level, "%s null service pt=
r", __func__);
> +               vchiq_log_error(state->dev, VCHIQ_SUSPEND, "%s null servi=
ce ptr", __func__);
>                 ret =3D -EINVAL;
>                 goto out;
>         }
> @@ -1725,7 +1729,7 @@ vchiq_check_service(struct vchiq_service *service)
>         read_unlock_bh(&arm_state->susp_res_lock);
> =20
>         if (ret) {
> -               vchiq_log_error(vchiq_susp_log_level,
> +               vchiq_log_error(service->state->dev, VCHIQ_SUSPEND,
>                                 "%s ERROR - %c%c%c%c:%d service count %d,=
 state count %d", __func__,
>                                 VCHIQ_FOURCC_AS_4CHARS(service->base.four=
cc), service->client_id,
>                                 service->service_use_count, arm_state->vi=
deocore_use_count);
> @@ -1761,7 +1765,7 @@ void vchiq_platform_conn_state_changed(struct vchiq=
_state *state,
>                                               (void *)state,
>                                               threadname);
>         if (IS_ERR(arm_state->ka_thread)) {
> -               vchiq_log_error(vchiq_susp_log_level,
> +               vchiq_log_error(state->dev, VCHIQ_SUSPEND,
>                                 "vchiq: FATAL: couldn't create thread %s",
>                                 threadname);
>         } else {
> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_conn=
ected.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected=
.c
> index bdb0ab617d8b..b3928bd8c9c6 100644
> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.c
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.c
> @@ -39,7 +39,7 @@ void vchiq_add_connected_callback(void (*callback)(void=
))
>                 callback();
>         } else {
>                 if (g_num_deferred_callbacks >=3D MAX_CALLBACKS) {
> -                       vchiq_log_error(vchiq_core_log_level,
> +                       vchiq_log_error(NULL, VCHIQ_CORE,
>                                         "There already %d callback regist=
ered - please increase MAX_CALLBACKS",
>                                         g_num_deferred_callbacks);

Aha, here's a second use where we don't have access to a dev pointer.

>                 } else {
> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core=
.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
> index 596894338cb4..f6032c6022cb 100644
> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
> @@ -751,7 +751,7 @@ process_free_data_message(struct vchiq_state *state, =
u32 *service_found,
>                  */
>                 complete(&quota->quota_event);
>         } else if (count =3D=3D 0) {
> -               vchiq_log_error(vchiq_core_log_level,
> +               vchiq_log_error(state->dev, VCHIQ_CORE,
>                                 "service %d message_use_count=3D%d (heade=
r %pK, msgid %x, header->msgid %x, header->size %x)",
>                                 port, quota->message_use_count, header, m=
sgid, header->msgid,
>                                 header->size);
> @@ -776,7 +776,7 @@ process_free_data_message(struct vchiq_state *state, =
u32 *service_found,
>                         vchiq_log_trace(vchiq_core_log_level, "%d: pfq:%d=
 %x@%pK - slot_use->%d",
>                                         state->id, port, header->size, he=
ader, count - 1);
>                 } else {
> -                       vchiq_log_error(vchiq_core_log_level,
> +                       vchiq_log_error(state->dev, VCHIQ_CORE,
>                                         "service %d slot_use_count=3D%d (=
header %pK, msgid %x, header->msgid %x, header->size %x)",
>                                         port, count, header, msgid, heade=
r->msgid, header->size);
>                         WARN(1, "bad slot use count\n");
> @@ -841,7 +841,7 @@ process_free_queue(struct vchiq_state *state, u32 *se=
rvice_found,
> =20
>                         pos +=3D calc_stride(header->size);
>                         if (pos > VCHIQ_SLOT_SIZE) {
> -                               vchiq_log_error(vchiq_core_log_level,
> +                               vchiq_log_error(state->dev, VCHIQ_CORE,
>                                                 "pfq - pos %x: header %pK=
, msgid %x, header->msgid %x, header->size %x",
>                                                 pos, header, msgid, heade=
r->msgid, header->size);
>                                 WARN(1, "invalid slot position\n");
> @@ -1178,7 +1178,7 @@ queue_message_sync(struct vchiq_state *state, struc=
t vchiq_service *service,
>                 int oldmsgid =3D header->msgid;
> =20
>                 if (oldmsgid !=3D VCHIQ_MSGID_PADDING)
> -                       vchiq_log_error(vchiq_core_log_level, "%d: qms - =
msgid %x, not PADDING",
> +                       vchiq_log_error(state->dev, VCHIQ_CORE, "%d: qms =
- msgid %x, not PADDING",
>                                         state->id, oldmsgid);
>         }
> =20
> @@ -1512,11 +1512,9 @@ parse_open(struct vchiq_state *state, struct vchiq=
_header *header)
> =20
>         if ((service->version < version_min) || (version < service->versi=
on_min)) {
>                 /* Version mismatch */
> -               vchiq_loud_error_header();
> -               vchiq_loud_error("%d: service %d (%c%c%c%c) version misma=
tch - local (%d, min %d) vs. remote (%d, min %d)",
> -                                state->id, service->localport, VCHIQ_FOU=
RCC_AS_4CHARS(fourcc),
> -                                service->version, service->version_min, =
version, version_min);
> -               vchiq_loud_error_footer();
> +               dev_err(state->dev, "%d: service %d (%c%c%c%c) version mi=
smatch - local (%d, min %d) vs. remote (%d, min %d)",
> +                       state->id, service->localport, VCHIQ_FOURCC_AS_4C=
HARS(fourcc),
> +                       service->version, service->version_min, version, =
version_min);
>                 vchiq_service_put(service);
>                 service =3D NULL;
>                 goto fail_open;
> @@ -1631,7 +1629,7 @@ parse_message(struct vchiq_state *state, struct vch=
iq_header *header)
>                 }
> =20
>                 if (!service) {
> -                       vchiq_log_error(vchiq_core_log_level,
> +                       vchiq_log_error(state->dev, VCHIQ_CORE,
>                                         "%d: prs %s@%pK (%d->%d) - invali=
d/closed service %d",
>                                         state->id, msg_type_str(type), he=
ader, remoteport,
>                                         localport, localport);
> @@ -1658,7 +1656,7 @@ parse_message(struct vchiq_state *state, struct vch=
iq_header *header)
> =20
>         if (((unsigned long)header & VCHIQ_SLOT_MASK) +
>             calc_stride(size) > VCHIQ_SLOT_SIZE) {
> -               vchiq_log_error(vchiq_core_log_level,
> +               vchiq_log_error(state->dev, VCHIQ_CORE,
>                                 "header %pK (msgid %x) - size %x too big =
for slot",
>                                 header, (unsigned int)msgid, (unsigned in=
t)size);
>                 WARN(1, "oversized for slot\n");
> @@ -1685,7 +1683,7 @@ parse_message(struct vchiq_state *state, struct vch=
iq_header *header)
>                         set_service_state(service, VCHIQ_SRVSTATE_OPEN);
>                         complete(&service->remove_event);
>                 } else {
> -                       vchiq_log_error(vchiq_core_log_level, "OPENACK re=
ceived in state %s",
> +                       vchiq_log_error(state->dev, VCHIQ_CORE, "OPENACK =
received in state %s",
>                                         srvstate_names[service->srvstate]=
);
>                 }
>                 break;
> @@ -1756,7 +1754,7 @@ parse_message(struct vchiq_state *state, struct vch=
iq_header *header)
>                         }
>                         if ((int)(queue->remote_insert -
>                                 queue->local_insert) >=3D 0) {
> -                               vchiq_log_error(vchiq_core_log_level,
> +                               vchiq_log_error(state->dev, VCHIQ_CORE,
>                                                 "%d: prs %s@%pK (%d->%d) =
unexpected (ri=3D%d,li=3D%d)",
>                                                 state->id, msg_type_str(t=
ype), header, remoteport,
>                                                 localport, queue->remote_=
insert,
> @@ -1805,8 +1803,8 @@ parse_message(struct vchiq_state *state, struct vch=
iq_header *header)
>                 vchiq_log_trace(vchiq_core_log_level, "%d: prs PAUSE@%pK,=
%x",
>                                 state->id, header, size);
>                 if (state->conn_state =3D=3D VCHIQ_CONNSTATE_PAUSED) {
> -                       vchiq_log_error(vchiq_core_log_level, "%d: PAUSE =
received in state PAUSED",
> -                                       state->id);
> +                       vchiq_log_error(state->dev, VCHIQ_CORE,
> +                                       "%d: PAUSE received in state PAUS=
ED", state->id);
>                         break;
>                 }
>                 if (state->conn_state !=3D VCHIQ_CONNSTATE_PAUSE_SENT) {
> @@ -1836,7 +1834,7 @@ parse_message(struct vchiq_state *state, struct vch=
iq_header *header)
>                 break;
> =20
>         default:
> -               vchiq_log_error(vchiq_core_log_level, "%d: prs invalid ms=
gid %x@%pK,%x",
> +               vchiq_log_error(state->dev, VCHIQ_CORE, "%d: prs invalid =
msgid %x@%pK,%x",
>                                 state->id, msgid, header, size);
>                 WARN(1, "invalid message\n");
>                 break;
> @@ -1947,7 +1945,7 @@ handle_poll(struct vchiq_state *state)
>                          * since the PAUSE should have flushed
>                          * through outstanding messages.
>                          */
> -                       vchiq_log_error(vchiq_core_log_level, "Failed to =
send RESUME message");
> +                       vchiq_log_error(state->dev, VCHIQ_CORE, "Failed t=
o send RESUME message");
>                 }
>                 break;
>         default:
> @@ -2046,7 +2044,7 @@ sync_func(void *v)
>                 service =3D find_service_by_port(state, localport);
> =20
>                 if (!service) {
> -                       vchiq_log_error(vchiq_sync_log_level,
> +                       vchiq_log_error(state->dev, VCHIQ_SYNC,
>                                         "%d: sf %s@%pK (%d->%d) - invalid=
/closed service %d",
>                                         state->id, msg_type_str(type), he=
ader,
>                                         remoteport, localport, localport);
> @@ -2096,14 +2094,14 @@ sync_func(void *v)
>                             (service->srvstate =3D=3D VCHIQ_SRVSTATE_OPEN=
SYNC)) {
>                                 if (make_service_callback(service, VCHIQ_=
MESSAGE_AVAILABLE, header,
>                                                           NULL) =3D=3D -E=
AGAIN)
> -                                       vchiq_log_error(vchiq_sync_log_le=
vel,
> +                                       vchiq_log_error(state->dev, VCHIQ=
_SYNC,
>                                                         "synchronous call=
back to service %d returns -EAGAIN",
>                                                         localport);
>                         }
>                         break;
> =20
>                 default:
> -                       vchiq_log_error(vchiq_sync_log_level, "%d: sf une=
xpected msgid %x@%pK,%x",
> +                       vchiq_log_error(state->dev, VCHIQ_SYNC, "%d: sf u=
nexpected msgid %x@%pK,%x",
>                                         state->id, msgid, header, size);
>                         release_message_sync(state, header);
>                         break;
> @@ -2137,7 +2135,7 @@ vchiq_init_slots(void *mem_base, int mem_size)
>         num_slots -=3D first_data_slot;
> =20
>         if (num_slots < 4) {
> -               vchiq_log_error(vchiq_core_log_level, "%s - insufficient =
memory %x bytes",
> +               vchiq_log_error(NULL, VCHIQ_CORE, "%s - insufficient memo=
ry %x bytes",
>                                 __func__, mem_size);

Is this the only call without a 'dev' pointer?
I wonder if this could just as easily be a pr_error directly.
  <edit - no it's not the only one>

>                 return NULL;
>         }
> @@ -2174,12 +2172,11 @@ vchiq_init_state(struct vchiq_state *state, struc=
t vchiq_slot_zero *slot_zero, s
>         remote =3D &slot_zero->master;
> =20
>         if (local->initialised) {
> -               vchiq_loud_error_header();
>                 if (remote->initialised)
> -                       vchiq_loud_error("local state has already been in=
itialised");
> +                       dev_err(dev, "local state has already been initia=
lised\n");
>                 else
> -                       vchiq_loud_error("master/slave mismatch two slave=
s");
> -               vchiq_loud_error_footer();
> +                       dev_err(dev, "master/slave mismatch two slaves\n"=
);
> +
>                 return -EINVAL;
>         }
> =20
> @@ -2257,9 +2254,7 @@ vchiq_init_state(struct vchiq_state *state, struct =
vchiq_slot_zero *slot_zero, s
>         state->slot_handler_thread =3D kthread_create(&slot_handler_func,=
 (void *)state, threadname);
> =20
>         if (IS_ERR(state->slot_handler_thread)) {
> -               vchiq_loud_error_header();
> -               vchiq_loud_error("couldn't create thread %s", threadname);
> -               vchiq_loud_error_footer();
> +               dev_err(state->dev, "couldn't create thread %s\n", thread=
name);
>                 return PTR_ERR(state->slot_handler_thread);
>         }
>         set_user_nice(state->slot_handler_thread, -19);
> @@ -2267,9 +2262,7 @@ vchiq_init_state(struct vchiq_state *state, struct =
vchiq_slot_zero *slot_zero, s
>         snprintf(threadname, sizeof(threadname), "vchiq-recy/%d", state->=
id);
>         state->recycle_thread =3D kthread_create(&recycle_func, (void *)s=
tate, threadname);
>         if (IS_ERR(state->recycle_thread)) {
> -               vchiq_loud_error_header();
> -               vchiq_loud_error("couldn't create thread %s", threadname);
> -               vchiq_loud_error_footer();
> +               dev_err(state->dev, "couldn't create thread %s\n", thread=
name);
>                 ret =3D PTR_ERR(state->recycle_thread);
>                 goto fail_free_handler_thread;
>         }
> @@ -2278,9 +2271,7 @@ vchiq_init_state(struct vchiq_state *state, struct =
vchiq_slot_zero *slot_zero, s
>         snprintf(threadname, sizeof(threadname), "vchiq-sync/%d", state->=
id);
>         state->sync_thread =3D kthread_create(&sync_func, (void *)state, =
threadname);
>         if (IS_ERR(state->sync_thread)) {
> -               vchiq_loud_error_header();
> -               vchiq_loud_error("couldn't create thread %s", threadname);
> -               vchiq_loud_error_footer();
> +               dev_err(state->dev, "couldn't create thread %s\n", thread=
name);
>                 ret =3D PTR_ERR(state->sync_thread);
>                 goto fail_free_recycle_thread;
>         }
> @@ -2353,10 +2344,11 @@ struct vchiq_header *vchiq_msg_hold(struct vchiq_=
instance *instance, unsigned in
>  }
>  EXPORT_SYMBOL(vchiq_msg_hold);
> =20
> -static int vchiq_validate_params(const struct vchiq_service_params_kerne=
l *params)
> +static int vchiq_validate_params(struct vchiq_state *state,
> +                                const struct vchiq_service_params_kernel=
 *params)
>  {
>         if (!params->callback || !params->fourcc) {
> -               vchiq_loud_error("Can't add service, invalid params\n");
> +               dev_err(state->dev, "Can't add service, invalid params\n"=
);
>                 return -EINVAL;
>         }
> =20
> @@ -2376,7 +2368,7 @@ vchiq_add_service_internal(struct vchiq_state *stat=
e,
>         int ret;
>         int i;
> =20
> -       ret =3D vchiq_validate_params(params);
> +       ret =3D vchiq_validate_params(state, params);
>         if (ret)
>                 return NULL;
> =20
> @@ -2525,7 +2517,7 @@ vchiq_open_service_internal(struct vchiq_service *s=
ervice, int client_id)
>         } else if ((service->srvstate !=3D VCHIQ_SRVSTATE_OPEN) &&
>                    (service->srvstate !=3D VCHIQ_SRVSTATE_OPENSYNC)) {
>                 if (service->srvstate !=3D VCHIQ_SRVSTATE_CLOSEWAIT)
> -                       vchiq_log_error(vchiq_core_log_level,
> +                       vchiq_log_error(service->state->dev, VCHIQ_CORE,
>                                         "%d: osi - srvstate =3D %s (ref %=
u)",
>                                         service->state->id,
>                                         srvstate_names[service->srvstate],
> @@ -2589,7 +2581,7 @@ release_service_messages(struct vchiq_service *serv=
ice)
>                         }
>                         pos +=3D calc_stride(header->size);
>                         if (pos > VCHIQ_SLOT_SIZE) {
> -                               vchiq_log_error(vchiq_core_log_level,
> +                               vchiq_log_error(state->dev, VCHIQ_CORE,
>                                                 "fsi - pos %x: header %pK=
, msgid %x, header->msgid %x, header->size %x",
>                                                 pos, header, msgid, heade=
r->msgid, header->size);
>                                 WARN(1, "invalid slot position\n");
> @@ -2645,8 +2637,8 @@ close_service_complete(struct vchiq_service *servic=
e, int failstate)
>         case VCHIQ_SRVSTATE_LISTENING:
>                 break;
>         default:
> -               vchiq_log_error(vchiq_core_log_level, "%s(%x) called in s=
tate %s", __func__,
> -                               service->handle, srvstate_names[service->=
srvstate]);
> +               vchiq_log_error(service->state->dev, VCHIQ_CORE, "%s(%x) =
called in state %s",
> +                               __func__, service->handle, srvstate_names=
[service->srvstate]);
>                 WARN(1, "%s in unexpected state\n", __func__);
>                 return -EINVAL;
>         }
> @@ -2701,7 +2693,7 @@ vchiq_close_service_internal(struct vchiq_service *=
service, int close_recvd)
>         case VCHIQ_SRVSTATE_LISTENING:
>         case VCHIQ_SRVSTATE_CLOSEWAIT:
>                 if (close_recvd) {
> -                       vchiq_log_error(vchiq_core_log_level, "%s(1) call=
ed in state %s",
> +                       vchiq_log_error(state->dev, VCHIQ_CORE, "%s(1) ca=
lled in state %s",
>                                         __func__, srvstate_names[service-=
>srvstate]);
>                 } else if (is_server) {
>                         if (service->srvstate =3D=3D VCHIQ_SRVSTATE_LISTE=
NING) {
> @@ -2789,7 +2781,7 @@ vchiq_close_service_internal(struct vchiq_service *=
service, int close_recvd)
>                 break;
> =20
>         default:
> -               vchiq_log_error(vchiq_core_log_level, "%s(%d) called in s=
tate %s", __func__,
> +               vchiq_log_error(state->dev, VCHIQ_CORE, "%s(%d) called in=
 state %s", __func__,
>                                 close_recvd, srvstate_names[service->srvs=
tate]);
>                 break;
>         }
> @@ -2828,7 +2820,7 @@ vchiq_free_service_internal(struct vchiq_service *s=
ervice)
>         case VCHIQ_SRVSTATE_CLOSEWAIT:
>                 break;
>         default:
> -               vchiq_log_error(vchiq_core_log_level, "%d: fsi - (%d) in =
state %s", state->id,
> +               vchiq_log_error(state->dev, VCHIQ_CORE, "%d: fsi - (%d) i=
n state %s", state->id,
>                                 service->localport, srvstate_names[servic=
e->srvstate]);
>                 return;
>         }
> @@ -3628,26 +3620,6 @@ int vchiq_dump_service_state(void *dump_context, s=
truct vchiq_service *service)
>         return err;
>  }
> =20
> -void
> -vchiq_loud_error_header(void)
> -{
> -       vchiq_log_error(vchiq_core_log_level,
> -                       "=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D");
> -       vchiq_log_error(vchiq_core_log_level,
> -                       "=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D");
> -       vchiq_log_error(vchiq_core_log_level, "=3D=3D=3D=3D=3D");
> -}
> -
> -void
> -vchiq_loud_error_footer(void)
> -{
> -       vchiq_log_error(vchiq_core_log_level, "=3D=3D=3D=3D=3D");
> -       vchiq_log_error(vchiq_core_log_level,
> -                       "=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D");
> -       vchiq_log_error(vchiq_core_log_level,
> -                       "=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D");
> -}
> -
>  int vchiq_send_remote_use(struct vchiq_state *state)
>  {
>         if (state->conn_state =3D=3D VCHIQ_CONNSTATE_DISCONNECTED)
> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core=
.h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
> index ec1a3caefaea..c74c3647ef60 100644
> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
> @@ -6,6 +6,7 @@
> =20
>  #include <linux/mutex.h>
>  #include <linux/completion.h>
> +#include <linux/dev_printk.h>
>  #include <linux/kthread.h>
>  #include <linux/kref.h>
>  #include <linux/rcupdate.h>
> @@ -39,10 +40,33 @@
> =20
>  #define VCHIQ_LOG_PREFIX   KERN_INFO "vchiq: "
> =20
> +enum vchiq_log_category {
> +       VCHIQ_ARM,
> +       VCHIQ_CORE,
> +       VCHIQ_CORE_MSG,
> +       VCHIQ_SYNC,
> +       VCHIQ_SUSPEND,
> +};
> +
> +static inline const char *log_category_str(enum vchiq_log_category c)
> +{
> +       static const char * const strings[] =3D {
> +               "vchiq_arm",
> +               "vchiq_core",
> +               "vchiq_core_msg",
> +               "vchiq_sync",
> +               "vchiq_suspend",
> +       };
> +
> +       return strings[c];
> +};
> +
>  #ifndef vchiq_log_error
> -#define vchiq_log_error(cat, fmt, ...) \
> -       do { if (cat >=3D VCHIQ_LOG_ERROR) \
> -               printk(VCHIQ_LOG_PREFIX fmt "\n", ##__VA_ARGS__); } while=
 (0)
> +#define vchiq_log_error(dev, cat, fmt, ...) \
> +       do { if (dev !=3D NULL) \
> +               dev_dbg(dev, "%s error: " fmt, log_category_str(cat), ##_=
_VA_ARGS__); \
> +            else \
> +               pr_debug("%s error: " fmt, log_category_str(cat), ##__VA_=
ARGS__); } while (0)
>  #endif
>  #ifndef vchiq_log_warning
>  #define vchiq_log_warning(cat, fmt, ...) \
> @@ -60,9 +84,6 @@
>                 printk(VCHIQ_LOG_PREFIX fmt "\n", ##__VA_ARGS__); } while=
 (0)
>  #endif
> =20
> -#define vchiq_loud_error(...) \
> -       vchiq_log_error(vchiq_core_log_level, "=3D=3D=3D=3D=3D " __VA_ARG=
S__)
> -
>  #define VCHIQ_SLOT_MASK        (VCHIQ_SLOT_SIZE - 1)
>  #define VCHIQ_SLOT_QUEUE_MASK  (VCHIQ_MAX_SLOTS_PER_SIDE - 1)
>  #define VCHIQ_SLOT_ZERO_SLOTS  DIV_ROUND_UP(sizeof(struct vchiq_slot_zer=
o), \
> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c
> index 841e1a535642..c89dc6d82fd2 100644
> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c
> @@ -271,7 +271,7 @@ static int vchiq_ioc_dequeue_message(struct vchiq_ins=
tance *instance,
>                         ret =3D -EFAULT;
>                 }
>         } else {
> -               vchiq_log_error(vchiq_arm_log_level,
> +               vchiq_log_error(service->state->dev, VCHIQ_ARM,
>                                 "header %pK: bufsize %x < size %x",
>                                 header, args->bufsize, header->size);
>                 WARN(1, "invalid size\n");
> @@ -318,7 +318,7 @@ static int vchiq_irq_queue_bulk_tx_rx(struct vchiq_in=
stance *instance,
>                 }
>                 mutex_unlock(&instance->bulk_waiter_list_mutex);
>                 if (!waiter) {
> -                       vchiq_log_error(vchiq_arm_log_level,
> +                       vchiq_log_error(service->state->dev, VCHIQ_ARM,
>                                         "no bulk_waiter found for pid %d"=
, current->pid);
>                         ret =3D -ESRCH;
>                         goto out;
> @@ -501,7 +501,7 @@ static int vchiq_ioc_await_completion(struct vchiq_in=
stance *instance,
>                         msglen =3D header->size + sizeof(struct vchiq_hea=
der);
>                         /* This must be a VCHIQ-style service */
>                         if (args->msgbufsize < msglen) {
> -                               vchiq_log_error(vchiq_arm_log_level,
> +                               vchiq_log_error(service->state->dev, VCHI=
Q_ARM,
>                                                 "header %pK: msgbufsize %=
x < msglen %x",
>                                                 header, args->msgbufsize,=
 msglen);
>                                                 WARN(1, "invalid message =
size\n");
> @@ -618,7 +618,7 @@ vchiq_ioctl(struct file *file, unsigned int cmd, unsi=
gned long arg)
>                 }
>                 rc =3D mutex_lock_killable(&instance->state->mutex);
>                 if (rc) {
> -                       vchiq_log_error(vchiq_arm_log_level,
> +                       vchiq_log_error(instance->state->dev, VCHIQ_ARM,
>                                         "vchiq: connect: could not lock m=
utex for state %d: %d",
>                                         instance->state->id, rc);
>                         ret =3D -EINTR;
> @@ -630,7 +630,7 @@ vchiq_ioctl(struct file *file, unsigned int cmd, unsi=
gned long arg)
>                 if (!status)
>                         instance->connected =3D 1;
>                 else
> -                       vchiq_log_error(vchiq_arm_log_level,
> +                       vchiq_log_error(instance->state->dev, VCHIQ_ARM,
>                                         "vchiq: could not connect: %d", s=
tatus);
>                 break;
> =20
> @@ -700,7 +700,7 @@ vchiq_ioctl(struct file *file, unsigned int cmd, unsi=
gned long arg)
>                                 vchiq_use_service_internal(service) :
>                                 vchiq_release_service_internal(service);
>                         if (ret) {
> -                               vchiq_log_error(vchiq_susp_log_level,
> +                               vchiq_log_error(service->state->dev, VCHI=
Q_SUSPEND,
>                                                 "%s: cmd %s returned erro=
r %ld for service %c%c%c%c:%03d",
>                                                 __func__, (cmd =3D=3D VCH=
IQ_IOC_USE_SERVICE) ?
>                                                 "VCHIQ_IOC_USE_SERVICE" :
> @@ -1173,7 +1173,7 @@ static int vchiq_open(struct inode *inode, struct f=
ile *file)
>         vchiq_log_info(vchiq_arm_log_level, "vchiq_open");
> =20
>         if (!state) {
> -               vchiq_log_error(vchiq_arm_log_level,
> +               vchiq_log_error(state->dev, VCHIQ_ARM,
>                                 "vchiq has no connection to VideoCore");
>                 return -ENOTCONN;
>         }
> --=20
> 2.40.1
>
