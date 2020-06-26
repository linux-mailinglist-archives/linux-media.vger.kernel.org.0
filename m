Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F23920B333
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2020 16:05:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729028AbgFZOFC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Jun 2020 10:05:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:50068 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728091AbgFZOFC (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Jun 2020 10:05:02 -0400
Received: from mail.kernel.org (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E575D2089D;
        Fri, 26 Jun 2020 14:05:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593180302;
        bh=FLH9RMavJhw1DcFHXpTX510iCkhJadwKN4Oh6++hLu4=;
        h=From:To:Cc:Subject:Date:From;
        b=w+OvSb5zMqQr3aCdiDSKdjkHP4jYagT3I0AMRbZC+VFiAfUqZgLSw5OuTGFYons1n
         jfAlL8eQRmlNGl4jfXL+rGP03Qr9+fTdWvb808CVu2C9mjyZnGb2LVmdifLn+HJZzH
         9dpmRkdrTweApESTfhHLMswesLmJgWqEbhqpp4XQ=
Received: from mchehab by mail.kernel.org with local (Exim 4.93)
        (envelope-from <mchehab@kernel.org>)
        id 1jooyR-00HKw2-WE; Fri, 26 Jun 2020 16:05:00 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        devel@driverdev.osuosl.org, linux-media@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH 0/7] Some atomisp fixes and improvements
Date:   Fri, 26 Jun 2020 16:04:52 +0200
Message-Id: <cover.1593180146.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Those patches are meant to improve device detection by the atomisp driver,
relying on ACPI bios when possible.

It also adds a basis for using ACPI PM, but only if the DSDT tables have
a description about how to turn on the resources needed by the cameras.

At least on the device I'm using for tests, this is not the case.

Mauro Carvalho Chehab (7):
  media: atomisp: reorganize the code under gmin_subdev_add()
  media: atomisp: Prepare sensor support for ACPI PM
  media: atomisp: properly parse CLK PMIC on newer devices
  media: atomisp: fix call to g_frame_interval
  media: atomisp: print info if gpio0 and gpio2 were detected
  media: atomisp: split add from find subdev
  media: atomisp: place all gpio parsing together

 .../staging/media/atomisp/pci/atomisp_cmd.c   |   2 +-
 .../media/atomisp/pci/atomisp_gmin_platform.c | 393 ++++++++++++------
 2 files changed, 267 insertions(+), 128 deletions(-)

-- 
2.26.2


