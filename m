Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D2451CEE17
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2020 09:34:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729016AbgELHdm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 May 2020 03:33:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728986AbgELHdh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 May 2020 03:33:37 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E49D5C061A0C;
        Tue, 12 May 2020 00:33:36 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id n5so7174267wmd.0;
        Tue, 12 May 2020 00:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qQ8y/gqu4ixgcZle26aEK4aRfb9gxDM111a2MEV0O/g=;
        b=CFFfkHPeWAA6BWb6cFCjifEnJfjfyW8vqr5uZuCntCcA6PiJplULoRvFSupY7gbk2i
         W/hBRBIDIDH8dYhGpppydhOGeeDHR6G0rfEeKwaZFNtZkfRrv2i4wd2Yt3gpmA1PtbCL
         A/bzbOJbOehSlzuI9ZfXvQMrdgvMKWAVpz6SUyd6+ToP7RIds6fmAkDcyK6KMGsLwOev
         DaY3NTsrFW0bpILRbx64bx4W20dks7qPpLulwCNdFvtWrsJgyZaRSsNMJdzpjStm0YOJ
         PpvK2VVOruCqRzQxSoI93rCkDeoDEkhhyF1NLfWqV3L/plT/67JGqKsRayNoI0vMuJay
         BSdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qQ8y/gqu4ixgcZle26aEK4aRfb9gxDM111a2MEV0O/g=;
        b=s1/tgiv/cf6PmNtG/sigyouBzEI69u4EC/hhIw4qBi0XQ6tIq+9Kjp51l0bNgM3wdJ
         RO2UYwaCUGHExyM7W8gpKMMaMLFutNUxvaMoyBLVB6Yhnoc8Iw2t9TMcydTfBD+hLFQ6
         EFnU8GI37XM6QwWToR3T02pvkrqUe5SexRvjWstk10hY0WmFy4iTxSzm7cCsgK8iNNBC
         jGwYd7VjkJYgvJ3Kpc59dWNj1WxmMPdBJ0vyZGw5opPoZwNDvqjkc7zqt9vzFcusPkTY
         gWtOmQi/GfUnD2ULio1kKgLHbdM9n7pJjz8Z3lc7HY2L2e3Zrx0mzCUpoxeHRtf6OBmh
         3/9Q==
X-Gm-Message-State: AGi0PuZetWYH64ADhdRMUrCmm+VYJJw/Idb/kUUmFSibUFspcYM1eCkx
        AzXd8CJG9vGvZO4x6akECh8=
X-Google-Smtp-Source: APiQypJHlU7E9KgvyqCnZSJ9eLmQdj13uPEZz/FURvTrOPOTv+arPqj9HTfqURAv8oZpNu18CNr2DQ==
X-Received: by 2002:a1c:9ac3:: with SMTP id c186mr5172702wme.150.1589268815649;
        Tue, 12 May 2020 00:33:35 -0700 (PDT)
Received: from skynet.lan (198.red-83-49-57.dynamicip.rima-tde.net. [83.49.57.198])
        by smtp.gmail.com with ESMTPSA id d9sm5961197wmd.10.2020.05.12.00.33.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2020 00:33:35 -0700 (PDT)
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
Subject: [PATCH v2 2/5] mtd: rawnand: brcmnand: fix CS0 layout
Date:   Tue, 12 May 2020 09:33:26 +0200
Message-Id: <20200512073329.742893-3-noltari@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200512073329.742893-1-noltari@gmail.com>
References: <20200510151406.2527856-1-noltari@gmail.com>
 <20200512073329.742893-1-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Only v3.3-v5.0 have a different CS0 layout.
Controllers before v3.3 use the same layout for every CS.

Fixes: 27c5b17cd1b1 ("mtd: nand: add NAND driver "library" for Broadcom STB NAND controller")
Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
---
 v2: fix commit log.

 drivers/mtd/nand/raw/brcmnand/brcmnand.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.c b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
index 6a08dd07b058..72b268d8e3a4 100644
--- a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
+++ b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
@@ -606,8 +606,9 @@ static int brcmnand_revision_init(struct brcmnand_controller *ctrl)
 	} else {
 		ctrl->cs_offsets = brcmnand_cs_offsets;
 
-		/* v5.0 and earlier has a different CS0 offset layout */
-		if (ctrl->nand_version <= 0x0500)
+		/* v3.3-5.0 have a different CS0 offset layout */
+		if (ctrl->nand_version >= 0x0303 &&
+		    ctrl->nand_version <= 0x0500)
 			ctrl->cs0_offsets = brcmnand_cs_offsets_cs0;
 	}
 
-- 
2.26.2

