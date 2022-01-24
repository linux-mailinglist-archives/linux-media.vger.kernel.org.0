Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35D12498555
	for <lists+linux-media@lfdr.de>; Mon, 24 Jan 2022 17:55:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243826AbiAXQze (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Jan 2022 11:55:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236053AbiAXQzd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Jan 2022 11:55:33 -0500
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com [IPv6:2607:f8b0:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7FDDC06173B;
        Mon, 24 Jan 2022 08:55:32 -0800 (PST)
Received: by mail-oi1-x22b.google.com with SMTP id y23so8106969oia.13;
        Mon, 24 Jan 2022 08:55:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nb+0LTfVaj8me5eEZibYeHxpIZnXgwjVRTYa6w5qhzY=;
        b=mId1FuR9s6iKVTGZis7QAHMNjgq7+dmxtx/O71+f5srxsDXSAkHFST2U7qaAE1kNKU
         b68G9KgODou9xVptCUToGPQpslvdwRVol6TpamJN6hmMthG18HbvI6GvZabmSM/G7nxm
         kYTIJeE57ooqyCTgFg0aYJiKAWA7K1JLqxZkUlsQ1VxliaoH9d+FBVdelrVrJ5wxPoNX
         4cTN+ko0ZhN3WFK4dIffP4OoVUN02j+8Mk2DTVGzuWxkKcptVIo6klSNBhMffK1n7lYc
         PL53hKQ2x/HL1U7kQTplFtNWX9YzGDtVjrlAyPXk/5VuHvegYexKV+eCXfm3s/Qag5bV
         5ICA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nb+0LTfVaj8me5eEZibYeHxpIZnXgwjVRTYa6w5qhzY=;
        b=mvhcpK+AEGRhNvrH/CpTRkZSbgVpVv9Vcf4XfzHpFp/DEbRk3eBHaZSnSsGqxZJQnA
         gCdRniiuRy+cQWA1l+3gGGPVICjbV7glSpcBQzBjAoFpCsIkYje72ipv2dJ9h3OQyOTU
         GL+KOTRJWPfp+VDhQkJkx6UlUDVskXv6Fzu0VtNlgDtheH011lskMo4HX97gR8up6ucD
         bwU48Z17y09SrZ+AuLu6pVqpwkPLcZhVf5OUlNs8QaJQ5UsAQY+6c0+NkMsEFtVGCxip
         /1ofsRGPO+SzYzpg2wy8J3nWyKnSHUrnAOogX5qOMMoSLtlB3ZUpYmGFg781j2yGHnFj
         jaZQ==
X-Gm-Message-State: AOAM533zUB0Jxcv2NpvOVWSSVU4bdf11WnNHQj2bsMm4GTBve0SgsT/j
        2VGPpAgdoZ3CKtC8Wvn9FDk=
X-Google-Smtp-Source: ABdhPJz48xQEpDnzAfNH9d2m9/rNA2fDFnsYAKb2fr0KpNIVlYrxB0yJfhNQ/UdiZjS7xIh3hv7VLg==
X-Received: by 2002:a05:6808:120a:: with SMTP id a10mr2166141oil.160.1643043332255;
        Mon, 24 Jan 2022 08:55:32 -0800 (PST)
Received: from wintermute.localdomain (cpe-76-183-134-35.tx.res.rr.com. [76.183.134.35])
        by smtp.gmail.com with ESMTPSA id v22sm4418370oot.10.2022.01.24.08.55.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jan 2022 08:55:31 -0800 (PST)
From:   Chris Morgan <macroalpha82@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     devicetree@vger.kernel.org, thierry.reding@gmail.com,
        sam@ravnborg.org, airlied@linux.ie, daniel@ffwll.ch,
        robh+dt@kernel.org, mchehab@kernel.org, emma@anholt.net,
        mripard@kernel.org, linux-media@vger.kernel.org,
        Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH 0/6 v2] Support Geekworm MZP280 Panel for Raspberry Pi
Date:   Mon, 24 Jan 2022 10:55:20 -0600
Message-Id: <20220124165526.1104-1-macroalpha82@gmail.com>
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

Changes since V1:

 - Added documentation for vendor string.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>

Chris Morgan (6):
  dt-bindings: vendor-prefixes: Add Geekworm
  media: uapi: Document format MEDIA_BUS_FMT_RGB565_1X24_CPADHI
  media: uapi: add MEDIA_BUS_FMT_RGB565_1X24_CPADHI
  dt-bindings: display: simple: add Geekworm MZP280 Panel
  drm/panel: simple: add Geekworm MZP280 Panel
  drm/vc4: dpi: Support DPI interface in mode3 for RGB565

 .../bindings/display/panel/panel-simple.yaml  |  2 +
 .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
 .../media/v4l/subdev-formats.rst              | 37 +++++++++++++++++++
 drivers/gpu/drm/panel/panel-simple.c          | 29 +++++++++++++++
 drivers/gpu/drm/vc4/vc4_dpi.c                 |  4 ++
 include/uapi/linux/media-bus-format.h         |  3 +-
 6 files changed, 76 insertions(+), 1 deletion(-)

-- 
2.25.1

