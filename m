Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2DF84139767
	for <lists+linux-media@lfdr.de>; Mon, 13 Jan 2020 18:21:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728665AbgAMRVR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Jan 2020 12:21:17 -0500
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:39865 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727331AbgAMRVR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Jan 2020 12:21:17 -0500
X-Originating-IP: 84.44.14.226
Received: from nexussix.ar.arcelik (unknown [84.44.14.226])
        (Authenticated sender: cengiz@kernel.wtf)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 75805FF802;
        Mon, 13 Jan 2020 17:21:13 +0000 (UTC)
From:   Cengiz Can <cengiz@kernel.wtf>
To:     "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Cengiz Can <cengiz@kernel.wtf>
Subject: [PATCH] media: davinci: remove self assignment in vpfe
Date:   Mon, 13 Jan 2020 20:20:39 +0300
Message-Id: <20200113172038.99689-1-cengiz@kernel.wtf>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There's a self assignment which has no effect.

Removed self assignment.

Signed-off-by: Cengiz Can <cengiz@kernel.wtf>
---
 drivers/media/platform/davinci/vpfe_capture.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/platform/davinci/vpfe_capture.c b/drivers/media/platform/davinci/vpfe_capture.c
index 916ed743d716..089648665cdf 100644
--- a/drivers/media/platform/davinci/vpfe_capture.c
+++ b/drivers/media/platform/davinci/vpfe_capture.c
@@ -879,7 +879,6 @@ static int vpfe_enum_fmt_vid_cap(struct file *file, void  *priv,
 	/* Fill in the information about format */
 	pix_fmt = vpfe_lookup_pix_format(pix);
 	if (pix_fmt) {
-		fmt->pixelformat = fmt->pixelformat;
 		return 0;
 	}
 	return -EINVAL;
--
2.24.1

