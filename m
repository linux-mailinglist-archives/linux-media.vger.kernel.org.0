Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 704DF3DDB32
	for <lists+linux-media@lfdr.de>; Mon,  2 Aug 2021 16:38:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234254AbhHBOih (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 Aug 2021 10:38:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:45194 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233925AbhHBOie (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 2 Aug 2021 10:38:34 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id A9EE160E97;
        Mon,  2 Aug 2021 14:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627915105;
        bh=3ZYcZPQjEjSEHTb9HiRMek+879amZ+MVRhxp83xQ/aE=;
        h=From:To:Cc:Subject:Date:From;
        b=K15vMR6aQfsjYku1iI3zkke3uUJv9wqJwhmpNAzgXCJuguiFVcHa7naHaxUlMY9Di
         5CDEm7Pyzfde09ceAUVOmYZ1JvLGJquVpTnLySEaxY2U5Uyd+rS46oIMi0vj7hgOmC
         IkVNgkQVTe85/PKOoOutEN4/t9KhN3E0erRJGitAuXI2Dg/G49ESf3WSedqTfNy4WS
         aRLd1JOU+1zrlFr+fDXLiqQEiZs/rsehYRSuWMw4i97dmxhSZeL+G/YK+UUNx+tCqQ
         gecn7oSAdyXjP1y50j0kaRYp/bRAyDIxEtOdlEsHFQh1w8GSiMxOWMwe9f7S17q9TJ
         j6k4hXj4cRgzQ==
From:   Arnd Bergmann <arnd@kernel.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Pavel Skripkin <paskripkin@gmail.com>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: [PATCH] media: atomisp: restore missing 'return' statement
Date:   Mon,  2 Aug 2021 16:38:14 +0200
Message-Id: <20210802143820.1150099-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

The input_system_configure_channel_sensor() function lost its final
return code in a previous patch:

drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c: In function 'input_system_configure_channel_sensor':
drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c:1649:1: error: control reaches end of non-void function [-Werror=return-type]

Restore what was there originally.

Fixes: 728a5c64ae5f ("media: atomisp: remove dublicate code")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 .../media/atomisp/pci/hive_isp_css_common/host/input_system.c   | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c
index 8e085dda0c18..712e01c37870 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c
@@ -1646,6 +1646,8 @@ static input_system_err_t input_system_configure_channel_sensor(
 	default:
 		return INPUT_SYSTEM_ERR_PARAMETER_NOT_SUPPORTED;
 	}
+
+	return INPUT_SYSTEM_ERR_NO_ERROR;
 }
 
 // Test flags and set structure.
-- 
2.29.2

