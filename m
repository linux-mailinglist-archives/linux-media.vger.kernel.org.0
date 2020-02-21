Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 381A6167808
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2020 09:46:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730008AbgBUIph (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 21 Feb 2020 03:45:37 -0500
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:43551 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729591AbgBUIph (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 21 Feb 2020 03:45:37 -0500
Received: from tschai.fritz.box ([46.9.235.248])
        by smtp-cloud8.xs4all.net with ESMTPA
        id 53wBjunHFPKvK53wFjhWPL; Fri, 21 Feb 2020 09:45:35 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1582274735; bh=42b7xae8iAO+KuVPG47I08KuZYY7QuUJ5DBpipC/8Xc=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=WBejs3kOnU1ahPyHPZ7X2tpdA4sodGIUwAX6wfJqWk3HYEif4IBgIIXw/Xf3oLbo5
         8FlmSWxNCBezv67B8wPWrjpQxNwPYgrv+wvqVNKblkxDoMWPz4HttZ+V5ni53NRVzE
         mTw5GXU0tFTQWPEyeR0aaPF3Histi786/x+V/h7nY4tPJnha8AzOeUHoJY6hS0Rzhp
         /FYCx4jC6dCCbW2Eqg99W4q8G5ak531FORuAKcTdgOF5ZuDYiFcktwa6s2pcbrYEOt
         9f9KSLYOIQJDn8YG2eZAqHJp2l5MvwQ6T8YmvZRmNnIqkDqDm6guXIxrVCNkbeJvOe
         jmkj8qyXhYqvg==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [RFC PATCH 2/9] solo6x10: drop VB2_USERPTR
Date:   Fri, 21 Feb 2020 09:45:24 +0100
Message-Id: <20200221084531.576156-3-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200221084531.576156-1-hverkuil-cisco@xs4all.nl>
References: <20200221084531.576156-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfAjnkLiP7q4gZpqplTpKO1fI2iBbMeQqXKDivYFuayAtK838oEK2l/w7lRMJCTMEnYgxY3oatVhS7EIvQ5k6wuKVuM+AgLt+sWUGhSm8h1c85bacquQJ
 La1mzHvPUThJhvxp4DbeWijT4sjk+MVbD4hL64WkyK3N7ExcLR4+6czkr9xhqlXm5Y2q189fe+0kmURrEfjzTt4os+u6kEmC0swWuvJB9/PGEl40COs+yBEh
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The combination of VB2_USERPTR and dma-contig makes no sense for
this device, drop it.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/pci/solo6x10/solo6x10-v4l2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/pci/solo6x10/solo6x10-v4l2.c b/drivers/media/pci/solo6x10/solo6x10-v4l2.c
index 9d290099b7a0..8a5ece6465a2 100644
--- a/drivers/media/pci/solo6x10/solo6x10-v4l2.c
+++ b/drivers/media/pci/solo6x10/solo6x10-v4l2.c
@@ -667,7 +667,7 @@ int solo_v4l2_init(struct solo_dev *solo_dev, unsigned nr)
 	video_set_drvdata(solo_dev->vfd, solo_dev);
 
 	solo_dev->vidq.type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
-	solo_dev->vidq.io_modes = VB2_MMAP | VB2_USERPTR | VB2_READ | VB2_DMABUF;
+	solo_dev->vidq.io_modes = VB2_MMAP | VB2_READ | VB2_DMABUF;
 	solo_dev->vidq.ops = &solo_video_qops;
 	solo_dev->vidq.mem_ops = &vb2_dma_contig_memops;
 	solo_dev->vidq.drv_priv = solo_dev;
-- 
2.25.0

