Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16477461639
	for <lists+linux-media@lfdr.de>; Mon, 29 Nov 2021 14:25:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377775AbhK2N23 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 Nov 2021 08:28:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377658AbhK2N02 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 Nov 2021 08:26:28 -0500
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECA5DC06139E
        for <linux-media@vger.kernel.org>; Mon, 29 Nov 2021 04:07:03 -0800 (PST)
Received: by mail-wr1-x42c.google.com with SMTP id q3so13407462wru.5
        for <linux-media@vger.kernel.org>; Mon, 29 Nov 2021 04:07:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zHSdQUo/Z1ZUW2K5tQ/UFoyARgZ8X0ChGzLOvRpv+d0=;
        b=X9+o7iX5QfU7Ab0akA1dDvE2mT0HK8UOLIgco2KjGFZkh13zyRptiW3RR2HPLxCMlr
         K3I8Xwd8jwKKeOwFXHiCymTNGMXdaCdnMfLiWItsIS3DqESMXpPGkvk8eSnVSQlizVQM
         25kCS2PIOBra3yyk/9fMKi73GYmWj1ao1VE2rI/AysW/CYl7+A71OWUoVjv0P5RWzvmF
         ei4VR+Og5xrTbOvUhCm5OKvYgce64ioRfT64xyAL/MvgR4RoAkdTdg+/yaX07cLUX2qd
         87ks8GKrCjaJayYD8vkRPYAnZ0V8GhIKpYBaTogI7ZheY6CnEk9Wr2lDGwv1b5r70E5b
         74zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zHSdQUo/Z1ZUW2K5tQ/UFoyARgZ8X0ChGzLOvRpv+d0=;
        b=8SCRSfRyncja+8sOjarxw08vpCR6dNLegv0h5625grNcMPI32ox2J7tc1oxRHfabd+
         2eQGR8VO5al29n/xpBQhVwf1kHR/aHVyjNkUi7l4W7buPS7zQCjos3Lb7//3s5lnjud7
         7X84iRUvpwGX//lPPc+wU50Hc1UQZbBoIxbxZqLDFOBXbs8yEIdOA4OJGcB6uSukGuZi
         MMK/DMde3h2/CMxklKt4dg3N4ovtof1xmeibOIqxovpXkuvLqAytZJDusZII9QcOs1Wu
         XGWWH0wYt48679aHYRXrCbMZmjcQwvg3tFOaTfr9RZ8C5gRWLMDgjQj51jbJupBuKeBA
         MyVA==
X-Gm-Message-State: AOAM531ylDG7YU6XFaEQLChjc30EE1/CMWdE1xG+kZrPxgR/0r+puG7m
        VJSMZfIN+HT4+v87aLMq2A3Tbg9MmtY=
X-Google-Smtp-Source: ABdhPJy28uYGJlxEr/SzYN0VNKwr33UJ/8ZdAHdtvlS/NExTfCzbnCk11Gflha3P8ddzATr74mIGpQ==
X-Received: by 2002:adf:eac8:: with SMTP id o8mr34155552wrn.337.1638187622570;
        Mon, 29 Nov 2021 04:07:02 -0800 (PST)
Received: from abel.fritz.box (p57b0b77b.dip0.t-ipconnect.de. [87.176.183.123])
        by smtp.gmail.com with ESMTPSA id b6sm20415234wmq.45.2021.11.29.04.07.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Nov 2021 04:07:02 -0800 (PST)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     daniel@ffwll.ch
Cc:     linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org
Subject: completely rework the dma_resv semantic
Date:   Mon, 29 Nov 2021 13:06:31 +0100
Message-Id: <20211129120659.1815-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi everyone,

compared to the last version I've dropped the pruning as suggested by
Maarten, split the new DMA_RESV_USAGE_* patches from the general
introduction as suggeted by Daniel and renamed OTEHRS to BOOKKEEP as
suggested by Pekka.

Please take a look and review,
Christian.


