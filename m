Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E97F17249A5
	for <lists+linux-media@lfdr.de>; Tue,  6 Jun 2023 18:59:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238087AbjFFQ7B (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Jun 2023 12:59:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232912AbjFFQ67 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 6 Jun 2023 12:58:59 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07D1810C2
        for <linux-media@vger.kernel.org>; Tue,  6 Jun 2023 09:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686070693;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=4oLGNH9dlQzxzpa0JgWDwqIldaBkbw3v3EQy3qrKEVc=;
        b=EVir2xy7VkQqtxux3yN/3IamXqPLrxgLmvlMi600IaVZ1crk6nPuvHpgtKnRZ+HjajKf42
        FcWfP4GKWMaxb4zLUu80kQ9KgORDu5KRIcOlQ+Z3G2BTqphV5HwJtN4luua4mSTRMB+XfX
        llspjFOPEalu2zOZJHuB7vizZ7KFf3I=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-468-8jtL9PUnMNKI77CetzFkBA-1; Tue, 06 Jun 2023 12:58:11 -0400
X-MC-Unique: 8jtL9PUnMNKI77CetzFkBA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D741D185A793;
        Tue,  6 Jun 2023 16:58:10 +0000 (UTC)
Received: from x1.nl (unknown [10.39.192.155])
        by smtp.corp.redhat.com (Postfix) with ESMTP id D5CD8492B00;
        Tue,  6 Jun 2023 16:58:09 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, linux-media@vger.kernel.org
Subject: [PATCH 0/3] media: Add MIPI CCI register access helper functions
Date:   Tue,  6 Jun 2023 18:58:05 +0200
Message-Id: <20230606165808.70751-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent, Sakari, et al.,

The CSI2 specification specifies a standard method to access camera sensor
registers called "Camera Control Interface (CCI)".

Currently a lot of Linux camera sensor drivers all have their own custom
helpers for this, often copy and pasted from other drivers.

This adds a set of generic helpers for this so that all sensor drivers can
switch to a single common implementation.

This is based on / the result of our previous discussion on this here:
Link: https://lore.kernel.org/linux-media/59aefa7f-7bf9-6736-6040-39551329cd0a@redhat.com/

Patch 2/3 is an example of how these helpers can be used and 3/3 removes
the now no longer necessary ov_16bit_addr_reg_helpers.h which was
the previous attempt to add common CCI access helpers. As such
patch 2/3 and 3/3 are more of a RFC really. Please focus on reviewing
patch 1/3.

Regards,

Hans


Hans de Goede (3):
  media: Add MIPI CCI register access helper functions
  media: atomisp: ov2680: Convert to new CCI register access helpers
  media: Remove ov_16bit_addr_reg_helpers.h

 Documentation/driver-api/media/v4l2-cci.rst   |   5 +
 Documentation/driver-api/media/v4l2-core.rst  |   1 +
 drivers/media/v4l2-core/Kconfig               |   5 +
 drivers/media/v4l2-core/Makefile              |   1 +
 drivers/media/v4l2-core/v4l2-cci.c            | 142 +++++++++++
 drivers/staging/media/atomisp/i2c/Kconfig     |   1 +
 .../media/atomisp/i2c/atomisp-ov2680.c        | 233 ++++++++----------
 drivers/staging/media/atomisp/i2c/ov2680.h    |  73 +-----
 include/media/ov_16bit_addr_reg_helpers.h     |  92 -------
 include/media/v4l2-cci.h                      | 109 ++++++++
 10 files changed, 367 insertions(+), 295 deletions(-)
 create mode 100644 Documentation/driver-api/media/v4l2-cci.rst
 create mode 100644 drivers/media/v4l2-core/v4l2-cci.c
 delete mode 100644 include/media/ov_16bit_addr_reg_helpers.h
 create mode 100644 include/media/v4l2-cci.h

-- 
2.40.1

