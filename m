Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C31CE1A8A97
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2020 21:24:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2504614AbgDNTDC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Apr 2020 15:03:02 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:47404 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2504595AbgDNTC7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Apr 2020 15:02:59 -0400
Received: from floko.floko.floko (unknown [IPv6:2804:431:e7cc:79a2:b6f7:4033:5775:cc3a])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: koike)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 027632A1C16;
        Tue, 14 Apr 2020 20:02:52 +0100 (BST)
From:   Helen Koike <helen.koike@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     mchehab+huawei@kernel.org, kernel@collabora.com,
        ezequiel@collabora.com, Helen Koike <helen.koike@collabora.com>
Subject: [PATCH] media: Makefile: fix test drivers compilation
Date:   Tue, 14 Apr 2020 16:02:38 -0300
Message-Id: <20200414190238.1326598-1-helen.koike@collabora.com>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

test_drivers/ folder is not being added by media Makefile, so it is not
being compiled.

Add test_drivers/ folder in Makefile folder's list.

Fixes: 4b32216adb010 ("media: split test drivers from platform directory")
Signed-off-by: Helen Koike <helen.koike@collabora.com>
---

 drivers/media/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/Makefile b/drivers/media/Makefile
index f215f0a89f9e6..693b3f0bf03ee 100644
--- a/drivers/media/Makefile
+++ b/drivers/media/Makefile
@@ -29,6 +29,6 @@ obj-$(CONFIG_CEC_CORE) += cec/
 # Finally, merge the drivers that require the core
 #
 
-obj-y += common/ platform/ pci/ usb/ mmc/ firewire/ spi/
+obj-y += common/ platform/ pci/ usb/ mmc/ firewire/ spi/ test_drivers/
 obj-$(CONFIG_VIDEO_DEV) += radio/
 
-- 
2.26.0

