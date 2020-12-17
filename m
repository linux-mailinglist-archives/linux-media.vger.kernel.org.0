Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 888302DD809
	for <lists+linux-media@lfdr.de>; Thu, 17 Dec 2020 19:15:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729756AbgLQSI3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Dec 2020 13:08:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727543AbgLQSI2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Dec 2020 13:08:28 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFA2CC061285;
        Thu, 17 Dec 2020 10:07:24 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id h205so16298937lfd.5;
        Thu, 17 Dec 2020 10:07:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=D7Hru9c4axCiAf9woJy53kOley4NvjvqF4UHux0sYDU=;
        b=kyDq0EA5RNjnC/fsGqPlDaSkTFdkQ+aqw9zOQ278D359QGyusE4zOZi7/yU1vKwcGQ
         vpJ6V2Z+uyc5+PsbGqXMmj32yPiZMBfr2bW5dP3z+WLef2EpuUnhsHInIWa/fhQ2B3y2
         b/wkwz65gc+3GqQhmGZtJwt2LgAXl4ye6zUVJ3UWJ+W4DXLe6IX/ctqQJGa6XdWmKU66
         oALXwrQzsPwwEIZTf/wbM0+pzW6uVQcEuREGIwzmv4qOqZ8Z2Rldnfmr+1KlYWjrk/ex
         93MMad/N8JlL4jTBBcVY5oIYa4BQhNZtGqXo+o1byzoqF2CAaljHENTN2kvQf2wsq2N7
         drag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=D7Hru9c4axCiAf9woJy53kOley4NvjvqF4UHux0sYDU=;
        b=j9o9URJbNXrhEIGrB6zqI0+IkChW/ZapFePiRpIYmC5Psc6+qB7ZTKXV7/m54GtRtR
         uaNBcQlKKvPpmH3OPWezZIIM9baAMuNeqovorl1N+I82AZOmCdovlGm7Q6gkeu5qeL7e
         WLVwrXN0JuxhWrmOG0uGc3vdUNaR+3WLNgwuGCdDTb5fdxW5N/p9Smr9TVxkN8/Q0Aea
         mp+X249uqfZio+lmC0+6tb+t1K4PCRluD960cyRhdCuc79MezBwhzDv/KD8gUT4rr3Co
         1CbqGXRp2m6AMhAZs8RHdRF3qQzzy75i50tPClC1lF0zVQiVyzt6qpo28RVtVz77IHuh
         0L5w==
X-Gm-Message-State: AOAM532gwBm08rCc8kOMiNMvLXPvC9AvzFzRaP6Y2HEyVTH7gT8ZY19j
        88V2/9RRbUXmjUqc616ppMU=
X-Google-Smtp-Source: ABdhPJyXeMpAOUP5Yrs/4jb7LSTsEn8j1plsmuT5R8wjgXCqnyhB5LwnYmxG5dzWY+sgDgnPDCNhTg==
X-Received: by 2002:a05:651c:2045:: with SMTP id t5mr211738ljo.462.1608228443423;
        Thu, 17 Dec 2020 10:07:23 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.gmail.com with ESMTPSA id u5sm655596lff.78.2020.12.17.10.07.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Dec 2020 10:07:22 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Peter Geis <pgwipeout@gmail.com>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Kevin Hilman <khilman@kernel.org>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Viresh Kumar <vireshk@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: [PATCH v2 03/48] dt-bindings: memory: tegra124: emc: Replace core regulator with power domain
Date:   Thu, 17 Dec 2020 21:05:53 +0300
Message-Id: <20201217180638.22748-4-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201217180638.22748-1-digetx@gmail.com>
References: <20201217180638.22748-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Power domain fits much better than a voltage regulator in regards to
a proper hardware description and from a software perspective as well.
Hence replace the core regulator with the power domain. Note that this
doesn't affect any existing DTBs because we haven't started to use the
regulator yet, and thus, it's okay to change it.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 .../bindings/memory-controllers/nvidia,tegra124-emc.yaml    | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra124-emc.yaml b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra124-emc.yaml
index 09bde65e1955..2ab42b05e198 100644
--- a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra124-emc.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra124-emc.yaml
@@ -37,9 +37,9 @@ properties:
     description:
       phandle of the memory controller node
 
-  core-supply:
+  power-domains:
     description:
-      Phandle of voltage regulator of the SoC "core" power domain.
+      Phandle to the SoC "core" power domain.
 
   operating-points-v2:
     description:
@@ -370,7 +370,7 @@ examples:
 
         nvidia,memory-controller = <&mc>;
         operating-points-v2 = <&dvfs_opp_table>;
-        core-supply = <&vdd_core>;
+        power-domains = <&domain>;
 
         #interconnect-cells = <0>;
 
-- 
2.29.2

