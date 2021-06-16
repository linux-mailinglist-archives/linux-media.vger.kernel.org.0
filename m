Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E12C3A94EB
	for <lists+linux-media@lfdr.de>; Wed, 16 Jun 2021 10:27:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231460AbhFPI3H (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Jun 2021 04:29:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231335AbhFPI3H (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Jun 2021 04:29:07 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D7C5C061574
        for <linux-media@vger.kernel.org>; Wed, 16 Jun 2021 01:27:00 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id z12so1568744edc.1
        for <linux-media@vger.kernel.org>; Wed, 16 Jun 2021 01:27:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZD1oIEshyi5mEs2vX/ty3wdwPQu3S284MwRCDJHvwJg=;
        b=qCU6SCauZj7AZ5D7QDK8O0HF9eqJLgNurO4UAiW1PoDRoXD7jn7wlhiFaUpoQIZzOm
         uuwRJDaLTLXPixUmeTl7Vrl7mLOs+OyOkmKjYSNghyyMQV7jIXEdC9EB/kCfAVb4Hkuu
         KUXe4bDOVoWOImx0YOrkKiAYkZzVysiX0PPODpyMMdTW3XtHSgnke64nfVBjKv6yB+xJ
         aVARzLzjtKNHV5ooPwV8qwC3XbNAA3DALVyBi7bLoHDxQpQ/qcNbel23LtgfewdWRGhl
         7v3iVEDRQbS1TluR7J3xnouy5T34zwHUPhBzzYVTKJeG828Ix8KCxlEMEfBKinv2u22Y
         dNIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZD1oIEshyi5mEs2vX/ty3wdwPQu3S284MwRCDJHvwJg=;
        b=I3SSWl9gy+WiuJJMPDriSSHudBhzlM4vYqwlaKV/mZty2qK0VInZGOOvfrGDJDQnEt
         kjvUxyz//PvXTOMqtJ1WUJ/trydHSAvmQkW7dGkzkGxpK2AwutGgNmIzUhniC9qrwy61
         XC7D22eZHD92/jxYqugf+80yCmaJRG21TQHndJEnsOQv3WBDDj+HJ+QwEaBYiGKuG99g
         PATYo2Fnlhb2a9NJL1YKbjhjoWnJ9ZOLJVjQH8XJxNWa//ZmYUnafF0LEL47WqidTIVL
         3YkUvE/+/ZrtUWo56sRLuftwbFERAdQ8Iy4prH6gT5FdzXZx6k3OFqYBtxNyCfaShXcQ
         wm7g==
X-Gm-Message-State: AOAM532llkLaSSZKPftH7LHoTRdm9E4GbM/wioyxEekhKQuSrvz5pOMa
        cvl6rwzXZD+wqyGRUC48XOI=
X-Google-Smtp-Source: ABdhPJwLXRFQuy3NSBX9qUhhQQAJmrUQyjuv4s9gBktfSh/X/BaDuqPOco4TJbd8H1T+RoWKdlZGwA==
X-Received: by 2002:a05:6402:2317:: with SMTP id l23mr2737214eda.265.1623832019200;
        Wed, 16 Jun 2021 01:26:59 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:8b88:17a4:582b:121f])
        by smtp.gmail.com with ESMTPSA id v7sm1152639edx.38.2021.06.16.01.26.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jun 2021 01:26:58 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org,
        sumit.semwal@linaro.org
Subject: Fixing problems around shared fences and RCU in DMA-buf
Date:   Wed, 16 Jun 2021 10:26:48 +0200
Message-Id: <20210616082655.111001-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi everyone and especially Daniel,

this is the revised patch set to fix and rework dma_buf_poll(). The new code should avoid problems with RCU and also now correctly waits for all fences in the resv object.

The rest of the series is then the well known change to dma_resv_test_signaled(), nouveau and now new also msm.

Then last are two patches which drop the workarounds from amdgpu, but those can wait till the next cycle.

I think it would be rather good if the have at least to change to dma_buf_poll() pushed in this merge window and maybe even CC stable since this looks really broken to me.

Please review, test and/or comment.

Thanks,
Christian.


