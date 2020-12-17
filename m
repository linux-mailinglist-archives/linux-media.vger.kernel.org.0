Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A3302DD7F7
	for <lists+linux-media@lfdr.de>; Thu, 17 Dec 2020 19:15:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730085AbgLQSIm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Dec 2020 13:08:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725468AbgLQSIl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Dec 2020 13:08:41 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A669C0611CA;
        Thu, 17 Dec 2020 10:07:29 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id x20so40283664lfe.12;
        Thu, 17 Dec 2020 10:07:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yP8wRMt2G/dKkoQz0kDkh+VFFd+KrJNpavXd55zD7Hc=;
        b=Eevxt/jmSiXEagYpaEv4vTmdCIDS9N1+4fjs6XIYwYipyv36lpsy/C6pKYbwX3UiQu
         VAu1mRAoSEvOvC9CFXWr2nMYvvWgaq6SnOLErxU8ODNmC5j5jGOa6Ib2PM6ZcCqmH38P
         /ms4L91GUDsLbCwK3p/ykpA37+zlTT+eRvLma64wIszQWtha25BPEQkFpHNddqKyWQfT
         +buwKXxL3bX53bNkQosbcNQQk/A6YGx+HMISS5X5MXNlAcmh2539N1EunFi1fSgAdPPc
         lZu6y+bcf9lMXUeX6+mQg1Tjih0kF9Uxcyo55RH6sXDp4bTnJ3oHXwSLox21wctsWd9N
         I+6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yP8wRMt2G/dKkoQz0kDkh+VFFd+KrJNpavXd55zD7Hc=;
        b=oWIKftE5r1ZoIYmVBnTe3LHD9lGC423gw40PZ3CtayCQbZaUKyl/NytWjgVeT/s5Q+
         6pyG6nW9C1IwfjtOBSrIlztIgWvLsMvSsWcbw9uGhz1MS9H14twnqZZrMApS4+3EO8k6
         2Km/+p/1UkPxWqRYx61sGRKzK+STnFeF+H5Rs6dk8/I5imB1jILB8PMEDQvq9ghH3EHe
         5Owl3A/T0kaRRvlXxxSI6xq+0tNnBHwp5FDxaNpzjYedoCZ3aOzikxzNXbfgX07yKlGX
         RC+RxDB3DokUtd0zG614/cqbzl+IP44JaCm3FFM23zn8HbSBq7L5zdxxOQeXSWmTRqeW
         oHkw==
X-Gm-Message-State: AOAM5327ECEZQoAnAP/puuTg0xB+KFJfG6epg43TTlAm6Q6Q8hNw/N7t
        2Dw95jf2/IfMbr9MFzkiwfk=
X-Google-Smtp-Source: ABdhPJxW3mip7l7QnT2EdI9cbqOdB8U51k+kpDGMuuvT5UJhcE0JXjG8oIyqWzLDIWmT1OVJbpI9yg==
X-Received: by 2002:a19:c3c2:: with SMTP id t185mr1565lff.104.1608228448105;
        Thu, 17 Dec 2020 10:07:28 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.gmail.com with ESMTPSA id u5sm655596lff.78.2020.12.17.10.07.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Dec 2020 10:07:27 -0800 (PST)
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
Subject: [PATCH v2 07/48] dt-bindings: arm: tegra: Add binding for core power domain
Date:   Thu, 17 Dec 2020 21:05:57 +0300
Message-Id: <20201217180638.22748-8-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201217180638.22748-1-digetx@gmail.com>
References: <20201217180638.22748-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

All NVIDIA Tegra SoCs have a core power domain where majority of hardware
blocks reside. Add binding for the core power domain.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 .../arm/tegra/nvidia,tegra20-core-domain.yaml | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-core-domain.yaml

diff --git a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-core-domain.yaml b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-core-domain.yaml
new file mode 100644
index 000000000000..f3d8fd2d8371
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-core-domain.yaml
@@ -0,0 +1,48 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/tegra/nvidia,tegra20-core-domain.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NVIDIA Tegra Core Power Domain
+
+maintainers:
+  - Dmitry Osipenko <digetx@gmail.com>
+  - Jon Hunter <jonathanh@nvidia.com>
+  - Thierry Reding <thierry.reding@gmail.com>
+
+properties:
+  compatible:
+    enum:
+      - nvidia,tegra20-core-domain
+      - nvidia,tegra30-core-domain
+
+  operating-points-v2:
+    description:
+      Should contain level, voltages and opp-supported-hw property.
+      The supported-hw is a bitfield indicating SoC speedo or process
+      ID mask.
+
+  "#power-domain-cells":
+    const: 0
+
+  power-supply:
+    description:
+      Phandle to voltage regulator connected to the SoC Core power rail.
+
+required:
+  - compatible
+  - operating-points-v2
+  - "#power-domain-cells"
+  - power-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    core-domain {
+        compatible = "nvidia,tegra20-core-domain";
+        operating-points-v2 = <&opp_table>;
+        power-supply = <&regulator>;
+        #power-domain-cells = <0>;
+    };
-- 
2.29.2

