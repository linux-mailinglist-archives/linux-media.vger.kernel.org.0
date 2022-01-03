Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A58CB483031
	for <lists+linux-media@lfdr.de>; Mon,  3 Jan 2022 12:09:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232831AbiACLJm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Jan 2022 06:09:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229651AbiACLJl (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 Jan 2022 06:09:41 -0500
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33418C061761
        for <linux-media@vger.kernel.org>; Mon,  3 Jan 2022 03:09:41 -0800 (PST)
Received: by mail-ed1-x52c.google.com with SMTP id bm14so134530026edb.5
        for <linux-media@vger.kernel.org>; Mon, 03 Jan 2022 03:09:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gjHFmqKKy0pvx7C1xJpG5YoxXkIX6ICHWLbHG010pUE=;
        b=WHb4Q//CZyIHB75AN8epaDq5FKSsTwLkk0pq8K6sekgcyAZO38PlUOh0HV2DpeSba6
         tcJzB5oQBzkPiwMimifu6FtB3wUwPi+LxZsu5EjUEyci8V4140Fv3V7M7kSJIN6Flq8V
         6RjLda+m/ZF9IvoeYKTST5pOhpTqYk9zCNUQM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gjHFmqKKy0pvx7C1xJpG5YoxXkIX6ICHWLbHG010pUE=;
        b=hSB930MSXFnQzlKWiN5lDRpnGCgVZQBq60rP6aHw/kgKT/aBIDXOu1z0LfZYsQf1Kj
         /o3nxTfKBwQUH2xakrAz7bM//VFMLb/ndpvt3jF8QWamttVbt8T8nKFCRuLwENLIUTU6
         AQn8JcNxsJzEIxQ0324nRji3ND5ilgeCHmYeBn8QV/35zYHIPB/6Jc5cGMRy3BpT0ov+
         CkF2xSl5joxyGwYtq3L2aFMmqMLmOPvHRVxvf1l/evjO6F9km2JTghtCw9ytuWp7YTfh
         UdvA1/5eU0Svzjp6k5FxY1zsoAWcTsgodZ6XuPhSUHFU8QMzukh9j7+4h95nt1jePYtF
         tiFg==
X-Gm-Message-State: AOAM531vkM7GlgNnRVQryDSLzxt/XYXsqFpIwa7eCxAzptWzNw2immay
        HVoONnvm6EByyu6RF1UGV41NppWZtbLGiQ==
X-Google-Smtp-Source: ABdhPJxuepiG4jT8X9U/D/daZRrx+tlmyF1oHt+qLOeP8WfbE9S98gYtRTJgWmFRVelbBzisC1EFAA==
X-Received: by 2002:a17:906:dc95:: with SMTP id cs21mr37345327ejc.532.1641208179556;
        Mon, 03 Jan 2022 03:09:39 -0800 (PST)
Received: from taos.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id d17sm10536476ejd.217.2022.01.03.03.09.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jan 2022 03:09:39 -0800 (PST)
From:   Petko Manolov <petko.manolov@konsulko.com>
To:     linux-media@vger.kernel.org
Cc:     Petko Manolov <petko.manolov@konsulko.com>
Subject: [PATCH v2 0/5] adds ovm6211 driver to staging
Date:   Mon,  3 Jan 2022 13:09:17 +0200
Message-Id: <20220103110922.715065-1-petko.manolov@konsulko.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

v2: Removes an unused function (ovm6211_set_pix_clk) and this patch series is
now based on media/master; Didn't receive any comments about the RFC version,
thus i assume everything is perfect... :P
                                                                                                                                                                                      
This patch adds ovm6211 driver into the staging directory.  It also creates
media/i2c entry, where ovm6211.c lives for now, to mimic the generic media
source tree.
                                                                                                                                                                                      
Petko Manolov (5):
  adds ovm6211 driver to staging
  adds ovm6211 entry to Kconfig
  adds ovm6211 entry to Makefile
  adds drivers/staging/media/i2c/Kconfig entry
  adds i2c/ explicitly to Makefile

 drivers/staging/media/Kconfig       |    2 +
 drivers/staging/media/Makefile      |    1 +
 drivers/staging/media/i2c/Kconfig   |    9 +
 drivers/staging/media/i2c/Makefile  |    1 +
 drivers/staging/media/i2c/ovm6211.c | 1143 +++++++++++++++++++++++++++
 5 files changed, 1156 insertions(+)
 create mode 100644 drivers/staging/media/i2c/Kconfig
 create mode 100644 drivers/staging/media/i2c/Makefile
 create mode 100644 drivers/staging/media/i2c/ovm6211.c


base-commit: 68b9bcc8a534cd11fe55f8bc82f948aae7d81b3c
-- 
2.30.2

