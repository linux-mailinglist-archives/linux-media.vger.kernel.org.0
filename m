Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F73E397A47
	for <lists+linux-media@lfdr.de>; Tue,  1 Jun 2021 20:54:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234539AbhFAS40 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Jun 2021 14:56:26 -0400
Received: from mail.kernel.org ([198.145.29.99]:45660 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233397AbhFAS40 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 1 Jun 2021 14:56:26 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7F85F610CB;
        Tue,  1 Jun 2021 18:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622573684;
        bh=4iiEd5l4m2/Ori1jLtEYI+2KE4P8L7ttrQhdycPrOOk=;
        h=Date:From:To:Cc:Subject:From;
        b=nBekMZtwL/tRKQOe4vtdXvaTrO24vkHhYK381uoJS+i1eTKvmYoxcgvoBPkN8w0nt
         K4ZT1NwbQU7huhXgV1L+6OUpuaC5xdTF6NiRZKIA210U3nf5kwDVjddWSzxh+ndPXc
         YITb2XKQQD0dsUb9WIYApAdzHbhYbSJfe4E7Nr6ER/2sQvNLtec4RBTFpljUDf+K0n
         An8RZFY+SvJ0TIkvxGNWUE9tXq6Euzos2WbMrHfnx7f3BPrTiWO8aAUvS3jN9xBx0g
         TU0fXiT1Un7SB3LEsguqnmi1y/vaxsAU0fswm49xaioOzHOnQ6T1PAUHnOZIObA+6q
         LfSmJVqeGj4Ag==
Date:   Tue, 1 Jun 2021 13:55:50 -0500
From:   "Gustavo A. R. Silva" <gustavoars@kernel.org>
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        linux-hardening@vger.kernel.org
Subject: [PATCH v2][venus-for-next-v5.14] media: venus: hfi_cmds: Fix packet
 size calculation
Message-ID: <20210601185550.GA39330@embeddedor>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Now that a one-element array was replaced with a flexible-array member
in struct hfi_sys_set_property_pkt, use the struct_size() helper to
correctly calculate the packet size.

Fixes: 701e10b3fd9f ("media: venus: hfi_cmds.h: Replace one-element array with flexible-array member")
Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
Changes in v2:
 - Include linux/overflow.h

BTW... it seems that a similar problem is present in[1] and that is
what is causing the regression. I will send v2 of that patch,
shortly. Thanks.

[1] https://lore.kernel.org/linux-hardening/20210211001044.GA69612@embeddedor/

 drivers/media/platform/qcom/venus/hfi_cmds.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/hfi_cmds.c b/drivers/media/platform/qcom/venus/hfi_cmds.c
index 4b9dea7f6940..a4fec1c563bb 100644
--- a/drivers/media/platform/qcom/venus/hfi_cmds.c
+++ b/drivers/media/platform/qcom/venus/hfi_cmds.c
@@ -5,6 +5,7 @@
  */
 #include <linux/errno.h>
 #include <linux/hash.h>
+#include <linux/overflow.h>
 
 #include "hfi_cmds.h"
 
@@ -27,7 +28,7 @@ void pkt_sys_idle_indicator(struct hfi_sys_set_property_pkt *pkt, u32 enable)
 {
 	struct hfi_enable *hfi = (struct hfi_enable *)&pkt->data[1];
 
-	pkt->hdr.size = sizeof(*pkt) + sizeof(*hfi) + sizeof(u32);
+	pkt->hdr.size = struct_size(pkt, data, 2) + sizeof(*hfi);
 	pkt->hdr.pkt_type = HFI_CMD_SYS_SET_PROPERTY;
 	pkt->num_properties = 1;
 	pkt->data[0] = HFI_PROPERTY_SYS_IDLE_INDICATOR;
@@ -39,7 +40,7 @@ void pkt_sys_debug_config(struct hfi_sys_set_property_pkt *pkt, u32 mode,
 {
 	struct hfi_debug_config *hfi;
 
-	pkt->hdr.size = sizeof(*pkt) + sizeof(*hfi) + sizeof(u32);
+	pkt->hdr.size = struct_size(pkt, data, 2) + sizeof(*hfi);
 	pkt->hdr.pkt_type = HFI_CMD_SYS_SET_PROPERTY;
 	pkt->num_properties = 1;
 	pkt->data[0] = HFI_PROPERTY_SYS_DEBUG_CONFIG;
@@ -50,7 +51,7 @@ void pkt_sys_debug_config(struct hfi_sys_set_property_pkt *pkt, u32 mode,
 
 void pkt_sys_coverage_config(struct hfi_sys_set_property_pkt *pkt, u32 mode)
 {
-	pkt->hdr.size = sizeof(*pkt) + sizeof(u32);
+	pkt->hdr.size = struct_size(pkt, data, 2);
 	pkt->hdr.pkt_type = HFI_CMD_SYS_SET_PROPERTY;
 	pkt->num_properties = 1;
 	pkt->data[0] = HFI_PROPERTY_SYS_CONFIG_COVERAGE;
@@ -116,7 +117,7 @@ void pkt_sys_power_control(struct hfi_sys_set_property_pkt *pkt, u32 enable)
 {
 	struct hfi_enable *hfi = (struct hfi_enable *)&pkt->data[1];
 
-	pkt->hdr.size = sizeof(*pkt) + sizeof(*hfi) + sizeof(u32);
+	pkt->hdr.size = struct_size(pkt, data, 2) + sizeof(*hfi);
 	pkt->hdr.pkt_type = HFI_CMD_SYS_SET_PROPERTY;
 	pkt->num_properties = 1;
 	pkt->data[0] = HFI_PROPERTY_SYS_CODEC_POWER_PLANE_CTRL;
-- 
2.27.0

