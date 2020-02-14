Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DA51D15DF3D
	for <lists+linux-media@lfdr.de>; Fri, 14 Feb 2020 17:08:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390722AbgBNQHh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 14 Feb 2020 11:07:37 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:45812 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390525AbgBNQHg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 Feb 2020 11:07:36 -0500
Received: by mail-lf1-f68.google.com with SMTP id 203so7072489lfa.12
        for <linux-media@vger.kernel.org>; Fri, 14 Feb 2020 08:07:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id;
        bh=WOKcX6YJJZxmit7/otIxYfzDBZZjPsXZg0sRdK2W12I=;
        b=OQ9++fz2ZWaM8st6qT1v8H1nNvNvoIQecprAXwgQEn62ZfpJBtbytziib+X2YJpzwi
         0XApw+hq1GwtbadWZ3JPH3pstGkxZe3wSKuZC5LOKfkJ7JqlmTaXAFqpVWxVaXFW30tG
         qx0kPzDJsRkjGJtWzFtGXeb3ItRK7Br2yctgVJEo/aeE8Bwmd61Go0Wz4NIkok7W7R9b
         b4wxannccGr5UxU35HeOq7ttGrPr1f6BMHwxTl7T0QBtj0maaeulrtWes8ORatPOAUt7
         rP2tAZKpZ1//OQYWDA9lW1HlZfOUz5ht/Mcdd4iNF7zjI5p3Cl9HdYBYbtn5tzxPfL9w
         BMjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=WOKcX6YJJZxmit7/otIxYfzDBZZjPsXZg0sRdK2W12I=;
        b=HqlEpBN906nhBA7LQw4KnfjbxESaOrsrMjHcTlAHlMM01kSDashaiPe6i+VzCEz2XS
         a8ypfNBlHx5U3HDy16qfahurgHL1yhNUbYvvlvP47iDPizBe5BB49otqkKZ5EAdCUn+f
         4SgMD6SI7ScRw3d8gFWTs54hPJ8W3gYIRZIDMgdD/RT671DqtEQBSn9+cslYwY7SosdH
         AW6Kb3XEy8T3xVEUXdy0RYUEe7W+Y50wJ+sCIwgj6byin9p42Hv+t0q2Je00zoKTuU6s
         NK2wA8kXXsBIiYWJ/MN5FuUgcWlBMbTlJathVTgOiQtDOlh9K+a42G0m+V3R9Tm107PZ
         LjRg==
X-Gm-Message-State: APjAAAUCLr+0ghVvF1ZgNHL5/9GyDdzlQsiDJP3am+ATX4RKyjzpfAO2
        mlz8YRYWBldsqoNu2bN4ZEK3YTNEvuU=
X-Google-Smtp-Source: APXvYqxUZ6X2TwSWYzy1HoI0blVA/Md+MKC+2A62WOxH1LyYyTK0UW5aNPe80LCk4AWCO+5OUB5Reg==
X-Received: by 2002:ac2:54b5:: with SMTP id w21mr2031003lfk.175.1581696453938;
        Fri, 14 Feb 2020 08:07:33 -0800 (PST)
Received: from localhost.localdomain ([94.155.124.210])
        by smtp.gmail.com with ESMTPSA id h14sm3162077lfc.2.2020.02.14.08.07.32
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2020 08:07:33 -0800 (PST)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL for v5.7] Venus updates
Date:   Fri, 14 Feb 2020 18:07:06 +0200
Message-Id: <20200214160706.2467-1-stanimir.varbanov@linaro.org>
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
 - added support for sc7180 SoC
 - added decoder handling of 10bit bitstreams
 - a fix for kernel Oops
 - few other fixes 

Please pull.

Note that for few of the patches checkpatch produces a known warning [1]
even after I made relevant changes in MAINTAINERS file.

regards,
Stan

[1] "WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?"

