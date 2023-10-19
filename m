Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 370C17CFBAA
	for <lists+linux-media@lfdr.de>; Thu, 19 Oct 2023 15:50:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345841AbjJSNup (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Oct 2023 09:50:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345821AbjJSNun (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Oct 2023 09:50:43 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0603011F
        for <linux-media@vger.kernel.org>; Thu, 19 Oct 2023 06:50:40 -0700 (PDT)
Received: from pendragon.ideasonboard.com (aztw-30-b2-v4wan-166917-cust845.vm26.cable.virginm.net [82.37.23.78])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8E14125A;
        Thu, 19 Oct 2023 15:50:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1697723429;
        bh=MkbgYDn1a68rXfA6v691NVavnePywJNwg0SBWcT0eQ8=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=SxuDKNTYfItL+/DRdN9zkLh8hoX85PZt13RSnc/B7Ot/T7F6s0E/UXouegwnHQHWX
         uWs+bXIAkjsZs3mw1R5j5Nih699DYYiV9QvsG/a6DSsN0efw9gJ5FjErqKSQ5IrDCf
         LSyo1s5kTAzJgO8wf0funUm25RO0g06oXh4a3fYs=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20231019082147.384723-3-umang.jain@ideasonboard.com>
References: <20231019082147.384723-1-umang.jain@ideasonboard.com> <20231019082147.384723-3-umang.jain@ideasonboard.com>
Subject: Re: [PATCH v1 2/4] staging: vc04: Convert vchiq_log_warning() to use dynamic debug
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Stefan Wahren <stefan.wahren@i2se.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Dan Carpenter <error27@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Umang Jain <umang.jain@ideasonboard.com>,
        Phil Elwell <phil@raspberrypi.com>
To:     Umang Jain <umang.jain@ideasonboard.com>,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org, linux-staging@lists.linux.dev
Date:   Thu, 19 Oct 2023 14:50:34 +0100
Message-ID: <169772343491.630990.5915300826397445052@ping.linuxembedded.co.uk>
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

Quoting Umang Jain (2023-10-19 09:21:45)
> Move vchiq_log_warning() custom logging wrapper based on printk to use
> dynamic debug. The log category is dictated by vchiq_log_category
> which will become the part of the warning string format that will be
> logged to dynamic debug (for grep).
>=20
> All the vchiq_log_warning() calls are adjusted to use the
> modified wrapper.
>=20
> While at that, remove the extraneous "----" from few of the
> warning string text.
>=20
> Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
> ---
>  .../interface/vchiq_arm/vchiq_arm.c              | 16 +++++++++-------
>  .../interface/vchiq_arm/vchiq_core.c             |  8 ++++----
>  .../interface/vchiq_arm/vchiq_core.h             |  5 ++---
>  3 files changed, 15 insertions(+), 14 deletions(-)
>=20
> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.=
c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> index fa4463bfc117..cfc06ca2e228 100644
> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> @@ -695,7 +695,7 @@ int vchiq_initialise(struct vchiq_instance **instance=
_out)
>                 ret =3D -ENOTCONN;
>                 goto failed;
>         } else if (i > 0) {
> -               vchiq_log_warning(vchiq_core_log_level,
> +               vchiq_log_warning(state->dev, VCHIQ_CORE,
>                                   "%s: videocore initialized after %d ret=
ries\n", __func__, i);
>         }
> =20
> @@ -1696,17 +1696,19 @@ vchiq_dump_service_use_state(struct vchiq_state *=
state)
>         read_unlock_bh(&arm_state->susp_res_lock);
> =20
>         if (only_nonzero)
> -               vchiq_log_warning(vchiq_susp_log_level, "Too many active =
services (%d). Only dumping up to first %d services with non-zero use-count=
",
> +               vchiq_log_warning(state->dev, VCHIQ_SUSPEND,
> +                                 "Too many active services (%d). Only du=
mping up to first %d services with non-zero use-count",
>                                   active_services, found);
> =20
>         for (i =3D 0; i < found; i++) {
> -               vchiq_log_warning(vchiq_susp_log_level, "----- %c%c%c%c:%=
d service count %d %s",
> +               vchiq_log_warning(state->dev, VCHIQ_SUSPEND,
> +                                 "%c%c%c%c:%d service count %d %s",
>                                   VCHIQ_FOURCC_AS_4CHARS(service_data[i].=
fourcc),

I suspect VCHIQ_FOURCC_AS_4CHARS can now be replaced by "%p4cc"

vchiq_log_warning(state->dev, VCHIQ_SUSPEND, "%p4cc:%d service count %d %s",
		  service_data[i].fourcc, service_data[i].clientid, ...

But that can be a patch on top of this I think (including the removal of
VCHIQ_FOURCC_AS_4CHARS).


Otherwise, this is following the same pattern as before and looks ok to
me. I suspect an ack from Phil Elwell on the approach here would be
welcome, as looking back at the RFC that's where the concerns were on
the categories.

Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>


>                                   service_data[i].clientid, service_data[=
i].use_count,
>                                   service_data[i].use_count ? nz : "");
>         }
> -       vchiq_log_warning(vchiq_susp_log_level, "----- VCHIQ use count %d=
", peer_count);
> -       vchiq_log_warning(vchiq_susp_log_level, "--- Overall vchiq instan=
ce use count %d",
> +       vchiq_log_warning(state->dev, VCHIQ_SUSPEND, "VCHIQ use count %d"=
, peer_count);
> +       vchiq_log_warning(state->dev, VCHIQ_SUSPEND, "Overall vchiq insta=
nce use count %d",
>                           vc_use_count);
> =20
>         kfree(service_data);
> @@ -1822,7 +1824,7 @@ static int vchiq_probe(struct platform_device *pdev)
>          */
>         err =3D vchiq_register_chrdev(&pdev->dev);
>         if (err) {
> -               vchiq_log_warning(vchiq_arm_log_level,
> +               vchiq_log_warning(&pdev->dev, VCHIQ_ARM,
>                                   "Failed to initialize vchiq cdev");
>                 goto error_exit;
>         }
> @@ -1833,7 +1835,7 @@ static int vchiq_probe(struct platform_device *pdev)
>         return 0;
> =20
>  failed_platform_init:
> -       vchiq_log_warning(vchiq_arm_log_level, "could not initialize vchi=
q platform");
> +       vchiq_log_warning(&pdev->dev, VCHIQ_ARM, "could not initialize vc=
hiq platform");
>  error_exit:
>         return err;
>  }
> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core=
.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
> index f6032c6022cb..43e292512491 100644
> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
> @@ -475,7 +475,7 @@ make_service_callback(struct vchiq_service *service, =
enum vchiq_reason reason,
>         status =3D service->base.callback(service->instance, reason, head=
er, service->handle,
>                                         bulk_userdata);
>         if (status && (status !=3D -EAGAIN)) {
> -               vchiq_log_warning(vchiq_core_log_level,
> +               vchiq_log_warning(service->state->dev, VCHIQ_CORE,
>                                   "%d: ignoring ERROR from callback to se=
rvice %x",
>                                   service->state->id, service->handle);
>                 status =3D 0;
> @@ -1622,7 +1622,7 @@ parse_message(struct vchiq_state *state, struct vch=
iq_header *header)
>                                 vchiq_service_put(service);
>                         service =3D get_connected_service(state, remotepo=
rt);
>                         if (service)
> -                               vchiq_log_warning(vchiq_core_log_level,
> +                               vchiq_log_warning(state->dev, VCHIQ_CORE,
>                                                   "%d: prs %s@%pK (%d->%d=
) - found connected service %d",
>                                                   state->id, msg_type_str=
(type), header,
>                                                   remoteport, localport, =
service->localport);
> @@ -2921,7 +2921,7 @@ vchiq_close_service(struct vchiq_instance *instance=
, unsigned int handle)
>                     (service->srvstate =3D=3D VCHIQ_SRVSTATE_OPEN))
>                         break;
> =20
> -               vchiq_log_warning(vchiq_core_log_level,
> +               vchiq_log_warning(service->state->dev, VCHIQ_CORE,
>                                   "%d: close_service:%d - waiting in stat=
e %s",
>                                   service->state->id, service->localport,
>                                   srvstate_names[service->srvstate]);
> @@ -2982,7 +2982,7 @@ vchiq_remove_service(struct vchiq_instance *instanc=
e, unsigned int handle)
>                     (service->srvstate =3D=3D VCHIQ_SRVSTATE_OPEN))
>                         break;
> =20
> -               vchiq_log_warning(vchiq_core_log_level,
> +               vchiq_log_warning(service->state->dev, VCHIQ_CORE,
>                                   "%d: remove_service:%d - waiting in sta=
te %s",
>                                   service->state->id, service->localport,
>                                   srvstate_names[service->srvstate]);
> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core=
.h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
> index c74c3647ef60..3dbb1964839b 100644
> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
> @@ -69,9 +69,8 @@ static inline const char *log_category_str(enum vchiq_l=
og_category c)
>                 pr_debug("%s error: " fmt, log_category_str(cat), ##__VA_=
ARGS__); } while (0)
>  #endif
>  #ifndef vchiq_log_warning
> -#define vchiq_log_warning(cat, fmt, ...) \
> -       do { if (cat >=3D VCHIQ_LOG_WARNING) \
> -                printk(VCHIQ_LOG_PREFIX fmt "\n", ##__VA_ARGS__); } whil=
e (0)
> +#define vchiq_log_warning(dev, cat, fmt, ...) \
> +       do { dev_dbg(dev, "%s warning: " fmt, log_category_str(cat), ##__=
VA_ARGS__); } while (0)
>  #endif
>  #ifndef vchiq_log_info
>  #define vchiq_log_info(cat, fmt, ...) \
> --=20
> 2.40.1
>
