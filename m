Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 945591BBE2F
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2020 14:51:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726804AbgD1Mup (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Apr 2020 08:50:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726746AbgD1Mup (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Apr 2020 08:50:45 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D1B3C03C1AB
        for <linux-media@vger.kernel.org>; Tue, 28 Apr 2020 05:50:45 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id u127so2726816wmg.1
        for <linux-media@vger.kernel.org>; Tue, 28 Apr 2020 05:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ivk8pUd5yw65/sV/AvpRxYKjBbQZM0SLzoY/9d09xk4=;
        b=Of8nBJdkQzrZsQ93VmweFQ2f0VW0tkBt7Arl73GPj7BJQBd1pGk3DpmZi+VE6ZKCHX
         mlvXb5C9ntOqyF7vCz8Kc9H+FPam1W15Q+oJeHHfeWouz6oG5S6UayP8QY2GQdPUI0My
         hCPus1kjcwzWMS6LHSUO8Wog5xotwmZfF1Rk01Vh41vN9/i9ZUSamwG/DgN4RGiguFnJ
         CL8/TmhN+X02+qkqcOoIiXhiT7DosmretDlc6iCO+pUDDyq8V7kpnzS97PK51gjcfusD
         ErWaiqPmUu5q3PfIhGwF/jg7w8G5VKmMGWvjKaRiugDR4+f7SzGsiWgqBo6832Lb49Tz
         cGsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ivk8pUd5yw65/sV/AvpRxYKjBbQZM0SLzoY/9d09xk4=;
        b=TRSKhgUw7KohWGW+2GGiO75L5wjmQS53xTODSyxQe8w1VQW7Y0IxYi0bLERSL+PLxN
         C59KcObycp/98ZPvMgwN47dHP2Za7jGJUiFZs8xUjA8d+Q8uS9zG5SMc0l6Xl81rMh9W
         TVKyF1jADRkatwJkuA6Kbdk9Bz0gzqt06e7HbdFm0nQYuC1Xo+wJobwRuFHbKxdA/XwH
         BLUYjV8W/Z6prA0NEN0aTOM/keZG0RobpO0wMWb5f/Avx2RA0tiPrnp7MYcPzkeRE2QP
         tgXs+Oc3s0Dilm/5A3PjZa+nr12GcHcJbdo2xnF9Dic0CWIJ8Fi1EX7q0LeXXD5FPOGt
         /NnA==
X-Gm-Message-State: AGi0PubPrGALP+DGod64ZlTo21b1CiVi6ckk787gEVJZW3pESY6QMD4b
        zkQvRITsZA4S72JCytUC9Svv/ttsslLnqw==
X-Google-Smtp-Source: APiQypJD/8l1OOW0+VgnggdRlxU6EJlqkaxBVKVmSTJRZwFIqdX2QpB1vmlCqT7Ad90mXIEuv/apuA==
X-Received: by 2002:a1c:99d3:: with SMTP id b202mr4652138wme.126.1588078243182;
        Tue, 28 Apr 2020 05:50:43 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e35:2ec0:82b0:4460:3fd3:382:4a71])
        by smtp.gmail.com with ESMTPSA id q184sm3246115wma.25.2020.04.28.05.50.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2020 05:50:42 -0700 (PDT)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     linux-media@vger.kernel.org, hverkuil-cisco@xs4all.nl
Cc:     linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 0/3] meson: vdec: vp9 & MAINTAINERS fixes
Date:   Tue, 28 Apr 2020 14:50:33 +0200
Message-Id: <20200428125036.9401-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This serie fixes VP9 decoding :
- enables the motion compensation reference cache controller
- fixes buffer shortage on VP9 decoding

And update the MAINTAINERS entry to add myself ad co-maintainer and
add the missing yaml DT bindings.

Maxime Jourdan (2):
  media: meson: vdec: enable mcrcc for VP9
  media: meson: vdec: fix another case of VP9 buffer shortage

Neil Armstrong (1):
  MAINTAINERS: update the Amlogic VDEC driver maintainer entry

 MAINTAINERS                                  |  2 +
 drivers/staging/media/meson/vdec/codec_vp9.c | 72 ++++++++++++++++----
 drivers/staging/media/meson/vdec/esparser.c  | 24 +++----
 3 files changed, 71 insertions(+), 27 deletions(-)

-- 
2.22.0

