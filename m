Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E54BD77DF06
	for <lists+linux-media@lfdr.de>; Wed, 16 Aug 2023 12:42:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243558AbjHPKmX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Aug 2023 06:42:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244004AbjHPKmN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Aug 2023 06:42:13 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85BC92690
        for <linux-media@vger.kernel.org>; Wed, 16 Aug 2023 03:42:02 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-4fe655796faso10269008e87.2
        for <linux-media@vger.kernel.org>; Wed, 16 Aug 2023 03:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692182521; x=1692787321;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EEOhlysOvfWNJvIb70cjtnJmAujK5omEn+wIvkrC/Ww=;
        b=Bbk0jbkCUL6Bw7ExFSdT/GvvQxOPYqWu2Qi9kKF3x77YR8kVSYKCk2aIpdDS+r6Cee
         uIuFolqUeIt/637IudG876aHUsAzoB2GYFQ+QZOoav2V7ANQtv29i6BhiBYK3WM4MeRt
         V9o3xWJFwXbTSpcbMFrWGLzNUakLQs//XQFb4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692182521; x=1692787321;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EEOhlysOvfWNJvIb70cjtnJmAujK5omEn+wIvkrC/Ww=;
        b=kjqAE1H8HDElf7vO+PzpMhsQndsmaBNNe7Pz9oIgtiMBLPnnacs33Q+gO1QT4sylfY
         dOmmqxmB672wHrZcpuDZTzmVjg4zDBYR4TfYd36zN7lrT/3r4QtYv/9BXddCvBk2Fldv
         ca0KMYQyC8Z+0LG4gW0Ea6Qjlm3tCOewx4UCbYhrdzDdQBdUMdFoupUrrTl6MyHB1LSM
         e1gwLBJKiIphX/vpyfhrATYm1ggQ83hfBCM/s3kLUY71JBS4nEvCtGEKEcW2eapH6UL/
         aYGJi5hySBEdiAsFIV2bcac+TexivhbQsMFi4uKBv4uYlZ/CySkIWM3f2guJuNEaCSqP
         gSoA==
X-Gm-Message-State: AOJu0YysT4qvxF8OvoUO9vA0V20tmGo5nC887alvzMx7dt5KyMb+2vaj
        6TV8yIyL5ZYp9qPIJYfbzG+Ssg==
X-Google-Smtp-Source: AGHT+IE0uEVDF8E5jme7kg4yNkE/yuuga1yCAg5iZ5Ktjjzp7BITPW2cpxAD8XTiTR9FW2SVEFDFYQ==
X-Received: by 2002:a05:6512:3d20:b0:4fb:8eec:ce49 with SMTP id d32-20020a0565123d2000b004fb8eecce49mr1765492lfv.31.1692182520687;
        Wed, 16 Aug 2023 03:42:00 -0700 (PDT)
Received: from localhost ([2620:0:1043:12:eef1:eea9:c836:8ed9])
        by smtp.gmail.com with UTF8SMTPSA id k20-20020ac257d4000000b004fe4d122a66sm2861403lfo.187.2023.08.16.03.41.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Aug 2023 03:42:00 -0700 (PDT)
From:   Stefan Adolfsson <sadolfsson@chromium.org>
X-Google-Original-From: Stefan Adolfsson <sadolfsson@google.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Benson Leung <bleung@chromium.org>,
        Guenter Roeck <groeck@chromium.org>,
        Reka Norman <rekanorman@chromium.org>,
        linux-media@vger.kernel.org, chrome-platform@lists.linux.dev,
        linux-kernel@vger.kernel.org,
        Stefan Adolfsson <sadolfsson@chromium.org>
Subject: [PATCH] media: cros-ec-cec: Add Constitution to the match table
Date:   Wed, 16 Aug 2023 12:41:25 +0200
Message-ID: <20230816104125.712370-1-sadolfsson@google.com>
X-Mailer: git-send-email 2.41.0.694.ge786442a9b-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Stefan Adolfsson <sadolfsson@chromium.org>

Constitution has two HDMI ports which support CEC:
    Port B is EC port 0
    Port A is EC port 1

This patch depends on "media: cros-ec-cec: Add Dibbi to the match
table".

Signed-off-by: Stefan Adolfsson <sadolfsson@chromium.org>
---
 drivers/media/cec/platform/cros-ec/cros-ec-cec.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/cec/platform/cros-ec/cros-ec-cec.c b/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
index 29f9a464857b..3c27349ce1d6 100644
--- a/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
+++ b/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
@@ -313,6 +313,8 @@ static const struct cec_dmi_match cec_dmi_match_table[] = {
 	{ "Google", "Lisbon", "0000:00:02.0", { "Port B" } },
 	/* Google Dibbi */
 	{ "Google", "Dibbi", "0000:00:02.0", { "Port D", "Port B" } },
+	/* Google Constitution */
+	{ "Google", "Constitution", "0000:00:02.0", { "Port B", "Port A" } },
 };
 
 static struct device *cros_ec_cec_find_hdmi_dev(struct device *dev,
-- 
2.41.0.694.ge786442a9b-goog

