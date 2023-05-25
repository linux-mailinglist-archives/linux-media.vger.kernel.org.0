Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 16336711797
	for <lists+linux-media@lfdr.de>; Thu, 25 May 2023 21:45:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241868AbjEYTpP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 May 2023 15:45:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241125AbjEYTpO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 May 2023 15:45:14 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF4CF10C0
        for <linux-media@vger.kernel.org>; Thu, 25 May 2023 12:44:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1685043774;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=tCzPL0RYm0tChl30d64iQV0JpAHe+gJ8L2yNkZ2qrHs=;
        b=UYs/61DMhqDF0QkLCp4gp2fOKdPwKp0K3qnFBGd4U2lsBRkeeqvTbm54312UgzOZQ3T9mY
        VfdjUCohRjzjtWMuFFlssEHdsq6GWFP0iNFgPsYwc0rCEdlb8lsCOP4tcq9VRLCQQ3Rpba
        Yygq1D3ujuXCEpBBmr69tr8SchClqbs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-637-N0opNcvBPLaAdxrCD7jMzg-1; Thu, 25 May 2023 15:01:05 -0400
X-MC-Unique: N0opNcvBPLaAdxrCD7jMzg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 30BBA802355;
        Thu, 25 May 2023 19:01:03 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.18])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 7750C400E118;
        Thu, 25 May 2023 19:01:01 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>, Kate Hsuan <hpa@redhat.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        Dan Scally <djrscally@gmail.com>, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev
Subject: [PATCH v2 0/5] media: atomisp: Add support for v4l2-async sensor registration
Date:   Thu, 25 May 2023 21:00:55 +0200
Message-Id: <20230525190100.130010-1-hdegoede@redhat.com>
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

Here is a new version of my v4l2-async sensor registration support
for atomisp. I have merged all the prep / cleanup patches which Andy
already gave his Reviewed-by for in my media-atomisp branch:

https://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux.git/log/?h=media-atomisp

This v2 series applies on top of that branch!

This v2 series is the remainder (and core part) of
my previous 2 related patch-series:

https://lore.kernel.org/linux-media/20230518153733.195306-1-hdegoede@redhat.com/
https://lore.kernel.org/linux-media/20230518153214.194976-1-hdegoede@redhat.com/

The big change in this v2 is making atomisp_csi2_bridge_init() also
add the ACPI GPIO mappings to the sensors it finds / it is adding
fwnode graph endpoints for. Combined with making sensor drivers
check there is a fwnode graph endpoint (and return -EPROBE_DEFER if not)
before trying to get GPIOs so that the mappings are in place before
getting the GPIOs.

Thank you Sakari for suggesting this nice solution.

Patch 1    Adds the v4l2-async sensor registration support
Patch 2-3  Convert the ov2680 and gc0310 drivers to this
Patch 4    Removes some now dead code
Patch 5    Moves the now fully standard / no custom atomisp API
           gc0310 sensor driver to drivers/media/i2c

Patches 1-4 only touch atomisp code and build on top of previous
work so I plan to merge these through my media-atomisp branch.

Patch 5 also depends on all the others, so it should also
get merged through my media-atomisp branch. Sakari may I have
your Ack for this ?  Alternatively we could delay the move to
the next kernel cycle and then it could be merged directly
into some other linux-media branch. Either way works for me.

Regards,

Hans


Hans de Goede (5):
  media: atomisp: Add support for v4l2-async sensor registration
  media: atomisp: ov2680: Turn into standard v4l2 sensor driver
  media: atomisp: gc0310: Turn into standard v4l2 sensor driver
  media: atomisp: Drop v4l2_get_acpi_sensor_info() function
  media: Move gc0310 sensor drivers to drivers/media/i2c/

 drivers/media/i2c/Kconfig                     |  10 +
 drivers/media/i2c/Makefile                    |   1 +
 .../atomisp-gc0310.c => media/i2c/gc0310.c}   |  29 +-
 drivers/staging/media/atomisp/Makefile        |   1 +
 drivers/staging/media/atomisp/i2c/Kconfig     |   8 -
 drivers/staging/media/atomisp/i2c/Makefile    |   1 -
 .../media/atomisp/i2c/atomisp-ov2680.c        |  38 +-
 drivers/staging/media/atomisp/i2c/ov2680.h    |   3 +-
 .../staging/media/atomisp/pci/atomisp_csi2.c  |   4 +
 .../staging/media/atomisp/pci/atomisp_csi2.h  |  88 +-
 .../media/atomisp/pci/atomisp_csi2_bridge.c   | 805 ++++++++++++++++++
 .../media/atomisp/pci/atomisp_gmin_platform.c | 240 ------
 .../media/atomisp/pci/atomisp_internal.h      |   2 +
 .../staging/media/atomisp/pci/atomisp_v4l2.c  |  38 +-
 .../staging/media/atomisp/pci/atomisp_v4l2.h  |   1 +
 15 files changed, 962 insertions(+), 307 deletions(-)
 rename drivers/{staging/media/atomisp/i2c/atomisp-gc0310.c => media/i2c/gc0310.c} (96%)
 create mode 100644 drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c

-- 
2.40.1

