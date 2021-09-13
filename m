Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EFD14408E09
	for <lists+linux-media@lfdr.de>; Mon, 13 Sep 2021 15:30:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241603AbhIMNbJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Sep 2021 09:31:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229810AbhIMNTs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Sep 2021 09:19:48 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C134DC0613D8
        for <linux-media@vger.kernel.org>; Mon, 13 Sep 2021 06:17:12 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id i23so14674286wrb.2
        for <linux-media@vger.kernel.org>; Mon, 13 Sep 2021 06:17:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZdomM/e/zSdALEInWCh/AvZjZ5yHPc4saWmSbkGx8Dc=;
        b=ouCR+3aNsA1DiTowvBNcV8DKE3ifr2meLpymuJYbnE0iyPBxH3K2CRGIogq0MrDrRd
         Ah1C/sRwYxZoygqorAHIuOyDajlC5xLvlNs/P+aq4En6ifOF1IaRUtwN/DPE7u0t289Q
         BkzADtUG7taEXdtKsr9cZEPU2cggQoh7zrxMN1S6yUHPn0qYMQr246TdMCeTUJWI6B5C
         hX7gGoP5jEq04DtHwdWuSCAVJEIKnvaH1LaTNVMsRzD1qScXKm8R3xxpd+dtekJmHpjr
         90+O9aUK5BlBYMY/H4cT3mg98HMNCHS9z0/dSn3DbSxoBFYcQEOB5XD5A3HgQ4xhmzi/
         +v2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZdomM/e/zSdALEInWCh/AvZjZ5yHPc4saWmSbkGx8Dc=;
        b=usFs8c5Qk/mArcvCJjuFClO9Eb4pJzWgOwL+9baalFyml8Y8YyRMuohjZZB5td18mI
         1uV58beZJ0J5sVnO+cR9VGOr4sauPmUnA9IwYBMTO5JGWCZqyaoWK11Ktqm1DyP1JDFg
         JCZdG1qX0SbJR8r6jRY0JAFJPNAtjBLu0BfIUlpGiDvnHpb8lReoxJk+pRxtukPi9EP0
         wn1Ybj9Xdi5lFc6dncxX8EoTjJhWscF9Di7zxOVq/Y9t8+AwSmAcavaQhnEBWJ/nRwM0
         DJYVLR58ApjCVdcR3YotaTTc7Iv0eSLKD7lI4CAP6ZOhw0nJuiRaX9ILcXnT4TlU7xOY
         7OOg==
X-Gm-Message-State: AOAM5338KbfRIK2EYxxo7J5UuRVsNb5YSxJhqjqDzkhz1BQCSB9QKOsj
        qEVaJr+ldXggxWb+3Goio3c=
X-Google-Smtp-Source: ABdhPJwqVroUXWf2cq8qtCQb/MmqMUlY4BONTjLjBugzEnJvbKfR5QsL1Vb0BBVo//Fn92ciq/iymg==
X-Received: by 2002:a5d:4b50:: with SMTP id w16mr12486672wrs.71.1631539031462;
        Mon, 13 Sep 2021 06:17:11 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id h18sm7602834wrb.33.2021.09.13.06.17.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Sep 2021 06:17:10 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org
Cc:     daniel@ffwll.ch, intel-gfx@lists.freedesktop.org
Subject: Deploying new iterator interface for dma-buf
Date:   Mon, 13 Sep 2021 15:16:41 +0200
Message-Id: <20210913131707.45639-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi everybody,

we recently found that a good bunch of the RCU accesses to the dma_resv object are actually not correctly protected.

Those where fixed by either dropping the RCU approach and taking appropriate locks or using a central function to return the current fences as array and then work with that snapshot.

This set now tries to prevent adding any new broken code by rolling out two new interfaces to access the fences in a dma_resv object:

dma_resv_for_each_fence() - Iterator which should be used while holding the reservation lock.
dma_resv_for_each_fence_unlocked() - Iterator based on RCU which can be used without holding the reservation lock and automatic restart on concurrent modification.

While doing this we also move the decision which fences to use for write and read accesses into the dma_resv object which results in a quite nice code de-duplication and simplification.

The only two remaining users of the RCU shared fence interface are removing shared fences in amdkfd and debugfs code in qxl which will both be addresses in the next patch set.

Please review and/or comment,
Christian.


