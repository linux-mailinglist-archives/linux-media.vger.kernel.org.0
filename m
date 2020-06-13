Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D03D1F85CE
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2020 01:04:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726507AbgFMXEl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 13 Jun 2020 19:04:41 -0400
Received: from mta-p5.oit.umn.edu ([134.84.196.205]:48288 "EHLO
        mta-p5.oit.umn.edu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726442AbgFMXEk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 13 Jun 2020 19:04:40 -0400
Received: from localhost (unknown [127.0.0.1])
        by mta-p5.oit.umn.edu (Postfix) with ESMTP id 49ktTM6xpyz9vZ1k
        for <linux-media@vger.kernel.org>; Sat, 13 Jun 2020 23:04:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p5.oit.umn.edu ([127.0.0.1])
        by localhost (mta-p5.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id aOZnDTFlJ0Dy for <linux-media@vger.kernel.org>;
        Sat, 13 Jun 2020 18:04:39 -0500 (CDT)
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com [209.85.166.71])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mta-p5.oit.umn.edu (Postfix) with ESMTPS id 49ktTM5Dbvz9vZ1r
        for <linux-media@vger.kernel.org>; Sat, 13 Jun 2020 18:04:39 -0500 (CDT)
DMARC-Filter: OpenDMARC Filter v1.3.2 mta-p5.oit.umn.edu 49ktTM5Dbvz9vZ1r
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-p5.oit.umn.edu 49ktTM5Dbvz9vZ1r
Received: by mail-io1-f71.google.com with SMTP id t23so8738552iog.21
        for <linux-media@vger.kernel.org>; Sat, 13 Jun 2020 16:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umn.edu; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=vdWthCsmOsBiHMJwiA3g9GCqF/ZUI6PIYJxkxVMjZH8=;
        b=Edt0rD6Yt02A/FMLC1/3iWyMUZULyWs4zPYMO1nwpQz4AKx88deJY9VPwnjFkVAIdw
         kkJpM78kvFvwUyN/G2xmEetRViIQBSUtLQJ8MHV1tC+Umei/gQp/YNM4dbJh1pAxcaaN
         HXNwOSXVM8SoJCS2nQu/dASQ3p+DkWsDn2QNHiAUC5gSg6jnBzpW0VArxHYrmJYTaorT
         +IwYA72fIoDNfYYIpRDk5u9lNKHHzH2O8KIqXDrvbs44FvNMKvDvJyGPQm8hctAbdh5X
         GCvjJP0O2st2YGsdaioTAJqjXlRtU/4b43v7VNdDE74YbKuh2AtuxzdP7V67C546UweH
         V1+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=vdWthCsmOsBiHMJwiA3g9GCqF/ZUI6PIYJxkxVMjZH8=;
        b=UkwoGPQDw9A2hYbwQm/yPHhyCqVNhjh3KdVjjPpk8G2Br+iprluodbYbvM4Qw9ZUEM
         kAVru5oiP1KvM9hCLNE20z5asrInj304QtdnGnhERF57N7MhnV2D4CkPqk7GETQS1dmq
         p0rbSUAsodBtZ82UWRV4MvfVDci7KcxhKmhQaVYz8WxsB9sIn1NzeqtK018AZgg7gAiw
         LoFI096jGkLz3rhGp8Ud2+PFKkCtIhe2hsxtU1WOi5yNEHjiOl/Gzz+QbEUfq8cZVgBy
         vVVpljyVuTG+50jEIhOmqi3z7du29YiIC/KkVb+fiLh9IVxDrI3PDpG3OUz2WVlZ13t8
         YBkA==
X-Gm-Message-State: AOAM532o0a/+UAFxzwndytrLuSXfaUKe/EW6ZccCaLmhUhWq9eSuN7kR
        OPuHNb9em2hQ605/S86tVP3mKfAaO+Tbdeqw81YFMLYbJb3ByKjd6MSIB+lGSGlIZuNmsnGXv5G
        l7hhlYKSubnpB/s4rlT5/Kavq76M=
X-Received: by 2002:a92:b699:: with SMTP id m25mr14652662ill.208.1592089479230;
        Sat, 13 Jun 2020 16:04:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz2Amm5x/e+7fkof5wamzDW0mUfhmnXCG35Wi4I575sv2CQNQ8SYgfivVcBHqk1UbbABGletA==
X-Received: by 2002:a92:b699:: with SMTP id m25mr14652640ill.208.1592089478980;
        Sat, 13 Jun 2020 16:04:38 -0700 (PDT)
Received: from qiushi.cs.umn.edu ([2607:ea00:101:3c74:4874:45:bcb4:df60])
        by smtp.gmail.com with ESMTPSA id m90sm5546517ilb.79.2020.06.13.16.04.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2020 16:04:38 -0700 (PDT)
From:   wu000273@umn.edu
To:     kjlu@umn.edu
Cc:     wu000273@umn.edu,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Ulrich Hecht <uli+renesas@fpond.eu>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] media: rcar-vin: Fix a reference count leak.
Date:   Sat, 13 Jun 2020 18:04:32 -0500
Message-Id: <20200613230432.13025-1-wu000273@umn.edu>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Qiushi Wu <wu000273@umn.edu>

pm_runtime_get_sync() increments the runtime PM usage counter even
when it returns an error code. Thus call pm_runtime_put_noidle()
if pm_runtime_get_sync() fails.

Fixes: 2a18fbec1dab ("media: rcar-vin: Move pm_runtime_{get,put} out of helpers")
Signed-off-by: Qiushi Wu <wu000273@umn.edu>
---
 drivers/media/platform/rcar-vin/rcar-v4l2.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/rcar-vin/rcar-v4l2.c b/drivers/media/platform/rcar-vin/rcar-v4l2.c
index f421e2584875..06808be35f98 100644
--- a/drivers/media/platform/rcar-vin/rcar-v4l2.c
+++ b/drivers/media/platform/rcar-vin/rcar-v4l2.c
@@ -835,8 +835,10 @@ static int rvin_open(struct file *file)
 	int ret;
 
 	ret = pm_runtime_get_sync(vin->dev);
-	if (ret < 0)
+	if (ret < 0) {
+		pm_runtime_put_noidle(vin->dev);
 		return ret;
+	}
 
 	ret = mutex_lock_interruptible(&vin->lock);
 	if (ret)
-- 
2.17.1

