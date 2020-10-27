Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F246229ABA4
	for <lists+linux-media@lfdr.de>; Tue, 27 Oct 2020 13:17:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2899725AbgJ0MRr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Oct 2020 08:17:47 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:39155 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2899705AbgJ0MRq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Oct 2020 08:17:46 -0400
Received: by mail-wr1-f67.google.com with SMTP id y12so1641564wrp.6
        for <linux-media@vger.kernel.org>; Tue, 27 Oct 2020 05:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Yv5nQ3yDPCTR6Qr42pQX9T0J3MZN9NU/gU5iZJIrkWk=;
        b=fei0ANa2ElSFo4FKASLBvqdzEpQMc369lxMXy79AWLlLE4ldM0t9l6k8RVF3buSnvA
         InRbHn9r2hR680pZZ+gYHBH0cxjnXEpWTBjRsyn3pPicTDT7ROS1njEmMsQ0EtyoYRv/
         vBz+LlGkNh9F45O2WPmNPaWYUC2TRs+1c28W6I2DHNQSUKyUoBTvCUXW/RmCgB8tOU8G
         g5O/0EGVAt658IQXZb3tOQIDePMiXd3i3GdEI4By620HO0ioGffbTx/3svpvzdtTVEbj
         pJSbSja7AzYXp5nq6dTEmNRhW6+2gmmrtbUq1fP5SW49DL3CQr9yND4Z3iXAPYqZ02Lj
         0X6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Yv5nQ3yDPCTR6Qr42pQX9T0J3MZN9NU/gU5iZJIrkWk=;
        b=GnnS7s8qKEKXDv2KH+ie5jflMxl3XERHWH6toDcDS/YpYqHax4lIYY0HcNjaUqUBg/
         zFR6mEBJKX33edEahtfQS9huZzti5HJD6bG+dbq6AQ5v0KoCxWrb5STUNCYFkqq8EYZ4
         /hxe+fcSGTulKJ4uZvHs8oWlHOYQRnmlrsLUCONGAsas7tzh9UjAOgMCBnWUhqBvDLC0
         rXFOZBFDZ4+i2CW8H6r00EW9wgtj+FEkVPEXwcQ4c8W+G90N4i8c1GuXx3gdJMeffvXO
         Yvd+O/Yj44Dys4IeV0rsrpisCY5VjH1DXOoF1FeYIjZ4ahljZoo9EomWYGnMIcgAFuM+
         VJtg==
X-Gm-Message-State: AOAM532bg5Q3Ni+80V6V43bFpB9Mb8NS3JVY1gdfHIRzlrOdemdyfqPx
        4Fc9H2IUGD+oEHzlA4QMSThbPQ==
X-Google-Smtp-Source: ABdhPJwBy/86P9NLjWm4ayzRrNeTPV1ezoUeA/zg5bUjnQJez1TgK6PN9H/ezjMnvntOGwzzJ6JYWg==
X-Received: by 2002:a05:6000:108:: with SMTP id o8mr2545710wrx.256.1603801064364;
        Tue, 27 Oct 2020 05:17:44 -0700 (PDT)
Received: from debian-brgl.home (amarseille-656-1-4-167.w90-8.abo.wanadoo.fr. [90.8.158.167])
        by smtp.gmail.com with ESMTPSA id a2sm1731908wrs.55.2020.10.27.05.17.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2020 05:17:43 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Gustavo Padovan <gustavo@padovan.org>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Borislav Petkov <bp@alien8.de>,
        Tony Luck <tony.luck@intel.com>,
        James Morse <james.morse@arm.com>,
        Robert Richter <rric@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "Michael S . Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
        Christoph Lameter <cl@linux.com>,
        Pekka Enberg <penberg@kernel.org>,
        David Rientjes <rientjes@google.com>,
        Joonsoo Kim <iamjoonsoo.kim@lge.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc:     linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
        linux-edac@vger.kernel.org, linux-gpio@vger.kernel.org,
        kvm@vger.kernel.org, virtualization@lists.linux-foundation.org,
        netdev@vger.kernel.org, linux-mm@kvack.org,
        alsa-devel@alsa-project.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 4/8] pinctrl: use krealloc_array()
Date:   Tue, 27 Oct 2020 13:17:21 +0100
Message-Id: <20201027121725.24660-5-brgl@bgdev.pl>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201027121725.24660-1-brgl@bgdev.pl>
References: <20201027121725.24660-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Use the helper that checks for overflows internally instead of manually
calculating the size of the new array.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/pinctrl/pinctrl-utils.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-utils.c b/drivers/pinctrl/pinctrl-utils.c
index f2bcbf62c03d..93df0d4c0a24 100644
--- a/drivers/pinctrl/pinctrl-utils.c
+++ b/drivers/pinctrl/pinctrl-utils.c
@@ -39,7 +39,7 @@ int pinctrl_utils_reserve_map(struct pinctrl_dev *pctldev,
 	if (old_num >= new_num)
 		return 0;
 
-	new_map = krealloc(*map, sizeof(*new_map) * new_num, GFP_KERNEL);
+	new_map = krealloc_array(*map, new_num, sizeof(*new_map), GFP_KERNEL);
 	if (!new_map) {
 		dev_err(pctldev->dev, "krealloc(map) failed\n");
 		return -ENOMEM;
-- 
2.29.1

