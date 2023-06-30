Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 22A9C743DCF
	for <lists+linux-media@lfdr.de>; Fri, 30 Jun 2023 16:46:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231501AbjF3OqR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Jun 2023 10:46:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232292AbjF3OqQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Jun 2023 10:46:16 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B058DE4C
        for <linux-media@vger.kernel.org>; Fri, 30 Jun 2023 07:46:13 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-51d80c5c834so3370651a12.1
        for <linux-media@vger.kernel.org>; Fri, 30 Jun 2023 07:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688136372; x=1690728372;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OtZCiAuHaKAYlScMCqG2TNEAO1kH7tlTF4irQ7eCRjk=;
        b=ggnVElLViaZhBLgRxv3UDAvhjnu0aXx3BjL/2F45iA85S1eSdnl9BRl3jH0n6QsMXh
         68kSyO4npBW1esmUyz7ZdYGsklmHDhw3oxuyhtiEheK0rj81umWrtAIlytTELOXC76YV
         2f4jf0NGvlZKsfpNYDGshra1zHeUEc4pAu236e3zIo6Phkxn+Jwpl8LwzgzPInQXENh+
         P358pK093sD7zWuDUzoJvcIEIWxUtDdr+7YZMPyDnCEf5ENZrAIP80CPWgGrWu2kJH8y
         9gFotiR+2aB5PnQ7+LuMbCZqfKrEgj3dRlIyQsr4UfYRItT/ZkcwzPPi5w3yf1qAX9QK
         PIew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688136372; x=1690728372;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OtZCiAuHaKAYlScMCqG2TNEAO1kH7tlTF4irQ7eCRjk=;
        b=ksJRJdUSqJQyGrpMNDcPnD2EhmuQZSA6F51GZ9HdOqLECEQf/b4HcikWr5IPashOBY
         8TxHo1SwOtmoVfYHaw4Z0bjrc06Y6koc/2EdyEGVVFyH8ep69k9xHhPO80IcHSSxjdir
         tW6u4+7SMvbDf+ab6wWARgtK7ndhvz2JWt/DB05NKT6S2aRvewOzIWrdHETlovqyNYiS
         YkWtDNgYUC9VeuFNEVa3iRIeaFmYo82U/1G7gxiLK6xH28/Rwj2pKvlLuL0BWKBgwbzW
         HPXjIClOKR3xMs2qTjpaqo40ap7Hl3jcXEO1a3I7tyPlpI7zK0BBX3kVLTSvaP4f+Ef7
         5TRA==
X-Gm-Message-State: ABy/qLYgNOLdoU6KIppwN+RK50967uWI5IC6Il7V/502uaaYCoVLWH9P
        MEKRr8KoY0xjvVtMio+SM5t3GOnWWHwZYe8MQAULoGvQTjh5yYWe
X-Google-Smtp-Source: APBJJlHcGbc4/HgAuwg9StTBDd9NtpZ7GNvRibMKJ/p2JuYQBgtnfpNWaAEYrG+5A0dSfLF5386+mAuKphmhbkpozF4=
X-Received: by 2002:aa7:d30c:0:b0:51d:ec4b:d873 with SMTP id
 p12-20020aa7d30c000000b0051dec4bd873mr2728750edq.16.1688136371911; Fri, 30
 Jun 2023 07:46:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230630110643.209761-1-hdegoede@redhat.com> <20230630110643.209761-14-hdegoede@redhat.com>
In-Reply-To: <20230630110643.209761-14-hdegoede@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 30 Jun 2023 17:45:35 +0300
Message-ID: <CAHp75Vcp9aoKOw-gPeXvJ9VuO5nGN=g5HHjAxWwNyNzo6J2Amw@mail.gmail.com>
Subject: Re: [PATCH v2 13/15] media: atomisp: csi2-bridge: Switch to new
 common ipu_bridge_init()
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        Hao Yao <hao.yao@intel.com>, Bingbu Cao <bingbu.cao@intel.com>,
        linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Jun 30, 2023 at 2:07=E2=80=AFPM Hans de Goede <hdegoede@redhat.com>=
 wrote:
>
> Remove the duplicate IPU ACPI bridge code and use the new
> shared ipu_bridge_init() functionality.
>
> Note this will also use / assume v4l2-async device instantation for

instantiation

