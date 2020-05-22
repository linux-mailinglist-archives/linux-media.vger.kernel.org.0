Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0CD11DE688
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2020 14:15:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729623AbgEVMPd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 May 2020 08:15:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728889AbgEVMPc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 May 2020 08:15:32 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBBB2C05BD43;
        Fri, 22 May 2020 05:15:31 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id c3so5712456wru.12;
        Fri, 22 May 2020 05:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MqKlTlI+jL2VDjBfx2LR4RfYSJ6TxxTjbq+FxFCrZBE=;
        b=UMGkWtsZqgwvlZC8HG1M+DvirXa6xQd1eAxEg7YK3NYlauJmJK+nm+klyoAJ5fm4ql
         xINQoOWssX8s+UfhANdgsxdaGfszyvCNK3z+E4jHxLPC4oj/C6HbzFIinjMARd+ZPUFk
         9i8cSOuwC1LKvCsanROriaFsrX1ZH6kIIM0ykPInG8BbET+OiVPxQbMevV86G6l5D4vD
         72+/xkwbokkzeVb+ezhlTkFPBD1A8HntrcZZTtQraWhp7w1L2f7PLddanqQBUx7HSios
         QcKEedvc8ln2Er7z/DFPdTnOEcnxGUstl5GSTgzCkZq9+Rg5PexDzH9tihNuOQGfB6qy
         FeBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MqKlTlI+jL2VDjBfx2LR4RfYSJ6TxxTjbq+FxFCrZBE=;
        b=AuCxX/wvBN7m+YYH0PHElrP5Jz/DdgQ9AsdfZSMAMqe3U5wkmul4RMxIn/TlsIlNRi
         vWlMupEu6+k0+5qFUogznkiIZ/87B5E7qStlKD7C6ooVCdixmys22KiaO7P/3T5e7oGY
         YlT+vOCcEBSJQxVjzzhgKg14fpz4tbbUT9S1B2NTjOl4uVu4BGT9EPwDoemyWs6b2EFb
         fkz10+15QJPZNsTPDWvaMdGCm8SKgJp4Hgh2lk4MgeDSyzlcJTrj6zOnWEUbrcS+NbfQ
         PA0HSJPe/qePswKixSS5nA8qNc2PpIsNi6ge7UWOG1ijLhvCs4NT1ohJ8naGXnlEarEi
         uYpw==
X-Gm-Message-State: AOAM533KGtTqJsu8bf5oqZ2Hi830Fm6j93Ung8GQiPuCcizsSPcVzRkQ
        mIK+yfpJ21J5cno7pf3wH9E=
X-Google-Smtp-Source: ABdhPJzUXxfCKPsXkJ8dSLSrdTqxwZ40W15WTWItLVa5Qyf2iMlurFSmuCNwEiT0H0cYs9Coc+eUCg==
X-Received: by 2002:adf:ec87:: with SMTP id z7mr3538653wrn.149.1590149730368;
        Fri, 22 May 2020 05:15:30 -0700 (PDT)
Received: from skynet.lan (159.red-83-44-12.dynamicip.rima-tde.net. [83.44.12.159])
        by smtp.gmail.com with ESMTPSA id g6sm9293784wrp.75.2020.05.22.05.15.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2020 05:15:29 -0700 (PDT)
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
Subject: [PATCH v4 3/5] mtd: rawnand: brcmnand: rename page sizes
Date:   Fri, 22 May 2020 14:15:22 +0200
Message-Id: <20200522121524.4161539-4-noltari@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200522121524.4161539-1-noltari@gmail.com>
References: <20200522072525.3919332-1-noltari@gmail.com>
 <20200522121524.4161539-1-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Current pages sizes apply to controllers after v3.4

Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
---
 v4: no changes.
 v3: no changes.
 v2: add new patch.

 drivers/mtd/nand/raw/brcmnand/brcmnand.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.c b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
index 72b268d8e3a4..ef60dbbeac2b 100644
--- a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
+++ b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
@@ -571,7 +571,7 @@ static int brcmnand_revision_init(struct brcmnand_controller *ctrl)
 {
 	static const unsigned int block_sizes_v6[] = { 8, 16, 128, 256, 512, 1024, 2048, 0 };
 	static const unsigned int block_sizes_v4[] = { 16, 128, 8, 512, 256, 1024, 2048, 0 };
-	static const unsigned int page_sizes[] = { 512, 2048, 4096, 8192, 0 };
+	static const unsigned int page_sizes_v3_4[] = { 512, 2048, 4096, 8192, 0 };
 
 	ctrl->nand_version = nand_readreg(ctrl, 0) & 0xffff;
 
@@ -618,7 +618,7 @@ static int brcmnand_revision_init(struct brcmnand_controller *ctrl)
 		ctrl->max_page_size = 16 * 1024;
 		ctrl->max_block_size = 2 * 1024 * 1024;
 	} else {
-		ctrl->page_sizes = page_sizes;
+		ctrl->page_sizes = page_sizes_v3_4;
 		if (ctrl->nand_version >= 0x0600)
 			ctrl->block_sizes = block_sizes_v6;
 		else
-- 
2.26.2

