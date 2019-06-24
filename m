Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 00F6350AD7
	for <lists+linux-media@lfdr.de>; Mon, 24 Jun 2019 14:39:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730307AbfFXMjl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Jun 2019 08:39:41 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:48224 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726811AbfFXMjk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Jun 2019 08:39:40 -0400
Received: from turingmachine.home (unknown [IPv6:2804:431:d719:dd85:d711:794d:1c68:5ed3])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tonyk)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 522552656C4;
        Mon, 24 Jun 2019 13:39:37 +0100 (BST)
From:   =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     mchehab@kernel.org, hverkuil@xs4all.nl, helen.koike@collabora.com,
        kernel@collabora.com, linux-kernel@vger.kernel.org,
        =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@collabora.com>
Subject: [PATCH v2 2/5] media: vimc: stream: fix style of argument description
Date:   Mon, 24 Jun 2019 09:37:26 -0300
Message-Id: <20190624123729.5847-2-andrealmeid@collabora.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190624123729.5847-1-andrealmeid@collabora.com>
References: <20190624123729.5847-1-andrealmeid@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

As in "Function parameters" at doc-guide/kernel-doc.rst, "the
continuation of the description should start at the same column as the
previous line". Make the @producer_pixfmt comply with that.

Signed-off-by: André Almeida <andrealmeid@collabora.com>
---

Changes in v2: none

 drivers/media/platform/vimc/vimc-streamer.h | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/vimc/vimc-streamer.h b/drivers/media/platform/vimc/vimc-streamer.h
index 28c3706e3c21..d744a787e0e7 100644
--- a/drivers/media/platform/vimc/vimc-streamer.h
+++ b/drivers/media/platform/vimc/vimc-streamer.h
@@ -26,10 +26,12 @@
  * @pipe_size:		size of @ved_pipeline
  * @kthread:		thread that generates the frames of the stream.
  * @producer_pixfmt:	the pixel format requested from the pipeline. This must
- * be set just before calling vimc_streamer_s_stream(ent, 1). This value is
- * propagated up to the source of the base image (usually a sensor node) and
- * can be modified by entities during s_stream callback to request a different
- * format from rest of the pipeline.
+ *			be set just before calling
+ *			vimc_streamer_s_stream(ent, 1). This value is propagated
+ *			up to the source of the base image (usually a sensor
+ *			node) and can be modified by entities during s_stream
+ *			callback to request a differentformat from rest of
+ *			the pipeline.
  *
  * When the user call stream_on in a video device, struct vimc_stream is
  * used to keep track of all entities and subdevices that generates and
-- 
2.22.0

