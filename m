Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F4DF397A2B
	for <lists+linux-media@lfdr.de>; Tue,  1 Jun 2021 20:46:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234656AbhFASqw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Jun 2021 14:46:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:44298 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233970AbhFASqv (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 1 Jun 2021 14:46:51 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 55E4D60C3F;
        Tue,  1 Jun 2021 18:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622573110;
        bh=/0v0BbCRmqQoHmuTHyO1LQsRp/5gRVDEfk7TG+cgMAU=;
        h=Date:From:To:Cc:Subject:From;
        b=GX1Ri7Es0XLMxlp5yqIYrNgrJydS9rfYAJya7Ivfel5l2otEsvwhZQBhRqmW6DMQF
         l1GaXoIeDqMwprPi65R5uapr7Qw1bva44ihRQULSjtPHPmetZvNBgqxFJzW7Z1Qq62
         1syPGNkSqEjSsiAAXd0lVOql1jLrtkbZ7QG4KP786YrP5I3x6APRowuGPLM9YKk7KO
         A3JqXV/AnfwEZPVBHwkij6gApi6bE511mkhPnrrH3TwIlkBVTScPsaIJaCRX1e9g2F
         t3RRm4rvoEWvOTn+UMaZUqg6wStJ8Xz/vKZieFzZVlUysyoCqw2PwfmFguje4x94AC
         zEAsyx/PrpJpA==
Date:   Tue, 1 Jun 2021 13:46:16 -0500
From:   "Gustavo A. R. Silva" <gustavoars@kernel.org>
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        linux-hardening@vger.kernel.org
Subject: [PATCH][venus-for-next-v5.14] media: venus: hfi_cmds: Fix packet
 size calculation
Message-ID: <20210601184616.GA23488@embeddedor>
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
BTW... it seems that a similar problem is present in
https://lore.kernel.org/linux-hardening/20210211001044.GA69612@embeddedor/ 
and that is what is causing the regression. I will send v2 of that
patch, shortly. Thanks.

 drivers/media/platform/qcom/venus/hfi_cmds.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/hfi_cmds.c b/drivers/media/platform/qcom/venus/hfi_cmds.c
index 11a8347e5f5c..c86279e5d6e8 100644
--- a/drivers/media/platform/qcom/venus/hfi_cmds.c
+++ b/drivers/media/platform/qcom/venus/hfi_cmds.c
@@ -27,7 +27,7 @@ void pkt_sys_idle_indicator(struct hfi_sys_set_property_pkt *pkt, u32 enable)
 {
 	struct hfi_enable *hfi = (struct hfi_enable *)&pkt->data[1];
 
-	pkt->hdr.size = sizeof(*pkt) + sizeof(*hfi) + sizeof(u32);
+	pkt->hdr.size = struct_size(pkt, data, 2) + sizeof(*hfi);
 	pkt->hdr.pkt_type = HFI_CMD_SYS_SET_PROPERTY;
 	pkt->num_properties = 1;
 	pkt->data[0] = HFI_PROPERTY_SYS_IDLE_INDICATOR;
@@ -39,7 +39,7 @@ void pkt_sys_debug_config(struct hfi_sys_set_property_pkt *pkt, u32 mode,
 {
 	struct hfi_debug_config *hfi;
 
-	pkt->hdr.size = sizeof(*pkt) + sizeof(*hfi) + sizeof(u32);
+	pkt->hdr.size = struct_size(pkt, data, 2) + sizeof(*hfi);
 	pkt->hdr.pkt_type = HFI_CMD_SYS_SET_PROPERTY;
 	pkt->num_properties = 1;
 	pkt->data[0] = HFI_PROPERTY_SYS_DEBUG_CONFIG;
@@ -50,7 +50,7 @@ void pkt_sys_debug_config(struct hfi_sys_set_property_pkt *pkt, u32 mode,
 
 void pkt_sys_coverage_config(struct hfi_sys_set_property_pkt *pkt, u32 mode)
 {
-	pkt->hdr.size = sizeof(*pkt) + sizeof(u32);
+	pkt->hdr.size = struct_size(pkt, data, 2);
 	pkt->hdr.pkt_type = HFI_CMD_SYS_SET_PROPERTY;
 	pkt->num_properties = 1;
 	pkt->data[0] = HFI_PROPERTY_SYS_CONFIG_COVERAGE;
@@ -116,7 +116,7 @@ void pkt_sys_power_control(struct hfi_sys_set_property_pkt *pkt, u32 enable)
 {
 	struct hfi_enable *hfi = (struct hfi_enable *)&pkt->data[1];
 
-	pkt->hdr.size = sizeof(*pkt) + sizeof(*hfi) + sizeof(u32);
+	pkt->hdr.size = struct_size(pkt, data, 2) + sizeof(*hfi);
 	pkt->hdr.pkt_type = HFI_CMD_SYS_SET_PROPERTY;
 	pkt->num_properties = 1;
 	pkt->data[0] = HFI_PROPERTY_SYS_CODEC_POWER_PLANE_CTRL;
-- 
2.27.0

