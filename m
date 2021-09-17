Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18A0A40F7A4
	for <lists+linux-media@lfdr.de>; Fri, 17 Sep 2021 14:35:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244162AbhIQMgj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Sep 2021 08:36:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244160AbhIQMgj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Sep 2021 08:36:39 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74E87C061574
        for <linux-media@vger.kernel.org>; Fri, 17 Sep 2021 05:35:17 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id d21so14898056wra.12
        for <linux-media@vger.kernel.org>; Fri, 17 Sep 2021 05:35:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NqzuWFeqLMR3DIAr8L16pZ3er+uc6gXgKxZaXcF1adA=;
        b=MR4GVrYUq6pOKxeWCneMvbSRqOC+VP7J5W57KEltAJySgk58K8pLppWet97v8xr9aX
         eb2V/mPYRz6HL01TnvLNKPQ8Tz2PlzAAqNDxPkCgOec3gIuwxxFwml86jPEsA8B3aQQ8
         iZB/PiZ4oLuGzCphdVPgKJ6L54dJvbQ46+jf3uI7NTYjLgv9o3HLQk949201HWtFMOXM
         xAYI/JNljopIky6BUOHugrkZZyUec0piAVdIschbj4Er9Ak502jXuQ3qJFIkMzquZa8Q
         n43uaQzUhAPF8ddZ3lRUE+oZtPlVf7U5Dzrl1Pk9J9wsAQ/dH8KARjNA0DIonGaHMW3s
         oRRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NqzuWFeqLMR3DIAr8L16pZ3er+uc6gXgKxZaXcF1adA=;
        b=yU8yo4a6fdH7dKhExayAX97rSAM37Jsih+o7BJWAG0mbnM/ULnyL5/DhPHr9gSC3vN
         1Lh3+U/1+12Kz/B9v/B/BYhqGR/Ozxzb1bbZyA9NxMyVOdEXP5GvNnxuRGWUZxEBTJNT
         XHbOg6e4c/xfyb4iDupzbrqQTCRdKmyGizsd2T8RBN7OBUagJC2ToG6yVNv5LJKZ1NW4
         d796fF18VgrDEuAuGYbbAV/FW9XpjX38jqKQMW2TwVrdKutbxDoKfJX5LiBRULdszAlf
         XVwsUtzwgmRgZqxukLBCjrB5YH0/YOoJplCk+IEmzdaJFu2/SZcShN2md8gZwHcO/irJ
         4D5g==
X-Gm-Message-State: AOAM530CIGuaEEX6f1ZMasL72tfqyPXjwHgmkaQOumhIlbUh1LaVLoW8
        u7x/AiD2yl9tUPV7NCBQUNo=
X-Google-Smtp-Source: ABdhPJyK+onjjmSAKaFQWBBQw+peagAXA1OgNeJVDQ/AMdoYnHiB3CR/VT28asGrQ3AobNAvWnDc4g==
X-Received: by 2002:adf:f18a:: with SMTP id h10mr12091268wro.42.1631882116093;
        Fri, 17 Sep 2021 05:35:16 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id l21sm6122049wmh.31.2021.09.17.05.35.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Sep 2021 05:35:15 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc:     daniel@ffwll.ch
Subject: Deploying new iterator interface for dma-buf
Date:   Fri, 17 Sep 2021 14:34:47 +0200
Message-Id: <20210917123513.1106-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hopefully the last round for this.

Added dma_resv_iter_begin/end as requested by Daniel. Fixed a bunch of
problems pointed out by the CI systems and found a few more myselve.

Please review and/or comment,
Christian.


