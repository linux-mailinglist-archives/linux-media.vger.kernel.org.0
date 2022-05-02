Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DB2E1517483
	for <lists+linux-media@lfdr.de>; Mon,  2 May 2022 18:37:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1386339AbiEBQlS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 May 2022 12:41:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1381826AbiEBQlO (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 2 May 2022 12:41:14 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2EFFAE6A
        for <linux-media@vger.kernel.org>; Mon,  2 May 2022 09:37:28 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id i5so20218007wrc.13
        for <linux-media@vger.kernel.org>; Mon, 02 May 2022 09:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=COh3IJfwy846oumlMkgPJInjAr/nsMBwOyb23bgz0lI=;
        b=XqfYsPd37YQ0wPyDb2tewxVQmfVGsSpl3TJ3jxn7XMS3031B4AvpkhldJiATqEFuOl
         TiL/UASlUflsQVKkaZ5JcEOycN2iZILkWbzJvds8Bvoo6FnEIvAcoF8wK5qTKHUP7ohW
         HPmYbqxBiCr754RRQT1XCk2+ErHpzTipBUeqBphruGIAdx8IEAqz0RpaRec2gc9rpQ1c
         rHuFgf0Fiacjgqqq2nVDX4y5RIbToTZmnGdTA8pXgksyy7MiAjFRsSICfPpETHXf86yQ
         RlBzQnjGQaGM0HjW6eTtp+S6FSNDXtGTo3ZdmXXFRJWciJ9eWPINuCvyFrx814MrpC48
         3YTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=COh3IJfwy846oumlMkgPJInjAr/nsMBwOyb23bgz0lI=;
        b=FLl2GaH80M9Fa5IgG4sdam4NanbaO+QTcTuc4+ZrYoWF94MLRQhoEg2933OumVPIVt
         kXrZM7LMu9iypxBDIb14/68Xp83fxfcHcpWCsSBqABw289EoqLNn54GSOeYeJUduVBrf
         lD3snN5Quz2q1mlvzdUBqnG8WMJrc+aGcb4vlmsWx4t5RND+D/UMv4uLL1xnHWr7uxZJ
         +L65eLIaOl9q1VJCcuNaJrBgnlQ2iuMbA3sA3Y35KUQUVYdbEnJTPtbjq/i+azeu/cv/
         32TuBMfNU4OGs5+LerLUyEDofI98wew99AazGXqFpxJI/yns9n/ozEVZ/71en/CMp4/X
         jfZQ==
X-Gm-Message-State: AOAM5323cB+9ArLtiLOOtCLg7L1mEaTUSR9wL/rC2h9KfGlz2cEw4TVC
        fGDSAGL0ZLyXz1urL/+szAE=
X-Google-Smtp-Source: ABdhPJy03s4PE7OwMq1frxy6huyo77/V1s5NOyyLjSguDd34niphgTgma7qdmcKzn+dduypfAbButA==
X-Received: by 2002:a5d:47c5:0:b0:20c:5a48:7162 with SMTP id o5-20020a5d47c5000000b0020c5a487162mr7162226wrc.32.1651509447326;
        Mon, 02 May 2022 09:37:27 -0700 (PDT)
Received: from able.fritz.box (p57b0b9e1.dip0.t-ipconnect.de. [87.176.185.225])
        by smtp.gmail.com with ESMTPSA id p14-20020adfaa0e000000b0020c5253d8f6sm7294694wrd.66.2022.05.02.09.37.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 May 2022 09:37:26 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     daniel@ffwll.ch, jason@jlekstrand.net, daniels@collabora.com,
        skhawaja@google.com, maad.aldabagh@amd.com, sergemetral@google.com,
        sumit.semwal@linaro.org, gustavo@padovan.org,
        Felix.Kuehling@amd.com, alexander.deucher@amd.com,
        tzimmermann@suse.de, tvrtko.ursulin@linux.intel.com,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org
Subject: Tackling the indefinite/user DMA fence problem
Date:   Mon,  2 May 2022 18:37:07 +0200
Message-Id: <20220502163722.3957-1-christian.koenig@amd.com>
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

Hello everyone,

it's a well known problem that the DMA-buf subsystem mixed synchronization and memory management requirements into the same dma_fence and dma_resv objects. Because of this dma_fence objects need to guarantee that they complete within a finite amount of time or otherwise the system can easily deadlock.

One of the few good things about this problem is that it is really good understood by now.

Daniel and others came up with some documentation: https://dri.freedesktop.org/docs/drm/driver-api/dma-buf.html?highlight=dma_buf#indefinite-dma-fences

And Jason did an excellent presentation about that problem on last years LPC: https://lpc.events/event/11/contributions/1115/

Based on that we had been able to reject new implementations of infinite/user DMA fences and mitigate the effect of the few existing ones.

The still remaining down side is that we don't have a way of using user fences as dependency in both the explicit (sync_file, drm_syncobj) as well as the implicit (dma_resv) synchronization objects, resulting in numerous problems and limitations for things like HMM, user queues etc....

This patch set here now tries to tackle this problem by untangling the synchronization from the memory management. What it does *not* try to do is to fix the existing kernel fences, because I think we now can all agree on that this isn't really possible.

To archive this goal what I do in this patch set is to add some parallel infrastructure to cleanly separate normal kernel dma_fence objects from indefinite/user fences:

1. It introduce a DMA_FENCE_FLAG_USER define (after renaming some existing driver defines). To note that a certain dma_fence is an user fence and *must* be ignore by memory management and never used as dependency for normal none user dma_fence objects.

2. The dma_fence_array and dma_fence_chain containers are modified so that they are marked as user fences whenever any of their contained fences are an user fence.

3. The dma_resv object gets a new DMA_RESV_USAGE_USER flag which must be used with indefinite/user fences and separates those into it's own synchronization domain.

4. The existing dma_buf_poll_add_cb() function is modified so that indefinite/user fences are included in the polling.

5. The sync_file synchronization object is modified so that we essentially have two fence streams instead of just one.

6. The drm_syncobj is modified in a similar way. User fences are just ignored unless the driver explicitly states support to wait for them.

7. The DRM subsystem gains a new DRIVER_USER_FENCE flag which drivers can use to indicate the need for user fences. If user fences are used the atomic mode setting starts to support user fences as IN/OUT fences.

8. Lockdep is used at various critical locations to ensure that nobody ever tries to mix user fences with non user fences.

The general approach is to just ignore user fences unless a driver stated explicitely support for them.

On top of all of this I've hacked amdgpu so that we add the resulting CS fence only as kernel dependency to the dma_resv object and an additional wrapped up with a dma_fence_array and a stub user fence.

The result is that the newly added atomic modeset functions now correctly wait for the user fence to complete before doing the flip. And dependent CS don't pipeline any more, but rather block on the CPU before submitting work.

After tons of debugging and testing everything now seems to not go up in flames immediately and even lockdep is happy with the annotations.

I'm perfectly aware that this is probably by far the most controversial patch set I've ever created and I really wish we wouldn't need it. But we certainly have the requirement for this and I don't see much other chance to get that working in an UAPI compatible way.

Thoughts/comments?

Regards,
Christian.


