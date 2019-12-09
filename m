Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A49DB11684D
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2019 09:39:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727249AbfLIIjJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Dec 2019 03:39:09 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:38942 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727244AbfLIIjJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Dec 2019 03:39:09 -0500
Received: by mail-lj1-f194.google.com with SMTP id e10so14590943ljj.6
        for <linux-media@vger.kernel.org>; Mon, 09 Dec 2019 00:39:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=N3RpZCRpKUtgoEtKAWxxbXAbpUsrQdnPIi7268knFtw=;
        b=dULvsJi+k8JTBXayTBi+s3SshIdVsHL29YXMyJjjgMwbPPXEyS8/YN0HcPA8jIJds2
         VSkpKhtaM6e5vO5CwrYNZjoPvfd37sSFsDvXmAqZR9HqQNRkBORQByFPWgULxD79Q+km
         +qCWIf+GuDYPlz8B+LwdsNUa0+3nydUVkBdVywCCi0GNte3iV+gdPwETx+4XDB1AZonl
         Gi6qZFmImHXrWbDr4jPOzBdwdtDLZtNdVWaCa9OBkpXH1wyu4ptcUAJ5SPr/PvLD0/jp
         OCxwZA5n6HL9rq7/TpX8n3c6ECcyOaUYknjBeuDIOoXLt4mBnxvn05VLVzVC8lCWXXRa
         QXVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=N3RpZCRpKUtgoEtKAWxxbXAbpUsrQdnPIi7268knFtw=;
        b=TzSNAuLVAEvUub9ufkFemOBEGRkxxuo/RgJdZBX1bITwRgYFlwSxhdLEjgIVT8PDGj
         XcPOOCCn5Lj995zSi8HFcvdmG5wZbylNfpQpqf490qOfCNbb1xLlHWMevxePvWLTxx2C
         p5jOjK96R2YCBUZC0oEivVL6pS+7gslasqDJNyNITfrk3lfKwy8CnFCuLZuOyBjGsljw
         bVInjiyFMRqUf+z9hiLKL/+GNzCcPXFPyAt8BHBt0RtVicN4rQT7FeMg56GmjSAJAcul
         cAyuz4D+8C8eqpIqukLefqHqVTM3QmM+Cqs1fkbXQINoXxvSZZ1528rjKccCzmUIuKJZ
         xqEg==
X-Gm-Message-State: APjAAAVfMqbEW+IMq0MBDQUz28Vd416XlYTMvH5wCNZNA76YB28HzoZ7
        mUiKz7TRWLLVUjdud5TZ2cRZ6drV8Zc=
X-Google-Smtp-Source: APXvYqzfCH0I9Ovyj5f+TMFVnPqL5ozOvcPC73LrFZoO5BOKdJyYYtrIAEvcbVn/Ls/d8ipWd8juuw==
X-Received: by 2002:a2e:9906:: with SMTP id v6mr16255037lji.90.1575880747094;
        Mon, 09 Dec 2019 00:39:07 -0800 (PST)
Received: from localhost.localdomain ([37.157.136.193])
        by smtp.gmail.com with ESMTPSA id r26sm10438971lfm.82.2019.12.09.00.39.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2019 00:39:06 -0800 (PST)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Vikash Garodia <vgarodia@codeaurora.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH 0/6] Venus new features
Date:   Mon,  9 Dec 2019 10:38:18 +0200
Message-Id: <20191209083824.806-1-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

The patchset contains two new features:

The first one is the so called core-selection (for Venus on sdm845)
where we adding a mechanism in the driver to select the minimum
loaded core (sdm845 has two cores, aka hardware pipelines) for the
given driver instance. This feature should improve power management
and thermal mitigation as well. 

The second one is related to the decoder 10bit bitstream playback.

Aniket Masule (2):
  media: venus: introduce core selection
  media: venus: vdec: handle 10bit bitstreams

Stanimir Varbanov (4):
  venus: redesign clocks and pm domains control
  arm64: dts: sdm845: move venus clocks and pmdomains in parent
  dt-bindings: media: venus: describe sdm845 with optional pmdomains
  v4l: Add source event change for bit-depth

 .../devicetree/bindings/media/qcom,venus.txt  |  22 +-
 .../media/uapi/v4l/vidioc-dqevent.rst         |   8 +-
 .../media/videodev2.h.rst.exceptions          |   1 +
 arch/arm64/boot/dts/qcom/sdm845.dtsi          |  23 +-
 drivers/media/platform/qcom/venus/Makefile    |   2 +-
 drivers/media/platform/qcom/venus/core.c      |  89 +-
 drivers/media/platform/qcom/venus/core.h      |   9 +
 drivers/media/platform/qcom/venus/helpers.c   | 435 ++------
 drivers/media/platform/qcom/venus/helpers.h   |   4 -
 .../media/platform/qcom/venus/hfi_helper.h    |   6 +
 .../media/platform/qcom/venus/hfi_parser.h    |   5 +
 .../media/platform/qcom/venus/pm_helpers.c    | 947 ++++++++++++++++++
 .../media/platform/qcom/venus/pm_helpers.h    |  65 ++
 drivers/media/platform/qcom/venus/vdec.c      |  88 +-
 drivers/media/platform/qcom/venus/venc.c      |  75 +-
 include/uapi/linux/videodev2.h                |   1 +
 16 files changed, 1262 insertions(+), 518 deletions(-)
 create mode 100644 drivers/media/platform/qcom/venus/pm_helpers.c
 create mode 100644 drivers/media/platform/qcom/venus/pm_helpers.h

-- 
2.17.1

