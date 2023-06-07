Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5977E725B97
	for <lists+linux-media@lfdr.de>; Wed,  7 Jun 2023 12:28:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235568AbjFGK21 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Jun 2023 06:28:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233580AbjFGK20 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Jun 2023 06:28:26 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C65C1BE3
        for <linux-media@vger.kernel.org>; Wed,  7 Jun 2023 03:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686133660;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=96WnLGcpgKdBh4A79Bz7w14gcOkSTg9UUjz7avrM4yg=;
        b=Yd5ZN0aStOx4EtiiV25g0laFH+nfLNVzSkktvrV9sjA1o08c8+zOA6SswMDZ2FFLc9VBHP
        EbgTCFnDTu3jCDFoJ63ckHS8bgHNF92FVnQYx4g0KWm1lNB1cgh9IFf3U5WQgJIY6agi1M
        0PRmhLEEu965cecDquLAozBRgI2sJPw=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-5-s2hUcuUdPw6BSSLbbB4tvQ-1; Wed, 07 Jun 2023 06:27:39 -0400
X-MC-Unique: s2hUcuUdPw6BSSLbbB4tvQ-1
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-514b19ded99so654997a12.0
        for <linux-media@vger.kernel.org>; Wed, 07 Jun 2023 03:27:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686133658; x=1688725658;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=96WnLGcpgKdBh4A79Bz7w14gcOkSTg9UUjz7avrM4yg=;
        b=iHvRxJA6SWvN6GVkBCHltG1GK2Rw7wZxfRzhC10nsVjiW1rRzg7/orRXiuDKR/1ii6
         OfZgq46YKctdkgt/y7yNCRESk957ZF/zdN+OYaMGaCUlfxWPh1iy6VFMTKaN2B/KSias
         SnZUwqoTqYV7lNdazvGeuQVI8qNehUjHn0FujHRK98Q4OgtFOXWv+hp12oTRhlwWwHZn
         6Cs8giJr4xOetCYyuMhs7EKviyo99K1V5QWOU53T9OV3RgkbnpJXv+4pUjF0KL9Jm5HI
         bftFtQgB3ZZe6Rbbd04ILIC2iPTg7PYmgCfj7nbpJYInOIQDWRCyoQH5BQJLYFVfrMqA
         +HHA==
X-Gm-Message-State: AC+VfDyM3vljggS+1bwNrzVKakAkY+zlwt7H2abXOzXW2Ht8062f7648
        lfwJmApVP5N9NKWM0qBAJrXOQ0KgpLB2FuPXwkqluh6OW4xOkcRdDe7WRvOxWB2Uo/X3Fo+8aBE
        xQa9Srt68LON2OpK8Og3RjSk=
X-Received: by 2002:a17:907:d1e:b0:96f:d556:b926 with SMTP id gn30-20020a1709070d1e00b0096fd556b926mr5958305ejc.77.1686133657946;
        Wed, 07 Jun 2023 03:27:37 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7+QoEO5+BUd+Kj3pTzC+zIIKnt4hszTpcdNEsDnRsAxwyzJFybac//YyU83nI+1s+f2FEKvw==
X-Received: by 2002:a17:907:d1e:b0:96f:d556:b926 with SMTP id gn30-20020a1709070d1e00b0096fd556b926mr5958280ejc.77.1686133657554;
        Wed, 07 Jun 2023 03:27:37 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id d5-20020aa7ce05000000b0051632dc69absm6024084edv.86.2023.06.07.03.27.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jun 2023 03:27:36 -0700 (PDT)
Message-ID: <4177be8a-7a77-c452-7b98-91d5e5af8e8b@redhat.com>
Date:   Wed, 7 Jun 2023 12:27:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
From:   Hans de Goede <hdegoede@redhat.com>
Subject: [GIT PULL] media: atomisp: Changes for 6.5-1
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-staging@lists.linux.dev, Kate Hsuan <hpa@redhat.com>
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

Here are all my atomisp changes for 6.5 + a couple of atomisp patches
from others.

These patches have been posted on the list and I have addressed
all review remarks (thank you Andy!) to these patches.

Lots if exciting progress this cycle, even if I say so myself :)

