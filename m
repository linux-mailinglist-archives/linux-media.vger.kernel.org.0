Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25E7B46BB1B
	for <lists+linux-media@lfdr.de>; Tue,  7 Dec 2021 13:34:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236364AbhLGMhr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Dec 2021 07:37:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230264AbhLGMhq (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Dec 2021 07:37:46 -0500
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C731C061574
        for <linux-media@vger.kernel.org>; Tue,  7 Dec 2021 04:34:16 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id a18so29203199wrn.6
        for <linux-media@vger.kernel.org>; Tue, 07 Dec 2021 04:34:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UsLymO2NJxokLiyNAuPhk/abHIkS5BcAyNq3oHabOw0=;
        b=L6i3ochUOdIIETzfMMhvl0xo+H8PmC13ybWiQDxyxHPOFGCNd+9x0hd1C0uXpix9WD
         0DNwXOLiHGYfiy9TZku7tlkw7W6o37V3Th8X7CJs/M1hLkk36/VJSGAYJTTh0yaRbFtD
         w61hkT14D2249rxzC224Nge9I3Ng8NXsUBF3eXEhr4ILcahaEdIYkmqU8auYhSh/d0bK
         PEMGFapUXGs8izpAeBsxU1cFTTR1p0DKXZ0IxE7pSrKJh1pUbMCUlyqW0xGImtOlZZuu
         Weup2zh9VXTlhiS4yJzPlF21UqN4wI9fV+vjZdkpR3jnMsvFEmTlmBxLa3IuD16qS60R
         kh0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UsLymO2NJxokLiyNAuPhk/abHIkS5BcAyNq3oHabOw0=;
        b=Co79U2Ehe0A50gW8RipbZtP2d3JcRwL/TI/I1YV9Dbp7+3Bbc1ZUYhV5qJCI7efZ9S
         yk0IkY50Oyeio44k0oNcFJIfe5Zw93vuelesw3YkTqlwv8vZ/3g8x/M5d3EjRbbQMlpL
         aCDATj/qnBSXExp2fhM5AkAAA5Jesgt9PMeRY2R5ise4/IyDBOTKqKqsw/75xS/SsZU9
         Ex91s41eBalqxgDw7eLXZV+oLmx76yu9GdiFmC/o+DhTVHBQEEcW2WCTFdOtjw3mM6LH
         nM6bL5/7LYciz5bns8q6w8cA6oXVCwnLOGlxvoyHUP5e6oc6bkiK3vnFpqqzBF/IK31P
         Bg0A==
X-Gm-Message-State: AOAM531VCSDd8kGkUiXoRmbqf32fz9Xfyj+I+eREJQpTLHwMeexkb7Rm
        w3hHDnL1MD0xfH+/zXdCwd8=
X-Google-Smtp-Source: ABdhPJwXJf/rZIxlu0oRQ74XzCWMNqr/EEFzXvSGNCj6TPD/+9C+4p2bj/r7c/TlKRh50YHkBhdduw==
X-Received: by 2002:a5d:6508:: with SMTP id x8mr49147397wru.388.1638880455017;
        Tue, 07 Dec 2021 04:34:15 -0800 (PST)
Received: from abel.fritz.box (p57b0bff8.dip0.t-ipconnect.de. [87.176.191.248])
        by smtp.gmail.com with ESMTPSA id f19sm2802203wmq.34.2021.12.07.04.34.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Dec 2021 04:34:14 -0800 (PST)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: completely rework the dma_resv semantic
Date:   Tue,  7 Dec 2021 13:33:47 +0100
Message-Id: <20211207123411.167006-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Daniel,

just a gentle ping that you wanted to take a look at this.

Not much changed compared to the last version, only a minor bugfix in
the dma_resv_get_singleton error handling.

Regards,
Christian.


