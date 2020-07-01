Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 845B6210BEE
	for <lists+linux-media@lfdr.de>; Wed,  1 Jul 2020 15:17:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730705AbgGANQZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Jul 2020 09:16:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729296AbgGANQY (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Jul 2020 09:16:24 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB7DCC03E979;
        Wed,  1 Jul 2020 06:16:23 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id B669F2A56CB
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc:     kernel@collabora.com, Hans Verkuil <hverkuil@xs4all.nl>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH v2 1/6] hantro: h264: Remove unused macro definition
Date:   Wed,  1 Jul 2020 10:16:02 -0300
Message-Id: <20200701131607.121988-2-ezequiel@collabora.com>
X-Mailer: git-send-email 2.26.0.rc2
In-Reply-To: <20200701131607.121988-1-ezequiel@collabora.com>
References: <20200701131607.121988-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The generic H264 reference list builder moved all
the users of this macro, but left the macro.

Remove it.

Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
---
 drivers/staging/media/hantro/hantro_h264.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/media/hantro/hantro_h264.c b/drivers/staging/media/hantro/hantro_h264.c
index d561f125085a..dd935d7009bf 100644
--- a/drivers/staging/media/hantro/hantro_h264.c
+++ b/drivers/staging/media/hantro/hantro_h264.c
@@ -22,8 +22,6 @@
 #define POC_BUFFER_SIZE			34
 #define SCALING_LIST_SIZE		(6 * 16 + 2 * 64)
 
-#define HANTRO_CMP(a, b) ((a) < (b) ? -1 : 1)
-
 /* Data structure describing auxiliary buffer format. */
 struct hantro_h264_dec_priv_tbl {
 	u32 cabac_table[CABAC_INIT_BUFFER_SIZE];
-- 
2.26.0.rc2

