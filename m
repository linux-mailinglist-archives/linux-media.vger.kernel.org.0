Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFC142D2ED4
	for <lists+linux-media@lfdr.de>; Tue,  8 Dec 2020 16:57:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730068AbgLHP4d (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Dec 2020 10:56:33 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:39524 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729985AbgLHP4c (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Dec 2020 10:56:32 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: aratiu)
        with ESMTPSA id 8564B1F44B0A
From:   Adrian Ratiu <adrian.ratiu@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     kernel@collabora.com, linux-rockchip@lists.infradead.org,
        linux-kernel@vger.kernel.org, devel@driverdev.osuosl.org,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        kernel test robot <lkp@intel.com>
Subject: [PATCH] media: rkvdec: silence ktest bot build warning
Date:   Tue,  8 Dec 2020 17:55:40 +0200
Message-Id: <20201208155540.340583-1-adrian.ratiu@collabora.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Some configurations built by the ktest bot produce the following
warn, so mark the struct as __maybe_unused to avoid unnecessary
ML spam.

>> drivers/staging/media/rkvdec/rkvdec.c:967:34: warning: unused variable 'of_rkvdec_match' [-Wunused-const-variable]
   static const struct of_device_id of_rkvdec_match[] = {
				    ^
   1 warning generated.

vim +/of_rkvdec_match +967 drivers/staging/media/rkvdec/rkvdec.c

   966
 > 967	static const struct of_device_id of_rkvdec_match[] = {
   968		{ .compatible = "rockchip,rk3399-vdec" },
   969		{ /* sentinel */ }
   970	};
   971	MODULE_DEVICE_TABLE(of, of_rkvdec_match);
   972

Cc: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Ezequiel Garcia <ezequiel@collabora.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Adrian Ratiu <adrian.ratiu@collabora.com>
---
 drivers/staging/media/rkvdec/rkvdec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/rkvdec/rkvdec.c b/drivers/staging/media/rkvdec/rkvdec.c
index aa4f8c287618..3af0f02ec59b 100644
--- a/drivers/staging/media/rkvdec/rkvdec.c
+++ b/drivers/staging/media/rkvdec/rkvdec.c
@@ -992,7 +992,7 @@ static void rkvdec_watchdog_func(struct work_struct *work)
 	}
 }
 
-static const struct of_device_id of_rkvdec_match[] = {
+static const struct of_device_id __maybe_unused of_rkvdec_match[] = {
 	{ .compatible = "rockchip,rk3399-vdec" },
 	{ /* sentinel */ }
 };
-- 
2.29.2

