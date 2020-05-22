Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A7271DE0D5
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2020 09:26:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728672AbgEVHZb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 May 2020 03:25:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728409AbgEVHZa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 May 2020 03:25:30 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBA2FC061A0E;
        Fri, 22 May 2020 00:25:29 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id h4so7714534wmb.4;
        Fri, 22 May 2020 00:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZLZqiPmSDvovjhwGm4w627YXSjaGWbzcz2M2rVZdomQ=;
        b=oATR3FF6mh22GdA5Shgwzt7kSFsqqxk32t2cCBJuGQZUet9G3vkl+fJD6Eg5tKiK70
         lLKjarlUi1zCwgNx+s04jZ8UJkc1xGzejYUMsUbh/edZONvt9eSiqFrz7YBmeAItHsvE
         yo0pnKdrth0FO0mK/b/bgT7jAQG8J79ezXVlZHZO6JVu1aMv4HLixbeTKUuHeKpg6D5v
         YUoWbhjRLUin+sGsfwIfmmASbyr0xTSFJVOwPLiuhwJm4x8EPOiFf/UV44jvlaG5SagS
         8Ac+YtQLVgC5Hi5uM24l6/v57CoflPE/RSiNBaJyMS5MxyA7A5LsMzUHRFqdpI4a0OYl
         wBGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZLZqiPmSDvovjhwGm4w627YXSjaGWbzcz2M2rVZdomQ=;
        b=L4Vx242/K93dYEVxpTtEL8lIrSv6rYBIXma7p4TIvsqm9308hmbjnEtV+wzOr+/9am
         xReWI/AlWWRut6ER+DT1Tn4lgmqjCK5yFQEJSv9g4xaEjsA8fLvrl7RvFSTWdgqZlqG7
         7lWgYrUCgaQPXMg6TZj3836ir9PmXloMCnhd+6yTYarYTO1T3D3SKwTdw5uNFDihwIif
         PEpAg2eJJ5qysRrwIgqMPEl7qt2NsQ1kgRCihBopAJb6LynuYW7tSeGOvygnnityCZi6
         xy4cfZ/qE6PjlCaxjXJX+EPTLkqnvkxmzQXp+EvPXbm/1BKe4lzyCO3Wqv1oa66jMhcm
         x/Ow==
X-Gm-Message-State: AOAM530BRF7SjX/ClfoTSfWnTlA8fiEfS+vJJTKuntaZA8XErw64z708
        dbOZs/p3BTop4ejxSJqzTgU=
X-Google-Smtp-Source: ABdhPJwu42LmV04Uv0SXsBsA+CPRsY5XoQxYdUKzxlKZnRrbArAX7FQTVSP60lbhmk3O4xW9mgutLQ==
X-Received: by 2002:a1c:6784:: with SMTP id b126mr6601248wmc.80.1590132328483;
        Fri, 22 May 2020 00:25:28 -0700 (PDT)
Received: from skynet.lan (159.red-83-44-12.dynamicip.rima-tde.net. [83.44.12.159])
        by smtp.gmail.com with ESMTPSA id f128sm9299898wme.1.2020.05.22.00.25.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2020 00:25:28 -0700 (PDT)
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
Subject: [PATCH v3 0/5] mtd: rawnand: brcmnand: support v2.1-v2.2 controllers
Date:   Fri, 22 May 2020 09:25:20 +0200
Message-Id: <20200522072525.3919332-1-noltari@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200512073329.742893-1-noltari@gmail.com>
References: <20200512073329.742893-1-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add support for v2.1 and v2.2 NAND controllers.

v3: fix v2.1 page size shift
v2: introduce changes suggested by Miquèl.

Álvaro Fernández Rojas (5):
  mtd: rawnand: brcmnand: rename v4 registers
  mtd: rawnand: brcmnand: fix CS0 layout
  mtd: rawnand: brcmnand: rename page sizes
  dt: bindings: brcmnand: add v2.1 and v2.2 support
  nand: brcmnand: support v2.1-v2.2 controllers

 .../devicetree/bindings/mtd/brcm,brcmnand.txt |   2 +
 drivers/mtd/nand/raw/brcmnand/brcmnand.c      | 100 +++++++++++++++---
 2 files changed, 86 insertions(+), 16 deletions(-)

-- 
2.26.2

