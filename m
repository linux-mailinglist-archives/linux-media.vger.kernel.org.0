Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 83483B9080
	for <lists+linux-media@lfdr.de>; Fri, 20 Sep 2019 15:17:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727397AbfITNRx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 20 Sep 2019 09:17:53 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:48501 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726924AbfITNRx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 20 Sep 2019 09:17:53 -0400
Received: from [IPv6:2001:983:e9a7:1:3829:6e33:4e49:c53d] ([IPv6:2001:983:e9a7:1:3829:6e33:4e49:c53d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id BInFiW47U9D4hBInGie06F; Fri, 20 Sep 2019 15:17:51 +0200
Subject: Re: [PATCH 0/5] media: vimc: use configfs in order to configure
 devices topologies
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, helen.koike@collabora.com,
        ezequiel@collabora.com, andre.almeida@collabora.com,
        skhan@linuxfoundation.org, kernel@collabora.com, dafna3@gmail.com
References: <20190919203208.12515-1-dafna.hirschfeld@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <1ec1a1f9-2b9d-9484-2713-cc63a6edb7cb@xs4all.nl>
Date:   Fri, 20 Sep 2019 15:17:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190919203208.12515-1-dafna.hirschfeld@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfChKoUWPKCLlJeBiOzlNFu+hokqUEYXFBu/U+DJ/mMRu/lZgi0RSKlkobDpfT4TbzygaXQK8k6hfsX2ysceOC6/ZRi1dGdPTPFt0bzddyJR7HHML5ovR
 0BqnGAG03xdquM38UppeFPK+tYuatz/MOdW/1wRNA+tTlDeSyV+J5B857UA+uzVhRbgF1ZdZOo0Z09ITF2Uq/bZyEXxT4e7KYshsHdG0DeVQs+ZkrDA8v5ss
 x6/vodl9IjCMcLFb8c6y0BXt1gWsquFjBUxnu8Yy4r0Czj+cLFrzo4g360nDCLO1c9SK9jNhtA0wi1Ym33YurUNty9iiZL3eL/I2JrEORFSpj2Am26mexAdx
 ZS3DmL/00Iy/mzcCmo8Le8cM1XERoe9PRWkTfd+W0OwrAkNAy1FoChpalVT6W6NaF7uovjvGVNTcX2HlmlGKmGEHurs7ER617g+PdIIyqkqu03pjxuM9KEkr
 n9/vSCNFchTenpQZGH/j/8MFLT+OsvxiP4VJ6dJABzFDVwNBKw+VKfy/1d4+bOODw5ZKv4abWTv9I4TkV4AqnqSQdaO9eqW+0dYUIV4mRZ4U7gF4aUHovxmm
 Bzo=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dafna,

On 9/19/19 10:32 PM, Dafna Hirschfeld wrote:
> This patchset introduces the usage of configfs in order to create vimc devices
> with a configured topology. A patch introducing configfs usage was already sent by Helen Koike:
> https://patchwork.linuxtv.org/patch/53397/ . The current patch is based on her patch but
> suggests a new API for using configfs.
> It uses symlinks to represent a link between two entities, an approach already used in the kernel
> by usb gadgets composed with configfs to associate usb gadget's functions to its configurations.
> For example, a topology of sensor->capture will be created with the following commands:
> 
> CONFIGFS_ROOT=/sys/kernel/config
> 
> mkdir ${CONFIGFS_ROOT}/vimc/mdev/
> mkdir ${CONFIGFS_ROOT}/vimc/mdev/vimc-sensor:sen
> mkdir ${CONFIGFS_ROOT}/vimc/mdev/vimc-capture:cap
> tree ${CONFIGFS_ROOT}
> /configfs/
> `-- vimc
>     `-- mdev
>         |-- hotplug
>         |-- vimc-capture:cap
>         |   `-- pad:sink:0
>         `-- vimc-sensor:sen
>             `-- pad:source:0
> 
> mkdir ${CONFIGFS_ROOT}/vimc/mdev/vimc-sensor:sen/pad:source:0/to-cap
> ln -s ${CONFIGFS_ROOT}/vimc/mdev/vimc-capture:cap/pad:sink:0 ${CONFIGFS_ROOT}/vimc/mdev/vimc-sensor:sen/pad:source:0/to-cap
> tree ${CONFIGFS_ROOT}
> /configfs/
> `-- vimc
>     `-- mdev
>         |-- hotplug
>         |-- vimc-capture:cap
>         |   `-- pad:sink:0
>         `-- vimc-sensor:sen
>             `-- pad:source:0
>                 `-- to-cap
>                     |-- enabled
>                     |-- immutable
>                     `-- pad:sink:0 -> ../../../../../vimc/mdev/vimc-capture:cap/pad:sink:0
> 
> There are several reasons to prefer the symlink approach in order to represent links between entities.
> The previous approach in which links are represented with directories of the form 'entity1:pad>-><entity2:pad'
> requires userspace to parse the dirctories names in order to understand the topology, while in the symlink
> approach userspace needs only to traverse the configfs tree.
> Also, the usage of symlinks prevents userspace from creating links between entities that don't exist and also
> an entity can't be removed if there is a symlink pointing to it or from it, while in the previous approach the

Why can't you remove an entity if there is a symlink pointing to it?

In the example above I can remove mdev/vimc-capture:cap just fine. Afterwards
the pad:sink:0 symlink will point to a non-existing file, but that's valid
symlink behavior.

Or is vimc checking internally and prohibits the user from making invalid changes?

In any case, this cover letter is a bit confusing and needs to address this in more
detail.

Regards,

	Hans

> links were created by creating unrelated directories and care had to be taken to ensure consistency. This way
> the topology configured from userspace is restricted to always be valid and represent the current topology of
> the device. This results in less validation needed in kernel code when plugging the device and less possibility
> for mistakes in the userspace side. Last, but not least, using symlinks is the natural way of associating things
> in configfs.
> 
> This patch is meant to demonstrate the suggested configfs api and get comments and acceptance/disagreement from
> the community. It passes few tests that configure basic topology and streams the capture entities.
> Here is the tests script: https://gitlab.collabora.com/dafna/scripts/blob/master/configfs/sym-unit-tests-simple-topo.sh
> Further versions will go through more extensive debugging.
> 
> The patchset is rebased on top of v5 of the patchset 'Collapse vimc into single monolithic driver' sent by Shuah Khan
> https://lkml.org/lkml/2019/9/17/656
> 
> Patch 1, was sent by me before as a single patch and is needed for the configfs implementation.
> 
> Patch 2, documents how to use the new configfs api in order to create and set devices topologies.
> 
> Patch 3, only adds the new configfs api code but does not use it yet, so it still creates only the hardcoded device.
> 
> Patch 4, removes the hardcoded device topology and creates devices with topologies configured with the configfs.
> 
> Patch 5, implements indexing for the bus_info field since now there can be more than one vimc device.
> 
> Dafna Hirschfeld (5):
>   media: vimc: upon streaming, check that the pipeline starts with a
>     source entity
>   docs: media: vimc: Documenting vimc topology configuration using
>     configfs
>   media: vimc: Add the implementation for the configfs api
>   media: vimc: use configfs instead of having hardcoded configuration
>   media: vimc: Add device index to the bus_info
> 
>  Documentation/media/v4l-drivers/vimc.dot    |  28 +-
>  Documentation/media/v4l-drivers/vimc.rst    | 240 ++++++-
>  drivers/media/platform/vimc/Kconfig         |   9 +-
>  drivers/media/platform/vimc/Makefile        |   2 +-
>  drivers/media/platform/vimc/vimc-capture.c  |  50 +-
>  drivers/media/platform/vimc/vimc-common.h   |  86 ++-
>  drivers/media/platform/vimc/vimc-configfs.c | 656 ++++++++++++++++++++
>  drivers/media/platform/vimc/vimc-configfs.h |  41 ++
>  drivers/media/platform/vimc/vimc-core.c     | 350 +++++------
>  drivers/media/platform/vimc/vimc-debayer.c  |  35 +-
>  drivers/media/platform/vimc/vimc-scaler.c   |  35 +-
>  drivers/media/platform/vimc/vimc-sensor.c   |  33 +-
>  drivers/media/platform/vimc/vimc-streamer.c |  39 +-
>  13 files changed, 1289 insertions(+), 315 deletions(-)
>  create mode 100644 drivers/media/platform/vimc/vimc-configfs.c
>  create mode 100644 drivers/media/platform/vimc/vimc-configfs.h
> 

