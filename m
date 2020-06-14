Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 526611F8641
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2020 04:56:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726527AbgFNC4P (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 13 Jun 2020 22:56:15 -0400
Received: from mta-p5.oit.umn.edu ([134.84.196.205]:58114 "EHLO
        mta-p5.oit.umn.edu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726460AbgFNC4O (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 13 Jun 2020 22:56:14 -0400
Received: from localhost (unknown [127.0.0.1])
        by mta-p5.oit.umn.edu (Postfix) with ESMTP id 49kzcX5zyXz9vC9d
        for <linux-media@vger.kernel.org>; Sun, 14 Jun 2020 02:56:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p5.oit.umn.edu ([127.0.0.1])
        by localhost (mta-p5.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id JM_vNVE-6kRU for <linux-media@vger.kernel.org>;
        Sat, 13 Jun 2020 21:56:12 -0500 (CDT)
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mta-p5.oit.umn.edu (Postfix) with ESMTPS id 49kzcX4NL9z9vC9N
        for <linux-media@vger.kernel.org>; Sat, 13 Jun 2020 21:56:12 -0500 (CDT)
DMARC-Filter: OpenDMARC Filter v1.3.2 mta-p5.oit.umn.edu 49kzcX4NL9z9vC9N
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-p5.oit.umn.edu 49kzcX4NL9z9vC9N
Received: by mail-il1-f197.google.com with SMTP id n2so9505159ilq.4
        for <linux-media@vger.kernel.org>; Sat, 13 Jun 2020 19:56:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umn.edu; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=sfUbtD+8UmbRScetzBNuWx8h71Z2ueqfA2qMCF+mkCI=;
        b=fneoPuxjbgjZ20tPjhKit5n/XkQZsnTeVuP6LXEZhSCquYV74bLpfB86eYpxiqKl1H
         +bGm2eixLjW8kIj/1StBc/qKKa0B08abqZIUobkVEHl3vw0MYz/pxs7Nz8eICXmHDUUL
         WzTlZnL5OQ+YEJ+CqZ6JgAkc8Mhux56zzUVAsLzLWE6INlUyXlFaRYOXUXjYsjxFRRKn
         cXlbK+lcdMRTHOih7Qellu48K1ZaeOJbRWBeMXjKM10ChGYcJQ2jsCRfw0p2ztkfz6lj
         yhrZ4XH2jabr2SK7PdRjAz1FpKkh47t00lln3p1UYGeETuRiMr8MSwhx+IPsuIaZh6q5
         vv6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=sfUbtD+8UmbRScetzBNuWx8h71Z2ueqfA2qMCF+mkCI=;
        b=MkhCUzmEDDv2J+zpd0fi+wwpMAtLst7QWC0cjoN81c06VrgXdhrLErwsiMIUG+HFGz
         KHLbT7spDQ+jyq2xsJB8eRFR8GbI3dUxAXT4KCPoVn+cZfd1HSJSMDijVuspidNJQHkx
         n4lv/41XKNn2pKKwMLZymPBTR1wrC5+Ckt/EK2frVFfaWHrae/2fUzkVq/QSuzAOrcac
         C8zVu3I9M564qG8o7zDfQ/lkc3/I3W3WXd+M2MOjbb29NI53m2SLGjdChV36pGnrJV9v
         N8lUXaMMSuyfMm8/MEvraTdwAeQjdoshl55LS2aZT8bi7ToZPe8ZT1OQya8aKGoOze7S
         2L4w==
X-Gm-Message-State: AOAM530R4yh1VFdrODwFfkuYchZ7K8hiXhro30V0pYJhQtXURgFKG3Xl
        dr1aD2BmKZjTJmoWT77gM770WsjMmCwASCb+Pfv09hz/huJi0J7ZDq+hGixyNPacLDuje/7LYBF
        a6n7z/1NH/XqRoNCj4aOhkwkcUrM=
X-Received: by 2002:a92:d5c3:: with SMTP id d3mr20318744ilq.51.1592103372126;
        Sat, 13 Jun 2020 19:56:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxT40lgbxZYXXfJLRdJt0H2oqsZMfaaWEzQECLPWBqB3tSO1dB9XwzkOS3idy+ANAfqNQG7Uw==
X-Received: by 2002:a92:d5c3:: with SMTP id d3mr20318737ilq.51.1592103371890;
        Sat, 13 Jun 2020 19:56:11 -0700 (PDT)
Received: from qiushi.cs.umn.edu ([2607:ea00:101:3c74:4874:45:bcb4:df60])
        by smtp.gmail.com with ESMTPSA id l16sm5565374ilm.58.2020.06.13.19.56.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2020 19:56:10 -0700 (PDT)
From:   wu000273@umn.edu
To:     kjlu@umn.edu
Cc:     wu000273@umn.edu, Benoit Parrot <bparrot@ti.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Archit Taneja <archit@ti.com>,
        Kamil Debski <k.debski@samsung.com>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] media: ti-vpe: Fix a missing check and reference count leak
Date:   Sat, 13 Jun 2020 21:56:05 -0500
Message-Id: <20200614025605.27728-1-wu000273@umn.edu>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Qiushi Wu <wu000273@umn.edu>

pm_runtime_get_sync() increments the runtime PM usage counter even
when it returns an error code, causing incorrect ref count if
pm_runtime_put_noidle() is not called in error handling paths.
And also, when the call of function vpe_runtime_get() failed,
we won't call vpe_runtime_put().
Thus call pm_runtime_put_noidle() if pm_runtime_get_sync() fails
inside vpe_runtime_get().

Fixes: 4571912743ac ("[media] v4l: ti-vpe: Add VPE mem to mem driver")
Signed-off-by: Qiushi Wu <wu000273@umn.edu>
---
 drivers/media/platform/ti-vpe/vpe.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/ti-vpe/vpe.c b/drivers/media/platform/ti-vpe/vpe.c
index cff2fcd6d812..82d3ee45e2e9 100644
--- a/drivers/media/platform/ti-vpe/vpe.c
+++ b/drivers/media/platform/ti-vpe/vpe.c
@@ -2475,6 +2475,8 @@ static int vpe_runtime_get(struct platform_device *pdev)
 
 	r = pm_runtime_get_sync(&pdev->dev);
 	WARN_ON(r < 0);
+	if (r)
+		pm_runtime_put_noidle(&pdev->dev);
 	return r < 0 ? r : 0;
 }
 
-- 
2.17.1

