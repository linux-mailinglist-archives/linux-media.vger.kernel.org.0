Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8066A13DE5B
	for <lists+linux-media@lfdr.de>; Thu, 16 Jan 2020 16:13:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726785AbgAPPNN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Jan 2020 10:13:13 -0500
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:53699 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726559AbgAPPNM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Jan 2020 10:13:12 -0500
X-Originating-IP: 84.44.14.226
Received: from nexussix.ar.arcelik (unknown [84.44.14.226])
        (Authenticated sender: cengiz@kernel.wtf)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 45F97C0006;
        Thu, 16 Jan 2020 15:13:10 +0000 (UTC)
From:   Cengiz Can <cengiz@kernel.wtf>
To:     prabhakar.csengg@gmail.com
Cc:     cengiz@kernel.wtf, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, mchehab@kernel.org
Subject: [PATCH v2] media: davinci: fix incorrect pix_fmt assignment
Date:   Thu, 16 Jan 2020 18:12:30 +0300
Message-Id: <20200116151229.1002224-1-cengiz@kernel.wtf>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <CA+V-a8vowxJhV0FnHA8kGcLPLWLi8Xd7RSTABLDBtu7YpLYg9Q@mail.gmail.com>
References: <CA+V-a8vowxJhV0FnHA8kGcLPLWLi8Xd7RSTABLDBtu7YpLYg9Q@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There's a mistakenly written self assignment in
`static int vpfe_enum_fmt_vid_cap(..)`.

Fixed it according to Prabhakar Lad's feedback.

Signed-off-by: Cengiz Can <cengiz@kernel.wtf>
---
 drivers/media/platform/davinci/vpfe_capture.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/davinci/vpfe_capture.c b/drivers/media/platform/davinci/vpfe_capture.c
index 916ed743d716..357f7ade5218 100644
--- a/drivers/media/platform/davinci/vpfe_capture.c
+++ b/drivers/media/platform/davinci/vpfe_capture.c
@@ -879,7 +879,7 @@ static int vpfe_enum_fmt_vid_cap(struct file *file, void  *priv,
 	/* Fill in the information about format */
 	pix_fmt = vpfe_lookup_pix_format(pix);
 	if (pix_fmt) {
-		fmt->pixelformat = fmt->pixelformat;
+		fmt->pixelformat = pix_fmt->pixelformat;
 		return 0;
 	}
 	return -EINVAL;
--
2.25.0

