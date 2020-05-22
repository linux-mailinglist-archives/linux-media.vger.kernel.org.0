Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78EE61DE685
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2020 14:15:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729563AbgEVMPc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 May 2020 08:15:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729422AbgEVMPb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 May 2020 08:15:31 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADC25C061A0E;
        Fri, 22 May 2020 05:15:30 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id l11so10001286wru.0;
        Fri, 22 May 2020 05:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hhBfaAImjH2UVNRp7gKxiak61uswGVZG6aVigHmQNUc=;
        b=sWpewjZWkT+NsuGQ9V+NV3Ou/yoW5k8zRfTnkglOttebJ5WzHRM7uiYYMn7snG5wyj
         r+lq3QRljMG9Ia07D8Gb/x2i/yiAZ2tFBzG+LO5NnBSoDxAwVlCEnA7Qc5aQqPGae2oo
         0jnuAvYjsnG03rRJgj48v5OXKWkuSRS80s6PmGz0/tKqaUJe2DEg/Po0OtnsoGvXwtzP
         BrbUPNhzqvhSJX2gwm/Kw2i4k9oZNgx7Nya+Vz8+g9nQZ7S1KENQyxF6vL/8DgK8RlIQ
         9CvdMRL3BQTqBbeleKeuHdDiSqI3S4rTqoY3lfjDvQiDeBw2SsiT+p+voIsLZzADZr3A
         Ip8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hhBfaAImjH2UVNRp7gKxiak61uswGVZG6aVigHmQNUc=;
        b=GtuuMxreib4KQTtyhQKEC3tRDn7bNKlhnrXj0qmyLgvjTRxywn+t2lgSJ4QpJK62kC
         vYnDhaMdL0kUqPF9IoNCCSncu/2kzt9//Q5/fD7QYbhwgYgv14ktF869i37aAXls40r5
         1bNxu/gLkJdnvY1HJx5r/aVX9qL32bCUiqXMaXIgAgckoBHXOjw8Ovcv1Xi2BPGkMK7K
         oC2899WUmTR69EflG7nZIbxdLI85UqnLi8kY0m63/mspWqw543dley5LwnoMgjtVsrAN
         NjvhbfV2puUmJ9MQl03pYq2fKYx8ByO74DsHduzVcvFRbJ0KGV1qs6mEUx6uaf/FDuzn
         b77w==
X-Gm-Message-State: AOAM5322KWrfjbQj1iIizTBWx0UYu3JdsIfyo7+dLIem5xn5aB0KEcwx
        jRD8FPixyds0N8e5vLP5iFY=
X-Google-Smtp-Source: ABdhPJxuqavo8Zcw+Zlj4qPhljdlh+JK+KhGZ1yZnzVuNPR33zxb13loGaNaVUMz36J0YlmudwFSOQ==
X-Received: by 2002:adf:decb:: with SMTP id i11mr3485439wrn.172.1590149729304;
        Fri, 22 May 2020 05:15:29 -0700 (PDT)
Received: from skynet.lan (159.red-83-44-12.dynamicip.rima-tde.net. [83.44.12.159])
        by smtp.gmail.com with ESMTPSA id g6sm9293784wrp.75.2020.05.22.05.15.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2020 05:15:28 -0700 (PDT)
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
Subject: [PATCH v4 2/5] mtd: rawnand: brcmnand: fix CS0 layout
Date:   Fri, 22 May 2020 14:15:21 +0200
Message-Id: <20200522121524.4161539-3-noltari@gmail.com>
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

Only v3.3-v5.0 have a different CS0 layout.
Controllers before v3.3 use the same layout for every CS.

Fixes: 27c5b17cd1b1 ("mtd: nand: add NAND driver "library" for Broadcom STB NAND controller")
Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
---
 v4: no changes.
 v3: no changes.
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

