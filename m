Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7138721611C
	for <lists+linux-media@lfdr.de>; Mon,  6 Jul 2020 23:57:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727817AbgGFVyi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Jul 2020 17:54:38 -0400
Received: from o1.b.az.sendgrid.net ([208.117.55.133]:38039 "EHLO
        o1.b.az.sendgrid.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727098AbgGFVyh (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Jul 2020 17:54:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
        h=from:subject:in-reply-to:references:to:cc:content-type:
        content-transfer-encoding;
        s=001; bh=3CQUn2PVnW9X4yx0d9/3EzKXGgYmdWlnwnt1CztSmW0=;
        b=i61qMz44kVFyABbirdM2EF8Jyzb44X8XPtXarmhQL879GU1X0fXluEIb//DemiFh5ROO
        ZW+V/BOsglT7Mdzutu+Ylp7JsuCWqoXQaKUHsQ/FfsZWH3Gb93Mq1JfJKt6q2r2sfeUlQn
        C7PjOdWu7UsZZ40yqdPoEOoqZJt48eyJ4=
Received: by filterdrecv-p3iad2-5b55dcd864-n86tl with SMTP id filterdrecv-p3iad2-5b55dcd864-n86tl-21-5F039D9C-3C
        2020-07-06 21:54:36.626597881 +0000 UTC m=+881120.392039716
Received: from bionic.localdomain (unknown)
        by ismtpd0008p1lon1.sendgrid.net (SG) with ESMTP
        id F70ZXhhbSZ6A7Rdnhu03sw
        Mon, 06 Jul 2020 21:54:36.378 +0000 (UTC)
From:   Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH v2 08/12] media: rkvdec: h264: Use bytesperline and buffer
 height to calculate stride
Date:   Mon, 06 Jul 2020 21:54:36 +0000 (UTC)
Message-Id: <20200706215430.22859-9-jonas@kwiboo.se>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200706215430.22859-1-jonas@kwiboo.se>
References: <20200701215616.30874-1-jonas@kwiboo.se>
 <20200706215430.22859-1-jonas@kwiboo.se>
X-SG-EID: =?us-ascii?Q?TdbjyGynYnRZWhH+7lKUQJL+ZxmxpowvO2O9SQF5CwCVrYgcwUXgU5DKUU3QxA?=
 =?us-ascii?Q?fZekEeQsTe+RrMu3cja6a0h9ohZspGJZfMni=2Ffz?=
 =?us-ascii?Q?fWWRa+I4LBx+40cubwsiXB2hHCNd1DojwFpL+Ir?=
 =?us-ascii?Q?i5OLgLH8uykEtrqZ2jmg9+1iGqlJnYZ+Myirhs0?=
 =?us-ascii?Q?3kOYhGIbk0UpihSYPRDqSQ+gpOtL=2FQ8YZaKhU4l?=
 =?us-ascii?Q?T5Z5ChyOkDGOmFjPt3RDYqLoA6e4I+q7CTaVMrC?=
 =?us-ascii?Q?=2FCGyCo2Jk6KbFzzVrRsnw=3D=3D?=
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
that is signaled to userspace matches what is configured in HW.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
Changes in v2:
- Drop code refactoring
---
 drivers/staging/media/rkvdec/rkvdec-h264.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/media/rkvdec/rkvdec-h264.c b/drivers/staging/media/rkvdec/rkvdec-h264.c
index 3a85545bcb38..10756b9d6118 100644
--- a/drivers/staging/media/rkvdec/rkvdec-h264.c
+++ b/drivers/staging/media/rkvdec/rkvdec-h264.c
@@ -891,9 +891,9 @@ static void config_registers(struct rkvdec_ctx *ctx,
 	dma_addr_t rlc_addr;
 	dma_addr_t refer_addr;
 	u32 rlc_len;
-	u32 hor_virstride = 0;
-	u32 ver_virstride = 0;
-	u32 y_virstride = 0;
+	u32 hor_virstride;
+	u32 ver_virstride;
+	u32 y_virstride;
 	u32 yuv_virstride = 0;
 	u32 offset;
 	dma_addr_t dst_addr;
@@ -904,8 +904,8 @@ static void config_registers(struct rkvdec_ctx *ctx,
 
 	f = &ctx->decoded_fmt;
 	dst_fmt = &f->fmt.pix_mp;
-	hor_virstride = (sps->bit_depth_luma_minus8 + 8) * dst_fmt->width / 8;
-	ver_virstride = round_up(dst_fmt->height, 16);
+	hor_virstride = dst_fmt->plane_fmt[0].bytesperline;
+	ver_virstride = dst_fmt->height;
 	y_virstride = hor_virstride * ver_virstride;
 
 	if (sps->chroma_format_idc == 0)
-- 
2.17.1

