Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 441F435C64E
	for <lists+linux-media@lfdr.de>; Mon, 12 Apr 2021 14:32:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240981AbhDLMdB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Apr 2021 08:33:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239061AbhDLMdA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Apr 2021 08:33:00 -0400
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com [IPv6:2607:f8b0:4864:20::731])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F624C061574;
        Mon, 12 Apr 2021 05:32:43 -0700 (PDT)
Received: by mail-qk1-x731.google.com with SMTP id d15so45599qkc.9;
        Mon, 12 Apr 2021 05:32:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=alZ/njDA6kDUiXsUqrZlj3PHW2OGA8s+7K/9VZo9fWw=;
        b=IrB5OOVtvD+sK7NlIiEoVjBIDu7KE6eRZbHqC99ISyF78e8bvtg7Wew06Cd70O12dw
         7inwuWxyECY6katLBk3CE7xbmI9Z+Z5RoM3v+CLXB1Qh+KWQEUeZC1TzQm4opMCg9z2l
         zDq37qo2QVPPZov/OYT83cej5jSStyjWXwyKBB1l0/0QBheLuveOdcTvgIZdN1BP7UE6
         he09QLNRLTqYXbdUl4fsxCZVesJCHlDQBOCSUpQyzSmrLE0rtxHkVY8tRzk3n8bz2DJ/
         zvmuLrWWiCTCfeGXWhwEKQ7yiJFcjuZnH7TZe27wtZVr4kMd8UjVHNIdrKW9noxS//Cz
         EHzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=alZ/njDA6kDUiXsUqrZlj3PHW2OGA8s+7K/9VZo9fWw=;
        b=J6n861+dM6Pw8uuXRnu5SbgK4ikpBtu3sXPIrozYFjEGRgKhH3AGsaab62tQWX0hYS
         kkaTd7fyO5OjTfen4C0Uxo1axbl0yOi+q0SE8M1X59UBq9FyziMz+h3zUUjBS6xy+/rb
         shZ9etAK6M+U+iRiNEjVdY9iuV2gorqONi3+ttBJ46s0gu8Xzm4ku+WfuaTuxBEVeTYg
         gygxbpPpdI4W6X4kr4MTlMoQxfCQ1sS9vN+krQyjSwPFcdpPZHONBMx0EULRN811vk9O
         fJSrakHBpxa47Iz1td1K+2DjdqsO8gdJhRQLFThqFIpCqAj6CHYNu7gIHiyO1mOFvbhq
         fOHw==
X-Gm-Message-State: AOAM533LgrM3oT4g+T2hjm34JVrzBn0/GRXFr5CJDU6pZ6z8IykXHavW
        UrNcjIpq8FdwOkQyoZICSqs=
X-Google-Smtp-Source: ABdhPJz4C60O6AngmQ7b0XRWnnOu3FX9tZWFaN2kh5E01pnaNT245XTfipRbalOoeKn1vnPH5mlflw==
X-Received: by 2002:a37:9c85:: with SMTP id f127mr7659821qke.283.1618230762320;
        Mon, 12 Apr 2021 05:32:42 -0700 (PDT)
Received: from focaruja ([2001:1284:f016:a037:476a:dfcd:f18f:9ad5])
        by smtp.gmail.com with ESMTPSA id v11sm7495148qtx.79.2021.04.12.05.32.41
        (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Mon, 12 Apr 2021 05:32:42 -0700 (PDT)
Date:   Mon, 12 Apr 2021 09:32:39 -0300
From:   Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com
Subject: [Outreachy kernel][PATCH 2/4] Replace macro function by static
 inline function in file iss_ipipe.c
Message-ID: <3d3facd1c3eef996d7e824917c19282bd1e1f041.1618230425.git.alinesantanacordeiro@gmail.com>
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
 drivers/staging/media/omap4iss/iss_ipipe.c | 28 +++++++++++++++-------------
 1 file changed, 15 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/media/omap4iss/iss_ipipe.c b/drivers/staging/media/omap4iss/iss_ipipe.c
index 26be078..09c941c 100644
--- a/drivers/staging/media/omap4iss/iss_ipipe.c
+++ b/drivers/staging/media/omap4iss/iss_ipipe.c
@@ -38,9 +38,11 @@ static const unsigned int ipipe_fmts[] = {
  *
  * Also prints other debug information stored in the IPIPE module.
  */
-#define IPIPE_PRINT_REGISTER(iss, name)\
-	dev_dbg(iss->dev, "###IPIPE " #name "=0x%08x\n", \
-		iss_reg_read(iss, OMAP4_ISS_MEM_ISP_IPIPE, IPIPE_##name))
+static inline ipipe_print_register(iss, name)
+{
+	dev_dbg(iss->dev, "###IPIPE " #name "=0x%08x\n",
+		iss_reg_read(iss, OMAP4_ISS_MEM_ISP_IPIPE, IPIPE_##name));
+}
 
 static void ipipe_print_status(struct iss_ipipe_device *ipipe)
 {
@@ -48,16 +50,16 @@ static void ipipe_print_status(struct iss_ipipe_device *ipipe)
 
 	dev_dbg(iss->dev, "-------------IPIPE Register dump-------------\n");
 
-	IPIPE_PRINT_REGISTER(iss, SRC_EN);
-	IPIPE_PRINT_REGISTER(iss, SRC_MODE);
-	IPIPE_PRINT_REGISTER(iss, SRC_FMT);
-	IPIPE_PRINT_REGISTER(iss, SRC_COL);
-	IPIPE_PRINT_REGISTER(iss, SRC_VPS);
-	IPIPE_PRINT_REGISTER(iss, SRC_VSZ);
-	IPIPE_PRINT_REGISTER(iss, SRC_HPS);
-	IPIPE_PRINT_REGISTER(iss, SRC_HSZ);
-	IPIPE_PRINT_REGISTER(iss, GCK_MMR);
-	IPIPE_PRINT_REGISTER(iss, YUV_PHS);
+	ipipe_print_register(iss, SRC_EN);
+	ipipe_print_register(iss, SRC_MODE);
+	ipipe_print_register(iss, SRC_FMT);
+	ipipe_print_register(iss, SRC_COL);
+	ipipe_print_register(iss, SRC_VPS);
+	ipipe_print_register(iss, SRC_VSZ);
+	ipipe_print_register(iss, SRC_HPS);
+	ipipe_print_register(iss, SRC_HSZ);
+	ipipe_print_register(iss, GCK_MMR);
+	ipipe_print_register(iss, YUV_PHS);
 
 	dev_dbg(iss->dev, "-----------------------------------------------\n");
 }
-- 
2.7.4

