Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 31199743A51
	for <lists+linux-media@lfdr.de>; Fri, 30 Jun 2023 13:08:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232330AbjF3LIO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Jun 2023 07:08:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232372AbjF3LHx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Jun 2023 07:07:53 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7950E1FCB
        for <linux-media@vger.kernel.org>; Fri, 30 Jun 2023 04:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1688123211;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=Hz56BT7c5dXaoSnbOYv8xxRUU2eae8Bc2EAuUODSjNY=;
        b=NZwYFFbAwCLj8EzpYbV2q+rTW4vsJQ1M3q8vGQGqr4jA8zxo1dzJRtd5SJYN+zyY2CPdZv
        A86r/w2Lr4+uLw1tzwKBbuTiP1L35GwvIN6mRElEuihjA4mQzr4wN+WKwY43yENoexVt1B
        dLb5Jf7yCthwAd130tliuDPyE+RE5eI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-358-yLt83ealNf-OygJaObZQ9A-1; Fri, 30 Jun 2023 07:06:46 -0400
X-MC-Unique: yLt83ealNf-OygJaObZQ9A-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9006E1C0726F;
        Fri, 30 Jun 2023 11:06:45 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.193.184])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 1FBA4492B02;
        Fri, 30 Jun 2023 11:06:43 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        Hao Yao <hao.yao@intel.com>, Bingbu Cao <bingbu.cao@intel.com>,
        linux-media@vger.kernel.org
Subject: [PATCH v2 00/15] media: ipu-bridge: Shared with atomisp, rework VCM instantiation
Date:   Fri, 30 Jun 2023 13:06:28 +0200
Message-ID: <20230630110643.209761-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
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

Here is v2 of my patch-series to make the atomisp code share the
ACPI -> sensor fwnode bridge code with the IPU3 (and IPU6 code).

The last 2 patches also rework VCM instantiation, which was my
initial reason for unifying / sharing the code.

Changes in v2:
- Rebase on top of f54eb0ac7c1a ("media: ipu3-cio2: rename cio2 bridge
  to ipu bridge and move out of ipu3")
  (rebase on top of sailus/media_tree.git/for-6.6-1.4-signed)
- Share the ipu_supported_sensors[] array between atomisp and IPU3/IPU6
  (leave it in ipu-bridge.c instead of giving each consumer its own copy)
- 2 new bugfixes:
  media: ipu-bridge: Fix null pointer deref on SSDB/PLD parsing warnings  
  media: ipu-bridge: Allow building as module

Original cover-letter:

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

Patches 1-4  Bugfixes for recent changes
Patches 5-12 Cleanup / preparation patches
Patch 13     Drop ipu-bridge code copy from atomisp, switching to
             the shared ipu-bridge module
Patch 14     Rework how VCM client instantiation is done so that
             a device-link can be added from VCM to sensor to
             fix issues with the VCM power-state being tied to
             the sensor power state
Patch 15     Example patch to show how patch 11 avoids the need
             for hacks in VCM drivers caused by the shared power state
             (not intended for merging)

Regards,

Hans


Hans de Goede (15):
  media: ipu-bridge: Fix null pointer deref on SSDB/PLD parsing warnings
  media: ipu-bridge: Do not use on stack memory for software_node.name
    field
  media: ipu-bridge: Move initialization of node_names.vcm to
    ipu_bridge_init_swnode_names()
  media: ipu-bridge: Allow building as module
  media: ipu-bridge: Make ipu_bridge_init() take a regular struct device
    as argument
  media: ipu-bridge: Store dev pointer in struct ipu_bridge
  media: ipu-bridge: Only keep PLD around while parsing
  media: ipu-bridge: Add a ipu_bridge_parse_ssdb() helper function
  media: ipu-bridge: Drop early setting of sensor->adev
  media: ipu-bridge: Add a parse_sensor_fwnode callback to
    ipu_bridge_init()
  media: ipu-bridge: Move ipu-bridge.h to include/media/
  media: ipu-bridge: Add GalaxyCore GC0310 to ipu_supported_sensors[]
  media: atomisp: csi2-bridge: Switch to new common ipu_bridge_init()
  media: ipu-bridge: Add a runtime-pm device-link between VCM and sensor
  [RFC] media: dw9719: Drop hack to enable "vsio" regulator

 drivers/media/i2c/dw9719.c                    |  27 +-
 drivers/media/pci/intel/Kconfig               |  19 +-
 drivers/media/pci/intel/ipu-bridge.c          | 334 +++++++++++-------
 drivers/media/pci/intel/ipu3/Kconfig          |  20 ++
 drivers/media/pci/intel/ipu3/ipu3-cio2.c      |  10 +-
 drivers/staging/media/atomisp/Kconfig         |   2 +
 .../staging/media/atomisp/pci/atomisp_csi2.h  |  67 ----
 .../media/atomisp/pci/atomisp_csi2_bridge.c   | 328 +++--------------
 .../staging/media/atomisp/pci/atomisp_v4l2.c  |   1 +
 .../pci/intel => include/media}/ipu-bridge.h  |  26 +-
 10 files changed, 303 insertions(+), 531 deletions(-)
 rename {drivers/media/pci/intel => include/media}/ipu-bridge.h (80%)

-- 
2.41.0

