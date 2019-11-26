Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2D9E4109D8E
	for <lists+linux-media@lfdr.de>; Tue, 26 Nov 2019 13:10:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728238AbfKZMKg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Nov 2019 07:10:36 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:49540 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727488AbfKZMKg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Nov 2019 07:10:36 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id 34388283C02
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     dafna.hirschfeld@collabora.com, hverkuil@xs4all.nl,
        dafna3@gmail.com, helen.koike@collabora.com,
        ezequiel@collabora.com, skhan@linuxfoundation.org,
        kernel@collabora.com, laurent.pinchart@ideasonboard.com
Subject: [PATCH v3 0/3] media: vimc: use configfs in order to configure devices topologies
Date:   Tue, 26 Nov 2019 13:10:17 +0100
Message-Id: <20191126121020.11597-1-dafna.hirschfeld@collabora.com>
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

The patchset is tested with the following script that runs basic unit tests:
https://gitlab.collabora.com/dafna/scripts/blob/master/unit-tests.sh

I also tested it with two scripts that test concurrency:
- https://gitlab.collabora.com/dafna/scripts/blob/master/stream-tests.sh
This creates a sensor->debayer->scaler->capture device. Then one function runs in the
background and constantly tries to stream the capture while different entities
are removed and added again.
- https://gitlab.collabora.com/dafna/scripts/blob/master/configfs-conc.sh
This scripts adds and removes entities and links while plugging and unplugging the device in
the backgroung.

The patchset is rebased on v3 of the patchset `media: vimc: crash fix - add refcount to vimc entities`

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
There are two separate lists for the entities. One list is maintained only by the configfs and each
object in the list contains only the name and type of the entity. Only when userspace asks to plug the device,
the configfs list is passed to the driver's probe callback through a platform_data object. The driver then
iterates it and creates its own list of allocated vimc_ent_device objects and registers them with the media controller.
There is one list in the configfs that holds the links between entities which is also passed to the driver
through the platform_data object. The driver iterates it and calls media_create_pad_link for each link.
There are two mutexes used for code synchronization: `pdev_mutex` is used to lock the platform_data while
plugging and unplugging. `topology_mutex` is used to lock the the configfs lists of the entities and the links.
The default directories for the pads `sink:<pad>` `source:<pad>` are created in configfs by a callback function that each vimc entity
registers in init (when loading vimc.ko).

There is currently a bug when trying to open a subdevice while it is unregistered -
The function `subdev_open` tries to reference sd->v4l2_dev while it is set to null in
`v4l2_device_unregister_subdev`, this can be reproduced with the script and the program:

http://ix.io/22P6
http://ix.io/22P5

This bug also occurs when unregistering the device through configfs while trying to open
a subdevice node.

Changes from v2:
- rebase on top of v3 of `media: vimc: crash fix - add refcount to vimc entities` instead of v1
- fixes in patch 1 due to comments from Andrzej Pietrasiewicz
- bug fix - ensure that an entity can't have a link to itself - this cause a kernel crash

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
 drivers/media/platform/vimc/vimc-capture.c  |  37 +-
 drivers/media/platform/vimc/vimc-common.h   |  92 ++-
 drivers/media/platform/vimc/vimc-configfs.c | 720 ++++++++++++++++++++
 drivers/media/platform/vimc/vimc-configfs.h |  41 ++
 drivers/media/platform/vimc/vimc-core.c     | 383 ++++++-----
 drivers/media/platform/vimc/vimc-debayer.c  |  26 +-
 drivers/media/platform/vimc/vimc-scaler.c   |  25 +-
 drivers/media/platform/vimc/vimc-sensor.c   |  25 +-
 13 files changed, 1401 insertions(+), 290 deletions(-)
 create mode 100644 Documentation/ABI/testing/configfs-vimc
 create mode 100644 drivers/media/platform/vimc/vimc-configfs.c
 create mode 100644 drivers/media/platform/vimc/vimc-configfs.h

-- 
2.20.1

