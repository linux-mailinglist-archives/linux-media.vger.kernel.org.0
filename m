Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6FA920A325
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2020 18:39:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404242AbgFYQjM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Jun 2020 12:39:12 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:38414 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404014AbgFYQjM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Jun 2020 12:39:12 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id DD2942A0B8A
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc:     kernel@collabora.com, Hans Verkuil <hverkuil@xs4all.nl>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH 1/6] hantro: h264: Remove unused macro definition
Date:   Thu, 25 Jun 2020 13:35:20 -0300
Message-Id: <20200625163525.5119-2-ezequiel@collabora.com>
X-Mailer: git-send-email 2.26.0.rc2
In-Reply-To: <20200625163525.5119-1-ezequiel@collabora.com>
References: <20200625163525.5119-1-ezequiel@collabora.com>
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

