Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B7CD7506C1C
	for <lists+linux-media@lfdr.de>; Tue, 19 Apr 2022 14:17:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352122AbiDSMSv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Apr 2022 08:18:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241389AbiDSMSu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Apr 2022 08:18:50 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7B2C2251C
        for <linux-media@vger.kernel.org>; Tue, 19 Apr 2022 05:16:07 -0700 (PDT)
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C6D1225B;
        Tue, 19 Apr 2022 14:16:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1650370565;
        bh=e0VJB9a5QSSsi2NfT13t6fdxFeR5iMaUHc6WXTwlJnM=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=a4bqnUvXkj4Yul7YKT428yU35YqW+pofuw6kksIgm9Jnj3Wfsa04+MdLiyBptlOKN
         uv32BpyJnk/uFsv8CzSLMin8PDBJWij0Jj7D1eocdDHnkt6MwbrHCCEiMjUGb8e3LT
         NpZY8WdlQ81u/p33PyAUKdnZCchcTSYyWlTfBSGg=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220415023855.2568366-2-yunkec@google.com>
References: <20220415023855.2568366-1-yunkec@google.com> <20220415023855.2568366-2-yunkec@google.com>
Subject: Re: [PATCH v1 1/2] media: vimc: add ancillary lens
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Daniel Scally <djrscally@gmail.com>,
        linux-media@vger.kernel.org, Yunke Cao <yunkec@google.com>
To:     Yunke Cao <yunkec@google.com>
Date:   Tue, 19 Apr 2022 13:16:03 +0100
Message-ID: <165037056336.2548121.16870543641391713634@Monstersaurus>
User-Agent: alot/0.10
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Yunke,

This is a very interesting development!

Quoting Yunke Cao (2022-04-15 03:38:54)
> Add a basic version of vimc lens.
> Link lens with sensors using ancillary links.
>=20
> Signed-off-by: Yunke Cao <yunkec@google.com>
> ---
>  drivers/media/test-drivers/vimc/Makefile      |   2 +-
>  drivers/media/test-drivers/vimc/vimc-common.h |   1 +
>  drivers/media/test-drivers/vimc/vimc-core.c   |  86 +++++++++++----
>  drivers/media/test-drivers/vimc/vimc-lens.c   | 102 ++++++++++++++++++
>  4 files changed, 170 insertions(+), 21 deletions(-)
>  create mode 100644 drivers/media/test-drivers/vimc/vimc-lens.c
>=20
> diff --git a/drivers/media/test-drivers/vimc/Makefile b/drivers/media/tes=
t-drivers/vimc/Makefile
> index a53b2b532e9f..9b9631562473 100644
> --- a/drivers/media/test-drivers/vimc/Makefile
> +++ b/drivers/media/test-drivers/vimc/Makefile
> @@ -1,6 +1,6 @@
>  # SPDX-License-Identifier: GPL-2.0
>  vimc-y :=3D vimc-core.o vimc-common.o vimc-streamer.o vimc-capture.o \
> -               vimc-debayer.o vimc-scaler.o vimc-sensor.o
> +               vimc-debayer.o vimc-scaler.o vimc-sensor.o vimc-lens.o
> =20
>  obj-$(CONFIG_VIDEO_VIMC) +=3D vimc.o
> =20
> diff --git a/drivers/media/test-drivers/vimc/vimc-common.h b/drivers/medi=
a/test-drivers/vimc/vimc-common.h
> index ba1930772589..37f6b687ce10 100644
> --- a/drivers/media/test-drivers/vimc/vimc-common.h
> +++ b/drivers/media/test-drivers/vimc/vimc-common.h
> @@ -171,6 +171,7 @@ extern struct vimc_ent_type vimc_sen_type;
>  extern struct vimc_ent_type vimc_deb_type;
>  extern struct vimc_ent_type vimc_sca_type;
>  extern struct vimc_ent_type vimc_cap_type;
> +extern struct vimc_ent_type vimc_len_type;

Aha, I see 'len' is short for 'lens'... I think that confused me below.

I wonder if these should be longer. 'len' makes me think of 'length' too
much, and 'lens' is only one char longer. But I guess this is
established in this driver already so it would need a patch to change
vimc_{deb,sca,cap}_type before calling it lens.


