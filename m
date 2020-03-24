Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4A929191319
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2020 15:27:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728352AbgCXO01 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Mar 2020 10:26:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:35816 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728026AbgCXO00 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Mar 2020 10:26:26 -0400
Received: from mail.kernel.org (ip5f5ad4e9.dynamic.kabel-deutschland.de [95.90.212.233])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A93CE21556;
        Tue, 24 Mar 2020 14:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1585059985;
        bh=kXBgL77aKBseXgTmvFFT2dzAuc5r0P2z+w2gjYWQYQQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=aYtFA/MUacrLYrhXAz+VU3UTrdp7Tb6IVDBx8o0ou9vsdqbG4ZwOHJJ48AdFV6Ege
         niQ/ExewfOICYNwMIZEc7nhaaIFe3PAhv7C/pQr/05lDZaVXA7/H9Q87GiwSJ01snS
         WxFqP6HoVp8QH6vKQSlLbgP+BhP4Oq5oZ0FzImb8=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1jGkVb-00267D-Tp; Tue, 24 Mar 2020 15:26:23 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: [PATCH v2 11/20] media: Kconfig: move comment to siano include
Date:   Tue, 24 Mar 2020 15:26:12 +0100
Message-Id: <df1ece11a2d64883ba87ed492f18ca52b613c837.1585059897.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <cover.1585059896.git.mchehab+huawei@kernel.org>
References: <cover.1585059896.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Showing this comment without showing the Siano mmc option
is very weird! Place the option together, and make it
visible only when showing Siano configuration.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/mmc/Kconfig       | 1 -
 drivers/media/mmc/siano/Kconfig | 2 ++
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/mmc/Kconfig b/drivers/media/mmc/Kconfig
index 5217f5bd205e..75aa6de08d53 100644
--- a/drivers/media/mmc/Kconfig
+++ b/drivers/media/mmc/Kconfig
@@ -1,3 +1,2 @@
 # SPDX-License-Identifier: GPL-2.0-only
-comment "MMC/SDIO adapters"
 source "drivers/media/mmc/siano/Kconfig"
diff --git a/drivers/media/mmc/siano/Kconfig b/drivers/media/mmc/siano/Kconfig
index 1919f6fea8b1..570696019a9e 100644
--- a/drivers/media/mmc/siano/Kconfig
+++ b/drivers/media/mmc/siano/Kconfig
@@ -2,6 +2,8 @@
 #
 # Siano Mobile Silicon Digital TV device configuration
 #
+comment "MMC/SDIO DVB adapters"
+	depends on DVB_CORE && HAS_DMA && MMC
 
 config SMS_SDIO_DRV
 	tristate "Siano SMS1xxx based MDTV via SDIO interface"
-- 
2.24.1

