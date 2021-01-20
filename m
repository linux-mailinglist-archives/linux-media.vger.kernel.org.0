Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 032F32FCE58
	for <lists+linux-media@lfdr.de>; Wed, 20 Jan 2021 11:54:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733175AbhATKhZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Jan 2021 05:37:25 -0500
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:41079 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731628AbhATJnx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Jan 2021 04:43:53 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id 2A14lJCTVftvz2A18l8jDv; Wed, 20 Jan 2021 10:43:10 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1611135790; bh=MfC1s2lgwyYxPnZZbWRrWIDKFG8VbjFQpRmGZkZ0ssY=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=KnTgMU4KdD+niD/Mub53wVy27MLo58Ar2gVm77ofzPplcBiiKT9bRtYY12Ab/XP/0
         qXOeHzrKX5bnreI7CDatZyJ/CY5wOQU6NTtGYsqbAgpFaA+7dfVEIjkba01zOtoSqf
         OTaOTwvlrhFUBUbcIHXlQm131595kVQ3fCN5kqEgzHeltuomYOZTnA9EMA+pH+vq1I
         K97YArVX8WHiT7R5YFI5VlKAfsvFadPVTO3cIbAvfEO8nTqhsXpH20Ro7NZ+jJ7e2S
         dsb7VXY0DDdPZ5AD25hvtKoCPg8PmLwjFzUpey7DKZ7rQ87XlL8veCB8GJdyVaNUev
         UgkIG/CSjEr7Q==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 01/14] atomisp/pci/hmm: fix wrong printk format
Date:   Wed, 20 Jan 2021 10:42:53 +0100
Message-Id: <20210120094306.784318-2-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210120094306.784318-1-hverkuil-cisco@xs4all.nl>
References: <20210120094306.784318-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfGCYqhuwV3+Yk1rv2QJDZScmo32gHmrOGHUW680tMvz8mG7tCBVf9OnohmtN4nL1GUNY/zfLKBZtYzV8Xbr2NOg5rrxGzfqKLgJgrvnqWJC4O9RuLB9k
 4+VfNDbmV2VhmlnSBs8pyyraikQBcoRXd7vgdYwk0bep6SSkhbuKHiaknI3RYF1/TuiKsb196eIX2rNikNdhPTEn8ceAbNvsq8cGeQ4VWTmyFMyxZ4+yxggF
 Q1gMJr27nkwFUlAGjc3T6Q==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fix this compiler warning on i686:

In file included from include/linux/printk.h:409,
                 from include/linux/kernel.h:16,
                 from drivers/staging/media/atomisp/pci/hmm/hmm.c:23:
drivers/staging/media/atomisp/pci/hmm/hmm.c: In function 'hmm_alloc':
drivers/staging/media/atomisp/pci/hmm/hmm.c:272:3: warning: format '%ld' expects argument of type 'long int', but argument 6 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
  272 |   "%s: pages: 0x%08x (%ld bytes), type: %d from highmem %d, user ptr %p, cached %d\n",
      |   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Use %zu instead of %ld.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/staging/media/atomisp/pci/hmm/hmm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/hmm/hmm.c b/drivers/staging/media/atomisp/pci/hmm/hmm.c
index e0eaff0f8a22..6a5ee4607089 100644
--- a/drivers/staging/media/atomisp/pci/hmm/hmm.c
+++ b/drivers/staging/media/atomisp/pci/hmm/hmm.c
@@ -269,7 +269,7 @@ ia_css_ptr hmm_alloc(size_t bytes, enum hmm_bo_type type,
 		hmm_set(bo->start, 0, bytes);
 
 	dev_dbg(atomisp_dev,
-		"%s: pages: 0x%08x (%ld bytes), type: %d from highmem %d, user ptr %p, cached %d\n",
+		"%s: pages: 0x%08x (%zu bytes), type: %d from highmem %d, user ptr %p, cached %d\n",
 		__func__, bo->start, bytes, type, from_highmem, userptr, cached);
 
 	return bo->start;
-- 
2.29.2

