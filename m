Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 673424F7AD9
	for <lists+linux-media@lfdr.de>; Thu,  7 Apr 2022 11:01:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243491AbiDGJBw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 Apr 2022 05:01:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239858AbiDGJBv (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 7 Apr 2022 05:01:51 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 226ED11DD18
        for <linux-media@vger.kernel.org>; Thu,  7 Apr 2022 01:59:51 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id f18so5607121edc.5
        for <linux-media@vger.kernel.org>; Thu, 07 Apr 2022 01:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mLaoaPEpHffRvRTEifG5GvlOmzNyIxhDlxnSe+A6QV4=;
        b=KQk/koXUWDrAcboJIVgBLjpc0QYpwsZ3DIM0o9klQbRZJsaCO34oSRRIrMfgKpDF2S
         ZWlmRIjETP+JDut3v3QRzL8jT9+95eE0DSNyl9zuhuEg+sll8Kxs9lYCDYtdCa6el3rG
         s1ixTXOTAUz1BuJTIjnhQmP0Rx/9kp3PkPyv5fltrv3I8RRz3KJjgWGO2gc0fMdXX/0k
         sQecUP+jtN5lgcsURh88wjQmR2OH+MxbMnFH/8BoORqJ52TeAOkUeYIQsdh+yDPl2GkZ
         Ap2EmIMb6bVMJU5e8hd5z42cKS7/4faWcDaSH3sLsSlUJn/DoACF7GrKHj44pgRXUFa3
         lHFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mLaoaPEpHffRvRTEifG5GvlOmzNyIxhDlxnSe+A6QV4=;
        b=n5EZI3/I0mkH7XydD6jcl0nm+PzSTuJJ2jBfISn9Gs30ZSp7MaQDlmmwrBKhrYq0lZ
         RZNXGhD7B8iAe43CCCiERrdDM5f+rzyqz0D1aywJGNv9q09RaELZmuHZ6E65G66GWR5I
         t4g4ucxjFN+xcGTJi4bd7CxZ/woN/dnyhWVzKT6nkoUZdV7gFwRY8PRYpazEKeKZUYWn
         6jbPtENiETbIgChmhHHH8PqMZiXibIko85AKzgjzgvSo75RSnIF6umgotVIQJr4MPHvv
         rpdB/Ud7djl+eP9X9nwsB/8iGJpJS8UXQnYOzw1oFT4eIRKKIu32trUfqn7eKvtBeWI7
         ZHnQ==
X-Gm-Message-State: AOAM533CmZGRWJ/CuQVZ/MRvozto0WW7viNKEm+13ZbVSUnRWXtTLbsk
        tRP+T9DMxQhtO7Bqef1SM/6F8NjT9DA=
X-Google-Smtp-Source: ABdhPJzeETI+aibm16Fz7XHOsM+emhYvd4jn7+9bFUhsY3UvzT3cfJuShTcwU9S3v1mIXnpgHhIOGA==
X-Received: by 2002:aa7:d287:0:b0:41d:79:73ca with SMTP id w7-20020aa7d287000000b0041d007973camr3673930edq.142.1649321989621;
        Thu, 07 Apr 2022 01:59:49 -0700 (PDT)
Received: from able.fritz.box (p57b0b9e1.dip0.t-ipconnect.de. [87.176.185.225])
        by smtp.gmail.com with ESMTPSA id h26-20020a170906111a00b006e778bd4fc8sm5186563eja.38.2022.04.07.01.59.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Apr 2022 01:59:48 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     daniel.vetter@ffwll.ch, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        intel-gfx@lists.freedesktop.org
Subject: DMA-resv usage
Date:   Thu,  7 Apr 2022 10:59:31 +0200
Message-Id: <20220407085946.744568-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Daniel,

only patch #2 had some significant changes. The rest ist pretty much the
same except for the dropped exynos change and the added cleanup for the
seqlock.

Thanks,
Christian.


