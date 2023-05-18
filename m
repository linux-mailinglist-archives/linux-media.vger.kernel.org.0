Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2B0C77084E9
	for <lists+linux-media@lfdr.de>; Thu, 18 May 2023 17:33:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230267AbjERPdK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 May 2023 11:33:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229799AbjERPdI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 May 2023 11:33:08 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F365D119
        for <linux-media@vger.kernel.org>; Thu, 18 May 2023 08:32:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1684423943;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=Rmf7Du2c4lf55nhZJtjpBjeaS0W1w1NfHPko44+zUR0=;
        b=IoBKnH5s1OVo+S/E/h7jhAnVxwY5oFbN89I8Mz+V6rbJyy3H3BcIp0YQ1myTrj4KaKTO35
        1Qq1Tll2L4G3u+ID5s7zz0qZ1N73Hq21musN7aXQ3h5SMltzR2DR3D9J/9xLTwihO9vAmN
        +Y+2kDtaukgeb5/0+fZZE+B4AKbZL9Q=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-385-kUIoUse9Na6_CBIHXyKM1w-1; Thu, 18 May 2023 11:32:17 -0400
X-MC-Unique: kUIoUse9Na6_CBIHXyKM1w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AB82E1C05EC1;
        Thu, 18 May 2023 15:32:16 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.133])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 18C354078908;
        Thu, 18 May 2023 15:32:14 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>, Kate Hsuan <hpa@redhat.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH 0/9] media: v4l: Add v4l2_acpi_parse_sensor_gpios() helper + gc0310 sensor driver
Date:   Thu, 18 May 2023 17:32:05 +0200
Message-Id: <20230518153214.194976-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
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

Now that the atomisp driver supports v4l2-async sensor driver registration
(I'll post this as a separate series), there is no longer a need to have
atomisp specific sensor drivers and after cleanup atomisp sensor drivers
can now be moved to drivers/media/i2c as regular v4l2 sensor drivers!

There is one small bit of ugliness involved though. On atomisp hw
the sensor drivers need to do some work to get GPIO mappings from ACPI,
requiring 1 line per sensor driver to call an ACPI specific sensor driver
helper. The commit msg of patch 1/9 explains why:

"""
On x86/ACPI platforms the GPIO resources do not provide information
about which GPIO resource maps to which connection-id. So e.g.
gpiod_get(devg, "reset") does not work.

On devices with an Intel IPU3 or newer ISP there is a special ACPI
INT3472 device describing the GPIOs and instantiating of the i2c_client
for a sensor is deferred until the INT3472 driver has been bound based
on the sensor ACPI device having a _DEP on the INT3472 ACPI device.

This allows the INT3472 driver to add the necessary GPIO lookups
without needing any special ACPI handling in the sensor driver.

Unfortunately this does not work on devices with an atomisp2 ISP,
there the _DSM describing the GPIOs is part of the sensor ACPI device
itself, rather then being part of a separate ACPI device.

IOW there is no separate firmware-node to which we can bind to register
the GPIO lookups (and also no way to defer creating the sensor i2c_client).

This unfortunately means that all sensor drivers which may be used on
BYT or CHT hw need some code to deal with ACPI integration.

This patch adds a new v4l2_acpi_parse_sensor_gpios() helper function
for this, which does all the necessary work. This minimizes the
(unavoidable) change to sensor drivers for ACPI integration to just
adding a single line calling this void function to probe().

There also is a no-op stub provided for non ACPI platforms so that
no #ifdef-s are necessary in the driver.
"""

This series adds the v4l2_acpi_parse_sensor_gpios() helper and
then after some small cleanups moves the atomisp-gc0310 sensor
driver (which now is a generic v4l2 sensor driver) to
drivers/media/i2c.

Since this touches drivers/media the intention is for this
series to go upstream through the normal drivers/media process
rather then through my media-atomisp branch.

Note to v4l2-core maintainers: if you are ok with this series
and would prefer for me to send it upstream through my
media-atomisp branch, then I can do that too.

Regards,

Hans


Hans de Goede (9):
  media: v4l: Add v4l2_acpi_parse_sensor_gpios() helper function
  media: atomisp: Switch to v4l2_acpi_parse_sensor_gpios()
  media: atomisp: gc0310: Turn into standard v4l2 sensor driver
  media: atomisp: gc0310: Drop XXGC0310 ACPI hardware-id
  media: atomisp: gc0310: Fix double free in gc0310_remove()
  media: atomisp: gc0310: Cleanup includes
  media: atomisp: gc0310: Remove gc0310_s_config() function
  media: atomisp: gc0310: Remove gc0310.h
  media: Move gc0310 sensor drivers to drivers/media/i2c/

 Documentation/driver-api/media/v4l2-acpi.rst  |   5 +
 Documentation/driver-api/media/v4l2-core.rst  |   1 +
 drivers/media/i2c/Kconfig                     |  10 +
 drivers/media/i2c/Makefile                    |   1 +
 .../atomisp-gc0310.c => media/i2c/gc0310.c}   | 296 ++++++++++++++---
 drivers/media/v4l2-core/Makefile              |   1 +
 drivers/media/v4l2-core/v4l2-acpi.c           | 227 +++++++++++++
 drivers/staging/media/atomisp/i2c/Kconfig     |   8 -
 drivers/staging/media/atomisp/i2c/Makefile    |   1 -
 .../media/atomisp/i2c/atomisp-ov2680.c        |   5 +-
 drivers/staging/media/atomisp/i2c/gc0310.h    | 309 ------------------
 .../media/atomisp/pci/atomisp_gmin_platform.c | 240 --------------
 include/media/v4l2-acpi.h                     |  37 +++
 13 files changed, 540 insertions(+), 601 deletions(-)
 create mode 100644 Documentation/driver-api/media/v4l2-acpi.rst
 rename drivers/{staging/media/atomisp/i2c/atomisp-gc0310.c => media/i2c/gc0310.c} (64%)
 create mode 100644 drivers/media/v4l2-core/v4l2-acpi.c
 delete mode 100644 drivers/staging/media/atomisp/i2c/gc0310.h
 create mode 100644 include/media/v4l2-acpi.h

-- 
2.40.1

