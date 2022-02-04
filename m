Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E139F4A9761
	for <lists+linux-media@lfdr.de>; Fri,  4 Feb 2022 11:04:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358080AbiBDKEj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Feb 2022 05:04:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230429AbiBDKEj (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Feb 2022 05:04:39 -0500
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C471EC061714
        for <linux-media@vger.kernel.org>; Fri,  4 Feb 2022 02:04:38 -0800 (PST)
Received: by mail-ed1-x533.google.com with SMTP id b13so12151137edn.0
        for <linux-media@vger.kernel.org>; Fri, 04 Feb 2022 02:04:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RN0YEy0Xp/dnIRm1BZPhayCGRmkyCaUBn+FhNu63VS8=;
        b=V3B/dN4F6Ksb5c1CTTCatJyJYVWzcKGc04S77l4wnC6MdySHPtBvrMWjw45yXOi4w9
         g0Q/ftnt2D3ZHMHKqbPEHApl+8F5iGwrQy4uiNL4i9hfxb1Wp1EY+XJnbDR+H+IYFlGO
         SJwhkPXEdB+gVorR1oO3/+HloLYdztJx/UjZaaZonG+U+gmlvmz5hONBZ/o/X+qmUG1M
         Nt9ZYehwFmaE3FkEHfMHvtJ9FPnBWtzC7fK2NQ42w5MS3JRPJuLl8FB4FOu2/ppwCLZ9
         KePiJVpa+ZpB6pxFhJs3hI9OU4UxU5iBr92bSuS44c8RT7cPGpvIF43UxfkqkZeII+Rg
         Xifg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RN0YEy0Xp/dnIRm1BZPhayCGRmkyCaUBn+FhNu63VS8=;
        b=J9mxvhz1EJlGgD56/iwR+82MRMIUtwdyErUY8Jkh81Mp/CV8sYAAafVvsjThnn6TXG
         fbCKVykq1z5SdfiNciztMLyGsf9itVuSuyhUmOLu/Lwj9q0YZeLZ+WCyTrcEeStKeUca
         xpgPHYDIP78YXy2VPML30Yq8FNz9rBU86YFiTM2fGh9WQ4ElTrsCI16L4K/Ho8WZONOi
         NuMrFp9DosmGy04oMMlaivTaAkKytOOzBqMrvlxdCh7Xmra2WDGOoUYXHBHzhc9lz6ro
         grxBsD0PDdug7XVcH35SkhIZjJnIrmWICMLkDG+ylgIEd4c0THMov9RiAajGVECGpgkQ
         0Zkw==
X-Gm-Message-State: AOAM5305TY34PvsJTNoQFtHdpzgvA57r7owmOVKObnVSAhk6ddoyL59r
        ZkdE6XAPSNN2FTJ8+Au6TFQ=
X-Google-Smtp-Source: ABdhPJyL6Woi68nOxF05GloDFvRLvlG+3RLTwFTV0uHPKuFxsIGEiUocj+Z6Wf5HQ/GhLFOt/wQmEg==
X-Received: by 2002:a50:ef16:: with SMTP id m22mr2267171eds.340.1643969076911;
        Fri, 04 Feb 2022 02:04:36 -0800 (PST)
Received: from able.fritz.box (p57b0bff8.dip0.t-ipconnect.de. [87.176.191.248])
        by smtp.gmail.com with ESMTPSA id z10sm633943edl.54.2022.02.04.02.04.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Feb 2022 02:04:36 -0800 (PST)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     sumit.semwal@linaro.org, thomas.hellstrom@linux.intel.com,
        daniel.vetter@ffwll.ch, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Subject: Add warning for nesting dma_fence containers
Date:   Fri,  4 Feb 2022 11:04:23 +0100
Message-Id: <20220204100429.2049-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi everyone,

Since some operations can then lead to recursive handling nesting
dma_fence containers into each other is only allowed under some
restrictions.

dma_fence_array containers can be attached to dma_fence_chain
containers and dma_fence_chain containers by chaining them together.

In all other cases the individual fences should be extracted with
the appropriate iterators and added to the new containers
individually.

I've separated the i915 cleanup from this change since it is
generally a different functionality and the build bots complained
about some issues with those patches.

Most patches are already reviewd, but especially the first one still
needs an rb tag.

Please review and comment,
Christian.


