Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 49E1D485AA
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2019 16:40:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728279AbfFQOiN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Jun 2019 10:38:13 -0400
Received: from baptiste.telenet-ops.be ([195.130.132.51]:40976 "EHLO
        baptiste.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726489AbfFQOiN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Jun 2019 10:38:13 -0400
Received: from ramsan ([84.194.111.163])
        by baptiste.telenet-ops.be with bizsmtp
        id Rqe32000W3XaVaC01qe3kw; Mon, 17 Jun 2019 16:38:03 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hcslm-0002JE-T5; Mon, 17 Jun 2019 16:38:02 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hcslm-0001Kd-Ra; Mon, 17 Jun 2019 16:38:02 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Yasunari Takiguchi <Yasunari.Takiguchi@sony.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] media: cxd2880: Add missing newline at end of file
Date:   Mon, 17 Jun 2019 16:38:01 +0200
Message-Id: <20190617143801.5077-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

"git diff" says:

    \ No newline at end of file

after modifying the file.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/media/dvb-frontends/cxd2880/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/dvb-frontends/cxd2880/Kconfig b/drivers/media/dvb-frontends/cxd2880/Kconfig
index 9d989676e8007264..94a8e0b936b951dd 100644
--- a/drivers/media/dvb-frontends/cxd2880/Kconfig
+++ b/drivers/media/dvb-frontends/cxd2880/Kconfig
@@ -5,4 +5,4 @@ config DVB_CXD2880
 	depends on DVB_CORE && SPI
 	default m if !MEDIA_SUBDRV_AUTOSELECT
 	help
-	  Say Y when you want to support this frontend.
\ No newline at end of file
+	  Say Y when you want to support this frontend.
-- 
2.17.1

