Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27C4F433B5D
	for <lists+linux-media@lfdr.de>; Tue, 19 Oct 2021 17:55:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232910AbhJSP6C (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Oct 2021 11:58:02 -0400
Received: from comms.puri.sm ([159.203.221.185]:33118 "EHLO comms.puri.sm"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232349AbhJSP6B (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Oct 2021 11:58:01 -0400
Received: from localhost (localhost [127.0.0.1])
        by comms.puri.sm (Postfix) with ESMTP id 5BDE0DF681;
        Tue, 19 Oct 2021 08:55:48 -0700 (PDT)
Received: from comms.puri.sm ([127.0.0.1])
        by localhost (comms.puri.sm [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 5SFdxqckliOk; Tue, 19 Oct 2021 08:55:47 -0700 (PDT)
From:   Martin Kepplinger <martin.kepplinger@puri.sm>
To:     sakari.ailus@linux.intel.com
Cc:     kernel@puri.sm, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, lkp@intel.com,
        martin.kepplinger@puri.sm, mchehab@kernel.org,
        paul.kocialkowski@bootlin.com
Subject: [PATCH v3 2/2] media: hi846: remove the of_match_ptr macro
Date:   Tue, 19 Oct 2021 17:55:09 +0200
Message-Id: <20211019155509.1018130-3-martin.kepplinger@puri.sm>
In-Reply-To: <20211019155509.1018130-1-martin.kepplinger@puri.sm>
References: <20211019155509.1018130-1-martin.kepplinger@puri.sm>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Similar to other drivers, this should fix a Clang compilar warning when
building without CONFIG_OF in which case of_match_ptr() is NULL and
the const struct we would use otherwise is unused.

Signed-off-by: Martin Kepplinger <martin.kepplinger@puri.sm>
Reported-by: kernel test robot <lkp@intel.com>
---
 drivers/media/i2c/hi846.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/hi846.c b/drivers/media/i2c/hi846.c
index 614d55932903..48909faeced4 100644
--- a/drivers/media/i2c/hi846.c
+++ b/drivers/media/i2c/hi846.c
@@ -2176,7 +2176,7 @@ static struct i2c_driver hi846_i2c_driver = {
 	.driver = {
 		.name = "hi846",
 		.pm = &hi846_pm_ops,
-		.of_match_table = of_match_ptr(hi846_of_match),
+		.of_match_table = hi846_of_match,
 	},
 	.probe_new = hi846_probe,
 	.remove = hi846_remove,
-- 
2.30.2

