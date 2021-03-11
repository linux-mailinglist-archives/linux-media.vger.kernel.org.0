Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B74BB336FC9
	for <lists+linux-media@lfdr.de>; Thu, 11 Mar 2021 11:21:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232301AbhCKKUv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Mar 2021 05:20:51 -0500
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:58135 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232289AbhCKKUd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Mar 2021 05:20:33 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id KIQYlPLX0C40pKIQilKo7P; Thu, 11 Mar 2021 11:20:33 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1615458033; bh=K1I0+Sdo21BDbwLkYBvf32NqpFdUR23qKP/MSuU2zGE=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=Ns+b7vF023dRv2+TNP5+TASMiZvPqr2zk4+62VCVYeT2dwTyaVR3BAjbeCIvK6bua
         GPAgl1/LAqMdPMqJ1plSA6Z5Lw/AZ+Di95vah6ywxHF0U+f7mwMYfnZ5N6h9+Fi26a
         PdLwSMkqtn6mpIsYQH86z/67xdsz22rRLHn0LEtaYNbPchpg8ShHhz6dc/zL3dJwlD
         p8/1U4umqAQ3inxHgKDA7vdiX9MB9v1nHSU3eA7w8Clf7ywMWBrG+PIuCNZx+TGaDY
         4ooArNVRylNtoCB8C3u+bkcvzqWfBFl2wIW+kNhWx8HU3ZtHTvmZ0dZnBbP6tdrCfv
         z0Ps14phAyZ9w==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Irui Wang <irui.wang@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>
Subject: [PATCH 13/13] mtk-vpu/mtk_vpu.h: fix kernel-doc warnings
Date:   Thu, 11 Mar 2021 11:20:22 +0100
Message-Id: <20210311102022.96954-14-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210311102022.96954-1-hverkuil-cisco@xs4all.nl>
References: <20210311102022.96954-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfPeg0speacsQNx9tpCxrGjtDlvZHmJwWHTvZFgXcAtWq/ln4y9eMFW2ZQI64HS8EWk/tGgPPjq/0Nt8nPRdXpAVgsdvS9HqOqki+8MiEbHVj5pfikJ2y
 9wMVisxKjrmccjEm6TBg39tp0lsB/xvP8+EIYroDUoIUk61zsAJnPvCag7I/8EuKGurRfl2lmh215wy40bXkZWETedkCCS68/qgqwAolouT85xp4CVEnf9LJ
 fBYwH8OmAEyoDTlS3L4O81aEuCDqsQa4zPIKClhfjssyT/j34N+L8n1PdBQrBvrDZVCSL2GuURvCNaualNXEnA==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

A top-level documentation block was missing 'DOC:'.

Fix typos in vpu_wdt_reg_handler() and vpu_mapping_dm_addr().

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Irui Wang <irui.wang@mediatek.com>
Cc: Andrew-CT Chen <andrew-ct.chen@mediatek.com>
---
 drivers/media/platform/mtk-vpu/mtk_vpu.h | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/mtk-vpu/mtk_vpu.h b/drivers/media/platform/mtk-vpu/mtk_vpu.h
index ee7c552ce928..a56053ff135a 100644
--- a/drivers/media/platform/mtk-vpu/mtk_vpu.h
+++ b/drivers/media/platform/mtk-vpu/mtk_vpu.h
@@ -10,10 +10,12 @@
 #include <linux/platform_device.h>
 
 /**
+ * DOC: VPU
+ *
  * VPU (video processor unit) is a tiny processor controlling video hardware
  * related to video codec, scaling and color format converting.
  * VPU interfaces with other blocks by share memory and interrupt.
- **/
+ */
 
 typedef void (*ipi_handler_t) (const void *data,
 			       unsigned int len,
@@ -126,18 +128,18 @@ struct platform_device *vpu_get_plat_device(struct platform_device *pdev);
  * vpu_wdt_reg_handler - register a VPU watchdog handler
  *
  * @pdev:               VPU platform device
- * @vpu_wdt_reset_func:	the callback reset function
- * @private_data:       the private data for reset function
- * @rst_id:		reset id
+ * @vpu_wdt_reset_func():	the callback reset function
+ *	@priv: the private data for reset function
+ * @priv:		the private data for reset function
+ * @id:			reset id
  *
  * Register a handler performing own tasks when vpu reset by watchdog
  *
  * Return: Return 0 if the handler is added successfully,
  * otherwise it is failed.
- *
  **/
 int vpu_wdt_reg_handler(struct platform_device *pdev,
-			void vpu_wdt_reset_func(void *),
+			void vpu_wdt_reset_func(void *priv),
 			void *priv, enum rst_id id);
 
 /**
@@ -171,8 +173,8 @@ int vpu_load_firmware(struct platform_device *pdev);
 /**
  * vpu_mapping_dm_addr - Mapping DTCM/DMEM to kernel virtual address
  *
- * @pdev:	VPU platform device
- * @dmem_addr:	VPU's data memory address
+ * @pdev:		VPU platform device
+ * @dtcm_dmem_addr:	VPU's data memory address
  *
  * Mapping the VPU's DTCM (Data Tightly-Coupled Memory) /
  * DMEM (Data Extended Memory) memory address to
-- 
2.30.1

