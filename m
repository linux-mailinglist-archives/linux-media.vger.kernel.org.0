Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5AE2A3AB223
	for <lists+linux-media@lfdr.de>; Thu, 17 Jun 2021 13:16:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232441AbhFQLSK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Jun 2021 07:18:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231189AbhFQLSK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Jun 2021 07:18:10 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA03CC061574
        for <linux-media@vger.kernel.org>; Thu, 17 Jun 2021 04:16:02 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id df12so975037edb.2
        for <linux-media@vger.kernel.org>; Thu, 17 Jun 2021 04:16:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eRoeVaaXjTUDEXCwT0O7O9+YvstCRV3pUx1vTDqRgQg=;
        b=G4wBwRp0IjZh+y0I9yhNcfOxHF+Za8sU6/ookQRfC8i1TVCIFcg3TQ9kveDi300x6q
         gdQqx77sfv0OtlGiYtOgajzGlUHIS1Ia/W/aJWKCQ9a22UKHP2FyRfZprVG/OBAzkY3r
         /oQEo33n5soAsdloWhelH3zPTiKwFVEXJdTg7+kNxpexB7bvOfGWCkqhoNsXos2Qua4q
         0uDo+1LSIVQk9PS4881xGdI2pDiJQBpPaVudCP+DShbmVho+BW4rNeeyZ6H5XSrhRXpS
         IzjNMQuKPBEF2K4zX91ZSpyEQnniQmfmIildKcuwkCYmDArJk1HvAxgf0IvMGBI/XwKW
         dUOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eRoeVaaXjTUDEXCwT0O7O9+YvstCRV3pUx1vTDqRgQg=;
        b=dVvO4m3qTp0PKjd2K6ZqwnUoWAKRVNvznnyntxOJVbE1pjT6HlDcHkg5EZ3As7AcIo
         B1d/p2Y0CbR+Sagh6ez9S3abXixQa0CwSLCkVWx+5dryvZrzWINL+fmhnnkJuhc9Wl89
         XDubYDRmvFF7rJGPkevzpTmmG8fG9nQGZKw6votU9qjNQOsC8TlcqsWO0JEP7/O+jKIX
         Lod8YpyCULzncyHPs2aNWORQiEHAC19rl3oeR9KoVIIOgJkmn45tjtd8gSB72c6D+2HO
         JT+0uWHlS2UZ4mjIb//Ap7hjy9+Z2vNML+UkDxQ2C0nH7FvBId6/Y5asNSo/jFAjOj/l
         en5w==
X-Gm-Message-State: AOAM532to1+SbyJb3VHwwy28lyqcB9nfFPpxoP1Ppc4gCIPGbUqFe3S5
        DQKUUUINobnZyu8zaEFCA8Sh/L3g3aM=
X-Google-Smtp-Source: ABdhPJytH6yVvyCmyeiBB7rLMSWtt83HkP7MUpXyrNkBfXBgFQ2Z867Cw4vlh/L4I8F8GBSaCTnRyg==
X-Received: by 2002:a05:6402:543:: with SMTP id i3mr5777204edx.173.1623928561443;
        Thu, 17 Jun 2021 04:16:01 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:8534:5e76:1ee5:f3ad])
        by smtp.gmail.com with ESMTPSA id y10sm3531353ejm.76.2021.06.17.04.16.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jun 2021 04:16:00 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     daniel@ffwll.ch, sumit.semwal@linaro.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        linux-media@vger.kernel.org
Subject: Introduce fence iterators to abstract dma_resv RCU handling
Date:   Thu, 17 Jun 2021 13:15:42 +0200
Message-Id: <20210617111558.28486-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi guys,

during the recent discussion about SLAB_TYPESAFE_BY_RCU, dma_fence_get_rcu and dma_fence_get_rcu_safe we found that the RCU handling for dma_resv objects was implemented multiple times.

Unfortunately a lot of those implementations get the rather complicated dance with RCU and the sequence number handling wrong.

So this patch set aims to audit and unify this by providing an iterator which automatically restarts when a modification to the dma_resv object is detected.

The result is pretty impressive I think since this not only mean that we got rid of all those incorrect dma_fence_get_rcu() cases, but also reduce the overall loc count quite a bit.

Please review and/or comment.

Cheers,
Christian.


