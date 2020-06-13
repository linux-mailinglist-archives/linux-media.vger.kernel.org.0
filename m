Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6F781F85A7
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2020 00:30:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726797AbgFMWaS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 13 Jun 2020 18:30:18 -0400
Received: from mta-p7.oit.umn.edu ([134.84.196.207]:35700 "EHLO
        mta-p7.oit.umn.edu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726791AbgFMWaP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 13 Jun 2020 18:30:15 -0400
Received: from localhost (unknown [127.0.0.1])
        by mta-p7.oit.umn.edu (Postfix) with ESMTP id 49ksjg2HjGz9vLHJ
        for <linux-media@vger.kernel.org>; Sat, 13 Jun 2020 22:30:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p7.oit.umn.edu ([127.0.0.1])
        by localhost (mta-p7.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id brsosEMtGDxm for <linux-media@vger.kernel.org>;
        Sat, 13 Jun 2020 17:30:15 -0500 (CDT)
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com [209.85.166.69])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mta-p7.oit.umn.edu (Postfix) with ESMTPS id 49ksjg0fRNz9vLHF
        for <linux-media@vger.kernel.org>; Sat, 13 Jun 2020 17:30:15 -0500 (CDT)
DMARC-Filter: OpenDMARC Filter v1.3.2 mta-p7.oit.umn.edu 49ksjg0fRNz9vLHF
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-p7.oit.umn.edu 49ksjg0fRNz9vLHF
Received: by mail-io1-f69.google.com with SMTP id h65so8710688ioa.7
        for <linux-media@vger.kernel.org>; Sat, 13 Jun 2020 15:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umn.edu; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=8hCA2ocDcAQFNTYWh+iYUMXDSO315n4C2muJzNBSj0Y=;
        b=UTcTy5Ma0D3H+UNggPpPgtobBvnEipOK3UTIavkiBqbVnmTivWYf+Qid/kDhNQ1a3/
         9iHBC+AhG4g9tSZZoRFeWc6lDotCffcCCFYZBMss4xnpW63moFTVBTg8BAV26pxXfTcd
         tCYSdvxjJHQoqcWH8gfxEcfFnFBxgjClgVb7jjmBQy12GguFVkMcG4Wxd4No9xuwgHNm
         Xx3hAje2Y5DAUqL+1kizKpQ5t5E6Zgr2ZyIlPgxO9Uk7eHERkuIc2AVhZ29T1U+WOXMt
         X74lkRBJEr16CFildX3duiDZ5BpKOtibECBLMS43VuKFOLaWVWd6Lka8nCH/Yl9KphoZ
         Hvrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=8hCA2ocDcAQFNTYWh+iYUMXDSO315n4C2muJzNBSj0Y=;
        b=qUDcq8mtsEQkGOADupX1AmW4vQS23XT+wKAGAh3RHtMOJtmJhJjaMcM2KsJFJXzH+4
         6+J1CzAFXVOIV9KFIbEbTsMM2KwgGHgEL+sBLcLXyvyo2Cfu2w+iYzF491ioEQsUkoaG
         omQvWN+xaOfPLQQuYhKni0bAnZLD8CeLpcEVhOeOudFqn2PDKih4m/9KgLWhogCNhQnN
         CDcdddiybnkwwnb/S8Duw4uct0iDG595/Lui9PLyr6eqWH7Bfg8crKJ5rbCKYtV1rrz0
         o9xf8RpJLiHBeWF6opTo67OLn4HjnjG2M7irPjewJFOT8CC7YwGi4jtg4yXOMVjT0RdJ
         Y4Vw==
X-Gm-Message-State: AOAM532C+yarFHfOlgHMV293y642wZT/7AUEU9tb15Py9wmMLBmxbWSn
        me4lFDM/N09B9Hv32/2L9ND6RFuxmdSsD1AeRehLJUvn8uofARN+37LZ5utVgYGeei7fJo4NOfI
        lIWq/GfDRLKx9cNF336Tw+6hpetg=
X-Received: by 2002:a92:40dc:: with SMTP id d89mr20424572ill.170.1592087414651;
        Sat, 13 Jun 2020 15:30:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx3aCzYvSn3AD2YCTZMEa/8FnqJZqsaL4OFcyPyR3T5Pf1RakQxKA/DqGRCemkZQY1BudpzSw==
X-Received: by 2002:a92:40dc:: with SMTP id d89mr20424556ill.170.1592087414428;
        Sat, 13 Jun 2020 15:30:14 -0700 (PDT)
Received: from qiushi.cs.umn.edu ([2607:ea00:101:3c74:4874:45:bcb4:df60])
        by smtp.gmail.com with ESMTPSA id c85sm5596290ilg.41.2020.06.13.15.30.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2020 15:30:13 -0700 (PDT)
From:   wu000273@umn.edu
To:     kjlu@umn.edu
Cc:     wu000273@umn.edu,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] media: rcar-vin: Fix a reference count leak.
Date:   Sat, 13 Jun 2020 17:30:08 -0500
Message-Id: <20200613223008.11720-1-wu000273@umn.edu>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Qiushi Wu <wu000273@umn.edu>

pm_runtime_get_sync() increments the runtime PM usage counter even
when it returns an error code. Thus call pm_runtime_put_noidle()
if pm_runtime_get_sync() fails.

Fixes: 90dedce9bc54 ("media: rcar-vin: add function to manipulate Gen3 chsel value")
Signed-off-by: Qiushi Wu <wu000273@umn.edu>
---
 drivers/media/platform/rcar-vin/rcar-dma.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/rcar-vin/rcar-dma.c b/drivers/media/platform/rcar-vin/rcar-dma.c
index 1a30cd036371..95bc9e0e8792 100644
--- a/drivers/media/platform/rcar-vin/rcar-dma.c
+++ b/drivers/media/platform/rcar-vin/rcar-dma.c
@@ -1392,8 +1392,10 @@ int rvin_set_channel_routing(struct rvin_dev *vin, u8 chsel)
 	int ret;
 
 	ret = pm_runtime_get_sync(vin->dev);
-	if (ret < 0)
+	if (ret < 0) {
+		pm_runtime_put_noidle(vin->dev);
 		return ret;
+	}
 
 	/* Make register writes take effect immediately. */
 	vnmc = rvin_read(vin, VNMC_REG);
-- 
2.17.1

