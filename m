Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 44DEEA7FF7
	for <lists+linux-media@lfdr.de>; Wed,  4 Sep 2019 12:05:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728878AbfIDKFv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Sep 2019 06:05:51 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:39760 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727722AbfIDKFv (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 Sep 2019 06:05:51 -0400
Received: by mail-wm1-f68.google.com with SMTP id q12so1143812wmj.4
        for <linux-media@vger.kernel.org>; Wed, 04 Sep 2019 03:05:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=486/gvgoDnlSbRdfttJfj6D0s5Zap39wELCPW9OE2nU=;
        b=ggoB7Wze0TRV1OMGugmOmjFK0Qx4b/4zQP8X6BsRkN8sgLwE5nt4+gdevc4m8gL+V2
         Dz2G/nwq6jPb6bcCL35EE9KMHCV1Ai9XlcVoo2jxDl2GvW5BePnT8bjoI2PhjgF51z/K
         s445rLw7t0gdorrs6ikC6+hVcvCOL34ZvWHOt/4wfwy0K86guEU4ZR7fb3GFwytaVyWV
         cOW3Ak0c87qiCRZ8cyanTNH/aiehfcT3UIrxWymMLf7XVQhcLxZaKqz1j7jt4d9GFJyN
         9+WrueiaBjQ3GJECSge7nclcRF+8enyMpE7wNbNmZrA27BVQMHf+T7fNkjeJsy+KvyPJ
         VI7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=486/gvgoDnlSbRdfttJfj6D0s5Zap39wELCPW9OE2nU=;
        b=LiQMskRSjvHfPLpgAwD7u6sKSUU4t+h+Vt+qgH4y07czoF33AqAqOy5dqQBRq5qDX2
         aTJPMFXDhUZLaG7knldTjQbEM/CO9dk6nWj2Wc8wNXPMfe5sCTAbQrmMgq12+ZJpNJjb
         Y3okO+zIArQYNN1DJ7s0RzdUDS0AahwNXwJm4RaTqTAt+DhqkFC+QqLI0NpKBa0qNyJo
         soumNz2rhSTEJNEdR1Wl0NGEjaaKVZ0Zn1f42ndimSDSGYAOrVBidVB9I3qxIuh57byS
         4invFC0jnKLpxzEoe/hvOgcg0av8qYlUN/7zixKTYePUlvlWbInzOWfIwKAIhhxx1Sd2
         Fdpw==
X-Gm-Message-State: APjAAAVoLkFyGbjZ+3levAhPWDFtlRX+amdpCSACzXdNwSzC/tEsDzvr
        bNWZu7ZSypmEqgWXImLyNY0mYA==
X-Google-Smtp-Source: APXvYqx3Dzozbn+BMM59qFOQuag+OJBl55QgA+LzCJHnL6FfVf9J7WAi2f4A3r6LFxhYq39nuvt1Ig==
X-Received: by 2002:a05:600c:24d0:: with SMTP id 16mr3528951wmu.83.1567591549254;
        Wed, 04 Sep 2019 03:05:49 -0700 (PDT)
Received: from lpoulain-ThinkPad-T470p.home (lfbn-tou-1-177-187.w86-201.abo.wanadoo.fr. [86.201.27.187])
        by smtp.gmail.com with ESMTPSA id s12sm14219706wra.82.2019.09.04.03.05.48
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Wed, 04 Sep 2019 03:05:48 -0700 (PDT)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     stanimir.varbanov@linaro.org, agross@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH] media: venus: core: Fix msm8996 frequency table
Date:   Wed,  4 Sep 2019 12:06:58 +0200
Message-Id: <1567591618-22467-1-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In downstream driver, there are two frequency tables defined,
one for the encoder and one for the decoder:

/* Encoders /
<972000 490000000 0x55555555>, / 4k UHD @ 30 /
<489600 320000000 0x55555555>, / 1080p @ 60 /
<244800 150000000 0x55555555>, / 1080p @ 30 /
<108000 75000000 0x55555555>, / 720p @ 30 */

/* Decoders /
<1944000 490000000 0xffffffff>, / 4k UHD @ 60 /
< 972000 320000000 0xffffffff>, / 4k UHD @ 30 /
< 489600 150000000 0xffffffff>, / 1080p @ 60 /
< 244800 75000000 0xffffffff>; / 1080p @ 30 */

It shows that encoder always needs a higher clock than decoder.

In current venus driver, the unified frequency table is aligned
with the downstream decoder table which causes performance issues
in decoding scenarios. Fix that by aligning frequency table on
worst case (encoding).

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
---
 drivers/media/platform/qcom/venus/core.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 0acc757..1e80689 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -427,10 +427,11 @@ static const struct venus_resources msm8916_res = {
 };
 
 static const struct freq_tbl msm8996_freq_table[] = {
-	{ 1944000, 490000000 },	/* 4k UHD @ 60 */
-	{  972000, 320000000 },	/* 4k UHD @ 30 */
-	{  489600, 150000000 },	/* 1080p @ 60 */
-	{  244800,  75000000 },	/* 1080p @ 30 */
+	{ 1944000, 490000000 },	/* 4k UHD @ 60 (decode only) */
+	{  972000, 490000000 },	/* 4k UHD @ 30 */
+	{  489600, 320000000 },	/* 1080p @ 60 */
+	{  244800, 150000000 },	/* 1080p @ 30 */
+	{  108000,  75000000 },	/* 720p @ 30 */
 };
 
 static const struct reg_val msm8996_reg_preset[] = {
-- 
2.7.4

