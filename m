Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5197470851E
	for <lists+linux-media@lfdr.de>; Thu, 18 May 2023 17:38:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231298AbjERPi1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 May 2023 11:38:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230036AbjERPiZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 May 2023 11:38:25 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4E63D2
        for <linux-media@vger.kernel.org>; Thu, 18 May 2023 08:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1684424260;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=o45RGhwWcKE3UDH1wYnwhfDfQMq4g3gl8O4X2nbyYl4=;
        b=dBko2wOmY1mczIHs0Ejx7R7sBBAvktKPKXAl3lcbuQJ3+LE/rK/xCCbdhJA/q+d1hHK6E6
        M64odMjaQUnM8hdYPs21rW/NV5jr7898njPsKkvA6JLW5KNS1m8JrwluoGWHXlUIVkyyZt
        nuTUXwlhfgypEQVBv+Vkdhe2ak9s7aM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-520-RCIy7N6hOsanTztEf9hPPw-1; Thu, 18 May 2023 11:37:36 -0400
X-MC-Unique: RCIy7N6hOsanTztEf9hPPw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 016383C0ED40;
        Thu, 18 May 2023 15:37:36 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.133])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 76C3063F5F;
        Thu, 18 May 2023 15:37:34 +0000 (UTC)
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
Subject: [PATCH 0/9] media: atomisp: Add support for v4l2-async sensor registration
Date:   Thu, 18 May 2023 17:37:24 +0200
Message-Id: <20230518153733.195306-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi All,

I'm quite happy to present this patch series which makes it possible
to use v4l2-async sensor registration together with the atomisp code :)

This has been tested with both the gc0310 and the ov2680 sensor drivers.

For now it also is still possible to use the old atomisp_gmin_platform
based sensor drivers. This is mainly intended for testing while moving
other sensor drivers over to runtime-pm + v4l2-async.

Regards,

Hans


Hans de Goede (9):
  media: atomisp: Drop MRFLD_PORT_NUM define
  media: atomisp: Remove unused fields from struct atomisp_input_subdev
  media: atomisp: Remove atomisp_video_init() parametrization
  media: atomisp: Rename __get_mipi_port() to
    atomisp_port_to_mipi_port()
  media: atomisp: Store number of sensor lanes per port in struct
    atomisp_device
  media: atomisp: Delay mapping sensors to inputs till
    atomisp_register_device_nodes()
  media: atomisp: Move pad linking to atomisp_register_device_nodes()
  media: atomisp: Allow camera_mipi_info to be NULL
  media: atomisp: Add support for v4l2-async sensor registration

 drivers/staging/media/atomisp/Makefile        |   1 +
 .../atomisp/include/linux/atomisp_platform.h  |   1 +
 .../staging/media/atomisp/pci/atomisp-regs.h  |   1 -
 .../staging/media/atomisp/pci/atomisp_cmd.c   |  41 +-
 .../staging/media/atomisp/pci/atomisp_cmd.h   |   4 +-
 .../staging/media/atomisp/pci/atomisp_csi2.c  |  10 +-
 .../staging/media/atomisp/pci/atomisp_csi2.h  |  64 ++
 .../media/atomisp/pci/atomisp_csi2_bridge.c   | 592 ++++++++++++++++++
 .../staging/media/atomisp/pci/atomisp_fops.c  |   2 +-
 .../media/atomisp/pci/atomisp_gmin_platform.c |   2 +
 .../media/atomisp/pci/atomisp_internal.h      |  11 +-
 .../staging/media/atomisp/pci/atomisp_ioctl.c |   2 +-
 .../media/atomisp/pci/atomisp_subdev.c        |  37 +-
 .../media/atomisp/pci/atomisp_subdev.h        |   3 -
 .../staging/media/atomisp/pci/atomisp_v4l2.c  | 220 +++----
 .../staging/media/atomisp/pci/atomisp_v4l2.h  |   4 +-
 16 files changed, 793 insertions(+), 202 deletions(-)
 create mode 100644 drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c

-- 
2.40.1