>  /**
>   * vimc_pix_map_by_index - get vimc_pix_map struct by its index
> diff --git a/drivers/media/test-drivers/vimc/vimc-core.c b/drivers/media/=
test-drivers/vimc/vimc-core.c
> index 06edf9d4d92c..166323406c6b 100644
> --- a/drivers/media/test-drivers/vimc/vimc-core.c
> +++ b/drivers/media/test-drivers/vimc/vimc-core.c
> @@ -24,7 +24,7 @@ MODULE_PARM_DESC(allocator, " memory allocator selectio=
n, default is 0.\n"
> =20
>  #define VIMC_MDEV_MODEL_NAME "VIMC MDEV"
> =20
> -#define VIMC_ENT_LINK(src, srcpad, sink, sinkpad, link_flags) {        \
> +#define VIMC_DATA_LINK(src, srcpad, sink, sinkpad, link_flags) {       \
>         .src_ent =3D src,                                         \
>         .src_pad =3D srcpad,                                      \
>         .sink_ent =3D sink,                                       \
> @@ -32,8 +32,13 @@ MODULE_PARM_DESC(allocator, " memory allocator selecti=
on, default is 0.\n"
>         .flags =3D link_flags,                                    \
>  }
> =20
> -/* Structure which describes links between entities */
> -struct vimc_ent_link {
> +#define VIMC_ANCILLARY_LINK(primary, ancillary) {      \
> +       .primary_ent =3D primary,                 \
> +       .ancillary_ent =3D ancillary              \
> +}
> +
> +/* Structure which describes data links between entities */
> +struct vimc_data_link {
>         unsigned int src_ent;
>         u16 src_pad;
>         unsigned int sink_ent;
> @@ -41,12 +46,20 @@ struct vimc_ent_link {
>         u32 flags;
>  };
> =20
> +/* Structure which describes ancillary links between entities */
> +struct vimc_ancillary_link {
> +       unsigned int primary_ent;
> +       unsigned int ancillary_ent;
> +};
> +
>  /* Structure which describes the whole topology */
>  struct vimc_pipeline_config {
>         const struct vimc_ent_config *ents;
>         size_t num_ents;
> -       const struct vimc_ent_link *links;
> -       size_t num_links;
> +       const struct vimc_data_link *data_links;
> +       size_t num_data_links;
> +       const struct vimc_ancillary_link *ancillary_links;
> +       size_t num_ancillary_links;
>  };
> =20
>  /* ---------------------------------------------------------------------=
-----
> @@ -91,32 +104,49 @@ static struct vimc_ent_config ent_config[] =3D {
>                 .name =3D "RGB/YUV Capture",
>                 .type =3D &vimc_cap_type
>         },
> +       {
> +               .name =3D "Lens A",
> +               .type =3D &vimc_len_type
> +       },
> +       {
> +               .name =3D "Lens B",
> +               .type =3D &vimc_len_type
> +       },
>  };
> =20
> -static const struct vimc_ent_link ent_links[] =3D {
> +static const struct vimc_data_link data_links[] =3D {
>         /* Link: Sensor A (Pad 0)->(Pad 0) Debayer A */
> -       VIMC_ENT_LINK(0, 0, 2, 0, MEDIA_LNK_FL_ENABLED | MEDIA_LNK_FL_IMM=
UTABLE),
> +       VIMC_DATA_LINK(0, 0, 2, 0, MEDIA_LNK_FL_ENABLED | MEDIA_LNK_FL_IM=
MUTABLE),
>         /* Link: Sensor A (Pad 0)->(Pad 0) Raw Capture 0 */
> -       VIMC_ENT_LINK(0, 0, 4, 0, MEDIA_LNK_FL_ENABLED | MEDIA_LNK_FL_IMM=
UTABLE),
> +       VIMC_DATA_LINK(0, 0, 4, 0, MEDIA_LNK_FL_ENABLED | MEDIA_LNK_FL_IM=
MUTABLE),
>         /* Link: Sensor B (Pad 0)->(Pad 0) Debayer B */
> -       VIMC_ENT_LINK(1, 0, 3, 0, MEDIA_LNK_FL_ENABLED | MEDIA_LNK_FL_IMM=
UTABLE),
> +       VIMC_DATA_LINK(1, 0, 3, 0, MEDIA_LNK_FL_ENABLED | MEDIA_LNK_FL_IM=
MUTABLE),
>         /* Link: Sensor B (Pad 0)->(Pad 0) Raw Capture 1 */
> -       VIMC_ENT_LINK(1, 0, 5, 0, MEDIA_LNK_FL_ENABLED | MEDIA_LNK_FL_IMM=
UTABLE),
> +       VIMC_DATA_LINK(1, 0, 5, 0, MEDIA_LNK_FL_ENABLED | MEDIA_LNK_FL_IM=
MUTABLE),
>         /* Link: Debayer A (Pad 1)->(Pad 0) Scaler */
> -       VIMC_ENT_LINK(2, 1, 7, 0, MEDIA_LNK_FL_ENABLED),
> +       VIMC_DATA_LINK(2, 1, 7, 0, MEDIA_LNK_FL_ENABLED),
>         /* Link: Debayer B (Pad 1)->(Pad 0) Scaler */
> -       VIMC_ENT_LINK(3, 1, 7, 0, 0),
> +       VIMC_DATA_LINK(3, 1, 7, 0, 0),
>         /* Link: RGB/YUV Input (Pad 0)->(Pad 0) Scaler */
> -       VIMC_ENT_LINK(6, 0, 7, 0, 0),
> +       VIMC_DATA_LINK(6, 0, 7, 0, 0),
>         /* Link: Scaler (Pad 1)->(Pad 0) RGB/YUV Capture */
> -       VIMC_ENT_LINK(7, 1, 8, 0, MEDIA_LNK_FL_ENABLED | MEDIA_LNK_FL_IMM=
UTABLE),
> +       VIMC_DATA_LINK(7, 1, 8, 0, MEDIA_LNK_FL_ENABLED | MEDIA_LNK_FL_IM=
MUTABLE),
> +};
> +
> +static const struct vimc_ancillary_link ancillary_links[] =3D {
> +       /* Link: Sensor A -> Lens A */
> +       VIMC_ANCILLARY_LINK(0, 9),
> +       /* Link: Sensor B -> Lens B */
> +       VIMC_ANCILLARY_LINK(1, 10),
>  };

