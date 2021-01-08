Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09CC82EEE8A
	for <lists+linux-media@lfdr.de>; Fri,  8 Jan 2021 09:25:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727767AbhAHIYX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 Jan 2021 03:24:23 -0500
Received: from mail.kernel.org ([198.145.29.99]:59022 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727396AbhAHIYW (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 8 Jan 2021 03:24:22 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 907DB2343B;
        Fri,  8 Jan 2021 08:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610094222;
        bh=Kb16w298kZTAlEWpzqllvq2hovbvuFFho6Aectf+P2Q=;
        h=From:To:Cc:Subject:Date:From;
        b=WamJreZb+aHOCvWYMI4fEqI0PlJQZ8fbipCb3x7HG2ff1xkqKyTazUHc63vjUQFC2
         TieFRi213IHgRdBymssxUlqO2qHmocTOqOigzhktw+QqeKraljxk4UbgVS3Zs2yWwQ
         BV5j9DaKfC7N3GINFqM9Kfxc6QHIWG4OcoqoaEEtSesJmV164OAIgR/t02AnNREbcx
         LEu4aT6jYoXEQbvusL6PRBD3eT+UFx361idz170TYzlR1JnGkK3gAiqg26vdxZmRRQ
         a9wXynGOPx9+JRob6sYUj2jnT3YigRcR4H4WlkIUAtmW9a4xRQLdn4W59OvzpXmtBe
         qBtvpyc30e2oA==
From:   Arnd Bergmann <arnd@kernel.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] media: atomisp: fix Wvisiblity warning
Date:   Fri,  8 Jan 2021 09:23:28 +0100
Message-Id: <20210108082337.2305938-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

Some randconfig builds include ia_css_firmware.h without first
including linux/device.h:

In file included from atomisp/pci/mmu/sh_mmu_mrfld.c:23:
In file included from atomisp/pci/atomisp_compat.h:22:
In file included from atomisp/pci/atomisp_compat_css20.h:24:
In file included from atomisp/pci/ia_css.h:28:
In file included from atomisp/pci/ia_css_control.h:25:
drivers/staging/media/atomisp//pci/ia_css_firmware.h:52:29: error: declaration of 'struct device' will not be visible outside of this function [-Werror,-Wvisibility]

Add a forward declaration to avoid the warning.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/staging/media/atomisp/pci/ia_css_firmware.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/staging/media/atomisp/pci/ia_css_firmware.h b/drivers/staging/media/atomisp/pci/ia_css_firmware.h
index edab72256494..38f0408947d1 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_firmware.h
+++ b/drivers/staging/media/atomisp/pci/ia_css_firmware.h
@@ -30,6 +30,8 @@ struct ia_css_fw {
 	unsigned int bytes; /** length in bytes of firmware data */
 };
 
+struct device;
+
 /* @brief Loads the firmware
  * @param[in]	env		Environment, provides functions to access the
  *				environment in which the CSS code runs. This is
-- 
2.29.2

