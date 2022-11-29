Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CAC4463CB98
	for <lists+linux-media@lfdr.de>; Wed, 30 Nov 2022 00:13:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236152AbiK2XNC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 29 Nov 2022 18:13:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236198AbiK2XM6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 29 Nov 2022 18:12:58 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC7B71A05E
        for <linux-media@vger.kernel.org>; Tue, 29 Nov 2022 15:12:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1669763523;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=a7TwedOwHv5bA5wRzf5U0hsgOS6LnxDWJQ6E1Bo1APE=;
        b=eF/8ARXMRyp20a5i028fuOoJMX4Xpf56Q4eVnFwSh4VSKfu8xz+xG5xKEIo+51+VZVG1CO
        /HeZTmhunHedciqb7HZnvL3nTs4vGgO0ED7j1PfaK0l5GVt6USlUVPWUt6tit/NZgve1C3
        PWJXu+tLY6bfePkTo0Wpum5G3XHEpSk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-632-LIZXgpQmNQ2LeRynaLZc3w-1; Tue, 29 Nov 2022 18:11:59 -0500
X-MC-Unique: LIZXgpQmNQ2LeRynaLZc3w-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 56219185A792;
        Tue, 29 Nov 2022 23:11:58 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.14])
        by smtp.corp.redhat.com (Postfix) with ESMTP id E9813492CA4;
        Tue, 29 Nov 2022 23:11:56 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Daniel Scally <djrscally@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kate Hsuan <hpa@redhat.com>,
        Mark Pearson <markpearson@lenovo.com>,
        linux-media@vger.kernel.org
Subject: [PATCH 0/6] ov5693/int3472: Privacy LED handling changes + IPU6 compatibility
Date:   Wed, 30 Nov 2022 00:11:43 +0100
Message-Id: <20221129231149.697154-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi All,

The out of tree IPU6 driver has moved to using the in kernel INT3472
code for doing power-ctrl rather then doing their own thing (good!).

Some of the IPU6 devices with a discrete INT3472 ACPI device have a
privacy-led GPIO. but no clk-enable GPIO. To make this work this series
moves the privacy LED control from being integrated with the clk-provider
to modelling the privacy LED as a separate GPIO. This also brings the
discrete INT3472 ACPI device privacy LED handling inline with the privacy
LED handling for INT3472 TPS68470 PMIC devices which I posted here:

https://lore.kernel.org/platform-driver-x86/20221128214408.165726-1-hdegoede@redhat.com/

This obsoletes my previous "[PATCH 0/3] platform/x86: int3472/discrete:
Make it work with IPU6" series:

https://lore.kernel.org/platform-driver-x86/20221124200007.390901-1-hdegoede@redhat.com/

Mauro since laptops with IPU6 cameras are becoming more and more
popular I would like to get this merged for 6.2 so that with 6.2
users will be able to build the out of tree IPU6 driver without
requiring patching their main kernel. I realize we are a bit
late in the cycle, but can you please still take the ov5693 patch
for 6.2 ? It is quite small / straight-forward and since it used
gpiod_get_optional() it is a no-op without the rest of this series.

This series has been tested on:

- Lenovo ThinkPad X1 Yoga gen 7, IPU6, front: ov2740 with privacy LED
- Dell Latitude 9420, IPU 6 with privacy LED on front
- Mirosoft Surface Go, IPU3, front: ov5693 with privacy LED,
                              back: ov8865 with privacy LED

Regards,

Hans


Hans de Goede (6):
  media: ov5693: Add support for a privacy-led GPIO
  platform/x86: int3472/discrete: Refactor GPIO to sensor mapping
  platform/x86: int3472/discrete: Treat privacy LED as regular GPIO
  platform/x86: int3472/discrete: Move GPIO request to
    skl_int3472_register_clock()
  platform/x86: int3472/discrete: Ensure the clk/power enable pins are
    in output mode
  platform/x86: int3472/discrete: Get the polarity from the _DSM entry

 drivers/media/i2c/ov5693.c                    | 10 ++
 .../x86/intel/int3472/clk_and_regulator.c     | 35 +++++--
 drivers/platform/x86/intel/int3472/common.h   |  4 +-
 drivers/platform/x86/intel/int3472/discrete.c | 95 ++++++++-----------
 4 files changed, 80 insertions(+), 64 deletions(-)

-- 
2.38.1

