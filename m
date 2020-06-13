Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 091471F85D5
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2020 01:14:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726578AbgFMXN7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 13 Jun 2020 19:13:59 -0400
Received: from mta-p5.oit.umn.edu ([134.84.196.205]:52468 "EHLO
        mta-p5.oit.umn.edu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726272AbgFMXN6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 13 Jun 2020 19:13:58 -0400
Received: from localhost (unknown [127.0.0.1])
        by mta-p5.oit.umn.edu (Postfix) with ESMTP id 49kth517HWz9vZ20
        for <linux-media@vger.kernel.org>; Sat, 13 Jun 2020 23:13:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p5.oit.umn.edu ([127.0.0.1])
        by localhost (mta-p5.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id Fd39uSN8D6SV for <linux-media@vger.kernel.org>;
        Sat, 13 Jun 2020 18:13:57 -0500 (CDT)
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mta-p5.oit.umn.edu (Postfix) with ESMTPS id 49kth46YqGz9vZ1k
        for <linux-media@vger.kernel.org>; Sat, 13 Jun 2020 18:13:56 -0500 (CDT)
DMARC-Filter: OpenDMARC Filter v1.3.2 mta-p5.oit.umn.edu 49kth46YqGz9vZ1k
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-p5.oit.umn.edu 49kth46YqGz9vZ1k
Received: by mail-il1-f198.google.com with SMTP id s4so9289046ilc.7
        for <linux-media@vger.kernel.org>; Sat, 13 Jun 2020 16:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umn.edu; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=Lp/57Kv3gzuXj/K9oQ77nASFzku70Zj4jK0Z7RozDsE=;
        b=lfurDX56hYBZrhdFYqEBnv2irvi2WRAzXzjIzOMzTNHuv42xHT5JVvBul2r6yRZfSr
         Cedk/u4yLdw8aRqEc/y4ItmczY/Wy46YSJdJrRMiyu6axMe091p2oVRathwkVLAjctph
         O1ryAN6KCqcJBCUYQiS5rpomqGicoXiT0GBMpThSYx8h/WfcepNjKEwEdueyxHsiT/QC
         QuMW8qQhASGbepJxBMeb2/E+/u9MHhAnP4kSZh7r1eGnqZTnwEm5ywzhNHk5NVpJQ75p
         aeacfU6DR3UAp/DccV5MCqEE1fH4GmLxOcOkkO/DPszNBMyGWO8UrRz2Jk+okWcCDdSo
         lqPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=Lp/57Kv3gzuXj/K9oQ77nASFzku70Zj4jK0Z7RozDsE=;
        b=IBaVJQtSea9Q0pysNYWslD9on81Qgqm4Lya5hlADm3CGX4e1+fcmWDv+ddCISLe8tM
         jlJpA/Wz7B1YIn9YPPLuo0vBucrj0+4ZPSqJ3Fsar5we88rg4TzWBkt/wEpn5l4k4eXJ
         sZFEq3qjnA5IF6E8PmtgGeH13yAERx/JrRTsM2+Dd86rJ9WMtofsJ1hEMwpHqA8zn1uw
         A4QlAcJs63aexCBv+whkTfp4gPzMuU//otNGDV5D6fJg4iBuAOzkW3QQv4AWk8Bcs8pe
         LhhYsqtyn9wQqCJzUnOH8tSEZmJaIgaKw2dQZdN9MgsCQ5iACKDGScuofa36ikMQUSlI
         i1kA==
X-Gm-Message-State: AOAM533ZE1OeQE5cYVIvr5GzQeBObCLX7577uPvEOLmIrMBSyn1T6EQ3
        ZfJPolUDt5TIKl9FNy3H0kSFYI+5aKyxDEGOPz6QX86YPlTN7ogID2Q8Rka4yt/rjAp0+pGbIyh
        LS2MbZER0EC3QXXnwyWC+wccyH44=
X-Received: by 2002:a05:6e02:ef2:: with SMTP id j18mr19983901ilk.69.1592090036462;
        Sat, 13 Jun 2020 16:13:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJztT1frvvFPpkKu648hyiONgeEYkHge5KRR8FaxCVSOS07PFim7J0gL5UIgkxz52VKBRrECXA==
X-Received: by 2002:a05:6e02:ef2:: with SMTP id j18mr19983882ilk.69.1592090036227;
        Sat, 13 Jun 2020 16:13:56 -0700 (PDT)
Received: from qiushi.cs.umn.edu ([2607:ea00:101:3c74:4874:45:bcb4:df60])
        by smtp.gmail.com with ESMTPSA id b8sm5368985ior.35.2020.06.13.16.13.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2020 16:13:55 -0700 (PDT)
From:   wu000273@umn.edu
To:     kjlu@umn.edu
Cc:     wu000273@umn.edu, Jacob Chen <jacob-chen@iotwrt.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Hans Verkuil <hansverk@cisco.com>, linux-media@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] media: rockchip/rga: Fix a reference count leak.
Date:   Sat, 13 Jun 2020 18:13:49 -0500
Message-Id: <20200613231350.15504-1-wu000273@umn.edu>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Qiushi Wu <wu000273@umn.edu>

pm_runtime_get_sync() increments the runtime PM usage counter even
when it returns an error code. Thus call pm_runtime_put_noidle()
if pm_runtime_get_sync() fails.

Fixes: f7e7b48e6d79 ("[media] rockchip/rga: v4l2 m2m support")
Signed-off-by: Qiushi Wu <wu000273@umn.edu>
---
 drivers/media/platform/rockchip/rga/rga-buf.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/rockchip/rga/rga-buf.c b/drivers/media/platform/rockchip/rga/rga-buf.c
index 36b821ccc1db..bf9a75b75083 100644
--- a/drivers/media/platform/rockchip/rga/rga-buf.c
+++ b/drivers/media/platform/rockchip/rga/rga-buf.c
@@ -81,6 +81,7 @@ static int rga_buf_start_streaming(struct vb2_queue *q, unsigned int count)
 
 	ret = pm_runtime_get_sync(rga->dev);
 	if (ret < 0) {
+		pm_runtime_put_noidle(rga->dev);
 		rga_buf_return_buffers(q, VB2_BUF_STATE_QUEUED);
 		return ret;
 	}
-- 
2.17.1

