Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2F57B731AFE
	for <lists+linux-media@lfdr.de>; Thu, 15 Jun 2023 16:15:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344974AbjFOOPG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Jun 2023 10:15:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345059AbjFOOPC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Jun 2023 10:15:02 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5176B1FE5
        for <linux-media@vger.kernel.org>; Thu, 15 Jun 2023 07:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686838454;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=mN1MYEsjbIejYgqwr3ElwyTgpp4YsrCcH+/obmijHWI=;
        b=Iyi2Te3+Uu/D0NFW1BDiAyRERJglgmwxqWnzHt5gY4dV+CBHJoE0GhLh9ulk6pe8SEM0CS
        c+5sEh7pWSYh7C2Plx3ysBmTjayn6pBpA48UGqy1SBUi3aK1D7Buk63j+sD34GvkHZfJ1Z
        zkqTRGNUenXPltCIs3/Tqn/pIG/8rK0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-526-ECU1dUE4NKCDHMxwpvrTJQ-1; Thu, 15 Jun 2023 10:14:10 -0400
X-MC-Unique: ECU1dUE4NKCDHMxwpvrTJQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9A9D8857F92;
        Thu, 15 Jun 2023 14:13:51 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.154])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 83D4448FB01;
        Thu, 15 Jun 2023 14:13:50 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Daniel Scally <dan.scally@ideasonboard.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        Tommaso Merciai <tomm.merciai@gmail.com>,
        linux-media@vger.kernel.org
Subject: [PATCH v2 00/28] media: ov2680: Bugfixes + ACPI + selection(crop-tgt) API support
Date:   Thu, 15 Jun 2023 16:13:21 +0200
Message-Id: <20230615141349.172363-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi All,

Here is v2 of my ov2680 sensor driver patch series.

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

This series consist of 3 parts:

1. Patches 1-8 are bugfixes these are put first for backporting

2. Patch 9 converts the ov2680 driver to the new CCI helpers,
the same has been done in the other series with the atomisp-ov2680
driver and this makes it much easier to sync things up.

Note this depends on the new CCI register helpers, these are being
reviewed here:

https://lore.kernel.org/linux-media/20230614192343.57280-1-hdegoede@redhat.com/

3. Patches 9 - 28 implement the ACPI enumeration,
selection API support and further improvments.

Regards,

Hans


Hans de Goede (28):
  media: ov2680: Remove auto-gain and auto-exposure controls
  media: ov2680: Fix ov2680_bayer_order()
  media: ov2680: Fix vflip / hflip set functions
  media: ov2680: Use select VIDEO_V4L2_SUBDEV_API
  media: ov2680: Don't take the lock for try_fmt calls
  media: ov2680: Add ov2680_fill_format() helper function
  media: ov2680: Fix ov2680_set_fmt() which == V4L2_SUBDEV_FORMAT_TRY
    not working
  media: ov2680: Fix regulators being left enabled on ov2680_power_on()
    errors
  media: ov2680: Convert to new CCI register access helpers
  media: ov2680: Store dev instead of i2c_client in ov2680_dev
  media: ov2680: Check for "powerdown" GPIO con-id before checking for
    "reset" GPIO con-id
  media: ov2680: Add runtime-pm support
  media: ov2680: Drop is_enabled flag
  media: ov2680: Add support for more clk setups
  media: ov2680: Add support for 19.2 MHz clock
  media: ov2680: Add endpoint matching support
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

 drivers/media/i2c/Kconfig  |    2 +
 drivers/media/i2c/ov2680.c | 1316 +++++++++++++++++++-----------------
 2 files changed, 689 insertions(+), 629 deletions(-)

-- 
2.40.1

