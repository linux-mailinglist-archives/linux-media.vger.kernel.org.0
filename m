Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E29445A531
	for <lists+linux-media@lfdr.de>; Tue, 23 Nov 2021 15:21:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237636AbhKWOY1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Nov 2021 09:24:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237651AbhKWOY0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Nov 2021 09:24:26 -0500
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E7F5C061714
        for <linux-media@vger.kernel.org>; Tue, 23 Nov 2021 06:21:18 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id o13so4380457wrs.12
        for <linux-media@vger.kernel.org>; Tue, 23 Nov 2021 06:21:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=L0WQbPMmu7q1niXukhiHRfwOhv7htBGMZaUFwRTW/pU=;
        b=E8AElN6+/bBVTPJB1wlzguxBOE6x6n5zrNRdHXJyNZHjIyGsuO3OLe0mqHRs57A4ag
         Gxm+UVD+N7+eEdkm4KMGQDOnsizFXwDSmUCwAMuJhl35KmUOiUlt89nZYwWqIv24f4fK
         gw9peW2/IQVheul8jqWHfHnu88Mz2kQtagB51z0aUC08V3+zhqli6xS18Anv//qBqp61
         fUmEdq6sDcP/ORG4jKSmRLGxXnwHqkiS9g0ApmyTQoHZ5b4kOebPVA3jfb8tae37FbcZ
         O9n1wH5rUrPaHhW3YJqf4yud61GFKVD0LU5iMX+P6ceS9fa6BfhgL7rmFUjhHjDrErBa
         axrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=L0WQbPMmu7q1niXukhiHRfwOhv7htBGMZaUFwRTW/pU=;
        b=bO8nFRHqZPbOVR0hFX6HEgKHJEcVo216ZMIENduBeCsq7aNZCxhwS9vMej3LvgRvOk
         G7WNR9d/LAlQLDFIUvA60csmheQS4wyerTMEDkeigvaKjFJ62/pVwBXYHkuaCmZeh5JY
         hldDUakZ9ddzwqPkkhVLkLwXy54174QV/Z23EqoLEPeu66N26mnrwTONRswadetA0lk4
         7PjrmZqr9RmwfuNQEIKJfKsopC+p4ZaHUj79i615BswzgD14obPQY3sQKd7x7ig0X5eS
         lWTe/e84gO4HVlz9nRO7sPONVGAo5q+T3NgRn8+gDHEJ5mVY1c8rD6xSCRJ9oJWUes3t
         +m5A==
X-Gm-Message-State: AOAM530vBWLQlExMokNE46ClftAjprTxKLSKa9sMsXX3+6US3upCS0Kq
        deA5ZZBg1pedwxbg2DTCKMY9zjnVzlQ=
X-Google-Smtp-Source: ABdhPJxMp1wlSMUNWPTuyd4QDJB4bZkg86F/2VpDGO6xW6jlSNTQmog4E4SSMIMlxZX8BompHjcOSQ==
X-Received: by 2002:a5d:6043:: with SMTP id j3mr7507583wrt.375.1637677276940;
        Tue, 23 Nov 2021 06:21:16 -0800 (PST)
Received: from abel.fritz.box (p57b0b77b.dip0.t-ipconnect.de. [87.176.183.123])
        by smtp.gmail.com with ESMTPSA id t8sm1645928wmq.32.2021.11.23.06.21.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Nov 2021 06:21:16 -0800 (PST)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     sumit.semwal@linaro.org, daniel@ffwll.ch
Cc:     linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org
Subject: completely rework the dma_resv semantic
Date:   Tue, 23 Nov 2021 15:20:45 +0100
Message-Id: <20211123142111.3885-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi guys,

as discussed before this set of patches completely rework the dma_resv semantic
and spreads the new handling over all the existing drivers and users.

First of all this drops the DAG approach because it requires that every single
driver implements those relatively complicated rules correctly and any
violation of that immediately leads to either corruption of freed memory or
even more severe security problems.

Instead we just keep all fences around all the time until they are signaled.
Only fences with the same context are assumed to be signaled in the correct
order since this is exercised elsewhere as well. Replacing fences is now only
supported for hardware mechanism like VM page table updates where the hardware
can guarantee that the resource can't be accessed any more.

Then the concept of a single exclusive fence and multiple shared fences is
dropped as well.

Instead the dma_resv object is now just a container for dma_fence objects where
each fence has associated usage flags. Those use flags describe how the
operation represented by the dma_fence object is using the resource protected
by the dma_resv object. This allows us to add multiple fences for each usage
type.

Additionally to the existing WRITE/READ usages this patch set also adds the new
KERNEL and OTHER usages. The KERNEL usages is used in cases where the kernel
needs to do some operation with the resource protected by the dma_resv object,
like copies or clears. Those are mandatory to wait for when dynamic memory
management is used.

The OTHER usage is for cases where we don't want that the operation represented
by the dma_fence object participate in any implicit sync but needs to be
respected by the kernel memory management. Examples for those are VM page table
updates and preemption fences.

While doing this the new implementation cleans up existing workarounds all over
the place, but especially amdgpu and TTM. Surprisingly I also found two use
cases for the KERNEL/OTHER usage in i915 and Nouveau, those might need more
thoughts.

In general the existing functionality should been preserved, the only downside
is that we now always need to reserve a slot before adding a fence. The newly
added call to the reservation function can probably use some more cleanup.

TODOs: Testing, testing, testing, doublechecking the newly added
kerneldoc for any typos.

Please review and/or comment,
Christian.