The following changes since commit bb6d3fb354c5ee8d6bde2d576eb7220ea09862b9:

  Linux 5.6-rc1 (2020-02-09 16:08:48 -0800)

are available in the Git repository at:

  git://linuxtv.org/svarbanov/media_tree.git tags/venus-for-v5.7

for you to fetch changes up to 884d87010969038741623b5da28e9d96ba763b59:

  dt-bindings: media: venus: Add sc7180 DT schema (2020-02-14 17:33:35 +0200)

----------------------------------------------------------------
Venus updates for v5.7

----------------------------------------------------------------
Andy Shevchenko (1):
      media: venus: firmware: Use %pR to print IO resource

Aniket Masule (2):
      media: venus: introduce core selection
      media: venus: vdec: handle 10bit bitstreams

Dikshita Agarwal (2):
      venus: core: add sc7180 DT compatible and resource struct
      dt-bindings: media: venus: Add sc7180 DT schema

Stanimir Varbanov (10):
      MAINTAINERS: Add dt-binding files for Venus
      venus: venc: blacklist two encoder properties
      venus: cache vb payload to be used by clock scaling
      venus: redesign clocks and pm domains control
      dt-bindings: media: venus: Convert msm8916 to DT schema
      dt-bindings: media: venus: Convert msm8996 to DT schema
      dt-bindings: media: venus: Convert sdm845 to DT schema
      dt-bindings: media: venus: Add sdm845v2 DT schema
      venus: core: add sdm845-v2 DT compatible and resource struct
      dt-bindings: media: venus: delete old binding document

Stephan Gerhold (1):
      media: venus: hfi_parser: Ignore HEVC encoding for V1

 .../bindings/media/qcom,msm8916-venus.yaml         | 119 +++
 .../bindings/media/qcom,msm8996-venus.yaml         | 172 ++++
 .../bindings/media/qcom,sc7180-venus.yaml          | 140 +++
 .../bindings/media/qcom,sdm845-venus-v2.yaml       | 140 +++
 .../bindings/media/qcom,sdm845-venus.yaml          | 156 ++++
 .../devicetree/bindings/media/qcom,venus.txt       | 120 ---
 MAINTAINERS                                        |   1 +
 drivers/media/platform/qcom/venus/Makefile         |   2 +-
 drivers/media/platform/qcom/venus/core.c           | 167 ++--
 drivers/media/platform/qcom/venus/core.h           |  32 +-
 drivers/media/platform/qcom/venus/firmware.c       |   3 +-
 drivers/media/platform/qcom/venus/helpers.c        | 448 +++-------
 drivers/media/platform/qcom/venus/helpers.h        |   4 -
 drivers/media/platform/qcom/venus/hfi_cmds.c       |   2 +
 drivers/media/platform/qcom/venus/hfi_helper.h     |   6 +
 drivers/media/platform/qcom/venus/hfi_parser.c     |   1 +
 drivers/media/platform/qcom/venus/hfi_parser.h     |   5 +
 drivers/media/platform/qcom/venus/pm_helpers.c     | 959 +++++++++++++++++++++
 drivers/media/platform/qcom/venus/pm_helpers.h     |  65 ++
 drivers/media/platform/qcom/venus/vdec.c           |  84 +-
 drivers/media/platform/qcom/venus/venc.c           |  75 +-
 21 files changed, 2066 insertions(+), 635 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,msm8916-venus.yaml
 create mode 100644 Documentation/devicetree/bindings/media/qcom,msm8996-venus.yaml
 create mode 100644 Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml
 create mode 100644 Documentation/devicetree/bindings/media/qcom,sdm845-venus-v2.yaml
 create mode 100644 Documentation/devicetree/bindings/media/qcom,sdm845-venus.yaml
 delete mode 100644 Documentation/devicetree/bindings/media/qcom,venus.txt
 create mode 100644 drivers/media/platform/qcom/venus/pm_helpers.c
 create mode 100644 drivers/media/platform/qcom/venus/pm_helpers.h
