Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0FEC2ECE75
	for <lists+linux-media@lfdr.de>; Thu,  7 Jan 2021 12:12:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726521AbhAGLM2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 Jan 2021 06:12:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726415AbhAGLM2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 7 Jan 2021 06:12:28 -0500
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECC1AC0612F4
        for <linux-media@vger.kernel.org>; Thu,  7 Jan 2021 03:11:47 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id c124so4808266wma.5
        for <linux-media@vger.kernel.org>; Thu, 07 Jan 2021 03:11:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id;
        bh=v7NZAW6NnwGW1rEInNMh2zUIlSkZ64i1tH49UX/Jk6o=;
        b=Gf1opnx13arDvo/DneitmscQhMmjeIXJPxS1jPozGVh+2I3NrMDhPjZ+DAHvf/ErH6
         QkTs9oVn4V0Jxlk4zBnEsRK+v4nnTXdhDnuTbAQbXtCfGZM5PlOShFiuGrGUeN1CGKkg
         IdtctoFJanP+R0GrkNjCj41NtH7vbVAmYZe/6H/1F3fETmEtxVQCRvRbtkszfZ3RdCfp
         25cntM0A06SbTVLd9nne5kabAH40TqXNgJHwNy1LDaoP1qORr2VX15FSrgXwOQlsSUZ7
         PCD+bhlj+pVp3YRS1Fy8VOYMGsRNUdIrzZbWRt6WbLrct/WvyvRWi1AuCWRc1ZNXcxi/
         7KoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=v7NZAW6NnwGW1rEInNMh2zUIlSkZ64i1tH49UX/Jk6o=;
        b=KubW63ciHEk06jGs9Wrw9bsXfW4r/sopsrz2vh1cKy+xzneqcaZNUkCvMdDVc5ZpwC
         iqNEIMbfhmJkkmSaUaVQCAQwgzE6iZ9PCqqZUIJYmgS/Yovs8Fg21vACtb3tHFk0/5YN
         YUML3l12KzPA7x83mQLuH+kpHe9axx0cvs7EEZJGtEZ3LBZP48EBHL6dTfiPgeBXz/fs
         F9OvSNHxNGsnQgTmojmRBsiCfr7fyeLyjP1vKXnZTEG/mD1LI5aPW//MMYMz3zks1oLG
         1t7d/Fhbc1EbsTuaFYgKf1UzbPL/+JW8YDzXRKfdC0VHu/BCuXaiwQqogONEBt7+67wJ
         iymw==
X-Gm-Message-State: AOAM530LbvdN5Q0f2ro5WHbtxLihdirr3T0kCwlb6TpTxfG+Xc7kpyx7
        pGRIocLvWzjhostqZ5Zs1V1Gia5uQ5AgQd6U
X-Google-Smtp-Source: ABdhPJwWZ72ZN+uTVd+3VgCRT3qgWIuvmeJ/wvvTMY7QhiMHAUsS8vdkK4ihVC0w2TljN9kSUqvcwA==
X-Received: by 2002:a1c:6055:: with SMTP id u82mr7742846wmb.61.1610017906582;
        Thu, 07 Jan 2021 03:11:46 -0800 (PST)
Received: from localhost.localdomain (hst-221-93.medicom.bg. [84.238.221.93])
        by smtp.gmail.com with ESMTPSA id n11sm8503608wra.9.2021.01.07.03.11.45
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jan 2021 03:11:46 -0800 (PST)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org
Subject: [GIT FIXES FOR v5.11] Venus fixes
Date:   Thu,  7 Jan 2021 13:11:33 +0200
Message-Id: <20210107111133.9708-1-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

Here is Venus fix for v5.11 related to platform .shutdown callback.

Please pull.

regards,
Stan 

The following changes since commit 896111dc4bcf887b835b3ef54f48b450d4692a1d:

  media: rc: ensure that uevent can be read directly after rc device register (2021-01-04 11:00:25 +0100)

are available in the Git repository at:

  git://linuxtv.org/svarbanov/media_tree.git tags/venus-fixes-v5.11

for you to fetch changes up to bd1a94b07d49d328fea8e276fb87b16f4b9c0842:

  venus: core: Fix platform driver shutdown (2021-01-07 12:24:22 +0200)

----------------------------------------------------------------
Venus fixes for v5.11

----------------------------------------------------------------
Stanimir Varbanov (1):
      venus: core: Fix platform driver shutdown

 drivers/media/platform/qcom/venus/core.c | 2 ++
 1 file changed, 2 insertions(+)
