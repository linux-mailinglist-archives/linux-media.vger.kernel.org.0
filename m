Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 35F17733758
	for <lists+linux-media@lfdr.de>; Fri, 16 Jun 2023 19:22:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344957AbjFPRW1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Jun 2023 13:22:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229705AbjFPRWY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Jun 2023 13:22:24 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B9581FF7
        for <linux-media@vger.kernel.org>; Fri, 16 Jun 2023 10:21:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686936097;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=Or7V6fNTKr0tf/TZRfsDhLdrkCX5u0NKugLK/qmwU70=;
        b=Rne9w/UHyutBZam4IN7E7TDLUEgu5u9xL7PY8pLaw4IHY+EXmF2yJRz6z3cFOTOQGmh1et
        ZQjJ13BmirWq8Rz9OKbStn75dV8QWUZFAQ3mG2pqzeX0cBO5AQ+DjQHk0AfC6Pt4L5d4RV
        HhrK98pxbGvGToNoCyIMZ33fSyI53z4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-556--2835Oc2PyC7gIYrDa9M9A-1; Fri, 16 Jun 2023 13:21:34 -0400
X-MC-Unique: -2835Oc2PyC7gIYrDa9M9A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C2E0B802666;
        Fri, 16 Jun 2023 17:21:33 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.38])
        by smtp.corp.redhat.com (Postfix) with ESMTP id C4DE540C95E1;
        Fri, 16 Jun 2023 17:21:32 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Daniel Scally <dan.scally@ideasonboard.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH v2 0/6] platform/x86: int3472: discrete: Various improvements
Date:   Fri, 16 Jun 2023 19:21:26 +0200
Message-ID: <20230616172132.37859-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
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

Here is a v2 of my previous 2 int3472 patch series merged into
1 bigger series.

Changes in v2:
- Use static_assert() to check that GPIO_REGULATOR_SUPPLY_MAP_COUNT
  and ARRAY_SIZE(skl_int3472_regulator_map_supplies) match

and this also collects all the various Tested-by-s + Reviewed-by-s.

Regards,

Hans


Hans de Goede (6):
  platform/x86: int3472: discrete: Drop GPIO remapping support
  platform/x86: int3472: discrete: Remove sensor_config-s
  platform/x86: int3472: discrete: Add support for 1 GPIO regulator
    shared between 2 sensors
  platform/x86: int3472: discrete: Add alternative "AVDD" regulator
    supply name
  platform/x86: int3472: discrete: Use FIELD_GET() on the GPIO _DSM
    return value
  platform/x86: int3472: discrete: Log a warning if the pin-numbers
    don't match

 .../x86/intel/int3472/clk_and_regulator.c     | 72 +++++++++++---
 drivers/platform/x86/intel/int3472/common.h   | 14 +--
 drivers/platform/x86/intel/int3472/discrete.c | 94 ++++---------------
 3 files changed, 79 insertions(+), 101 deletions(-)

-- 
2.41.0

