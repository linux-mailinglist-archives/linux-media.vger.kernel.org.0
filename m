Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4F0E422515
	for <lists+linux-media@lfdr.de>; Tue,  5 Oct 2021 13:37:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233812AbhJELjh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Oct 2021 07:39:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230500AbhJELjh (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Oct 2021 07:39:37 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81374C061749
        for <linux-media@vger.kernel.org>; Tue,  5 Oct 2021 04:37:46 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id m22so31346084wrb.0
        for <linux-media@vger.kernel.org>; Tue, 05 Oct 2021 04:37:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=164W6w6LWLW8NebvBaOQLdQNgGQ7HT0mCWe77mt2uTA=;
        b=CVGpci/DUifH+cgn4zVZt0u6zvgxk8H2IkT1tiTjfOKlQiOCIbrDrSklxXM2z4uGwE
         NPqUwPXZFpzcRctflKI6m1aRUvSYBlcbC/PZgTtELEiGcpxWAg+4kU8w1ldMrIoNsJW0
         8KdAGK497O4rOkHHwC17PZ7l/kbI6ISm505CNzIYLDUMp9HoZWkfWeytfAAip6GovSxK
         9GWyebTKN9uN+9tyUeGC+ao/jx3lI8SHVHpt6fkEGLdf2F/+kJCXfZyhufV7wSHh49Gb
         aPmivEB/q1wGlJFItDX50C6gvlE0q82iL7o0UA2dmh+3rXFsZKNlEpzvfag1L/CxqCDp
         jMQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=164W6w6LWLW8NebvBaOQLdQNgGQ7HT0mCWe77mt2uTA=;
        b=LKb8rSQWHO0EQtrNRikyTj5s6Bqw6ltnzQK3pLmhj7z0JjgWYWPqwWpLRO/I3JVgsQ
         UY2em8fYRbera8GuzmOZgVuv0no1QZaNj570NIMT685t8vTIFPDmA1bOKdUs8PZ8t+uy
         q6J+eShcWLqWHlGz4PXPsE1Fkd1nvLP9Zulp/CBs885dJx26pY/2bGTVQ1ma5wUCaDzq
         RFNg0aiSp9/Pb0wO9Xx15aNH3CVYxNZ0HlLqXQnht7vfwNoZ0D748oIXsE6Jb4Qetyua
         Eb8hGNOOA8NHPN+N6e5LRcW9ZjS2SWUHLcXP/D696DvLUygwzkdowL99IrHoxPr5rM3p
         6jkw==
X-Gm-Message-State: AOAM5325cmuc9erjr3bH6tIif94GvtYzQ/jOcDA3Jy7H2UlhBv62NyMU
        Xi+2Boia3YVq7HgLe1LHee8=
X-Google-Smtp-Source: ABdhPJyhqXRR6L5iPjlJy84F/JJ9ouoYwQ3pgClwPtPCzqX3Ce9742XSqFnuYdjXcMF2edgJm2bXlA==
X-Received: by 2002:adf:a2c4:: with SMTP id t4mr21433926wra.296.1633433865218;
        Tue, 05 Oct 2021 04:37:45 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id c5sm1739912wml.9.2021.10.05.04.37.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Oct 2021 04:37:44 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc:     daniel@ffwll.ch, tvrtko.ursulin@linux.intel.com
Subject: Deploying new iterator interface for dma-buf
Date:   Tue,  5 Oct 2021 13:37:14 +0200
Message-Id: <20211005113742.1101-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi guys,

a few more bug fixes, looks like the more selftests I add the more odies I find.

Assuming the CI tests now pass I will start pushing patches I've already got an rb for to drm-misc-next.

Please review and/or comment,
Christian.


