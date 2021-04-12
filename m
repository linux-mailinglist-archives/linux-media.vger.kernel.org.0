Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2700735C64C
	for <lists+linux-media@lfdr.de>; Mon, 12 Apr 2021 14:32:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240959AbhDLMc5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Apr 2021 08:32:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239061AbhDLMc5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Apr 2021 08:32:57 -0400
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com [IPv6:2607:f8b0:4864:20::72d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BE9BC061574;
        Mon, 12 Apr 2021 05:32:39 -0700 (PDT)
Received: by mail-qk1-x72d.google.com with SMTP id b139so7620089qkc.10;
        Mon, 12 Apr 2021 05:32:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=mA58phHCIh0Fa6R2ws4D2uh9fwyQMsDVNdVth2KiCIY=;
        b=c6kaqcuTHS1/9SLVDIAXUxG5NHciZc0wUgbJYgFrvtbINty94AlexqXnaYC5HqISDi
         FUmVUobfAZcbeK8aV7iXtiPjwyT/f6Ac4UiEQYUP+u/KJOiKFW+h2WPp6LoMTIuCkym8
         cSZIdGTJ0AhJ8M/5O4N39UdJ81NJAVhhveA2Aje21J2hYMWT484rrFu6dJAPaRMXUgcK
         vid/w7HKTpyj7HNgPWhXAx8f+jAYel1OzvsP4nO9Tc9FAnq5Se8dv1zeLzPbLy3MmYTz
         My5REGKsMYp5PIHYnMuALKgN59ytobrrteqh29FWtgdhbm7QVr1ZG7NL9GxthIAwoesg
         bF6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=mA58phHCIh0Fa6R2ws4D2uh9fwyQMsDVNdVth2KiCIY=;
        b=iEibrzYBHXuMNU5Px5U5N7+poKmVAGTkDXagG2P/lLIXaK+DWgjzKxxjOvASk71u+f
         05xRnc4EpfompIMARucdVfY9pUdehshJUxcq37iMCHsdB6a5NIg7v+NQwtPpWOLTT8GF
         DlMGxuONbVDHvjMOYxrQ+GezAytKPeHt+qZl/CVLnoioUiJLZAF+btFgxAqprBGYpp01
         lE9OjLbIpHs4xJPrwRNSB4YA5ii/MzeyQ72iSaCm78MxE/A1uhgXdWpx+X3w8sIh6Guw
         PgsmUFgx96mF3h3oGyReHyA6HyZvBNX2ly7nM1gn9i6MsXuQ4uWKokA9ZIaO0mrTjLsY
         3/nQ==
X-Gm-Message-State: AOAM533c7AFAV7JEYSHrC7ew7ge9NCke4pHtocuOu+TMJPtggy+D56YK
        4DQvXNTryslxMZnwdTXO7GY=
X-Google-Smtp-Source: ABdhPJxQEao5wGjpEmTQoa9QbrprmuIkT6cZTAAZsPz6CEg0q/anF4HvSiA0699g0JB7y9kbvm9njQ==
X-Received: by 2002:a37:a485:: with SMTP id n127mr1124762qke.454.1618230757975;
        Mon, 12 Apr 2021 05:32:37 -0700 (PDT)
Received: from focaruja ([2001:1284:f016:a037:476a:dfcd:f18f:9ad5])
        by smtp.gmail.com with ESMTPSA id m14sm7101397qke.107.2021.04.12.05.32.36
        (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Mon, 12 Apr 2021 05:32:37 -0700 (PDT)
Date:   Mon, 12 Apr 2021 09:32:34 -0300
From:   Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com
Subject: [Outreachy kernel][PATCH 1/4] Replace macro function by static
 inline function in file iss.c
Message-ID: <b963fdc8ef989e5505b26d0c8f91315ea26c4899.1618230425.git.alinesantanacordeiro@gmail.com>
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
 drivers/staging/media/omap4iss/iss.c | 24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/media/omap4iss/iss.c b/drivers/staging/media/omap4iss/iss.c
index c89f268a..3bbc39e 100644
--- a/drivers/staging/media/omap4iss/iss.c
+++ b/drivers/staging/media/omap4iss/iss.c
@@ -27,22 +27,24 @@
 #include "iss.h"
 #include "iss_regs.h"
 
-#define ISS_PRINT_REGISTER(iss, name)\
-	dev_dbg(iss->dev, "###ISS " #name "=0x%08x\n", \
-		iss_reg_read(iss, OMAP4_ISS_MEM_TOP, ISS_##name))
+static inline iss_print_register(iss, name)
+{
+	dev_dbg(iss->dev, "###ISS " #name "=0x%08x\n",
+		iss_reg_read(iss, OMAP4_ISS_MEM_TOP, ISS_##name));
+}
 
 static void iss_print_status(struct iss_device *iss)
 {
 	dev_dbg(iss->dev, "-------------ISS HL Register dump-------------\n");
 
-	ISS_PRINT_REGISTER(iss, HL_REVISION);
-	ISS_PRINT_REGISTER(iss, HL_SYSCONFIG);
-	ISS_PRINT_REGISTER(iss, HL_IRQSTATUS(5));
-	ISS_PRINT_REGISTER(iss, HL_IRQENABLE_SET(5));
-	ISS_PRINT_REGISTER(iss, HL_IRQENABLE_CLR(5));
-	ISS_PRINT_REGISTER(iss, CTRL);
-	ISS_PRINT_REGISTER(iss, CLKCTRL);
-	ISS_PRINT_REGISTER(iss, CLKSTAT);
+	iss_print_register(iss, HL_REVISION);
+	iss_print_register(iss, HL_SYSCONFIG);
+	iss_print_register(iss, HL_IRQSTATUS(5));
+	iss_print_register(iss, HL_IRQENABLE_SET(5));
+	iss_print_register(iss, HL_IRQENABLE_CLR(5));
+	iss_print_register(iss, CTRL);
+	iss_print_register(iss, CLKCTRL);
+	iss_print_register(iss, CLKSTAT);
 
 	dev_dbg(iss->dev, "-----------------------------------------------\n");
 }
-- 
2.7.4

