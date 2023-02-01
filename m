Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CE38868708E
	for <lists+linux-media@lfdr.de>; Wed,  1 Feb 2023 22:45:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229892AbjBAVpr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Feb 2023 16:45:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229609AbjBAVpo (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Feb 2023 16:45:44 -0500
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED4FA6601A
        for <linux-media@vger.kernel.org>; Wed,  1 Feb 2023 13:45:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675287942; x=1706823942;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Z4jsIe7GkmpL+BGH3kuhkHp8hub3oBSs/0srXzEOe4A=;
  b=VSYnTJvBQlu3K3wUmtM95af7hbv0cL30LdEtnliAC148nejEdcH+pIU7
   /IiZnbBK0mQmrfUOwrMmU8k2m+3T+ZHYSfiknLz0AhKIe6iMaC1uMmFpz
   fqIIfHUtZZjNpzANemPEluRyVZYOf8POgYTTdjLw3il0pujcte5CNgMKE
   56g3H3F7DLnc4f62NhGVnmsP4+81SojKjVkZoJi6smt0MRX8O2jMXtlFP
   fgHabaxWMkVihdClYZfYKHC8FOrryp1kte5wo5crFzI27UtlJcCu5/o4R
   zhOTk1P6X+ojNsMU1VF01UCKRrfhcQh+dIZhZKlhWHZtt/HRYJzQTsRw1
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="330415603"
X-IronPort-AV: E=Sophos;i="5.97,265,1669104000"; 
   d="scan'208";a="330415603"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2023 13:45:41 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="695527291"
X-IronPort-AV: E=Sophos;i="5.97,265,1669104000"; 
   d="scan'208";a="695527291"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2023 13:45:40 -0800
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 0DB62120339;
        Wed,  1 Feb 2023 23:45:35 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, hverkuil@xs4all.nl
Subject: [PATCH 00/26] Media device lifetime management
Date:   Wed,  1 Feb 2023 23:45:09 +0200
Message-Id: <20230201214535.347075-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi folks,

This is a refresh of my 2016 RFC patchset to start addressing object
lifetime issues in Media controller. It further allows continuing work to
address lifetime management of media entities.

The underlying problem is described in detail in v4 of the previous RFC:
<URL:https://lore.kernel.org/linux-media/20161108135438.GO3217@valkosipuli.retiisi.org.uk/>.
In brief, there is currently no connection between releasing media device
(and related) memory and IOCTL calls, meaning that there is a time window
during which released kernel memory can be accessed, and that access can be
triggered from the user space. The only reason why this is not a grave
security issue is that it is not triggerable by the user alone but requires
unbinding a device. That is still not an excuse for not fixing it.

This set differs from the earlier RFC to address the issue in the
following respects:

- Make changes for ipu3-cio2 driver, too.

- Continue to provide best effort attempt to keep the window between device
  removal and user space being able to access released memory as small as
  possible. This means the problem won't become worse for drivers for which
  Media device lifetime management has not been implemented.

The latter is achieved by adding a new object, Media devnode compat
reference, which is allocated, refcounted and eventually released by the
Media controller framework itself, and where the information on registration
and open filehandles is maintained. This is only done if the driver does not
manage the lifetime of the media device itself, i.e. its release operation
is NULL.

Due to this, Media device file handles will also be introduced by this
patchset. I thought the first user of this would be Media device events but
it seems we already need them here.

Both ipu3-cio2 and omap3isp drivers are relieved of devm_request_irq() use,
as device_release() releases the resources before calling the driver's
remove function. While further work will be required also on these drivers
to safely stop he hardware at unbind time, I don't see a reason not to merge
these patches now.

Some patches are temporarily reverted in order to make reworks easier, then
applied later on.

I've tested this on ipu3-cio2 with and without the refcounting patch (media:
ipu3-cio2: Release the cio2 device context by media device callback),
including failures in a few parts of the driver initialisation process in
the MC framework.

Questions and comments are welcome.


Daniel Axtens (1):
  media: uvcvideo: Refactor teardown of uvc on USB disconnect

Laurent Pinchart (1):
  media: Add per-file-handle data support

Logan Gunthorpe (1):
  media: utilize new cdev_device_add helper function

Sakari Ailus (23):
  Revert "[media] media: fix media devnode ioctl/syscall and unregister
    race"
  Revert "media: utilize new cdev_device_add helper function"
  Revert "[media] media: fix use-after-free in cdev_put() when app exits
    after driver unbind"
  Revert "media: uvcvideo: Refactor teardown of uvc on USB disconnect"
  Revert "[media] media-device: dynamically allocate struct
    media_devnode"
  media device: Drop nop release callback
  media: Do not call cdev_device_del() if cdev_device_add() fails
  media-device: Delete character device early
  media: Split initialising and adding media devnode
  media: Shuffle functions around
  media device: Initialise media devnode in media_device_init()
  media device: Refcount the media device
  v4l: Acquire a reference to the media device for every video device
  media-device: Postpone graph object removal until free
  omap3isp: Release the isp device struct by media device callback
  omap3isp: Don't use devm_request_irq()
  media: Add nop implementations of media_device_{init,cleanup}
  media: ipu3-cio2: Call v4l2_device_unregister() earlier
  media: ipu3-cio2: Don't use devm_request_irq()
  media: ipu3-cio2: Release the cio2 device context by media device
    callback
  media: Maintain a list of open file handles in a media device
  media: Implement best effort media device removal safety sans
    refcounting
  media: Document how Media device resources are released

 Documentation/driver-api/media/mc-core.rst    |  12 +-
 drivers/media/cec/core/cec-core.c             |   2 +-
 drivers/media/mc/mc-device.c                  | 279 +++++++++++-------
 drivers/media/mc/mc-devnode.c                 |  94 +++---
 drivers/media/pci/intel/ipu3/ipu3-cio2-main.c |  75 +++--
 drivers/media/platform/ti/omap3isp/isp.c      |  33 ++-
 drivers/media/usb/au0828/au0828-core.c        |   4 +-
 drivers/media/usb/uvc/uvc_driver.c            |   2 +-
 drivers/media/v4l2-core/v4l2-dev.c            |  13 +-
 drivers/staging/media/sunxi/cedrus/cedrus.c   |   2 +-
 include/media/media-device.h                  |  56 +++-
 include/media/media-devnode.h                 |  99 ++++---
 include/media/media-fh.h                      |  32 ++
 13 files changed, 476 insertions(+), 227 deletions(-)
 create mode 100644 include/media/media-fh.h

-- 
2.30.2

