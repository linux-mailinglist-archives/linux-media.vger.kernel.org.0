Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BEEF672A4D6
	for <lists+linux-media@lfdr.de>; Fri,  9 Jun 2023 22:43:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232338AbjFIUnU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Jun 2023 16:43:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229471AbjFIUnT (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Jun 2023 16:43:19 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F123C30ED
        for <linux-media@vger.kernel.org>; Fri,  9 Jun 2023 13:42:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686343354;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=i8u5YBtgug7p9/d4nlwZdckLX/Cv1cwVjAeKYPeg0YE=;
        b=OpxdvFFhF/HYa5YT3wVrurujSWIvy+z+VE81/NlNli/o+DbQDsnNp3bGLIE1h2G20bQGKL
        9c/NuDAvL948QvnYX5i00W+ZVxWmnbiow1d1WvREFGVF942YlEH9YpzFeHT9+NAOZ1VbnW
        aBLHbzf4skleNPYe6RDmrtHT0KvgFrc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-209-99Kg8QYpM8a6O7fJ6zqO9g-1; Fri, 09 Jun 2023 16:42:30 -0400
X-MC-Unique: 99Kg8QYpM8a6O7fJ6zqO9g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6AA918007D9;
        Fri,  9 Jun 2023 20:42:30 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.16])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 366C840CFD00;
        Fri,  9 Jun 2023 20:42:29 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Dan Scally <dan.scally@ideasonboard.com>,
        Hao Yao <hao.yao@intel.com>, Bingbu Cao <bingbu.cao@intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        platform-driver-x86@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH 0/4] platform/x86: int3472: discrete: Regulator rework / Lenovo Miix 510 support
Date:   Fri,  9 Jun 2023 22:42:24 +0200
Message-Id: <20230609204228.74967-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dan, Hao Yao and Bingbu Cao,

Patches 1/2 drop the sensor-config stuff since I thought we should be
able to make things work without any board specific fixups.

This is the result of my working on getting IPU6 to work on Jasper Lake
for $dayjob and then tonight I switched to trying to get the ov2680
on the Lenovo Miix 510 to work and it turns out that does require some
board specific workarounds after all :|

With this series together with my recent ov2680 sensor driver series:
https://lore.kernel.org/linux-media/20230607164712.63579-1-hdegoede@redhat.com/
I can get the ov2680 driver to load and successfully read the id register:

[   11.365319] ipu3-cio2 0000:00:14.3: Found supported sensor OVTI2680:00
[   11.431595] ov2680 i2c-OVTI2680:00: supply DOVDD not found, using dummy regulator
[   11.433125] ov2680 i2c-OVTI2680:00: supply DVDD not found, using dummy regulator
[   11.454698] ov2680 i2c-OVTI2680:00: sensor_revision id = 0x2680, rev= 0

Dan, currently the DMI match used only matches the 12IKB version of
the Miix 510 I think you have a 12ISK version. Can you verify this
works there too?  I guess we can just drop the KB part of the DMI
match if this works on the 12ISK version too.

Hao Yao and Bingbu Cao I think that the way the issue with how different
drivers may expect different regulator supply-ids is of interest to you
too. Note I see that the mainline version of ov13b10.c does not have
regulator support at all yet. So when adding this please just use
one of the existing set of supply-names + the bulk API like how
the ov5693.c driver is doing. In this case no int3472 driver changes
will be necessary at all.

Regards,

Hans


Hans de Goede (4):
  platform/x86: int3472: discrete: Drop GPIO remapping support
  platform/x86: int3472: discrete: Remove sensor_config-s
  platform/x86: int3472: discrete: Add support for 1 GPIO regulator
    shared between 2 sensors
  platform/x86: int3472: discrete: Add alternative "AVDD" regulator
    supply name

 .../x86/intel/int3472/clk_and_regulator.c     | 72 ++++++++++++++----
 drivers/platform/x86/intel/int3472/common.h   | 14 +---
 drivers/platform/x86/intel/int3472/discrete.c | 76 ++-----------------
 3 files changed, 66 insertions(+), 96 deletions(-)

-- 
2.40.1

