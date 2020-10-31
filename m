Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C773C2A12D1
	for <lists+linux-media@lfdr.de>; Sat, 31 Oct 2020 03:22:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726184AbgJaCV7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Oct 2020 22:21:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725536AbgJaCV6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Oct 2020 22:21:58 -0400
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com [IPv6:2607:f8b0:4864:20::742])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA72AC0613D5;
        Fri, 30 Oct 2020 19:21:58 -0700 (PDT)
Received: by mail-qk1-x742.google.com with SMTP id 140so6813415qko.2;
        Fri, 30 Oct 2020 19:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=y6nQhjwk16EMqW7jcByNPjkSwtHhFpzBBmo6DgmMqpU=;
        b=mSZwwyb3Yrj4HY1j6Ff9u9TzJwImVJGhdcr+hFiEL9RYB0shkHn+n0qhiuSQHVmFT7
         7Emt9Of/xnNPaOBSXXcr+gbKEngswnGTgaHfhyt0v4ZyHQ1MiaHnfTPKUZ5Ajdog5GQX
         YoSq39SsfwMdnLx7FHFD+QL/dQdW65BUbbSldNtCwFk+Vg0gTNaicrD4n5vbw9WEVgUx
         PvFb2ttjiNyPtPUtugFvsKoTjmCj0fGX6YytaxGOldEQrV+q6GaA/D0jV1hB0IaRomBt
         9Vz7l2o3K3MJtrtbAyGr/b3sPvuq/XtnB5v22SfDOqxzgi7ebHydMsJzYOif0JfI+1sg
         9huQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=y6nQhjwk16EMqW7jcByNPjkSwtHhFpzBBmo6DgmMqpU=;
        b=aDLZHzUXyjkdUZrVyOqpt4zx1huyRJKKF1mTmQRKjLDZIRJqAS19MBcZSmeLE25J57
         eDCvZTQoaIo621P3ftjVOEumVgKWybaHeDFe7qB9PgR4V0hBudAnB6GnQY5HFIKkKly1
         KXds+hs3qqxGVk459lqKRXj2f7FRd+GrivIs3ooP3g03rF4IVbtm1CioPYOmEvs5SA8o
         FzkkzeTnieNoDzHu6jUTviceUcak/ZEjntV9gtskD3bsnicRUaQgYhL9BplJerQ33K+2
         Y7ldRPu6JWn7hcG0JoRTgMGMMM1JaDLS/9X6t25ptivmYY0lBM/t5XBr9mKJewJI4bWS
         pfZA==
X-Gm-Message-State: AOAM5326bQ9YWGPWN2FaREwoA4JggcI9lsyAXUACAeylS7KPHiSt2FOm
        x6/soRrqkOIDWaoLpdIzC14=
X-Google-Smtp-Source: ABdhPJxT8fPdK8XK6QGs2frfDHQeELKqhiNH6s62eWu8FVpuY22gGmePJ+R7vR29UECKBLKvBVpv4g==
X-Received: by 2002:a05:620a:1668:: with SMTP id d8mr5330772qko.192.1604110917976;
        Fri, 30 Oct 2020 19:21:57 -0700 (PDT)
Received: from fedora-project ([2604:2000:ffc0:0:74b0:102f:8bef:7279])
        by smtp.gmail.com with ESMTPSA id n1sm1253747qtr.52.2020.10.30.19.21.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2020 19:21:57 -0700 (PDT)
Date:   Fri, 30 Oct 2020 22:21:55 -0400
From:   Nigel Christian <nigel.l.christian@gmail.com>
To:     yong.zhi@intel.com, trivial@kernel.org
Cc:     linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] media: ipu3-cio2: fix trivial style warning
Message-ID: <20201031022155.GA32878@fedora-project>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Comment has 'the' repeated twice. Let's clean it up.
This patch reduces checkpatch warnings for this file to nil.

Signed-off-by: Nigel Christian <nigel.l.christian@gmail.com>
---
 drivers/media/pci/intel/ipu3/ipu3-cio2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2.c b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
index 4e598e937dfe..d4ff80ff7be0 100644
--- a/drivers/media/pci/intel/ipu3/ipu3-cio2.c
+++ b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
@@ -286,7 +286,7 @@ static s32 cio2_rx_timing(s32 a, s32 b, s64 freq, int def)
 	return r;
 };
 
-/* Calculate the the delay value for termination enable of clock lane HS Rx */
+/* Calculate the delay value for termination enable of clock lane HS Rx */
 static int cio2_csi2_calc_timing(struct cio2_device *cio2, struct cio2_queue *q,
 				 struct cio2_csi2_timing *timing)
 {
-- 
2.28.0

