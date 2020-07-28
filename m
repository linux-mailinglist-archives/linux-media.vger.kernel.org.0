Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1DB8E22FF67
	for <lists+linux-media@lfdr.de>; Tue, 28 Jul 2020 04:15:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726981AbgG1CPj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Jul 2020 22:15:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726313AbgG1CPi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Jul 2020 22:15:38 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89C4BC0619D2
        for <linux-media@vger.kernel.org>; Mon, 27 Jul 2020 19:15:38 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id t10so3788661plz.10
        for <linux-media@vger.kernel.org>; Mon, 27 Jul 2020 19:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=students-iitmandi-ac-in.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hBlxnjAq+NQ7xq9tyIscN6vQVF0VMix+mjCrmXItPMg=;
        b=uOHtcrYTmCosLIc22eS/NeLsVC6fVrazz3QS9IfOvftpZ3IVdvH2jSELcQ0Je6XAfn
         VpGwJrxu6PCnYN9hqFHF2IIdLqcu19CjfZqEZvgqhU0QWQWzmL+wTIC7Uq2x7OsUB9EO
         xKCUWBc9YUqJhxjPfkDl5NtTJRVDTm4FpftsNZ//mhhq5WkOQAqX6bWILHe4g09GAR3Q
         pdUpSA1e0c7ej0pkI8wZXxJS62RtHuNYBk7+GwV4bJ+06tNjKfVC9r3A5bUBxb6kGSuU
         94VTqY7ku+CAz1Xdai9XfdM4Yg8hsaAcGao5O/433g19X6+0SvtLEI0IVYnzVnHaSeZm
         S+WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hBlxnjAq+NQ7xq9tyIscN6vQVF0VMix+mjCrmXItPMg=;
        b=fvGRgQw2iTXyjir5OYItop6H09Z8lTILOLGhavcrjfAOfW26+l7pQ2ou0dB3ADPTmo
         py23Q54+lTSIqGZBGj2ZSnf1F7bE/k1udzw/tSCsziMnqcVZ2YRTDSYQYihBoWH57SU/
         8aF9aLLnTsPV1n+N+Mh6JRj48e9qbzAEafOzZ1SPL0wAVa/3cYiLP6m/pc8jduTcFZpM
         /5KfOn+gacQAUg70w2GBaHYPUIF93gO7rAcQcvnEHACpwVNnzuGUyOF12r7KVQZZriMV
         wq8ISFS6j1CKEK8CXWskW3pK2T6YU75oza6s+MxDsMr9qMoBlsLEl/vcied2bIYEXap8
         0rlw==
X-Gm-Message-State: AOAM530dq4OSVrCwCP/sR+gXfj8jCxz97BNq9BBxopqK+ainMvf1ZMeC
        3Y/wanE6UBbSAngITfm+/CguZQ==
X-Google-Smtp-Source: ABdhPJwzNVTSIeKUloUb5M/3iD6Xn5Y8aCAEXO+PabHJqE0BOsIVOgLuCMNps+33LtqqaT/obVKdiA==
X-Received: by 2002:a17:902:8bc6:: with SMTP id r6mr8654988plo.289.1595902538102;
        Mon, 27 Jul 2020 19:15:38 -0700 (PDT)
Received: from devil-VirtualBox.www.tendawifi.com ([103.198.174.215])
        by smtp.gmail.com with ESMTPSA id g4sm16732466pgn.64.2020.07.27.19.15.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2020 19:15:37 -0700 (PDT)
From:   Ankit Baluni <b18007@students.iitmandi.ac.in>
To:     mchehab@kernel.org, sakari.ailus@linux.intel.com,
        gregkh@linuxfoundation.org
Cc:     linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org,
        Ankit Baluni <b18007@students.iitmandi.ac.in>
Subject: [PATCH] Staging : media : atomisp : Fixed a brace coding sytle issue
Date:   Tue, 28 Jul 2020 07:45:18 +0530
Message-Id: <20200728021518.19639-1-b18007@students.iitmandi.ac.in>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fixing coding style issue by removing the braces that are not required.

Signed-off-by: Ankit Baluni<b18007@students.iitmandi.ac.in>
---
 drivers/staging/media/atomisp/pci/atomisp_ioctl.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index f8d616f08b51..701de098cb29 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -1828,11 +1828,10 @@ static int atomisp_streamon(struct file *file, void *fh,
 			dev_err(isp->dev, "master slave sensor stream on failed!\n");
 			goto out;
 		}
-		if (!IS_ISP2401) {
+		if (!IS_ISP2401)
 			__wdt_on_master_slave_sensor(isp, wdt_duration);
-		} else {
+		else
 			__wdt_on_master_slave_sensor_pipe(pipe, wdt_duration, true);
-		}
 		goto start_delay_wq;
 	} else if (asd->depth_mode->val && (atomisp_streaming_count(isp) <
 					    ATOMISP_DEPTH_SENSOR_STREAMON_COUNT)) {
-- 
2.25.1

