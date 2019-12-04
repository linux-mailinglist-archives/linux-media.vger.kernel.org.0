Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 18571112D43
	for <lists+linux-media@lfdr.de>; Wed,  4 Dec 2019 15:12:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727900AbfLDOME (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Dec 2019 09:12:04 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:57704 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727828AbfLDOME (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 Dec 2019 09:12:04 -0500
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1icVNn-0002Ao-Sz; Wed, 04 Dec 2019 14:11:59 +0000
From:   Colin King <colin.king@canonical.com>
To:     Maxime Jourdan <mjourdan@baylibre.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
        devel@driverdev.osuosl.org, linux-arm-kernel@lists.infradead.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] media: meson: add missing allocation failure check on new_buf
Date:   Wed,  4 Dec 2019 14:11:59 +0000
Message-Id: <20191204141159.1432387-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently if the allocation of new_buf fails then a null pointer
dereference occurs when assiging new_buf->vb. Avoid this by returning
early on a memory allocation failure as there is not much more can
be done at this point.

Addresses-Coverity: ("Dereference null return")
Fixes: 3e7f51bd9607 ("media: meson: add v4l2 m2m video decoder driver")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/media/meson/vdec/vdec.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
index 0a1a04fd5d13..8dd1396909d7 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -133,6 +133,8 @@ vdec_queue_recycle(struct amvdec_session *sess, struct vb2_buffer *vb)
 	struct amvdec_buffer *new_buf;
 
 	new_buf = kmalloc(sizeof(*new_buf), GFP_KERNEL);
+	if (!new_buf)
+		return;
 	new_buf->vb = vb;
 
 	mutex_lock(&sess->bufs_recycle_lock);
-- 
2.24.0

