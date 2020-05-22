Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B60691DE68A
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2020 14:15:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729353AbgEVMP3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 May 2020 08:15:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728979AbgEVMP3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 May 2020 08:15:29 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB974C061A0E;
        Fri, 22 May 2020 05:15:28 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id g12so8754533wrw.1;
        Fri, 22 May 2020 05:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fQoBl3iAB4AAXzroqv3WcbLITd0lPVqqa2vsLWJSegM=;
        b=U350gRFZNFttFLFDn7l6Ua1iUdEfSGq+wqwtW6wCoLJj1Pz/ANf1sGDDYOG85/hXjb
         1Wy5kKSUwgY1Q1nHUaNS/TqKkxIs0a5m8qp5dSYt0sfqXvXZzKdzWtGRyR9NheoUC/bM
         7UgkPGJIT4uQehBOuaNUNs8iCVYp4a+bbf/pHOehAcBv+sgxrDIoxw0/3lhBwYDYlcAz
         LBd1hgMpCKX0WhUdIhYsFzdvrlwWGcV4UEuABPEemGik9iq/icN6z7Kx+ajfJZWnI6MZ
         4StIIgeHCSZDejXLiQdE+ZB/v0UR5DPyvlmCpbqD9dPwY/Y4bzPbjXTaqGvLGy5zp+x7
         lnsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fQoBl3iAB4AAXzroqv3WcbLITd0lPVqqa2vsLWJSegM=;
        b=H/xKP0niGWs5FxKPbnmR8SYagDPfidLLMfzobLjbJiXNiZmRZkjYV5OJzoqRzuaQKT
         BmMaMb/A4/Niw14jvKZTkbONE3bJ6LMDtyDaJW4irbdlujzHtR2nV7m/xuV2sxsU87KI
         j9UIST/7p0oo+RJuFbifwpuVkLM1ntgAC/QtNXbNOk5SAFuhn4JGzOqCnQrdjRU1EoNj
         Z0fcyfeUVYStuS6vUpksF/kF0kFyy0fMGsl9PhpUgfWeklgmn2q3u6dO0ZuR782CuAbU
         riDaQuR2gKjmjxnlBZ8jfJeM8cjp0vtiwxnXUa3JCyUaH0Kdvf0FGi8OaN272DRm8Rqt
         cGgQ==
X-Gm-Message-State: AOAM5335ufxtnb94C/moxJF5JukCLbjmfIM2KAJb8QfR9k68oddRW4QA
        btOEQS5/jLs6S+e+kGZTyDE=
X-Google-Smtp-Source: ABdhPJy9YsaQM1hIz0EqZ7h7vCKorss2/EuI/RFW7gjWph4x4T+L9tElIO36RODgl0g69l+kHetDzQ==
X-Received: by 2002:adf:9507:: with SMTP id 7mr3128224wrs.63.1590149727152;
        Fri, 22 May 2020 05:15:27 -0700 (PDT)
Received: from skynet.lan (159.red-83-44-12.dynamicip.rima-tde.net. [83.44.12.159])
        by smtp.gmail.com with ESMTPSA id g6sm9293784wrp.75.2020.05.22.05.15.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2020 05:15:26 -0700 (PDT)
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
Subject: [PATCH v4 0/5] mtd: rawnand: brcmnand: support v2.1-v2.2 controllers
Date:   Fri, 22 May 2020 14:15:19 +0200
Message-Id: <20200522121524.4161539-1-noltari@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200522072525.3919332-1-noltari@gmail.com>
References: <20200522072525.3919332-1-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add support for v2.1 and v2.2 NAND controllers.

v4: fix commit subject.
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

