Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E4FB1C4685
	for <lists+linux-media@lfdr.de>; Mon,  4 May 2020 21:00:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726750AbgEDS76 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 May 2020 14:59:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725956AbgEDS75 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 4 May 2020 14:59:57 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93FA1C061A0F;
        Mon,  4 May 2020 11:59:52 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id i10so352237wrv.10;
        Mon, 04 May 2020 11:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dTu28xUDgKPSOfBD93/Q64n/TLopzl8Xcrc16onzdb4=;
        b=TRQM1Y5Y/kjYZMLRbOikbwDibHa3llJJVJ/bc7jGQWQvtEvHnYk+1txiccS6Rgx+6T
         1cpp1S+GVHWE22ZiEMtiCRXQWeW/mtePV1UrimBZe/Rsw6y0mt6J0YlRUdfmkWvPMU72
         D9rdhVW3L/6GTSOCfkvt6gRQDp8I/s7nzXE5vpUzPNKKbuVL913l/pHILh2AmLNoa7X4
         2fSfTjShbGngeSDvAdACnvzOFfyriEE8CQYvSTJpqBC852ad1HA5FjpKz+1lqLRnPcsY
         jNREp73WKhNlU9NPAI3hqdLEuyfcJzOM5PLSxBtKjKSzv7jgQ+9uSFF94uhiC2g/SHpv
         Hn8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dTu28xUDgKPSOfBD93/Q64n/TLopzl8Xcrc16onzdb4=;
        b=Dp6IthFDLF3CBy3x/wT85UnqK74UXAOxlhVhynzh6wuWJ4x69w8ndn6PDcbYvMWA5P
         nWQ6ARVm6JVrF8FF7ChJodn1C5MB4yp9eQav/1QXeR5JoEQ9nmSHrndTjfOsvr29ey4g
         xLYqFhWbG5rx5YxjJhjIrqVEaMplEiG9GF7puEE+ARKjP6rJJKRibSZ+8Fjq8rt/g+ww
         kmnPmwHCofcEaZzKqKXhlq5oV8qZzh7aTT3SNdSAuXbRQ7abzDEiDh4Z4nMtPPGVoRc2
         GKxQG8g33QkwAa4b4hixtfJV0uU+WSmuez0P/0Nu1CbDtwUQ+JskegBHdCc2gOFHnT+4
         PSag==
X-Gm-Message-State: AGi0PuY8I6V52gWGHQ2H5+zFDI7bciaSn+EIKqq70aLZ/K4FwuCRIE9G
        iLyZ9V0v7JoTbW0lf8kNiUA=
X-Google-Smtp-Source: APiQypKIse9qXrWL+g42FDTv87t6NfFQ+bDzxi1DIXWKshuoMbdJwHPaPEgXUDiQ6wAWMVLgt0psUQ==
X-Received: by 2002:adf:9447:: with SMTP id 65mr534819wrq.331.1588618791289;
        Mon, 04 May 2020 11:59:51 -0700 (PDT)
Received: from skynet.lan (246.red-83-44-9.dynamicip.rima-tde.net. [83.44.9.246])
        by smtp.gmail.com with ESMTPSA id i25sm452952wml.43.2020.05.04.11.59.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2020 11:59:50 -0700 (PDT)
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
Subject: [PATCH v2 2/2] nand: brcmnand: fix hamming oob layout
Date:   Mon,  4 May 2020 20:59:45 +0200
Message-Id: <20200504185945.2776148-2-noltari@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200504185945.2776148-1-noltari@gmail.com>
References: <20200504093034.2739968-1-noltari@gmail.com>
 <20200504185945.2776148-1-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

First 2 bytes are used in large-page nand.

Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
---
 v2: extend original comment

 drivers/mtd/nand/raw/brcmnand/brcmnand.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.c b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
index 767343e0e6e7..0a1d76fde37b 100644
--- a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
+++ b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
@@ -1114,10 +1114,10 @@ static int brcmnand_hamming_ooblayout_free(struct mtd_info *mtd, int section,
 	} else {
 		/*
 		 * Small-page NAND use byte 6 for BBI while large-page
-		 * NAND use byte 0.
+		 * NAND use bytes 0 and 1.
 		 */
 		if (cfg->page_size > 512) {
-			oobregion->offset = 1;
+			oobregion->offset = 2;
 		} else {
 			oobregion->offset = 0;
 			next--;
-- 
2.26.2