> ov5693 sensors on atomisp devices since ipu_supported_sensors[]
> already contains a match for this.
>
> This is fine since recent atomisp improvements allow the atomisp code
> to work with generic v4l2 sensor drivers and using an unmodified
> drivers/media/i2c/ov5693.c has been successfully tested on
> an Acer Iconia W4 820 tablet with Bay an ISP2400 + OV5693 sensor.

with an?
with Bay Trail and ?

This is a cool patch!

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

A few remarks below.

> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/staging/media/atomisp/Kconfig         |   2 +
>  .../staging/media/atomisp/pci/atomisp_csi2.h  |  67 ----
>  .../media/atomisp/pci/atomisp_csi2_bridge.c   | 326 +++---------------
>  .../staging/media/atomisp/pci/atomisp_v4l2.c  |   1 +
>  4 files changed, 48 insertions(+), 348 deletions(-)
>
> diff --git a/drivers/staging/media/atomisp/Kconfig b/drivers/staging/medi=
a/atomisp/Kconfig
> index e9b168ba97bf..1c1007362e21 100644
> --- a/drivers/staging/media/atomisp/Kconfig
> +++ b/drivers/staging/media/atomisp/Kconfig
> @@ -12,9 +12,11 @@ menuconfig INTEL_ATOMISP
>  config VIDEO_ATOMISP
>         tristate "Intel Atom Image Signal Processor Driver"
>         depends on VIDEO_DEV && INTEL_ATOMISP

> +       depends on MEDIA_PCI_SUPPORT && I2C

These two on a single "depends on" line makes me confused.
I would split the PCI part from the I2C one. However, I haven't
checked the context of other media drivers, maybe this is an existing
idiom, in that case let it be.

