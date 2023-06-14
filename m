Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8A9AB73082B
	for <lists+linux-media@lfdr.de>; Wed, 14 Jun 2023 21:25:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236878AbjFNTZO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Jun 2023 15:25:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236328AbjFNTYv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Jun 2023 15:24:51 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9972B1FDD
        for <linux-media@vger.kernel.org>; Wed, 14 Jun 2023 12:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686770632;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=a5sDmWhN+ziUyUh0Om0m4AnhRp0U+N5azCSK967PPkA=;
        b=f0EWaXfnkfjDWNhaeW+RvszCsKcNB0mDKDDsbHubc7bIcHDDXD8GDCcMO/4Fi6Gt5X3kab
        /Ah25q5mIPKT1RgTLDjgTTHSYmcNZqSDFFkxOjTz6kuK1J0+OjsRuX18MeI8mVNNE7KkxH
        iSBqIxot2NY3kKxfKb4r9KpXp/Tfwic=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-80-hPKyn8-JPKi2QZc-cKW9AQ-1; Wed, 14 Jun 2023 15:23:51 -0400
X-MC-Unique: hPKyn8-JPKi2QZc-cKW9AQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7AC1D80006E;
        Wed, 14 Jun 2023 19:23:50 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.46])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 7AB62140E951;
        Wed, 14 Jun 2023 19:23:49 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        linux-media@vger.kernel.org
Subject: [PATCH v2 0/5] media: Add MIPI CCI register access helper functions
Date:   Wed, 14 Jun 2023 21:23:38 +0200
Message-Id: <20230614192343.57280-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent, Sakari, et al.,

Here is v2 of my MIPI CCI register access helper patches.

New in the CCI register access helpers in v2:
- Drop cci_reg_type enum
- Make having an encoded reg-width mandatory rather then using 0 to encode
  8 bit width making reg-addresses without an encoded width default to
  a width of 8
- Add support for 64 bit wide registers
- Introduce a new cci_reg_sequence struct with 64 bit reg values for 64 bit
  support and without the delay_us field
- Various kerneldoc updates
- Stop supporting delays in cci_multi_reg_write()
- Some includes cleanups
- Disable regmap locking

Other changes:
- Add a patch to convert the ov5693 driver (tested on Surface Go)
- Add a patch to convert the imx290 driver (untested)

Original (v1) cover-letter:

The CSI2 specification specifies a standard method to access camera sensor
registers called "Camera Control Interface (CCI)".

Currently a lot of Linux camera sensor drivers all have their own custom
helpers for this, often copy and pasted from other drivers.

This adds a set of generic helpers for this so that all sensor drivers can
switch to a single common implementation.

This is based on / the result of our previous discussion on this here:
Link: https://lore.kernel.org/linux-media/59aefa7f-7bf9-6736-6040-39551329cd0a@redhat.com/

Patches 2-4 are examples of how these helpers can be used and patch 5
removes the now no longer necessary ov_16bit_addr_reg_helpers.h which was
the previous attempt to add common CCI access helpers.

Regards,

Hans


Hans de Goede (5):
  media: Add MIPI CCI register access helper functions
  media: ov5693: Convert to new CCI register access helpers
  media: imx290: Convert to new CCI register access helpers
  media: atomisp: ov2680: Convert to new CCI register access helpers
  media: Remove ov_16bit_addr_reg_helpers.h

 Documentation/driver-api/media/v4l2-cci.rst   |   5 +
 Documentation/driver-api/media/v4l2-core.rst  |   1 +
 drivers/media/i2c/Kconfig                     |   2 +
 drivers/media/i2c/imx290.c                    | 350 +++++------
 drivers/media/i2c/ov5693.c                    | 574 +++++++-----------
 drivers/media/v4l2-core/Kconfig               |   5 +
 drivers/media/v4l2-core/Makefile              |   1 +
 drivers/media/v4l2-core/v4l2-cci.c            | 157 +++++
 drivers/staging/media/atomisp/i2c/Kconfig     |   1 +
 .../media/atomisp/i2c/atomisp-ov2680.c        | 237 +++-----
 drivers/staging/media/atomisp/i2c/ov2680.h    |  86 +--
 include/media/ov_16bit_addr_reg_helpers.h     |  92 ---
 include/media/v4l2-cci.h                      | 121 ++++
 13 files changed, 763 insertions(+), 869 deletions(-)
 create mode 100644 Documentation/driver-api/media/v4l2-cci.rst
 create mode 100644 drivers/media/v4l2-core/v4l2-cci.c
 delete mode 100644 include/media/ov_16bit_addr_reg_helpers.h
 create mode 100644 include/media/v4l2-cci.h

-- 
2.40.1

