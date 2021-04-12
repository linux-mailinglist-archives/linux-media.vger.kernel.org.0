Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9407135C6DA
	for <lists+linux-media@lfdr.de>; Mon, 12 Apr 2021 14:57:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239454AbhDLM5l (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Apr 2021 08:57:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241506AbhDLM5k (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Apr 2021 08:57:40 -0400
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com [IPv6:2607:f8b0:4864:20::82b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57140C06174A;
        Mon, 12 Apr 2021 05:57:22 -0700 (PDT)
Received: by mail-qt1-x82b.google.com with SMTP id m16so9139051qtx.9;
        Mon, 12 Apr 2021 05:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=j5UqGVDciIGTz6tpsPLFlcyTVvlYKiYpvtIE967eU5o=;
        b=HZj3x1XrBIJ7XpFd3Aea1O3t3LilsmXyxBZ85pZfAUJN1Ba/dGPYQL5dPPPbOrtzzB
         e/tpVHM8Rhfe8v29dKMotESmdcUegvEFNmhVqZYnsBhCsaDvlOyUjTQKGXQhr4rNR9Rt
         PMDJkHP5Fqd6hU8TGVftW2dcAdQ1sJEaeUV1h1nhfag4VlxvtD/NYneC4N7ZQTRCjfTB
         NTjn2pZO/heL5PtJCLMstZHdJf79G4zsZzRx4Iv1QTfT7GNvpkzZut8mFVHBnDsIk7g9
         EdByLZUm3/EPXm+0C+GbcGKtI/2QItqYRq3Ug01ShLqcYk66s3g9EIw6XLytuu/edp8W
         muRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=j5UqGVDciIGTz6tpsPLFlcyTVvlYKiYpvtIE967eU5o=;
        b=pHGUBMIFMlJOGjSAXfA9YFkXlRhBi6EnzjCFdXyWwSaiJEp/SSlhVv1rSioW5wS9xg
         wSDp2GhHipG4vft+CF6x5Qoz+UC30l3K40X1mOH3fIOkUlAxtyS6HYODOsgVLhrzuvBL
         kQgiLddYuFVCz+f0nLzbEWCZJK/jHKgYgkhgmdW7BY9SmhHT9ua/EfRo9lec1WYso8DH
         6VWnDNel/oKgXHmLsa+DW2Lyg04o0vrlU2FaRg7TlqAeASMmB5FbHThthZYgHR09g9Ic
         hscQYGHE7Nz++5vlRw4dVM+nFjLl+5vR3lGEc81QroEZwT7nhQ4Np2ik605he6gZ4koK
         B38w==
X-Gm-Message-State: AOAM530Po4R8s2RXqT8IMcN+oteEgAYOgpLYMuGpyY3frmv1VGmM4RrG
        m9hjfIjmvq9yHAVXiBStVcI=
X-Google-Smtp-Source: ABdhPJyXkdZB9fGQujGYGvdo+eT4teAggJRmDe0U2Hq1Hdml14HGD2HuChgOd9YfCtILpM3nIy1avg==
X-Received: by 2002:a05:622a:2c4:: with SMTP id a4mr25351604qtx.145.1618232241272;
        Mon, 12 Apr 2021 05:57:21 -0700 (PDT)
Received: from focaruja ([2001:1284:f016:a037:476a:dfcd:f18f:9ad5])
        by smtp.gmail.com with ESMTPSA id 1sm7983909qtu.96.2021.04.12.05.57.20
        (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Mon, 12 Apr 2021 05:57:21 -0700 (PDT)
Date:   Mon, 12 Apr 2021 09:57:18 -0300
From:   Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com
Subject: [Outreachy kernel][PATCH 3/4 v2] staging: media: omap4iss: Replace
 macro function by static inline function in file iss_ipipeif.c
Message-ID: <2907e1496de66f59236ee6ebc84292b1454926d3.1618231618.git.alinesantanacordeiro@gmail.com>
References: <cover.1618231618.git.alinesantanacordeiro@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1618231618.git.alinesantanacordeiro@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Replace macro function by static inline function.
Issue suggested by Julia.

Signed-off-by: Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>
---

Changes since v1:
 - Insert file path in commit message

 drivers/staging/media/omap4iss/iss_ipipeif.c | 62 +++++++++++++++-------------
 1 file changed, 34 insertions(+), 28 deletions(-)

diff --git a/drivers/staging/media/omap4iss/iss_ipipeif.c b/drivers/staging/media/omap4iss/iss_ipipeif.c
index c2978d0..3dc98f6 100644
--- a/drivers/staging/media/omap4iss/iss_ipipeif.c
+++ b/drivers/staging/media/omap4iss/iss_ipipeif.c
@@ -34,17 +34,23 @@ static const unsigned int ipipeif_fmts[] = {
  *
  * Also prints other debug information stored in the IPIPEIF module.
  */
-#define IPIPEIF_PRINT_REGISTER(iss, name)\
-	dev_dbg(iss->dev, "###IPIPEIF " #name "=0x%08x\n", \
-		iss_reg_read(iss, OMAP4_ISS_MEM_ISP_IPIPEIF, IPIPEIF_##name))
+static inline ipipeif_print_register(iss, name)
+{
+	dev_dbg(iss->dev, "###IPIPEIF " #name "=0x%08x\n",
+		iss_reg_read(iss, OMAP4_ISS_MEM_ISP_IPIPEIF, IPIPEIF_##name));
+}
 
-#define ISIF_PRINT_REGISTER(iss, name)\
-	dev_dbg(iss->dev, "###ISIF " #name "=0x%08x\n", \
-		iss_reg_read(iss, OMAP4_ISS_MEM_ISP_ISIF, ISIF_##name))
+static inline isif_print_register(iss, name)
+{
+	dev_dbg(iss->dev, "###ISIF " #name "=0x%08x\n",
+		iss_reg_read(iss, OMAP4_ISS_MEM_ISP_ISIF, ISIF_##name));
+}
 
-#define ISP5_PRINT_REGISTER(iss, name)\
-	dev_dbg(iss->dev, "###ISP5 " #name "=0x%08x\n", \
-		iss_reg_read(iss, OMAP4_ISS_MEM_ISP_SYS1, ISP5_##name))
+static inline isp5_print_register(iss, name)
+{
+	dev_dbg(iss->dev, "###ISP5 " #name "=0x%08x\n",
+		iss_reg_read(iss, OMAP4_ISS_MEM_ISP_SYS1, ISP5_##name));
+}
 
 static void ipipeif_print_status(struct iss_ipipeif_device *ipipeif)
 {
@@ -52,25 +58,25 @@ static void ipipeif_print_status(struct iss_ipipeif_device *ipipeif)
 
 	dev_dbg(iss->dev, "-------------IPIPEIF Register dump-------------\n");
 
-	IPIPEIF_PRINT_REGISTER(iss, CFG1);
-	IPIPEIF_PRINT_REGISTER(iss, CFG2);
-
-	ISIF_PRINT_REGISTER(iss, SYNCEN);
-	ISIF_PRINT_REGISTER(iss, CADU);
-	ISIF_PRINT_REGISTER(iss, CADL);
-	ISIF_PRINT_REGISTER(iss, MODESET);
-	ISIF_PRINT_REGISTER(iss, CCOLP);
-	ISIF_PRINT_REGISTER(iss, SPH);
-	ISIF_PRINT_REGISTER(iss, LNH);
-	ISIF_PRINT_REGISTER(iss, LNV);
-	ISIF_PRINT_REGISTER(iss, VDINT(0));
-	ISIF_PRINT_REGISTER(iss, HSIZE);
-
-	ISP5_PRINT_REGISTER(iss, SYSCONFIG);
-	ISP5_PRINT_REGISTER(iss, CTRL);
-	ISP5_PRINT_REGISTER(iss, IRQSTATUS(0));
-	ISP5_PRINT_REGISTER(iss, IRQENABLE_SET(0));
-	ISP5_PRINT_REGISTER(iss, IRQENABLE_CLR(0));
+	ipipeif_print_register(iss, CFG1);
+	ipipeif_print_register(iss, CFG2);
+
+	isif_print_register(iss, SYNCEN);
+	isif_print_register(iss, CADU);
+	isif_print_register(iss, CADL);
+	isif_print_register(iss, MODESET);
+	isif_print_register(iss, CCOLP);
+	isif_print_register(iss, SPH);
+	isif_print_register(iss, LNH);
+	isif_print_register(iss, LNV);
+	isif_print_register(iss, VDINT(0));
+	isif_print_register(iss, HSIZE);
+
+	isp5_print_register(iss, SYSCONFIG);
+	isp5_print_register(iss, CTRL);
+	isp5_print_register(iss, IRQSTATUS(0));
+	isp5_print_register(iss, IRQENABLE_SET(0));
+	isp5_print_register(iss, IRQENABLE_CLR(0));
 
 	dev_dbg(iss->dev, "-----------------------------------------------\n");
 }
-- 
2.7.4

