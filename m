Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B82AA2D1999
	for <lists+linux-media@lfdr.de>; Mon,  7 Dec 2020 20:32:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726825AbgLGTb4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Dec 2020 14:31:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726915AbgLGTbz (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Dec 2020 14:31:55 -0500
Received: from faui03.informatik.uni-erlangen.de (faui03.informatik.uni-erlangen.de [IPv6:2001:638:a000:4130:131:188:30:103])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEF27C061793;
        Mon,  7 Dec 2020 11:31:14 -0800 (PST)
Received: from cipterm0.informatik.uni-erlangen.de (cipterm0.cip.cs.fau.de [131.188.30.90])
        by faui03.informatik.uni-erlangen.de (Postfix) with ESMTP id 3517D240F05;
        Mon,  7 Dec 2020 20:30:32 +0100 (CET)
Received: by cipterm0.informatik.uni-erlangen.de (Postfix, from userid 67858)
        id 2F45E3280304; Mon,  7 Dec 2020 20:30:32 +0100 (CET)
From:   Philipp Gerlesberger <Philipp.Gerlesberger@fau.de>
To:     linux-kernel@vger.kernel.org
Cc:     Philipp Gerlesberger <Philipp.Gerlesberger@fau.de>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        mchehab@kernel.org, sakari.ailus@linux.intel.com,
        gregkh@linuxfoundation.org,
        ij72uhux@stud.informatik.uni-erlangen.de, linux-kernel@i4.cs.fau.de
Subject: [PATCH 09/12] media: atomisp: Fix PARENTHESIS_ALIGNMENT
Date:   Mon,  7 Dec 2020 20:26:36 +0100
Message-Id: <20201207192638.15219-10-Philipp.Gerlesberger@fau.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201207192638.15219-1-Philipp.Gerlesberger@fau.de>
References: <20201207192638.15219-1-Philipp.Gerlesberger@fau.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

You can sum up the two lines, because the maximum line length of
100 columns is not exceeded.

Co-developed-by: Andrey Khlopkov <ij72uhux@stud.informatik.uni-erlangen.de>
Signed-off-by: Andrey Khlopkov <ij72uhux@stud.informatik.uni-erlangen.de>
Signed-off-by: Philipp Gerlesberger <Philipp.Gerlesberger@fau.de>
---
 drivers/staging/media/atomisp/pci/runtime/spctrl/src/spctrl.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/runtime/spctrl/src/spctrl.c b/drivers/staging/media/atomisp/pci/runtime/spctrl/src/spctrl.c
index 753a99703f1e..38f86764ccfc 100644
--- a/drivers/staging/media/atomisp/pci/runtime/spctrl/src/spctrl.c
+++ b/drivers/staging/media/atomisp/pci/runtime/spctrl/src/spctrl.c
@@ -37,8 +37,7 @@ static struct spctrl_context_info spctrl_cofig_info[N_SP_ID];
 static bool spctrl_loaded[N_SP_ID] = {0};
 
 /* Load firmware */
-int ia_css_spctrl_load_fw(sp_ID_t sp_id,
-				      ia_css_spctrl_cfg *spctrl_cfg)
+int ia_css_spctrl_load_fw(sp_ID_t sp_id, ia_css_spctrl_cfg *spctrl_cfg)
 {
 	ia_css_ptr code_addr = mmgr_NULL;
 	struct ia_css_sp_init_dmem_cfg *init_dmem_cfg;
-- 
2.20.1

