Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EC4926D31B3
	for <lists+linux-media@lfdr.de>; Sat,  1 Apr 2023 17:00:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229727AbjDAPAk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 1 Apr 2023 11:00:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229612AbjDAPAi (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 1 Apr 2023 11:00:38 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B16AD1DFA9
        for <linux-media@vger.kernel.org>; Sat,  1 Apr 2023 07:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1680361178;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=1Ry0h+0UTXTZ7NO6xAoyBKtgAokt3F/e5gFXt5HXz4s=;
        b=ciOzEWacAs0ZmZ4C2o3EpgRnvxPYKaevkTxa5bZwKsJSoLr51T6rm4sSt30P4iKIt4n7b5
        HXenbNJX3u5RtHf4zOV0StkxsCB4ixra92Jy0tyCWExg2uwpPBijWqv+twV9JKWLxta51O
        ML+8SekDow6gcH6biQhquxQ1G9Gb8Y0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-237-XgH-1GeaOUOZJuptknGLaQ-1; Sat, 01 Apr 2023 10:59:37 -0400
X-MC-Unique: XgH-1GeaOUOZJuptknGLaQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 90C7A3815F61;
        Sat,  1 Apr 2023 14:59:36 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.49])
        by smtp.corp.redhat.com (Postfix) with ESMTP id EB745400F59;
        Sat,  1 Apr 2023 14:59:34 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, Kate Hsuan <hpa@redhat.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Andy Shevchenko <andy@kernel.org>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH 00/28] media: atomisp: Further sensor rework + exotic features removal
Date:   Sat,  1 Apr 2023 16:58:58 +0200
Message-Id: <20230401145926.596216-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi All,

Here is another set of atomisp patches from yours truely.

This basically consists of 2 parts:

1.  Further sensor driver modernization to work towards using standard
    v4l2 sensor drivers instead of atomisp specific copies
1a. For some sensors some GPIOs have different polarity depending on
    which board they are on and the order in which GPIOs are listed in
    in the ACPI resources also is not consistent between boards.
    Fixing this without relying on per board DMI quirks requires parsing
    the results of a special Intel ACPI _DSM. Add a new
    v4l2_get_acpi_sensor_info() helper for this
1b. Convert the gc0310 driver to use ACPI runtime pm instead of relying
    on the direct PMIC poking from atomisp_gmin_platform

2.  Further work on removing various exotic features, specifically
    prep work + remove support for streaming from 2 sensors at once,
    as discussed here:
    https://lore.kernel.org/linux-media/5309d845-063b-6dd9-529d-0f82654290f2@redhat.com/

Regards,

Hans


Hans de Goede (28):
  media: atomisp: Add v4l2_get_acpi_sensor_info() helper
  media: atomisp: ov2680: Use v4l2_get_acpi_sensor_info() for the GPIO
    lookups
  media: atomisp: ov2680: Error handling fixes
  media: atomisp: gc0310: Remove some unused structure definitions
  media: atomisp: gc0310: Remove GC0310_TOK_*
  media: atomisp: gc0310: Simplify gc0310_write_reg_array()
  media: atomisp: gc0310: Remove enum gc0310_tok_type
  media: atomisp: gc0310: Replace custom reg access functions with smbus
    helpers
  media: atomisp: gc0310: Remove non working flip-controls
  media: atomisp: gc0310: Remove read-only exposure control
  media: atomisp: gc0310: Drop custom ATOMISP_IOC_S_EXPOSURE support
  media: atomisp: gc0310: Add exposure and gain controls
  media: atomisp: gc0310: Add error_unlock label to s_stream()
  media: atomisp: gc0310: Modernize and simply set_fmt(), get_fmt(),
    etc.
  media: atomisp: gc0310: Delay power-on till streaming is started
  media: atomisp: gc0310: Add runtime-pm support
  media: atomisp: gc0310: Use devm_kzalloc() for data struct
  media: atomisp: gc0310: Switch over to ACPI powermanagement
  media: atomisp: Remove duplicate atomisp_[start|stop]_streaming
    prototypes
  media: atomisp: Remove continuous mode related code from
    atomisp_set_fmt()
  media: atomisp: Remove custom V4L2_CID_FMT_AUTO control
  media: atomisp: Remove snr_mbus_fmt local var from atomisp_try_fmt()
  media: atomisp: Remove unused ATOM_ISP_MAX_WIDTH_TMP and
    ATOM_ISP_MAX_HEIGHT_TMP
  media: atomisp: Remove atomisp_try_fmt() call from atomisp_set_fmt()
  media: atomisp: Drop support for streaming from 2 sensors at once
  media: atomisp: Remove struct atomisp_sub_device index field
  media: atomisp: gmin_platform: Make DMI quirks take precedence over
    the _DSM table
  media: atomisp: gmin_platform: Add Lenovo Ideapad Miix 310 gmin_vars

 .../media/atomisp/i2c/atomisp-gc0310.c        | 999 ++++--------------
 .../media/atomisp/i2c/atomisp-ov2680.c        |  33 +-
 drivers/staging/media/atomisp/i2c/gc0310.h    | 416 +++-----
 drivers/staging/media/atomisp/i2c/ov2680.h    |   1 -
 .../media/atomisp/include/linux/atomisp.h     |   2 -
 .../atomisp/include/linux/atomisp_platform.h  |   2 +
 .../staging/media/atomisp/pci/atomisp_cmd.c   | 356 ++-----
 .../media/atomisp/pci/atomisp_compat.h        |   4 +-
 .../media/atomisp/pci/atomisp_compat_css20.c  |  89 +-
 .../staging/media/atomisp/pci/atomisp_fops.c  |   9 +-
 .../media/atomisp/pci/atomisp_gmin_platform.c | 289 ++++-
 .../media/atomisp/pci/atomisp_internal.h      |  20 +-
 .../staging/media/atomisp/pci/atomisp_ioctl.c |  64 +-
 .../staging/media/atomisp/pci/atomisp_ioctl.h |   3 -
 .../media/atomisp/pci/atomisp_subdev.c        | 111 +-
 .../media/atomisp/pci/atomisp_subdev.h        |   6 -
 .../staging/media/atomisp/pci/atomisp_v4l2.c  |  36 +-
 17 files changed, 844 insertions(+), 1596 deletions(-)

-- 
2.39.1

