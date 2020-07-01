Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9EE7621158E
	for <lists+linux-media@lfdr.de>; Thu,  2 Jul 2020 00:01:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727849AbgGAWB2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Jul 2020 18:01:28 -0400
Received: from o1.b.az.sendgrid.net ([208.117.55.133]:17447 "EHLO
        o1.b.az.sendgrid.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727797AbgGAWB1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Jul 2020 18:01:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
        h=from:subject:in-reply-to:references:to:cc:content-type:
        content-transfer-encoding;
        s=001; bh=/kf+DgEQfccGmOQpRGQluHKkxKxHGjeyjl28PXeTLHA=;
        b=fbJOow/Kyq6m/BaOllNH7UijxKvDyqrzXueyGElviEkhkSruFOOBOy7ENfJi/e18UEc8
        8mPpVZQM+WRsHUCvtpHPw6nEbkpguHiuHdZU+viJ4vecZ92kbz3DOwd2pJMyS6SHkK3Ld/
        1M4NF/+9DHJl7Hp9qhiQNQuKeZGSSji/A=
Received: by filterdrecv-p3iad2-5b55dcd864-622mb with SMTP id filterdrecv-p3iad2-5b55dcd864-622mb-16-5EFD0687-3E
        2020-07-01 21:56:23.740186832 +0000 UTC m=+449224.049633056
Received: from bionic.localdomain (unknown)
        by ismtpd0001p1lon1.sendgrid.net (SG) with ESMTP
        id Kl5Ab2oCTJay-_iVs6EVRw
        Wed, 01 Jul 2020 21:56:23.480 +0000 (UTC)
From:   Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH 7/9] media: rkvdec: h264: Use bytesperline and buffer height
 to calculate stride
Date:   Wed, 01 Jul 2020 21:56:23 +0000 (UTC)
Message-Id: <20200701215616.30874-8-jonas@kwiboo.se>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200701215616.30874-1-jonas@kwiboo.se>
References: <20200701215616.30874-1-jonas@kwiboo.se>
X-SG-EID: =?us-ascii?Q?TdbjyGynYnRZWhH+7lKUQJL+ZxmxpowvO2O9SQF5CwCVrYgcwUXgU5DKUU3QxA?=
 =?us-ascii?Q?fZekEeQsTe+RrMu3cja6a0h9JlvUyM0eNLDAPYx?=
 =?us-ascii?Q?UCjj2=2F7+awfXtB3T1u=2FXc+vBDSChPf5Kecrrq3+?=
 =?us-ascii?Q?NUvAeCoaMUEJlCOUreeFM8hfV8q7NFJgZ2Klc6R?=
 =?us-ascii?Q?OXUHhHyoSjGCn2WSFSF0g+guFAhi=2F3yYgGTd=2FNg?=
 =?us-ascii?Q?uDGU8pM0az2NYn8oaheaDVFxm6aeKBvVfrUawPk?=
 =?us-ascii?Q?eCuTwIixdahjl6VDVoptg=3D=3D?=
To:     linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc:     Jonas Karlman <jonas@kwiboo.se>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Alexandre Courbot <acourbot@chromium.org>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use bytesperline and buffer height to calculate the strides configured.

This does not really change anything other than ensuring the bytesperline
that is signaled to userspace matches was is configured in HW.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
 drivers/staging/media/rkvdec/rkvdec-h264.c | 27 +++++++++++++---------
 1 file changed, 16 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/media/rkvdec/rkvdec-h264.c b/drivers/staging/media/rkvdec/rkvdec-h264.c
index 9c8e49642cd9..1cb6af590138 100644
--- a/drivers/staging/media/rkvdec/rkvdec-h264.c
+++ b/drivers/staging/media/rkvdec/rkvdec-h264.c
@@ -891,10 +891,11 @@ static void config_registers(struct rkvdec_ctx *ctx,
 	dma_addr_t rlc_addr;
 	dma_addr_t refer_addr;
 	u32 rlc_len;
-	u32 hor_virstride = 0;
-	u32 ver_virstride = 0;
-	u32 y_virstride = 0;
-	u32 yuv_virstride = 0;
+	u32 hor_virstride;
+	u32 ver_virstride;
+	u32 y_virstride;
+	u32 uv_virstride;
+	u32 yuv_virstride;
 	u32 offset;
 	dma_addr_t dst_addr;
 	u32 reg, i;
@@ -904,16 +905,20 @@ static void config_registers(struct rkvdec_ctx *ctx,
 
 	f = &ctx->decoded_fmt;
 	dst_fmt = &f->fmt.pix_mp;
-	hor_virstride = (sps->bit_depth_luma_minus8 + 8) * dst_fmt->width / 8;
-	ver_virstride = round_up(dst_fmt->height, 16);
+	hor_virstride = dst_fmt->plane_fmt[0].bytesperline;
+	ver_virstride = dst_fmt->height;
 	y_virstride = hor_virstride * ver_virstride;
 
-	if (sps->chroma_format_idc == 0)
-		yuv_virstride = y_virstride;
-	else if (sps->chroma_format_idc == 1)
-		yuv_virstride += y_virstride + y_virstride / 2;
+	if (sps->chroma_format_idc == 1)
+		uv_virstride = y_virstride / 2;
 	else if (sps->chroma_format_idc == 2)
-		yuv_virstride += 2 * y_virstride;
+		uv_virstride = y_virstride;
+	else if (sps->chroma_format_idc == 3)
+		uv_virstride = 2 * y_virstride;
+	else
+		uv_virstride = 0;
+
+	yuv_virstride = y_virstride + uv_virstride;
 
 	reg = RKVDEC_Y_HOR_VIRSTRIDE(hor_virstride / 16) |
 	      RKVDEC_UV_HOR_VIRSTRIDE(hor_virstride / 16) |
-- 
2.17.1

