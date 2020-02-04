Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E6FA2152042
	for <lists+linux-media@lfdr.de>; Tue,  4 Feb 2020 19:13:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727442AbgBDSNM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Feb 2020 13:13:12 -0500
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:40409 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727361AbgBDSNL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 4 Feb 2020 13:13:11 -0500
Received: from [192.168.2.10] ([46.9.235.248])
        by smtp-cloud9.xs4all.net with ESMTPA
        id z2h8iucc82Mf2z2hBiba7g; Tue, 04 Feb 2020 19:13:09 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1580839989; bh=SCZLPeg4KcvMQcqzhOZt+G/n1eNM1/ECRob+23uHIX4=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=k2yNKHsMvSPv/x4Y4xW1chEOq5Klo+lG68Nf/m0gpBPVqNqRCWHHPXZSYaEET6H35
         YTET/KTAwekzdpo1p4ThgC3waS98Csl6gXjg1CBuUlTQZkDbBLQKh1aDqDuFtZ5A9n
         3ibS1tB8Lt7QbHj0/VxHw/cO8XXexseFOzZn91amZ1a8lf3UcDhST1uCCiHsaVRfFZ
         nlxtfAdRJWrQOCXJ8xR2M9YT4wonYcZP9nyzg2dw1OF1QPXQ7oscox+YYm/dSqgAze
         /UeSGkNBUToesIGKxXnCo1aG7JVtOojcvdFS4AfHvbtqsixu3Q+4m4Dk3kx7ioy7Ij
         ukU/hMpRjqWSg==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH for v5.6] v4l2-mem2mem.c: fix broken links
Cc:     Nicolas Dufresne <nicolas@ndufresne.ca>
Message-ID: <8974b23a-6823-d47b-fda4-fe9bd6f7e6d1@xs4all.nl>
Date:   Tue, 4 Feb 2020 19:13:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfNQGrGyNiLzcQtxIvN3X6gn0j/7dadLAV9wlTdASvefF7Wm1NsiR2Uakcg4OYyhX1He9H4WclXUVQnfmL2HQKx7OOEZA+46+w+gux2vDzDO7Evhgr+II
 9J+ri1K7oEkM6swpdx96FA0SkoZooZxc57tH4y4K+WfGhZlMFhaRKjtXTa0RlW9oFu7FjkTt0A/teL8TM3IcbTB9YvIxqQW9JPs=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The topology that v4l2_m2m_register_media_controller() creates for a
processing block actually created a source-to-source link and a sink-to-sink
link instead of two source-to-sink links.

Unfortunately v4l2-compliance never checked for such bad links, so this
went unreported for quite some time.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Reported-by: Nicolas Dufresne <nicolas@ndufresne.ca>
Cc: <stable@vger.kernel.org>      # for v4.19 and up
---
diff --git a/drivers/media/v4l2-core/v4l2-mem2mem.c b/drivers/media/v4l2-core/v4l2-mem2mem.c
index 1afd9c6ad908..cc34c5ab7009 100644
--- a/drivers/media/v4l2-core/v4l2-mem2mem.c
+++ b/drivers/media/v4l2-core/v4l2-mem2mem.c
@@ -880,12 +880,12 @@ int v4l2_m2m_register_media_controller(struct v4l2_m2m_dev *m2m_dev,
 		goto err_rel_entity1;

 	/* Connect the three entities */
-	ret = media_create_pad_link(m2m_dev->source, 0, &m2m_dev->proc, 1,
+	ret = media_create_pad_link(m2m_dev->source, 0, &m2m_dev->proc, 0,
 			MEDIA_LNK_FL_IMMUTABLE | MEDIA_LNK_FL_ENABLED);
 	if (ret)
 		goto err_rel_entity2;

-	ret = media_create_pad_link(&m2m_dev->proc, 0, &m2m_dev->sink, 0,
+	ret = media_create_pad_link(&m2m_dev->proc, 1, &m2m_dev->sink, 0,
 			MEDIA_LNK_FL_IMMUTABLE | MEDIA_LNK_FL_ENABLED);
 	if (ret)
 		goto err_rm_links0;
