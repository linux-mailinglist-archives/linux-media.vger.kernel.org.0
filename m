Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 708AC11E497
	for <lists+linux-media@lfdr.de>; Fri, 13 Dec 2019 14:30:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727387AbfLMNaD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Dec 2019 08:30:03 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:36957 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727412AbfLMNaB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Dec 2019 08:30:01 -0500
Received: by mail-wm1-f68.google.com with SMTP id f129so6578700wmf.2
        for <linux-media@vger.kernel.org>; Fri, 13 Dec 2019 05:30:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=CgnEiw//WJHGzufAg0EVPn2uPGD0ymse5mrY0tAd6l4=;
        b=vOOpviAxpLRGWbDnsRDeW/Z1cMyneMze+jcUF80fZMjE8m6MgW1/3+1igyAiE8jaQZ
         sd0ebigH6c+U2qkc0FI8CrJdSX8t/BFyvVanWL+z/ZwFmiq8KMr6hU04tpRbTrysoWaa
         yoPfSR4+yq0vvpWheb1LEqa6KrqxM4/w1DHAbcWu6R2h7cUrw86N2hRISkX0Sqf11C5/
         tomV/QGS/iS3FPhs4Qvi1TeuZWNaa5y1JuD7iZ079m1bD5Zbm6JGMM/bbeJrhG+RBg4J
         V4ST4UPBQEhdvtiaiIlEFYgjErWwFvWkj9ry2CB3q4X2skuv5zdQMWGc0Xopg/dgE4z+
         fPxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=CgnEiw//WJHGzufAg0EVPn2uPGD0ymse5mrY0tAd6l4=;
        b=VxacORRPwIzhUAxfVkPfC6f2Iu5yNd4IAMu9RT/kgnnUIi7pObKJh/iwP2S/+d5t7Q
         8+hiiB9XiqbEbqcOF2Fty2atHeg4e+2sfKAKxUxdLUUSjf1Kgb3qNmvqRmSbsI8+/seD
         2IPXdsBmP5zbdDum16Af9rw6Gq6XOtkCBtDdwQVkcAwQjbsxXLdecQWqxDNgtAGbd78o
         oPNQxS+ZmyhZVzj5pUES/i00X51AX5/iYH7xJwmI5a0N8kaKUdwlzfqCRkB+L7zinY/o
         4bCLtVjM1li0e4OuCrFDZF06TJVDhVXAGuWZdMxGeOPbFamobWzwMoC+TsUZfI5oiU6J
         jq3A==
X-Gm-Message-State: APjAAAVf0PdPmwzqI3wrSKfEWcjcdpXILS3dnYbA4db5aJ2oNhJ6efL0
        oliqK35K127GjaRTxFgLstugrQ==
X-Google-Smtp-Source: APXvYqys8/RNfak7NGL62z6NcWptRE36wV1YR+wvRxs1Ya8mDCpWIYIyNly0sr/UON3XlfgQlSltTw==
X-Received: by 2002:a05:600c:149:: with SMTP id w9mr12997218wmm.132.1576243799677;
        Fri, 13 Dec 2019 05:29:59 -0800 (PST)
Received: from localhost.localdomain ([2a01:cb1d:6e7:d500:82a9:347a:43f3:d2ca])
        by smtp.gmail.com with ESMTPSA id n3sm10540543wmc.27.2019.12.13.05.29.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2019 05:29:59 -0800 (PST)
From:   Guillaume La Roque <glaroque@baylibre.com>
To:     narmstrong@baylibre.com, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl, khilman@baylibre.com,
        devicetree@vger.kernel.org
Cc:     linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] media: dt-bindings: media: meson-ao-cec: Add support of ao-sysctrl syscon
Date:   Fri, 13 Dec 2019 14:29:54 +0100
Message-Id: <20191213132956.11074-2-glaroque@baylibre.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191213132956.11074-1-glaroque@baylibre.com>
References: <20191213132956.11074-1-glaroque@baylibre.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

ao-sysctrl syscon phandle property is needed for CEC wakeup support.
This property is optional.

Tested-by: Kevin Hilman <khilman@baylibre.com>
Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
---
 .../devicetree/bindings/media/amlogic,meson-gx-ao-cec.yaml    | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/amlogic,meson-gx-ao-cec.yaml b/Documentation/devicetree/bindings/media/amlogic,meson-gx-ao-cec.yaml
index 41197578f19a..1f721498d249 100644
--- a/Documentation/devicetree/bindings/media/amlogic,meson-gx-ao-cec.yaml
+++ b/Documentation/devicetree/bindings/media/amlogic,meson-gx-ao-cec.yaml
@@ -32,6 +32,10 @@ properties:
     allOf:
       - $ref: /schemas/types.yaml#/definitions/phandle
 
+  amlogic,ao-sysctrl:
+    description: phandle to the ao-sysctrl syscon
+    $ref: '/schemas/types.yaml#/definitions/phandle'
+
 allOf:
   - if:
       properties:
-- 
2.17.1