Highlights:
- Some #ifdef ISP2401 removal work (Kate Hsuan)
- Now only 1 /dev/video# node is created
- Support for v4l2-async registered sensors, while keeping support for sensors
  registered through atomisp_gmin_platform for now to allow testing / converting
  sensors 1 by 1
- Support for selection API / crop selection to deal with the extra padding
  the atomisp wants / needs to receive from the sensor
- This removes the last of any atomisp custom sensor API, so the atomisp code
  can now fully work with standard v4l2 sensor drivers. I have another patch
  series which brings drivers/media/i2c/ov2680.c up2date with modern sensor
  driver practices like the selection API and after this atomisp-ov2680.c is
  no longer necessary.
- Update TODO file with remaining items which need fixing before this can
  be moved out of stating
- Updated testing instructions (in the TODO file)

Regards,

Hans


The following changes since commit aafeeaf3d2a8a91a5407c774c578abec79dcff00:

  media: video-mux: update driver to active state (2023-05-26 10:58:18 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux.git tags/media-atomisp-6.5-1

for you to fetch changes up to 75ce10cb791adf2e562c4f815d382326e3f2a676:

  media: atomisp: csi2-bridge: Add support for setting "clock-" and "link-frequencies" props (2023-06-07 11:40:31 +0200)

----------------------------------------------------------------
atomisp staging driver changes for 6.5

Highlights:
- Some #ifdef ISP2401 removal work (Kate Hsuan)
- Now only 1 /dev/video# node is created
- Support for v4l2-async registered sensors, while keeping support for sensors
  registered through atomisp_gmin_platform for now to allow testing / converting
  sensors 1 by 1
- Support for selection API / crop selection to deal with the extra padding
  the atomisp wants / needs to receive from the sensor
- This removes the last of any atomisp custom sensor API, so the atomisp code
  can now fully work with standard v4l2 sensor drivers. I have another patch
  series which brings drivers/media/i2c/ov2680.c up2date with modern sensor
  driver practices like the selection API and after this atomisp-ov2680.c is
  no longer necessary.
- Update TODO file with remaining items which need fixing before this can
  be moved out of stating
- Updated testing instructions (in the TODO file)

----------------------------------------------------------------
Dan Carpenter (1):
      media: atomisp: gmin_platform: fix out_len in gmin_get_config_dsm_var()

Hans Verkuil (2):
      media: atomisp: initialize settings to 0
      media: atomisp: move up sanity checks

Hans de Goede (78):
      media: atomisp: Remove res_overflow parameter from atomisp_try_fmt()
      media: atomisp: Remove Continuous capture and SDV run-modes
      media: atomisp: Remove isp->need_gfx_throttle field
      media: atomisp: Drop atomisp_get_css_buf_type()
      media: atomisp: Replace source-pad checks with run-mode checks
      media: atomisp: Register only 1 /dev/video# node
      media: atomisp: Drop atomisp_is_vf_pipe()
      media: atomisp: Rename video_out_preview to video_out
      media: atomisp: Remove source_pad parameter from functions and structs
      media: atomisp: Remove 1 line atomisp_flush_bufs_and_wakeup() helper
      media: atomisp: Remove atomisp_subdev_register_video_nodes() helper
      media: atomisp: Remove a bunch of unused atomisp_css_*() functions
      media: atomisp: Remove unused mipi_frame_size field from atomisp_[sub_]device
      media: atomisp: Remove isp_timeout flag
      media: atomisp: Remove atomisp_sensor_start_stream()
      media: atomisp: Simplify atomisp_[start|stop]_streaming()
      media: atomisp: Simplify atomisp_css_[start|stop]()
      media: atomisp: Simplify atomisp_open() and atomisp_release()
      media: atomisp: Simplify atomisp_pipe_check()
      media: atomisp: Turn asd->streaming state tracker into a bool
      media: atomisp: Remove no longer used atomisp_css_flush()
      media: atomisp: Remove atomisp_streaming_count()
      media: atomisp: Simplify atomisp_isr() and recovery_work()
      media: atomisp: Rename atomisp_destroy_pipes_stream_force() to atomisp_destroy_pipes_stream()
      media: atomisp: Allow system suspend to continue with open /dev/video# nodes
      media: atomisp: Remove atomisp_[sub]dev_users()
      media: atomisp: Remove unused css_pipe_id argument from atomisp_css_[start|stop]()
      media: atomisp: Remove unused atomisp_get_css_pipe_id() function
      media: atomisp: Remove in_reset argument from atomisp_css_start()
      media: atomisp: Set asd.subdev.devnode once from isp_subdev_init_entities()
      media: atomisp: gc0310: Drop XXGC0310 ACPI hardware-id
      media: atomisp: gc0310: Fix double free in gc0310_remove()
      media: atomisp: gc0310: Cleanup includes
      media: atomisp: gc0310: Remove gc0310_s_config() function
      media: atomisp: gc0310: Remove gc0310.h
      media: atomisp: Drop MRFLD_PORT_NUM define
      media: atomisp: Remove unused fields from struct atomisp_input_subdev
      media: atomisp: Remove atomisp_video_init() parametrization
      media: atomisp: Rename __get_mipi_port() to atomisp_port_to_mipi_port()
      media: atomisp: Store number of sensor lanes per port in struct atomisp_device
      media: atomisp: Delay mapping sensors to inputs till atomisp_register_device_nodes()
      media: atomisp: Move pad linking to atomisp_register_device_nodes()
      media: atomisp: Allow camera_mipi_info to be NULL
      media: atomisp: Add support for v4l2-async sensor registration
      media: atomisp: ov2680: Turn into standard v4l2 sensor driver
      media: atomisp: gc0310: Turn into standard v4l2 sensor driver
      media: atomisp: Drop v4l2_get_acpi_sensor_info() function
      media: atomisp: Fix buffer overrun in gmin_get_var_int()
      media: atomisp: Update TODO
      media: atomisp: ov2680: s/ov2680_device/ov2680_dev/
      media: atomisp: ov2680: s/input_lock/lock/
      media: atomisp: ov2680: Add missing ov2680_calc_mode() call to probe()
      media: atomisp: ov2680: Add init_cfg pad-op
      media: atomisp: ov2680: Implement selection support
      media: atomisp: Remove a bunch of sensor related custom IOCTLs
      media: atomisp: Remove redundant atomisp_subdev_set_selection() calls from atomisp_set_fmt()
      media: atomisp: Simplify atomisp_subdev_set_selection() calls in atomisp_set_fmt()
      media: atomisp: Add target validation to atomisp_subdev_set_selection()
      media: atomisp: Remove bogus fh use from atomisp_set_fmt*()
      media: atomisp: Add input helper variable for isp->asd->inputs[asd->input_curr]
      media: atomisp: Add ia_css_frame_pad_width() helper function
      media: atomisp: Refactor atomisp_try_fmt() / atomisp_set_fmt()
      media: atomisp: Add support for sensors which implement selection API / cropping
      media: atomisp: Pass MEDIA_BUS_FMT_* code when calling enum_frame_size pad-op
      media: atomisp: Make atomisp_init_sensor() check if the sensor supports binning
      media: atomisp: Use selection API info to determine sensor padding
      media: atomisp: Set crop before setting fmt
      media: atomisp: Add enum_framesizes function for sensors with selection / crop support
      media: atomisp: csi2-bridge: Set PMC clk-rate for sensors to 19.2 MHz
      media: atomisp: Take minimum padding requirement on BYT/ISP2400 into account
      media: atomisp: Make atomisp_enum_framesizes_crop() check resolution fits with padding
      media: atomisp: Fix binning check in atomisp_set_crop()
      media: atomisp: Stop resetting selected input to 0 between /dev/video# opens
      media: atomisp: ov2680: Stop using half pixelclock for binned modes
      media: atomisp: ov2680: Remove unnecessary registers from ov2680_global_setting[]
      media: atomisp: ov2680: Rename unknown/0x370a to sensor_ctrl_0a
      media: atomisp: Add testing instructions to TODO file
      media: atomisp: csi2-bridge: Add support for setting "clock-" and "link-frequencies" props

Kate Hsuan (5):
      media: atomisp: sh_css: Remove #ifdef ISP2401
      media: atomisp: runtime: frame: remove #ifdef ISP2401
      media: atomisp: sh_css_sp: Remove #ifdef ISP2401
      media: atomisp: sh_css_firmware: determine firmware version at runtime
      media: atomisp: sh_css_mipi: Remove #ifdef ISP2401

Uwe Kleine-König (1):
      media: atomisp: Switch i2c drivers back to use .probe()

 drivers/staging/media/atomisp/Makefile             |    1 +
 drivers/staging/media/atomisp/TODO                 |  262 ++---
 drivers/staging/media/atomisp/i2c/atomisp-gc0310.c |  315 +++++-
 drivers/staging/media/atomisp/i2c/atomisp-gc2235.c |    2 +-
 drivers/staging/media/atomisp/i2c/atomisp-lm3554.c |    2 +-
 .../staging/media/atomisp/i2c/atomisp-mt9m114.c    |    2 +-
 drivers/staging/media/atomisp/i2c/atomisp-ov2680.c |  252 +++--
 drivers/staging/media/atomisp/i2c/atomisp-ov2722.c |    2 +-
 drivers/staging/media/atomisp/i2c/gc0310.h         |  309 ------
 drivers/staging/media/atomisp/i2c/ov2680.h         |  141 +--
 .../media/atomisp/i2c/ov5693/atomisp-ov5693.c      |   42 +-
 .../staging/media/atomisp/include/linux/atomisp.h  |  127 +--
 .../media/atomisp/include/linux/atomisp_platform.h |    1 +
 drivers/staging/media/atomisp/pci/atomisp-regs.h   |    1 -
 drivers/staging/media/atomisp/pci/atomisp_cmd.c    | 1036 +++++++-------------
 drivers/staging/media/atomisp/pci/atomisp_cmd.h    |   28 +-
 drivers/staging/media/atomisp/pci/atomisp_common.h |    4 +
 drivers/staging/media/atomisp/pci/atomisp_compat.h |   41 +-
 .../media/atomisp/pci/atomisp_compat_css20.c       |  283 +-----
 .../media/atomisp/pci/atomisp_compat_ioctl32.h     |   55 --
 drivers/staging/media/atomisp/pci/atomisp_csi2.c   |   10 +-
 drivers/staging/media/atomisp/pci/atomisp_csi2.h   |   94 +-
 .../media/atomisp/pci/atomisp_csi2_bridge.c        |  874 +++++++++++++++++
 drivers/staging/media/atomisp/pci/atomisp_drvfs.c  |    2 +-
 drivers/staging/media/atomisp/pci/atomisp_fops.c   |  181 +---
 drivers/staging/media/atomisp/pci/atomisp_fops.h   |    3 -
 .../media/atomisp/pci/atomisp_gmin_platform.c      |  248 +----
 .../staging/media/atomisp/pci/atomisp_internal.h   |   29 +-
 drivers/staging/media/atomisp/pci/atomisp_ioctl.c  |  400 ++------
 drivers/staging/media/atomisp/pci/atomisp_ioctl.h  |    5 -
 drivers/staging/media/atomisp/pci/atomisp_subdev.c |  258 +----
 drivers/staging/media/atomisp/pci/atomisp_subdev.h |   36 +-
 drivers/staging/media/atomisp/pci/atomisp_v4l2.c   |  425 ++++----
 drivers/staging/media/atomisp/pci/atomisp_v4l2.h   |    4 +-
 .../pci/runtime/frame/interface/ia_css_frame.h     |    2 +
 .../media/atomisp/pci/runtime/frame/src/frame.c    |   62 +-
 drivers/staging/media/atomisp/pci/sh_css.c         |  524 +++++-----
 .../staging/media/atomisp/pci/sh_css_firmware.c    |   33 +-
 drivers/staging/media/atomisp/pci/sh_css_mipi.c    |   56 +-
 drivers/staging/media/atomisp/pci/sh_css_sp.c      |   10 +-
 40 files changed, 2701 insertions(+), 3461 deletions(-)
 delete mode 100644 drivers/staging/media/atomisp/i2c/gc0310.h
 create mode 100644 drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c

