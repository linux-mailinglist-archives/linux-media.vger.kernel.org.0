Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 08895494EE6
	for <lists+linux-media@lfdr.de>; Thu, 20 Jan 2022 14:27:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234455AbiATN1v (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Jan 2022 08:27:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230491AbiATN1v (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Jan 2022 08:27:51 -0500
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FD78C061574
        for <linux-media@vger.kernel.org>; Thu, 20 Jan 2022 05:27:51 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id o1-20020a1c4d01000000b0034d95625e1fso7413148wmh.4
        for <linux-media@vger.kernel.org>; Thu, 20 Jan 2022 05:27:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fg716y4MiLyyXQDO8h3nFRM6quSlb9x3KrUEMDa+vBM=;
        b=URoTrhHmLIknwGRjipG8fwVJNbcTRTJNZg0brPQae0b5AtGytfOdXDEGKXYKgw6YJb
         dpZdDFU0B0st4j0tKxMPpGMUddD3NXT1XopDR00DVxAAcesy+NmjQ7604W1EcW4Uv4oD
         wJEQoEZAoXBeLsfuR18c/BRvQpHfi/+kHpjT3dgHucVA6JD+eE3Tbjl0hGweI0luVeWC
         YcntrN8PyqFzxeg2Mb1/pWUfLWtPx+LBIC7aPXH3eJWuJ9WIWS04EixAJnR4Av5eCs3W
         J9PM+sAUlcnunzmpN8bqbCrUfcETh/8AC9MvmkP4PWV3S3TJqPpS5C8qszIjFkELGm7q
         /W6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fg716y4MiLyyXQDO8h3nFRM6quSlb9x3KrUEMDa+vBM=;
        b=4/JZcI1eXQCTUuR4kdLuShonfUSrKpGUxBMD4r6QQQb13U1pI1I9+lUD7yqqefRSFa
         F2SuTmzACzN+4BT4JkudHalJQQEbuPFRVF/709xUGCGuFiEsAzm6ZVdmGGP7cI18Ugo7
         tbbQquYqtjL7q7P1FxvvXtjN0VToLoxtH0MtvkQ7BGyQwuCp898uxKiPZI9A8btQNOmx
         KIn73I99Qz51jhh7O3UmuKkmXfL0Wtl+Sq+N7JYZJGCU1hcyfp1xiWHaS8uqFBXY36lu
         kwiUdr6olT0jzOTLfhz2JwBHsOklzZ1v5KtEUspiJ36oLQxRm0KOTqKMe+ZcN0vZ8kxz
         vYJQ==
X-Gm-Message-State: AOAM532WbqRG/Ug0GT5mGSMzP8XIYClJ9ovSq9p4JuwgXviXzHQnI7mb
        Nb83L0+nco7CUQB6Skmz7CZcZBORqYA=
X-Google-Smtp-Source: ABdhPJyq3Wxk9a8Apw4i45euPrV9j5Rjus1JSRDx4JlL4eNcqp1z4o77N/YkC8RnngJeEmZhvwXtNg==
X-Received: by 2002:a5d:64a3:: with SMTP id m3mr33769326wrp.36.1642685269640;
        Thu, 20 Jan 2022 05:27:49 -0800 (PST)
Received: from abel.fritz.box (p57b0bff8.dip0.t-ipconnect.de. [87.176.191.248])
        by smtp.gmail.com with ESMTPSA id a9sm2658454wmm.32.2022.01.20.05.27.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jan 2022 05:27:49 -0800 (PST)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     sumit.semwal@linaro.org, gustavo@padovan.org,
        daniel.vetter@ffwll.ch, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Subject: Enforce dma_fence container rules
Date:   Thu, 20 Jan 2022 14:27:38 +0100
Message-Id: <20220120132747.2348-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Daniel,

second version of this set.

I've kept the fence ops exported for now since there are indeed valid uses in the drm_syncobj implementation which needs a more wider rework.

But quite a bunch of cases in i915, one in amdgpu and another one in vmwgfx are cleaned up at the end of this series now.

Please review and comment,
Christian.


