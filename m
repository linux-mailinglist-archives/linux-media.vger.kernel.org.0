Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D1A6E1386A8
	for <lists+linux-media@lfdr.de>; Sun, 12 Jan 2020 14:34:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732909AbgALNeZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 12 Jan 2020 08:34:25 -0500
Received: from o1.b.az.sendgrid.net ([208.117.55.133]:33060 "EHLO
        o1.b.az.sendgrid.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732906AbgALNeZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 12 Jan 2020 08:34:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
        h=from:subject:to:cc:content-type:content-transfer-encoding;
        s=001; bh=Vfmt7dkvbBigAwgz8sG4IYSWKgS3fXKU6lPN2GEQKp8=;
        b=JjsMBOjctAr0JTSPUxwJD0vAKILKYn1+n6j0uaqLuh4reAQg8ghWpRS2setRRIFUbSJ3
        SvP6ygO+7KeKyI4oaM2LHbfzx5Nvm731Jd3baAVmEtLez+P6h7SCjtfQOXZmCp5OB3Wjni
        XWT/GzqMlfbsAlPvbZMryz4cbf5po+C2E=
Received: by filterdrecv-p3mdw1-56c97568b5-s82th with SMTP id filterdrecv-p3mdw1-56c97568b5-s82th-20-5E1B2060-10
        2020-01-12 13:34:24.375082991 +0000 UTC m=+2292674.349781586
Received: from bionic.localdomain (unknown [98.128.173.80])
        by ismtpd0005p1lon1.sendgrid.net (SG) with ESMTP id ApqllyQDTc-z4HKl0oJsdA
        Sun, 12 Jan 2020 13:34:24.114 +0000 (UTC)
From:   Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH] media: hantro: fix post-processing NULL pointer dereference
Date:   Sun, 12 Jan 2020 13:34:24 +0000 (UTC)
Message-Id: <20200112133421.31874-1-jonas@kwiboo.se>
X-Mailer: git-send-email 2.17.1
X-SG-EID: =?us-ascii?Q?TdbjyGynYnRZWhH+7lKUQJL+ZxmxpowvO2O9SQF5CwCVrYgcwUXgU5DKUU3QxA?=
 =?us-ascii?Q?fZekEeQsTe+RrMu3cja6a0h=2FiZCurcN4M+lq+wk?=
 =?us-ascii?Q?axaPN9BpKZgd=2Fxu7FKn6S6Rx=2F56XeaewiBLdHTi?=
 =?us-ascii?Q?OC4dyyGY19a2EB5Qzl7Wsxfz1syr2vEVv1ZZjgr?=
 =?us-ascii?Q?ERlV8gEC9fsflD2u39mXnjILWgP4BLeGa7wghaV?=
 =?us-ascii?Q?asn7V6eBbE4+Rsr8FE2i+snXvlOyGc32I3hxPHE?=
 =?us-ascii?Q?8lt2RkO0obeOV2jjbckTA=3D=3D?=
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Boris Brezillon <boris.brezillon@collabora.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jonas Karlman <jonas@kwiboo.se>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The RK3399 variant does not have postproc_regs declared,
this can cause a NULL pointer dereference trying to decode:

[   89.331359] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000000

[   89.352804] Call trace:
[   89.353191]  hantro_postproc_disable+0x20/0xe8 [hantro_vpu]
[   89.354056]  hantro_start_prepare_run+0x58/0x68 [hantro_vpu]
[   89.354923]  hantro_h264_dec_prepare_run+0x30/0x6f0 [hantro_vpu]
[   89.355846]  rk3399_vpu_h264_dec_run+0x1c/0x14a8 [hantro_vpu]
[   89.356748]  device_run+0xa4/0xb8 [hantro_vpu]

Fix this by adding a NULL check in hantro_postproc_enable/disable.

Fixes: 8c2d66b036c7 ("media: hantro: Support color conversion via post-processing")
Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
 drivers/staging/media/hantro/hantro_postproc.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/staging/media/hantro/hantro_postproc.c b/drivers/staging/media/hantro/hantro_postproc.c
index b55730011d0c..28a85d301d7f 100644
--- a/drivers/staging/media/hantro/hantro_postproc.c
+++ b/drivers/staging/media/hantro/hantro_postproc.c
@@ -57,6 +57,9 @@ void hantro_postproc_enable(struct hantro_ctx *ctx)
 	u32 src_pp_fmt, dst_pp_fmt;
 	dma_addr_t dst_dma;
 
+	if (!vpu->variant->postproc_regs)
+		return;
+
 	/* Turn on pipeline mode. Must be done first. */
 	HANTRO_PP_REG_WRITE_S(vpu, pipeline_en, 0x1);
 
@@ -138,5 +141,8 @@ void hantro_postproc_disable(struct hantro_ctx *ctx)
 {
 	struct hantro_dev *vpu = ctx->dev;
 
+	if (!vpu->variant->postproc_regs)
+		return;
+
 	HANTRO_PP_REG_WRITE_S(vpu, pipeline_en, 0x0);
 }
-- 
2.17.1

