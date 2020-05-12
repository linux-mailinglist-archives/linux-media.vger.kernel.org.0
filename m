Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC16E1CEEA0
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2020 09:57:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726193AbgELH5j (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 May 2020 03:57:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725823AbgELH5j (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 May 2020 03:57:39 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7BBDC061A0C;
        Tue, 12 May 2020 00:57:38 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id f134so8468074wmf.1;
        Tue, 12 May 2020 00:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NFX2G/ycRyFJ8XJ2cgub1Gt1QA023juIjxGeZbPNvjA=;
        b=tgGYet/6aC3qdCyAWGYnA/0YcF3Xpfy3K9R+OyMsK8oSwxfmw0VTuExfGwvlifxeQF
         T4fnh8wGTU2fz6co0KMZzcTy16xAnvthGS4r0e8BDykVAzaRoRLZ8AMls7SOZf+pG+tY
         9ZLkxh8eFWpz37ZTaoec6w5j68dnz7VuU3QlJrCi8WFtDI9akFw3ZRc3sIsSbixpZhDG
         rcNOdBKR9WynexcAM4DveRv08SHG7UnFMGKvkfLgI2oBuIoItAypvrGkflaUL2KQrcA6
         abZwAl9G3mfIXD5C7nWH+o8h4DOnDSghfC0E+ufRANXk+0sOMahvza6J4Hxo+Hg8tQXV
         NR7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NFX2G/ycRyFJ8XJ2cgub1Gt1QA023juIjxGeZbPNvjA=;
        b=LpmLULJ5KYEhFT5YKNYJFUxZpvkQsf/uj5F4p/NzFF6WhUs55EYje2x33BlI9dSbKC
         osuDJkwDUARsqnUVfs/pTn6lrLNb5qVjyRlKRwj+edJMRYHi1njjE66p+jmsp7DwP8p4
         buY9qz2BvdE1iCiAA6F1BgwJbSPTKMxasM2L39zG2o+BWTU7mcQodngfCIqjun+dx5cg
         ssVNLintrEO5zuZP2Te07mwrRUi9eO7taeJCR+xxvGuDPzo+njfTn/0fh4upQ3lybR37
         y5UuwvR7Dfr1kmQFpuhMAZ6B3uWymEPjp2wymt5P0TBjhmoGyRnBLP9zSRjUqd/NG99o
         VKRA==
X-Gm-Message-State: AGi0PuYV1eCOm0NfORS2Dz1kRNNokrE1JymmXkvqb6jIEpwYrJ5uYxKy
        QlztCTv2pnYaCy/bZ6dXPJ8=
X-Google-Smtp-Source: APiQypJS/4uzww2NZhrNqojJOpiIOHrot4eMxoh5tB9WHsGpFGZj2hqvWq2bEXNKrCeG8QMcM73jjw==
X-Received: by 2002:a1c:e2c5:: with SMTP id z188mr25111209wmg.35.1589270257495;
        Tue, 12 May 2020 00:57:37 -0700 (PDT)
Received: from skynet.lan (198.red-83-49-57.dynamicip.rima-tde.net. [83.49.57.198])
        by smtp.gmail.com with ESMTPSA id p8sm25946618wma.45.2020.05.12.00.57.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2020 00:57:37 -0700 (PDT)
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
Subject: [PATCH v4 0/2] mtd: rawnand: brcmnand: improve hamming oob layout
Date:   Tue, 12 May 2020 09:57:31 +0200
Message-Id: <20200512075733.745374-1-noltari@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200512060023.684871-1-noltari@gmail.com>
References: <20200512060023.684871-1-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

These patches improve the OOB hamming layout by reducing the number of oob
sections and correctly reserving first two bytes for large page NANDs.

v4: clarify small/large pages comment.
v3: invert patch order.
v2: extend original comment and correctly skip byte 6 for small-page.

Álvaro Fernández Rojas (2):
  mtd: rawnand: brcmnand: fix hamming oob layout
  mtd: rawnand: brcmnand: improve hamming oob layout

 drivers/mtd/nand/raw/brcmnand/brcmnand.c | 34 +++++++++++++-----------
 1 file changed, 18 insertions(+), 16 deletions(-)

-- 
2.26.2

