Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A471B3038A
	for <lists+linux-media@lfdr.de>; Thu, 30 May 2019 22:48:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726593AbfE3Ure (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 May 2019 16:47:34 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:47089 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726125AbfE3Ure (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 May 2019 16:47:34 -0400
Received: by mail-pl1-f194.google.com with SMTP id e5so1288843pls.13;
        Thu, 30 May 2019 13:47:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nFIRytH7aMnjv5Dd67Kdi8+HL3lJPCu+7kfNtuSjMTo=;
        b=JCOp93MZ2r6mhkO3ypr7kco81GNewMSF8KrRjgKm9SQ7DIf66Ulc3OI8dtkId6ZV1/
         KYxb/ywJq/HXBc4p/0iEI9OT+zuXphmmdtAzwBQQcCUYOCUZ52JauiK8WvDuB6ji/+ed
         DUXf8YhD7xF+FPeOEkp7CMmr6QsqH7N7a3r7R7JnfEmO7HD65NwFDB33mRvDgZwmpfxq
         iU8/6Cb3uj7+QAgV/qbxEztmI/yTxS2FaKsGdlS3bP0vtdsP4oh6DlKMv7ZL8epOI7gA
         RuweFgwaz4jZs6WfPXWApOttmovw6AXN6OLnfTF8Q20cckzRy9tOHLqMWuy8D8RlRjxb
         M2VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nFIRytH7aMnjv5Dd67Kdi8+HL3lJPCu+7kfNtuSjMTo=;
        b=G0FDaAsuUGgZAEfxpM6aKqKfeqlaDRUAoRvbqjyl27Zvq7AKG7l6LR0ZRqHUtSXk7T
         Ix4RBhI9o5JpZqbqyMonPa/Ne0aqziYA/1iLlhFUIcUWsAVVSTcfalU5B/eEflP466xP
         ZI5aH1He0yhCtME1En6pDXxLH5FzY/y8WaArqvT16v1J6VyHNbcAJmE+fsLmA7E/63yw
         qB+5YflUKNSJBeUg/+48mmlHjcVCGfuDgt+uvLYSnRp9OGu2tB5WmMCYGsaC/ihlBUSN
         5oxIgpYH70DejjaP09kwvnIPTU1XtKlPpAPIAMGQhi2lpaReTTvqqPZm4H5FDyuLkIFz
         n+iQ==
X-Gm-Message-State: APjAAAWEoqOXN80WiXNXWu8OH09lGiYgAPInB+3QHU68T1yMJMoEHc63
        FjjyFusvXdX9pK509NTct4s=
X-Google-Smtp-Source: APXvYqyHkfDtsyYv8qocg4EROD6AMYRWQSKfYTK6Q/00RxRI16g3FJcKy7i4RETHuFOR3KhyoGjccg==
X-Received: by 2002:a17:902:6ac4:: with SMTP id i4mr5137585plt.75.1559249253937;
        Thu, 30 May 2019 13:47:33 -0700 (PDT)
Received: from localhost.localdomain ([47.15.209.13])
        by smtp.gmail.com with ESMTPSA id f4sm3672409pfn.118.2019.05.30.13.47.29
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 30 May 2019 13:47:33 -0700 (PDT)
From:   Nishka Dasgupta <nishkadg.linux@gmail.com>
To:     hans.verkuil@cisco.com, mchehab@kernel.org,
        gregkh@linuxfoundation.org, code@wizofe.uk, ezequiel@collabora.com,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org
Cc:     Nishka Dasgupta <nishkadg.linux@gmail.com>
Subject: [PATCH] staging: media: davinci_vpfe: Remove variable vpfe_dev
Date:   Fri, 31 May 2019 02:17:18 +0530
Message-Id: <20190530204718.29892-1-nishkadg.linux@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Remove variable vpfe_dev and replace it with its value (since the
function otherwise uses values directly instead of local variables).
Issue found with Coccinelle.

Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>
---
 drivers/staging/media/davinci_vpfe/vpfe_video.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/davinci_vpfe/vpfe_video.c b/drivers/staging/media/davinci_vpfe/vpfe_video.c
index 510202a3b091..8927b744b13e 100644
--- a/drivers/staging/media/davinci_vpfe/vpfe_video.c
+++ b/drivers/staging/media/davinci_vpfe/vpfe_video.c
@@ -448,7 +448,6 @@ vpfe_video_get_next_buffer(struct vpfe_video_device *video)
 /* schedule the next buffer which is available on dma queue */
 void vpfe_video_schedule_next_buffer(struct vpfe_video_device *video)
 {
-	struct vpfe_device *vpfe_dev = video->vpfe_dev;
 	unsigned long addr;
 
 	if (list_empty(&video->dma_queue))
@@ -463,19 +462,18 @@ void vpfe_video_schedule_next_buffer(struct vpfe_video_device *video)
 	list_del(&video->next_frm->list);
 	video->next_frm->vb.vb2_buf.state = VB2_BUF_STATE_ACTIVE;
 	addr = vb2_dma_contig_plane_dma_addr(&video->next_frm->vb.vb2_buf, 0);
-	video->ops->queue(vpfe_dev, addr);
+	video->ops->queue(video->vpfe_dev, addr);
 	video->state = VPFE_VIDEO_BUFFER_QUEUED;
 }
 
 /* schedule the buffer for capturing bottom field */
 void vpfe_video_schedule_bottom_field(struct vpfe_video_device *video)
 {
-	struct vpfe_device *vpfe_dev = video->vpfe_dev;
 	unsigned long addr;
 
 	addr = vb2_dma_contig_plane_dma_addr(&video->cur_frm->vb.vb2_buf, 0);
 	addr += video->field_off;
-	video->ops->queue(vpfe_dev, addr);
+	video->ops->queue(video->vpfe_dev, addr);
 }
 
 /* make buffer available for dequeue */
-- 
2.19.1

