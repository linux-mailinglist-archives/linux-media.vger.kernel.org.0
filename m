Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 78571136F9C
	for <lists+linux-media@lfdr.de>; Fri, 10 Jan 2020 15:40:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727912AbgAJOka (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 Jan 2020 09:40:30 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:33200 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727889AbgAJOka (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 Jan 2020 09:40:30 -0500
Received: by mail-lf1-f66.google.com with SMTP id n25so1670074lfl.0
        for <linux-media@vger.kernel.org>; Fri, 10 Jan 2020 06:40:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id;
        bh=oqKhY+/f+pk6jU/izbi8V2GC85I1rbeC6clJ0wQaYsg=;
        b=mXLIVTAP31Fjd4YiCSmodfl1++on0JorCwv//RjbDYy8MXrTAAS6k8erPrH8uyO6Aa
         CkzVz4M+vT0rVmrKITawJ8ur1O69W1mH1JDUuyrr1lLzOLOo3PWRxXv569YhynxWV+hy
         R2RAZFOMu06wnhKoMaV+98+e05SpCUn54SkEE+rX7fj83KIWIxyucL/Ujv/03gJDVxLk
         EIqAm/aIkQ/7IsaK9y6LXV55yLRTmyU1QBE7SqC2HAHYgRp1kUI+gcLsYVvXjK3NlVo9
         U28RKFZdpbrs+HYvaDb2/fJJHXujoGVI8oF68DMg1JpzwiV+GWMXbm4NYOKdi1AUJdG6
         alJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=oqKhY+/f+pk6jU/izbi8V2GC85I1rbeC6clJ0wQaYsg=;
        b=m2l3nJt0A5dwBWVH76wxA6dxnCnlAWC6M4doEk5JW9BQVzW5r1IhxMChL48ahlw8pJ
         BzxuEVghbl37ZRt5kEUkH062Ol39GYaMWLgdo7OTRYLkEe7fiXLhhPP3U3kHHedHv9f/
         bh1/FEyCvXLHLvRXnEcSnJPyqgeSAWCJMiwO6w7UPOjlK/Qv2sg/D0LjIJOGeQlR9yNt
         oVh202ofRiZHvmWYRSZgzS8zQiRgagS99GfzuMocl7TvfEXCKLBrEmbPbUhhZmQMyB8W
         KxqS4+IGM5Ubs4QkdfmcXS+bi7MAyAK0wvUX7EcBBSPSx6Y1CHXrZscFCi0P7grt/MsY
         1/kA==
X-Gm-Message-State: APjAAAXB3Zmfb5vdhCTktjhB21Ggq+Ji+0wQG9BHuYJMs6gsRxc8nPvQ
        zdCPYTz40UtlocKkldTNvw92rBKa8Ck=
X-Google-Smtp-Source: APXvYqykd4+4HrHd2bAXpoj13wdVSLqoR/SqNY4FBu9Pmqa8Qic5FLWy11ayIY3b+3ai32vswonDXg==
X-Received: by 2002:ac2:599c:: with SMTP id w28mr2680323lfn.78.1578667227818;
        Fri, 10 Jan 2020 06:40:27 -0800 (PST)
Received: from localhost.localdomain ([37.157.136.193])
        by smtp.gmail.com with ESMTPSA id d4sm1114962lfn.42.2020.01.10.06.40.26
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2020 06:40:26 -0800 (PST)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL for v5.6] Venus updates
Date:   Fri, 10 Jan 2020 16:40:17 +0200
Message-Id: <20200110144017.16648-1-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

The Venus driver updates include:
 - re-design pm-domain and clocks handling
 - added core assingment for Venus IPs with more than one vcodec pipeline
 - dt-binding convertion to yaml DT schema
 - added decoder handling of 10bit bitstreams
 - few fixes

Please pull.

regards,
Stan

The following changes since commit 2a0a0bc7020ef7e66c9569d8229d79fa72e3d659:

  media: MAINTAINERS: add entry for Rockchip ISP1 driver (2020-01-09 16:45:01 +0100)

are available in the Git repository at:

  git://linuxtv.org/svarbanov/media_tree.git tags/venus-for-v5.6

for you to fetch changes up to e91ebb35b94ef8cf5988cfb2f4802422fbd5f4ec:

  dt-bindings: media: venus: delete old binding document (2020-01-10 12:37:29 +0200)

----------------------------------------------------------------
Venus updates for v5.6

----------------------------------------------------------------
Andy Shevchenko (1):
      media: venus: firmware: Use %pR to print IO resource

Aniket Masule (2):
      media: venus: introduce core selection
      media: venus: vdec: handle 10bit bitstreams

Stanimir Varbanov (8):
      venus: redesign clocks and pm domains control
      venus: venc: blacklist two encoder properties
      dt-bindings: media: venus: Convert msm8916 to DT schema
      dt-bindings: media: venus: Convert msm8996 to DT schema
      dt-bindings: media: venus: Convert sdm845 to DT schema
      dt-bindings: media: venus: Add sdm845v2 DT schema
      venus: core: add sdm845-v2 DT compatible and resource struct
      dt-bindings: media: venus: delete old binding document

Stephan Gerhold (1):
      media: venus: hfi_parser: Ignore HEVC encoding for V1

 .../bindings/media/qcom,msm8916-venus.yaml         | 119 +++
 .../bindings/media/qcom,msm8996-venus.yaml         | 153 ++++
 .../bindings/media/qcom,sdm845-venus-v2.yaml       | 140 +++
 .../bindings/media/qcom,sdm845-venus.yaml          | 156 ++++
 .../devicetree/bindings/media/qcom,venus.txt       | 120 ---
 drivers/media/platform/qcom/venus/Makefile         |   2 +-
 drivers/media/platform/qcom/venus/core.c           | 122 ++-
 drivers/media/platform/qcom/venus/core.h           |  31 +-
 drivers/media/platform/qcom/venus/firmware.c       |   3 +-
 drivers/media/platform/qcom/venus/helpers.c        | 437 +++-------
 drivers/media/platform/qcom/venus/helpers.h        |   4 -
 drivers/media/platform/qcom/venus/hfi_cmds.c       |   2 +
 drivers/media/platform/qcom/venus/hfi_helper.h     |   6 +
 drivers/media/platform/qcom/venus/hfi_parser.c     |   1 +
 drivers/media/platform/qcom/venus/hfi_parser.h     |   5 +
 drivers/media/platform/qcom/venus/pm_helpers.c     | 964 +++++++++++++++++++++
 drivers/media/platform/qcom/venus/pm_helpers.h     |  65 ++
 drivers/media/platform/qcom/venus/vdec.c           |  84 +-
 drivers/media/platform/qcom/venus/venc.c           |  75 +-
 19 files changed, 1854 insertions(+), 635 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,msm8916-venus.yaml
 create mode 100644 Documentation/devicetree/bindings/media/qcom,msm8996-venus.yaml
 create mode 100644 Documentation/devicetree/bindings/media/qcom,sdm845-venus-v2.yaml
 create mode 100644 Documentation/devicetree/bindings/media/qcom,sdm845-venus.yaml
 delete mode 100644 Documentation/devicetree/bindings/media/qcom,venus.txt
 create mode 100644 drivers/media/platform/qcom/venus/pm_helpers.c
 create mode 100644 drivers/media/platform/qcom/venus/pm_helpers.h
