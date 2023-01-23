Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7BD85677BB6
	for <lists+linux-media@lfdr.de>; Mon, 23 Jan 2023 13:53:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231650AbjAWMxC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Jan 2023 07:53:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231540AbjAWMxB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Jan 2023 07:53:01 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 704E82102
        for <linux-media@vger.kernel.org>; Mon, 23 Jan 2023 04:52:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1674478333;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=x9x+qhmdCtHSc57zO9jb42x1+O86pQYKZWQ8m0q4ZG0=;
        b=K0MRT1gGRsGOtbMe/LH0EwDqKPWdlHJSm9Oq4q1OX0RVz8qb24LuCVFSrA1KR9/wDJZzn0
        pzKN2zxV/WiFWnaCwTHIIgO+ZVZAIVC5lfkAcIZb7EZ8pY5H/ZBZmC5OjNyEKjr685QlG1
        LVFfA8eyPKdNZ08ujBRUiF/zzDx7owY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-491-rMJ4o7ttMluRwSntHDz25A-1; Mon, 23 Jan 2023 07:52:10 -0500
X-MC-Unique: rMJ4o7ttMluRwSntHDz25A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D2B212817225;
        Mon, 23 Jan 2023 12:52:09 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.194.13])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 03AD7C15BAD;
        Mon, 23 Jan 2023 12:52:06 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Andy Shevchenko <andy@kernel.org>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH 00/57] media: atomisp: Big power-management changes + lots of fixes
Date:   Mon, 23 Jan 2023 13:51:08 +0100
Message-Id: <20230123125205.622152-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi All,

Here is another set of patches resulting from my continued work
on cleaning up / improving the atomisp driver.

The main changes here are power-management related, divided
into 2 sets:

1. Move the pm of the core atomisp device to its own custom PM
   domain. We turn the ISP on/off through the P-Unit and when
   off the PCI subsystem resume method complains about the PCI
   config space not being reachable. Changing to a custom PM
   domain fixes the logs getting filled with PCI subsys errors
   on every open of a /dev/video# node

2. Except for devices shipped with Android as factory image,
   all the DSDTs I have seen have proper ACPI pm code for
   the sensors. So we really should be using ACPI pm for this.

   This series contains a lot of ov2680 patches, including
   reworking the controls (so that control changes can be
   delayed to stream on time instead of directly trying to do
   i2c writes to the turned off sensor). Basically modernizing
   the ov2680 driver a lot (there are still some atomisp-isms left).

   And then finally after all the ov2680 cleanups it moves
   the ov2680 code over to using runtime-pm + ACPI pm,
   dropping all the direct PMIC + clk poking done by the
   atomisp_gmin_platform code.

Besides that this also contains quite a few other fixes / cleanups
for things which I encountered during the way and it contains the
start of making the ov2722 driver work. With the changes present
in that driver I get a working (but very dark) stream. I expect
that once I add a proper exposure control this will start working
better.

Regards,

Hans


Arnd Bergmann (1):
  media: atomisp: fix videobuf2 Kconfig depenendency

Brent Pappas (3):
  media: atomisp: pci: Replace bytes macros with functions
  media: atomisp: pci: hive_isp_css_common: host: vmem: Replace SUBWORD
    macros with functions
  media: atomisp: pci: sh_css: Inline single invocation of macro
    STATS_ENABLED()

Hans Verkuil (1):
  media: atomisp: use vb2_start_streaming_called()

