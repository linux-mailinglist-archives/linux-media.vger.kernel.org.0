Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B14BC40D88F
	for <lists+linux-media@lfdr.de>; Thu, 16 Sep 2021 13:30:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238066AbhIPLcK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Sep 2021 07:32:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238006AbhIPLcH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Sep 2021 07:32:07 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 655BFC061767
        for <linux-media@vger.kernel.org>; Thu, 16 Sep 2021 04:30:47 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id b21-20020a1c8015000000b003049690d882so7100450wmd.5
        for <linux-media@vger.kernel.org>; Thu, 16 Sep 2021 04:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JGNtBFFeXnnCnrSDFPgub+2yBqbDjJC9rYoYFIcuhHM=;
        b=Nbnk97eM9wgjZbjEhozZeeQ9jLrrJIWXM7tnp0QyAHiHlNcE15tulovNH3mLKOD5DV
         WRB2X4L8Xh/u43oLPinbPqyyj++YXI2kGeeacr/bSrTRnXuIxPDUFeOAQn6qmjcP9joI
         baXPgxcfHW/QDL/pKgpoN6tQlftrj0iJVKp1zDJchSyfgGl5TqZvRtDWV+JQpiMqksIV
         KRfLhRloMsC0oWv1wLMdTiaGfBh3LrAd5pEpqK0rOmRtolnRF7iAE7aVv5TI+tl7wxeJ
         2w7qw4w2MLo0YXVyYNLePDepcgc2cdTiWyMISFL5s57Xfn0xdwXgOPK0vmJL5CGd/tkV
         yQxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JGNtBFFeXnnCnrSDFPgub+2yBqbDjJC9rYoYFIcuhHM=;
        b=NcaQjigvJBjXtugl2sz3bqQQrE3hP+8acO59mTjGvx7rzN2k/KwoxaxKiBWp+BCGEw
         l+eypQoODr2e/f0dNaUlfE0EGgfI5KdqgiqpZkzug8jIgbADg/gDFyMF2ohn8FBRliN5
         CPuuBWStVEl+PBBkPrP7Y0Z10hCidYslvwYZWI3loAeccwbCXmG4/GG5xSjOC0+d/t5P
         O1cXsfOxQWUPqxdfGSNJDAYfiPPVj0Xp6M9GchUAsxk8fmj9eh2CVdIznuw7ey3GAprJ
         fYg++UFs60p1cZ/hePb6bxzlpqZ0tYjqbmsb1bBnk9jMmJLrXa813wxDWsrigjuHZygF
         7Bxw==
X-Gm-Message-State: AOAM530v6H3edWZaY21+PT5WE7UOLL29RN/aX6Qo3fI4CKbUOz0lLyQ4
        wYjvio8CATRon+CkIUTj8m4=
X-Google-Smtp-Source: ABdhPJxUy+sVzLEtRLYNKYyci9xprjccER7X07W9mkIGelPR0RGcNhyoM0Z62f/RuRQPUv8k4cAbsg==
X-Received: by 2002:a1c:4c14:: with SMTP id z20mr9528904wmf.82.1631791846090;
        Thu, 16 Sep 2021 04:30:46 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id c17sm3803674wrn.54.2021.09.16.04.30.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Sep 2021 04:30:45 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc:     daniel@ffwll.ch, tvrtko.ursulin@linux.intel.com
Subject: Deploying new iterator interface for dma-buf
Date:   Thu, 16 Sep 2021 13:30:16 +0200
Message-Id: <20210916113042.3631-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Next round for that one here, maybe the CI systems are now more
gracefully with me :)

I'm pretty sure that a couple of those dma_resv_for_each_fence_unlocked
should actually be replaced with lock+dma_resv_for_each_fence, but that
needs more auditing.

Please review and comment.

Thanks,
Christian.


