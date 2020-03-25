Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E45DA193240
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2020 22:00:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727306AbgCYVAr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Mar 2020 17:00:47 -0400
Received: from mail-pj1-f68.google.com ([209.85.216.68]:40249 "EHLO
        mail-pj1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727253AbgCYVAq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Mar 2020 17:00:46 -0400
Received: by mail-pj1-f68.google.com with SMTP id kx8so1514674pjb.5
        for <linux-media@vger.kernel.org>; Wed, 25 Mar 2020 14:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=7qG8lGXQdD19+kMVRM9ERbSMuU/dDvdJ9LSC92xP7XU=;
        b=PUYS5dBeAUc2FPkdbManfGHspdUyta8P6yKt7k0mf+s+UD4AddwgqJFWaO/xavTOVH
         RMWSis9oFwDaBI4CCx3ZG1qTtlxTVkNVaSF0Ot6PtaYaGFI8F43MqIufGCqUmxBufyY7
         2kqzfj4PIrbZoAy6NuKWusJqqRQGIJPDk+FZn0Gzgw9usxzytjFl+2HiljU59e5CeuKS
         nB35VhJlQoq0oUealatfEG/u59JoP2bdJ1ju7+Kzq0+9CDMIeit7UzJAgElOsI6PCjMr
         CzLDXdag7xkofI3WxProcwcq+oJm7wvmEJtPUNsSL3b7VgDV/vloi0oxyOOHaltH1Dwn
         S2/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=7qG8lGXQdD19+kMVRM9ERbSMuU/dDvdJ9LSC92xP7XU=;
        b=eoqvBtj9uCFnwkEET5WJ2F84iVxmMuGKYr8/j3fuwGUuQUinN970GeoidBWAqOrk6Q
         KTfhWAjvhzk6o6CxWCaLhoF4fvSKHyN/SRbA1wW5+XLvHGVcX8N2HEvpzyxmYSNmBTBy
         0zrRU5k94a/Bjps3MvNcb5oFJDeEjGyt3I2iYtPVaMvo4xyZY/jnZCWNt0FothL0/ER+
         4089iJDGIQKiL0DP6biOzb14CJUzt47JXuOZDq0VBQp8E+Wm9B/YX/Hp2crLEQ2h+V5u
         Pz7gJn01hW/j2LxyQtahOzyv3ohyYOER5E1ElNAEAEPqz7ubMkjGxRpUpMAx/px77BS+
         H7rw==
X-Gm-Message-State: ANhLgQ0RngNm1aw8tUNehZXvv80dk9wKtOlg0VgKGsXGl+qarCliIeL2
        YFWn+1FA4eyQ3dMkADw0oeo=
X-Google-Smtp-Source: ADFU+vsWHkCyRcMBkbObzThKZI7tGHFZRdViAf+QUwYf5A4LsniNRlCcIJLYp4E8L7ujE/4GHfa6lg==
X-Received: by 2002:a17:90a:b003:: with SMTP id x3mr5718639pjq.140.1585170045555;
        Wed, 25 Mar 2020 14:00:45 -0700 (PDT)
Received: from deeUbuntu ([103.228.147.248])
        by smtp.gmail.com with ESMTPSA id l5sm52902pgt.10.2020.03.25.14.00.43
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 25 Mar 2020 14:00:45 -0700 (PDT)
Date:   Thu, 26 Mar 2020 02:30:40 +0530
From:   Deepak R Varma <mh12gx2825@gmail.com>
To:     outreachy-kernel@googlegroups.com, gregkh@linuxfoundation.org,
        daniel.baluta@gmail.com, kieran.bingham@ideasonboard.com
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: [PATCH] media: staging/intel-ipu3: Simplify single goto jump
Message-ID: <20200325210036.GA31405@deeUbuntu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On successful node setup, the code jumps to a cleanup label to perform
nodes cleanup. This only call to cleanup using goto label can be
included in the for / if blocks to make it look more associated.

Signed-off-by: Deepak R Varma <mh12gx2825@gmail.com>
Reviewed-by: Stefano Brivio <sbrivio@redhat.com>

---

NOTE: Patch being resent. Adding linux-media list as suggested by Sakari
Ailus. No changes since last version.

 drivers/staging/media/ipu3/ipu3-v4l2.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/media/ipu3/ipu3-v4l2.c b/drivers/staging/media/ipu3/ipu3-v4l2.c
index e8f33539a217..bd8cb7571038 100644
--- a/drivers/staging/media/ipu3/ipu3-v4l2.c
+++ b/drivers/staging/media/ipu3/ipu3-v4l2.c
@@ -1295,15 +1295,13 @@ static int imgu_v4l2_nodes_setup_pipe(struct imgu_device *imgu, int pipe)
 
 	for (i = 0; i < IMGU_NODE_NUM; i++) {
 		r = imgu_v4l2_node_setup(imgu, pipe, i);
-		if (r)
-			goto cleanup;
+		if (r) {
+			imgu_v4l2_nodes_cleanup_pipe(imgu, pipe, i);
+			return r;
+		}
 	}
 
 	return 0;
-
-cleanup:
-	imgu_v4l2_nodes_cleanup_pipe(imgu, pipe, i);
-	return r;
 }
 
 static void imgu_v4l2_subdev_cleanup(struct imgu_device *imgu, unsigned int i)
-- 
2.17.1

