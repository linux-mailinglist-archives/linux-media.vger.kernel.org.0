Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14F4A2FD079
	for <lists+linux-media@lfdr.de>; Wed, 20 Jan 2021 13:59:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389878AbhATMji (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Jan 2021 07:39:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389017AbhATMJo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Jan 2021 07:09:44 -0500
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5F2BC0613C1
        for <linux-media@vger.kernel.org>; Wed, 20 Jan 2021 04:09:03 -0800 (PST)
Received: by mail-wr1-x42c.google.com with SMTP id a1so1567987wrq.6
        for <linux-media@vger.kernel.org>; Wed, 20 Jan 2021 04:09:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wzEvD+kaeH728kQHhGOibyDD+euNAkFvVRcvtcgrs18=;
        b=qdvK8t9eT2BjR0GGUGhAMJ1J6m8rb7xgiQNQ6ZAlQxOR0aeLwd/XUfwr1fVokh3mKw
         4obnOkNJBowb2b1Mn7FyxEc1JXYG6C34OxUqRxDl8Z9NpIydWAgZc8CGDV9xrB+AIpmD
         T/+9GhXU1SKHP3nvZ2sCopc6oAuZ4Z8r0DoFO8ChqXtQUjZA6/Ul43LlWQSjCP6fq/RI
         bg0LQbLwg7pOQ8dABxRh4fM+wkRde8aBmUWBkDqlWJdT6tQV7Vn43b50XLojjIphcBwB
         3W8ZfWsFIDjGLNrkv8DlVYcmbxYYDMBnqv9PSUHDvhrQsepNhD1Q6SyUd5hUNymIRi/7
         b3kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wzEvD+kaeH728kQHhGOibyDD+euNAkFvVRcvtcgrs18=;
        b=O5+17vFurGnJpiRifDFSikKIzEHfJMEmmTixxAFkcOY35uHFZHouOshxqhTrkwbnVc
         lJWdV5V8mDDjTwS6d3RnpwMCxSCeV8xq61KRTWYW+A2UB9r+fxyuEuFkXkMKttB3Pnz0
         a4sgqZ7rBv/aLHI9vowBOmQqYXukG5jNPCi2fE2QNhuFVPLeL6sjAAe3kxYB/XE35lYs
         Ri6QhfltPbNqGhSWB4Gy0zTp87XugipALcjDlSssKTz2rvE/lafHKB8shpnTRNzyFmNs
         F+XFNT26/nnsJ1l7UZpEY1bnRMsQ3AwFDTmuaMMmifMew3w6+nbnVMS9QOYzgVzJXWm2
         Zlnw==
X-Gm-Message-State: AOAM5323VIBl/ZGqctS/plwTMR6xHBmGUtT7UkA9RjrcxLeKVu/yC0Y0
        6g7sM34gTsE9+uu8IALvotqh0w==
X-Google-Smtp-Source: ABdhPJzUoAyUnN8xEH54Pnn59hcdXRJw6tEEG6Xn/WyKNcnG2ObslKaVNA8T/dqQFCIl7cJHvjZV+g==
X-Received: by 2002:adf:a11d:: with SMTP id o29mr2755493wro.45.1611144542670;
        Wed, 20 Jan 2021 04:09:02 -0800 (PST)
Received: from localhost.localdomain ([2a02:2450:102f:d6a:93b3:1f80:ae7b:a5c6])
        by smtp.gmail.com with ESMTPSA id a62sm3867391wmh.40.2021.01.20.04.09.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jan 2021 04:09:01 -0800 (PST)
From:   Robert Foss <robert.foss@linaro.org>
To:     dongchun.zhu@mediatek.com, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dongchun Zhu <Dongchun.Zhu@mediatek.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bingbu Cao <bingbu.cao@linux.intel.com>,
        Andrey Konovalov <andrey.konovalov@linaro.org>
Cc:     Tomasz Figa <tfiga@google.com>,
        Robert Foss <robert.foss@linaro.org>
Subject: [PATCH v5] media: ov8856: Configure sensor for GRBG Bayer for all modes
Date:   Wed, 20 Jan 2021 13:08:47 +0100
Message-Id: <20210120120847.1505143-1-robert.foss@linaro.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The previously added modes 3264x2448 & 1632x1224 are actually
configuring the sensor for BGGR mode, this is an issue since
the mode that is exposed through V4L incorrectly is set as GRBG.

This patch fixes the issue by moving the output crop window of
internal sensor ISP uses by one row, which means that the Bayer
pattern of the output is changed.

From:
row 1: B G B G B G ...
row 2: G R G R G R ...
row 3: B G B G B G ...
...

To:
row 2: G R G R G R ...
row 3: B G B G B G ...
...

Signed-off-by: Robert Foss <robert.foss@linaro.org>
Suggested-by: Andrey Konovalov <andrey.konovalov@linaro.org>
Reviewed-by: Andrey Konovalov <andrey.konovalov@linaro.org>
---

Changes since v1:
 - Sakari: Added mode information to ov8856_mode struct
 - Sakari: enum_mbus_code updated

Changes since v2:
 - Andrey: Switched approach to changing the sensor configuration
   to yield identical Bayer modes for all modes

Changes since v3:
 - Andrey: Improve commit msg to explain Bayer shift better

Changes since v4:
 - Andrey: Fix typ-o
 - Andrey: Add r-b


 drivers/media/i2c/ov8856.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ov8856.c b/drivers/media/i2c/ov8856.c
index 2f4ceaa80593..8a355135c7db 100644
--- a/drivers/media/i2c/ov8856.c
+++ b/drivers/media/i2c/ov8856.c
@@ -428,7 +428,7 @@ static const struct ov8856_reg mode_3264x2448_regs[] = {
 	{0x3810, 0x00},
 	{0x3811, 0x04},
 	{0x3812, 0x00},
-	{0x3813, 0x02},
+	{0x3813, 0x01},
 	{0x3814, 0x01},
 	{0x3815, 0x01},
 	{0x3816, 0x00},
@@ -821,7 +821,7 @@ static const struct ov8856_reg mode_1632x1224_regs[] = {
 	{0x3810, 0x00},
 	{0x3811, 0x02},
 	{0x3812, 0x00},
-	{0x3813, 0x02},
+	{0x3813, 0x01},
 	{0x3814, 0x03},
 	{0x3815, 0x01},
 	{0x3816, 0x00},
-- 
2.27.0

