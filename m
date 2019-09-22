Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A11D2BA163
	for <lists+linux-media@lfdr.de>; Sun, 22 Sep 2019 09:49:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727789AbfIVHtu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 22 Sep 2019 03:49:50 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:33773 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727785AbfIVHtu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 22 Sep 2019 03:49:50 -0400
Received: by mail-pf1-f195.google.com with SMTP id q10so7151458pfl.0
        for <linux-media@vger.kernel.org>; Sun, 22 Sep 2019 00:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/P04TVQeG2TqtKqnh5NeUjgcAZkp2eeIEEO+pcLFimI=;
        b=M/xx3S0fObzJAC7Q0yLbKqcZqa5MoT9YYx9XUcR4V8ItKFBQYE/QwdqzrWkmKANvGN
         MYuC9n+WDjYmQIm1JImn4++yj8Nv/FD2I2Atm4bEw2L//p4BP0BpQ3Z4PEnPc8wdWjCi
         SR8sH/6I6+5o+r/u6MOnsKtg1ZDUEUBX8HyJpspkTtzOgGSXFCqPgWU60BrMRpv5185L
         wKDtpTgqYgr3MJU3/3M2EIDNSvivtVl7CJOxESGXrBB2xDua2+wbM2fFC8YLYVflWWbV
         SqsQwDPN1muzH+wMK7WSP0UiVhamJaM6a82sSoFobxf9cjeuaZtsT7HdkC2gA3JtVsqp
         1J3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/P04TVQeG2TqtKqnh5NeUjgcAZkp2eeIEEO+pcLFimI=;
        b=bIABmlmKL9DaHr07bc+Dc4MSjbM74WfMhgnk8AbNtr8V9+fyxlgYIaFp2+4AuETAiz
         ArClyhpTtZ4IGpOujxbjCq3NH5B3Adat5Gi/NA250pH3DDRb8cANLHLub8EvUIeUxc0G
         JK7x/9+SodEGkLPveQLiG+ADogZyGS/BrKjXL6a03Z42TyQ4VVINdxlPX2fzgCfYBzve
         nkiK9NV4VYf++OVzA8L60nUY+p5urzA1mfkeHO/zAouQhtUD+vJ1ttOp4MLFxtkmf673
         ZAGG/wQGop92XZiaNSvxUYNl8uTHaVAPSdjYsJp3SXAbHcgD9LgoPKAgPSWF+QZPKSOJ
         yqYw==
X-Gm-Message-State: APjAAAW0CQ9owB7+sbTIkGv6gCMluVkREMfmvjDnsq1rQbklBN5f+eSK
        zP2Mor7u7FOqypygbpunrCA=
X-Google-Smtp-Source: APXvYqx9WFfqi0tOd1jiZXhwnRWHa9sevld2/rp0T8BsVLUgUcSnQPf8YghWXMs7gYxMmchxrZtI6w==
X-Received: by 2002:a63:790b:: with SMTP id u11mr7725989pgc.273.1569138588365;
        Sun, 22 Sep 2019 00:49:48 -0700 (PDT)
Received: from yuq-Aspire-4738G.lan (ah.ptr230.ptrcloud.net. [153.122.161.8])
        by smtp.gmail.com with ESMTPSA id f188sm6194234pfa.170.2019.09.22.00.49.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Sep 2019 00:49:47 -0700 (PDT)
From:   Qiang Yu <yuq825@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     lima@lists.freedesktop.org, Sumit Semwal <sumit.semwal@linaro.org>,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        Qiang Yu <yuq825@gmail.com>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH] dma-buf/resv: fix exclusive fence get
Date:   Sun, 22 Sep 2019 15:49:00 +0800
Message-Id: <20190922074900.853-1-yuq825@gmail.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This causes kernel crash when testing lima driver.

Cc: Christian König <christian.koenig@amd.com>
Fixes: b8c036dfc66f ("dma-buf: simplify reservation_object_get_fences_rcu a bit")
Signed-off-by: Qiang Yu <yuq825@gmail.com>
---
 drivers/dma-buf/dma-resv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index 42a8f3f11681..709002515550 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -471,7 +471,7 @@ int dma_resv_get_fences_rcu(struct dma_resv *obj,
 	if (pfence_excl)
 		*pfence_excl = fence_excl;
 	else if (fence_excl)
-		shared[++shared_count] = fence_excl;
+		shared[shared_count++] = fence_excl;
 
 	if (!shared_count) {
 		kfree(shared);
-- 
2.17.1

