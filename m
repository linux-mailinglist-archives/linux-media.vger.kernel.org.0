Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E22221158F
	for <lists+linux-media@lfdr.de>; Thu,  2 Jul 2020 00:01:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727853AbgGAWB3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Jul 2020 18:01:29 -0400
Received: from o1.b.az.sendgrid.net ([208.117.55.133]:60784 "EHLO
        o1.b.az.sendgrid.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727768AbgGAWB2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Jul 2020 18:01:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
        h=from:subject:in-reply-to:references:to:cc:content-type:
        content-transfer-encoding;
        s=001; bh=xxBcOYWt9uzoWsnklEsOL7RvonYUzi+J+0wqGYzLRTw=;
        b=Mw7RrWX0ZzLNqhzpSj0DlF01JA8dDQdPDLDKqgJwZUi4Umu4Fbsn+h1NojdMRLTvYg2t
        wbvscc5bLknO1zPep+RnYqS0TaB89bExoP9RLqBCmuNj0SmebvrdpgaptHex9KTl2Cu1Zf
        iGzsoyLwoX8K0FXqkukJyThYge6WuyO9g=
Received: by filterdrecv-p3iad2-5b55dcd864-xnspw with SMTP id filterdrecv-p3iad2-5b55dcd864-xnspw-17-5EFD0688-6
        2020-07-01 21:56:24.205538858 +0000 UTC m=+449220.630116891
Received: from bionic.localdomain (unknown)
        by ismtpd0001p1lon1.sendgrid.net (SG) with ESMTP
        id 9_xgV5kdRsyJnw_SpztECA
        Wed, 01 Jul 2020 21:56:23.947 +0000 (UTC)
From:   Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH 8/9] media: rkvdec: Add validate_fmt ops for pixelformat
 validation
Date:   Wed, 01 Jul 2020 21:56:24 +0000 (UTC)
Message-Id: <20200701215616.30874-9-jonas@kwiboo.se>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200701215616.30874-1-jonas@kwiboo.se>
References: <20200701215616.30874-1-jonas@kwiboo.se>
X-SG-EID: =?us-ascii?Q?TdbjyGynYnRZWhH+7lKUQJL+ZxmxpowvO2O9SQF5CwCVrYgcwUXgU5DKUU3QxA?=
 =?us-ascii?Q?fZekEeQsTe+RrMu3cja6a0h+lXJzeJhqDHpvcg8?=
 =?us-ascii?Q?AJotR+LFDFZT1dM6SQR+PgjpaKMikyyPoncZva0?=
 =?us-ascii?Q?UczSXisuYUKmaKw2JKm4vH5YXbIqJHPX9uLfPo1?=
 =?us-ascii?Q?bK=2FbslKbkXH3sNgiTkY0IMHIMvH6LizCzv44pKF?=
 =?us-ascii?Q?8JjILwfJ6Avyxd0EAryr0yIiHQnQhRrXQHsn7Qm?=
 =?us-ascii?Q?47ZBUfYyQ0ggQUQxHDWbQ=3D=3D?=
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

Add an optional validate_fmt operation that is used to validate the
pixelformat of CAPTURE buffers.

This is used in next patch to ensure correct pixelformat is used for 10-bit
and 4:2:2 content.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
 drivers/staging/media/rkvdec/rkvdec.c | 8 ++++++++
 drivers/staging/media/rkvdec/rkvdec.h | 1 +
 2 files changed, 9 insertions(+)

diff --git a/drivers/staging/media/rkvdec/rkvdec.c b/drivers/staging/media/rkvdec/rkvdec.c
index b1de55aa6535..465444c58f13 100644
--- a/drivers/staging/media/rkvdec/rkvdec.c
+++ b/drivers/staging/media/rkvdec/rkvdec.c
@@ -239,6 +239,14 @@ static int rkvdec_try_capture_fmt(struct file *file, void *priv,
 	if (WARN_ON(!coded_desc))
 		return -EINVAL;
 
+	if (coded_desc->ops->validate_fmt) {
+		int ret;
+
+		ret = coded_desc->ops->validate_fmt(ctx, pix_mp->pixelformat);
+		if (ret)
+			return ret;
+	}
+
 	for (i = 0; i < coded_desc->num_decoded_fmts; i++) {
 		if (coded_desc->decoded_fmts[i] == pix_mp->pixelformat)
 			break;
diff --git a/drivers/staging/media/rkvdec/rkvdec.h b/drivers/staging/media/rkvdec/rkvdec.h
index 2fc9f46b6910..be4fc3645cde 100644
--- a/drivers/staging/media/rkvdec/rkvdec.h
+++ b/drivers/staging/media/rkvdec/rkvdec.h
@@ -64,6 +64,7 @@ vb2_to_rkvdec_decoded_buf(struct vb2_buffer *buf)
 struct rkvdec_coded_fmt_ops {
 	int (*adjust_fmt)(struct rkvdec_ctx *ctx,
 			  struct v4l2_format *f);
+	int (*validate_fmt)(struct rkvdec_ctx *ctx, u32 pixelformat);
 	int (*start)(struct rkvdec_ctx *ctx);
 	void (*stop)(struct rkvdec_ctx *ctx);
 	int (*run)(struct rkvdec_ctx *ctx);
-- 
2.17.1

