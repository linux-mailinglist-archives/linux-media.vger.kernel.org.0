Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6DBFE34CFF7
	for <lists+linux-media@lfdr.de>; Mon, 29 Mar 2021 14:22:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230420AbhC2MWI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 Mar 2021 08:22:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230098AbhC2MVy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 Mar 2021 08:21:54 -0400
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com [IPv6:2607:f8b0:4864:20::732])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16B25C061574
        for <linux-media@vger.kernel.org>; Mon, 29 Mar 2021 05:21:54 -0700 (PDT)
Received: by mail-qk1-x732.google.com with SMTP id c3so12127229qkc.5
        for <linux-media@vger.kernel.org>; Mon, 29 Mar 2021 05:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=p6rmO3zHRzz2l323GfaHouhtqwmc+pnC3YfIkr5pe5w=;
        b=UOHS8W0JbsucbBMxNs3JSiRkGbFmtCz0GyYLC2w59DIYSCkhKEJFPhY3HX3fIom2xI
         /1LYYscvXIpLr8CNyAC82HGXmy04VOG4OqbnJvAWKy4/cMKQZ/Ww5NTooI3ciikQe3nV
         Id1i6CLbisCLFLjM10Lhe51C9f9CiKOL5872iBiQu33ToxYQUIWP6rFvdoJIeq2Ox4H1
         F6EfcbcHT9LbXyzwM7yFYeVmUB6/La0hZMJztre64Me/q7r+SYR3qufGlbTZSvZkgBfo
         ptHRO7mJ1J84RS+k740aUjKPt9Jvu+IylArOdy6b5cBs7Erk7KV1ZEqUVvbthGPyqOv0
         K3cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=p6rmO3zHRzz2l323GfaHouhtqwmc+pnC3YfIkr5pe5w=;
        b=To/nm3WR+hEWZk6CwyRuEhRHCxpJ0Qxw3JObEeb8ukIr8E3O/Mlvuopt+KPlHWQdvT
         dQHiUf67QUT3CZl0tIFIjR+WFuz/EjHoZ7CT7KYuuXHXMtRYtfZ5cvyRIYK5EY/XqTe2
         FkI28BSp7lG+JBwJOedtrF6KF1rqfWDpBn0FomrPiWo281SXGQ4Iu27IYxtmZ2akn9+G
         iX4mFlupRi6HqnK0OMjqFEuJjCipd0baUfeiBKWwLPDr4lvBQTxdArcwwH2OnQNlNzgA
         A1vASDZbr2HCWC4Yhk5Zh+7dRbwbzEVXDBjwRVh6W2ZBGI8aawKblHPA3PsL/3xb/M3D
         Heqg==
X-Gm-Message-State: AOAM531QTs5vEEki0fElWMmD1zXdsj6VZPwdxP0vREY57L5UoC3HEr2U
        tLd/KdTA7ENWwrNk7I8GCTY=
X-Google-Smtp-Source: ABdhPJxGmao58LkgXlzRc1FjG3JR3prZ/UXqGqqLYxND+JKttucbHXFlbOqbMiqTbpnodVUgr4v51A==
X-Received: by 2002:a37:b206:: with SMTP id b6mr25081311qkf.275.1617020513205;
        Mon, 29 Mar 2021 05:21:53 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:482:919:7898:56c:200:f2a5])
        by smtp.gmail.com with ESMTPSA id a8sm8214366qtx.9.2021.03.29.05.21.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Mar 2021 05:21:52 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     hverkuil@xs4all.nl
Cc:     p.zabel@pengutronix.de, linux-media@vger.kernel.org,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH] media: imx-pxp: Remove unneeded of_match_ptr()
Date:   Mon, 29 Mar 2021 09:21:43 -0300
Message-Id: <20210329122143.579240-1-festevam@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

i.MX is a DT-only platform, so of_match_ptr() can be safely
removed.

Remove the unneeded of_match_ptr(). 

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 drivers/media/platform/imx-pxp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/imx-pxp.c b/drivers/media/platform/imx-pxp.c
index 08d76eb05ed1..078d19afe35f 100644
--- a/drivers/media/platform/imx-pxp.c
+++ b/drivers/media/platform/imx-pxp.c
@@ -1755,7 +1755,7 @@ static struct platform_driver pxp_driver = {
 	.remove		= pxp_remove,
 	.driver		= {
 		.name	= MEM2MEM_NAME,
-		.of_match_table = of_match_ptr(pxp_dt_ids),
+		.of_match_table = pxp_dt_ids,
 	},
 };
 
-- 
2.25.1

