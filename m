Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23CB730D43A
	for <lists+linux-media@lfdr.de>; Wed,  3 Feb 2021 08:47:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232221AbhBCHqm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Feb 2021 02:46:42 -0500
Received: from mga01.intel.com ([192.55.52.88]:29215 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231956AbhBCHqi (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 3 Feb 2021 02:46:38 -0500
IronPort-SDR: WQj1qLQZ/LA9YOVECbNT1c5zspgoaydETXmstHQuDdKkOTyz92rmyE7nBl4jf8l/BkCHMHNV9y
 lpWohgSmvNtQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9883"; a="199952322"
X-IronPort-AV: E=Sophos;i="5.79,397,1602572400"; 
   d="scan'208";a="199952322"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2021 23:45:41 -0800
IronPort-SDR: CB1yzlyuOXlaS08cskauebbiqfure5VDY/jVY3IlVF4ORjxLjouzijARzt/T7EHuc1QH/zO4vD
 5+U+SmaKQ4hg==
X-IronPort-AV: E=Sophos;i="5.79,397,1602572400"; 
   d="scan'208";a="433280692"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.127])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2021 23:45:41 -0800
From:   Vivek Kasireddy <vivek.kasireddy@intel.com>
To:     virtualization@lists.linux-foundation.org,
        dri-devel@lists.freedesktop.org
Cc:     kraxel@redhat.com, daniel.vetter@intel.com, daniel.vetter@ffwll.ch,
        dongwon.kim@intel.com, sumit.semwal@linaro.org,
        christian.koenig@amd.com, linux-media@vger.kernel.org,
        Vivek Kasireddy <vivek.kasireddy@intel.com>
Subject: [RFC v3 0/3] Introduce Virtio based Dmabuf driver
Date:   Tue,  2 Feb 2021 23:35:14 -0800
Message-Id: <20210203073517.1908882-1-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The Virtual Dmabuf or Virtio based Dmabuf (Vdmabuf) driver can be used
to "transfer" a page-backed dmabuf created in the Guest to the Host
without making any copies. This is mostly accomplished by recreating the
dmabuf on the Host using the PFNs and other meta-data shared by the guest. 
A use-case where this driver would be a good fit is a multi-GPU system 
(perhaps one discrete and one integrated) where one of the GPUs does not 
have access to the display/connectors/outputs. This could be an embedded 
system design decision or a restriction made at the firmware/BIOS level
or perhaps the device is setup in UPT (Universal Passthrough) mode. When 
such a GPU is passthrough'd to a Guest OS, this driver can help in 
transferring the scanout buffer(s) (rendered using the native rendering 
stack) to the Host for the purpose of displaying them. Or, quite simply,
this driver can be used to transfer a dmabuf created by an application
running on the Guest to another application running on the Host.

The userspace component running in the Guest that transfers the dmabuf
is referred to as the producer or exporter and its counterpart running
in the Host is referred to as importer or consumer. For instance, a
Wayland compositor would potentially be a producer and Qemu UI would
be a consumer. It is the producer's responsibility to not reuse or
destroy the shared buffer while it is still being used by the consumer.
The consumer would send a release cmd indicating that it is done after
which the shared buffer can be safely used again by the producer. One
way the producer can prevent accidental re-use of the shared buffer is
to lock the buffer when it exports it and unlock it after it gets a 
release cmd. As an example, the GBM API provides a simple way to lock 
and unlock a surface's buffers.

For each dmabuf that is to be shared with the Host, a 128-bit unique
ID is generated that identifies this buffer across the whole system.
This ID is a combination of the Qemu process ID, a counter and a
randomizer. We could potentially use UUID API but we currently use
the above mentioned combination to identify the source of the buffer
at any given time for potential bookkeeping.

A typical cycle starts with the producer or exporter calling the
export IOCTL to export a dmabuf; a new unique ID is generated for
this buffer and it gets registered with the Host. The Host then
alerts the consumer or importer by raising an event and shares the ID.
In response, the consumer calls the import IOCTL using the ID and gets
a newly created dmabuf fd in return. After it is done using the dmabuf,
the consumer finally calls the release IOCTL and the Guest is notified
which in turn notifies the producer letting it know that the buffer is
now safe to reuse. 

v2:
- Added a notifier mechanism for getting the kvm pointer.
- Added start and stop routines in the Vhost backend.
- Augmented the cover letter and made some minor improvements.

v3:
- Refactored the code to make it similar to vsock

Vivek Kasireddy (3):
  kvm: Add a notifier for create and destroy VM events
  virtio: Introduce Vdmabuf driver
  vhost: Add Vdmabuf backend

 drivers/vhost/Kconfig               |    9 +
 drivers/vhost/Makefile              |    3 +
 drivers/vhost/vdmabuf.c             | 1446 +++++++++++++++++++++++++++
 drivers/virtio/Kconfig              |    8 +
 drivers/virtio/Makefile             |    1 +
 drivers/virtio/virtio_vdmabuf.c     | 1090 ++++++++++++++++++++
 include/linux/kvm_host.h            |    5 +
 include/linux/virtio_vdmabuf.h      |  271 +++++
 include/uapi/linux/vhost.h          |    3 +
 include/uapi/linux/virtio_ids.h     |    1 +
 include/uapi/linux/virtio_vdmabuf.h |   99 ++
 virt/kvm/kvm_main.c                 |   20 +-
 12 files changed, 2954 insertions(+), 2 deletions(-)
 create mode 100644 drivers/vhost/vdmabuf.c
 create mode 100644 drivers/virtio/virtio_vdmabuf.c
 create mode 100644 include/linux/virtio_vdmabuf.h
 create mode 100644 include/uapi/linux/virtio_vdmabuf.h

-- 
2.26.2

