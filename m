Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BD37417E2DB
	for <lists+linux-media@lfdr.de>; Mon,  9 Mar 2020 15:57:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727132AbgCIO5C (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Mar 2020 10:57:02 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:41665 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727026AbgCIO5C (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Mar 2020 10:57:02 -0400
Received: by mail-lj1-f193.google.com with SMTP id o10so3532847ljc.8
        for <linux-media@vger.kernel.org>; Mon, 09 Mar 2020 07:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id;
        bh=FpSYc5KJVVlPFUGja9e2CUHC18Dk+Ws3S/t5Ta4drEM=;
        b=kBfNwz5/WW4PIaOaaT2gTiEjgUJB1Lj26HuEohUQcH1C4NC0wSPCwAiiPLhs5JX2fh
         sxhaQfqFTaANNlXC3L7AyyImSjNhFdyp7b/wi71Pp29koak2rCpoK7JEDEszOyazdafN
         Ywq04vUQVAMLL9Xx4eankRTmKw+p8HEKhrgZRogthYuimdKbvoHRsD1SKjtlR2mSDXkc
         pb9ycUIDhAUwP7z2yZO5Fqw34pX6XhKOnGNhq+cfXAXmCCjYjEWlWAWqYDKRfaeJsFMk
         3q91XZnD5GAPBkOAPK+mMw4WaFjnXZyDmTeQ9rHXrVwKNckM0BgnN1UUufLsuiBjy/rc
         Cnfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=FpSYc5KJVVlPFUGja9e2CUHC18Dk+Ws3S/t5Ta4drEM=;
        b=Ukj5rSABEKM32b6jwFQaYdKbSAc4VwzI+5dOWFp+/UzXzFqjBVGFo68OBKJmh3S3hB
         +yXdY97yeuSphVMxGJamivRpu5QDocyYOgo38iwIgEC/PwDOQlL/FgV85QPZ4V2qvcU9
         KQK21752ChkVgy3gNKwrAI5LRoW0T7agfF4UmUV2E+H06QpQpNBKTJQR6xMatZaF6r6O
         UmPLGwAgZIJ+WYqeZqzNfNYdnYfXv3hFcPfiVmbszuN2dzpP66/7oHXRuNN8TkVLdNRQ
         jFoE+hGLYXjs+4A/4HapvAf7HzOAp/TQHjj36FVleAP1sSZ2oZfl9EbWjvr+txE1m1+J
         uNKg==
X-Gm-Message-State: ANhLgQ34SpfAlHVaVH04Dm/hyhpOwgVePQSfO7ACe+gLPROQtk6ZPrQW
        YgYAKFH2g+Hu5UBPsnmOf25f/YjjjxA=
X-Google-Smtp-Source: ADFU+vv1HPPoOjveGMxo7Xzx/fi4TtV3CAzEW/W3vHdyvXsAHsj3HKqhcjjGnSUbreBe4lwamSt4kQ==
X-Received: by 2002:a2e:7e0a:: with SMTP id z10mr7734379ljc.42.1583765819190;
        Mon, 09 Mar 2020 07:56:59 -0700 (PDT)
Received: from localhost.localdomain ([94.155.124.210])
        by smtp.gmail.com with ESMTPSA id u2sm4107794lfu.3.2020.03.09.07.56.57
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2020 07:56:58 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL for v5.7] Venus updates - part2
Date:   Mon,  9 Mar 2020 16:56:38 +0200
Message-Id: <20200309145638.28136-1-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

Here are two more patches for v5.7.

 - a smatch fix over Venus updates part1.
 - add support for frame rate v4l control.

Please pull.

regards,
Stan

The following changes since commit 00c43088aa680989407b6afbda295f67b3f123f1:

  media: meson: vdec: add VP9 decoder support (2020-03-05 23:05:34 +0100)

are available in the Git repository at:

  git://linuxtv.org/svarbanov/media_tree.git tags/venus-for-v5.7-part2

for you to fetch changes up to 4ece82e92ab909dfd9e763e4f12cab8d9f83081b:

  venus: support frame rate control (2020-03-09 16:07:08 +0200)

----------------------------------------------------------------
Venus updates for v5.7 part2

----------------------------------------------------------------
Jeffrey Kardatzke (1):
      venus: support frame rate control

Stanimir Varbanov (1):
      venus: vdec: Fix smatch warning in start streaming

 drivers/media/platform/qcom/venus/core.h       | 1 +
 drivers/media/platform/qcom/venus/vdec.c       | 2 +-
 drivers/media/platform/qcom/venus/venc.c       | 4 +++-
 drivers/media/platform/qcom/venus/venc_ctrls.c | 8 +++++++-
 4 files changed, 12 insertions(+), 3 deletions(-)
