Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2037B6DBFF2
	for <lists+linux-media@lfdr.de>; Sun,  9 Apr 2023 15:12:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229530AbjDINMF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 9 Apr 2023 09:12:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229462AbjDINMD (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 9 Apr 2023 09:12:03 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6137340DE
        for <linux-media@vger.kernel.org>; Sun,  9 Apr 2023 06:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1681045877;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=KXjlbwe3TLCa0Y/l/yGU2fwUW5GkKv4QnahV4pJqaLA=;
        b=FnnYy0zTunuzbKDYYwsjHZyl8n6RZhWlhNJwuhhuYvlyN6/05ygSnAkn+UDcO10mPpDEK7
        cauZr7mETVEgiA+2hoUcsIHKlBZVIsygPEw1wDci8dnHG8MAEpeodWfs8PqO1E1U2ZyPba
        0j1Q5vpbrzEZEjpIHBRkPcJlRGrLo0k=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-587-s9QPRYBENjWmpXFXTZC8yQ-1; Sun, 09 Apr 2023 09:11:14 -0400
X-MC-Unique: s9QPRYBENjWmpXFXTZC8yQ-1
Received: by mail-ed1-f72.google.com with SMTP id i17-20020a50d751000000b005045c08ca6dso4650632edj.7
        for <linux-media@vger.kernel.org>; Sun, 09 Apr 2023 06:11:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681045873; x=1683637873;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KXjlbwe3TLCa0Y/l/yGU2fwUW5GkKv4QnahV4pJqaLA=;
        b=v9coMOoXZAyGgdovazKsUwobnNGOO9O9Q1dptCgFsc70WjfEuiYp9XYoZNdjRsCqIl
         9cg7/GcM/PUdsNeqIh2V595KqkR2jZMbZBQ6diZtrGQPtkKAy4OcuIjtguJ4nyQ7XYYz
         3xbbM2eW0sgJpRREo25ZXhJ/Nx3rda1kXtp3XGbftX8qNGaS7jm6xyN07Nn/HACtqbrO
         rHr9edjSgmAlg/W/YSXOYu3t76ac9MFMWuEtwj5I6frl4yo9662X6Exa/zTUHkGLw0lJ
         xHvf9MhaE8oSng8LSoRuGkc53eJ+T6XAKuFvnxP7ys9tTPGI0qIsuJgpOHgriKT0EdPG
         aR6w==
X-Gm-Message-State: AAQBX9fbeu2Dsxa79f5ifbUyCgL0lIvxf+xnwolrLsg3i6+SrgaU0/n8
        2CGiixDQKHp6C5Oz3B48fR08o+v1j7wOztX9Uqf+h719NkdXR3u9BaxSxoCpajwl2kXmD0W2hyv
        tPW5lLMjxZbeCCIK9h7YMnsQ=
X-Received: by 2002:a17:906:5a6b:b0:94a:47f1:69f3 with SMTP id my43-20020a1709065a6b00b0094a47f169f3mr3215266ejc.30.1681045873002;
        Sun, 09 Apr 2023 06:11:13 -0700 (PDT)
X-Google-Smtp-Source: AKy350bvMEyinCPQd0EHdyXJEX+5JbRbyIOP21Jw+thGbwtAyJIzwWrnqOzSKY4k/eGouHiE+b03Xw==
X-Received: by 2002:a17:906:5a6b:b0:94a:47f1:69f3 with SMTP id my43-20020a1709065a6b00b0094a47f169f3mr3215249ejc.30.1681045872705;
        Sun, 09 Apr 2023 06:11:12 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id n19-20020a1709067b5300b008f89953b761sm4098245ejo.3.2023.04.09.06.11.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Apr 2023 06:11:12 -0700 (PDT)
Message-ID: <bf274a09-a823-c547-4284-603e8c6da794@redhat.com>
Date:   Sun, 9 Apr 2023 15:11:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
From:   Hans de Goede <hdegoede@redhat.com>
Subject: [GIT PULL] media: atomisp: Changes for 6.4-1
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-staging@lists.linux.dev, Kate Hsuan <hpa@redhat.com>
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

Here are all my atomisp changes for 6.4 + a couple of atomisp patches
from others.

These patches have been posted on the list and I have addressed
all review remarks to these patches.

Highlights:
- Remove depth-mode support
- Remove continuous mode support
- Remove support for streaming from 2 sensors at once
- Add v4l2_get_acpi_sensor_info() helper to get GPIO info from ACPI _DSM
- gc0310 sensor driver:
 - Significant rework / modernization
 - Move to runtime-pm
 - Drop custom atomisp_gmin_platform regulator/clk poking code,
   replacing it with using ACPI to do the pm for us

Regards,

Hans


The following changes since commit 71937240a472ee551ac8de0e7429b9d49884a388:

  media: ov2685: Select VIDEO_V4L2_SUBDEV_API (2023-03-20 16:32:18 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux.git tags/media-atomisp-6.4-1

for you to fetch changes up to df852cfd8802302abf43264fde6a4c9757e26e69:

  media: atomisp: gmin_platform: Add Lenovo Ideapad Miix 310 gmin_vars (2023-04-09 15:01:32 +0200)

----------------------------------------------------------------
atomisp staging driver changes for 6.4

Highlights:
- Remove depth-mode support
- Remove continuous mode support
- Remove support for streaming from 2 sensors at once
- Add v4l2_get_acpi_sensor_info() helper to get GPIO info from ACPI _DSM
- gc0310 sensor driver:
 - Significant rework / modernization
 - Move to runtime-pm
 - Drop custom atomisp_gmin_platform regulator/clk poking code,
   replacing it with using ACPI to do the pm for us

----------------------------------------------------------------
Hans de Goede (38):
      media: atomisp: Remove depth-mode support
      media: atomisp: Remove continuous mode support
      media: atomisp: Remove delayed_init related code
      media: atomisp: Remove crop_needs_override from atomisp_set_fmt()
      media: atomisp: Remove atomisp_css_enable_raw_binning()
      media: atomisp: Remove atomisp_get_metadata_type()
      media: atomisp: Remove unused SOC_CAMERA, XENON_FLASH and FILE_INPUT subdev types
      media: atomisp: Remove ATOMISP_USE_YUVPP()
      media: atomisp: Remove yuvpp_mode
      media: atomisp: Remove online_process setting
      media: atomisp: Add v4l2_get_acpi_sensor_info() helper
      media: atomisp: ov2680: Use v4l2_get_acpi_sensor_info() for the GPIO lookups
      media: atomisp: ov2680: Error handling fixes
      media: atomisp: gc0310: Remove some unused structure definitions
      media: atomisp: gc0310: Remove GC0310_TOK_*
      media: atomisp: gc0310: Simplify gc0310_write_reg_array()
      media: atomisp: gc0310: Remove enum gc0310_tok_type
      media: atomisp: gc0310: Replace custom reg access functions with smbus helpers
      media: atomisp: gc0310: Remove non working flip-controls
      media: atomisp: gc0310: Remove read-only exposure control
      media: atomisp: gc0310: Drop custom ATOMISP_IOC_S_EXPOSURE support
      media: atomisp: gc0310: Add exposure and gain controls
      media: atomisp: gc0310: Add error_unlock label to s_stream()
      media: atomisp: gc0310: Modernize and simply set_fmt(), get_fmt(), etc.
      media: atomisp: gc0310: Delay power-on till streaming is started
      media: atomisp: gc0310: Add runtime-pm support
      media: atomisp: gc0310: Use devm_kzalloc() for data struct
      media: atomisp: gc0310: Switch over to ACPI powermanagement
      media: atomisp: Remove duplicate atomisp_[start|stop]_streaming() prototypes
      media: atomisp: Remove continuous mode related code from atomisp_set_fmt()
      media: atomisp: Remove custom V4L2_CID_FMT_AUTO control
      media: atomisp: Remove snr_mbus_fmt local var from atomisp_try_fmt()
      media: atomisp: Remove unused ATOM_ISP_MAX_WIDTH_TMP and ATOM_ISP_MAX_HEIGHT_TMP
      media: atomisp: Remove atomisp_try_fmt() call from atomisp_set_fmt()
      media: atomisp: Drop support for streaming from 2 sensors at once
      media: atomisp: Remove struct atomisp_sub_device index field
      media: atomisp: gmin_platform: Make DMI quirks take precedence over the _DSM table
      media: atomisp: gmin_platform: Add Lenovo Ideapad Miix 310 gmin_vars

Tsuchiya Yuto (1):
      media: atomisp: Remove remaining instance of call to trace_printk

 drivers/staging/media/atomisp/i2c/atomisp-gc0310.c | 1003 ++++--------------
 drivers/staging/media/atomisp/i2c/atomisp-ov2680.c |   33 +-
 drivers/staging/media/atomisp/i2c/gc0310.h         |  416 +++-----
 drivers/staging/media/atomisp/i2c/ov2680.h         |    1 -
 .../staging/media/atomisp/include/linux/atomisp.h  |   28 -
 .../media/atomisp/include/linux/atomisp_platform.h |   11 +-
 drivers/staging/media/atomisp/pci/atomisp_cmd.c    | 1070 +++-----------------
 drivers/staging/media/atomisp/pci/atomisp_cmd.h    |    9 -
 drivers/staging/media/atomisp/pci/atomisp_compat.h |   11 +-
 .../media/atomisp/pci/atomisp_compat_css20.c       |  420 ++------
 drivers/staging/media/atomisp/pci/atomisp_fops.c   |  119 +--
 .../media/atomisp/pci/atomisp_gmin_platform.c      |  289 +++++-
 .../staging/media/atomisp/pci/atomisp_internal.h   |   41 +-
 drivers/staging/media/atomisp/pci/atomisp_ioctl.c  |  226 +----
 drivers/staging/media/atomisp/pci/atomisp_ioctl.h  |    6 -
 drivers/staging/media/atomisp/pci/atomisp_subdev.c |  189 +---
 drivers/staging/media/atomisp/pci/atomisp_subdev.h |   22 -
 drivers/staging/media/atomisp/pci/atomisp_v4l2.c   |   75 +-
 18 files changed, 953 insertions(+), 3016 deletions(-)

