Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 26B5F680B1B
	for <lists+linux-media@lfdr.de>; Mon, 30 Jan 2023 11:41:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235595AbjA3Kla (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Jan 2023 05:41:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235611AbjA3Kl3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Jan 2023 05:41:29 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DC623252F
        for <linux-media@vger.kernel.org>; Mon, 30 Jan 2023 02:40:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1675075240;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=pca8aFg4F/dnUB5T0nT+paaTs0cOTUMO+igi7QI//xw=;
        b=fMRE2H3mnaKsuPHiyxKZgcD/8cPL7P45jyumb19yW7w2QvKbgsaHnX1UULLuvrtcQA7IQ4
        KCXAE3Z94nwci9Q3safq+pfvsZK09wU1w9tlYNgc/dLX65ZrDkAMjIddNSCqFt1CqgC7lH
        ukhfsKA+8kaFoEYcTeWm010lEgE3PtY=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-78-isVfO4FFNwykEpEOEtAIOg-1; Mon, 30 Jan 2023 05:40:39 -0500
X-MC-Unique: isVfO4FFNwykEpEOEtAIOg-1
Received: by mail-ed1-f69.google.com with SMTP id y20-20020a056402271400b0046c9a6ec30fso7900556edd.14
        for <linux-media@vger.kernel.org>; Mon, 30 Jan 2023 02:40:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pca8aFg4F/dnUB5T0nT+paaTs0cOTUMO+igi7QI//xw=;
        b=dQXrSaUM2pGbdG+l8gZe6wOUUWge8BKKcIqL4eoIxINLIn3J3JvqGa2/LAyUg277Z+
         uUbZVeh5aXwEC1VHMsYHM5ZUsWXVmo+RSIf8YB8swdPJ8YRjcXga0I++NvktB30ZdAgJ
         w+542/gPImDsLT9xi1ykpiSLH25vAAPxg6dW/Kjr1bLM+E9WhU4OSdM+P/r005o+NzqH
         rGbfPqpDMTPJZHLu91dtGfiB55Wi75W4/BeuVGCoakM2zZZXaNqZFm1/dzjtZl+tnTGy
         Fwfj33SJijE6YKzGrppj8zjhdZrkpQMjl2GmXHn/juph9V6PdCvm9Yg7aZste4QxmliJ
         0ytw==
X-Gm-Message-State: AFqh2kq+TAVSfexf2JgSX1xRsQFyxUOXcZGUfjYZ9O7l8nYVFePm3hKo
        Mowd8LwA7PRbYmxfOPoY+rg4KoWG47e4NwzuK5fH2EDYPeDWJihkUbNGcLegF+iON6VPkXMieOC
        1UHjyZ2vR5O9oHxsdG3oa2KY=
X-Received: by 2002:a17:907:ca85:b0:86f:ae1f:9234 with SMTP id ul5-20020a170907ca8500b0086fae1f9234mr56410290ejc.7.1675075237782;
        Mon, 30 Jan 2023 02:40:37 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuVA6OEP3IbzafaT5MgUGTmlmAYwedxUUr62I6+ys+lVEhc27rO6gzIKVj0qG4nB+VWUEo8JQ==
X-Received: by 2002:a17:907:ca85:b0:86f:ae1f:9234 with SMTP id ul5-20020a170907ca8500b0086fae1f9234mr56410276ejc.7.1675075237512;
        Mon, 30 Jan 2023 02:40:37 -0800 (PST)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id q6-20020a1709064cc600b0084d494b24dcsm6625388ejt.161.2023.01.30.02.40.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jan 2023 02:40:37 -0800 (PST)
Message-ID: <5b64b05c-880e-b69c-5998-8c23dcc8df20@redhat.com>
Date:   Mon, 30 Jan 2023 11:40:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
From:   Hans de Goede <hdegoede@redhat.com>
Subject: [GIT PULL] media: atomisp: Changes for 6.3-1
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-staging@lists.linux.dev
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

Here are all my atomisp changes for 6.3 + a couple of atomisp patches
from others.

These patches have been posted on the list and I have addressed
all review remarks to these patches.

Highlights:
-Move atomisp.ko power-magagement to its own pm-domain to silence all
 the PCI subsystem suspend/resume error messages
-Make the driver less chatty / silence debug + false-positive errors output
-Whole bunch of other bugfixes
-ov2680 sensor driver:
 -Significant rework / modernization
 -Move to runtime-pm
 -Drop custom atomisp_gmin_platform regulator/clk poking code,
  replacing it with using ACPI to do the pm for us!
-Initial set of patches to make the ov2722 driver work

Regards,

Hans


The following changes since commit 7120d6bfd6d0b26b49958f429701996f2d3e2c2a:

  media: tm6000: remove deprecated driver (2023-01-22 09:57:19 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux.git tags/media-atomisp-6.3-1

for you to fetch changes up to c69d6df6993e2b4ad66acf7a85dbf8c7f5734c3c:

  media: atomisp: pci: sh_css: Inline single invocation of macro STATS_ENABLED() (2023-01-30 10:19:31 +0100)

----------------------------------------------------------------
Highlights:
-Move atomisp.ko power-magagement to its own pm-domain to silence all
 the PCI subsystem suspend/resume error messages
-Make the driver less chatty / silence debug + false-positive errors output
-Whole bunch of other bugfixes
-ov2680 sensor driver:
 -Significant rework / modernization
 -Move to runtime-pm
 -Drop custom atomisp_gmin_platform regulator/clk poking code,
  replacing it with using ACPI to do the pm for us
-Initial set of patches to make the ov2722 driver work

----------------------------------------------------------------
Arnd Bergmann (1):
      media: atomisp: fix videobuf2 Kconfig depenendency

Brent Pappas (3):
      media: atomisp: pci: Replace bytes macros with functions
      media: atomisp: pci: hive_isp_css_common: host: vmem: Replace SUBWORD macros with functions
      media: atomisp: pci: sh_css: Inline single invocation of macro STATS_ENABLED()

Hans Verkuil (1):
      media: atomisp: use vb2_start_streaming_called()

Hans de Goede (55):
      media: atomisp: Propagate set_fmt() errors in queue_setup()
      media: atomisp: Only set default_run_mode on first open of a stream/asd
      media: atomisp: Fix WARN() when the vb2 start_streaming callback fails
      media: atomisp: Check buffer index is in range inside atomisp_qbuf_wrapper()
      media: atomisp: Fix regulator registers on BYT devices with CRC PMIC
      media: atomisp: Remove atomisp_sw_contex struct
      media: atomisp: Move power-management over to a custom pm-domain
      media: atomisp: Silence "isys dma store at addr, val" debug messages
      media: atomisp: Remove non working doorbell check from punit_ddr_dvfs_enable()
      media: atomisp: Remove useless msleep(10) before power-on on BYT
      media: atomisp: Remove custom ATOMISP_IOC_ISP_MAKERNOTE ioctl
      media: atomisp: Remove custom ATOMISP_IOC_G_SENSOR_MODE_DATA ioctl
      media: atomisp: Remove V4L2_CID_BIN_FACTOR_HORZ/_VERT
      media: atomisp: Remove no longer used binning info from sensor resolution info
      media: atomisp: Remove deferred firmware loading support
      media: atomisp: Drop atomisp_init_pipe()
      media: atomisp: Remove unnecessary memset(foo, 0, sizeof(foo)) calls
      media: atomisp: Do not turn off sensor when the atomisp-sub-dev does not own it
      media: atomisp: Allow sensor drivers without a s_power callback
      media: atomisp: Remove atomisp_gmin_find_subdev()
      media: atomisp: Add atomisp_register_sensor_no_gmin() helper
      media: atomisp: Drop ffmt local var from atomisp_set_fmt()
      media: atomisp: Stop overriding padding w/h to 12 on BYT
      media: atomisp: Put sensor ACPI devices in D3 before disable ACPI power-resources
      media: atomisp: Remove isp_subdev_link_setup()
      media: atomisp: Remove csi2_link_setup()
      media: atomisp: Properly initialize function field of media-entity links
      media: Add ov_16bit_addr_reg_helpers.h
      media: atomisp: ov2680: Use the new ov_16bit_addr_reg_helpers.h
      media: atomisp: ov2680: Rework flip ctrls
      media: atomisp: ov2680: Drop custom ATOMISP_IOC_S_EXPOSURE support
      media: atomisp: ov2680: Add exposure and gain controls
      media: atomisp: ov2680: Add test pattern control
      media: atomisp: ov2680: Fix window settings and enable window for all resolutions
      media: atomisp: ov2680: Make setting the modes algorithm based
      media: atomisp: ov2680: Use defines for fps, lines-per-frame and skip-frames
      media: atomisp: ov2680: Drop unused res member from struct ov2680_device
      media: atomisp: ov2680: Fix ov2680_enum_frame_interval()
      media: atomisp: ov2680: Drop v4l2_find_nearest_size() call from set_fmt()
      media: atomisp: ov2680: Drop struct ov2680_resolution / ov2680_res_preview
      media: atomisp: ov2680: Fix frame_size list
      media: atomisp: ov2680: Remove unused data-types and defines from ov2680.h
      media: atomisp: ov2680: Drop MAX_FMTS define
      media: atomisp: ov2680: Consistently indent define values
      media: atomisp: ov2680: Cleanup includes
      media: atomisp: ov2680: Delay power-on till streaming is started
      media: atomisp: ov2680: Add runtime-pm support
      media: atomisp: ov2680: s/dev/sensor/
      media: atomisp: ov2680: Add dev local variable to probe()
      media: atomisp: ov2680: Use devm_kzalloc() for sensor data struct
      media: atomisp: ov2680: Switch over to ACPI powermanagement
      media: atomisp: ov2722: Call atomisp_gmin_remove_subdev() on probe failure
      media: atomisp: ov2722: Fix GPIO1 polarity
      media: atomisp: ov2722: Don't take the input_lock for try_fmt calls.
      media: atomisp: ov2722: Power on sensor from set_fmt() callback

 drivers/staging/media/atomisp/Kconfig              |    2 +-
 drivers/staging/media/atomisp/i2c/atomisp-gc0310.c |  249 ----
 drivers/staging/media/atomisp/i2c/atomisp-gc2235.c |  176 ---
 .../staging/media/atomisp/i2c/atomisp-mt9m114.c    |  206 ----
 drivers/staging/media/atomisp/i2c/atomisp-ov2680.c | 1280 ++++++--------------
 drivers/staging/media/atomisp/i2c/atomisp-ov2722.c |  195 +--
 drivers/staging/media/atomisp/i2c/gc0310.h         |   10 -
 drivers/staging/media/atomisp/i2c/gc2235.h         |   31 -
 drivers/staging/media/atomisp/i2c/mt9m114.h        |   15 -
 drivers/staging/media/atomisp/i2c/ov2680.h         |  836 ++-----------
 drivers/staging/media/atomisp/i2c/ov2722.h         |   36 +-
 .../media/atomisp/i2c/ov5693/atomisp-ov5693.c      |  195 ---
 drivers/staging/media/atomisp/i2c/ov5693/ov5693.h  |   61 -
 .../staging/media/atomisp/include/linux/atomisp.h  |   50 -
 .../atomisp/include/linux/atomisp_gmin_platform.h  |    2 -
 .../media/atomisp/include/linux/atomisp_platform.h |   11 +-
 drivers/staging/media/atomisp/notes.txt            |    6 -
 drivers/staging/media/atomisp/pci/atomisp_cmd.c    |   90 +-
 drivers/staging/media/atomisp/pci/atomisp_cmd.h    |    9 +-
 drivers/staging/media/atomisp/pci/atomisp_csi2.c   |   41 +-
 drivers/staging/media/atomisp/pci/atomisp_csi2.h   |    5 -
 drivers/staging/media/atomisp/pci/atomisp_fops.c   |   89 +-
 drivers/staging/media/atomisp/pci/atomisp_fops.h   |    3 +-
 .../media/atomisp/pci/atomisp_gmin_platform.c      |  120 +-
 .../staging/media/atomisp/pci/atomisp_internal.h   |    7 +-
 drivers/staging/media/atomisp/pci/atomisp_ioctl.c  |   60 +-
 drivers/staging/media/atomisp/pci/atomisp_subdev.c |  171 +--
 drivers/staging/media/atomisp/pci/atomisp_subdev.h |   13 -
 drivers/staging/media/atomisp/pci/atomisp_tpg.c    |    2 +-
 drivers/staging/media/atomisp/pci/atomisp_v4l2.c   |  165 +--
 .../pci/css_2401_system/host/isys_dma_private.h    |    2 -
 .../atomisp/pci/hive_isp_css_common/host/vmem.c    |   20 +-
 drivers/staging/media/atomisp/pci/sh_css.c         |    7 +-
 drivers/staging/media/atomisp/pci/sh_css_params.c  |   38 +-
 include/media/ov_16bit_addr_reg_helpers.h          |   92 ++
 35 files changed, 871 insertions(+), 3424 deletions(-)
 create mode 100644 include/media/ov_16bit_addr_reg_helpers.h

