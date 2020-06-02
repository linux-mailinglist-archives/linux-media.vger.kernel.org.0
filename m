Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 566A11EB577
	for <lists+linux-media@lfdr.de>; Tue,  2 Jun 2020 07:48:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726023AbgFBFsu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Jun 2020 01:48:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725921AbgFBFsu (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 2 Jun 2020 01:48:50 -0400
Received: from mail-il1-x141.google.com (mail-il1-x141.google.com [IPv6:2607:f8b0:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDC51C061A0E;
        Mon,  1 Jun 2020 22:48:48 -0700 (PDT)
Received: by mail-il1-x141.google.com with SMTP id z2so3462278ilq.0;
        Mon, 01 Jun 2020 22:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=k9I8ETp57ehY+cewlXxiibzOu/2WehbLAtG+rirGofY=;
        b=PTTy3Jc1hh5d7OAQOhMTiWNWJ4RspVKcuazsI9Qgbx+DVn0MAAadyVf3uR+SewUl1w
         gqIcebnNBkhmqGbGqm5Fg4dRdKaeeX1SeyH1eiSkGZyofFaoVkQ2VOLVzhcTza5F3uOa
         5Ij9D+nRUzuz4QO1wb6XWri6RH6ozWyuLsPSKcXJ4iuPX0de1IrYswiCNZAWCQdaI3Zt
         1S9Fq6wCHjKOulSz3m7wqNOxsEP+ldTR1c+QrzPqFx5hiWA92V2kosaJls13rcfClr4B
         0iEXswWzLMyYx7L4aM16VXMLHYczOkLn+7fC+706rUgVriAWcroR+dhT3kUhW51ejeFj
         agyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=k9I8ETp57ehY+cewlXxiibzOu/2WehbLAtG+rirGofY=;
        b=Bu9aanQYQeiZFG1DF5hlFDzl7tUS7BTEnD8/Jq9TV9d44SxeSGWNa9PR23Rj224bVr
         v+1sXxnhXqhvY1KJrMk4AXqWVa/Ryjot3x1NQwAotqzono+k6gCJQSt2v44lcMIM+NNE
         6aB9M2oTWVmtbT+cJXMDxOGLxIdbo7LEJQ3Wm+I/H7ndhK9ErfIslztaMV6ZtSNMgo5K
         DS/n+Ho3XP+ocDqI9LVOB6So/MOku24iJYn2ZDoKSQqDLxs0kLfFIznOISuWPoHjphIL
         XSNQqqqZ/iIIcJ0vxbVIqE71o2R7uGwnbwMTqq1odLQymVYl/pXXjgMIkMCklGpO2WY1
         s8xg==
X-Gm-Message-State: AOAM5337HjMgd+Ky123YFeWwQGKhYjlhdW1NWT9I+oLyjTYGzKreGsVp
        s4atjdrRNnCP5HBqIMwEDt4=
X-Google-Smtp-Source: ABdhPJxaffrkPss8NMfyN5duhlcFxRD0Zwf2ag1xzDGUschjC6B9gf0XBShNKhn+Lw1PGm6gXIEycA==
X-Received: by 2002:a92:5e07:: with SMTP id s7mr24998837ilb.266.1591076928307;
        Mon, 01 Jun 2020 22:48:48 -0700 (PDT)
Received: from cs-u-kase.dtc.umn.edu (cs-u-kase.cs.umn.edu. [160.94.64.2])
        by smtp.googlemail.com with ESMTPSA id z4sm911293ilm.72.2020.06.01.22.48.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2020 22:48:47 -0700 (PDT)
From:   Navid Emamdoost <navid.emamdoost@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org
Cc:     emamd001@umn.edu, wu000273@umn.edu, kjlu@umn.edu, smccaman@umn.edu,
        Navid Emamdoost <navid.emamdoost@gmail.com>
Subject: [PATCH] media: staging: tegra-vde: add missing pm_runtime_put_autosuspend
Date:   Tue,  2 Jun 2020 00:48:41 -0500
Message-Id: <20200602054841.15746-1-navid.emamdoost@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Call to pm_runtime_get_sync increments counter even in case of
failure leading to incorrect ref count.
Call pm_runtime_put_autosuspend if pm_runtime_get_sync fails.

Signed-off-by: Navid Emamdoost <navid.emamdoost@gmail.com>
---
 drivers/staging/media/tegra-vde/vde.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/tegra-vde/vde.c b/drivers/staging/media/tegra-vde/vde.c
index d3e63512a765..52cdd4a91e93 100644
--- a/drivers/staging/media/tegra-vde/vde.c
+++ b/drivers/staging/media/tegra-vde/vde.c
@@ -776,8 +776,10 @@ static int tegra_vde_ioctl_decode_h264(struct tegra_vde *vde,
 		goto release_dpb_frames;
 
 	ret = pm_runtime_get_sync(dev);
-	if (ret < 0)
+	if (ret < 0) {
+		pm_runtime_put_autosuspend(dev);
 		goto unlock;
+	}
 
 	/*
 	 * We rely on the VDE registers reset value, otherwise VDE
-- 
2.17.1

