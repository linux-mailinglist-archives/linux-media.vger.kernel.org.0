Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E7557638000
	for <lists+linux-media@lfdr.de>; Thu, 24 Nov 2022 21:01:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229536AbiKXUBP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Nov 2022 15:01:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229507AbiKXUBP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Nov 2022 15:01:15 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A7492197
        for <linux-media@vger.kernel.org>; Thu, 24 Nov 2022 12:00:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1669320014;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=+7VjSpm55Uc6sFsUphFIMlvG+vQLARNqOyyl0AiFriE=;
        b=Whkpx0s21SRdz8F01EH3G1CkkjBzNLmDwKIoop65Lac+NqPEP5SZyrk4A/19uuShpsa1Mn
        mnHFiX5zfj9GV1qKiZinTxRi4XV3E+IGxZMoyAN6Yn90rzPAlPIC7I01pfjrseHPuGuXI3
        6lXcyYkQe9Mz2Y0vaEX4xX38ZKqFNkI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-615-FQ_ZYcUJNj6VEAVKbHnd3Q-1; Thu, 24 Nov 2022 15:00:12 -0500
X-MC-Unique: FQ_ZYcUJNj6VEAVKbHnd3Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 77040801585;
        Thu, 24 Nov 2022 20:00:12 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.195.152])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 8ACF01415114;
        Thu, 24 Nov 2022 20:00:10 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Daniel Scally <djrscally@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kate Hsuan <hpa@redhat.com>, linux-media@vger.kernel.org
Subject: [PATCH 0/3] platform/x86: int3472/discrete: Make it work with IPU6
Date:   Thu, 24 Nov 2022 21:00:04 +0100
Message-Id: <20221124200007.390901-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
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

Here is a small set of patches to make the int3472/discrete code
work with the sensor drivers bundled with the (unfortunately out of tree)
IPU6 driver.

There are parts of the out of tree IPU6 code, like the sensor drivers,
which can be moved to the mainline and I do plan to work on this at some
point and then some of this might need to change. But for now the goal is
to make the out of tree driver work with standard mainline distro kernels
through e.g. dkms. Otherwise users need to run a patched kernel just for
a couple of small differences.

This is basically a rewrite of this patch:
https://github.com/intel/ipu6-drivers/blob/master/patch/int3472-support-independent-clock-and-LED-gpios-5.17%2B.patch

Wich users who want to use the IPU6 driver so far have had to manually
apply to their kernels which is quite inconvenient.

This rewrite makes 2 significant changes:

1. Don't break things on IPU3 platforms

2. Instead of extending the int3472_sensor_configs[] quirks table for each
model which needs "clken" and "pled" GPIOs, do this based on matching
the ACPI HID of the ACPI device describing the sensor.

The need for these GPIOs is a property of the specific sensor driver which
binds using this same HID, so by using this we avoid having to extend the
int3472_sensor_configs[] quirks table all the time.

This allows roling back the behavior to at least use a clk-framework
clk instead of clken GPIO on a per sensor(-driver) basis as we mainline
the sensor drivers, assuming that the drivers are switched over to the
clk framework as part of their mainlining.

A bigger question is what to do with the privacy-led GPIO on IPU3
we so far have turned the LED on/off at the same as te clock,
but at least on some IPU6 models this won't work, because they only
have a privacy-led GPIO and no clk_en GPIO (there is no sensor
clk-control at all on some models).

I think we should maybe move all models, including IPU3 based
models over to using a normal GPIO for controlling the privacy-led
to make things consistent.

And likewise (eventually) completely drop the "clken" GPIO this
patch series introduces (with some sensors) and instead always model
this through the clk-framework.

Regards,

Hans


Hans de Goede (3):
  platform/x86: int3472/discrete: Refactor GPIO to sensor mapping
  platform/x86: int3472/discrete: Get the polarity from the _DSM entry
  platform/x86: int3472/discrete: Add support for sensor-drivers which
    expect clken + pled GPIOs

 drivers/platform/x86/intel/int3472/common.h   |  2 +-
 drivers/platform/x86/intel/int3472/discrete.c | 92 ++++++++++++++++---
 2 files changed, 78 insertions(+), 16 deletions(-)

-- 
2.38.1

