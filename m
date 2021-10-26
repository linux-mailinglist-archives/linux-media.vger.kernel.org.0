Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D00B143BAFC
	for <lists+linux-media@lfdr.de>; Tue, 26 Oct 2021 21:35:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238957AbhJZThX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Oct 2021 15:37:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238877AbhJZThB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Oct 2021 15:37:01 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5566FC061236
        for <linux-media@vger.kernel.org>; Tue, 26 Oct 2021 12:34:31 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id g205-20020a1c20d6000000b0032cc6bbd505so3601636wmg.5
        for <linux-media@vger.kernel.org>; Tue, 26 Oct 2021 12:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=l5F4vx0AkZXpsFveRw1mgakCBS1yTrfmQWwkFAyxoJk=;
        b=h6cRGWDDMndhFqDU+VxYwQIuMq09S7Yz1BmE6h4kA3AFZcosvD174mYt5UTLrY4R6w
         0MSzdoaPeidADEqUzPhjAJvzcXN51u9T/CUpoTnpnIYcn/vBGjMEAf9KtP5m5w2/JpJd
         +pkhLVFYdbwkfbdeg9WAa9ur/hRxbTm/ZFxlQsu0WFoPql9thj1F2ajyXytLkrHpNei9
         en3qKlV6A60Phj8XxaiqlmYh2pGwNcQk0RU1GIh4XJoyeXdqsnnqoLs86j6nLWtVEDN6
         ueVuSo6V+HCwH0BNNUj9KdPm0g0wcBW23S+8D3M2fRuxLwwcZHRY5Ye2uYS7Ix8kEMAk
         ecyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=l5F4vx0AkZXpsFveRw1mgakCBS1yTrfmQWwkFAyxoJk=;
        b=P+ls3SN1pUoWwEo00Pol1uYXdo7ClO+8XHjmE/gcRXlLvqM1dlxD5Ego/VNYJz3K8w
         fkx/h4ABiuTZSJONTtLiqA4cLXDRyrHUvcNA2KnTMTofH6sonqv5+0DrW//GcjZSi2wU
         oKjUIrGnISD14+XllNQiusCK9f8O8Z+KHRVuqHif5HbDn9fxglFQ8QQASFKS95HRlAn9
         XguJwA85rL6KDFcwny1JCigKK+A/Ao/4iW6AfQb0wsDd475mESqhBB0WVfXS1XTp3JN+
         84YWQcx9y/8PMOogjvJiKOICwdh7cwLyF8FeXMxEwfNvyIEG5safsj6oTYwhpBPjznff
         LHSQ==
X-Gm-Message-State: AOAM532QYTomAUoMyz3HMSdZXjZr2aj6/fyvkJWMAViu3oaVytHYXAfT
        oX6ASyhQSDbsR/ffWUT5UCc2hw==
X-Google-Smtp-Source: ABdhPJxmbWyIAsI7MI/43OP+WBu0p58TWdJOybmOiVLe296pRgKDBrvmoQB0t00t+mS+rxF1belH6w==
X-Received: by 2002:a05:600c:ac2:: with SMTP id c2mr742197wmr.194.1635276869996;
        Tue, 26 Oct 2021 12:34:29 -0700 (PDT)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id s18sm17676123wrb.95.2021.10.26.12.34.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Oct 2021 12:34:29 -0700 (PDT)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     mchehab@kernel.org, hverkuil@xs4all.nl, gregkh@linuxfoundation.org
Cc:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, mjpeg-users@lists.sourceforge.net,
        Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH v3 14/14] staging: media: zoran: DC30 encoder is not adv7175
Date:   Tue, 26 Oct 2021 19:34:16 +0000
Message-Id: <20211026193416.1176797-15-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211026193416.1176797-1-clabbe@baylibre.com>
References: <20211026193416.1176797-1-clabbe@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The DC30 uses a non-i2c ITT MSE3000 encoder and not an adv7175 as stated
in the card list.
So remove adv7175 from DC30.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 drivers/staging/media/zoran/zoran_card.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/media/zoran/zoran_card.c b/drivers/staging/media/zoran/zoran_card.c
index 59df1e7691f9..a9b0316cd688 100644
--- a/drivers/staging/media/zoran/zoran_card.c
+++ b/drivers/staging/media/zoran/zoran_card.c
@@ -472,8 +472,6 @@ static struct card_info zoran_cards[NUM_CARDS] = {
 		.name = "DC30",
 		.i2c_decoder = "vpx3220a",
 		.addrs_decoder = vpx3220_addrs,
-		.i2c_encoder = "adv7175",
-		.addrs_encoder = adv717x_addrs,
 		.video_codec = CODEC_TYPE_ZR36050,
 		.video_vfe = CODEC_TYPE_ZR36016,
 
-- 
2.32.0