Hans de Goede (52):
  media: atomisp: Remove atomisp_sw_contex struct
  media: atomisp: Move power-management over to a custom pm-domain
  media: atomisp: Silence "isys dma store at addr, val" debug messages
  media: atomisp: Remove non working doorbell check from
    punit_ddr_dvfs_enable()
  media: atomisp: Remove useless msleep(10) before power-on on BYT
  media: atomisp: Remove custom ATOMISP_IOC_ISP_MAKERNOTE ioctl
  media: atomisp: Remove custom ATOMISP_IOC_G_SENSOR_MODE_DATA ioctl
  media: atomisp: Remove V4L2_CID_BIN_FACTOR_HORZ/_VERT
  media: atomisp: Remove no longer used binning info from sensor
    resolution info
  media: atomisp: Propagate set_fmt() errors in queue_setup()
  media: atomisp: Remove deferred firmware loading support
  media: atomisp: Check buffer index is in range inside
    atomisp_qbuf_wrapper()
  media: atomisp: Drop atomisp_init_pipe()
  media: atomisp: Remove unnecessary memset(foo, 0, sizeof(foo)) calls
  media: atomisp: Only set default_run_mode on first open of a
    stream/asd
  media: atomisp: Do not turn off sensor when the atomisp-sub-dev does
    not own it
  media: atomisp: Allow sensor drivers without a s_power callback
  media: atomisp: Fix regulator registers on BYT devices with CRC PMIC
  media: atomisp: Remove atomisp_gmin_find_subdev()
  media: atomisp: Add atomisp_register_sensor_no_gmin() helper
  media: atomisp: Fix WARN() when the vb2 start_streaming callback fails
  media: atomisp: Drop ffmt local var from atomisp_set_fmt()
  media: atomisp: Stop overriding padding w/h to 12 on BYT
  media: atomisp: Put sensor ACPI devices in D3 before disable ACPI
    power-resources
  media: atomisp: Remove isp_subdev_link_setup()
  media: Add ovxxxx_16bit_addr_reg_helpers.h
  media: atomisp: ov2680: Use the new ovxxxx_16bit_addr_reg_helpers.h
  media: atomisp: ov2680: Rework flip ctrls
  media: atomisp: ov2680: Drop custom ATOMISP_IOC_S_EXPOSURE support
  media: atomisp: ov2680: Add exposure and gain controls
  media: atomisp: ov2680: Add test pattern control
  media: atomisp: ov2680: Fix window settings and enable window for all
    resolutions
  media: atomisp: ov2680: Make setting the modes algorithm based
  media: atomisp: ov2680: Use defines for fps, lines-per-frame and
    skip-frames
  media: atomisp: ov2680: Drop unused res member from struct
    ov2680_device
  media: atomisp: ov2680: Fix ov2680_enum_frame_interval()
  media: atomisp: ov2680: Drop v4l2_find_nearest_size() call from
    set_fmt()
  media: atomisp: ov2680: Drop struct ov2680_resolution /
    ov2680_res_preview
  media: atomisp: ov2680: Fix frame_size list
  media: atomisp: ov2680: Remove unused data-types and defines from
    ov2680.h
  media: atomisp: ov2680: Drop MAX_FMTS define
  media: atomisp: ov2680: Consistently indent define values
  media: atomisp: ov2680: Cleanup includes
  media: atomisp: ov2680: Delay power-on till streaming is started
  media: atomisp: ov2680: Add runtime-pm support
  media: atomisp: ov2680: s/dev/sensor/
  media: atomisp: ov2680: Use devm_kzalloc() for sensor data struct
  media: atomisp: ov2680: Switch over to ACPI powermanagement
  media: atomisp: ov2722: Call atomisp_gmin_remove_subdev() on probe
    failure
  media: atomisp: ov2722: Fix GPIO1 polarity
  media: atomisp: ov2722: Don't take the input_lock for try_fmt calls.
  media: atomisp: ov2722: Power on sensor from set_fmt() callback

 drivers/staging/media/atomisp/Kconfig         |    2 +-
 .../media/atomisp/i2c/atomisp-gc0310.c        |  249 ----
 .../media/atomisp/i2c/atomisp-gc2235.c        |  176 ---
 .../media/atomisp/i2c/atomisp-mt9m114.c       |  206 ---
 .../media/atomisp/i2c/atomisp-ov2680.c        | 1273 +++++------------
 .../media/atomisp/i2c/atomisp-ov2722.c        |  195 +--
 drivers/staging/media/atomisp/i2c/gc0310.h    |   10 -
 drivers/staging/media/atomisp/i2c/gc2235.h    |   31 -
 drivers/staging/media/atomisp/i2c/mt9m114.h   |   15 -
 drivers/staging/media/atomisp/i2c/ov2680.h    |  842 ++---------
 drivers/staging/media/atomisp/i2c/ov2722.h    |   36 +-
 .../media/atomisp/i2c/ov5693/atomisp-ov5693.c |  195 ---
 .../staging/media/atomisp/i2c/ov5693/ov5693.h |   61 -
 .../media/atomisp/include/linux/atomisp.h     |   50 -
 .../include/linux/atomisp_gmin_platform.h     |    2 -
 .../atomisp/include/linux/atomisp_platform.h  |   11 +-
 drivers/staging/media/atomisp/notes.txt       |    6 -
 .../staging/media/atomisp/pci/atomisp_cmd.c   |   90 +-
 .../staging/media/atomisp/pci/atomisp_cmd.h   |    9 +-
 .../staging/media/atomisp/pci/atomisp_fops.c  |   89 +-
 .../staging/media/atomisp/pci/atomisp_fops.h  |    3 +-
 .../media/atomisp/pci/atomisp_gmin_platform.c |  118 +-
 .../media/atomisp/pci/atomisp_internal.h      |    7 +-
 .../staging/media/atomisp/pci/atomisp_ioctl.c |   50 +-
 .../media/atomisp/pci/atomisp_subdev.c        |  169 +--
 .../media/atomisp/pci/atomisp_subdev.h        |   13 -
 .../staging/media/atomisp/pci/atomisp_v4l2.c  |  165 +--
 .../css_2401_system/host/isys_dma_private.h   |    2 -
 .../pci/hive_isp_css_common/host/vmem.c       |   20 +-
 drivers/staging/media/atomisp/pci/sh_css.c    |    7 +-
 .../staging/media/atomisp/pci/sh_css_params.c |   38 +-
 include/media/ovxxxx_16bit_addr_reg_helpers.h |   93 ++
 32 files changed, 862 insertions(+), 3371 deletions(-)
 create mode 100644 include/media/ovxxxx_16bit_addr_reg_helpers.h

-- 
2.39.0

