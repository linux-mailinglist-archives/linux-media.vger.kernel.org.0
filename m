Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 611DA3B0ABF
	for <lists+linux-media@lfdr.de>; Tue, 22 Jun 2021 18:55:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231557AbhFVQ5h (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Jun 2021 12:57:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230338AbhFVQ5g (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Jun 2021 12:57:36 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3D37C061574
        for <linux-media@vger.kernel.org>; Tue, 22 Jun 2021 09:55:19 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id a13so2694002wrf.10
        for <linux-media@vger.kernel.org>; Tue, 22 Jun 2021 09:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ofnj3zZOb6lvNBLTmLvRZ/dI7B7Qizs2A5qFqSokZMs=;
        b=PlDcLOVGiA96xcwhvZHPQlAvGMEDcBg9O6ntIM3BCh41iUZ2TDSZtrlqYDU8AaH4SW
         VDIN57zvAe9n66JyTgIQ0zKjFdNj0fhCyqYu1iSpC/6rjhGX2IkMAmVssHzRiuldBTiR
         jhp1mZSCgGKNP26cKAT1jLdUgW5uFs/CRHA+0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ofnj3zZOb6lvNBLTmLvRZ/dI7B7Qizs2A5qFqSokZMs=;
        b=UXqLdHXdW9Ocg3FP4mqgj0pwW+TS+SkVoGKj4HRPzKzocGp0J86Uf0hcoxiK27BRyj
         CumzUvq+5d2Dab9WHJn35BH6OmVSZDBhhwM/A2e9axCXsxPU2Mfko6E09oqF46/KWC2a
         VSP/yrQjipenB7+lR/P9EF12fZRCcv+/NRrgLz4OonsFC+NxRQ4yokcNOOt5+9g0s+Qe
         38koPMvfdFjbQduW3jO8sB+9qpI/n0+tTpYCeFRfTtfgA3m+45c58JIyKNT8Y5c8VrAN
         UyEM9hpHTLA3QCDapfYStR34oFPc2vgYhOWCWjpDCfcBOueKjc4rMJgrUCILqM4AZI34
         o4mg==
X-Gm-Message-State: AOAM530+dZdciKbGnD4+GqtmjwnpkRYMqYQ041U6CYHMfKFmCmc7IKFz
        QuISvi0m7p0wRoXMWYq/1bJHexSNdWYFbw==
X-Google-Smtp-Source: ABdhPJxbm3m5AxBLJ1sntMH1y3g3e+GjtyXkKAUUh9TQfj84Nt1Ek6DhdWavkN+hSBoePr5r0dEEoQ==
X-Received: by 2002:a5d:6c65:: with SMTP id r5mr5875974wrz.339.1624380918343;
        Tue, 22 Jun 2021 09:55:18 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id l23sm3632342wmc.5.2021.06.22.09.55.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jun 2021 09:55:17 -0700 (PDT)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     DRI Development <dri-devel@lists.freedesktop.org>
Cc:     Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: [PATCH 01/15] dma-resv: Fix kerneldoc
Date:   Tue, 22 Jun 2021 18:54:57 +0200
Message-Id: <20210622165511.3169559-2-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.32.0.rc2
In-Reply-To: <20210622165511.3169559-1-daniel.vetter@ffwll.ch>
References: <20210622165511.3169559-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Oversight from

commit 6edbd6abb783d54f6ac4c3ed5cd9e50cff6c15e9
Author: Christian König <christian.koenig@amd.com>
Date:   Mon May 10 16:14:09 2021 +0200

    dma-buf: rename and cleanup dma_resv_get_excl v3

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: linux-media@vger.kernel.org
Cc: linaro-mm-sig@lists.linaro.org
---
 include/linux/dma-resv.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
index 562b885cf9c3..e1ca2080a1ff 100644
--- a/include/linux/dma-resv.h
+++ b/include/linux/dma-resv.h
@@ -212,7 +212,7 @@ static inline void dma_resv_unlock(struct dma_resv *obj)
 }
 
 /**
- * dma_resv_exclusive - return the object's exclusive fence
+ * dma_resv_excl_fence - return the object's exclusive fence
  * @obj: the reservation object
  *
  * Returns the exclusive fence (if any). Caller must either hold the objects
-- 
2.32.0.rc2

