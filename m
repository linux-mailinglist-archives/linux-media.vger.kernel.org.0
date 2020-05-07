Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB77D1C868F
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2020 12:24:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725857AbgEGKYC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 May 2020 06:24:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725809AbgEGKYC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 7 May 2020 06:24:02 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28C69C061A10
        for <linux-media@vger.kernel.org>; Thu,  7 May 2020 03:24:02 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id z1so2811896pfn.3
        for <linux-media@vger.kernel.org>; Thu, 07 May 2020 03:24:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=U3adop0qZHoN5+fe1H4HdGFUSAzpEKX4OuXet5VsNhk=;
        b=msVYVtXbC1rDLmlHB0A5OMuw6LsY6yof/OQbghdzmC8mQ+pR4tv1wSmxhZk/KvRE6d
         c2GPXGyyr1qqebFYtA8Q9gy95GufDlZuB0bUHy13z9lIMGTV1RCYE9kvrFNSLQZP99E9
         z190vOnTwXc6wcneboX0FzxIOCQ6KX/9YAl6U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=U3adop0qZHoN5+fe1H4HdGFUSAzpEKX4OuXet5VsNhk=;
        b=IIEQrqHnm1Nx/VzgmrMtVcDNsechbYwb2ioA3BGELM2/ZKvZyEkOsEb9PyuyITEu2G
         MzNkbXSVkaPXw6GfHe7XVQxQqhNuLaCHUWrZ8Wwpo0SCjGt3sv5EmGuw94pq0UDI2Iik
         BYSuj3l1gHlkfcx7iLJYpsdwmwadkjFGzUT5oW25YIxm21rNDBCCpVP9gzf86Vo7CZp5
         8dUh8q1eOR9BgOH/c99Klyp7PIr+O3o6smFt0oJ7kXCl3NYizsQQJQcaT/8VQvBBDFJu
         uOiSb2B11vfejn9gILG9YeyB1T4IsYj0IlR0iTP98aRRZJowXujOhvN153TNf0qbEXFf
         vCXg==
X-Gm-Message-State: AGi0PuaBtlGKD+O3uhLBODzVdj0yO4yl+/pRP9uXr/SCfjd1UloftptG
        FUOilspaaRk18tnUJA1fp7sf7rhb13k=
X-Google-Smtp-Source: APiQypIJANgSss8r4jrDFwpt2FRxJF0v5BBqD8mhWuxiK45XDvceGeJ0E8SQWciZ2KIF8EhjAyoH+Q==
X-Received: by 2002:a63:f54d:: with SMTP id e13mr11526261pgk.325.1588847041657;
        Thu, 07 May 2020 03:24:01 -0700 (PDT)
Received: from localhost ([2401:fa00:9:14:a92f:c47d:76a8:b09e])
        by smtp.gmail.com with ESMTPSA id m7sm4639156pfb.48.2020.05.07.03.23.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2020 03:24:01 -0700 (PDT)
From:   Eizan Miyamoto <eizan@chromium.org>
To:     LKML <linux-kernel@vger.kernel.org>
Cc:     Eizan Miyamoto <eizan@chromium.org>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Houlong Wei <houlong.wei@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        linux-mediatek@lists.infradead.org
Subject: [PATCH v3 0/5] MTK MDP driver cleanups to prep for futher work
Date:   Thu,  7 May 2020 20:23:40 +1000
Message-Id: <20200507102345.81849-1-eizan@chromium.org>
X-Mailer: git-send-email 2.26.2.526.g744177e7f7-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


It most notably converts an array of MDP components to a list instead,
but also removes some unused fields.

This series of patches does some cleanup in preparation for futher work
so that hardware video decode works on 4.19 and later kernels. We are
planning on adding a dummy driver for the relevant MDP components that
will be bound together using the component framework, which will enable
calls to set up IOMMUs and LARBs, and make calls into pm_runtime.

Note: these changes depend on 757570f11fa4b0ce5472a6583de6f06e996a8527
to apply cleanly.

Changes in v3:
- Removed extra Signed-off-by: tag from commit messages.
- Removed extra line break in mtk_mdp_core.c
- Update cover letter with dependent commit

Changes in v2:
- remove unnecessary error handling labels in favor of err_m2m_register
- remove unnecessary error handling labels in favor of err_m2m_register
- rebase onto linux-next/master to pick up
  757570f11fa4b0ce5472a6583de6f06e996a8527

Eizan Miyamoto (5):
  [media] mtk-mdp: remove mtk_mdp_comp.regs from mtk_mdp_comp.h
  [media] mtk-mdp: handle vb2_dma_contig_set_max_seg_size errors during
    probe
  [media] mtk-mdp: handle vpu_wdt_reg_handler() errors during probe
  [media] mtk-mdp: convert mtk_mdp_dev.comp array to list
  [media] mtk-mdp: Remove mtk_mdp_comp.id and supporting functionality

 drivers/media/platform/mtk-mdp/mtk_mdp_comp.c | 60 ++--------------
 drivers/media/platform/mtk-mdp/mtk_mdp_comp.h | 23 ++-----
 drivers/media/platform/mtk-mdp/mtk_mdp_core.c | 69 ++++++++++++-------
 drivers/media/platform/mtk-mdp/mtk_mdp_core.h | 10 ++-
 4 files changed, 63 insertions(+), 99 deletions(-)

-- 
2.26.2.526.g744177e7f7-goog

