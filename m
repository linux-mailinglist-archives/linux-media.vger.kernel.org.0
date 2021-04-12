Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07FA035C650
	for <lists+linux-media@lfdr.de>; Mon, 12 Apr 2021 14:32:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241000AbhDLMdG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Apr 2021 08:33:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240999AbhDLMdF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Apr 2021 08:33:05 -0400
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com [IPv6:2607:f8b0:4864:20::736])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38370C06174A;
        Mon, 12 Apr 2021 05:32:47 -0700 (PDT)
Received: by mail-qk1-x736.google.com with SMTP id s5so4281886qkj.5;
        Mon, 12 Apr 2021 05:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ufJcji2+m5srymBQPjBrGfe67cUzEZqDOtn26wg7648=;
        b=qmZowgBMDh564wGGBAK1Y1joojizHF7rqrmZftAPLZxtvx27k/0X6Pgut82fixi5cf
         bA9LTq2CbQyy7wM83UFfKezSsxfv+WnJe/VKlPDE19Yes60j8YKthliqDOnVEjMk4bA2
         heb1VIYTXB10TlggpqLE0O6Guif5cScxju6/dRAbnNVIVjggyRh9mMP/7hnBjnEvhc2T
         GASDkr+istx/XQJSrD/Y9BzVq4CUfwoyXq5Wv7l0q66Wk4pb1Qj/M4y0ieDcaxpVtM9Z
         LwgV+O8dqBJkR9OLyxWDW/zZ5A4k6IGVF+j99oWD4KrYc5PAMGLp3LrQDawSSlAlKxdZ
         /GVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ufJcji2+m5srymBQPjBrGfe67cUzEZqDOtn26wg7648=;
        b=sDgG+h9LhM3KfSMHUwI2NIiEAjtiNrZJ06C55sIoNkUyP9ALdKdXIFmnOKLAqwrumb
         AolB/c6AL4EeiWB17bQTnwyA0Q+BbM26Z0b+LweurKGhYdgHA8K78JiBrbqVWsruJKC6
         cwESCcGM6zha1TqVm2UfQRxQfx5tYNn2VSMpDD815ioJSbm7YX1Voy5mCl/Vys55zrY6
         dH2aKk7Ur3yuOo94YMrsT9OKJS+nG3uVWHN3qq7orXA3DVJWuQf+Aj+7yjr2SvNpR93L
         4wFMuG12GjgHOITszR06q+uqmClbzydi3VunejCf5c9A3h4AygF2gY03irwJwvym9EmN
         kKKQ==
X-Gm-Message-State: AOAM5317pQwLcyEUZSDn1MtEE7sr/xpCr0sGl76LtSG9kawzpljbSBRh
        3VvBLPhKpKmfVd8bE0SMyb8=
X-Google-Smtp-Source: ABdhPJwmIem/9PltNNtX361r7eJlfDfF/v4WGNSnhLLBJHmAaPropaUMqQ3u/AAtkSQzUNsEa02G7g==
X-Received: by 2002:ae9:e015:: with SMTP id m21mr25440661qkk.420.1618230766509;
        Mon, 12 Apr 2021 05:32:46 -0700 (PDT)
Received: from focaruja ([2001:1284:f016:a037:476a:dfcd:f18f:9ad5])
        by smtp.gmail.com with ESMTPSA id f25sm6898173qtm.49.2021.04.12.05.32.45
        (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Mon, 12 Apr 2021 05:32:46 -0700 (PDT)
Date:   Mon, 12 Apr 2021 09:32:43 -0300
From:   Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com
Subject: [Outreachy kernel][PATCH 3/4] Replace macro function by static
 inline function in file iss_ipipeif.c
Message-ID: <808aaecdd2783cd1c216ba5ca3d592242731e73a.1618230425.git.alinesantanacordeiro@gmail.com>
References: <cover.1618230425.git.alinesantanacordeiro@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1618230425.git.alinesantanacordeiro@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Replace macro function by static inline function.
Issue suggested by Julia.

Signed-off-by: Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>
---
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

