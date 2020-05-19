Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D54DF1D8CFB
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2020 03:16:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726957AbgESBQq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 May 2020 21:16:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726721AbgESBQq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 May 2020 21:16:46 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98BABC05BD09
        for <linux-media@vger.kernel.org>; Mon, 18 May 2020 18:16:45 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id o14so11927747ljp.4
        for <linux-media@vger.kernel.org>; Mon, 18 May 2020 18:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=globallogic.com; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=Xn5wFnMFGQRN2JrwyG8dxbNaVxUmAM516TWUFCg/W2I=;
        b=eO1MHL1qyescskdPU67V3puqvAaIJ3hQ0IuVAZRGZ6G4uQNsgZWV1Y4u52hnCGFx+7
         Al2xXlkx5mlU74XWek6k3qA9pZTz6sq3iYKdH//4bth9WJc50gDYBtZVTskyNEGbg8zi
         SCLv7IPM2pAadEgkUO/2wCkVrkBcX4Jd0CFXO+2l3xExFCZeAtiDcbQIlVrE9owf63S9
         5yKxy0no1peIFjk/E1rDyTU21U/xw4ByDaImJQ6IP3HOe8LlXbWap/X40QiNQ/ar0yl1
         +YVLGymHUicv+iWc3IyfaVgCr16du/3uAkSc3qM4UzvguGyMH3X/Kb2DcmVVH6xhxU2Q
         vb1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=Xn5wFnMFGQRN2JrwyG8dxbNaVxUmAM516TWUFCg/W2I=;
        b=jBd9YzVQ4aKib4j3lIRNllAeLLIq/1HnZV6F8n+8hs5EqmSjZgUhxmcp7BsCeSaIpy
         WcuHhhZvnLEkKVvqgtfWjIr3ocTR4AQbNoW+Z5SkLHqZXDtjN7HTyz62PA2AXpH6UjJR
         DDhuJ6EYLLIKWm7161JuZnkKa+XMZaUSfmYbgZwWcbwOpRWQt0BtjQt6pXm3HBtInaWU
         ciBKrwYONEbzgeFCIdXzYAtRMn9zI93Qe3va6UXE8T/yyp4ha5uq+qdcZAOHdqrC83P4
         YS3s8kFVNq5SfxhU0+Ygl18ENy7NLMX/ykr0GocEqPCaPrYG6KJCJq3O4xeVAkTv5uKs
         VBAA==
X-Gm-Message-State: AOAM533BsD7tmrbUCFsT2T6kxUPcWRxYJ3LaxzgfdbAGLBWLokFSmuVY
        oUIg7SOHjBgY6Efn82rbjlpjMg==
X-Google-Smtp-Source: ABdhPJx/741/56BM68xh9y2nZL++XdhisKWGZlXkAWubLodSM7ew4ttbVJtaVvVr+Ykb1aQjtDdR+g==
X-Received: by 2002:a05:651c:1103:: with SMTP id d3mr11952050ljo.38.1589851003890;
        Mon, 18 May 2020 18:16:43 -0700 (PDT)
Received: from localhost.localdomain ([159.224.5.60])
        by smtp.googlemail.com with ESMTPSA id i8sm4764244lfl.72.2020.05.18.18.16.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 18:16:43 -0700 (PDT)
From:   Roman Kovalivskyi <roman.kovalivskyi@globallogic.com>
To:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Cc:     Luis Oliveira <lolivei@synopsys.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Michael Rodin <mrodin@de.adit-jv.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hugues Fruchet <hugues.fruchet@st.com>,
        Maxime Ripard <mripard@kernel.org>,
        Adam Ford <aford173@gmail.com>,
        Todor Tomov <todor.tomov@linaro.org>,
        Suresh Udipi <sudipi@jp.adit-jv.com>,
        Andrew Gabbasov <andrew_gabbasov@mentor.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.org>,
        Roman Kovalivskyi <roman.kovalivskyi@globallogic.com>
Subject: [PATCH v2 0/6] ov5647 driver improvement
Date:   Tue, 19 May 2020 04:16:15 +0300
Message-Id: <cover.1589847910.git.roman.kovalivskyi@globallogic.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Driver for ov5647 camera sensor lacks some important functionality, such
as ability to query device format and resolution or operations with
power down mode. Patches from Raspberry kernel source tree[1] fixes
those issues and improves quality of mentioned driver.

Changes since v1 [2]:
* Added DT bindings documentation for PWDN GPIO and non-continuous clock mode
* Patch 2: "media: ov5647: Add support for PWDN GPIO."
  * Replaced msleep with usleep_range
* Patch 3: "media: ov5647: Add support for non-continuous clock mode"
  * Added check if bus type is correct one
  * Replaced storing of all flags to storing whether clock is continuous
  * Added of_node_put(np) in case if v4l2_fwnode_endpoint_parse fails

[1] - https://github.com/raspberrypi/linux
[2] - https://lore.kernel.org/patchwork/cover/1223179/

Dave Stevenson (5):
  media: ov5647: Add set_fmt and get_fmt calls.
  media: ov5647: Add support for PWDN GPIO.
  media: ov5647: Add support for non-continuous clock mode
  media: ov5647: Use gpiod_set_value_cansleep
  media: dt-bindings: ov5647: Add property for PWDN control

Roman Kovalivskyi (1):
  media: dt-bindings: ov5647: Add property for non-continuous clock

 .../devicetree/bindings/media/i2c/ov5647.txt  |  7 ++
 drivers/media/i2c/ov5647.c                    | 77 ++++++++++++++++++-
 2 files changed, 80 insertions(+), 4 deletions(-)

-- 
2.17.1

