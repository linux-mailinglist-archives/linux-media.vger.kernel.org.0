Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7A5BD11D04F
	for <lists+linux-media@lfdr.de>; Thu, 12 Dec 2019 15:59:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729082AbfLLO7b (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Dec 2019 09:59:31 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:39887 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728964AbfLLO7a (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Dec 2019 09:59:30 -0500
Received: by mail-wm1-f67.google.com with SMTP id d5so2851887wmb.4
        for <linux-media@vger.kernel.org>; Thu, 12 Dec 2019 06:59:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Ac9PpPgQ/84i6pezXabxCQJUJWE1oGmfoqB8QI/gWCA=;
        b=dZcgLnNG3uYFgy6p80XmLl3qh+7E3BAQitI3+SR9eKqYAPkjfo95LtHK3USmkYHo50
         AawUALYM+B6a9KUj32JVT/yMJJ98eOmyat2sNM3CxhF3gRX0hCs19y26yN9JNaChJ2Vy
         OdEn0/d/YyS0kFNWPO84pRTr8S1Hv1ZWy8Vgp+rL+eGdCIcWQq7VVHgwCSCjPall2Bse
         iwsiZ73eWKDn80coakwDxHbqO1FafBda38kYY80Ubz6OHu/6C/InoLkI7jQxe5llbW99
         ISY3T0HiO/Lszoq4IsEkE9ZqlFlHMWJ1oAABHkopJKE8D6ZD9OdMw4lff6laB8O/lUD7
         vwAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Ac9PpPgQ/84i6pezXabxCQJUJWE1oGmfoqB8QI/gWCA=;
        b=mi9VipiKJHbp2Agzrwyc9O10ZHH3R99+yXF1gWjcczej08YGL6k7/ayXOAbFr3NyaP
         EJx8DhhNUQxdwxoSunO9iCEW9M/RYL1x9rVO86TcXw3JaDHODA5RIudNXUpaD0SI2toz
         2c4iL8KTAlVOfricFAHpV5WGdvBfYOpgfDr+yM1zI8d40L5KHwlIYCu0zyVxxAA6OeNC
         jD22y202mghn/KY6PaCATqLbvUI8r+wpo6cdNYsxmbRCCDRLjNXBS3ns8NkX4gG1wmCq
         2ZBpy2UjoAUZL6nY4UZqyBImP8nxdIfXBiKFuy/fe0togWmqPcYeVrpt3XgPb/lYUX6c
         Ciyg==
X-Gm-Message-State: APjAAAX4ZWI2rNLByB5VBmvmnBB/Lc6177ItlDBFFBgIwKxCm/BarRUh
        qej51KdWctYXeQtI/0L0zdx+hw==
X-Google-Smtp-Source: APXvYqz2EGJjniScqk1Lxu2Wl0Wslazw8x8Ill6fOn6GyF/VZNUHKYjPi5ScqDMGw6WkrreVEEsg3A==
X-Received: by 2002:a1c:49c2:: with SMTP id w185mr6903909wma.138.1576162768162;
        Thu, 12 Dec 2019 06:59:28 -0800 (PST)
Received: from glaroque-ThinkPad-T480.baylibre.local (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id h8sm6670292wrx.63.2019.12.12.06.59.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2019 06:59:27 -0800 (PST)
From:   Guillaume La Roque <glaroque@baylibre.com>
To:     narmstrong@baylibre.com, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl, khilman@baylibre.com,
        devicetree@vger.kernel.org
Cc:     linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] media: dt-bindings: media: meson-ao-cec: Add support of ao-sysctrl syscon
Date:   Thu, 12 Dec 2019 15:59:23 +0100
Message-Id: <20191212145925.32123-2-glaroque@baylibre.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191212145925.32123-1-glaroque@baylibre.com>
References: <20191212145925.32123-1-glaroque@baylibre.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

ao-sysctrl syscon phandle property is needed for CEC wakeup support.
This property is optional.

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

