Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 83BFC16780B
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2020 09:46:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730347AbgBUIpk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 21 Feb 2020 03:45:40 -0500
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:50813 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729994AbgBUIph (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 21 Feb 2020 03:45:37 -0500
Received: from tschai.fritz.box ([46.9.235.248])
        by smtp-cloud8.xs4all.net with ESMTPA
        id 53wBjunHFPKvK53wGjhWPV; Fri, 21 Feb 2020 09:45:36 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1582274736; bh=F0BcfgjXmB5Dq9o20oQkpuO3OvUaODzAj+fLpSI7jX8=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=O8y2n3xI2IhcF0hcxoTRMKje6/fgW+cWgA90ig7lGsrRS+V7avxO9SksutB1PcYm9
         r43iAwpnbmDxLo3MuMGjyGIhRm+roP/3kjSfP3CXZ30bHV1dFSfPmmD03RvbqBqVrA
         kaYV+HDrayDnZfpwJ2LOcHDLpUOyRf2iKrW6FwyBmTCIdMMXFJKI6Bn0pcsv+WnO03
         3Rn3pUz/X04OkIGKgrWsNpWo3Kq68Da/xgY89g/HPkKo/i7ZYqR88rhRfOhaSRTenf
         JAdWJdEDWQxXM1t8kCs6Vd/zhi0S1e9P89NqTwV+tfIQjxrAnl50ldJr4awpUdL6Pr
         P6CCpeI3+WBJg==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [RFC PATCH 4/9] mcam-core: drop VB2_USERPTR
Date:   Fri, 21 Feb 2020 09:45:26 +0100
Message-Id: <20200221084531.576156-5-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200221084531.576156-1-hverkuil-cisco@xs4all.nl>
References: <20200221084531.576156-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfGcgdw4u9Rg0DAWnSUTC0QvuVZRsy30RtBoXNufPK0a4jLMYJ/tgTtT8XLz8u0/37Ughovra1jev9eIJPG2MfC/phhjbuUY5B9uNBd2N+FfHCbYmRpPD
 N8RGlmMLvOuWatgRKA+lrvnCjmpBhSBNfmUlcaxT+Lt7iaQKNKWNQEZqKZbwGYfaboAp27fr8+yAQwLlYX0A/dmJ6dIVFFAJ+1DZNoAEHlpg1VOmLvtDOfTf
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The combination of VB2_USERPTR and dma-contig makes no sense for
this device, drop it.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/platform/marvell-ccic/mcam-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/marvell-ccic/mcam-core.c b/drivers/media/platform/marvell-ccic/mcam-core.c
index 803baf97f06e..4450307ae654 100644
--- a/drivers/media/platform/marvell-ccic/mcam-core.c
+++ b/drivers/media/platform/marvell-ccic/mcam-core.c
@@ -1300,7 +1300,7 @@ static int mcam_setup_vb2(struct mcam_camera *cam)
 	vq->drv_priv = cam;
 	vq->lock = &cam->s_mutex;
 	vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
-	vq->io_modes = VB2_MMAP | VB2_USERPTR | VB2_DMABUF | VB2_READ;
+	vq->io_modes = VB2_MMAP | VB2_DMABUF | VB2_READ;
 	vq->buf_struct_size = sizeof(struct mcam_vb_buffer);
 	vq->dev = cam->dev;
 	INIT_LIST_HEAD(&cam->buffers);
-- 
2.25.0

