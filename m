Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7130A2AC88
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2019 00:27:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726326AbfEZWZ5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 May 2019 18:25:57 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:36962 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725788AbfEZWZ4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 May 2019 18:25:56 -0400
Received: by mail-wm1-f67.google.com with SMTP id 7so13953453wmo.2;
        Sun, 26 May 2019 15:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ky+CVe/5shquKmn2x9Mkd4t0sluqJy1OgxXU5TLlF8Y=;
        b=sPUyp9v+8Z9vQEkItY8c65gc4hEJo1CCryJxXjEdBdgRfT2MwtaViFBfAqvbTOfAJA
         /JfCsjccRQ8bYTwKOTfczCXgDfnCYj21+5+IVPeLjjZkPeezZNCwdoE00b6q9I1MzKhT
         bp4TYVKCMu+GBI28ErZcklCjb8AS2W7bnrxiRuVT4yGJZKCU8g+QxOhnXTFcBEwmXyPU
         c26Y6DzSLlLy+MePCkuTLC45BYWSRRsjnXKtqnvcyGwF05vRABib42Fd+DzUfk1u/CZ0
         IE5YiyYxBy5pkFuAuNo5wHhq25SVIe58MP5Ry62abf1ZZD8BsWwN/S9Dst3L+A/teMPG
         AMOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ky+CVe/5shquKmn2x9Mkd4t0sluqJy1OgxXU5TLlF8Y=;
        b=PyQDpC+Zry+B8XWgbSRnouVXKMmrd3NxxqXJIEnvyMIu4nD6yDd62xh5h0fu1jziC6
         HPD5lSSvlJ8e4png6JUcwPkd/TRH1MRhKxQ6JfPAGe83ocP6JDaM+BgP/8em8FV7XeL5
         7zl/uTFj84Jn3Pj5gIJZdks5OF9rz4BpE+GCeFSu0dWJZ7JySR1rHBzUDRQ3AJf47fHs
         8fjjt4X500t6ir2N5voddi7RIJVV6bKTsUwkmJ0rh6+H/4K7GMJ7YsSqXpZKTDmXe0Of
         4zh4drKnGVXPqKfra4D/BEA9xqEtxiCqTyBJ8Qa8WjemANdw1Iu03ThKzF6RZjOxlXfj
         VeZg==
X-Gm-Message-State: APjAAAVeXNxVAiONeo5r5Cpwm74QoPXcf7Q/rQspxo0YGF9Rb343finD
        mcfBvxjK+bYxvuXkoyK7JkqFyXe0umS4Zg==
X-Google-Smtp-Source: APXvYqyyd3PZUV8lPG0zWsqVsz5SNpdDjh7xV3aWAQkNiuXXvaMocqOTw1pYCTR4qThphBMnLW2HcQ==
X-Received: by 2002:a1c:f413:: with SMTP id z19mr2205565wma.145.1558909554617;
        Sun, 26 May 2019 15:25:54 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:1f1:d0f0::4e2b:d7ca])
        by smtp.gmail.com with ESMTPSA id o20sm10368398wro.2.2019.05.26.15.25.53
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 26 May 2019 15:25:53 -0700 (PDT)
From:   =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-sunxi@googlegroups.com,
        =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
Subject: [PATCH v2 10/10] arm64: defconfig: enable IR SUNXI option
Date:   Mon, 27 May 2019 00:25:36 +0200
Message-Id: <20190526222536.10917-11-peron.clem@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190526222536.10917-1-peron.clem@gmail.com>
References: <20190526222536.10917-1-peron.clem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Enable CONFIG_IR_SUNXI option for ARM64, so that Allwinner A64/H6 SoCs
can use their IR receiver controller.

Signed-off-by: Clément Péron <peron.clem@gmail.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 4d583514258c..5128029100d2 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -460,6 +460,7 @@ CONFIG_RC_CORE=m
 CONFIG_RC_DECODERS=y
 CONFIG_RC_DEVICES=y
 CONFIG_IR_MESON=m
+CONFIG_IR_SUNXI=m
 CONFIG_MEDIA_SUPPORT=m
 CONFIG_MEDIA_CAMERA_SUPPORT=y
 CONFIG_MEDIA_ANALOG_TV_SUPPORT=y
-- 
2.20.1

