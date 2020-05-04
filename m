Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C3761C35C8
	for <lists+linux-media@lfdr.de>; Mon,  4 May 2020 11:31:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728579AbgEDJas (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 May 2020 05:30:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728071AbgEDJar (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 4 May 2020 05:30:47 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F153C061A0E;
        Mon,  4 May 2020 02:30:47 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id u127so8222286wmg.1;
        Mon, 04 May 2020 02:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=phBt/DyXxj2WCUjN/7VIPZs2iVaLf/hvf4aH3FE3pS4=;
        b=j7Ub+flln3YNhwj9yYp6wBol+TBlw1w6FXrudNdmpadgvX2kmnT6doDre9rBrwnxRx
         oaR8uKfqIgUoJ1VMOeGOw9Y+KYStlDgM6IiLAKmgstsij9t5UPXO0wv4pHvWvKNrlpX/
         AaZmZgCZlsUZskeawsKgB2KObhO/28CDfx9Qb5s+KzIryPocpNZo5H/EKg2JSVKugOqY
         uuy1l5PU75/at575nM/4WqvZxxL4xDuF8W25MnA3vlJJRCq9dVDgFrBO2oawAqwJCGfX
         UJ2SiWhC/YNvSBSSHxymASU+DtV7DjhFuoQ7fPH8iqnxd/8kj/sVOzja9jbEcxc7XLQ5
         Dmag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=phBt/DyXxj2WCUjN/7VIPZs2iVaLf/hvf4aH3FE3pS4=;
        b=ki7Ks1d/9i9iP5omKg7lrn2JNd3kw+XwAv5ryMMq6qUl6r1W8e5DIRRCHsDLnamYus
         1gQwf6nMtakLkUIPHFICe3Hj1K252s2s4qKZBOiiAJCXxf6vd0t39ryw6jJHRIg9Vv9D
         smPXDb5ofd6IoAhJ90Q9iVXnCL0XtH3amq8m2ktXWWhNcs9Rnpejk6XSTTdQfw0gjtxd
         KkSSmv8ltv5Yp6E0xPjGPOyf823BdH580MPb1rpnbx8E5gHLaqFJbGdYltFU0ZrQ/rFo
         MZsojaqedCIW1yjnE2ChZNXPve80n+2Fkx0E2MDBGhD37cBgoVa7+dnxAZf3N1KuKFey
         3KjA==
X-Gm-Message-State: AGi0Pua6z4IkPjyVT4D/yFqSgeIUIdONS+B2WCFe5vMk4wQIHw5GBH+r
        z1ndviBAahM7XRPkDGUat/Y=
X-Google-Smtp-Source: APiQypJS5Hd4YKWO6K+er1KaH05rOKwDvb8orjhGW/13qMHgW2kYeb5kLUuph8xfEkdVy+4SLf6EJA==
X-Received: by 2002:a1c:c345:: with SMTP id t66mr14567380wmf.189.1588584645850;
        Mon, 04 May 2020 02:30:45 -0700 (PDT)
Received: from skynet.lan (246.red-83-44-9.dynamicip.rima-tde.net. [83.44.9.246])
        by smtp.gmail.com with ESMTPSA id u12sm13075570wmu.25.2020.05.04.02.30.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2020 02:30:45 -0700 (PDT)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     computersforpeace@gmail.com, kdasu.kdev@gmail.com,
        miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
        sumit.semwal@linaro.org, linux-mtd@lists.infradead.org,
        bcm-kernel-feedback-list@broadcom.com,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Cc:     =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
Subject: [PATCH 2/2] nand: brcmnand: fix BBI in hamming oob layout
Date:   Mon,  4 May 2020 11:30:34 +0200
Message-Id: <20200504093034.2739968-2-noltari@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200504093034.2739968-1-noltari@gmail.com>
References: <20200504093034.2739968-1-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Small Page NAND uses byte 6 for BBI and Large Page NAND uses first 2 bytes.

Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
---
 drivers/mtd/nand/raw/brcmnand/brcmnand.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.c b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
index 1bba309c7684..59c3241f4ea5 100644
--- a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
+++ b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
@@ -1109,10 +1109,18 @@ static int brcmnand_hamming_ooblayout_free(struct mtd_info *mtd, int section,
 	if (section < sectors)
 		next += 6;
 
-	if (section)
+	if (section) {
 		oobregion->offset = ((section - 1) * sas) + 9;
-	else
-		oobregion->offset = 1; /* BBI */
+	} else {
+		if (cfg->page_size == 512) {
+			/* small page uses byte 6 for BBI */
+			oobregion->offset = 0;
+			next--;
+		} else {
+			/* large page uses first 2 bytes for BBI */
+			oobregion->offset = 2;
+		}
+	}
 
 	oobregion->length = next - oobregion->offset;
 
-- 
2.26.2

