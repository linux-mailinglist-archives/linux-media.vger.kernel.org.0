Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0DFE5677BD2
	for <lists+linux-media@lfdr.de>; Mon, 23 Jan 2023 13:54:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231947AbjAWMy1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Jan 2023 07:54:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231918AbjAWMy1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Jan 2023 07:54:27 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A365A1A97F
        for <linux-media@vger.kernel.org>; Mon, 23 Jan 2023 04:53:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1674478406;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=R/n66CB+sraVPazrTcw0RltVtZsz+M9W8D1/QGOpUzE=;
        b=GXZdoSS9WJUGze3PvKEFYTV7O0fnYqn3zqHMtMo5u9igVeY7HpxZ3ylzPtRL8FSN/Mj24T
        A5osRcLvh2UTK2a55nO8TZR/TxHBiSp7iyRqIsHCsZ0pB5pBF1hhilYBiRj/1hYwGqRdia
        ZpwWZxFT1qcWlQEbyf+QSZ62Vp2yOq4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-648-lgyzWkOaO5CiHodmVAqvdg-1; Mon, 23 Jan 2023 07:53:23 -0500
X-MC-Unique: lgyzWkOaO5CiHodmVAqvdg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 265841C07545;
        Mon, 23 Jan 2023 12:53:23 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.194.13])
        by smtp.corp.redhat.com (Postfix) with ESMTP id E9511C15BA0;
        Mon, 23 Jan 2023 12:53:19 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Andy Shevchenko <andy@kernel.org>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH 26/57] media: atomisp: Put sensor ACPI devices in D3 before disable ACPI power-resources
Date:   Mon, 23 Jan 2023 13:51:34 +0100
Message-Id: <20230123125205.622152-27-hdegoede@redhat.com>
In-Reply-To: <20230123125205.622152-1-hdegoede@redhat.com>
References: <20230123125205.622152-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The device core will call ACPI to turn the device (i2c_client) for a sensor
on / put it in D0 before calling its probe() method.

This takes a reference on all of the ACPI power-resources belonging to
the device. Since the atomisp_gmin_platform code disables ACPI
power-resource management and does its own pm, this reference never gets
released.

This is a problem for ACPI power-resources which are shared with other
devices since those now never get turned off again (nor back on again).

Explicitly put the device in D3 before disabling the ACPI power-resource
management.

Note that atomisp_register_i2c_module() runs near the end of the sensor
driver's probe() function, after the driver is done with probing the hw.
So the power-resouces (the same resources as directly controlled by
the atomisp platform code) getting turned off (a second time, as they are
already off) is not a problem.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
index 1e943c423893..2b9d68141520 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
@@ -159,6 +159,14 @@ int atomisp_register_i2c_module(struct v4l2_subdev *subdev,
 	 * tickled during suspend/resume.  This has caused power and
 	 * performance issues on multiple devices.
 	 */
+
+	/*
+	 * Turn off the device before disabling ACPI power resources
+	 * (the sensor driver has already probed it at this point).
+	 * This avoids leaking the reference count of the (possibly shared)
+	 * ACPI power resources which were enabled/referenced before probe().
+	 */
+	acpi_device_set_power(adev, ACPI_STATE_D3_COLD);
 	adev->power.flags.power_resources = 0;
 
 	for (i = 0; i < MAX_SUBDEVS; i++)
-- 
2.39.0

