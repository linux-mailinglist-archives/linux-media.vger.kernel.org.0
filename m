Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1EB8D48FF46
	for <lists+linux-media@lfdr.de>; Sun, 16 Jan 2022 22:52:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233803AbiAPVwO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 16 Jan 2022 16:52:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47631 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233769AbiAPVwN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 16 Jan 2022 16:52:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1642369932;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=fu9JUFLFDd7k9Vjdl87gQ/5XK2cF3NHEN2KMj6+7gTY=;
        b=bvJyaE9c3d/sO21Ph8RyGKOGopL+dquO4fsGPdVAknz/9O5LPSd+S8sPqBrrSYLLuvok13
        /pA7xgAxD0qWnZW+eFX7yTMA0L58qFn2rg2jtPhj1lvD0GaPKk1F8+ehT+2ZIKethrvaH8
        KH7cq0g/+0sap1On8khozK1Jd6RruMQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-479-AHw5Ov5hO-e2zqqw94LDQA-1; Sun, 16 Jan 2022 16:52:09 -0500
X-MC-Unique: AHw5Ov5hO-e2zqqw94LDQA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D810C814243;
        Sun, 16 Jan 2022 21:52:07 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.40.192.3])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 6158312E37;
        Sun, 16 Jan 2022 21:52:05 +0000 (UTC)
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
Subject: [PATCH 0/9] media: atomisp: Fix AXP288 PMIC and dual-cam support
Date:   Sun, 16 Jan 2022 22:51:55 +0100
Message-Id: <20220116215204.307649-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi All,

Here is a patch series fixing various bugs in the current
atomisp_gmin_platform AXP288 support (it was completely broken before
this series) as well as adding support for devices with front and back
sensors.

This has been tested on a Teclast Tbook11 and a
Trekstor Surftab Duo W1 10.1, both of which use ov2680 sensors as both
there front and back sensors.

I think this should also make things work on the Cyberbook T116,
but I did not get around to testing that yet.

This series also contains some code to try and get things to work on
Bay Trail devices. This at least makes the driver load, but it does
not work yet and actually getting it to work may very well be quite
tricky.

Regards,

Hans


Hans de Goede (9):
  media: atomisp: Don't use ifdef on IS_ISP2401
  media: atomisp: Don't use ifdef ISP2400
  media: atomisp: Use irci_stable_candrpv_0415_20150423_1753 fw for byt
  media: atomisp_gmin_platform: Fix axp_regulator_set() writing to the
    wrong register
  media: atomisp_gmin_platform: Add enable-count to
    gmin_[v1p8|v2p8]_ctrl()
  media: atomisp_gmin_platform: Set ELDO1 to 1.6V on devices with an
    AXP288 PMIC
  media: atomisp_gmin_platform: Do not turn ELDO2 off from axp_v1p8_on()
  media: atomisp_gmin_platform: Base CsiPort default on detected CLK
  media: atomisp_gmin_platform: Add DMI quirk to not turn AXP ELDO2
    regulator off on some boards

 .../media/atomisp/pci/atomisp_compat_css20.c  |   4 +-
 .../media/atomisp/pci/atomisp_gmin_platform.c | 148 +++++++++++++-----
 .../staging/media/atomisp/pci/atomisp_v4l2.c  |   2 +-
 .../media/atomisp/pci/sh_css_firmware.c       |   4 +
 4 files changed, 114 insertions(+), 44 deletions(-)

-- 
2.33.1

