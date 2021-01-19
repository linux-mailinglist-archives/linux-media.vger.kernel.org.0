Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E555E2FB8B6
	for <lists+linux-media@lfdr.de>; Tue, 19 Jan 2021 15:33:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394478AbhASNlF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Jan 2021 08:41:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392617AbhASMRc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Jan 2021 07:17:32 -0500
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC146C0613CF
        for <linux-media@vger.kernel.org>; Tue, 19 Jan 2021 04:16:50 -0800 (PST)
Received: by mail-ej1-x644.google.com with SMTP id w1so28138589ejf.11
        for <linux-media@vger.kernel.org>; Tue, 19 Jan 2021 04:16:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WmKZ1MO1cX5zg3/v5PkyOvJvBq0WKc/gh9CZTFuOugE=;
        b=hZzooO9PsSn1Aw+KSBh0wb8S8fs60fHhKRHYUVDASQ8wmxJn8781mCzNdP4NULkxfC
         cQNYecvaSdxpiacDL//Ujz6Fkwp9sU+uyA/N6YmNaOlxEJoU5DBqFY1jWXJFriLl0cCa
         PARo/eEdCNzMJu5I5etYx3CyC43lmmdHw6Lw60w9TOKAdmXJyXct6EUHcr2V5vBC365B
         6grF17TwK5G8yPvf7jEkP+cG/ytoWSad49S2r7w4KlUIklgzu8VMr2b9AwHSMFm7s/D/
         wKMneXCQ9LIHOx74/kYsQYdkKLt1GUALwKtUJV2eP65tO7qxAaBjIx/4kpS6dZQEhZNS
         IX+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WmKZ1MO1cX5zg3/v5PkyOvJvBq0WKc/gh9CZTFuOugE=;
        b=IdjK+vUP66cCdlbYdde9LML7RfWAqTNtqeqlb4nqirnk3GtRVYi3NYTNc/BiJtPMT9
         A2XhbJ7pmWpnu1w6Opb/S1/tB1lzN7Mt9oEYsig2qXQYD/SE0wvhkGAokpvF4DmiKE2V
         Vd/GxVBK25e6N8rtq8Mgtd9B2cGevEukbQT4/W7NiMDb3MrhYVFyBkqIOxJw5WB6UOzp
         Nx5fkePkN5kC2KIdwxUFl3bDkkFp2pApjaQjsCA4gQfhRxMqJrwsDn3SVoORmY/GTuhA
         Ky1LJ7/wO78m9Pf6f1JrSfm0SQuj3nHY+shIxHpndOVripBzlF4rOKaD3KT6iGyIBE4z
         ZmBw==
X-Gm-Message-State: AOAM533vuF0zhUAKEVSVhTctV6XMHxlsmdi2Cq9cXWIM7KsvJTht5Fik
        Lg9kjo4XFRyla9szcOA2DFBjaVEg+FAKo8/f
X-Google-Smtp-Source: ABdhPJx2wFjuRdWe0WtjmTN0GBT3Q1NJklASkcSxTYydv9xWzId0/aVfW5d1qrA0qMdjqawpTS4p4A==
X-Received: by 2002:a17:906:70d4:: with SMTP id g20mr2895018ejk.361.1611058609381;
        Tue, 19 Jan 2021 04:16:49 -0800 (PST)
Received: from localhost.localdomain (hst-221-116.medicom.bg. [84.238.221.116])
        by smtp.gmail.com with ESMTPSA id hb19sm180819ejc.16.2021.01.19.04.16.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Jan 2021 04:16:48 -0800 (PST)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v3 0/2] AUD encoder control
Date:   Tue, 19 Jan 2021 14:16:23 +0200
Message-Id: <20210119121625.2397824-1-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

The patchset adds new AUD encoder v4l2 control and the relevant
support in Venus driver. The previous v2 was part of [1] series
but now it is detached.

Changes since v2:
 * rebased on top of media_tree master branch.

regards,
Stan

[1] https://patchwork.linuxtv.org/project/linux-media/list/?series=4083

Stanimir Varbanov (2):
  media: v4l2-ctrls: Add control for AUD generation
  venus: venc: Add support for AUD NALU control

 .../userspace-api/media/v4l/ext-ctrls-codec.rst    |  5 +++++
 drivers/media/platform/qcom/venus/core.h           |  1 +
 drivers/media/platform/qcom/venus/venc.c           | 14 ++++++++++++++
 drivers/media/platform/qcom/venus/venc_ctrls.c     |  8 +++++++-
 drivers/media/v4l2-core/v4l2-ctrls.c               |  2 ++
 include/uapi/linux/v4l2-controls.h                 |  1 +
 6 files changed, 30 insertions(+), 1 deletion(-)

-- 
2.25.1