There's a lot of magic indexes here (not a fault of your patch) - I
would probably restructure this to have the indexes named in an enum.

But - I don't think that is required for your patch - just something I
think should be done for VIMC to make this clearer and less likely to
get an incorrect index one day.

 =20
>  static struct vimc_pipeline_config pipe_cfg =3D {
> -       .ents           =3D ent_config,
> -       .num_ents       =3D ARRAY_SIZE(ent_config),
> -       .links          =3D ent_links,
> -       .num_links      =3D ARRAY_SIZE(ent_links)
> +       .ents                =3D ent_config,
> +       .num_ents            =3D ARRAY_SIZE(ent_config),
> +       .data_links          =3D data_links,
> +       .num_data_links      =3D ARRAY_SIZE(data_links),
> +       .ancillary_links     =3D ancillary_links,
> +       .num_ancillary_links =3D ARRAY_SIZE(ancillary_links),
>  };
> =20
>  /* ---------------------------------------------------------------------=
----- */
> @@ -135,8 +165,8 @@ static int vimc_create_links(struct vimc_device *vimc)
>         int ret;
> =20
>         /* Initialize the links between entities */
> -       for (i =3D 0; i < vimc->pipe_cfg->num_links; i++) {
> -               const struct vimc_ent_link *link =3D &vimc->pipe_cfg->lin=
ks[i];
> +       for (i =3D 0; i < vimc->pipe_cfg->num_data_links; i++) {
> +               const struct vimc_data_link *link =3D &vimc->pipe_cfg->da=
ta_links[i];
> =20
>                 struct vimc_ent_device *ved_src =3D
>                         vimc->ent_devs[link->src_ent];
> @@ -150,6 +180,22 @@ static int vimc_create_links(struct vimc_device *vim=
c)
>                         goto err_rm_links;
>         }
> =20
> +       for (i =3D 0; i < vimc->pipe_cfg->num_ancillary_links; i++) {
> +               const struct vimc_ancillary_link *link =3D &vimc->pipe_cf=
g->ancillary_links[i];
> +
> +               struct vimc_ent_device *ved_primary =3D
> +                       vimc->ent_devs[link->primary_ent];
> +               struct vimc_ent_device *ved_ancillary =3D
> +                       vimc->ent_devs[link->ancillary_ent];
> +               struct media_link *ret_link =3D
> +                       media_create_ancillary_link(ved_primary->ent, ved=
_ancillary->ent);
> +
> +               if (IS_ERR(ret_link)) {
> +                       ret =3D PTR_ERR(link);
> +                       goto err_rm_links;
> +               }
> +       }
> +
>         return 0;
> =20
>  err_rm_links:
> diff --git a/drivers/media/test-drivers/vimc/vimc-lens.c b/drivers/media/=
test-drivers/vimc/vimc-lens.c
> new file mode 100644
> index 000000000000..dfe824d3addb
> --- /dev/null
> +++ b/drivers/media/test-drivers/vimc/vimc-lens.c
> @@ -0,0 +1,102 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * vimc-lens.c Virtual Media Controller Driver
> + * Copyright (C) 2022 Google, Inc
> + * Author: yunkec@google.com (Yunke Cao)
> + */
> +
> +#include <media/v4l2-ctrls.h>
> +#include <media/v4l2-event.h>
> +#include <media/v4l2-subdev.h>
> +
> +#include "vimc-common.h"
> +
> +#define VIMC_LEN_MAX_FOCUS_POS 1023
> +#define VIMC_LEN_MAX_FOCUS_STEP        1
> +
> +struct vimc_len_device {
> +       struct vimc_ent_device ved;
> +       struct v4l2_subdev sd;
> +       struct v4l2_ctrl_handler hdl;
> +       u32 focus_absolute;

I'm not 100% certain we need to actually store this, as I think having
the control itself is enough - but I think it's good to keep this here.

I wonder if we might have some filter on the value sometime for
retrieval so we can emulate the physical movement delays  ... but I'm
getting ahead of myself there, and this is fine as is.

I can't actually see any particular issues with this as it stands, and
my comments so far are really only about separate developments or
patches on top of this - so I am already tempted to offer:

Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>


> +};
> +
> +static const struct v4l2_subdev_core_ops vimc_len_core_ops =3D {
> +       .log_status =3D v4l2_ctrl_subdev_log_status,

Oh nice so that already logs the current control settings.

> +       .subscribe_event =3D v4l2_ctrl_subdev_subscribe_event,
> +       .unsubscribe_event =3D v4l2_event_subdev_unsubscribe,
> +};
> +
> +static const struct v4l2_subdev_ops vimc_len_ops =3D {
> +       .core =3D &vimc_len_core_ops
> +};
> +
> +static int vimc_len_s_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +       struct vimc_len_device *vlen =3D
> +               container_of(ctrl->handler, struct vimc_len_device, hdl);
> +       if (ctrl->id =3D=3D V4L2_CID_FOCUS_ABSOLUTE) {
> +               vlen->focus_absolute =3D ctrl->val;
> +               return 0;
> +       }
> +       return -EINVAL;
> +}
> +
> +static const struct v4l2_ctrl_ops vimc_len_ctrl_ops =3D {
> +       .s_ctrl =3D vimc_len_s_ctrl,
> +};
> +
> +static struct vimc_ent_device *vimc_len_add(struct vimc_device *vimc,
> +                                           const char *vcfg_name)
> +{
> +       struct v4l2_device *v4l2_dev =3D &vimc->v4l2_dev;
> +       struct vimc_len_device *vlen;
> +       int ret;
> +
> +       /* Allocate the vlen struct */
> +       vlen =3D kzalloc(sizeof(*vlen), GFP_KERNEL);
> +       if (!vlen)
> +               return ERR_PTR(-ENOMEM);
> +
> +       v4l2_ctrl_handler_init(&vlen->hdl, 1);
> +
> +       v4l2_ctrl_new_std(&vlen->hdl, &vimc_len_ctrl_ops,
> +                         V4L2_CID_FOCUS_ABSOLUTE, 0,
> +                         VIMC_LEN_MAX_FOCUS_POS, VIMC_LEN_MAX_FOCUS_STEP=
, 0);
> +       vlen->sd.ctrl_handler =3D &vlen->hdl;
> +       if (vlen->hdl.error) {
> +               ret =3D vlen->hdl.error;
> +               goto err_free_vlen;
> +       }
> +       vlen->ved.dev =3D vimc->mdev.dev;
> +
> +       ret =3D vimc_ent_sd_register(&vlen->ved, &vlen->sd, v4l2_dev,
> +                                  vcfg_name, MEDIA_ENT_F_LENS, 0,
> +                                  NULL, &vimc_len_ops);
> +       if (ret)
> +               goto err_free_hdl;
> +
> +       return &vlen->ved;
> +
> +err_free_hdl:
> +       v4l2_ctrl_handler_free(&vlen->hdl);
> +err_free_vlen:
> +       kfree(vlen);
> +
> +       return ERR_PTR(ret);
> +}
> +
> +static void vimc_len_release(struct vimc_ent_device *ved)
> +{
> +       struct vimc_len_device *vlen =3D
> +               container_of(ved, struct vimc_len_device, ved);
> +
> +       v4l2_ctrl_handler_free(&vlen->hdl);
> +       media_entity_cleanup(vlen->ved.ent);
> +       kfree(vlen);
> +}
> +
> +struct vimc_ent_type vimc_len_type =3D {
> +       .add =3D vimc_len_add,
> +       .release =3D vimc_len_release
> +};
> --=20
> 2.36.0.rc0.470.gd361397f0d-goog
>
