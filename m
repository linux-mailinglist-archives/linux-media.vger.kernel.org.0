Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04C171EFD5F
	for <lists+linux-media@lfdr.de>; Fri,  5 Jun 2020 18:17:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726584AbgFEQRg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 Jun 2020 12:17:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725944AbgFEQRg (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 5 Jun 2020 12:17:36 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3310BC08C5C2;
        Fri,  5 Jun 2020 09:17:36 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id b16so5092665pfi.13;
        Fri, 05 Jun 2020 09:17:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oz12W4OVrbNOgGMsh8I+jAxp2YubJbboBbG03Fa/oXI=;
        b=Hyt42FlcFFALqfldGOAovOa2QRyETHSK9S42gEPIYHOF5By/+AKoYYpTfR0MFoYVbs
         xOHvc8halwmgm+2N15/ofKAQA/SafDir8rX8fD1Dfi0YJcWCEb+uF/SP+Dk7JAiynn33
         mIlXzeuVP9ix2aJCJob+ajOW+pCZ7mzO/ooN+VJweN3s3Z+Qd2DQ+JxaOpYOolwI65kp
         S5tJOyE06WvAISOqwP8+AU61UKcDtRqzksAzY9MCyrLcyrR00z5QIbweD7ML/DBtSY3o
         R+wcsS0Ftr3/zjYoEhQ+iZaAOMniwOk7mHIrqIOOdrfjTSKi67nl182hyqNBPJF91a3P
         XlIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oz12W4OVrbNOgGMsh8I+jAxp2YubJbboBbG03Fa/oXI=;
        b=mgP7VCSt6WZ4Bc3CeAdh6oaxALmL+tou39EjHwc+d0UfNDkpdhZq3gUCNDB0bHQBWd
         6A4X/DyPmxS+Yyk7PG6+eCksjhy/6WTkZbbPmcToMQgLl7Dtkto2rn/El90i4rdrY8vA
         zwbXjJrO21yEx9JSxFTgHZ3EdmnhxmoNmTnMxfnm/jpZDnTLi1qquVSjhYyDiCXXjoIN
         FzUMreW5F2wahU8lI9rAIjEDtz7B017PXwEXx2PgwNSSm/J1RAw3sHv8I8Z3FKm4nv4C
         hAwqFPyczBzvDwMzX4vCZODCA4RNrDWo/y7XI8GQXvd2TS55LgUEwiIX9Wyd6DB61yff
         0X6g==
X-Gm-Message-State: AOAM531sKrakVmONvCBA3AWoJuvymoNWodyCGpgKgxAA+CoHwcYCVCrf
        FreTT0j4aNINHRDlsNtgp4I=
X-Google-Smtp-Source: ABdhPJx/DaXVteQD3W5hotkPFuAo6WAe9llC7W9COBIzoySJtE4s3siyoNuPt/Hurax1ZW3xeyXfiA==
X-Received: by 2002:a63:8c52:: with SMTP id q18mr2643914pgn.306.1591373855776;
        Fri, 05 Jun 2020 09:17:35 -0700 (PDT)
Received: from suzukaze.ipads-lab.se.sjtu.edu.cn ([202.120.40.82])
        by smtp.gmail.com with ESMTPSA id 73sm75440pge.15.2020.06.05.09.17.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2020 09:17:35 -0700 (PDT)
From:   Chuhong Yuan <hslester96@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Markus Elfring <Markus.Elfring@web.de>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Chuhong Yuan <hslester96@gmail.com>
Subject: [PATCH v2] media: budget-core: Improve exception handling in budget_register()
Date:   Sat,  6 Jun 2020 00:17:28 +0800
Message-Id: <20200605161728.2513316-1-hslester96@gmail.com>
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
Changes in v2:
  - Modify the label of error handler.

 drivers/media/pci/ttpci/budget-core.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/media/pci/ttpci/budget-core.c b/drivers/media/pci/ttpci/budget-core.c
index fadbdeeb4495..293867b9e796 100644
--- a/drivers/media/pci/ttpci/budget-core.c
+++ b/drivers/media/pci/ttpci/budget-core.c
@@ -369,20 +369,25 @@ static int budget_register(struct budget *budget)
 	ret = dvbdemux->dmx.add_frontend(&dvbdemux->dmx, &budget->hw_frontend);
 
 	if (ret < 0)
-		return ret;
+		goto err_release_dmx;
 
 	budget->mem_frontend.source = DMX_MEMORY_FE;
 	ret = dvbdemux->dmx.add_frontend(&dvbdemux->dmx, &budget->mem_frontend);
 	if (ret < 0)
-		return ret;
+		goto err_release_dmx;
 
 	ret = dvbdemux->dmx.connect_frontend(&dvbdemux->dmx, &budget->hw_frontend);
 	if (ret < 0)
-		return ret;
+		goto err_release_dmx;
 
 	dvb_net_init(&budget->dvb_adapter, &budget->dvb_net, &dvbdemux->dmx);
 
 	return 0;
+
+err_release_dmx:
+	dvb_dmxdev_release(&budget->dmxdev);
+	dvb_dmx_release(&budget->demux);
+	return ret;
 }
 
 static void budget_unregister(struct budget *budget)
-- 
2.26.2

