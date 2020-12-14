Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 173A02D971F
	for <lists+linux-media@lfdr.de>; Mon, 14 Dec 2020 12:13:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2395543AbgLNLLc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Dec 2020 06:11:32 -0500
Received: from faui03.informatik.uni-erlangen.de ([131.188.30.103]:36600 "EHLO
        faui03.informatik.uni-erlangen.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731490AbgLNLLV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Dec 2020 06:11:21 -0500
Received: from cipterm0.informatik.uni-erlangen.de (cipterm0.cip.cs.fau.de [131.188.30.90])
        by faui03.informatik.uni-erlangen.de (Postfix) with ESMTP id 8115D240B92;
        Mon, 14 Dec 2020 12:10:20 +0100 (CET)
Received: by cipterm0.informatik.uni-erlangen.de (Postfix, from userid 67858)
        id 4E5803280453; Mon, 14 Dec 2020 12:05:07 +0100 (CET)
From:   Philipp Gerlesberger <Philipp.Gerlesberger@fau.de>
To:     linux-kernel@vger.kernel.org
Cc:     Philipp Gerlesberger <Philipp.Gerlesberger@fau.de>,
        ij72uhux@stud.informatik.uni-erlangen.de,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@i4.cs.fau.de, gregkh@linuxfoundation.org,
        sakari.ailus@linux.intel.com, mchehab@kernel.org
Subject: [PATCH v2 10/12] media: atomisp: Fix BLOCK_COMMENT_STYLE
Date:   Mon, 14 Dec 2020 12:03:56 +0100
Message-Id: <20201214110358.7102-11-Philipp.Gerlesberger@fau.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201214110358.7102-10-Philipp.Gerlesberger@fau.de>
References: <20201214110358.7102-10-Philipp.Gerlesberger@fau.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Block comments should align the * on each line

Co-developed-by: Andrey Khlopkov <ij72uhux@stud.informatik.uni-erlangen.de>
Signed-off-by: Andrey Khlopkov <ij72uhux@stud.informatik.uni-erlangen.de>
Signed-off-by: Philipp Gerlesberger <Philipp.Gerlesberger@fau.de>
---
 drivers/staging/media/atomisp/pci/runtime/spctrl/src/spctrl.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/runtime/spctrl/src/spctrl.c b/drivers/staging/media/atomisp/pci/runtime/spctrl/src/spctrl.c
index 38f86764ccfc..7f4592565af6 100644
--- a/drivers/staging/media/atomisp/pci/runtime/spctrl/src/spctrl.c
+++ b/drivers/staging/media/atomisp/pci/runtime/spctrl/src/spctrl.c
@@ -105,8 +105,8 @@ int ia_css_spctrl_load_fw(sp_ID_t sp_id, ia_css_spctrl_cfg *spctrl_cfg)
 void sh_css_spctrl_reload_fw(sp_ID_t sp_id)
 {
 	/* now we program the base address into the icache and
-	* invalidate the cache.
-	*/
+	 * invalidate the cache.
+	 */
 	sp_ctrl_store(sp_id, SP_ICACHE_ADDR_REG,
 		      (hrt_data)spctrl_cofig_info[sp_id].code_addr);
 	sp_ctrl_setbit(sp_id, SP_ICACHE_INV_REG, SP_ICACHE_INV_BIT);
-- 
2.20.1

