Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36E343252A4
	for <lists+linux-media@lfdr.de>; Thu, 25 Feb 2021 16:45:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231326AbhBYPog (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Feb 2021 10:44:36 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:41816 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232949AbhBYPoO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Feb 2021 10:44:14 -0500
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1lFInX-0008CH-Ee; Thu, 25 Feb 2021 15:43:27 +0000
From:   Colin King <colin.king@canonical.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] media: vivid: fix assignment of dev->fbuf_out_flags
Date:   Thu, 25 Feb 2021 15:43:27 +0000
Message-Id: <20210225154327.975877-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently the chroma_flags and alpha_flags are being zero'd with a bit-wise
mask and the following statement should be bit-wise or'ing in the new flag
bits but instead is making a direct assignment.  Fix this by using the |=
operator rather than an assignment.

Addresses-Coverity: ("Unused value")
Fixes: ef834f7836ec ("[media] vivid: add the video capture and output parts")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/media/test-drivers/vivid/vivid-vid-out.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/test-drivers/vivid/vivid-vid-out.c b/drivers/media/test-drivers/vivid/vivid-vid-out.c
index ac1e981e8342..9f731f085179 100644
--- a/drivers/media/test-drivers/vivid/vivid-vid-out.c
+++ b/drivers/media/test-drivers/vivid/vivid-vid-out.c
@@ -1021,7 +1021,7 @@ int vivid_vid_out_s_fbuf(struct file *file, void *fh,
 		return -EINVAL;
 	}
 	dev->fbuf_out_flags &= ~(chroma_flags | alpha_flags);
-	dev->fbuf_out_flags = a->flags & (chroma_flags | alpha_flags);
+	dev->fbuf_out_flags |= a->flags & (chroma_flags | alpha_flags);
 	return 0;
 }
 
-- 
2.30.0

