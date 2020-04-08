Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 612581A2020
	for <lists+linux-media@lfdr.de>; Wed,  8 Apr 2020 13:48:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728617AbgDHLsl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Apr 2020 07:48:41 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:51278 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728609AbgDHLsk (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Apr 2020 07:48:40 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id 374AA296A51
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     dafna.hirschfeld@collabora.com, helen.koike@collabora.com,
        ezequiel@collabora.com, hverkuil@xs4all.nl, kernel@collabora.com,
        dafna3@gmail.com, sakari.ailus@linux.intel.com,
        linux-rockchip@lists.infradead.org, mchehab@kernel.org,
        laurent.pinchart@ideasonboard.com
Subject: [PATCH v3 5/6] media: staging: rkisp1: cap: support uv swapped plane formats
Date:   Wed,  8 Apr 2020 13:48:21 +0200
Message-Id: <20200408114822.27360-6-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200408114822.27360-1-dafna.hirschfeld@collabora.com>
References: <20200408114822.27360-1-dafna.hirschfeld@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Plane formats with the u and v planes swapped can be
supported by swapping the address of the cb and cr buffers.

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 drivers/staging/media/rkisp1/rkisp1-capture.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/staging/media/rkisp1/rkisp1-capture.c b/drivers/staging/media/rkisp1/rkisp1-capture.c
index 257799a7d865..9f0a3c407286 100644
--- a/drivers/staging/media/rkisp1/rkisp1-capture.c
+++ b/drivers/staging/media/rkisp1/rkisp1-capture.c
@@ -743,6 +743,14 @@ static void rkisp1_vb2_buf_queue(struct vb2_buffer *vb)
 			rkisp1_pixfmt_comp_size(pixm, RKISP1_PLANE_CB);
 	}
 
+	/*
+	 * uv swap can be supported for plane formats by switching
+	 * the address of cb and cr
+	 */
+	if (cap->pix.info->comp_planes == 3 && cap->pix.cfg->uv_swap)
+		swap(ispbuf->buff_addr[RKISP1_PLANE_CR],
+		     ispbuf->buff_addr[RKISP1_PLANE_CB]);
+
 	spin_lock_irqsave(&cap->buf.lock, flags);
 
 	/*
-- 
2.20.1