>         depends on PMIC_OPREGION
>         select V4L2_FWNODE
>         select IOSF_MBI
> +       select IPU_BRIDGE
>         select VIDEOBUF2_VMALLOC
>         select VIDEO_V4L2_SUBDEV_API
>         help
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_csi2.h b/drivers/s=
taging/media/atomisp/pci/atomisp_csi2.h
> index 16ddb3ab2963..8a112acba1e0 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_csi2.h
> +++ b/drivers/staging/media/atomisp/pci/atomisp_csi2.h
> @@ -30,9 +30,6 @@
>  #define CSI2_PAD_SOURCE                1
>  #define CSI2_PADS_NUM          2
>
> -#define CSI2_MAX_LANES         4
> -#define CSI2_MAX_LINK_FREQS    3
> -
>  #define CSI2_MAX_ACPI_GPIOS    2u
>
>  struct acpi_device;
> @@ -55,70 +52,6 @@ struct atomisp_csi2_acpi_gpio_parsing_data {
>         unsigned int map_count;
>  };
>
> -enum atomisp_csi2_sensor_swnodes {
> -       SWNODE_SENSOR,
> -       SWNODE_SENSOR_PORT,
> -       SWNODE_SENSOR_ENDPOINT,
> -       SWNODE_CSI2_PORT,
> -       SWNODE_CSI2_ENDPOINT,
> -       SWNODE_COUNT
> -};
> -
> -struct atomisp_csi2_property_names {
> -       char clock_frequency[16];
> -       char rotation[9];
> -       char bus_type[9];
> -       char data_lanes[11];
> -       char remote_endpoint[16];
> -       char link_frequencies[17];
> -};
> -
> -struct atomisp_csi2_node_names {
> -       char port[7];
> -       char endpoint[11];
> -       char remote_port[7];
> -};
> -
> -struct atomisp_csi2_sensor_config {
> -       const char *hid;
> -       int lanes;
> -       int nr_link_freqs;
> -       u64 link_freqs[CSI2_MAX_LINK_FREQS];
> -};
> -
> -struct atomisp_csi2_sensor {
> -       /* Append port in "-%u" format as suffix of HID */
> -       char name[ACPI_ID_LEN + 4];
> -       struct acpi_device *adev;
> -       int port;
> -       int lanes;
> -
> -       /* SWNODE_COUNT + 1 for terminating NULL */
> -       const struct software_node *group[SWNODE_COUNT + 1];
> -       struct software_node swnodes[SWNODE_COUNT];
> -       struct atomisp_csi2_node_names node_names;
> -       struct atomisp_csi2_property_names prop_names;
> -       /* "clock-frequency", "rotation" + terminating entry */
> -       struct property_entry dev_properties[3];
> -       /* "bus-type", "data-lanes", "remote-endpoint" + "link-freq" + te=
rminating entry */
> -       struct property_entry ep_properties[5];
> -       /* "data-lanes", "remote-endpoint" + terminating entry */
> -       struct property_entry csi2_properties[3];
> -       struct software_node_ref_args local_ref[1];
> -       struct software_node_ref_args remote_ref[1];
> -       struct software_node_ref_args vcm_ref[1];
> -       /* GPIO mappings storage */
> -       struct atomisp_csi2_acpi_gpio_map gpio_map;
> -};
> -
> -struct atomisp_csi2_bridge {
> -       struct software_node csi2_node;
> -       char csi2_node_name[14];
> -       u32 data_lanes[CSI2_MAX_LANES];
> -       unsigned int n_sensors;
> -       struct atomisp_csi2_sensor sensors[ATOMISP_CAMERA_NR_PORTS];
> -};
> -
>  struct atomisp_mipi_csi2_device {
>         struct v4l2_subdev subdev;
>         struct media_pad pads[CSI2_PADS_NUM];
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c b/dr=
ivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
> index 0d12ba78d9c1..d7b8c3de0e17 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
> @@ -14,31 +14,14 @@
>  #include <linux/device.h>
>  #include <linux/dmi.h>
>  #include <linux/property.h>
> +
> +#include <media/ipu-bridge.h>
>  #include <media/v4l2-fwnode.h>
>
>  #include "atomisp_cmd.h"
>  #include "atomisp_csi2.h"
>  #include "atomisp_internal.h"
>
> -#define NODE_SENSOR(_HID, _PROPS)              \
> -       ((const struct software_node) {         \
> -               .name =3D _HID,                   \
> -               .properties =3D _PROPS,           \
> -       })
> -
> -#define NODE_PORT(_PORT, _SENSOR_NODE)         \
> -       ((const struct software_node) {         \
> -               .name =3D _PORT,                  \
> -               .parent =3D _SENSOR_NODE,         \
> -       })
> -
> -#define NODE_ENDPOINT(_EP, _PORT, _PROPS)      \
> -       ((const struct software_node) {         \
> -               .name =3D _EP,                    \
> -               .parent =3D _PORT,                \
> -               .properties =3D _PROPS,           \
> -       })
> -
>  #define PMC_CLK_RATE_19_2MHZ                   19200000
>
>  /*
> @@ -83,21 +66,6 @@ static const guid_t atomisp_dsm_guid =3D
>         GUID_INIT(0xdc2f6c4f, 0x045b, 0x4f1d,
>                   0x97, 0xb9, 0x88, 0x2a, 0x68, 0x60, 0xa4, 0xbe);
>
> -/*
> - * Extend this array with ACPI Hardware IDs of sensors known to be worki=
ng
> - * plus the default number of links + link-frequencies.
> - *
> - * Do not add an entry for a sensor that is not actually supported,
> - * or which have not yet been converted to work without atomisp_gmin
> - * power-management and with v4l2-async probing.
> - */
> -static const struct atomisp_csi2_sensor_config supported_sensors[] =3D {
> -       /* GalaxyCore GC0310 */
> -       { "INT0310", 1 },
> -       /* Omnivision OV2680 */
> -       { "OVTI2680", 1 },
> -};
> -
>  /*
>   * gmin_cfg parsing code. This is a cleaned up version of the gmin_cfg p=
arsing
>   * code from atomisp_gmin_platform.c.
> @@ -400,8 +368,7 @@ static int atomisp_csi2_handle_acpi_gpio_res(struct a=
cpi_resource *ares, void *_
>   * the INT3472 discrete.c code and there is some overlap, but there are
>   * enough differences that it is difficult to share the code.
>   */
> -static int atomisp_csi2_add_gpio_mappings(struct atomisp_csi2_sensor *se=
nsor,
> -                                         struct acpi_device *adev)
> +static int atomisp_csi2_add_gpio_mappings(struct acpi_device *adev)
>  {
>         struct atomisp_csi2_acpi_gpio_parsing_data data =3D { };
>         LIST_HEAD(resource_list);
> @@ -469,9 +436,12 @@ static int atomisp_csi2_add_gpio_mappings(struct ato=
misp_csi2_sensor *sensor,
>                 }
>         }
>
> +       data.map =3D kzalloc(sizeof(*data.map), GFP_KERNEL);
> +       if (!data.map)
> +               return -ENOMEM;
> +
>         /* Now parse the ACPI resources and build the lookup table */
>         data.adev =3D adev;
> -       data.map =3D &sensor->gpio_map;
>         ret =3D acpi_dev_get_resources(adev, &resource_list,
>                                      atomisp_csi2_handle_acpi_gpio_res, &=
data);
>         if (ret < 0)
> @@ -491,220 +461,59 @@ static int atomisp_csi2_add_gpio_mappings(struct a=
tomisp_csi2_sensor *sensor,
>         return ret;
>  }
>
> -static const struct atomisp_csi2_property_names prop_names =3D {
> -       .clock_frequency =3D "clock-frequency",
> -       .rotation =3D "rotation",
> -       .bus_type =3D "bus-type",
> -       .data_lanes =3D "data-lanes",
> -       .remote_endpoint =3D "remote-endpoint",
> -       .link_frequencies =3D "link-frequencies",
> -};
> -
> -static void atomisp_csi2_create_fwnode_properties(struct atomisp_csi2_se=
nsor *sensor,
> -                                                 struct atomisp_csi2_bri=
dge *bridge,
> -                                                 const struct atomisp_cs=
i2_sensor_config *cfg)
> +static int atomisp_csi2_parse_sensor_fwnode(struct acpi_device *adev,
> +                                           struct ipu_sensor *sensor)
>  {
> -       sensor->prop_names =3D prop_names;
> +       static const struct acpi_device_id dual_lane_sensors[] =3D {
> +               { "INT33BE" },  /* OV5693 */
> +               {}
> +       };
> +       int ret, clock_num, lanes;
>
> -       sensor->local_ref[0] =3D SOFTWARE_NODE_REFERENCE(&sensor->swnodes=
[SWNODE_CSI2_ENDPOINT]);
> -       sensor->remote_ref[0] =3D SOFTWARE_NODE_REFERENCE(&sensor->swnode=
s[SWNODE_SENSOR_ENDPOINT]);
> +       /*
> +        * ACPI takes care of turning the PMC clock on and off, but on BY=
T
> +        * the clock defaults to 25 MHz instead of the expected 19.2 MHz.
> +        * Get the PMC-clock number from ACPI PR0 method and set it to 19=
.2 MHz.
> +        * The PMC-clock number is also used to determine the default CSI=
 port.
> +        */
> +       clock_num =3D atomisp_csi2_get_pmc_clk_nr_from_acpi_pr0(adev);
>
> -       sensor->dev_properties[0] =3D PROPERTY_ENTRY_U32(sensor->prop_nam=
es.clock_frequency,
> -                                                      PMC_CLK_RATE_19_2M=
HZ);
> -       sensor->dev_properties[1] =3D PROPERTY_ENTRY_U32(sensor->prop_nam=
es.rotation, 0);
> +       ret =3D atomisp_csi2_set_pmc_clk_freq(adev, clock_num);
> +       if (ret)
> +               return ret;
>
> -       sensor->ep_properties[0] =3D PROPERTY_ENTRY_U32(sensor->prop_name=
s.bus_type,
> -                                                     V4L2_FWNODE_BUS_TYP=
E_CSI2_DPHY);
> -       sensor->ep_properties[1] =3D PROPERTY_ENTRY_U32_ARRAY_LEN(sensor-=
>prop_names.data_lanes,
> -                                                               bridge->d=
ata_lanes,
> -                                                               sensor->l=
anes);
> -       sensor->ep_properties[2] =3D PROPERTY_ENTRY_REF_ARRAY(sensor->pro=
p_names.remote_endpoint,
> -                                                           sensor->local=
_ref);
> -       if (cfg->nr_link_freqs > 0)
> -               sensor->ep_properties[3] =3D
> -                       PROPERTY_ENTRY_U64_ARRAY_LEN(sensor->prop_names.l=
ink_frequencies,
> -                                                    cfg->link_freqs, cfg=
->nr_link_freqs);
> -
> -       sensor->csi2_properties[0] =3D PROPERTY_ENTRY_U32_ARRAY_LEN(senso=
r->prop_names.data_lanes,
> -                                                                 bridge-=
>data_lanes,
> -                                                                 sensor-=
>lanes);
> -       sensor->csi2_properties[1] =3D PROPERTY_ENTRY_REF_ARRAY(sensor->p=
rop_names.remote_endpoint,
> -                                                             sensor->rem=
ote_ref);
> -}
> -
> -static void atomisp_csi2_init_swnode_names(struct atomisp_csi2_sensor *s=
ensor)
> -{
> -       snprintf(sensor->node_names.remote_port,
> -                sizeof(sensor->node_names.remote_port),
> -                SWNODE_GRAPH_PORT_NAME_FMT, sensor->port);
> -       snprintf(sensor->node_names.port,
> -                sizeof(sensor->node_names.port),
> -                SWNODE_GRAPH_PORT_NAME_FMT, 0); /* Always port 0 */
> -       snprintf(sensor->node_names.endpoint,
> -                sizeof(sensor->node_names.endpoint),
> -                SWNODE_GRAPH_ENDPOINT_NAME_FMT, 0); /* And endpoint 0 */
> -}
> -
> -static void atomisp_csi2_init_swnode_group(struct atomisp_csi2_sensor *s=
ensor)
> -{
> -       struct software_node *nodes =3D sensor->swnodes;
> -
> -       sensor->group[SWNODE_SENSOR] =3D &nodes[SWNODE_SENSOR];
> -       sensor->group[SWNODE_SENSOR_PORT] =3D &nodes[SWNODE_SENSOR_PORT];
> -       sensor->group[SWNODE_SENSOR_ENDPOINT] =3D &nodes[SWNODE_SENSOR_EN=
DPOINT];
> -       sensor->group[SWNODE_CSI2_PORT] =3D &nodes[SWNODE_CSI2_PORT];
> -       sensor->group[SWNODE_CSI2_ENDPOINT] =3D &nodes[SWNODE_CSI2_ENDPOI=
NT];
> -}
> -
> -static void atomisp_csi2_create_connection_swnodes(struct atomisp_csi2_b=
ridge *bridge,
> -                                                  struct atomisp_csi2_se=
nsor *sensor)
> -{
> -       struct software_node *nodes =3D sensor->swnodes;
> -
> -       atomisp_csi2_init_swnode_names(sensor);
> -
> -       nodes[SWNODE_SENSOR] =3D NODE_SENSOR(sensor->name,
> -                                          sensor->dev_properties);
> -       nodes[SWNODE_SENSOR_PORT] =3D NODE_PORT(sensor->node_names.port,
> -                                             &nodes[SWNODE_SENSOR]);
> -       nodes[SWNODE_SENSOR_ENDPOINT] =3D NODE_ENDPOINT(sensor->node_name=
s.endpoint,
> -                                                     &nodes[SWNODE_SENSO=
R_PORT],
> -                                                     sensor->ep_properti=
es);
> -       nodes[SWNODE_CSI2_PORT] =3D NODE_PORT(sensor->node_names.remote_p=
ort,
> -                                           &bridge->csi2_node);
> -       nodes[SWNODE_CSI2_ENDPOINT] =3D NODE_ENDPOINT(sensor->node_names.=
endpoint,
> -                                                   &nodes[SWNODE_CSI2_PO=
RT],
> -                                                   sensor->csi2_properti=
es);
> -
> -       atomisp_csi2_init_swnode_group(sensor);
> -}
> -
> -static void atomisp_csi2_unregister_sensors(struct atomisp_csi2_bridge *=
bridge)
> -{
> -       struct atomisp_csi2_sensor *sensor;
> -       unsigned int i;
> -
> -       for (i =3D 0; i < bridge->n_sensors; i++) {
> -               sensor =3D &bridge->sensors[i];
> -               software_node_unregister_node_group(sensor->group);
> -               acpi_dev_remove_driver_gpios(sensor->adev);
> -               acpi_dev_put(sensor->adev);
> +       sensor->link =3D atomisp_csi2_get_port(adev, clock_num);
> +       if (sensor->link >=3D ATOMISP_CAMERA_NR_PORTS) {
> +               dev_err(&adev->dev, "Invalid port: %u\n", sensor->link);
> +               return -EINVAL;
>         }
> -}
>
> -static int atomisp_csi2_connect_sensor(const struct atomisp_csi2_sensor_=
config *cfg,
> -                                      struct atomisp_csi2_bridge *bridge=
,
> -                                      struct atomisp_device *isp)
> -{
> -       struct fwnode_handle *fwnode, *primary;
> -       struct atomisp_csi2_sensor *sensor;
> -       struct acpi_device *adev;
> -       int ret, clock_num;
> +       if (!acpi_match_device_ids(adev, dual_lane_sensors))
> +               lanes =3D 2;
> +       else
> +               lanes =3D 1;

Can we use positive conditional?

       if (acpi_match_device_ids(adev, dual_lane_sensors))
               lanes =3D 1;
       else
               lanes =3D 2;

> -       for_each_acpi_dev_match(adev, cfg->hid, NULL, -1) {
> -               if (!adev->status.enabled)
> -                       continue;
> -
> -               if (bridge->n_sensors >=3D ATOMISP_CAMERA_NR_PORTS) {
> -                       dev_err(isp->dev, "Exceeded available CSI2 ports\=
n");
> -                       ret =3D -EOVERFLOW;
> -                       goto err_put_adev;
> -               }
> -
> -               sensor =3D &bridge->sensors[bridge->n_sensors];
> -
> -               /*
> -                * ACPI takes care of turning the PMC clock on and off, b=
ut on BYT
> -                * the clock defaults to 25 MHz instead of the expected 1=
9.2 MHz.
> -                * Get the PMC-clock number from ACPI _PR0 method and set=
 it to 19.2 MHz.
> -                * The PMC-clock number is also used to determine the def=
ault CSI port.
> -                */
> -               clock_num =3D atomisp_csi2_get_pmc_clk_nr_from_acpi_pr0(a=
dev);
> -
> -               ret =3D atomisp_csi2_set_pmc_clk_freq(adev, clock_num);
> -               if (ret)
> -                       goto err_put_adev;
> -
> -               sensor->port =3D atomisp_csi2_get_port(adev, clock_num);
> -               if (sensor->port >=3D ATOMISP_CAMERA_NR_PORTS) {
> -                       acpi_handle_err(adev->handle, "Invalid port: %d\n=
", sensor->port);
> -                       ret =3D -EINVAL;
> -                       goto err_put_adev;
> -               }
> -
> -               sensor->lanes =3D gmin_cfg_get_int(adev, "CsiLanes", cfg-=
>lanes);
> -               if (sensor->lanes > CSI2_MAX_LANES) {
> -                       acpi_handle_err(adev->handle, "Invalid number of =
lanes: %d\n", sensor->lanes);
> -                       ret =3D -EINVAL;
> -                       goto err_put_adev;
> -               }
> -
> -               ret =3D atomisp_csi2_add_gpio_mappings(sensor, adev);
> -               if (ret)
> -                       goto err_put_adev;
> -
> -               snprintf(sensor->name, sizeof(sensor->name), "%s-%u",
> -                        cfg->hid, sensor->port);
> -
> -               atomisp_csi2_create_fwnode_properties(sensor, bridge, cfg=
);
> -               atomisp_csi2_create_connection_swnodes(bridge, sensor);
> -
> -               ret =3D software_node_register_node_group(sensor->group);
> -               if (ret)
> -                       goto err_remove_mappings;
> -
> -               fwnode =3D software_node_fwnode(&sensor->swnodes[SWNODE_S=
ENSOR]);
> -               if (!fwnode) {
> -                       ret =3D -ENODEV;
> -                       goto err_free_swnodes;
> -               }
> -
> -               sensor->adev =3D acpi_dev_get(adev);
> -
> -               primary =3D acpi_fwnode_handle(adev);
> -               primary->secondary =3D fwnode;
> -
> -               bridge->n_sensors++;
> +       sensor->lanes =3D gmin_cfg_get_int(adev, "CsiLanes", lanes);
> +       if (sensor->lanes > IPU_MAX_LANES) {
> +               dev_err(&adev->dev, "Invalid lane-count: %d\n", sensor->l=
anes);

Yeah, I think we would be consistent in using the ACPI handle to print
the messages from ACPI sensor devices.

> +               return -EINVAL;
>         }
>
> +       ret =3D atomisp_csi2_add_gpio_mappings(adev);
> +       if (ret)
> +               return ret;
> +
> +       sensor->mclkspeed =3D PMC_CLK_RATE_19_2MHZ;
> +       sensor->rotation =3D 0;
> +       sensor->orientation =3D V4L2_FWNODE_ORIENTATION_EXTERNAL;
> +
>         return 0;
> -
> -err_free_swnodes:
> -       software_node_unregister_node_group(sensor->group);
> -err_remove_mappings:
> -       acpi_dev_remove_driver_gpios(adev);
> -err_put_adev:
> -       acpi_dev_put(adev);
> -       return ret;
> -}
> -
> -static int atomisp_csi2_connect_sensors(struct atomisp_csi2_bridge *brid=
ge,
> -                                       struct atomisp_device *isp)
> -{
> -       unsigned int i;
> -       int ret;
> -
> -       for (i =3D 0; i < ARRAY_SIZE(supported_sensors); i++) {
> -               const struct atomisp_csi2_sensor_config *cfg =3D &support=
ed_sensors[i];
> -
> -               ret =3D atomisp_csi2_connect_sensor(cfg, bridge, isp);
> -               if (ret)
> -                       goto err_unregister_sensors;
> -       }
> -
> -       return 0;
> -
> -err_unregister_sensors:
> -       atomisp_csi2_unregister_sensors(bridge);
> -       return ret;
>  }
>
>  int atomisp_csi2_bridge_init(struct atomisp_device *isp)
>  {
> -       struct atomisp_csi2_bridge *bridge;
>         struct device *dev =3D isp->dev;
>         struct fwnode_handle *fwnode;
> -       int i, ret;
>
>         /*
>          * This function is intended to run only once and then leave
> @@ -716,52 +525,7 @@ int atomisp_csi2_bridge_init(struct atomisp_device *=
isp)
>         if (fwnode && fwnode->secondary)
>                 return 0;
>
> -       bridge =3D kzalloc(sizeof(*bridge), GFP_KERNEL);
> -       if (!bridge)
> -               return -ENOMEM;
> -
> -       strscpy(bridge->csi2_node_name, "atomisp-csi2", sizeof(bridge->cs=
i2_node_name));
> -       bridge->csi2_node.name =3D bridge->csi2_node_name;
> -
> -       ret =3D software_node_register(&bridge->csi2_node);
> -       if (ret < 0) {
> -               dev_err(dev, "Failed to register the CSI2 HID node\n");
> -               goto err_free_bridge;
> -       }
> -
> -       /*
> -        * Map the lane arrangement, which is fixed for the ISP2 (meaning=
 we
> -        * only need one, rather than one per sensor). We include it as a
> -        * member of the bridge struct rather than a global variable so
> -        * that it survives if the module is unloaded along with the rest=
 of
> -        * the struct.
> -        */
> -       for (i =3D 0; i < CSI2_MAX_LANES; i++)
> -               bridge->data_lanes[i] =3D i + 1;
> -
> -       ret =3D atomisp_csi2_connect_sensors(bridge, isp);
> -       if (ret || bridge->n_sensors =3D=3D 0)
> -               goto err_unregister_csi2;
> -
> -       fwnode =3D software_node_fwnode(&bridge->csi2_node);
> -       if (!fwnode) {
> -               dev_err(dev, "Error getting fwnode from csi2 software_nod=
e\n");
> -               ret =3D -ENODEV;
> -               goto err_unregister_sensors;
> -       }
> -
> -       set_secondary_fwnode(dev, fwnode);
> -
> -       return 0;
> -
> -err_unregister_sensors:
> -       atomisp_csi2_unregister_sensors(bridge);
> -err_unregister_csi2:
> -       software_node_unregister(&bridge->csi2_node);
> -err_free_bridge:
> -       kfree(bridge);
> -
> -       return ret;
> +       return ipu_bridge_init(dev, atomisp_csi2_parse_sensor_fwnode);
>  }
>
>  /******* V4L2 sub-device asynchronous registration callbacks***********/
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/s=
taging/media/atomisp/pci/atomisp_v4l2.c
> index c43b916a006e..0d80f0893a2e 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
> @@ -1615,3 +1615,4 @@ MODULE_AUTHOR("Wen Wang <wen.w.wang@intel.com>");
>  MODULE_AUTHOR("Xiaolin Zhang <xiaolin.zhang@intel.com>");
>  MODULE_LICENSE("GPL");
>  MODULE_DESCRIPTION("Intel ATOM Platform ISP Driver");
> +MODULE_IMPORT_NS(INTEL_IPU_BRIDGE);
> --
> 2.41.0
>


--=20
With Best Regards,
Andy Shevchenko
