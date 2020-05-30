Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0470C1E8E4E
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2020 08:56:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728891AbgE3G4J (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 30 May 2020 02:56:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:44910 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728828AbgE3G4G (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 30 May 2020 02:56:06 -0400
Received: from mail.kernel.org (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 54BFF21548;
        Sat, 30 May 2020 06:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590821763;
        bh=uBy5kxUajtC2nsXNNqnEPQCQYgSHTgqmWl9q6BG1w+c=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=eVFf0bLCQcx9K2JTTup5hWA4ExhQnv1ZLK4zjSbx7xSUv7sivRyI2wMDCQK0rCP7u
         4VkDzKpzohGnaaxugyqevo0dqgtUU9urFmXsEt8leXXRxJak/FXsPMP7NXbNqIxr6i
         AkmUzFi8QdvLgxs4uW0tDiH5FQ36Wbth6rDWarU0=
Received: from mchehab by mail.kernel.org with local (Exim 4.93)
        (envelope-from <mchehab@kernel.org>)
        id 1jevPV-001hpT-8O; Sat, 30 May 2020 08:56:01 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 18/41] media: atomisp: add more comments about frame allocation
Date:   Sat, 30 May 2020 08:55:35 +0200
Message-Id: <08a91029efbeccc3d7f9114bb435a02b67112ab8.1590821410.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1590821410.git.mchehab+huawei@kernel.org>
References: <cover.1590821410.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The frame allocation logic happens differently for userptr
or normal mmap. On a quick look, this sounded to be unbalanced,
but the logic should actually work for both cases.

Add an extra comment to reflect it.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/staging/media/atomisp/pci/atomisp_ioctl.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index 8783d4b59f6d..765e1a8c31fa 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -1052,7 +1052,7 @@ int __atomisp_reqbufs(struct file *file, void *fh,
 	atomisp_alloc_css_stat_bufs(asd, stream_id);
 
 	/*
-	 * for user pointer type, buffers are not really allcated here,
+	 * for user pointer type, buffers are not really allocated here,
 	 * buffers are setup in QBUF operation through v4l2_buffer structure
 	 */
 	if (req->memory == V4L2_MEMORY_USERPTR)
@@ -1225,6 +1225,10 @@ static int atomisp_qbuf(struct file *file, void *fh, struct v4l2_buffer *buf)
 		buf->flags |= V4L2_BUF_FLAG_MAPPED;
 		buf->flags |= V4L2_BUF_FLAG_QUEUED;
 		buf->flags &= ~V4L2_BUF_FLAG_DONE;
+
+		/*
+		 * For mmap, frames were allocated at request buffers
+		 */
 	}
 
 done:
-- 
2.26.2

