Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0EBB28651F
	for <lists+linux-media@lfdr.de>; Wed,  7 Oct 2020 18:46:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728017AbgJGQol (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Oct 2020 12:44:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728015AbgJGQoj (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Oct 2020 12:44:39 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 000E5C0613DC
        for <linux-media@vger.kernel.org>; Wed,  7 Oct 2020 09:44:36 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id d4so3034249wmd.5
        for <linux-media@vger.kernel.org>; Wed, 07 Oct 2020 09:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xCribZCwI3aUgI2eueSnhSAx0iK7WRTlleTX9tsbcR8=;
        b=AEi0JhgJ/wano87gBRhR1tEZu/2EKduKDu6Ltn89c4up88D2DvP8uOVpNqsDXBFtnE
         uBotxUV1Gtcupqn+vwnQ//qkEuBYFfn9hAA4wfcNAvQjAmgdjCuFhd1GGP6T/Ewlm2E/
         JGXPzVAxru77FUj56UyGwJmL4Ut534V3QbOHI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xCribZCwI3aUgI2eueSnhSAx0iK7WRTlleTX9tsbcR8=;
        b=VJwVr4cqwqbdAnOm1rBUK7W6jqv2OVuS93Tvb32T2426iTxWFVQ63pI5fFFXLZx8ht
         wnQSlG0K4yRQM6d5wGFAcmoMJSL59D9sKAv8cCAU8wi6gnOsGgAM2IxRY5EEsR5Ja+GU
         X+qzLcO7XRTmIFErN04ndWTzvGCKcKPCGFF8/02VsYVIr9tZrchUhP5TDkbeytrnfh4R
         TAwHjmcAqfuwg9wL3qShvwo2M2qt55/4LtxLTkjC9j8fEwzOh8l1f9mSkxI7MuQjVJgU
         IFr4E98b2hgFRHCJ4qQzIhXhpTAeiw/vkdeoc6z8Ua5ehQJQAU36noNRqPLPuhTgjSrY
         MsMA==
X-Gm-Message-State: AOAM530RzlR1ILCtGroQljMbxiwOrdpmJ/nYmG1dT2kM7KkIVwrnR/dd
        3LxUlBYmOqD4BU8uYqKBVDNITA==
X-Google-Smtp-Source: ABdhPJyKKkQ5Sn3LlEIAOp+pYCQMLBXLV3Rqf2bnTEOKXc6oZdqFUt1FUSyG1jw/hndeOdOxOW/8zw==
X-Received: by 2002:a1c:49c2:: with SMTP id w185mr4194920wma.70.1602089075637;
        Wed, 07 Oct 2020 09:44:35 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id z191sm3332280wme.40.2020.10.07.09.44.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2020 09:44:35 -0700 (PDT)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     DRI Development <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>
Cc:     kvm@vger.kernel.org, linux-mm@kvack.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-media@vger.kernel.org,
        linux-s390@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Inki Dae <inki.dae@samsung.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        John Hubbard <jhubbard@nvidia.com>,
        =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
        Jan Kara <jack@suse.cz>,
        Dan Williams <dan.j.williams@intel.com>
Subject: [PATCH 02/13] drm/exynos: Use FOLL_LONGTERM for g2d cmdlists
Date:   Wed,  7 Oct 2020 18:44:15 +0200
Message-Id: <20201007164426.1812530-3-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201007164426.1812530-1-daniel.vetter@ffwll.ch>
References: <20201007164426.1812530-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The exynos g2d interface is very unusual, but it looks like the
userptr objects are persistent. Hence they need FOLL_LONGTERM.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Inki Dae <inki.dae@samsung.com>
Cc: Joonyoung Shim <jy0922.shim@samsung.com>
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>
Cc: Kyungmin Park <kyungmin.park@samsung.com>
Cc: Kukjin Kim <kgene@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: John Hubbard <jhubbard@nvidia.com>
Cc: Jérôme Glisse <jglisse@redhat.com>
Cc: Jan Kara <jack@suse.cz>
Cc: Dan Williams <dan.j.williams@intel.com>
Cc: linux-mm@kvack.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org
Cc: linux-media@vger.kernel.org
---
 drivers/gpu/drm/exynos/exynos_drm_g2d.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_g2d.c b/drivers/gpu/drm/exynos/exynos_drm_g2d.c
index c83f6faac9de..514fd000feb1 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_g2d.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_g2d.c
@@ -478,7 +478,8 @@ static dma_addr_t *g2d_userptr_get_dma_addr(struct g2d_data *g2d,
 		goto err_free;
 	}
 
-	ret = pin_user_pages_fast(start, npages, FOLL_FORCE | FOLL_WRITE,
+	ret = pin_user_pages_fast(start, npages,
+				  FOLL_FORCE | FOLL_WRITE | FOLL_LONGTERM,
 				  g2d_userptr->pages);
 	if (ret != npages) {
 		DRM_DEV_ERROR(g2d->dev,
-- 
2.28.0

