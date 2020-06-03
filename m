Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1FA311ECC92
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2020 11:27:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726315AbgFCJ05 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Jun 2020 05:26:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725943AbgFCJ05 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 3 Jun 2020 05:26:57 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB5F2C05BD43;
        Wed,  3 Jun 2020 02:26:56 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id x22so1240095pfn.3;
        Wed, 03 Jun 2020 02:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iFs/P0L8u0SRxxxhK/lyOIunYVt5h41AqSCalRyPGJI=;
        b=COLRVPPa0xwQp41D2aytWhQaPlAnV8FWmDhJ0wTN5wYTYTVrgiitczPOaPHF8ybO9Z
         4saX1DcAQckaL56o2a8dhcRem1Wr4MtGj4xWMwt+JxgI7aQnidew9jU0JYlPgGmThnYZ
         hF4E1HoYYGJaVle2Iv/bxa0m/9I4JTqXlsRTTIULjLNkJu5EHV/asm9NrogEpxPOvBT8
         qw3FFWWozK3qh5DZO6aScSQEpDaKG2f0JAWLAvbhA0BBf+i2BNClyA9MJt+LLVHwvd0G
         Pm+xNYcrK8czzb+b/q49zfD64wOlhHIDD3TfPN1rV9As9ZC39LPb+VjK+TOtZ1w32jVZ
         rrwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iFs/P0L8u0SRxxxhK/lyOIunYVt5h41AqSCalRyPGJI=;
        b=cCgVkY8G+hn3A0QdtXbsMgZ9kQEWBaXwEEAk2YGS2T7yz1KDHeVkZsv7V4c9FwTbf+
         7oNPqvYSb7zjsfwfFKbCuealj+akrkRk/DERZTDA0gRz0L6omnXsDWb2ajmEc/cLecFS
         fLrsEztW2zya5OYvTR8kTOGKG6oiIgniOmW6cDiCA0XAxLCKpLkiK7J7h8bagbuPALOg
         BXKDnKYRO3XwK7tcxGWYFMK0+7867b22R34k3Gkda8bW6dHI7Il/YMWwa/zMHYKIMz1k
         6HiVYHXAS4UwF+tYzTvp8O0+M6z7UBwvEWhcFzoXHuFoLgOcsKPzyh3ia6thGMn3kXhm
         MXQg==
X-Gm-Message-State: AOAM531QO1x2mTLD2f6odIaWW5DHxUVh8/tWQEusK2eZ1sSlZuTpUptg
        B5hD8dIxUQ2tzB0/vm6rGds=
X-Google-Smtp-Source: ABdhPJyowqKTl3scWSLvJtESVWovnaENZ07yN8WVzVyDZ1+IheJhc+KCbYryvhHsYYlZ7HY7KSEafQ==
X-Received: by 2002:a17:90b:2350:: with SMTP id ms16mr4621240pjb.163.1591176416494;
        Wed, 03 Jun 2020 02:26:56 -0700 (PDT)
Received: from suzukaze.ipads-lab.se.sjtu.edu.cn ([202.120.40.82])
        by smtp.gmail.com with ESMTPSA id 4sm1420546pfn.205.2020.06.03.02.26.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2020 02:26:56 -0700 (PDT)
From:   Chuhong Yuan <hslester96@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Chuhong Yuan <hslester96@gmail.com>
Subject: [PATCH] media: budget-core: Add missed undo functions in budget_register()
Date:   Wed,  3 Jun 2020 17:26:48 +0800
Message-Id: <20200603092648.1424548-1-hslester96@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

budget_register() has no error handling after its failure.
Add the missed undo functions for error handling to fix it.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Chuhong Yuan <hslester96@gmail.com>
---
 drivers/media/pci/ttpci/budget-core.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/media/pci/ttpci/budget-core.c b/drivers/media/pci/ttpci/budget-core.c
index fadbdeeb4495..53aa34a3160b 100644
--- a/drivers/media/pci/ttpci/budget-core.c
+++ b/drivers/media/pci/ttpci/budget-core.c
@@ -369,20 +369,25 @@ static int budget_register(struct budget *budget)
 	ret = dvbdemux->dmx.add_frontend(&dvbdemux->dmx, &budget->hw_frontend);
 
 	if (ret < 0)
-		return ret;
+		goto err;
 
 	budget->mem_frontend.source = DMX_MEMORY_FE;
 	ret = dvbdemux->dmx.add_frontend(&dvbdemux->dmx, &budget->mem_frontend);
 	if (ret < 0)
-		return ret;
+		goto err;
 
 	ret = dvbdemux->dmx.connect_frontend(&dvbdemux->dmx, &budget->hw_frontend);
 	if (ret < 0)
-		return ret;
+		goto err;
 
 	dvb_net_init(&budget->dvb_adapter, &budget->dvb_net, &dvbdemux->dmx);
 
 	return 0;
+
+err:
+	dvb_dmxdev_release(&budget->dmxdev);
+	dvb_dmx_release(&budget->demux);
+	return ret;
 }
 
 static void budget_unregister(struct budget *budget)
-- 
2.26.2

