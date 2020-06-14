Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8FCBB1F8637
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2020 04:31:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726542AbgFNCbc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 13 Jun 2020 22:31:32 -0400
Received: from mta-p5.oit.umn.edu ([134.84.196.205]:48984 "EHLO
        mta-p5.oit.umn.edu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726460AbgFNCbb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 13 Jun 2020 22:31:31 -0400
Received: from localhost (unknown [127.0.0.1])
        by mta-p5.oit.umn.edu (Postfix) with ESMTP id 49kz4221BFz9vHdd
        for <linux-media@vger.kernel.org>; Sun, 14 Jun 2020 02:31:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p5.oit.umn.edu ([127.0.0.1])
        by localhost (mta-p5.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id x65AuMh-YWMQ for <linux-media@vger.kernel.org>;
        Sat, 13 Jun 2020 21:31:30 -0500 (CDT)
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mta-p5.oit.umn.edu (Postfix) with ESMTPS id 49kz4204htz9vHdB
        for <linux-media@vger.kernel.org>; Sat, 13 Jun 2020 21:31:30 -0500 (CDT)
DMARC-Filter: OpenDMARC Filter v1.3.2 mta-p5.oit.umn.edu 49kz4204htz9vHdB
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-p5.oit.umn.edu 49kz4204htz9vHdB
Received: by mail-il1-f197.google.com with SMTP id l20so9463459ilk.22
        for <linux-media@vger.kernel.org>; Sat, 13 Jun 2020 19:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umn.edu; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=oQSJLWnjo3ldT1Uh/5Z6WatclhBP/542tcGFisvI+fU=;
        b=S9rDLtneBsQrH7ioKbbDGehA3XM/KAnjVe+MzWp8Kr+8srAsAg/nQSNdBWJi51lBYI
         Ped9Ppc+NVOP5MexAIxTiclwHAkx0X7BvbbiuoujMcOt6gK36HbsyDz/U/nWQpSu6Iz5
         kkKO9n1jwxP3ZtrhRCJV+zFXQkvHZp9O9xK+7QeCloj3dudOuwy/xmduMDQGL9K34Mwk
         I4yOODQyONssgkuHe7+HgwNF/tmeRQxHc1qGpm1FeLXoD3Gptm3hywyq7JoA+L5/GPMf
         C80QtDnAtG977f3UBVBmbf0g9fV/9OI3NFtkqO94EB3mcXwwp3XEkTak/5upXZPczbWO
         dZmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=oQSJLWnjo3ldT1Uh/5Z6WatclhBP/542tcGFisvI+fU=;
        b=Ugysjc83BHFgzA0JU8RUd7T5wtUorA8e5jj/rrhExN7wD4Dz3D1B80cCa1+gAWB8Eo
         KV1RpXRvqqX7s8ThHAuKd1S3aSMoub4Gl/ZIyp4OwPG30EiL9s1H1t4ks/OSRC785EFF
         I3IsRvanijoMd4e+Ht/Ekqets2lZ4+jde/oE+tBD0PdaKHzdIxpkO0ILbuOm1nuG6aLt
         t7SaJDM6hEPVL2lMH9wDEaK2iWndaESo3O1TLh3pU3WztQDt7d3wp0ONRU+ybPs0MRaX
         Fy9N2ZmWse69mevUhimIbENWLIrWUngP/cvNGjVXOUopB7IKOSSxTRFsxsp8DuocjLzD
         +f2A==
X-Gm-Message-State: AOAM5301K4hXfnaFT/I3ny6Xfn9tRotEVBW8zQtkVHjJCWdZm97fXwK5
        rv3MG14k0YjTghW1CVc2FbYApT8SlVsXjRX9SCcgMMwwxuBVHGtdRc4wwidOGqIIiVz9owtPL0h
        xSr5bn750Nl5g2s4f23qUek2CF+M=
X-Received: by 2002:a92:dc89:: with SMTP id c9mr20840492iln.238.1592101889099;
        Sat, 13 Jun 2020 19:31:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzLSKF+X0CLsLDT+aW+f1omfkM8E/RHKfsVze8FDZe1KnapiufVD9GjztK1/Y21/gNjDnuPuA==
X-Received: by 2002:a92:dc89:: with SMTP id c9mr20840463iln.238.1592101888761;
        Sat, 13 Jun 2020 19:31:28 -0700 (PDT)
Received: from qiushi.cs.umn.edu ([2607:ea00:101:3c74:4874:45:bcb4:df60])
        by smtp.gmail.com with ESMTPSA id 18sm5494049ion.17.2020.06.13.19.31.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2020 19:31:27 -0700 (PDT)
From:   wu000273@umn.edu
To:     kjlu@umn.edu
Cc:     wu000273@umn.edu, Kyungmin Park <kyungmin.park@samsung.com>,
        Kamil Debski <kamil@wypas.org>,
        Jeongtae Park <jtp.park@samsung.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] media: s5p-mfc: Fix a reference count leak
Date:   Sat, 13 Jun 2020 21:31:22 -0500
Message-Id: <20200614023122.24656-1-wu000273@umn.edu>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Qiushi Wu <wu000273@umn.edu>

pm_runtime_get_sync() increments the runtime PM usage counter even
when it returns an error code, causing incorrect ref count if
pm_runtime_put_noidle() is not called in error handling paths.
Thus call pm_runtime_put_noidle() if pm_runtime_get_sync() fails.

Fixes: c5086f130a77 ("[media] s5p-mfc: Use clock gating only on MFC v5 hardware")
Signed-off-by: Qiushi Wu <wu000273@umn.edu>
---
 drivers/media/platform/s5p-mfc/s5p_mfc_pm.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/s5p-mfc/s5p_mfc_pm.c b/drivers/media/platform/s5p-mfc/s5p_mfc_pm.c
index 7d52431c2c83..62d2320a7218 100644
--- a/drivers/media/platform/s5p-mfc/s5p_mfc_pm.c
+++ b/drivers/media/platform/s5p-mfc/s5p_mfc_pm.c
@@ -79,8 +79,10 @@ int s5p_mfc_power_on(void)
 	int i, ret = 0;
 
 	ret = pm_runtime_get_sync(pm->device);
-	if (ret < 0)
+	if (ret < 0) {
+		pm_runtime_put_noidle(pm->device);
 		return ret;
+	}
 
 	/* clock control */
 	for (i = 0; i < pm->num_clocks; i++) {
-- 
2.17.1

