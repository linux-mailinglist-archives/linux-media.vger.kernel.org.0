Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1BC8388938
	for <lists+linux-media@lfdr.de>; Sat, 10 Aug 2019 09:40:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726230AbfHJHka (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 10 Aug 2019 03:40:30 -0400
Received: from mail-ua1-f65.google.com ([209.85.222.65]:42773 "EHLO
        mail-ua1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725468AbfHJHk3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 10 Aug 2019 03:40:29 -0400
Received: by mail-ua1-f65.google.com with SMTP id a97so38515667uaa.9;
        Sat, 10 Aug 2019 00:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JKA+g44gPbPhOAql7+ujl9AKOe4s13G1qF6oSrmDyKk=;
        b=UGQ5y+XE2yPBEzlvuoaX+4VMj7vuQf6/gwllVQH1hpm12xuP7LtcsThnRnNX+1ZcM1
         9D1/1t8zWWGdcrPjUOkXNh3VyYRAo+Nnz0Vb1N0lXc593QMghqFsQHM4C541KCGT1YHp
         PWd/zNdTGfdedjimkBlcogVEfhb39oGYXgUmTZfpZB8bGUlf7Iu9T0buNya61bv0wrUq
         Obvtd/6amMcGRNnz/9+ST7TZ7XNOHZp9DIvmsFn/JJTHKviSACHN56YA30uJLKXNlJM2
         mbDZE9lLs0Okrk/so93WBfHnSsYxVfpaXgm3mx4oYWHj25RjBxJRuwVkBD8nI6Mj8cOf
         GYhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JKA+g44gPbPhOAql7+ujl9AKOe4s13G1qF6oSrmDyKk=;
        b=j3jv6Na9LGB/R5ouRM/OlEBVlENQk4fDPUt+zjN3KXh2hV6HtfUam76C37/Uwkuti7
         9Ga9QvMaSs5ZoOwSow628kRMpwV42RKF79qJAkPEJw4I4JUBBhB4Gc3QQ/ENJfYJfm0W
         wXvB+2DwLGdKE3/72I9n/d4/IZPaACEsoow4yhIAAI8K86Ii0yU03cIJWxRhlnNuZwVx
         iP6M3UOP8k3OZrRnJPfY02LxsuoQaHO+RG9mwSjyT9VUvxwmnS3EFPWBhVG+iouGPWJg
         eBDtEKpvvYRSMnwNG9B8aqqvcRsj8/PvLnavIL99CyA1LRvOBSjNJljf5lONTEg3WaQf
         si5g==
X-Gm-Message-State: APjAAAV9otV2EVKjCyKdiQyWUnvnj/ot4UmObHR7NY4JA6UbbCTbIFIi
        De6C5V74DtuaMY8LLPaC4v95tj9Tk3XT2EfHyPM=
X-Google-Smtp-Source: APXvYqy6hCdX4Nk1EABkmYaPr3zeofn7Rn4pnkzFWmGVIpKswp3amJ4aFTUPHyvzjZlYlmkS4dqVI5quyRCS/Bmvy7s=
X-Received: by 2002:ab0:7149:: with SMTP id k9mr15250246uao.115.1565422826207;
 Sat, 10 Aug 2019 00:40:26 -0700 (PDT)
MIME-Version: 1.0
References: <20181207182200.25283-1-helen.koike@collabora.com>
In-Reply-To: <20181207182200.25283-1-helen.koike@collabora.com>
From:   Dafna Hirschfeld <dafna3@gmail.com>
Date:   Sat, 10 Aug 2019 09:40:14 +0200
Message-ID: <CAJ1myNR8uEpWoYSjvert5NewABBOZqD8eX-r_DCeiWfEz_4bdA@mail.gmail.com>
Subject: Re: [PATCH] media: vimc: add configfs API to configure the topology
To:     Helen Koike <helen.koike@collabora.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>, mchehab@kernel.org,
        lkcamp@lists.libreplanetbr.org, kernel@collabora.com,
        linux-kernel@vger.kernel.org, joel.becker@oracle.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,
I will continue working on this patch that Helen started.
Regarding the requirements, if an entity is removed, should all the
links related to it also be removed?
Also, should it be possible to create a link with entities that do not exist?
The reason to keep links between non existing entities is that it
allows to easily unplug an entity for testing,
and the links related to it can be ignored while still be visible
through the configfs.

I have also some inline comments.

On Fri, Dec 7, 2018 at 7:24 PM Helen Koike <helen.koike@collabora.com> wrote:
>
> Add API to allow userspace to create any type of topology in vimc using
> basic system calls such as mkdir/rmdir/read/write.
>
> Signed-off-by: Helen Koike <helen.koike@collabora.com>
>
> ---
> Hi,
>
> This patch introduces the configufs API for configuring the topology in
> vimc while it removes the hardcoded topology, so now, when you load the
> module you need to create a device (no device will appear in your system
> by default) using mkdir/rmdir/write/read.
> Please see documentation in the patch.
> I was thinking in adding a device by default, but if I do it in
> configfs, userspace won't be able to delete the device (which might not
> be a problem), as I need to create it as a "default" group in configfs,
> or I can just not expose the default device in the configfs.
> What do you think?
>
> Thanks
> Helen
>
>  Documentation/media/v4l-drivers/vimc.rst    | 172 +++++
>  drivers/media/platform/vimc/Kconfig         |   7 +-
>  drivers/media/platform/vimc/Makefile        |   7 +-
>  drivers/media/platform/vimc/vimc-capture.c  |  46 +-
>  drivers/media/platform/vimc/vimc-common.h   |  58 +-
>  drivers/media/platform/vimc/vimc-configfs.c | 665 ++++++++++++++++++++
>  drivers/media/platform/vimc/vimc-configfs.h |  30 +
>  drivers/media/platform/vimc/vimc-core.c     | 283 ++-------
>  drivers/media/platform/vimc/vimc-core.h     |  17 +
>  drivers/media/platform/vimc/vimc-debayer.c  |  51 +-
>  drivers/media/platform/vimc/vimc-scaler.c   |  49 +-
>  drivers/media/platform/vimc/vimc-sensor.c   |  43 +-
>  12 files changed, 1153 insertions(+), 275 deletions(-)
>  create mode 100644 Documentation/media/v4l-drivers/vimc.rst
>  create mode 100644 drivers/media/platform/vimc/vimc-configfs.c
>  create mode 100644 drivers/media/platform/vimc/vimc-configfs.h
>  create mode 100644 drivers/media/platform/vimc/vimc-core.h
>
> diff --git a/Documentation/media/v4l-drivers/vimc.rst b/Documentation/media/v4l-drivers/vimc.rst
> new file mode 100644
> index 000000000000..28d3b02c7d30
> --- /dev/null
> +++ b/Documentation/media/v4l-drivers/vimc.rst
> @@ -0,0 +1,172 @@
> +The Virtual Media Controller Driver (vimc)
> +=========================================
> +
> +This driver emulates video4linux hardware of varios media topologies. It exposes
> +media devices through /dev/mediaX notes, video capture devices through
> +/dev/videoX and sub-devices through /dev/v4l-subdevX.
> +
> +A subdevice can be a sensor, a debayer or a scaler.
> +
> +To configure a media device of a given topology, a ConfigFS API is provided.
> +
> +
> +Configuring the driver through ConfigFS (Experimental)
> +------------------------------------------------------
> +
> +.. note::
> +This API is not finished yet and might change in the future.
> +
> +Mount configfs:
> +::
> +       $ mkdir /configfs
> +       $ mount -t configfs none /configfs
> +
> +When loading the module, you see a folders name vimc
> +::
> +       $ tree /configfs/
> +       /configfs/
> +       `-- vimc
> +
> +1) Creating a media device
> +~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +To create a media device just create a new folder under /configfs/vimc/
> +
> +Example:
> +::
> +       $ mkdir /configfs/vimc/mdev
> +       $ tree /configfs/vimc/mdev
> +       /configfs/vimc/mdev/
> +       |-- entities/
> +       |-- hotplug
> +       `-- links/
> +
> +       2 directories, 1 file
> +
> +2) Creating entities
> +~~~~~~~~~~~~~~~~~~~~
> +
> +To create an entity in the media device's topology, just create a folder under
> +/configfs/vimc/<mdev-name>/entities/ with the following format:
> +
> +       <sub-module>:<name>
> +
> +Where <sub-module> is one of the following:
> +::
> +       vimc-sensor
> +       vimc-scaler
> +       vimc-debayer
> +       vimc-capture
> +
> +Example:
> +::
> +       $ mkdir /configfs/vimc/mdev/entities/vimc-sensor:my-sensor
> +       $ mkdir /configfs/vimc/mdev/entities/vimc-capture:my-capture
> +       $ tree /configfs/
> +       /configfs/
> +       `-- vimc/
> +           `-- mdev/
> +               |-- entities/
> +               |   |-- vimc-capture:my-capture/
> +               |   |   `-- pad:sink:0/
> +               |   `-- vimc-sensor:my-sensor/
> +               |       `-- pad:source:0/
> +               |-- hotplug
> +               `-- links/
> +
> +       8 directories, 1 file
> +
> +3) Creating links
> +~~~~~~~~~~~~~~~~~
> +
> +To create links between two entities in the topology, just create a folder under
> +/configfs/vimc/<mdev-name>/links/ with the following format:
> +
> +       "<entity1-name><pad-source>:<entity2-name><pad-sink>"
> +
> +Example:
> +::
> +       $ mkdir "/configfs/vimc/mdev/links/my-sensor:0->my-capture:0"
> +       $ tree /configfs
> +       /configfs/
> +       `-- vimc/
> +           `-- mdev/
> +               |-- entities/
> +               |   |-- vimc-capture:my-capture/
> +               |   |   `-- pad:sink:0/
> +               |   `-- vimc-sensor:my-sensor/
> +               |       `-- pad:source:0/
> +               |-- hotplug
> +               `-- links/
> +                   `-- my-sensor:0->my-capture:0/
> +                       `-- flags
> +
> +       9 directories, 2 files
> +
> +Change the attributes of the link by writing in the file
> +"/configfs/vimc/<mdev-name>/links/<my-link>/flags"
> +
> +Flag values are defined in :ref:`include/uapi/linux/media.h <media_header>`
> +( seek for ``MEDIA_LNK_FL_*``)
> +
> +1 - Enabled
> +       Indicates the link will be enabled when the media device is created.
> +
> +3 - Enabled and Immutable
> +       Indicates that the link enabled state can't be modified at runtime.
> +
> +Example:
> +::
> +       $ echo 3 > "/configfs/vimc/mdev/links/my-sensor:0->my-capture:0/flags"
> +
> +4) Activating/Deactivating device
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +To activate the device, write one of "plugged", "plug" or "1" to file
> +/configfs/vimc/<ndev-name>/hotplug
> +
> +Example:
> +::
> +       $ echo 1 > /configfs/vimc/mdev/hotplug
> +
> +You should see a new node /dev/mediaX in your devfs.
> +
> +To deactivate the device, write one of "unplugged", "unplug" or "0" to file
> +/configfs/vimc/<ndev-name>/hotplug
> +
> +Example:
> +::
> +       $ echo 0 > /configfs/vimc/mdev/hotplug
> +
> +Subdevices
> +----------
> +
> +Subdevices defines the behavior of an entity in the topology. Depending on the
> +subdevice, the entity can have multiple pads of type source or sink.
> +
> +vimc-sensor:
> +       Generates images in several formats using video test pattern generator.
> +       Exposes:
> +
> +       * 1 Pad source
> +
> +vimc-debayer:
> +       Transforms images in bayer format into a non bayer format.
> +       Exposes:
> +
> +       * 1 Pad sink
> +       * 1 Pad source
> +
> +vimc-scaler:
> +       Mutiplies the size of the image by 3.
> +       Exposes:
> +
> +       * 1 Pad sink
> +       * 1 Pad source
> +
> +vimc-capture:
> +       Exposes node /dev/videoX to allow userspace to capture the stream.
> +       Exposes:
> +
> +       * 1 Pad sink
> +       * 1 Pad source
> diff --git a/drivers/media/platform/vimc/Kconfig b/drivers/media/platform/vimc/Kconfig
> index 71c9fe7d3370..7f1fb550d4c3 100644
> --- a/drivers/media/platform/vimc/Kconfig
> +++ b/drivers/media/platform/vimc/Kconfig
> @@ -1,15 +1,14 @@
>  config VIDEO_VIMC
>         tristate "Virtual Media Controller Driver (VIMC)"
> -       depends on VIDEO_DEV && VIDEO_V4L2 && VIDEO_V4L2_SUBDEV_API
> +       depends on VIDEO_DEV && VIDEO_V4L2 && VIDEO_V4L2_SUBDEV_API && CONFIGFS_FS
>         select VIDEOBUF2_VMALLOC
>         select VIDEO_V4L2_TPG
>         default n
>         ---help---
> -         Skeleton driver for Virtual Media Controller
> +         Virtual Media Controller Driver
>
>           This driver can be compared to the vivid driver for emulating
>           a media node that exposes a complex media topology. The topology
> -         is hard coded for now but is meant to be highly configurable in
> -         the future.
> +         is configurable through configfs API.
>
>           When in doubt, say N.
> diff --git a/drivers/media/platform/vimc/Makefile b/drivers/media/platform/vimc/Makefile
> index 4b2e3de7856e..5d926a5ef15c 100644
> --- a/drivers/media/platform/vimc/Makefile
> +++ b/drivers/media/platform/vimc/Makefile
> @@ -1,10 +1,9 @@
>  # SPDX-License-Identifier: GPL-2.0
> -vimc-objs := vimc-core.o
> +vimc-objs := vimc-core.o vimc-common.o vimc-configfs.o
>  vimc_capture-objs := vimc-capture.o
> -vimc_common-objs := vimc-common.o
>  vimc_debayer-objs := vimc-debayer.o
>  vimc_scaler-objs := vimc-scaler.o
>  vimc_sensor-objs := vimc-sensor.o
>
> -obj-$(CONFIG_VIDEO_VIMC) += vimc.o vimc_capture.o vimc_common.o vimc-debayer.o \
> -                               vimc_scaler.o vimc_sensor.o
> +obj-$(CONFIG_VIDEO_VIMC) += vimc.o vimc_capture.o vimc-debayer.o vimc_scaler.o \
> +                               vimc_sensor.o
> diff --git a/drivers/media/platform/vimc/vimc-capture.c b/drivers/media/platform/vimc/vimc-capture.c
> index 3f7e9ed56633..55a5f85b4591 100644
> --- a/drivers/media/platform/vimc/vimc-capture.c
> +++ b/drivers/media/platform/vimc/vimc-capture.c
> @@ -23,6 +23,7 @@
>  #include <media/videobuf2-core.h>
>  #include <media/videobuf2-vmalloc.h>
>
> +#include "vimc-configfs.h"
>  #include "vimc-common.h"
>
>  #define VIMC_CAP_DRV_NAME "vimc-capture"
> @@ -418,7 +419,7 @@ static int vimc_cap_comp_bind(struct device *comp, struct device *master,
>         }
>
>         /* Initialize the media entity */
> -       vcap->vdev.entity.name = pdata->entity_name;
> +       vcap->vdev.entity.name = pdata->name;
>         vcap->vdev.entity.function = MEDIA_ENT_F_IO_V4L;
>         ret = media_entity_pads_init(&vcap->vdev.entity,
>                                      1, vcap->ved.pads);
> @@ -443,7 +444,7 @@ static int vimc_cap_comp_bind(struct device *comp, struct device *master,
>         ret = vb2_queue_init(q);
>         if (ret) {
>                 dev_err(comp, "%s: vb2 queue init failed (err=%d)\n",
> -                       pdata->entity_name, ret);
> +                       pdata->name, ret);
>                 goto err_clean_m_ent;
>         }
>
> @@ -476,7 +477,7 @@ static int vimc_cap_comp_bind(struct device *comp, struct device *master,
>         vdev->queue = q;
>         vdev->v4l2_dev = v4l2_dev;
>         vdev->vfl_dir = VFL_DIR_RX;
> -       strscpy(vdev->name, pdata->entity_name, sizeof(vdev->name));
> +       strscpy(vdev->name, pdata->name, sizeof(vdev->name));
>         video_set_drvdata(vdev, &vcap->ved);
>
>         /* Register the video_device with the v4l2 and the media framework */
> @@ -534,7 +535,44 @@ static struct platform_driver vimc_cap_pdrv = {
>         },
>  };
>
> -module_platform_driver(vimc_cap_pdrv);
> +static struct config_item_type vimc_cap_cfs_pad_type = {
> +       .ct_owner       = THIS_MODULE,
> +};
> +
> +static struct config_group vimc_cap_cfs_sink_pad_group;
> +
> +static void vimc_cap_configfs_cb(struct config_group *group)
> +{
> +       config_group_init_type_name(&vimc_cap_cfs_sink_pad_group,
> +                                   VIMC_CFS_SINK_PAD_NAME(0),
> +                                   &vimc_cap_cfs_pad_type);
> +       configfs_add_default_group(&vimc_cap_cfs_sink_pad_group, group);
> +}
> +
> +struct vimc_cfs_drv vimc_cap_cfs_drv = {
> +       .name = VIMC_CAP_DRV_NAME,
> +       .configfs_cb = vimc_cap_configfs_cb,
> +};
> +
> +static int __init vimc_cap_init(void)
> +{
> +       int ret = platform_driver_register(&vimc_cap_pdrv);
> +
> +       if (ret)
> +               return ret;
> +
> +       vimc_cfs_drv_register(&vimc_cap_cfs_drv);
> +       return 0;
> +}
> +
> +static void __exit vimc_cap_exit(void)
> +{
> +       platform_driver_unregister(&vimc_cap_pdrv);
> +       vimc_cfs_drv_unregister(&vimc_cap_cfs_drv);
> +}
> +
> +module_init(vimc_cap_init);
> +module_exit(vimc_cap_exit);
>
>  MODULE_DEVICE_TABLE(platform, vimc_cap_driver_ids);
>
> diff --git a/drivers/media/platform/vimc/vimc-common.h b/drivers/media/platform/vimc/vimc-common.h
> index 2e9981b18166..9a33e7901b72 100644
> --- a/drivers/media/platform/vimc/vimc-common.h
> +++ b/drivers/media/platform/vimc/vimc-common.h
> @@ -22,6 +22,8 @@
>  #include <media/media-device.h>
>  #include <media/v4l2-device.h>
>
> +#define VIMC_MAX_NAME_LEN 32
> +
>  /* VIMC-specific controls */
>  #define VIMC_CID_VIMC_BASE             (0x00f00000 | 0xf000)
>  #define VIMC_CID_VIMC_CLASS            (0x00f00000 | 1)
> @@ -63,16 +65,62 @@ do {                                                                        \
>  /**
>   * struct vimc_platform_data - platform data to components
>   *
> - * @entity_name:       The name of the entity to be created
> + * @name:      The name of the device
> + * @group:     The configfs group the device belongs
>   *
>   * Board setup code will often provide additional information using the device's
>   * platform_data field to hold additional information.
> - * When injecting a new platform_device in the component system the core needs
> - * to provide to the corresponding submodules the name of the entity that should
> - * be used when registering the subdevice in the Media Controller system.
> + * When injecting a new platform_device in the component system, the name of the
> + * device is required to allow the system to register it with a proper name.
> + * Also the configfs group is given to allow the driver to add custom items in
> + * the group.
> + * This struct is used by the entity submodules and the core system to be able
> + * to retrieve the name to register the device in the Media Controller system.
>   */
>  struct vimc_platform_data {
> -       char entity_name[32];
> +       char name[VIMC_MAX_NAME_LEN];
> +       struct config_group *group;
> +};
> +
> +/**
> + * struct vimc_platform_data_link - platform data to components of type link
> + *
> + * @source:    source component of the link
> + * @source_pad:        source pad of the link
> + * @sink:      sink component of the link
> + * @sink_pad:  sink pad of the link
> + * @flags:     flags of the link
> + *
> + * Board setup code will often provide additional information using the device's
> + * platform_data field to hold additional information.
> + * When injecting a new platform_device representing a link in the component
> + * system, source and sink information is required to allow the link module to
> + * create the proper link between entities.
> + */
> +struct vimc_platform_data_link {
> +       struct platform_device *source;
> +       u16 source_pad;
> +       struct platform_device *sink;
> +       u16 sink_pad;
> +       u32 flags;
> +       struct list_head list;
> +};
> +
> +/**
> + * struct vimc_platform_data_core - platform data to the core
> + *
> + * @data:      see struct vimc_platform_data
> + * @links:     list of struct vimc_platform_data_link
> + *
> + * Board setup code will often provide additional information using the device's
> + * platform_data field to hold additional information.
> + * When injecting a new platform_device representing the core component, a list
> + * of struct vimc_platform_data_list is required to allow the core to create
> + * create the proper links between entities.
> + */
> +struct vimc_platform_data_core {
> +       struct vimc_platform_data data;
> +       struct list_head *links;
>  };
>
>  /**
> diff --git a/drivers/media/platform/vimc/vimc-configfs.c b/drivers/media/platform/vimc/vimc-configfs.c
> new file mode 100644
> index 000000000000..68e5f1ea736b
> --- /dev/null
> +++ b/drivers/media/platform/vimc/vimc-configfs.c
> @@ -0,0 +1,665 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * vimc-configfs.c Virtual Media Controller Driver
> + *
> + * Copyright (C) 2018 Helen Koike <helen.koike@collabora.com>
> + */
> +
> +#include <linux/component.h>
> +#include <linux/module.h>
> +#include <linux/slab.h>
> +#include <linux/platform_device.h>
> +
> +#include "vimc-common.h"
> +#include "vimc-configfs.h"
> +#include "vimc-core.h"
> +
> +#define CHAR_SEPARATOR ':'
> +#define LINK_SEPARATOR "->"
> +#define CFS_SUBSYS_NAME "vimc"
> +
> +#define ci_err(ci, fmt, ...) \
> +       pr_err("vimc: %s: " pr_fmt(fmt), (ci)->ci_name, ##__VA_ARGS__)
> +#define cg_err(cg, ...) ci_err(&(cg)->cg_item, ##__VA_ARGS__)
> +#define ci_warn(ci, fmt, ...) \
> +       pr_warn("vimc: %s: " pr_fmt(fmt), (ci)->ci_name, ##__VA_ARGS__)
> +#define cg_warn(cg, ...) ci_warn(&(cg)->cg_item, ##__VA_ARGS__)
> +#define ci_dbg(ci, fmt, ...) \
> +       pr_debug("vimc: %s: " pr_fmt(fmt), (ci)->ci_name, ##__VA_ARGS__)
> +#define cg_dbg(cg, ...) ci_dbg(&(cg)->cg_item, ##__VA_ARGS__)
> +
> +#define is_plugged(cfs) (!!(cfs)->pdev)
> +
> +enum vimc_cfs_hotplug_state {
> +       VIMC_CFS_HOTPLUG_STATE_UNPLUGGED = 0,
> +       VIMC_CFS_HOTPLUG_STATE_PLUGGED = 1,
> +};
> +
> +const static char *vimc_cfs_hotplug_values[2][3] = {
> +       [VIMC_CFS_HOTPLUG_STATE_UNPLUGGED] = {"unplugged\n", "unplug\n", "0\n"},
> +       [VIMC_CFS_HOTPLUG_STATE_PLUGGED] = {"plugged\n", "plug\n", "1\n"},
> +};
> +
> +/* --------------------------------------------------------------------------
> + * Pipeline structures
> + */
> +
> +static struct vimc_cfs_subsystem {
> +       struct configfs_subsystem subsys;
> +       struct list_head drvs;
> +} vimc_cfs_subsys;
> +
> +/* Structure which describes the whole topology */
> +struct vimc_cfs_device {
> +       struct platform_device *pdev;
> +       struct vimc_platform_data_core pdata;
> +       struct list_head ents;
> +       struct list_head links;
> +       struct config_group gdev;
> +       struct config_group gents;
> +       struct config_group glinks;
> +};
> +
> +/* Structure which describes individual configuration for each entity */
> +struct vimc_cfs_ent {
> +       struct platform_device *pdev;
> +       struct vimc_platform_data pdata;
> +       char drv[VIMC_MAX_NAME_LEN];
> +       struct list_head list;
> +       struct config_group cg;
> +};
> +
> +/* Structure which describes links between entities */
> +struct vimc_cfs_link {
> +       struct vimc_platform_data_link pdata;
> +       char source_name[VIMC_MAX_NAME_LEN];
> +       char sink_name[VIMC_MAX_NAME_LEN];
> +       struct config_item ci;
> +};
> +
> +void vimc_cfs_drv_register(struct vimc_cfs_drv *c_drv)
> +{
> +       list_add(&c_drv->list, &vimc_cfs_subsys.drvs);
> +}
> +EXPORT_SYMBOL_GPL(vimc_cfs_drv_register);
> +
> +void vimc_cfs_drv_unregister(struct vimc_cfs_drv *c_drv)
> +{
> +       list_del(&c_drv->list);
> +}
> +EXPORT_SYMBOL_GPL(vimc_cfs_drv_unregister);
> +
> +/* --------------------------------------------------------------------------
> + * Platform Device builders
> + */
> +
> +static int vimc_cfs_link_get_entities(const struct vimc_cfs_device *cfs,
> +                                      struct vimc_cfs_link *c_link)
> +{
> +       struct vimc_cfs_ent *c_ent;
> +
> +       c_link->pdata.source = NULL;
> +       c_link->pdata.sink = NULL;
> +       list_for_each_entry(c_ent, &cfs->ents, list) {
> +               if (!c_link->pdata.source &&
> +                   !strcmp(c_ent->pdata.name, c_link->source_name))
> +                       c_link->pdata.source = c_ent->pdev;
> +               if (!c_link->pdata.sink &&
> +                   !strcmp(c_ent->pdata.name, c_link->sink_name))
> +                       c_link->pdata.sink = c_ent->pdev;
> +               if (c_link->pdata.source && c_link->pdata.sink)
> +                       return 0;
> +       }
> +       return -EINVAL;
> +}
> +
> +static int vimc_cfs_comp_compare(struct device *comp, void *data)
> +{
> +       dev_dbg(comp, "comp compare %p %p", comp, data);
> +
> +       return comp == data;
> +}
> +
> +static const struct component_master_ops vimc_cfs_comp_ops = {
> +       .bind = vimc_core_comp_bind,
> +       .unbind = vimc_core_comp_unbind,
> +};
> +
> +static void vimc_cfs_device_unplug(struct vimc_cfs_device *cfs)
> +{
> +       struct vimc_cfs_ent *c_ent;
> +
> +       dev_dbg(&cfs->pdev->dev, "Unplugging device");
> +
> +       component_master_del(&cfs->pdev->dev, &vimc_cfs_comp_ops);
> +       list_for_each_entry(c_ent, &cfs->ents, list) {
> +               platform_device_unregister(c_ent->pdev);
> +               c_ent->pdev = NULL;
> +       }
> +       platform_device_unregister(cfs->pdev);
> +       cfs->pdev = NULL;
> +}
> +
> +static int vimc_cfs_device_plug(struct vimc_cfs_device *cfs)
> +{
> +       struct component_match *match = NULL;
> +       struct vimc_cfs_ent *c_ent;
> +       struct vimc_cfs_link *c_link;
> +       int ret = 0;
> +
> +       cg_dbg(&cfs->gdev, "Plugging device");
> +
> +       if (list_empty(&cfs->ents)) {
> +               /* TODO: add support for a default topology */
> +               cg_err(&cfs->gdev,
> +                       "At least an entity is required to plug the device");
> +               return -EINVAL;
> +       }
> +
> +       cfs->pdev = platform_device_register_data(NULL, VIMC_CORE_PDEV_NAME,
> +                                                 PLATFORM_DEVID_AUTO,
> +                                                 &cfs->pdata,
> +                                                 sizeof(cfs->pdata));
> +       if (IS_ERR(cfs->pdev))
> +               return PTR_ERR(cfs->pdev);
> +
> +       /* Add component_match for inner structure of the pipeline */
> +       list_for_each_entry(c_ent, &cfs->ents, list) {
> +               cg_dbg(&c_ent->cg, "registering entity %s:%s", c_ent->drv,
> +                      c_ent->pdata.name);
> +               if (c_ent->pdev)
> +                       cg_err(&c_ent->cg, "pdev is not null");
> +               c_ent->pdev = platform_device_register_data(&cfs->pdev->dev,
> +                                                       c_ent->drv,
> +                                                       PLATFORM_DEVID_AUTO,
> +                                                       &c_ent->pdata,
> +                                                       sizeof(c_ent->pdata));
> +               if (IS_ERR(c_ent->pdev)) {
> +                       ret = PTR_ERR(c_ent->pdev);
> +                       goto unregister_ents;
> +               }
> +               component_match_add(&cfs->pdev->dev, &match,
> +                                   vimc_cfs_comp_compare, &c_ent->pdev->dev);
> +       }
> +       list_for_each_entry(c_link, cfs->pdata.links, pdata.list) {
> +               ret = vimc_cfs_link_get_entities(cfs, c_link);
> +               if (ret) {
> +                       ci_err(&c_link->ci, "could not validate link");
> +                       goto unregister_ents;
> +               }
> +       }
> +
> +       dev_dbg(&cfs->pdev->dev, "Adding master device");
> +       ret = component_master_add_with_match(&cfs->pdev->dev,
> +                                             &vimc_cfs_comp_ops, match);
> +       if (ret)
> +               goto unregister_ents;
> +
> +       return 0;
> +
> +unregister_ents:
> +       list_for_each_entry_continue_reverse(c_ent, &cfs->ents, list) {
> +               platform_device_unregister(c_ent->pdev);
> +               c_ent->pdev = NULL;
> +       }
> +
> +       platform_device_unregister(cfs->pdev);
> +       cfs->pdev = NULL;
> +
> +       return ret;
> +}
> +
> +/* --------------------------------------------------------------------------
> + * Links
> + */
> +
> +static ssize_t vimc_cfs_links_attr_flags_show(struct config_item *item,
> +                                             char *buf)
> +{
> +       struct vimc_cfs_link *c_link = container_of(item, struct vimc_cfs_link,
> +                                                   ci);
> +
> +       sprintf(buf, "%d\n", c_link->pdata.flags);
> +       return strlen(buf);
> +}
> +
> +static ssize_t vimc_cfs_links_attr_flags_store(struct config_item *item,
> +                                              const char *buf, size_t size)
> +{
> +       struct vimc_cfs_link *c_link = container_of(item, struct vimc_cfs_link,
> +                                                   ci);
> +
> +       if (kstrtou32(buf, 0, &c_link->pdata.flags))
> +               return -EINVAL;
> +
> +       return size;
> +}
> +
> +CONFIGFS_ATTR(vimc_cfs_links_attr_, flags);
> +
> +static struct configfs_attribute *vimc_cfs_link_attrs[] = {
> +       &vimc_cfs_links_attr_attr_flags,
> +       NULL,
> +};
> +
> +static void vimc_cfs_link_release(struct config_item *item)
> +{
> +       struct vimc_cfs_link *c_link = container_of(item, struct vimc_cfs_link,
> +                                                   ci);
> +
> +       kfree(c_link);
> +}
> +
> +static struct configfs_item_operations vimc_cfs_link_item_ops = {
> +       .release        = vimc_cfs_link_release,
> +};
> +
> +static struct config_item_type vimc_cfs_link_type = {
> +       .ct_item_ops    = &vimc_cfs_link_item_ops,
> +       .ct_attrs       = vimc_cfs_link_attrs,
> +       .ct_owner       = THIS_MODULE,
> +};
> +
> +static void vimc_cfs_link_drop_item(struct config_group *group,
> +                                   struct config_item *item)
> +{
> +       struct vimc_cfs_link *link = container_of(item,
> +                                                 struct vimc_cfs_link, ci);
> +       struct vimc_cfs_device *cfs = container_of(group,
> +                                                  struct vimc_cfs_device,
> +                                                  glinks);
> +
> +       if (is_plugged(cfs))
> +               vimc_cfs_device_unplug(cfs);
> +       list_del(&link->pdata.list);
> +}
> +
> +static struct config_item *vimc_cfs_link_make_item(struct config_group *group,
> +                                                  const char *name)
> +{
> +       struct vimc_cfs_device *cfs = container_of(group,
> +                                                  struct vimc_cfs_device,
> +                                                  glinks);
> +       size_t src_pad_strlen, sink_pad_strlen, sink_namelen, source_namelen;
> +       const char *sep, *src_pad_str, *sink_pad_str, *sink_name,
> +             *source_name = name;
> +       struct vimc_cfs_link *c_link;
> +       u16 source_pad, sink_pad;
> +       char tmp[4];
> +
> +       cg_dbg(&cfs->gdev, "Creating link %s", name);
> +
> +       if (is_plugged(cfs))
> +               vimc_cfs_device_unplug(cfs);
> +
> +       /* Parse format "source_name:source_pad->sink_name:sink_pad" */
> +       sep = strchr(source_name, CHAR_SEPARATOR);
> +       if (!sep)
> +               goto syntax_error;
> +       source_namelen = (size_t)(sep - source_name);
> +
> +       src_pad_str = &sep[1];
> +       sep = strstr(src_pad_str, LINK_SEPARATOR);
> +       if (!sep)
> +               goto syntax_error;
> +       src_pad_strlen = (size_t)(sep - src_pad_str);
> +
> +       sink_name = &sep[strlen(LINK_SEPARATOR)];
> +       sep = strchr(sink_name, CHAR_SEPARATOR);
> +       if (!sep)
> +               goto syntax_error;
> +       sink_namelen = (size_t)(sep - sink_name);
> +
> +       sink_pad_str = &sep[1];
> +       sink_pad_strlen = strlen(sink_pad_str);
> +
> +       /* Validate sizes */
> +       if (!src_pad_strlen || !sink_pad_strlen ||
> +           !sink_namelen || !source_namelen)
> +               goto syntax_error;
> +
> +       /* we limit the size here so we don't need to allocate another buffer */
> +       if (src_pad_strlen >= sizeof(tmp) || sink_pad_strlen >= sizeof(tmp)) {
> +               cg_err(&cfs->gdev,
> +                      "Pad with more then %ld digits is not supported",
> +                      sizeof(tmp) - 1);
> +               goto syntax_error;
> +       }
> +       strscpy(tmp, src_pad_str, src_pad_strlen + 1);
> +       if (kstrtou16(tmp, 0, &source_pad)) {
> +               cg_err(&cfs->gdev, "Couldn't convert pad %s to number", tmp);
> +               goto syntax_error;
> +       }
> +       strscpy(tmp, sink_pad_str, sink_pad_strlen + 1);
> +       if (kstrtou16(tmp, 0, &sink_pad)) {
> +               cg_err(&cfs->gdev, "Couldn't convert pad %s to number", tmp);
> +               goto syntax_error;
> +       }
> +
> +       c_link = kzalloc(sizeof(*c_link), GFP_KERNEL);
> +       if (!c_link)
> +               return ERR_PTR(-ENOMEM);
> +
> +       c_link->pdata.source_pad = source_pad;
> +       c_link->pdata.sink_pad = sink_pad;
> +       strscpy(c_link->source_name, source_name, source_namelen + 1);
> +       strscpy(c_link->sink_name, sink_name, sink_namelen + 1);
> +
> +       /* Configure group */
> +       list_add(&c_link->pdata.list, cfs->pdata.links);
I am not sure how should the config_item_get/config_item_put should be used
For example a reference to an item is added here to a linked-list. So
does it require a call to config_item_get ?

> +       config_item_init_type_name(&c_link->ci, name, &vimc_cfs_link_type);
> +
> +       return &c_link->ci;
> +
> +syntax_error:
> +       cg_err(&cfs->gdev,
> +               "Couldn't create link %s, wrong syntax.", name);
> +       return ERR_PTR(-EINVAL);
> +}
> +
> +/* --------------------------------------------------------------------------
> + * Entities
> + */
> +
> +/* *TODO: add support for hotplug in entity level */
> +
> +static int vimc_cfs_drv_cb(const char *drv_name, struct config_group *group)
> +{
> +       struct vimc_cfs_drv *c_drv = NULL;
> +
> +       list_for_each_entry(c_drv, &vimc_cfs_subsys.drvs, list) {
> +               if (!strcmp(drv_name, c_drv->name))
> +                       break;
> +       }
> +       if (!c_drv)
> +               return -EINVAL;
> +
> +       if (c_drv->configfs_cb)
> +               c_drv->configfs_cb(group);
> +
> +       return 0;
> +}
> +
> +static void vimc_cfs_ent_release(struct config_item *item)
> +{
> +       struct vimc_cfs_ent *c_ent = container_of(item, struct vimc_cfs_ent,
> +                                                 cg.cg_item);
> +
> +       kfree(c_ent);
> +}
> +
> +static struct configfs_item_operations vimc_cfs_ent_item_ops = {
> +       .release        = vimc_cfs_ent_release,
> +};
> +
> +static struct config_item_type vimc_cfs_ent_type = {
> +       .ct_item_ops    = &vimc_cfs_ent_item_ops,
> +       .ct_owner       = THIS_MODULE,
> +};
> +
> +static void vimc_cfs_ent_drop_item(struct config_group *group,
> +                                  struct config_item *item)
> +{
> +       struct vimc_cfs_ent *c_ent = container_of(item, struct vimc_cfs_ent,
> +                                                 cg.cg_item);
> +       struct vimc_cfs_device *cfs = container_of(group,
> +                                                  struct vimc_cfs_device,
> +                                                  gents);
> +
> +       if (is_plugged(cfs))
> +               vimc_cfs_device_unplug(cfs);
> +       list_del(&c_ent->list);
> +}
> +
> +static struct config_group *vimc_cfs_ent_make_group(struct config_group *group,
> +                                                   const char *name)
> +{
> +       struct vimc_cfs_device *cfs = container_of(group,
> +                                                  struct vimc_cfs_device,
> +                                                  gents);
> +       const char *drv_name = name;
> +       char *ent_name, *sep = strchr(drv_name, CHAR_SEPARATOR);
> +       struct vimc_cfs_ent *c_ent;
> +       size_t drv_namelen;
> +
> +       if (is_plugged(cfs))
> +               vimc_cfs_device_unplug(cfs);
> +
> +       /* Parse format "drv_name:ent_name" */
> +       if (!sep) {
> +               cg_err(&cfs->gdev,
> +                       "Could not find separator '%c'", CHAR_SEPARATOR);
> +               goto syntax_error;
> +       }
> +       drv_namelen = (size_t)(sep - drv_name);
> +       ent_name = &sep[1];
> +       if (!*ent_name || !drv_namelen) {
> +               cg_err(&cfs->gdev,
> +                       "%s: Driver name and entity name can't be empty.",
> +                      name);
> +               goto syntax_error;
> +       }
> +       if (drv_namelen >= sizeof(c_ent->drv)) {
> +               cg_err(&cfs->gdev,
> +                      "%s: Driver name length should be less then %ld.",
> +                      name, sizeof(c_ent->drv));
> +               goto syntax_error;
> +       }
> +
> +       c_ent = kzalloc(sizeof(*c_ent), GFP_KERNEL);
> +       if (!c_ent)
> +               return ERR_PTR(-ENOMEM);
> +
> +       /* Configure platform device */
> +       strscpy(c_ent->drv, drv_name, drv_namelen + 1);
> +       strscpy(c_ent->pdata.name, ent_name, sizeof(c_ent->pdata.name));
> +       c_ent->pdata.group = &c_ent->cg;
> +
> +       cg_dbg(&cfs->gdev, "New entity %s:%s", c_ent->drv, c_ent->pdata.name);
> +
> +       /* Configure group */
> +       config_group_init_type_name(&c_ent->cg, name, &vimc_cfs_ent_type);
> +       if (vimc_cfs_drv_cb(c_ent->drv, &c_ent->cg)) {
> +               cg_err(&c_ent->cg, "Module %s not found", c_ent->drv);
> +               kfree(c_ent);
> +               return ERR_PTR(-EINVAL);
> +       }
> +       list_add(&c_ent->list, &cfs->ents);
Same here, need to call config_item_get ?

Regard,
Dafna

> +
> +       return &c_ent->cg;
> +
> +syntax_error:
> +       cg_err(&cfs->gdev,
> +               "Couldn't create entity %s, wrong syntax.", name);
> +       return ERR_PTR(-EINVAL);
> +}
> +
> +/* --------------------------------------------------------------------------
> + * Default group: Links
> + */
> +
> +static struct configfs_group_operations vimc_cfs_dlink_group_ops = {
> +       .make_item      = vimc_cfs_link_make_item,
> +       .drop_item      = vimc_cfs_link_drop_item,
> +};
> +
> +static struct config_item_type vimc_cfs_dlink_type = {
> +       .ct_group_ops   = &vimc_cfs_dlink_group_ops,
> +       .ct_owner       = THIS_MODULE,
> +};
> +
> +void vimc_cfs_dlink_add_default_group(struct vimc_cfs_device *cfs)
> +{
> +       config_group_init_type_name(&cfs->glinks, "links",
> +                                   &vimc_cfs_dlink_type);
> +       configfs_add_default_group(&cfs->glinks, &cfs->gdev);
> +}
> +
> +/* --------------------------------------------------------------------------
> + * Default group: Entities
> + */
> +
> +static struct configfs_group_operations vimc_cfs_dent_group_ops = {
> +       .make_group     = vimc_cfs_ent_make_group,
> +       .drop_item      = vimc_cfs_ent_drop_item,
> +};
> +
> +static struct config_item_type vimc_cfs_dent_type = {
> +       .ct_group_ops   = &vimc_cfs_dent_group_ops,
> +       .ct_owner       = THIS_MODULE,
> +};
> +
> +void vimc_cfs_dent_add_default_group(struct vimc_cfs_device *cfs)
> +{
> +       config_group_init_type_name(&cfs->gents, "entities",
> +                                   &vimc_cfs_dent_type);
> +       configfs_add_default_group(&cfs->gents, &cfs->gdev);
> +}
> +
> +/* --------------------------------------------------------------------------
> + * Device instance
> + */
> +
> +static int vimc_cfs_decode_state(const char *buf, size_t size)
> +{
> +       unsigned int i, j;
> +
> +       for (i = 0; i < ARRAY_SIZE(vimc_cfs_hotplug_values); i++) {
> +               for (j = 0; j < ARRAY_SIZE(vimc_cfs_hotplug_values[0]); j++) {
> +                       if (!strncmp(buf, vimc_cfs_hotplug_values[i][j], size))
> +                               return i;
> +               }
> +       }
> +       return -EINVAL;
> +}
> +
> +static ssize_t vimc_cfs_dev_attr_hotplug_show(struct config_item *item,
> +                                             char *buf)
> +{
> +       struct vimc_cfs_device *cfs = container_of(item, struct vimc_cfs_device,
> +                                                  gdev.cg_item);
> +
> +       strcpy(buf, vimc_cfs_hotplug_values[is_plugged(cfs)][0]);
> +       return strlen(buf);
> +}
> +
> +static int vimc_cfs_hotplug_set(struct vimc_cfs_device *cfs,
> +                               enum vimc_cfs_hotplug_state state)
> +{
> +       if (state == is_plugged(cfs)) {
> +               return 0;
> +       } else if (state == VIMC_CFS_HOTPLUG_STATE_UNPLUGGED) {
> +               vimc_cfs_device_unplug(cfs);
> +               return 0;
> +       } else if (state == VIMC_CFS_HOTPLUG_STATE_PLUGGED) {
> +               return vimc_cfs_device_plug(cfs);
> +       }
> +       return -EINVAL;
> +}
> +
> +static ssize_t vimc_cfs_dev_attr_hotplug_store(struct config_item *item,
> +                                              const char *buf, size_t size)
> +{
> +       struct vimc_cfs_device *cfs = container_of(item, struct vimc_cfs_device,
> +                                                  gdev.cg_item);
> +       int state = vimc_cfs_decode_state(buf, size);
> +
> +       if (vimc_cfs_hotplug_set(cfs, state))
> +               return -EINVAL;
> +       return size;
> +}
> +
> +CONFIGFS_ATTR(vimc_cfs_dev_attr_, hotplug);
> +
> +static struct configfs_attribute *vimc_cfs_dev_attrs[] = {
> +       &vimc_cfs_dev_attr_attr_hotplug,
> +       NULL,
> +};
> +
> +static void vimc_cfs_dev_release(struct config_item *item)
> +{
> +       struct vimc_cfs_device *cfs = container_of(item, struct vimc_cfs_device,
> +                                                  gdev.cg_item);
> +
> +       kfree(cfs);
> +}
> +
> +static struct configfs_item_operations vimc_cfs_dev_item_ops = {
> +       .release        = vimc_cfs_dev_release,
> +};
> +
> +static struct config_item_type vimc_cfs_dev_type = {
> +       .ct_item_ops    = &vimc_cfs_dev_item_ops,
> +       .ct_attrs       = vimc_cfs_dev_attrs,
> +       .ct_owner       = THIS_MODULE,
> +};
> +
> +static void vimc_cfs_dev_drop_item(struct config_group *group,
> +                                  struct config_item *item)
> +{
> +       struct vimc_cfs_device *cfs = container_of(group,
> +                                                  struct vimc_cfs_device,
> +                                                  gdev);
> +
> +       if (is_plugged(cfs))
> +               vimc_cfs_device_unplug(cfs);
> +}
> +
> +static struct config_group *vimc_cfs_dev_make_group(
> +                               struct config_group *group, const char *name)
> +{
> +       struct vimc_cfs_device *cfs = kzalloc(sizeof(*cfs), GFP_KERNEL);
> +
> +       if (!cfs)
> +               return ERR_PTR(-ENOMEM);
> +
> +       /* Configure pipeline */
> +       INIT_LIST_HEAD(&cfs->ents);
> +       INIT_LIST_HEAD(&cfs->links);
> +
> +       /* Configure platform data */
> +       strscpy(cfs->pdata.data.name, name, sizeof(cfs->pdata.data.name));
> +       cfs->pdata.data.group = &cfs->gdev;
> +       cfs->pdata.links = &cfs->links;
> +
> +       /* Configure configfs group */
> +       config_group_init_type_name(&cfs->gdev, name, &vimc_cfs_dev_type);
> +       vimc_cfs_dent_add_default_group(cfs);
> +       vimc_cfs_dlink_add_default_group(cfs);
> +
> +       return &cfs->gdev;
> +}
> +
> +/* --------------------------------------------------------------------------
> + * Subsystem
> + */
> +
> +static struct configfs_group_operations vimc_cfs_subsys_group_ops = {
> +       /* Create vimc devices */
> +       .make_group     = vimc_cfs_dev_make_group,
> +       .drop_item      = vimc_cfs_dev_drop_item,
> +};
> +
> +static struct config_item_type vimc_cfs_subsys_type = {
> +       .ct_group_ops   = &vimc_cfs_subsys_group_ops,
> +       .ct_owner       = THIS_MODULE,
> +};
> +
> +int vimc_cfs_subsys_register(void)
> +{
> +       struct configfs_subsystem *subsys = &vimc_cfs_subsys.subsys;
> +       int ret;
> +
> +       INIT_LIST_HEAD(&vimc_cfs_subsys.drvs);
> +       config_group_init_type_name(&subsys->su_group, CFS_SUBSYS_NAME,
> +                                   &vimc_cfs_subsys_type);
> +       mutex_init(&subsys->su_mutex);
> +       ret = configfs_register_subsystem(subsys);
> +
> +       return ret;
> +}
> +
> +void vimc_cfs_subsys_unregister(void)
> +{
> +       configfs_unregister_subsystem(&vimc_cfs_subsys.subsys);
> +}
> diff --git a/drivers/media/platform/vimc/vimc-configfs.h b/drivers/media/platform/vimc/vimc-configfs.h
> new file mode 100644
> index 000000000000..6278b53d11ba
> --- /dev/null
> +++ b/drivers/media/platform/vimc/vimc-configfs.h
> @@ -0,0 +1,30 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
> +/*
> + * vimc-configfs.h Virtual Media Controller Driver
> + *
> + * Copyright (C) 2018 Helen Koike <helen.koike@collabora.com>
> + */
> +
> +#ifndef _VIMC_CONFIGFS_H_
> +#define _VIMC_CONFIGFS_H_
> +
> +#include <linux/configfs.h>
> +
> +#define VIMC_CFS_SRC_PAD_NAME(n) "pad:source:" #n
> +#define VIMC_CFS_SINK_PAD_NAME(n) "pad:sink:" #n
> +
> +struct vimc_cfs_drv {
> +       const char *name;
> +       void (*const configfs_cb)(struct config_group *group);
> +       struct list_head list;
> +};
> +
> +int vimc_cfs_subsys_register(void);
> +
> +void vimc_cfs_subsys_unregister(void);
> +
> +void vimc_cfs_drv_register(struct vimc_cfs_drv *c_drv);
> +
> +void vimc_cfs_drv_unregister(struct vimc_cfs_drv *c_drv);
> +
> +#endif
> diff --git a/drivers/media/platform/vimc/vimc-core.c b/drivers/media/platform/vimc/vimc-core.c
> index ce809d2e3d53..816015e7c8f6 100644
> --- a/drivers/media/platform/vimc/vimc-core.c
> +++ b/drivers/media/platform/vimc/vimc-core.c
> @@ -23,150 +23,29 @@
>  #include <media/v4l2-device.h>
>
>  #include "vimc-common.h"
> -
> -#define VIMC_PDEV_NAME "vimc"
> -#define VIMC_MDEV_MODEL_NAME "VIMC MDEV"
> -
> -#define VIMC_ENT_LINK(src, srcpad, sink, sinkpad, link_flags) {        \
> -       .src_ent = src,                                         \
> -       .src_pad = srcpad,                                      \
> -       .sink_ent = sink,                                       \
> -       .sink_pad = sinkpad,                                    \
> -       .flags = link_flags,                                    \
> -}
> +#include "vimc-configfs.h"
>
>  struct vimc_device {
> -       /* The platform device */
> -       struct platform_device pdev;
> -
> -       /* The pipeline configuration */
> -       const struct vimc_pipeline_config *pipe_cfg;
> -
>         /* The Associated media_device parent */
>         struct media_device mdev;
>
>         /* Internal v4l2 parent device*/
>         struct v4l2_device v4l2_dev;
> -
> -       /* Subdevices */
> -       struct platform_device **subdevs;
> -};
> -
> -/* Structure which describes individual configuration for each entity */
> -struct vimc_ent_config {
> -       const char *name;
> -       const char *drv;
> -};
> -
> -/* Structure which describes links between entities */
> -struct vimc_ent_link {
> -       unsigned int src_ent;
> -       u16 src_pad;
> -       unsigned int sink_ent;
> -       u16 sink_pad;
> -       u32 flags;
> -};
> -
> -/* Structure which describes the whole topology */
> -struct vimc_pipeline_config {
> -       const struct vimc_ent_config *ents;
> -       size_t num_ents;
> -       const struct vimc_ent_link *links;
> -       size_t num_links;
> -};
> -
> -/* --------------------------------------------------------------------------
> - * Topology Configuration
> - */
> -
> -static const struct vimc_ent_config ent_config[] = {
> -       {
> -               .name = "Sensor A",
> -               .drv = "vimc-sensor",
> -       },
> -       {
> -               .name = "Sensor B",
> -               .drv = "vimc-sensor",
> -       },
> -       {
> -               .name = "Debayer A",
> -               .drv = "vimc-debayer",
> -       },
> -       {
> -               .name = "Debayer B",
> -               .drv = "vimc-debayer",
> -       },
> -       {
> -               .name = "Raw Capture 0",
> -               .drv = "vimc-capture",
> -       },
> -       {
> -               .name = "Raw Capture 1",
> -               .drv = "vimc-capture",
> -       },
> -       {
> -               .name = "RGB/YUV Input",
> -               /* TODO: change this to vimc-input when it is implemented */
> -               .drv = "vimc-sensor",
> -       },
> -       {
> -               .name = "Scaler",
> -               .drv = "vimc-scaler",
> -       },
> -       {
> -               .name = "RGB/YUV Capture",
> -               .drv = "vimc-capture",
> -       },
> -};
> -
> -static const struct vimc_ent_link ent_links[] = {
> -       /* Link: Sensor A (Pad 0)->(Pad 0) Debayer A */
> -       VIMC_ENT_LINK(0, 0, 2, 0, MEDIA_LNK_FL_ENABLED | MEDIA_LNK_FL_IMMUTABLE),
> -       /* Link: Sensor A (Pad 0)->(Pad 0) Raw Capture 0 */
> -       VIMC_ENT_LINK(0, 0, 4, 0, MEDIA_LNK_FL_ENABLED | MEDIA_LNK_FL_IMMUTABLE),
> -       /* Link: Sensor B (Pad 0)->(Pad 0) Debayer B */
> -       VIMC_ENT_LINK(1, 0, 3, 0, MEDIA_LNK_FL_ENABLED | MEDIA_LNK_FL_IMMUTABLE),
> -       /* Link: Sensor B (Pad 0)->(Pad 0) Raw Capture 1 */
> -       VIMC_ENT_LINK(1, 0, 5, 0, MEDIA_LNK_FL_ENABLED | MEDIA_LNK_FL_IMMUTABLE),
> -       /* Link: Debayer A (Pad 1)->(Pad 0) Scaler */
> -       VIMC_ENT_LINK(2, 1, 7, 0, MEDIA_LNK_FL_ENABLED),
> -       /* Link: Debayer B (Pad 1)->(Pad 0) Scaler */
> -       VIMC_ENT_LINK(3, 1, 7, 0, 0),
> -       /* Link: RGB/YUV Input (Pad 0)->(Pad 0) Scaler */
> -       VIMC_ENT_LINK(6, 0, 7, 0, 0),
> -       /* Link: Scaler (Pad 1)->(Pad 0) RGB/YUV Capture */
> -       VIMC_ENT_LINK(7, 1, 8, 0, MEDIA_LNK_FL_ENABLED | MEDIA_LNK_FL_IMMUTABLE),
> -};
> -
> -static const struct vimc_pipeline_config pipe_cfg = {
> -       .ents           = ent_config,
> -       .num_ents       = ARRAY_SIZE(ent_config),
> -       .links          = ent_links,
> -       .num_links      = ARRAY_SIZE(ent_links)
>  };
>
> -/* -------------------------------------------------------------------------- */
> -
> -static int vimc_create_links(struct vimc_device *vimc)
> +static int vimc_core_links_create(const struct device *master)
>  {
> -       unsigned int i;
> +       struct vimc_platform_data_core *pdata = master->platform_data;
> +       struct vimc_ent_device *ved_src, *ved_sink;
> +       struct vimc_platform_data_link *plink;
>         int ret;
>
> -       /* Initialize the links between entities */
> -       for (i = 0; i < vimc->pipe_cfg->num_links; i++) {
> -               const struct vimc_ent_link *link = &vimc->pipe_cfg->links[i];
> -               /*
> -                * TODO: Check another way of retrieving ved struct without
> -                * relying on platform_get_drvdata
> -                */
> -               struct vimc_ent_device *ved_src =
> -                       platform_get_drvdata(vimc->subdevs[link->src_ent]);
> -               struct vimc_ent_device *ved_sink =
> -                       platform_get_drvdata(vimc->subdevs[link->sink_ent]);
> -
> -               ret = media_create_pad_link(ved_src->ent, link->src_pad,
> -                                           ved_sink->ent, link->sink_pad,
> -                                           link->flags);
> +       list_for_each_entry(plink, pdata->links, list) {
> +               ved_src = platform_get_drvdata(plink->source);
> +               ved_sink = platform_get_drvdata(plink->sink);
> +               ret = media_create_pad_link(ved_src->ent, plink->source_pad,
> +                                           ved_sink->ent, plink->sink_pad,
> +                                           plink->flags);
>                 if (ret)
>                         return ret;
>         }
> @@ -174,10 +53,10 @@ static int vimc_create_links(struct vimc_device *vimc)
>         return 0;
>  }
>
> -static int vimc_comp_bind(struct device *master)
> +int vimc_core_comp_bind(struct device *master)
>  {
> -       struct vimc_device *vimc = container_of(to_platform_device(master),
> -                                               struct vimc_device, pdev);
> +       struct vimc_device *vimc =
> +               platform_get_drvdata(to_platform_device(master));
>         int ret;
>
>         dev_dbg(master, "bind");
> @@ -194,9 +73,7 @@ static int vimc_comp_bind(struct device *master)
>         ret = component_bind_all(master, &vimc->v4l2_dev);
>         if (ret)
>                 goto err_v4l2_unregister;
> -
> -       /* Initialize links */
> -       ret = vimc_create_links(vimc);
> +       ret = vimc_core_links_create(master);
>         if (ret)
>                 goto err_comp_unbind_all;
>
> @@ -228,11 +105,12 @@ static int vimc_comp_bind(struct device *master)
>
>         return ret;
>  }
> +EXPORT_SYMBOL_GPL(vimc_core_comp_bind);
>
> -static void vimc_comp_unbind(struct device *master)
> +void vimc_core_comp_unbind(struct device *master)
>  {
> -       struct vimc_device *vimc = container_of(to_platform_device(master),
> -                                               struct vimc_device, pdev);
> +       struct vimc_device *vimc =
> +               platform_get_drvdata(to_platform_device(master));
>
>         dev_dbg(master, "unbind");
>
> @@ -240,147 +118,56 @@ static void vimc_comp_unbind(struct device *master)
>         component_unbind_all(master, NULL);
>         v4l2_device_unregister(&vimc->v4l2_dev);
>  }
> -
> -static int vimc_comp_compare(struct device *comp, void *data)
> -{
> -       const struct platform_device *pdev = to_platform_device(comp);
> -       const char *name = data;
> -
> -       return !strcmp(pdev->dev.platform_data, name);
> -}
> -
> -static struct component_match *vimc_add_subdevs(struct vimc_device *vimc)
> -{
> -       struct component_match *match = NULL;
> -       struct vimc_platform_data pdata;
> -       int i;
> -
> -       for (i = 0; i < vimc->pipe_cfg->num_ents; i++) {
> -               dev_dbg(&vimc->pdev.dev, "new pdev for %s\n",
> -                       vimc->pipe_cfg->ents[i].drv);
> -
> -               strscpy(pdata.entity_name, vimc->pipe_cfg->ents[i].name,
> -                       sizeof(pdata.entity_name));
> -
> -               vimc->subdevs[i] = platform_device_register_data(&vimc->pdev.dev,
> -                                               vimc->pipe_cfg->ents[i].drv,
> -                                               PLATFORM_DEVID_AUTO,
> -                                               &pdata,
> -                                               sizeof(pdata));
> -               if (IS_ERR(vimc->subdevs[i])) {
> -                       match = ERR_CAST(vimc->subdevs[i]);
> -                       while (--i >= 0)
> -                               platform_device_unregister(vimc->subdevs[i]);
> -
> -                       return match;
> -               }
> -
> -               component_match_add(&vimc->pdev.dev, &match, vimc_comp_compare,
> -                                   (void *)vimc->pipe_cfg->ents[i].name);
> -       }
> -
> -       return match;
> -}
> -
> -static void vimc_rm_subdevs(struct vimc_device *vimc)
> -{
> -       unsigned int i;
> -
> -       for (i = 0; i < vimc->pipe_cfg->num_ents; i++)
> -               platform_device_unregister(vimc->subdevs[i]);
> -}
> -
> -static const struct component_master_ops vimc_comp_ops = {
> -       .bind = vimc_comp_bind,
> -       .unbind = vimc_comp_unbind,
> -};
> +EXPORT_SYMBOL_GPL(vimc_core_comp_unbind);
>
>  static int vimc_probe(struct platform_device *pdev)
>  {
> -       struct vimc_device *vimc = container_of(pdev, struct vimc_device, pdev);
> -       struct component_match *match = NULL;
> -       int ret;
> +       const struct vimc_platform_data_core *pdata = pdev->dev.platform_data;
> +       struct vimc_device *vimc = devm_kzalloc(&pdev->dev, sizeof(*vimc),
> +                                               GFP_KERNEL);
>
>         dev_dbg(&pdev->dev, "probe");
>
> -       /* Create platform_device for each entity in the topology*/
> -       vimc->subdevs = devm_kcalloc(&vimc->pdev.dev, vimc->pipe_cfg->num_ents,
> -                                    sizeof(*vimc->subdevs), GFP_KERNEL);
> -       if (!vimc->subdevs)
> -               return -ENOMEM;
> -
> -       match = vimc_add_subdevs(vimc);
> -       if (IS_ERR(match))
> -               return PTR_ERR(match);
> -
> -       /* Link the media device within the v4l2_device */
> -       vimc->v4l2_dev.mdev = &vimc->mdev;
> -
>         /* Initialize media device */
> -       strscpy(vimc->mdev.model, VIMC_MDEV_MODEL_NAME,
> -               sizeof(vimc->mdev.model));
> +       strscpy(vimc->mdev.model, pdata->data.name, sizeof(vimc->mdev.model));
>         vimc->mdev.dev = &pdev->dev;
>         media_device_init(&vimc->mdev);
> +       vimc->v4l2_dev.mdev = &vimc->mdev;
>
> -       /* Add self to the component system */
> -       ret = component_master_add_with_match(&pdev->dev, &vimc_comp_ops,
> -                                             match);
> -       if (ret) {
> -               media_device_cleanup(&vimc->mdev);
> -               vimc_rm_subdevs(vimc);
> -               return ret;
> -       }
> +       platform_set_drvdata(pdev, vimc);
>
>         return 0;
>  }
>
>  static int vimc_remove(struct platform_device *pdev)
>  {
> -       struct vimc_device *vimc = container_of(pdev, struct vimc_device, pdev);
> +       struct vimc_device *vimc = platform_get_drvdata(pdev);
>
>         dev_dbg(&pdev->dev, "remove");
>
> -       component_master_del(&pdev->dev, &vimc_comp_ops);
> -       vimc_rm_subdevs(vimc);
> +       media_device_cleanup(&vimc->mdev);
>
>         return 0;
>  }
>
> -static void vimc_dev_release(struct device *dev)
> -{
> -}
> -
> -static struct vimc_device vimc_dev = {
> -       .pipe_cfg = &pipe_cfg,
> -       .pdev = {
> -               .name = VIMC_PDEV_NAME,
> -               .dev.release = vimc_dev_release,
> -       }
> -};
> -
>  static struct platform_driver vimc_pdrv = {
>         .probe          = vimc_probe,
>         .remove         = vimc_remove,
>         .driver         = {
> -               .name   = VIMC_PDEV_NAME,
> -       },
> +               .name   = "vimc-core",
> +       }
>  };
>
>  static int __init vimc_init(void)
>  {
>         int ret;
>
> -       ret = platform_device_register(&vimc_dev.pdev);
> -       if (ret) {
> -               dev_err(&vimc_dev.pdev.dev,
> -                       "platform device registration failed (err=%d)\n", ret);
> +       ret = platform_driver_register(&vimc_pdrv);
> +       if (ret)
>                 return ret;
> -       }
>
> -       ret = platform_driver_register(&vimc_pdrv);
> +       ret = vimc_cfs_subsys_register();
>         if (ret) {
> -               dev_err(&vimc_dev.pdev.dev,
> -                       "platform driver registration failed (err=%d)\n", ret);
>                 platform_driver_unregister(&vimc_pdrv);
>                 return ret;
>         }
> @@ -390,9 +177,9 @@ static int __init vimc_init(void)
>
>  static void __exit vimc_exit(void)
>  {
> -       platform_driver_unregister(&vimc_pdrv);
> +       vimc_cfs_subsys_unregister();
>
> -       platform_device_unregister(&vimc_dev.pdev);
> +       platform_driver_unregister(&vimc_pdrv);
>  }
>
>  module_init(vimc_init);
> diff --git a/drivers/media/platform/vimc/vimc-core.h b/drivers/media/platform/vimc/vimc-core.h
> new file mode 100644
> index 000000000000..42c8f92354af
> --- /dev/null
> +++ b/drivers/media/platform/vimc/vimc-core.h
> @@ -0,0 +1,17 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
> +/*
> + * vimc-core.h Virtual Media Controller Driver
> + *
> + * Copyright (C) 2018 Helen Koike <helen.koike@collabora.com>
> + */
> +
> +#ifndef _VIMC_CORE_H_
> +#define _VIMC_CORE_H_
> +
> +#define VIMC_CORE_PDEV_NAME "vimc-core"
> +
> +int vimc_core_comp_bind(struct device *master);
> +
> +void vimc_core_comp_unbind(struct device *master);
> +
> +#endif
> diff --git a/drivers/media/platform/vimc/vimc-debayer.c b/drivers/media/platform/vimc/vimc-debayer.c
> index 77887f66f323..fa326dbb7562 100644
> --- a/drivers/media/platform/vimc/vimc-debayer.c
> +++ b/drivers/media/platform/vimc/vimc-debayer.c
> @@ -23,6 +23,7 @@
>  #include <linux/v4l2-mediabus.h>
>  #include <media/v4l2-subdev.h>
>
> +#include "vimc-configfs.h"
>  #include "vimc-common.h"
>
>  #define VIMC_DEB_DRV_NAME "vimc-debayer"
> @@ -522,7 +523,7 @@ static int vimc_deb_comp_bind(struct device *comp, struct device *master,
>                               void *master_data)
>  {
>         struct v4l2_device *v4l2_dev = master_data;
> -       struct vimc_platform_data *pdata = comp->platform_data;
> +       struct vimc_platform_data *pdata = dev_get_platdata(comp);
>         struct vimc_deb_device *vdeb;
>         int ret;
>
> @@ -532,8 +533,7 @@ static int vimc_deb_comp_bind(struct device *comp, struct device *master,
>                 return -ENOMEM;
>
>         /* Initialize ved and sd */
> -       ret = vimc_ent_sd_register(&vdeb->ved, &vdeb->sd, v4l2_dev,
> -                                  pdata->entity_name,
> +       ret = vimc_ent_sd_register(&vdeb->ved, &vdeb->sd, v4l2_dev, pdata->name,
>                                    MEDIA_ENT_F_PROC_VIDEO_PIXEL_ENC_CONV, 2,
>                                    (const unsigned long[2]) {MEDIA_PAD_FL_SINK,
>                                    MEDIA_PAD_FL_SOURCE},
> @@ -594,7 +594,50 @@ static struct platform_driver vimc_deb_pdrv = {
>         },
>  };
>
> -module_platform_driver(vimc_deb_pdrv);
> +static struct config_item_type vimc_deb_cfs_pad_type = {
> +       .ct_owner       = THIS_MODULE,
> +};
> +
> +static struct config_group vimc_deb_cfs_sink_pad_group;
> +static struct config_group vimc_deb_cfs_src_pad_group;
> +
> +static void vimc_deb_configfs_cb(struct config_group *group)
> +{
> +       config_group_init_type_name(&vimc_deb_cfs_sink_pad_group,
> +                                   VIMC_CFS_SINK_PAD_NAME(0),
> +                                   &vimc_deb_cfs_pad_type);
> +       configfs_add_default_group(&vimc_deb_cfs_sink_pad_group, group);
> +
> +       config_group_init_type_name(&vimc_deb_cfs_src_pad_group,
> +                                   VIMC_CFS_SRC_PAD_NAME(1),
> +                                   &vimc_deb_cfs_pad_type);
> +       configfs_add_default_group(&vimc_deb_cfs_src_pad_group, group);
> +}
> +
> +struct vimc_cfs_drv vimc_deb_cfs_drv = {
> +       .name = VIMC_DEB_DRV_NAME,
> +       .configfs_cb = vimc_deb_configfs_cb,
> +};
> +
> +static int __init vimc_deb_init(void)
> +{
> +       int ret = platform_driver_register(&vimc_deb_pdrv);
> +
> +       if (ret)
> +               return ret;
> +
> +       vimc_cfs_drv_register(&vimc_deb_cfs_drv);
> +       return 0;
> +}
> +
> +static void __exit vimc_deb_exit(void)
> +{
> +       platform_driver_unregister(&vimc_deb_pdrv);
> +       vimc_cfs_drv_unregister(&vimc_deb_cfs_drv);
> +}
> +
> +module_init(vimc_deb_init);
> +module_exit(vimc_deb_exit);
>
>  MODULE_DEVICE_TABLE(platform, vimc_deb_driver_ids);
>
> diff --git a/drivers/media/platform/vimc/vimc-scaler.c b/drivers/media/platform/vimc/vimc-scaler.c
> index b0952ee86296..efb29384197d 100644
> --- a/drivers/media/platform/vimc/vimc-scaler.c
> +++ b/drivers/media/platform/vimc/vimc-scaler.c
> @@ -23,6 +23,7 @@
>  #include <linux/v4l2-mediabus.h>
>  #include <media/v4l2-subdev.h>
>
> +#include "vimc-configfs.h"
>  #include "vimc-common.h"
>
>  #define VIMC_SCA_DRV_NAME "vimc-scaler"
> @@ -394,8 +395,7 @@ static int vimc_sca_comp_bind(struct device *comp, struct device *master,
>                 return -ENOMEM;
>
>         /* Initialize ved and sd */
> -       ret = vimc_ent_sd_register(&vsca->ved, &vsca->sd, v4l2_dev,
> -                                  pdata->entity_name,
> +       ret = vimc_ent_sd_register(&vsca->ved, &vsca->sd, v4l2_dev, pdata->name,
>                                    MEDIA_ENT_F_PROC_VIDEO_SCALER, 2,
>                                    (const unsigned long[2]) {MEDIA_PAD_FL_SINK,
>                                    MEDIA_PAD_FL_SOURCE},
> @@ -448,7 +448,50 @@ static struct platform_driver vimc_sca_pdrv = {
>         },
>  };
>
> -module_platform_driver(vimc_sca_pdrv);
> +static struct config_item_type vimc_sca_cfs_pad_type = {
> +       .ct_owner       = THIS_MODULE,
> +};
> +
> +static struct config_group vimc_sca_cfs_sink_pad_group;
> +static struct config_group vimc_sca_cfs_src_pad_group;
> +
> +static void vimc_sca_configfs_cb(struct config_group *group)
> +{
> +       config_group_init_type_name(&vimc_sca_cfs_sink_pad_group,
> +                                   VIMC_CFS_SINK_PAD_NAME(0),
> +                                   &vimc_sca_cfs_pad_type);
> +       configfs_add_default_group(&vimc_sca_cfs_sink_pad_group, group);
> +
> +       config_group_init_type_name(&vimc_sca_cfs_src_pad_group,
> +                                   VIMC_CFS_SRC_PAD_NAME(1),
> +                                   &vimc_sca_cfs_pad_type);
> +       configfs_add_default_group(&vimc_sca_cfs_src_pad_group, group);
> +}
> +
> +struct vimc_cfs_drv vimc_sca_cfs_drv = {
> +       .name = VIMC_SCA_DRV_NAME,
> +       .configfs_cb = vimc_sca_configfs_cb,
> +};
> +
> +static int __init vimc_sca_init(void)
> +{
> +       int ret = platform_driver_register(&vimc_sca_pdrv);
> +
> +       if (ret)
> +               return ret;
> +
> +       vimc_cfs_drv_register(&vimc_sca_cfs_drv);
> +       return 0;
> +}
> +
> +static void __exit vimc_sca_exit(void)
> +{
> +       platform_driver_unregister(&vimc_sca_pdrv);
> +       vimc_cfs_drv_unregister(&vimc_sca_cfs_drv);
> +}
> +
> +module_init(vimc_sca_init);
> +module_exit(vimc_sca_exit);
>
>  MODULE_DEVICE_TABLE(platform, vimc_sca_driver_ids);
>
> diff --git a/drivers/media/platform/vimc/vimc-sensor.c b/drivers/media/platform/vimc/vimc-sensor.c
> index 32ca9c6172b1..37540e72c6bc 100644
> --- a/drivers/media/platform/vimc/vimc-sensor.c
> +++ b/drivers/media/platform/vimc/vimc-sensor.c
> @@ -28,6 +28,7 @@
>  #include <media/v4l2-subdev.h>
>  #include <media/tpg/v4l2-tpg.h>
>
> +#include "vimc-configfs.h"
>  #include "vimc-common.h"
>
>  #define VIMC_SEN_DRV_NAME "vimc-sensor"
> @@ -405,8 +406,7 @@ static int vimc_sen_comp_bind(struct device *comp, struct device *master,
>         }
>
>         /* Initialize ved and sd */
> -       ret = vimc_ent_sd_register(&vsen->ved, &vsen->sd, v4l2_dev,
> -                                  pdata->entity_name,
> +       ret = vimc_ent_sd_register(&vsen->ved, &vsen->sd, v4l2_dev, pdata->name,
>                                    MEDIA_ENT_F_CAM_SENSOR, 1,
>                                    (const unsigned long[1]) {MEDIA_PAD_FL_SOURCE},
>                                    &vimc_sen_ops);
> @@ -471,7 +471,44 @@ static struct platform_driver vimc_sen_pdrv = {
>         },
>  };
>
> -module_platform_driver(vimc_sen_pdrv);
> +static struct config_item_type vimc_sen_cfs_pad_type = {
> +       .ct_owner       = THIS_MODULE,
> +};
> +
> +static struct config_group vimc_sen_cfs_src_pad_group;
> +
> +static void vimc_sen_configfs_cb(struct config_group *group)
> +{
> +       config_group_init_type_name(&vimc_sen_cfs_src_pad_group,
> +                                   VIMC_CFS_SRC_PAD_NAME(0),
> +                                   &vimc_sen_cfs_pad_type);
> +       configfs_add_default_group(&vimc_sen_cfs_src_pad_group, group);
> +}
> +
> +struct vimc_cfs_drv vimc_sen_cfs_drv = {
> +       .name = VIMC_SEN_DRV_NAME,
> +       .configfs_cb = vimc_sen_configfs_cb,
> +};
> +
> +static int __init vimc_sen_init(void)
> +{
> +       int ret = platform_driver_register(&vimc_sen_pdrv);
> +
> +       if (ret)
> +               return ret;
> +
> +       vimc_cfs_drv_register(&vimc_sen_cfs_drv);
> +       return 0;
> +}
> +
> +static void __exit vimc_sen_exit(void)
> +{
> +       platform_driver_unregister(&vimc_sen_pdrv);
> +       vimc_cfs_drv_unregister(&vimc_sen_cfs_drv);
> +}
> +
> +module_init(vimc_sen_init);
> +module_exit(vimc_sen_exit);
>
>  MODULE_DEVICE_TABLE(platform, vimc_sen_driver_ids);
>
> --
> 2.19.1
>
