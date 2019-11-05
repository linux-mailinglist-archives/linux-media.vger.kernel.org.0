Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1501FF011D
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2019 16:21:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389573AbfKEPVN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Nov 2019 10:21:13 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:49048 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388842AbfKEPVN (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Nov 2019 10:21:13 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id C1F9128ED1B
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     dafna.hirschfeld@collabora.com, helen.koike@collabora.com,
        andre.almeida@collabora.com, skhan@linuxfoundation.org,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com,
        laurent.pinchart@ideasonboard.com, ezequiel@collabora.com
Subject: [PATCH v2 0/3] media: vimc: use configfs in order to configure devices topologies
Date:   Tue,  5 Nov 2019 16:20:56 +0100
Message-Id: <20191105152059.9994-1-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patchset introduces the usage of configfs in order to create vimc devices
with a configured topology. The default hardcoded device is removed and replaced
with an API that allows userspace to configure the device's topology.

The patchset is tested with the following script that runs basic unit test:
https://gitlab.collabora.com/dafna/scripts/blob/master/unit-tests.sh

It is rebased on two other patches that fix crash:
- v6 of `media: vimc: upon streaming, check that the pipeline starts with a source entity`
- v1 of `media: vimc: crash fix - add refcount to vimc entities`

In the configfs API, entities are represented by directories and links between
entities are represented by symlinks.

For example, a topology of sensor->capture will be created with the following commands:

CONFIGFS_ROOT=/sys/kernel/config

mkdir ${CONFIGFS_ROOT}/vimc/mdev/
mkdir ${CONFIGFS_ROOT}/vimc/mdev/vimc-sensor:sen
mkdir ${CONFIGFS_ROOT}/vimc/mdev/vimc-capture:cap
mkdir ${CONFIGFS_ROOT}/vimc/mdev/vimc-capture:cap/sink:0/sen-to-cap
ln -s "${CONFIGFS_ROOT}/vimc/mdev/vimc-capture:cap/sink:0/sen-to-cap"  "${CONFIGFS_ROOT}/vimc/mdev/vimc-sensor:sen/source:0/"

tree ${CONFIGFS_ROOT}
`-- vimc
    `-- mdev
        |-- hotplug
        |-- vimc-capture:cap
        |   `-- sink:0
        |       `-- sen-to-cap
        |           `-- type
        `-- vimc-sensor:sen
            `-- source:0
                `-- sen-to-cap -> ../../../../../vimc/mdev/cap/sink:0/sen-to-cap

The file `type` is the type attribute of the link, it can be one of 'enabled' 'disabled' or 'immutable'.
By writing to the hotplug file, usrspace can plug and unplug the device. The device can also
be unplugged while it streams. The directories `sink:0` and `source:0` are default subdirectories which are
always present and represent the entity's pads.

If userspace reconfigures the topology while the device is plugged, the changes will not
take effect until userspace unplugs and replugs the device. The way configfs API is used here can be compared to a
configuration file: changes in the file will only take effect when the software is reloaded.

Code Design:
There are two separat lists for the entities. One list is maintained only by the configfs and each
object in the list contains only the name and type of the entity. Only when userspace asks to plug the device,
the configfs list is passed to the driver's probe callback through a platform_data object. The driver then
iterates it and creates its own list of allocated vimc_ent_device objects and registers them with the media controller.
There is one list in the configfs that holds the links between entities which is also passed to the driver
through the platform_data object. The driver iterates it and calls media_create_pad_link for each link.
There are two mutexes used for code synchronization: `pdev_mutex` is used to lock the platform_data while
plugging and unplugging. `topology_mutex` is used to lock the the configfs lists of the entities and the links.
The default directories for the pads `sink:<pad>` `source:<pad>` are created in configfs by a callback function that each vimc entity
registers in init (when loading vimc.ko).

Changes from v1:
- the attribute files `enabled` and `immutable` are replaced by one attribute file `type` this is because this
two attributes are dependet on each other (immutable -> enabled).
- a directory that should be the target of a symlink is created under sink:<pad>. Links are created under the source:<pad> directory.
Each dircroy under sink:<pad> can participate in only one link.
- mutexes are added to synchronize concurrency.
- the device registration method is changed from `platform_device_register_data` to `platform_device_register`
this avoids the need to hold separate pointers to the lists of the topology. Pointers were needed since
the former method duplicates the platform_data object:
https://elixir.bootlin.com/linux/v5.3.8/source/drivers/base/platform.c#L358
- Fixes due to comments from Shuah Khan, Andrzej Pietrasiewicz and Hans Verkuil

Patch 1 - is the new code for the configfs API. This only adds the new code but does not use it so the device
still has the hardcoded topology and no configfs registration.
Patch 2 - removes the hardcoded topology and adds the usage of the configfs. This also contains the documentation
of the new api.
Patch 3 - adds support to register up to 64 vimc devices at the same time by adding a device index to the bus_info.

Dafna Hirschfeld (3):
  media: vimc: Add the implementation for the configfs api
  media: vimc: use configfs instead of having hardcoded configuration
  media: vimc: Add device index to the bus_info

 Documentation/ABI/testing/configfs-vimc     |   6 +
 Documentation/media/v4l-drivers/vimc.dot    |  28 +-
 Documentation/media/v4l-drivers/vimc.rst    | 296 ++++++--
 drivers/media/platform/vimc/Kconfig         |  10 +-
 drivers/media/platform/vimc/Makefile        |   2 +-
 drivers/media/platform/vimc/vimc-capture.c  |  50 +-
 drivers/media/platform/vimc/vimc-common.h   | 111 ++-
 drivers/media/platform/vimc/vimc-configfs.c | 711 ++++++++++++++++++++
 drivers/media/platform/vimc/vimc-configfs.h |  41 ++
 drivers/media/platform/vimc/vimc-core.c     | 375 ++++++-----
 drivers/media/platform/vimc/vimc-debayer.c  |  34 +-
 drivers/media/platform/vimc/vimc-scaler.c   |  33 +-
 drivers/media/platform/vimc/vimc-sensor.c   |  31 +-
 13 files changed, 1408 insertions(+), 320 deletions(-)
 create mode 100644 Documentation/ABI/testing/configfs-vimc
 create mode 100644 drivers/media/platform/vimc/vimc-configfs.c
 create mode 100644 drivers/media/platform/vimc/vimc-configfs.h

-- 
2.20.1

