Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CE801FD41E
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2020 20:08:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726950AbgFQSIR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Jun 2020 14:08:17 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:36134 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726861AbgFQSIQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Jun 2020 14:08:16 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id 34AEA2A3CFA
From:   Helen Koike <helen.koike@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     mchehab@kernel.org, dafna.hirschfeld@collabora.com,
        linux-kernel@vger.kernel.org, tfiga@google.com,
        hans.verkuil@cisco.com, kernel@collabora.com,
        Helen Koike <helen.koike@collabora.com>
Subject: [PATCH] media: staging: rkisp1: rsz: fix resolution limitation on sink pad
Date:   Wed, 17 Jun 2020 15:08:01 -0300
Message-Id: <20200617180801.158331-1-helen.koike@collabora.com>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Resizer sink pad is limited by what the ISP can generate.
The configurations describes what the resizer can produce.

This was tested on a Scarlet device with ChromiumOs, where the selfpath
receives 2592x1944 and produces 1600x1200 (which isn't possible without
this fix).

Fixes: 56e3b29f9f6b2 ("media: staging: rkisp1: add streaming paths")
Signed-off-by: Helen Koike <helen.koike@collabora.com>

---

 drivers/staging/media/rkisp1/rkisp1-resizer.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/rkisp1/rkisp1-resizer.c b/drivers/staging/media/rkisp1/rkisp1-resizer.c
index d049374413dcf..0d41f43b5339f 100644
--- a/drivers/staging/media/rkisp1/rkisp1-resizer.c
+++ b/drivers/staging/media/rkisp1/rkisp1-resizer.c
@@ -553,11 +553,11 @@ static void rkisp1_rsz_set_sink_fmt(struct rkisp1_resizer *rsz,
 	src_fmt->code = sink_fmt->code;
 
 	sink_fmt->width = clamp_t(u32, format->width,
-				  rsz->config->min_rsz_width,
-				  rsz->config->max_rsz_width);
+				  RKISP1_ISP_MIN_WIDTH,
+				  RKISP1_ISP_MAX_WIDTH);
 	sink_fmt->height = clamp_t(u32, format->height,
-				   rsz->config->min_rsz_height,
-				   rsz->config->max_rsz_height);
+				  RKISP1_ISP_MIN_HEIGHT,
+				  RKISP1_ISP_MAX_HEIGHT);
 
 	*format = *sink_fmt;
 
-- 
2.26.0

