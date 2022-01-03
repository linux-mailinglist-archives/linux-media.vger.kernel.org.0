Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC05248364D
	for <lists+linux-media@lfdr.de>; Mon,  3 Jan 2022 18:41:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233129AbiACRlN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Jan 2022 12:41:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232029AbiACRlM (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 Jan 2022 12:41:12 -0500
Received: from mail-oo1-xc31.google.com (mail-oo1-xc31.google.com [IPv6:2607:f8b0:4864:20::c31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7593CC061761;
        Mon,  3 Jan 2022 09:41:12 -0800 (PST)
Received: by mail-oo1-xc31.google.com with SMTP id w15-20020a4a9d0f000000b002c5cfa80e84so10907041ooj.5;
        Mon, 03 Jan 2022 09:41:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UJugq+q33UDGyDaDhmiuiGH6QULOKahu3StcjckUg4c=;
        b=pgsPDNP0QS3dOl4E1Y/qLj9qLxum48ESuvdEE6KYfnTMqlA02sUkHXzGpnrXv597a2
         tzwX7+lKMuTWQPsFUo6jVtzQkeD1RsrW/t+UCo96xihl5GloghXdkVUpdGz/JDwNkTqW
         p8ofGsl4Xs77ENKdRRyHgLjwJUfU7bdFFwXrHvV6AHb7qhHwGSkW7jtWSYAB8MGK5cbJ
         Y11hpzFCICOilz3U8ap3YzdkW6Xjl5GET6Swmle/t/v7yv48DQZpxZZrXb67prqLTwkL
         gZmFZsR/ERYT7RrUkQyXZClVL/WO1PmXsHQ99293xA8L68DfqvZLbkbIC3cHJiYL+mja
         KAYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UJugq+q33UDGyDaDhmiuiGH6QULOKahu3StcjckUg4c=;
        b=ou4iGHD76zCpYalFRbN7YetwwaXmC1YcNPQ4DlzECp6HylEJ6s033aF0xf2lVQtT7t
         K4dr08Cv/goEU6AiP8U1QSt8NsYZseehyWVSm7tKQXdbWiGkMaGD2gD+yOXEzjjzPeHU
         M1AZi4eRzePzgrEdaJ5Lb21btoiAhLjhkX0llsXN2QMoDzbHGjSPucIVieDRnfr+3D0t
         IxBeGRCH7PtiW3ld2GPzZ2P/6mVDYf2uKw3UQvYgpKzWji9QOVIQdGYrcg/9Qpy+s7dO
         PLfv3WpU9GQhosGjJ5GvUx9jwhPASru9I5R/5yXT5crYEEGaKi8fLUUoG1OQMA6jF2E3
         oT8Q==
X-Gm-Message-State: AOAM533fZ51nBLhn2i8kuB7J1oC1J5v0hlwO0bJj9xwQaD2km0UMbXmW
        LMPzaJC/ElCrzZ5E0PsIbxQ=
X-Google-Smtp-Source: ABdhPJykAgfFlT/ukaKTo8t2ph+8QWknilIqmvUGv/JFq33bE8ke7SF1OcBMkC90YhJmJM/0gjYiFw==
X-Received: by 2002:a4a:a389:: with SMTP id s9mr29165835ool.4.1641231671866;
        Mon, 03 Jan 2022 09:41:11 -0800 (PST)
Received: from wintermute.localdomain (cpe-76-183-134-35.tx.res.rr.com. [76.183.134.35])
        by smtp.gmail.com with ESMTPSA id s6sm9368864ois.3.2022.01.03.09.41.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jan 2022 09:41:11 -0800 (PST)
From:   Chris Morgan <macroalpha82@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     devicetree@vger.kernel.org, thierry.reding@gmail.com,
        sam@ravnborg.org, airlied@linux.ie, daniel@ffwll.ch,
        robh+dt@kernel.org, mchehab@kernel.org, emma@anholt.net,
        mripard@kernel.org, linux-media@vger.kernel.org,
        Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH 0/5] Support Geekworm MZP280 Panel for Raspberry Pi
Date:   Mon,  3 Jan 2022 11:41:01 -0600
Message-Id: <20220103174106.907-1-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Chris Morgan <macromorgan@hotmail.com>

This patch series is to add support for the MZP280 panel for the
Raspberry Pi. This panel requires adding support for Mode 3 of the
Raspberry Pi DPI connector, which necessitates a new media bus format.

This patch series has been tested on my Raspberry Pi 4 with version 1
of the panel in question.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>

Chris Morgan (5):
  media: uapi: Document format MEDIA_BUS_FMT_RGB565_1X24_CPADHI
  media: uapi: add MEDIA_BUS_FMT_RGB565_1X24_CPADHI
  dt-bindings: display: simple: add Geekworm MZP280 Panel
  drm/panel: simple: add Geekworm MZP280 Panel
  drm/vc4: dpi: Support DPI interface in mode3 for RGB565

 .../bindings/display/panel/panel-simple.yaml  |  2 +
 .../media/v4l/subdev-formats.rst              | 37 +++++++++++++++++++
 drivers/gpu/drm/panel/panel-simple.c          | 29 +++++++++++++++
 drivers/gpu/drm/vc4/vc4_dpi.c                 |  4 ++
 include/uapi/linux/media-bus-format.h         |  3 +-
 5 files changed, 74 insertions(+), 1 deletion(-)

-- 
2.25.1

