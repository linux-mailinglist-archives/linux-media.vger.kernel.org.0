Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 24C9C34A98
	for <lists+linux-media@lfdr.de>; Tue,  4 Jun 2019 16:41:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727619AbfFDOlY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Jun 2019 10:41:24 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:44698 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727318AbfFDOlY (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Jun 2019 10:41:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
        MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=RWpmkbmvEcAHn6arIwCJStMlPWNG7V2GHBAgTgxVJ3k=; b=Rxq1e2x56xZGWMNQ0ujzv+Uy5
        1zx+CgUUV3c9p0PMPdjwBB/dlrWNLPG+xT8UPojMdDREJ/wCJ92Iy/qnmdKeSRY2uysFUprZiv1b5
        AGNcMvmwNnm7nJgIracnvhF3/LSz0s7No7PmxX4XIwuSPjQ7babrF1X40filNtYoHf8TDDF2fLj+c
        i2/93JBXAe1IV84qOWY6phXCzop7hYHimDu8Kd8LIqvlLHwTxm9gS+aSZBp1lYlLYg7CqbQ9WFdvD
        ClFWoCldE/1P2nLv3u7ATI05TTkR+5X57YcRVQMEBzFqFVtUPuZzNBgfYrJbT7xdIFZnK9SkVD/n8
        7ULMKBcGg==;
Received: from [179.182.172.34] (helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1hYAct-00041I-TB; Tue, 04 Jun 2019 14:41:23 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92)
        (envelope-from <mchehab@bombadil.infradead.org>)
        id 1hYAcr-0003if-4m; Tue, 04 Jun 2019 11:41:21 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>
Subject: [PATCH] media: dvb: tag deprecated DVB APIs as such
Date:   Tue,  4 Jun 2019 11:41:20 -0300
Message-Id: <a8cb1ebbf5b885b1c715d5863fc45ab745a1edc7.1559659278.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There are three headers at DVB that should not be used on
future projects: audio.h, osd.h and video.h.

While this is already clear at the docs, make clear also at
the headers that those files should not be used on future
drivers.

Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
---
 include/uapi/linux/dvb/audio.h | 4 +++-
 include/uapi/linux/dvb/osd.h   | 4 +++-
 include/uapi/linux/dvb/video.h | 4 +++-
 3 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/include/uapi/linux/dvb/audio.h b/include/uapi/linux/dvb/audio.h
index afeae063e640..81f85c0c17c7 100644
--- a/include/uapi/linux/dvb/audio.h
+++ b/include/uapi/linux/dvb/audio.h
@@ -1,6 +1,8 @@
 /* SPDX-License-Identifier: LGPL-2.1+ WITH Linux-syscall-note */
 /*
- * audio.h
+ * audio.h - DEPRECATED MPEG-TS audio decoder API
+ *
+ * NOTE: should not be used on future drivers
  *
  * Copyright (C) 2000 Ralph  Metzler <ralph@convergence.de>
  *                  & Marcus Metzler <marcus@convergence.de>
diff --git a/include/uapi/linux/dvb/osd.h b/include/uapi/linux/dvb/osd.h
index e163508b9ae8..ddc35ebded34 100644
--- a/include/uapi/linux/dvb/osd.h
+++ b/include/uapi/linux/dvb/osd.h
@@ -1,6 +1,8 @@
 /* SPDX-License-Identifier: LGPL-2.1+ WITH Linux-syscall-note */
 /*
- * osd.h
+ * osd.h - DEPRECATED On Screen Display API
+ *
+ * NOTE: should not be used on future drivers
  *
  * Copyright (C) 2001 Ralph  Metzler <ralph@convergence.de>
  *                  & Marcus Metzler <marcus@convergence.de>
diff --git a/include/uapi/linux/dvb/video.h b/include/uapi/linux/dvb/video.h
index 43ba8b0a3d14..179f1ec60af6 100644
--- a/include/uapi/linux/dvb/video.h
+++ b/include/uapi/linux/dvb/video.h
@@ -1,6 +1,8 @@
 /* SPDX-License-Identifier: LGPL-2.1+ WITH Linux-syscall-note */
 /*
- * video.h
+ * video.h - DEPRECATED MPEG-TS video decoder API
+ *
+ * NOTE: should not be used on future drivers
  *
  * Copyright (C) 2000 Marcus Metzler <marcus@convergence.de>
  *                  & Ralph  Metzler <ralph@convergence.de>
-- 
2.21.0

