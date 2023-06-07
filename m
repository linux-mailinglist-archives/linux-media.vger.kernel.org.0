Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E0F2272664B
	for <lists+linux-media@lfdr.de>; Wed,  7 Jun 2023 18:48:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230289AbjFGQsP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Jun 2023 12:48:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230264AbjFGQsN (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Jun 2023 12:48:13 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E2A81FC0
        for <linux-media@vger.kernel.org>; Wed,  7 Jun 2023 09:47:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686156443;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=g1JCY/mwpJSEb+pkmBVOoDfykxJKhCaYy7YMUa9ETvM=;
        b=HNYHo0pSDuwJNXPhCTv3R2187lWcVzkuiHLrHqJMr/VCkbgL3jeKpBUMLETe8TO6m6p0yp
        D/deqiQOmhwZMF5xPgJrKAOV3z/OCotUthzMun0Z+71T5m0omJlwkceQRVCAf5iI99dApQ
        l60E04oE9XwWln1FdUb11GRBQLga1y0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-205-6w_jQ-9NOrC2s9tXb67MkA-1; Wed, 07 Jun 2023 12:47:20 -0400
X-MC-Unique: 6w_jQ-9NOrC2s9tXb67MkA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E87B838149A1;
        Wed,  7 Jun 2023 16:47:19 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.22])
        by smtp.corp.redhat.com (Postfix) with ESMTP id B9C36C1603B;
        Wed,  7 Jun 2023 16:47:18 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Daniel Scally <dan.scally@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kate Hsuan <hpa@redhat.com>, linux-media@vger.kernel.org
Subject: [PATCH 00/28] media: ov2680: Bugfixes + ACPI + selection(crop-tgt) API support
Date:   Wed,  7 Jun 2023 18:46:44 +0200
Message-Id: <20230607164712.63579-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi All,

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
ov2680 sensor and I plan to work on this soonish.

This series consist of 3 parts:

1. Patches 0-7 are bugfixes these are put first for backporting

2.1 Patch 8 adds the new CCI register helpers, these are being
reviewed here:
https://lore.kernel.org/linux-media/20230606165808.70751-2-hdegoede@redhat.com/

the intend is to merge that patch separately before this series.
This patch is only here so that the series actually compiles.

2.2 Patch 9 converts the ov2680 driver to the new CCI helpers,
the same has been done in the other series with the atomisp-ov2680
driver and this makes it much easier to sync things up

3. Patches 10 - 28 implement the ACPI enumeration,
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
  media: Add MIPI CCI register access helper functions
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
  media: ov2680: Add g_skip_frames op support
  media: ov2680: Drop unnecessary pad checks
  media: ov2680: Read and log sensor revision during probe

 Documentation/driver-api/media/v4l2-cci.rst  |    5 +
 Documentation/driver-api/media/v4l2-core.rst |    1 +
 drivers/media/i2c/Kconfig                    |    2 +
 drivers/media/i2c/ov2680.c                   | 1251 +++++++++---------
 drivers/media/v4l2-core/Kconfig              |    5 +
 drivers/media/v4l2-core/Makefile             |    1 +
 drivers/media/v4l2-core/v4l2-cci.c           |  142 ++
 include/media/v4l2-cci.h                     |  109 ++
 8 files changed, 889 insertions(+), 627 deletions(-)
 create mode 100644 Documentation/driver-api/media/v4l2-cci.rst
 create mode 100644 drivers/media/v4l2-core/v4l2-cci.c
 create mode 100644 include/media/v4l2-cci.h

-- 
2.40.1

