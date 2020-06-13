Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD85A1F85E7
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2020 01:34:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726442AbgFMXeK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 13 Jun 2020 19:34:10 -0400
Received: from mta-p7.oit.umn.edu ([134.84.196.207]:36478 "EHLO
        mta-p7.oit.umn.edu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726272AbgFMXeI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 13 Jun 2020 19:34:08 -0400
Received: from localhost (unknown [127.0.0.1])
        by mta-p7.oit.umn.edu (Postfix) with ESMTP id 49kv7M5lr5z9vYx0
        for <linux-media@vger.kernel.org>; Sat, 13 Jun 2020 23:34:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p7.oit.umn.edu ([127.0.0.1])
        by localhost (mta-p7.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id SkeewaPvZHsu for <linux-media@vger.kernel.org>;
        Sat, 13 Jun 2020 18:34:07 -0500 (CDT)
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com [209.85.166.72])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mta-p7.oit.umn.edu (Postfix) with ESMTPS id 49kv7M3yxKz9vYxH
        for <linux-media@vger.kernel.org>; Sat, 13 Jun 2020 18:34:07 -0500 (CDT)
DMARC-Filter: OpenDMARC Filter v1.3.2 mta-p7.oit.umn.edu 49kv7M3yxKz9vYxH
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-p7.oit.umn.edu 49kv7M3yxKz9vYxH
Received: by mail-io1-f72.google.com with SMTP id x2so3345971iof.0
        for <linux-media@vger.kernel.org>; Sat, 13 Jun 2020 16:34:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umn.edu; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=Rw3l/3EgPiLpxwjRCzeT9nx9Fa3fAzHH5ifQjv/65KE=;
        b=NpXWPGdo09LFr66WrjTqLnLuG625FPqn7wVIOp3CtrQ9Y5U3G3yvXqolzKUKDqeWF2
         TJM4HhWX4zUbCzpJyDFwqG+TL2XqQNvc7wUAV7xJjltfEK/vRm3frHNZkJAVbsMzZJ2l
         R88awLs4R3u9xFnx7CQ7LEkmACh7CkY+HGIjKsHTWqJJQ48AVQIHhoppZ8KkXi+2WSs4
         AlqMsvfsNp7DhA80DKiyfawcNOUxeIMfK9LIlUudk37cMVBbJoE7zbQSlhElAhQFJsJN
         lq2X+getWxoIVayFeJnSxbu+H3Tg5Psvcjh4S2SNNRxuAu9Cd8/uB4w0mmfF5rw04MEG
         PDNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=Rw3l/3EgPiLpxwjRCzeT9nx9Fa3fAzHH5ifQjv/65KE=;
        b=BaY2s0aS2YozsfPvRClZNZyNd7Drezw1u/e3sD6TOUYkSpxc0qy7XUH1AI2DGhZabn
         aS4vf6GOtF/EZQ9LTBLAvVSpZXVWdOjdAlD8G46ceOAlyQkJi7vrKrQ4ECLNiTQcr4qf
         wqRy52uDsAo4pEU/mji25M0H7qirYudqMDQ1yibLwHjdLO57HN/PyWiX0ydKfXzaakeZ
         rljdHuOO9rHBNCAlY7BYGAcWrSMugjb68NWan1L6xLRSFUqBQiRB9p5BPp1GoWQD5Mu5
         GYdmTJbFmQvgXpF4F0X5RVy3oryrcA7T3+Uvtu/T+SZrhGAjsykUGHILhHKyyJCN3c/9
         TMsw==
X-Gm-Message-State: AOAM532xxREw15XVhb3/Dujv5xDHoc+l4Xdq2LyVn/1ydFoV3C8k5kMI
        o7xO+KBhk2IG1ssAzNZfgtu6fpKvmz1d6Z7WlEDEDnBLCbz/7xm66Oo+G6i9GGhFdsUiZ0Um4E0
        OfRqJWlB1OkF7KYDFyQh79rgHQ4A=
X-Received: by 2002:a92:ce48:: with SMTP id a8mr20221716ilr.23.1592091247041;
        Sat, 13 Jun 2020 16:34:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzoiENH5HRfU5W1tLLnW9Y1BwMTkjBXpctUOa+EE0t3xLCFwZMw8RuB/tj6g3lzbzX0Hs0ljA==
X-Received: by 2002:a92:ce48:: with SMTP id a8mr20221698ilr.23.1592091246738;
        Sat, 13 Jun 2020 16:34:06 -0700 (PDT)
Received: from qiushi.cs.umn.edu ([2607:ea00:101:3c74:4874:45:bcb4:df60])
        by smtp.gmail.com with ESMTPSA id v11sm5459221ile.61.2020.06.13.16.34.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2020 16:34:06 -0700 (PDT)
From:   wu000273@umn.edu
To:     kjlu@umn.edu
Cc:     wu000273@umn.edu, Todor Tomov <todor.too@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hansverk@cisco.com>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] media: camss: Fix a reference count leak.
Date:   Sat, 13 Jun 2020 18:34:00 -0500
Message-Id: <20200613233400.20600-1-wu000273@umn.edu>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Qiushi Wu <wu000273@umn.edu>

Calling pm_runtime_get_sync increments the counter even in case of
failure, causing incorrect ref count if pm_runtime_put_sync is not
called in error handling paths. Thus replace the jump target
"error_pm_runtime_get" by "err_clocks".

Fixes: 02afa816dbbf ("media: camss: Add basic runtime PM support")
Signed-off-by: Qiushi Wu <wu000273@umn.edu>
---
 drivers/media/platform/qcom/camss/camss-vfe.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index a8c542fa647d..1e7f23538af6 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -1261,7 +1261,7 @@ static int vfe_get(struct vfe_device *vfe)
 
 		ret = pm_runtime_get_sync(vfe->camss->dev);
 		if (ret < 0)
-			goto error_pm_runtime_get;
+			goto error_clocks;
 
 		ret = vfe_set_clock_rates(vfe);
 		if (ret < 0)
@@ -1295,8 +1295,6 @@ static int vfe_get(struct vfe_device *vfe)
 
 error_clocks:
 	pm_runtime_put_sync(vfe->camss->dev);
-
-error_pm_runtime_get:
 	camss_pm_domain_off(vfe->camss, vfe->id);
 
 error_pm_domain:
-- 
2.17.1

