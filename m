Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 606282EAB9B
	for <lists+linux-media@lfdr.de>; Tue,  5 Jan 2021 14:11:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730008AbhAENLC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Jan 2021 08:11:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729920AbhAENLB (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Jan 2021 08:11:01 -0500
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com [IPv6:2607:f8b0:4864:20::829])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09AF3C06179A;
        Tue,  5 Jan 2021 05:10:32 -0800 (PST)
Received: by mail-qt1-x829.google.com with SMTP id 7so20756253qtp.1;
        Tue, 05 Jan 2021 05:10:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gsai1F6IdP1PCXh/00741NqnR+YHB17XXof5rNth6l4=;
        b=mEjaxdsEuXgJiHC90vpIutJPOaHxsn54lvEBYcX6VvRen+JuDbzB5o07/Qr1rciQz7
         eNpOENWuatmtjiwlqk0EtqAZdvqiH9IvOaOwvr+QJ/t96xvjOPQSyHaggRGRarFymGCh
         xr8qimAkxdhOxirJNPhDDdSMNgAg0PgT0OhLhZd2x2THqi+w/CiEvIW7IQlD9O1SscI5
         srYxF+CjaNS75dD8RmrrgAclmJdBbUyDfCmlY26zJQn7ZuR2sf8bR+ICSQW83XDINdYT
         CJIjqT9ElLOiG0jwEDHrU3cdQFdMgTCHZcm5oNb/84kF8krvyCx+HRs9uQcrHMZVAYvn
         yEeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gsai1F6IdP1PCXh/00741NqnR+YHB17XXof5rNth6l4=;
        b=GwtE2rPB1IXKPMA0JYn1CkynlqZ2uqOK6Q921SoA6tnx6WiCXQ7MySayZVOjZ9stP7
         iiB4J62+785Neg4ZfU5p5ZimQ3liXZ46hwKkF/YWi18pTKm4bXBBSyR8yArrdDLLYh9r
         uiAd3XpAnKPdJJ4Jcs/Poznf9G+Mxbx3n65pkn8WxfF8pny/ULkVcqw/8zZTdzxLpuZZ
         gnOxZN90rX7Q4SgF2rEo/j6OADVSNeNCcg1IdpZFwAI63X7+jG/zc8EhMWnx4mk+SMek
         GscaPcOoyCx3EBXYctTQwFfdTk0Uzg57DLwh3RVT7neJO8OKX6xwJdCz04pRvJRYX3tI
         XnbA==
X-Gm-Message-State: AOAM532KpGYFSm+Tjfq+ADeufaP2NMaRN5zxuG7ePw5/B6OrC/iAfbp9
        DkF3LiEssHplfO9RSKsv/P8=
X-Google-Smtp-Source: ABdhPJwKS++yItgecbLbucCl7XrSwIxepU1Q1ecyGKjS/G4KqPYMWkpIR6hSjuQdDdDJtjzqVkCFOA==
X-Received: by 2002:ac8:470d:: with SMTP id f13mr73693959qtp.281.1609852231305;
        Tue, 05 Jan 2021 05:10:31 -0800 (PST)
Received: from localhost.localdomain ([2804:14d:72b1:8920:77d4:6fb0:85b3:b6f7])
        by smtp.gmail.com with ESMTPSA id s14sm19877804qke.45.2021.01.05.05.10.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jan 2021 05:10:30 -0800 (PST)
From:   "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To:     mchehab@kernel.org, hverkuil@xs4all.nl
Cc:     "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] media: vidtv: print message when driver is removed
Date:   Tue,  5 Jan 2021 10:09:56 -0300
Message-Id: <20210105130956.1133222-5-dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210105130956.1133222-1-dwlsalmeida@gmail.com>
References: <20210105130956.1133222-1-dwlsalmeida@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>

Print a message when the driver is removed so that we get some
visual confirmation when unbinding vidtv.

Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
---
 drivers/media/test-drivers/vidtv/vidtv_bridge.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/test-drivers/vidtv/vidtv_bridge.c b/drivers/media/test-drivers/vidtv/vidtv_bridge.c
index 11ee87399375..09cec77490c3 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_bridge.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_bridge.c
@@ -553,6 +553,7 @@ static int vidtv_bridge_remove(struct platform_device *pdev)
 	dvb_dmxdev_release(&dvb->dmx_dev);
 	dvb_dmx_release(&dvb->demux);
 	dvb_unregister_adapter(&dvb->adapter);
+	dev_info(&pdev->dev, "Successfully removed vidtv\n");
 
 	return 0;
 }
-- 
2.30.0

