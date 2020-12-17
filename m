Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6C1A2DD6E5
	for <lists+linux-media@lfdr.de>; Thu, 17 Dec 2020 19:08:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728966AbgLQSIC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Dec 2020 13:08:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728081AbgLQSIB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Dec 2020 13:08:01 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF6D1C06138C;
        Thu, 17 Dec 2020 10:07:20 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id a12so59834105lfl.6;
        Thu, 17 Dec 2020 10:07:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cl0K+0TJ44kvt29rpR6eiUIQXd8X64NWC+nXmDDHd1E=;
        b=MuUFzZ0hzx33koe8Q6SIGZb5hKTQFzBpBJUqh/SixgLOznrLg7KOMWUpURY+xeV5Hx
         k/U2399Zm9gNeQBBswlgsbKInco0EB6omSTVgO9I39a9yEFyNbqx2xScbrINdw4W49qY
         oiKEDur9FjWfspdRBhJVowgv3c0OeHonvL9BobDtgnQY/086LE0DqE29kK45w1BEDk7I
         zzqJiWQFQ1bVlAlIio0abJ+fAaM3fA84dpqAwotrs+rIc80eNPDuZdkjvHELUM24Caal
         /nFPceaxGOpDV1296lZGIWzVC+Jwil9tc0hiEppkOjRemaz3NCAyDRkyMJl/pkge85aG
         auXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cl0K+0TJ44kvt29rpR6eiUIQXd8X64NWC+nXmDDHd1E=;
        b=LtqGCz8fDZAG08mp5IocYtJ44kTKsj1VOsxDu88sy5pi+r7X0Kk0+hAewf/NNMktLS
         QMiFixGiilXefu0SPIvTkCFNl9syAf5BogbZOLHVHUyKA1DPVDj5Oxd9zdtvg7YV6lWr
         DFKl6I75B5KqZ/DcW196tyx6MzEQHYIbwGlHLqImTx1MJaZ/a0A1xY8dNzUn30WI/hNX
         HHJgutMEUYKeD+A4CvlPfDLtqySSNSqDfl+c6UBPNQXtsnKavIeV8++t8mylT9cVMhf+
         rbKXMpMIhGMCthFXZuCxvMMM5g1DcK/ouLq3IkyXyhBvmQWBl3Jbf/S4YYvA5oYIjWIu
         oF9w==
X-Gm-Message-State: AOAM5338+MGZ6PAsdr6Zc3k4mk42VV9vprqpaQyKfAFu29lXRukrg1Gr
        0DLFysxPObewmELpjVcKAKM=
X-Google-Smtp-Source: ABdhPJxPFZeRibTS1CFC1H/daUZkN+6BWmcuzHohtcds5PZPgAc+ohRMJgojJ6j8E/2dmWtFFWDUxg==
X-Received: by 2002:a2e:b0d3:: with SMTP id g19mr207999ljl.279.1608228439106;
        Thu, 17 Dec 2020 10:07:19 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.gmail.com with ESMTPSA id u5sm655596lff.78.2020.12.17.10.07.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Dec 2020 10:07:18 -0800 (PST)
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
Subject: [PATCH v2 01/48] dt-bindings: memory: tegra20: emc: Replace core regulator with power domain
Date:   Thu, 17 Dec 2020 21:05:51 +0300
Message-Id: <20201217180638.22748-2-digetx@gmail.com>
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
 .../bindings/memory-controllers/nvidia,tegra20-emc.txt        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-emc.txt b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-emc.txt
index cc443fcf4bec..143439b50c92 100644
--- a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-emc.txt
+++ b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-emc.txt
@@ -23,7 +23,7 @@ For each opp entry in 'operating-points-v2' table:
 	matches, the OPP gets enabled.
 
 Optional properties:
-- core-supply: Phandle of voltage regulator of the SoC "core" power domain.
+- power-domains: Phandle to the SoC "core" power domain.
 
 Child device nodes describe the memory settings for different configurations and clock rates.
 
@@ -48,7 +48,7 @@ Example:
 		interrupts = <0 78 0x04>;
 		clocks = <&tegra_car TEGRA20_CLK_EMC>;
 		nvidia,memory-controller = <&mc>;
-		core-supply = <&core_vdd_reg>;
+		power-domains = <&domain>;
 		operating-points-v2 = <&opp_table>;
 	}
 
-- 
2.29.2

