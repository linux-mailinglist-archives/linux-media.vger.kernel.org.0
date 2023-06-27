Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EC1BF7402BD
	for <lists+linux-media@lfdr.de>; Tue, 27 Jun 2023 19:58:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231555AbjF0R55 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Jun 2023 13:57:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231890AbjF0R5p (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Jun 2023 13:57:45 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66A412D59
        for <linux-media@vger.kernel.org>; Tue, 27 Jun 2023 10:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1687888612;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=fQXCr8AYuGTJgufWH9PIwJSfI0EOgxMbJ383PgbiS9Y=;
        b=U4QL1Il6ih0nBoBBOQja+LGye42AUYAQdGgz6B4XJXxjlhaipA4I9jqLPVTgczrxGTwtRm
        b6is9kA4in7ZjGbDfOaW3iHwCNgaDxTP5dt2CwShqmAdvWmZbKeH5bIfv6V/+oOf3cD9RR
        nL5VLEoDBgOaOA3bWS/sHaQ6jCQi83Q=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-541-WI_MuUZLMeKEf8F09I_2cg-1; Tue, 27 Jun 2023 13:56:45 -0400
X-MC-Unique: WI_MuUZLMeKEf8F09I_2cg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 38DEE1C08962;
        Tue, 27 Jun 2023 17:56:45 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.194.24])
        by smtp.corp.redhat.com (Postfix) with ESMTP id C0955200B677;
        Tue, 27 Jun 2023 17:56:43 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        Hao Yao <hao.yao@intel.com>, Bingbu Cao <bingbu.cao@intel.com>,
        linux-media@vger.kernel.org
Subject: [PATCH 00/12] media: intel-cio2-bridge: Add shared intel-cio2-bridge code, rework VCM instantiation
Date:   Tue, 27 Jun 2023 19:56:30 +0200
Message-ID: <20230627175643.114778-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
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

While working on adding (proper) VCM support to the atomisp code
I found myself copying yet more code from
drivers/media/pci/intel/ipu3/cio2-bridge.c into the atomisp code.

So I decided that it really was time to factor out the common code
(most of the code) from intel/ipu3/cio2-bridge.c into its own
helper library and then share it between the atomisp and IPU3 code.

This will hopefully also be useful for the ongoing work to upstream
IPU6 input system support which also needs this functionality and
currently contains a 3th copy of this code in the out of tree driver.

This set consists of the following parts:

Patch 1     A bugfix for a recent change to the cio2-bridge code
Patches 2-8 Cleanup / preparation patches
Patch 9     Move the main body of the cio2-bridge.c code into
            a new shared intel-cio2-bridge module
Patch 10    Drop cio2-bridge code copy from atomisp, switching to
            the shared intel-cio2-bridge module
Patch 11    Rework how VCM client instantiation is done so that
            a device-link can be added from VCM to sensor to
            fix issues with the VCM power-state being tied to
            the sensor power state
Patch 12    Example patch to show how patch 11 avoids the need
            for hacks in VCM drivers caused by the shared power state
            (not intended for merging)

Regards,

Hans


Hans de Goede (12):
  media: ipu3-cio2: Do not use on stack memory for software_node.name
    field
  media: ipu3-cio2: Move initialization of node_names.vcm to
    cio2_bridge_init_swnode_names()
  media: ipu3-cio2: Make cio2_bridge_init() take a regular struct device
    as argument
  media: ipu3-cio2: Store dev pointer in struct cio2_bridge
  media: ipu3-cio2: Only keep PLD around while parsing
  media: ipu3-cio2: Add a cio2_bridge_parse_sensor_fwnode() helper
    function
  media: ipu3-cio2: Add a parse_sensor_fwnode callback to
    cio2_bridge_init()
  media: ipu3-cio2: Add supported_sensors parameter to
    cio2_bridge_init()
  media: ipu3-cio2: Move cio2_bridge_init() code into a new shared
    intel-cio2-bridge.ko
  media: atomisp: csi2-bridge: Switch to new common cio2_bridge_init()
  media: intel-cio2-bridge: Add a runtime-pm device-link between VCM and
    sensor
  [RFC] media: dw9719: Drop hack to enable "vsio" regulator

 MAINTAINERS                                   |   9 +
 drivers/media/common/Kconfig                  |   4 +
 drivers/media/common/Makefile                 |   1 +
 drivers/media/common/intel-cio2-bridge.c      | 464 ++++++++++++++++++
 drivers/media/i2c/dw9719.c                    |  27 +-
 drivers/media/pci/intel/ipu3/Kconfig          |   1 +
 drivers/media/pci/intel/ipu3/cio2-bridge.c    | 464 +++---------------
 drivers/media/pci/intel/ipu3/cio2-bridge.h    | 146 ------
 drivers/media/pci/intel/ipu3/ipu3-cio2-main.c |   7 +-
 drivers/media/pci/intel/ipu3/ipu3-cio2.h      |   7 +-
 drivers/staging/media/atomisp/Kconfig         |   2 +
 .../staging/media/atomisp/pci/atomisp_csi2.h  |  67 ---
 .../media/atomisp/pci/atomisp_csi2_bridge.c   | 307 ++----------
 include/media/intel-cio2-bridge.h             | 105 ++++
 14 files changed, 723 insertions(+), 888 deletions(-)
 create mode 100644 drivers/media/common/intel-cio2-bridge.c
 delete mode 100644 drivers/media/pci/intel/ipu3/cio2-bridge.h
 create mode 100644 include/media/intel-cio2-bridge.h

-- 
2.41.0

