Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 861793996DB
	for <lists+linux-media@lfdr.de>; Thu,  3 Jun 2021 02:16:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229656AbhFCARo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Jun 2021 20:17:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:50366 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229541AbhFCARo (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 2 Jun 2021 20:17:44 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D65AA6100A;
        Thu,  3 Jun 2021 00:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622679360;
        bh=yEdkcwuAhilPBcLbUWO28NG4GTX7d4iKHu4aVHEwMBE=;
        h=Date:From:To:Cc:Subject:From;
        b=uu9+1ZBQo/EZmWv5FGp1qdyQb2TwPdVMUd8Gai0Lzd076/EBqKLci9m3hKubk0xuE
         uS3cEkN6UgTpNA4mA1QTke4r2EIl6gRgDkchsERpkEbZvPhr0mcrMm7dTuxX80mjAm
         SeAybvHtyu1siOVw/IWuhYVEOjBS4YLV9oPxB6IPRaIj533yA1Z/gditQfHWpFqWzw
         r7W8o/40j7TpPH8K8udH4G+lIX+kPDg3E6gWFuwe6rhylHRPH/TD1t24shUYbmUanD
         li7WTp24O6Qogx8sgCREjrM47vfsDsOW3sZi5YSLLh6ddChslNiy1TUmgCEMaHPh9N
         gKnazDIguyOQQ==
Date:   Wed, 2 Jun 2021 19:17:08 -0500
From:   "Gustavo A. R. Silva" <gustavoars@kernel.org>
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        linux-hardening@vger.kernel.org, Kees Cook <keescook@chromium.org>
Subject: [PATCH v3][venus-for-next-v5.14] media: venus: hfi_cmds: Fix packet
 size calculation
Message-ID: <20210603001708.GA55239@embeddedor>
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
Changes in v3:
 - Fix size calculation in call to struct_size().
   Link: https://lore.kernel.org/linux-hardening/202106021254.39A1561075@keescook/
   Link: https://lore.kernel.org/linux-hardening/113fd896-464c-6aef-215a-a53ac6103a62@embeddedor.com/

Changes in v2:
 - Include linux/overflow.h for struct_size().

 drivers/media/platform/qcom/venus/hfi_cmds.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/hfi_cmds.c b/drivers/media/platform/qcom/venus/hfi_cmds.c
index 4b9dea7f6940..f51024786991 100644
--- a/drivers/media/platform/qcom/venus/hfi_cmds.c
+++ b/drivers/media/platform/qcom/venus/hfi_cmds.c
@@ -3,6 +3,7 @@
  * Copyright (c) 2012-2016, The Linux Foundation. All rights reserved.
  * Copyright (C) 2017 Linaro Ltd.
  */
+#include <linux/overflow.h>
 #include <linux/errno.h>
 #include <linux/hash.h>
 
@@ -27,7 +28,7 @@ void pkt_sys_idle_indicator(struct hfi_sys_set_property_pkt *pkt, u32 enable)
 {
 	struct hfi_enable *hfi = (struct hfi_enable *)&pkt->data[1];
 
-	pkt->hdr.size = sizeof(*pkt) + sizeof(*hfi) + sizeof(u32);
+	pkt->hdr.size = struct_size(pkt, data, 1) + sizeof(*hfi);
 	pkt->hdr.pkt_type = HFI_CMD_SYS_SET_PROPERTY;
 	pkt->num_properties = 1;
 	pkt->data[0] = HFI_PROPERTY_SYS_IDLE_INDICATOR;
@@ -39,7 +40,7 @@ void pkt_sys_debug_config(struct hfi_sys_set_property_pkt *pkt, u32 mode,
 {
 	struct hfi_debug_config *hfi;
 
-	pkt->hdr.size = sizeof(*pkt) + sizeof(*hfi) + sizeof(u32);
+	pkt->hdr.size = struct_size(pkt, data, 1) + sizeof(*hfi);
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
+	pkt->hdr.size = struct_size(pkt, data, 1) + sizeof(*hfi);
 	pkt->hdr.pkt_type = HFI_CMD_SYS_SET_PROPERTY;
 	pkt->num_properties = 1;
 	pkt->data[0] = HFI_PROPERTY_SYS_CODEC_POWER_PLANE_CTRL;
-- 
2.27.0

