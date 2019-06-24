Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AA3B250AE2
	for <lists+linux-media@lfdr.de>; Mon, 24 Jun 2019 14:40:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727962AbfFXMji (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Jun 2019 08:39:38 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:48218 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726811AbfFXMji (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Jun 2019 08:39:38 -0400
Received: from turingmachine.home (unknown [IPv6:2804:431:d719:dd85:d711:794d:1c68:5ed3])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tonyk)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 1BF21260ED4;
        Mon, 24 Jun 2019 13:39:33 +0100 (BST)
From:   =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     mchehab@kernel.org, hverkuil@xs4all.nl, helen.koike@collabora.com,
        kernel@collabora.com, linux-kernel@vger.kernel.org,
        =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@collabora.com>
Subject: [PATCH v2 1/5] media: vimc: stream: remove obsolete function doc
Date:   Mon, 24 Jun 2019 09:37:25 -0300
Message-Id: <20190624123729.5847-1-andrealmeid@collabora.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

As a more complete version of vimc_streamer_s_streamer comment was added
at "media: vimc: stream: add missing function documentation" commit in
.c file, remove the old documentation from .h file.

Signed-off-by: André Almeida <andrealmeid@collabora.com>
---

Changes in v2: none

 drivers/media/platform/vimc/vimc-streamer.h | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/media/platform/vimc/vimc-streamer.h b/drivers/media/platform/vimc/vimc-streamer.h
index 2b3667408794..28c3706e3c21 100644
--- a/drivers/media/platform/vimc/vimc-streamer.h
+++ b/drivers/media/platform/vimc/vimc-streamer.h
@@ -43,14 +43,6 @@ struct vimc_stream {
 	u32 producer_pixfmt;
 };
 
-/**
- * vimc_streamer_s_streamer - start/stop the stream
- *
- * @stream:	the pointer to the stream to start or stop
- * @ved:	The last entity of the streamer pipeline
- * @enable:	any non-zero number start the stream, zero stop
- *
- */
 int vimc_streamer_s_stream(struct vimc_stream *stream,
 			   struct vimc_ent_device *ved,
 			   int enable);
-- 
2.22.0

