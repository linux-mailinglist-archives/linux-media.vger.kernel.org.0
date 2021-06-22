Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53DAF3B02F7
	for <lists+linux-media@lfdr.de>; Tue, 22 Jun 2021 13:40:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230304AbhFVLmk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Jun 2021 07:42:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230054AbhFVLmg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Jun 2021 07:42:36 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01F6DC06175F
        for <linux-media@vger.kernel.org>; Tue, 22 Jun 2021 04:40:19 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id j2so12709936wrs.12
        for <linux-media@vger.kernel.org>; Tue, 22 Jun 2021 04:40:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=C0aq1qh95ctgvcUXr4Bj8aynIoN78yoRJfafxVAPBBU=;
        b=sSdCAWEffmE2e0tZ1H56DIvvSWMFIf4tz5NUmbpwNG2UIzQxEcFTu1pPPbwC6+NL1o
         Wxgvk7oqhtjVWq1OULccLcBvDnl5whUaH39P9rcKdMxMb5VefYMzs48kn/s/BdgTAwPT
         lSrCurRDP2pXIMH5EpSP30Gn2Ygc6F87OdYinkkTr1Ko7ggYxCqhisFmcc071McN2e1n
         49g4vJmcZLpoB5DqnL/O/9UTG4Ane6g3nJkdifoKZ9OtojbrVMGBNCM+Ht3Q+dunMuQa
         NN69jcUBT4WMpDkrYg8jHhBZrAOlCljs2+i040+QsQCX+mvzbdVIPbJEiQIEzaoVCL1S
         Ab9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=C0aq1qh95ctgvcUXr4Bj8aynIoN78yoRJfafxVAPBBU=;
        b=PgkXuETPhM73oGt31R30L28jRQIwdRlKf8uMb7kEd31l+Z9msi+PKYtI0ER8vJZXs6
         KYibXmBymkaNfyVvJ2VuijfQoKmS1j8MDBqY8iy/hgUvHk9vppMl+o0RMgTroqON5jjo
         hm5w3yxtJnivgv4D9bWAmjvLj84viOhH4+R+Kr4aVWUXeIiqU4vGOjcUFUbsUNTNzRpj
         KAMff+w/r1mgCWOoyL+ocMtSalBeZ8GXci468ciNblo20XDslFeIcxVbrFPX6FVJfFAx
         2hVUZn6ezVC+j2drH9lxe+iLryv2ufHkYXN6agoder2/dSIIIFM7UUF+F0IyaBuICEqt
         azag==
X-Gm-Message-State: AOAM532IT04GDzK3CHGL+hH6YvsWmiQlzAEDNP5qbI2Y8vxsihhwpoTn
        swk61DCPC7WUO6hwKpDRP4KN5Mpc0O+tITjY
X-Google-Smtp-Source: ABdhPJyGeTIibtfHXRV8vN4DEzUqDTtYnjXeuJDJ4TlewMHEmSr/fbhF3gtYAwtI+iCG8fbk1nvwSQ==
X-Received: by 2002:adf:f40d:: with SMTP id g13mr4273800wro.413.1624362018351;
        Tue, 22 Jun 2021 04:40:18 -0700 (PDT)
Received: from localhost.localdomain (hst-221-32.medicom.bg. [84.238.221.32])
        by smtp.gmail.com with ESMTPSA id k2sm20690929wrw.93.2021.06.22.04.40.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jun 2021 04:40:17 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        nicolas.dufresne@collabora.com,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v5 0/3] Intra-refresh period control
Date:   Tue, 22 Jun 2021 14:39:55 +0300
Message-Id: <20210622113958.809173-1-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Changes since v4:
 * added new patch to document control zero value meaning (1/3)
 * updated document for intra-refresh period (2/3)

regards,
Stan

Stanimir Varbanov (3):
  docs: ext-ctrls-codec: Document cyclic intra-refresh zero control
    value
  media: v4l2-ctrls: Add intra-refresh period control
  venus: venc: Add support for intra-refresh period

 .../media/v4l/ext-ctrls-codec.rst             | 19 +++++++++++++-
 drivers/media/platform/qcom/venus/core.h      |  1 +
 drivers/media/platform/qcom/venus/venc.c      | 26 +++++++++++++++++++
 .../media/platform/qcom/venus/venc_ctrls.c    | 14 +++++-----
 drivers/media/v4l2-core/v4l2-ctrls-defs.c     |  2 ++
 include/uapi/linux/v4l2-controls.h            |  1 +
 6 files changed, 55 insertions(+), 8 deletions(-)

-- 
2.25.1

