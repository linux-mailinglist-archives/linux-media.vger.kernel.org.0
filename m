Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6DD341CEE13
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2020 09:34:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728989AbgELHdh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 May 2020 03:33:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727859AbgELHdg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 May 2020 03:33:36 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4222BC061A0C;
        Tue, 12 May 2020 00:33:36 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id l18so14011474wrn.6;
        Tue, 12 May 2020 00:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2h4884sQ1T4p7Y1kwQszHkwyBYLx3tAh+LvfZpaf3HA=;
        b=hj/t/bZrtKe6lucKS7eLxk781GNPG4OAwZMgiwqSb4m+80VHsBvJ2uhamejAGXeZ7r
         q5IHXTdDoR6EbasRYLMtwfmGdCZ+JkpqaIGoqizE4+YyjlCbNAFY6zKIFSzVsUWnESIk
         yo6FGZgqQb6kTxXPKhZ/n1whbyQhEZGjSVb6+v9iFqhmo/rC7mU/Lt37DWJOGFCNKa2x
         +zEmCbnrjQLfkLv3XzC2sOy7Tt+9YUMTOPXi7UyvRNGpnosSkp66Gg9cVEpMJ0QE7Pio
         OJ1xjLMLWq9cWmVfXLOzZwz8Ngn/Fh6n6Uj15s1m8J7DLsnEkzrlwx0AVM6Fp7nOPazs
         +YzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2h4884sQ1T4p7Y1kwQszHkwyBYLx3tAh+LvfZpaf3HA=;
        b=eNMTiyLT7AtnpBkaAHRAOSx49WIqofxzgIYbPlaqYl0sPkW9HpGdczklVJ9hR62R/H
         OPWW3yvPWPLVa8LFiRf5oBd8DsVpn6LHdwc6MChIrKpWw+qZxm2R9oZWbfELuwrGVgie
         NOkqLPGZ2f02JAd92UbA5vZwQnoLIZRGJGSELgMnAJT33fHdfAvMmzKrBuP3AQq4dcrr
         RG7TUaDlYy3bUy6xB2ZRbm88Af2TRXm9uRKt6Wdps1tuv+tfVDvAHCY4ypUBgiQoC0Uf
         hoiv/eObp4liLiZtmFO0E+fHon++dmMaCCrUVjpAw7a4LdvGhbDOH20f7kILZfLDJ0Wd
         dzWg==
X-Gm-Message-State: AGi0PubZlwjy8+VGxkGLebdt+WX2prQetkDEWd/iIU+9MA5M3YfGfGjK
        AK/qEYLLK2GHyXTbYp5iBHE=
X-Google-Smtp-Source: APiQypJg8hk4LeUiyc13Z6+SkueRhsAG3TusMR8RvPF7r54iGrokpgamTGkrM3NiCt+K/Id90NJKtA==
X-Received: by 2002:adf:b786:: with SMTP id s6mr22880078wre.287.1589268812747;
        Tue, 12 May 2020 00:33:32 -0700 (PDT)
Received: from skynet.lan (198.red-83-49-57.dynamicip.rima-tde.net. [83.49.57.198])
        by smtp.gmail.com with ESMTPSA id d9sm5961197wmd.10.2020.05.12.00.33.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2020 00:33:32 -0700 (PDT)
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
Subject: [PATCH v2 0/5] mtd: rawnand: brcmnand: support v2.1-v2.2 controllers
Date:   Tue, 12 May 2020 09:33:24 +0200
Message-Id: <20200512073329.742893-1-noltari@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200510151406.2527856-1-noltari@gmail.com>
References: <20200510151406.2527856-1-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add support for v2.1 and v2.2 NAND controllers.

v2: introduce changes suggested by Miquèl.

Álvaro Fernández Rojas (5):
  mtd: rawnand: brcmnand: rename v4 registers
  mtd: rawnand: brcmnand: fix CS0 layout
  mtd: rawnand: brcmnand: rename page sizes
  dt: bindings: brcmnand: add v2.1 and v2.2 support
  nand: brcmnand: support v2.1-v2.2 controllers

 .../devicetree/bindings/mtd/brcm,brcmnand.txt |  2 +
 drivers/mtd/nand/raw/brcmnand/brcmnand.c      | 89 +++++++++++++++----
 2 files changed, 76 insertions(+), 15 deletions(-)

-- 
2.26.2

