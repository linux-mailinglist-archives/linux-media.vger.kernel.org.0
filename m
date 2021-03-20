Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60A6C342CBF
	for <lists+linux-media@lfdr.de>; Sat, 20 Mar 2021 13:23:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229787AbhCTMW2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 20 Mar 2021 08:22:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229646AbhCTMWP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 20 Mar 2021 08:22:15 -0400
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com [IPv6:2607:f8b0:4864:20::834])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73446C061762
        for <linux-media@vger.kernel.org>; Sat, 20 Mar 2021 05:22:03 -0700 (PDT)
Received: by mail-qt1-x834.google.com with SMTP id f12so8909840qtq.4
        for <linux-media@vger.kernel.org>; Sat, 20 Mar 2021 05:22:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=m/oYofaPfGDxdbzrYrYo5lIRhLt8jwQQc04DCOZhcAo=;
        b=GvZU7aDSeCxU7F6X1zFyl7eAZeU7LXctySpAXmXztx+uPgup3BjoWhiZBGde/wUkwn
         KbSJ13YkFkcKqlGq/Sjg8kovvDpbNrEWtscSabU/HrALKVZ7L+voKUIrVZzB/bvTZ4Fq
         798as7rVysMXRvyc3SqySRZIBNPYPUWrimOUXPruyNit3fPKajFWKyJ48gB/sXBYzrqo
         uNvN6SIR0EpdjWrXd/6ws5WbBuFxhJBjGi2oPdVH7ctK79pMxROG1vFq48otWUwebNVm
         aktlK9URHpjCSKKXkwd/1o/gbsuL6EydSot208k2UcDbk1uA7jOmnuOfDnTty4nCtCT2
         HTmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=m/oYofaPfGDxdbzrYrYo5lIRhLt8jwQQc04DCOZhcAo=;
        b=rIFacU5r007TReWm53DQ0JG62K6WHoAZCw/Qr4bxVvks8QEdJWb9nDI0Kpr4hPsIrV
         kMiZeATYxsEv/uDRRx/i2AyhBrr4SJ+T8+kQIljWpwhL0mi5K+clhR4UlhJ/PGWLWpPR
         pF1VWVJMrTR6L3uta5VCZb2PFZ5tCc9KVVK/08ISZR1w2cy+KFSUDzZolWkyU6o5ve9T
         gNc0UF+YIWmmUX/h8ABTCsOxRqWlCDaceCweEZ3f/+vOABukXfmcv5qoRBwrxBQpWOiR
         3pkTl6Gp1ukLvI5ayAm1pXILhjjxE/aJqkl+W+WuuFjeVfPgnPqoY4zSedRpKx7UDcEh
         NoUQ==
X-Gm-Message-State: AOAM532Qy9X0EcqKrF1ABcMrd/CoTxlNP/zpKc2Dj3gq/24+G0co7OK5
        eiZL9rvgah0MckQ0iolrLAc=
X-Google-Smtp-Source: ABdhPJyLRbr3abNj5X4mpylLktgtVT5DdpklnatmGmqCJM5T/50WsztSNKi+wZZdsyKo547qSeW4tQ==
X-Received: by 2002:ac8:6913:: with SMTP id e19mr2716299qtr.78.1616242922573;
        Sat, 20 Mar 2021 05:22:02 -0700 (PDT)
Received: from localhost.localdomain ([2804:431:d77f:dedf:c165:89a3:1374:f96a])
        by smtp.gmail.com with ESMTPSA id d24sm6646139qko.54.2021.03.20.05.22.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Mar 2021 05:22:01 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     hverkuil@xs4all.nl
Cc:     boris.brezillon@collabora.com, ezequiel@collabora.com,
        linux-media@vger.kernel.org, Fabio Estevam <festevam@gmail.com>,
        kernel test robot <lkp@intel.com>
Subject: [PATCH] media: rkvdec: Remove of_match_ptr()
Date:   Sat, 20 Mar 2021 09:21:52 -0300
Message-Id: <20210320122152.203446-1-festevam@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When building with CONFIG_OF not set, the following clang
build warning is seen:

>> drivers/staging/media/rkvdec/rkvdec.c:967:34: warning: unused variable 'of_rkvdec_match' [-Wunused-const-variable]

Fix the warning by removing the unnecessary of_match_ptr().

Reported-by: kernel test robot <lkp@intel.com>
Fixes: cd33c830448b ("media: rkvdec: Add the rkvdec driver")
Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 drivers/staging/media/rkvdec/rkvdec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/rkvdec/rkvdec.c b/drivers/staging/media/rkvdec/rkvdec.c
index 225eeca73356..0ff013c1fc38 100644
--- a/drivers/staging/media/rkvdec/rkvdec.c
+++ b/drivers/staging/media/rkvdec/rkvdec.c
@@ -1092,7 +1092,7 @@ static struct platform_driver rkvdec_driver = {
 	.remove = rkvdec_remove,
 	.driver = {
 		   .name = "rkvdec",
-		   .of_match_table = of_match_ptr(of_rkvdec_match),
+		   .of_match_table = of_rkvdec_match,
 		   .pm = &rkvdec_pm_ops,
 	},
 };
-- 
2.25.1

