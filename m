Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ABEA438790B
	for <lists+linux-media@lfdr.de>; Tue, 18 May 2021 14:41:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349316AbhERMmn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 May 2021 08:42:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349307AbhERMmm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 May 2021 08:42:42 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B98CEC061760
        for <linux-media@vger.kernel.org>; Tue, 18 May 2021 05:41:23 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id x8so10048518wrq.9
        for <linux-media@vger.kernel.org>; Tue, 18 May 2021 05:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hcTo/xjSai7+osUF8Q2k+rYqy/qwu121JkrPDsYsoVo=;
        b=pr081h7fpAVj/o9r3RNVCDtocZcHc52z9gfCDqd19RovMZYw8oen9DJqpPkVaWGh8i
         FEB7DK2vrVLByswr6xk389k8n8Rdwodrwa5cpRzQ9hkL0Nt4ZNI6hxQNZXmoovR1bxjd
         54C3dHpIdR5Nq/O4Jk3Db7mPwzQyCk81yZJq+JlqdsFXl6bO2bpFhHhDbkumwzvXHH5M
         euwpR5uckFtuXal20JAcTIcMeJ1JpKbQ0QkSCUrlGNDeh06A50i+UH12G2ef2M0ptSNd
         bBFE6WbaBSONIQkD3uJGw6xhzeLeb1hsz20ww6vv3oww4jhdNJxeTgQi7mcQfAKYoGyJ
         Jf2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hcTo/xjSai7+osUF8Q2k+rYqy/qwu121JkrPDsYsoVo=;
        b=osjcNGak2/WGHwrMd34wKJQQhc7gMnK0+leaqrOUNK9rgifpKxjHL2f8hpXCidH/5i
         /YjziGAChnoVs35pvvccxdNyWH0aNA6v5s1hPUCYYmMuXR0ifNzy9BgCGEaTY/rDSbUD
         AWR/pnFbOUi43pI8tv3ThzOVUjfdpjrWDWp6XsrE0CPRboXHjIRk8iUcfkaPBvxpZi8F
         sLRnjFtXjBVzZwQlSxeZB96HFuBD+hN3AaK2rL8cOP1EEmSBezq6vJZA9nbr/AEhXWH1
         HprO2S/7EGaq3mU0itg/b1WXnXxH7Ms6OGbmvn1NSlCb6HS2LTC0zj15b27xTRO/3O0r
         hMGg==
X-Gm-Message-State: AOAM5305MZ2TD2cXucLlvkOUHOL20So/tAsbDrR9j1Y7n3cutqxtmDrC
        NtPYozpwcxD7wrd6FyHX7ZD3BQ==
X-Google-Smtp-Source: ABdhPJzDn6VQiLsCOZzSSM0fFq1gVT+7Ow6q9E78vsMn8Fg5W5ywkxmuYsbzc28hgCwySs2sVccaiw==
X-Received: by 2002:a05:6000:44:: with SMTP id k4mr6816431wrx.76.1621341682565;
        Tue, 18 May 2021 05:41:22 -0700 (PDT)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id z3sm1677239wrq.42.2021.05.18.05.41.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 May 2021 05:41:22 -0700 (PDT)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     gregkh@linuxfoundation.org, mchehab@kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, mjpeg-users@lists.sourceforge.net,
        Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH 3/5] staging: media: zoran: remove blank line
Date:   Tue, 18 May 2021 12:41:11 +0000
Message-Id: <20210518124113.1823055-3-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210518124113.1823055-1-clabbe@baylibre.com>
References: <20210518124113.1823055-1-clabbe@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Minor style fix by removing useless blank line.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 drivers/staging/media/zoran/zoran.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/media/zoran/zoran.h b/drivers/staging/media/zoran/zoran.h
index e7fe8da7732c..b1ad2a2b914c 100644
--- a/drivers/staging/media/zoran/zoran.h
+++ b/drivers/staging/media/zoran/zoran.h
@@ -158,7 +158,6 @@ struct zoran_jpg_settings {
 	struct v4l2_jpegcompression jpg_comp;	/* JPEG-specific capture settings */
 };
 
-
 struct zoran;
 
 /* zoran_fh contains per-open() settings */
-- 
2.26.3

