Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E132A74A042
	for <lists+linux-media@lfdr.de>; Thu,  6 Jul 2023 16:58:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233768AbjGFO66 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Jul 2023 10:58:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233730AbjGFO6v (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Jul 2023 10:58:51 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F219A173F
        for <linux-media@vger.kernel.org>; Thu,  6 Jul 2023 07:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1688655479;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=qfB+L3UTWwHj4FJa02TYHuffrJKL1V5b+b/xQgGIQA8=;
        b=cQ7ksRwg8D5OWYK1qPhl1wE9oq/5IA8Vd69IVsxsjBLLxjK1Vc2zYfNmbvUabu2vSEx554
        IYJpHo9lAW4ZFywuoFgCvI+EjyyGh2/Yb9/TcBzJnbT3pvh+XV/m3PP3jXYmgAt7QTjKzJ
        VOEHy9wwSYGrEtS8shl+kp15gSS0usk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-389-mEIpBAPYPfCdoAOEPlDrGQ-1; Thu, 06 Jul 2023 10:57:54 -0400
X-MC-Unique: mEIpBAPYPfCdoAOEPlDrGQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5C3A82815E48;
        Thu,  6 Jul 2023 14:57:52 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.39])
        by smtp.corp.redhat.com (Postfix) with ESMTP id D917D492C13;
        Thu,  6 Jul 2023 14:57:50 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Daniel Scally <dan.scally@ideasonboard.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Tommaso Merciai <tomm.merciai@gmail.com>,
        linux-media@vger.kernel.org
Subject: [PATCH v4 0/1] media: i2c: Add driver for DW9719 VCM
Date:   Thu,  6 Jul 2023 16:57:44 +0200
Message-ID: <20230706145745.115719-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
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

Here is Dan's patch to add DW9719 support now back to
a standalone patch again for easier reving of the patch
in response to review comments.

Note this now depends on the new CCI helpers:

https://lore.kernel.org/linux-media/20230627125109.52354-1-hdegoede@redhat.com/

Changes in v4:
- Back to a standalone patch again (instead of being part of a series)
- Switch to using CCI helpers for register access
- Use new DEFINE_RUNTIME_DEV_PM_OPS() for pm-ops
- Make v4l2_subdev first member of dw9719_device
- Drop v4l2_ctrl_handler_init() ret value check
- Turn of VCM on dw9719_remove() if necessary

Regards,

Hans


Daniel Scally (1):
  media: i2c: Add driver for DW9719 VCM

 MAINTAINERS                |   7 +
 drivers/media/i2c/Kconfig  |  12 ++
 drivers/media/i2c/Makefile |   1 +
 drivers/media/i2c/dw9719.c | 348 +++++++++++++++++++++++++++++++++++++
 4 files changed, 368 insertions(+)
 create mode 100644 drivers/media/i2c/dw9719.c

-- 
2.41.0

