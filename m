Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 068005A80C1
	for <lists+linux-media@lfdr.de>; Wed, 31 Aug 2022 16:58:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231544AbiHaO6P (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 31 Aug 2022 10:58:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231550AbiHaO5w (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 31 Aug 2022 10:57:52 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AF5FD87E8
        for <linux-media@vger.kernel.org>; Wed, 31 Aug 2022 07:57:25 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id q7so20316016lfu.5
        for <linux-media@vger.kernel.org>; Wed, 31 Aug 2022 07:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=qtec.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=Fthr0rGXzEZ6KN8ks8MfbUMT6g6zUjjR1wbAbr8PHBI=;
        b=an3Z1WcbAR2QxtBCCKa+inA7KhvsJo8/6x3DxLpEspRb+0aIYo5jXDGGw6Y6yONQYG
         W4ugYH9VuIrSTyjV40S80tdW5iGdk77Ss04wkgNZ+N5LPO6it7CMEokLj3EsWtX4NlWO
         oYPlJXYrZLnMHiBffstfiiLgIF08bc1DamjnHWiK1s4eF5SXE7cP9Amxjrx+rOdDcGvR
         KmPx730wowjOIE6RSecTITgOZiQiQLwDV2KfDQ0rgKYmdF67xGGG2Dg3hAbUoMXtAV8h
         xNJPsZyqJTz4GDxEECHFy757VElHpvyXmkxnzIHhKr6tLUh/HBmzFGieppceCiVkcStG
         mSDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=Fthr0rGXzEZ6KN8ks8MfbUMT6g6zUjjR1wbAbr8PHBI=;
        b=sJ0OSGjsqvMCn0wBXA2aOXKUSwnrjMcCw1rjF259lj39fdvXXCWutAjmouWTtGmFJL
         eEqlqdZCegmfeJjSjfR5jGcFnLTTyIcayXy6PDQrQlgJpi4uq12Ry6xpat6A7dOo/78N
         crafV18wlq7moC8DW0M7hSGaFa9DEw/qZg2B3zsr2Av2kbOH2UyaVRcVmMNaocMsL+wp
         oMimqVnALcmOekUtwPkwX3cbMLOODuHNMhvky68ZDBbS4xIw6OjLykhkwQTtxk3T30iq
         bs6UwkomRNW8O7WdhMP6M362GKVrk418QnIN/FNsQK9KsqmSqOE8zggTkJ87RMRk/gl2
         JhHg==
X-Gm-Message-State: ACgBeo16tejCX6+my28lC3dilmUs3m9WdZXpl3P74QBgEpVsIcRK5RP/
        Am5AFdUhi/4zPHvonLDCDqS2K9eZ73Se6CAN
X-Google-Smtp-Source: AA6agR7Ny1pw22oaOP5H84xDsVfmeupGPq2KM2CwEXcSAm79MtA2I48njN584exHi39dwbk6E5OFeg==
X-Received: by 2002:a19:9149:0:b0:494:743d:d6b2 with SMTP id y9-20020a199149000000b00494743dd6b2mr4029808lfj.636.1661957842267;
        Wed, 31 Aug 2022 07:57:22 -0700 (PDT)
Received: from dlp-nixos.qtec.com (cpe.ge-3-0-8-100.ryvnqe10.dk.customer.tdc.net. [80.197.57.18])
        by smtp.gmail.com with ESMTPSA id o8-20020ac24e88000000b0048a921664e8sm1202108lfr.37.2022.08.31.07.57.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Aug 2022 07:57:21 -0700 (PDT)
From:   Daniel Lundberg Pedersen <dlp@qtec.com>
To:     mchehab@kernel.org
Cc:     linux-media@vger.kernel.org,
        Daniel Lundberg Pedersen <dlp@qtec.com>
Subject: [PATCH] media: docs: libv4l-introduction.rst: Fix function signature and link
Date:   Wed, 31 Aug 2022 16:54:59 +0200
Message-Id: <20220831145459.234949-1-dlp@qtec.com>
X-Mailer: git-send-email 2.36.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

v4l2_mmap returns a void*, also link to mmap instead of munmap

Signed-off-by: Daniel Lundberg Pedersen <dlp@qtec.com>
---
 Documentation/userspace-api/media/v4l/libv4l-introduction.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/libv4l-introduction.rst b/Documentation/userspace-api/media/v4l/libv4l-introduction.rst
index 90215313b965..7c8bf160e1c6 100644
--- a/Documentation/userspace-api/media/v4l/libv4l-introduction.rst
+++ b/Documentation/userspace-api/media/v4l/libv4l-introduction.rst
@@ -136,9 +136,9 @@ V4L2 functions
 
    operates like the :c:func:`read()` function.
 
-.. c:function:: void v4l2_mmap(void *start, size_t length, int prot, int flags, int fd, int64_t offset);
+.. c:function:: void *v4l2_mmap(void *start, size_t length, int prot, int flags, int fd, int64_t offset);
 
-   operates like the :c:func:`munmap()` function.
+   operates like the :c:func:`mmap()` function.
 
 .. c:function:: int v4l2_munmap(void *_start, size_t length);
 
-- 
2.36.2

