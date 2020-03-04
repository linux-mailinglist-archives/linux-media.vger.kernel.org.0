Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CFDEF17900A
	for <lists+linux-media@lfdr.de>; Wed,  4 Mar 2020 13:07:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729273AbgCDMHY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Mar 2020 07:07:24 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:53668 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726502AbgCDMHX (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 Mar 2020 07:07:23 -0500
Received: by mail-wm1-f66.google.com with SMTP id g134so1776003wme.3;
        Wed, 04 Mar 2020 04:07:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=myVXMYFX2X/qFZZm2xeEMnLsYe1/6jCcOyrKkOqzPDw=;
        b=RoFgc9EYaJKBf1aB1IsygPxKb4ptdXvkuI/fe+HFyJ+YGDbsS/jbGRIbMzy+YfoeW9
         KmZNAFgtTleKiIUhlmvPABHtFX3g/a0/m0h665SvZ51d7YDI5Lw/uT9SoStPXkEGSK4q
         V0PhnnTM1Cmg3OoQb0XbUYCL3GknBMajIslcuCTPsO1TJBlnkLUgc79gmDnzQ83rwJF6
         Sb7UVMkoy7VsTNXHM39B/Rr5ygFKPmobnLVyTHAB8LmOS3YOVWWTMw8eaGyEB6J1Ilxp
         E3VKN5Olxi20GUwgBtoKfgGgDfpPZd4baDEp6repdRw2GCkAzUT/2H8U2lOC8MIj83qQ
         ePAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=myVXMYFX2X/qFZZm2xeEMnLsYe1/6jCcOyrKkOqzPDw=;
        b=o8ng05lbi4jbLWWp87d3vcIr2DBhw5/MUH3l3Zv11mOAuaW4i9YzLgfpTJj6XSTHJE
         QguAXdIvMYSfbaVoi6+g1BeH2JwtR9X8/MISwXEKYlKvkSH3cYblzuas0rkWDfOrpueB
         sUcoCPHaYziqEYSZJJmeyEu20xst70B53o7+LZzHwV3inIrlIUzQPlqSGm347W3TvPKq
         ofzYDmF+oRqmUgsyDUoXIxI8zCf1Hj1nEG6a35FgWcfd+GYxW6P9ylq1Fw/07GJIx+2e
         wQWKWBfZIIOx2PIXWanqo8Z2nCO0Wf4KqOX7jWcdnyOXvS3YdcCBWcjyfc49jKSmABGq
         UvzQ==
X-Gm-Message-State: ANhLgQ22XRqRDmLNKvMSpKvyf0M7yJ5jeJbvu4Xi80vkzvC93QlVSAHy
        rK7MWu1CknxO/dOWz2IiyiY=
X-Google-Smtp-Source: ADFU+vsLvouiMTzcVlXfgCXVqwVxFQI+p2PE0dPIx/YTYl4CzKad7DsO4l3zlagL0leqIqigsIv9Ew==
X-Received: by 2002:a05:600c:2281:: with SMTP id 1mr3362110wmf.120.1583323641513;
        Wed, 04 Mar 2020 04:07:21 -0800 (PST)
Received: from felia.fritz.box ([2001:16b8:2d16:4100:3093:39f0:d3ca:23c6])
        by smtp.gmail.com with ESMTPSA id c26sm3811993wmb.8.2020.03.04.04.07.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2020 04:07:20 -0800 (PST)
From:   Lukas Bulwahn <lukas.bulwahn@gmail.com>
To:     =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc:     Chris Wilson <chris@chris-wilson.co.uk>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        intel-gfx@lists.freedesktop.org,
        Sebastian Duda <sebastian.duda@fau.de>,
        Joe Perches <joe@perches.com>, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [PATCH] MAINTAINERS: adjust to reservation.h renaming
Date:   Wed,  4 Mar 2020 13:07:11 +0100
Message-Id: <20200304120711.12117-1-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Commit 52791eeec1d9 ("dma-buf: rename reservation_object to dma_resv")
renamed include/linux/reservation.h to include/linux/dma-resv.h, but
missed the reference in the MAINTAINERS entry.

Since then, ./scripts/get_maintainer.pl --self-test complains:

  warning: no file matches F: include/linux/reservation.h

Adjust the DMA BUFFER SHARING FRAMEWORK entry in MAINTAINERS.

Co-developed-by: Sebastian Duda <sebastian.duda@fau.de>
Signed-off-by: Sebastian Duda <sebastian.duda@fau.de>
Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
Christian, please pick this patch.
applies cleanly on current master and next-20200303

 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 6158a143a13e..3d6cb2789c9e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5022,7 +5022,7 @@ L:	dri-devel@lists.freedesktop.org
 L:	linaro-mm-sig@lists.linaro.org (moderated for non-subscribers)
 F:	drivers/dma-buf/
 F:	include/linux/dma-buf*
-F:	include/linux/reservation.h
+F:	include/linux/dma-resv.h
 F:	include/linux/*fence.h
 F:	Documentation/driver-api/dma-buf.rst
 K:	dma_(buf|fence|resv)
-- 
2.17.1

