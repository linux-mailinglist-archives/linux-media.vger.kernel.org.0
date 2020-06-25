Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6D5420A437
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2020 19:43:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406867AbgFYRnI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Jun 2020 13:43:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406863AbgFYRnI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Jun 2020 13:43:08 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93E38C08C5C1
        for <linux-media@vger.kernel.org>; Thu, 25 Jun 2020 10:43:07 -0700 (PDT)
Received: from localhost.localdomain (p200300cb8737cf00e4140a231ed1025d.dip0.t-ipconnect.de [IPv6:2003:cb:8737:cf00:e414:a23:1ed1:25d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 853972A5760;
        Thu, 25 Jun 2020 18:43:05 +0100 (BST)
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Cc:     dafna.hirschfeld@collabora.com, helen.koike@collabora.com,
        ezequiel@collabora.com, hverkuil@xs4all.nl, kernel@collabora.com,
        dafna3@gmail.com, sakari.ailus@linux.intel.com,
        linux-rockchip@lists.infradead.org, mchehab@kernel.org,
        tfiga@chromium.org
Subject: [PATCH 1/3] media: staging: rkisp1: params: don't reference the vb2 buffer after calling vb2_buffer_done
Date:   Thu, 25 Jun 2020 19:42:55 +0200
Message-Id: <20200625174257.22216-2-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200625174257.22216-1-dafna.hirschfeld@collabora.com>
References: <20200625174257.22216-1-dafna.hirschfeld@collabora.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The driver should not reference the buffer pointer of vb2_buffer
after calling 'vb2_buffer_done' on that buffer since the call passes
the buffer to userspace.

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 drivers/staging/media/rkisp1/rkisp1-params.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/rkisp1/rkisp1-params.c b/drivers/staging/media/rkisp1/rkisp1-params.c
index 797e79de659c..762c2259b807 100644
--- a/drivers/staging/media/rkisp1/rkisp1-params.c
+++ b/drivers/staging/media/rkisp1/rkisp1-params.c
@@ -1457,9 +1457,9 @@ static void rkisp1_params_vb2_buf_queue(struct vb2_buffer *vb)
 		new_params = (struct rkisp1_params_cfg *)
 			(vb2_plane_vaddr(vb, 0));
 		vbuf->sequence = frame_sequence;
-		vb2_buffer_done(&params_buf->vb.vb2_buf, VB2_BUF_STATE_DONE);
 		params->is_first_params = false;
 		params->cur_params = *new_params;
+		vb2_buffer_done(&params_buf->vb.vb2_buf, VB2_BUF_STATE_DONE);
 		return;
 	}
 
-- 
2.17.1

