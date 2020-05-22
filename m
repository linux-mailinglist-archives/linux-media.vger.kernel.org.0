Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4EEBF1DF1E3
	for <lists+linux-media@lfdr.de>; Sat, 23 May 2020 00:35:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731144AbgEVWfT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 May 2020 18:35:19 -0400
Received: from mta-p8.oit.umn.edu ([134.84.196.208]:55942 "EHLO
        mta-p8.oit.umn.edu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731029AbgEVWfT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 May 2020 18:35:19 -0400
X-Greylist: delayed 973 seconds by postgrey-1.27 at vger.kernel.org; Fri, 22 May 2020 18:35:18 EDT
Received: from localhost (unknown [127.0.0.1])
        by mta-p8.oit.umn.edu (Postfix) with ESMTP id 49TLVw2Mcqz9vfW1
        for <linux-media@vger.kernel.org>; Fri, 22 May 2020 22:19:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p8.oit.umn.edu ([127.0.0.1])
        by localhost (mta-p8.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id SeN-PJZzojl6 for <linux-media@vger.kernel.org>;
        Fri, 22 May 2020 17:19:04 -0500 (CDT)
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com [209.85.166.70])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mta-p8.oit.umn.edu (Postfix) with ESMTPS id 49TLVw0m4Wz9vfWD
        for <linux-media@vger.kernel.org>; Fri, 22 May 2020 17:19:04 -0500 (CDT)
DMARC-Filter: OpenDMARC Filter v1.3.2 mta-p8.oit.umn.edu 49TLVw0m4Wz9vfWD
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-p8.oit.umn.edu 49TLVw0m4Wz9vfWD
Received: by mail-io1-f70.google.com with SMTP id z11so8238865iom.18
        for <linux-media@vger.kernel.org>; Fri, 22 May 2020 15:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umn.edu; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xf86DUDR0KCytTZe0PoPEVKJWswyj76Qc8cwS/5pEd8=;
        b=BTy7Qzvia67Px1tEvWTi8X/NeNB6jPnEST1ETVo7uBwyZ8Wkew6opFNFU8mNZzW21R
         nNJWn2xhDpBNOD7j3Cqf8M9TKnEA2ESWSydG4JQQoGk92GLN4GiEptxM9qn653V3LfWm
         zR5YMeRMAhWXAYm6MITvDwZequAwm9QG2kyc1w82icjZ3Epz/qAhABqHLh9SCu83Nnht
         ky7cXtHlMl0IFuKy3ERdiQqKPI3GxOFe9PbIeujOsk/eetVdQFtkqjF1ZxhM5b0vv6QN
         cCwKam8UCdajHSyeHNTBnSIWQJzPsZVO4AMp6WGTvZ2GS+ykM4DahQlwnrzZHGVYr66w
         89MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xf86DUDR0KCytTZe0PoPEVKJWswyj76Qc8cwS/5pEd8=;
        b=iJXgYwnxoF+Ile3rQMFAJqD0GyRtcQtCfJSBeU3mTIvcfojKMlyr/cujG46DxwnJR0
         Uhr9G922GOZ36k2d3ZIpAVMPxa29LoBV0Y/8WUyFqAywuHtbTrQzwySvXLvc2H6qVtM4
         0Fbgmlps4jqvczwLMqQMAVaQgvZd0PvCRd4NDZ31ads7E7iIOqWt+MULvawog0iL0eAF
         sbZ1sTrfmSWs9BjvkbChUoGfzzhgxa2PUScm3JF3det8DKHJeNI6GXn9tLIfk8U0gQuC
         Zp0p3uK7zL1jeHRcCeXoxDamyv7GCmcEz0dhlCDEhT5DbzNKoV9fQUKFJA7pFUqxhL1Q
         UtRA==
X-Gm-Message-State: AOAM531Mdw/kTOtod3OVua0QapmNCWF7m2YGslkEmobUJs0ORg2Dhdhy
        p29UdEvz0/NSTKDNCycgB/Fb6dr1KD1u4YTYx9SxPXBSCdSM1bCHNsaxUQntniPMeWA/RL49Fi/
        IyNDE9gu6lXr2iYgx8YRQZTFJ8ok=
X-Received: by 2002:a92:c7a4:: with SMTP id f4mr15370414ilk.44.1590185943580;
        Fri, 22 May 2020 15:19:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw+J0ruAKNhsdIwEN+ydT0VoCKGFWbQcj4ml3xYNL1KOfJyA/BR/ZbR8JROJoT/OQqoIenz1Q==
X-Received: by 2002:a92:c7a4:: with SMTP id f4mr15370380ilk.44.1590185943240;
        Fri, 22 May 2020 15:19:03 -0700 (PDT)
Received: from qiushi.dtc.umn.edu (cs-kh5248-02-umh.cs.umn.edu. [128.101.106.4])
        by smtp.gmail.com with ESMTPSA id 7sm4210431ion.52.2020.05.22.15.19.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2020 15:19:02 -0700 (PDT)
From:   wu000273@umn.edu
To:     sylvester.nawrocki@gmail.com
Cc:     mchehab@kernel.org, linux-media@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        kjlu@umn.edu, wu000273@umn.edu
Subject: [PATCH] media: s3c-camif: fix missing disable in tegra_adma_probe().
Date:   Fri, 22 May 2020 17:18:55 -0500
Message-Id: <20200522221855.7891-1-wu000273@umn.edu>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Qiushi Wu <wu000273@umn.edu>

"pm_runtime_enable()" was not handled by "pm_runtime_disable()"
after a call of the function “pm_runtime_get_sync” failed.
Thus move the jump target “err_pm” before calling pm_runtime_disable().

Fixes: babde1c243b2 ("[media] V4L: Add driver for S3C24XX/S3C64XX SoC series camera interface")
Signed-off-by: Qiushi Wu <wu000273@umn.edu>
---
 drivers/media/platform/s3c-camif/camif-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/s3c-camif/camif-core.c b/drivers/media/platform/s3c-camif/camif-core.c
index c6fbcd7036d6..12ee49638f44 100644
--- a/drivers/media/platform/s3c-camif/camif-core.c
+++ b/drivers/media/platform/s3c-camif/camif-core.c
@@ -500,8 +500,8 @@ static int s3c_camif_probe(struct platform_device *pdev)
 	camif_unregister_media_entities(camif);
 err_alloc:
 	pm_runtime_put(dev);
-	pm_runtime_disable(dev);
 err_pm:
+	pm_runtime_disable(dev);
 	camif_clk_put(camif);
 err_clk:
 	s3c_camif_unregister_subdev(camif);
-- 
2.17.1

