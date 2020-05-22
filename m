Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BCC0A1DE0D2
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2020 09:25:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728772AbgEVHZf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 May 2020 03:25:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728755AbgEVHZc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 May 2020 03:25:32 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 037ECC061A0E;
        Fri, 22 May 2020 00:25:32 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id w7so9088093wre.13;
        Fri, 22 May 2020 00:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=D2Vxxx9xwQZv2HFZw44HLDX0KJ9fcafykGilE0KusFA=;
        b=Bt6mpwNETM8CL17HN9OVzEcNWXBfIJiVKqfh3Oke4QRDt5hbauCQiFHDYm/qhoOvBh
         TorP/DDfDotp3275SRFVk8I4bonijzearlJ8DHnVuqPInLz07HkE7uisgCyWJNL1Bikq
         Ne7sEITHz76tdICx67J2ToF5oqaYJjea6EfNrWWOP5j50tqQB9VJy0OpmxS2oPUWeziA
         lqxJWd//yolQqc8sDWKf8u76eEPqhBrqEIYdBa+PwGTbOwhGuk4qEhagA5myvRg8rwaO
         3PiwKAuf4+quXgY74OrIZ3dMQgNBYCXoMbsOkZpHkIavLqpw0+N+CI3uCQ37uAXa1Riu
         M6Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=D2Vxxx9xwQZv2HFZw44HLDX0KJ9fcafykGilE0KusFA=;
        b=POmpZcrFv568e8RMIUkzYxvTgUT/8dB+Xdy2fwaSN4jdZsYeMITqCUN0KIqmdVb3I6
         4Swmr8dzDOMPfz0NGUyOKqSKoT+BP5XS9GvfSSog81BlDk/0/QFBlbReSvD5zP+G2f0s
         vSgrz4INOIomNtUyxdOiye13I8n8jYtpfNCRHBuVlW4fgbzw8PSeN/tHEo+cpZfThGMN
         vwhZNlbptcD6F1vfZiFyYLAhxbBXEOjrE5uSeU6QEZnC6wCQxJK0CfBKGI3I+sQbM2rR
         ZfmuxV6ZbzqXcyGXqcmSU+IqKWLRVGPbUrNVICQFsTY3ADR5NcIf2RybzTbd3rpYdUw3
         sBbg==
X-Gm-Message-State: AOAM530pKZ0dhXTwsdh1XA/vAqrftfLqEwhU787QP/N+RzZ/DjdXLTH0
        6fkiL+LdRs72Bor99iG2LwQ=
X-Google-Smtp-Source: ABdhPJz/6awZjxVQ+Dp6vSmq92QOklfTK8MOtAn8ONy1iHZCnqeROK6pCNgWTiXRSFDpznJtdikrKQ==
X-Received: by 2002:adf:fdc1:: with SMTP id i1mr2409080wrs.0.1590132330633;
        Fri, 22 May 2020 00:25:30 -0700 (PDT)
Received: from skynet.lan (159.red-83-44-12.dynamicip.rima-tde.net. [83.44.12.159])
        by smtp.gmail.com with ESMTPSA id f128sm9299898wme.1.2020.05.22.00.25.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2020 00:25:30 -0700 (PDT)
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
Subject: [PATCH v3 2/5] mtd: rawnand: brcmnand: fix CS0 layout
Date:   Fri, 22 May 2020 09:25:22 +0200
Message-Id: <20200522072525.3919332-3-noltari@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200522072525.3919332-1-noltari@gmail.com>
References: <20200512073329.742893-1-noltari@gmail.com>
 <20200522072525.3919332-1-noltari@gmail.com>
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

