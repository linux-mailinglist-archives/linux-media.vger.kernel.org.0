Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E9C6673FC2B
	for <lists+linux-media@lfdr.de>; Tue, 27 Jun 2023 14:52:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229841AbjF0MwE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Jun 2023 08:52:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229732AbjF0MwD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Jun 2023 08:52:03 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF751270F
        for <linux-media@vger.kernel.org>; Tue, 27 Jun 2023 05:51:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1687870279;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=9uZxaUb730DTDmJwjyMxnaggbZWBqZdDwLV5FHNCafA=;
        b=Yr5KadwKAolB3hWM2DY3xe2RNNRuZN8wi78diiSXLyL+Ei7sx+dFVj6oaJlwckjctgEpaX
        C8OZa4iugq7ZrVxfQib22KBLYWmU+yQWyHxw8IQQvp8DbGZnRxVEA89gKpJNcWzXS9Iytv
        e220LMwmN07S6iTEBcboAcAOzlk7+3I=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-145-RfE_0BX1NR6APEYndXybiw-1; Tue, 27 Jun 2023 08:51:13 -0400
X-MC-Unique: RfE_0BX1NR6APEYndXybiw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 38D551C28CFC;
        Tue, 27 Jun 2023 12:51:11 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.194.24])
        by smtp.corp.redhat.com (Postfix) with ESMTP id C020B1400C35;
        Tue, 27 Jun 2023 12:51:09 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Daniel Scally <dan.scally@ideasonboard.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        Tommaso Merciai <tomm.merciai@gmail.com>,
        linux-media@vger.kernel.org
Subject: [PATCH v4 0/5] media: Add MIPI CCI register access helper functions
Date:   Tue, 27 Jun 2023 14:51:03 +0200
Message-ID: <20230627125109.52354-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent, Sakari, et al.,

Here is v4 of my MIPI CCI register access helper patches.

New in the CCI register access helpers in v4:
- Add V4L2_CCI_I2C Kconfig and wrap devm_cci_regmap_init_i2c()
  with if IS_ENABLED(CONFIG_V4L2_CCI_I2C)

New in the CCI register access helpers in v3:
- Use unsigned int instead of int in a couple of places
- Run + fix checkpatch.pl --strict --max-line-length=80
- Rename cci_regmap_init_i2c() to devm_cci_regmap_init_i2c()
- Some small kerneldoc text tweaks

Other changes in v3:
- Some small tweaks to some of the driver conversions,
  see individual patch changelogs

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

Other changes in v2:
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
 drivers/media/i2c/imx290.c                    | 360 +++++------
 drivers/media/i2c/ov5693.c                    | 585 +++++++-----------
 drivers/media/v4l2-core/Kconfig               |   9 +
 drivers/media/v4l2-core/Makefile              |   1 +
 drivers/media/v4l2-core/v4l2-cci.c            | 166 +++++
 drivers/staging/media/atomisp/i2c/Kconfig     |   1 +
 .../media/atomisp/i2c/atomisp-ov2680.c        | 251 ++++----
 drivers/staging/media/atomisp/i2c/ov2680.h    |  86 +--
 include/media/ov_16bit_addr_reg_helpers.h     |  92 ---
 include/media/v4l2-cci.h                      | 125 ++++
 13 files changed, 807 insertions(+), 877 deletions(-)
 create mode 100644 Documentation/driver-api/media/v4l2-cci.rst
 create mode 100644 drivers/media/v4l2-core/v4l2-cci.c
 delete mode 100644 include/media/ov_16bit_addr_reg_helpers.h
 create mode 100644 include/media/v4l2-cci.h

-- 
2.41.0

