Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D07F776E474
	for <lists+linux-media@lfdr.de>; Thu,  3 Aug 2023 11:34:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234039AbjHCJen (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Aug 2023 05:34:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233534AbjHCJem (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Aug 2023 05:34:42 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0098C213F
        for <linux-media@vger.kernel.org>; Thu,  3 Aug 2023 02:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1691055234;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=xVBpcKRd26CW4EB6FhYHoghESIePBVb59ywLBFzr/eY=;
        b=VVUHxqCEkKsHfXpM3ybbqLp9FGzFamDtSAcP1bGKySAghq6pMaMV9A94/wohwdfxil80Hi
        BoyBk8XnG7G01w+awuSLnp8HtKKGIqsUN4wxFp0lL9llo3LqJXRC3WdGqHpkAVPep9PfJO
        AFJSX0f0FFv4Ozef3/2UvWb9aZgFWt4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-148-bvPM3WYwPlio0DQyK_0EDw-1; Thu, 03 Aug 2023 05:33:51 -0400
X-MC-Unique: bvPM3WYwPlio0DQyK_0EDw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6CE0F803FDC;
        Thu,  3 Aug 2023 09:33:50 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.193.2])
        by smtp.corp.redhat.com (Postfix) with ESMTP id CA7822166B25;
        Thu,  3 Aug 2023 09:33:48 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Daniel Scally <dan.scally@ideasonboard.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Tommaso Merciai <tomm.merciai@gmail.com>,
        linux-media@vger.kernel.org
Subject: [PATCH v5 00/32] media: ov2680: Bugfixes + ACPI + selection(crop-tgt) API support
Date:   Thu,  3 Aug 2023 11:33:15 +0200
Message-ID: <20230803093348.15679-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi All,

Unforunately v4 still had an issue with do_div() usage, so here is v5.

This is also available in this branch:
https://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux.git/log/?h=media-ov2680

Changes in v5:
- Add some notes to the ACPI support commit message about the OVTI2680 HID
- Make pixel_rate u64 instead of s64 for do_div() to fix:
  drivers/media/i2c/ov2680.c:1092:2: warning: comparison of distinct pointer types ('typeof ((sensor->pixel_rate)) *' (aka 'long long *') and 'uint64_t *' (aka 'unsigned long long *')) [-Wcompare-distinct-pointer-types]

Changes in v4:
- Rebase on top of latest sailus/media_tree/master (69142f89b61e)
- Do not set v4l2_subdev.fwnode (let v4l2-core do endpoint matching)
- Make enum_frame_interval() input checks more strict
- Make enum_frame_size() returned full-size + binned-/quarter-size
- Use V4L2_CID_ANALOGUE_GAIN for gain
- 3 new patches:
  "media: ov2680: Add bus-cfg / endpoint property verification"
  "media: ipu-bridge: Add link-frequency to OV2680 ipu_supported_sensors[] entry"
  "media: atomisp: Drop atomisp-ov2680 sensor driver"

Changes in v3:
- Add Rui Miguel Silva's Ack for the series
- 2 small fixes for remarks from Andy
- Add a new patch adding me as co-maintainer in MAINTAINERS

Changes in v2
- Drop "media: Add MIPI CCI register access helper functions"
  (being reviewed in its own thread / patch-submission)
- Drop "media: ov2680: Add g_skip_frames op support"
- Add "media: ov2680: Fix regulators being left enabled on
  ov2680_power_on() errors"
- Add "media: ov2680: Add link-freq and pixel-rate controls"
  with this the driver now works on IPU3 with ipu3-capture.sh
  (libcamera support requires adding a couple more controls)
- Limit line length to 80 chars everywhere
- Address various small remarks from Andy

During all the work done on the atomisp driver I have mostly been testing
on devices with an ov2680 sensor. As such I have also done a lot of work
on the atomisp-ov2680.c atomisp specific sensor driver.

With the latest atomisp code from:
https://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux.git/tag/?h=media-atomisp-6.5-1

The atomisp code can now work with standard v4l2 sensor drivers using
the selections (crop-tgt) api and v4l2-async sensor driver registration.

This patch series modifies the main drivers/media/i2c/ov2680.c driver
to add bugfixes, ACPI enumeration, selection API support and further
improvments. After this the driver can be used with the atomisp driver
and atomisp-ov2680.c can be dropped.

This also gets the driver much closer to having everything needed for
use with IPU3 / libcamera. I have a Lenovo Miix 510 now with an IPU3 +
ov2680 sensor and with this series raw-capture using the ipu3-capture.sh
script works. I plan to work on libcamera support for this in the near
future.

Regards,

Hans


Hans de Goede (32):
  media: ov2680: Remove auto-gain and auto-exposure controls
  media: ov2680: Fix ov2680_bayer_order()
  media: ov2680: Fix vflip / hflip set functions
  media: ov2680: Remove VIDEO_V4L2_SUBDEV_API ifdef-s
  media: ov2680: Don't take the lock for try_fmt calls
  media: ov2680: Add ov2680_fill_format() helper function
  media: ov2680: Fix ov2680_set_fmt() which == V4L2_SUBDEV_FORMAT_TRY
    not working
  media: ov2680: Fix regulators being left enabled on ov2680_power_on()
    errors
  media: ov2680: Convert to new CCI register access helpers
  media: ov2680: Store dev instead of i2c_client in ov2680_dev
  media: ov2680: Add runtime-pm support
  media: ov2680: Check for "powerdown" GPIO con-id before checking for
    "reset" GPIO con-id
  media: ov2680: Drop is_enabled flag
  media: ov2680: Add support for more clk setups
  media: ov2680: Add support for 19.2 MHz clock
  media: ov2680: Wait for endpoint fwnode before continuing with probe()
  media: ov2680: Add support for ACPI enumeration
  media: ov2680: Fix ov2680_enum_frame_interval()
  media: ov2680: Annotate the per mode register setting lists
  media: ov2680: Add ov2680_mode struct
  media: ov2680: Make setting the mode algorithm based
  media: ov2680: Add an __ov2680_get_pad_format() helper function
  media: ov2680: Implement selection support
  media: ov2680: Fix exposure and gain ctrls range and default value
  media: ov2680: Add a bunch of register tweaks
  media: ov2680: Drop unnecessary pad checks
  media: ov2680: Read and log sensor revision during probe
  media: ov2680: Add link-freq and pixel-rate controls
  media: ov2680: Add bus-cfg / endpoint property verification
  MAINTAINERS: Add Hans de Goede as OV2680 sensor driver maintainer
  media: ipu-bridge: Add link-frequency to OV2680
    ipu_supported_sensors[] entry
  media: atomisp: Drop atomisp-ov2680 sensor driver

 MAINTAINERS                                   |    1 +
 drivers/media/i2c/Kconfig                     |    1 +
 drivers/media/i2c/ov2680.c                    | 1380 +++++++++--------
 drivers/media/pci/intel/ipu-bridge.c          |    2 +-
 drivers/staging/media/atomisp/i2c/Kconfig     |   13 -
 drivers/staging/media/atomisp/i2c/Makefile    |    1 -
 .../media/atomisp/i2c/atomisp-ov2680.c        |  828 ----------
 drivers/staging/media/atomisp/i2c/ov2680.h    |  173 ---
 8 files changed, 752 insertions(+), 1647 deletions(-)
 delete mode 100644 drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
 delete mode 100644 drivers/staging/media/atomisp/i2c/ov2680.h

-- 
2.41.0

