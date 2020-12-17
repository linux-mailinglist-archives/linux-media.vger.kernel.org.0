Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66DCC2DD788
	for <lists+linux-media@lfdr.de>; Thu, 17 Dec 2020 19:14:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731480AbgLQSK2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Dec 2020 13:10:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731045AbgLQSJR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Dec 2020 13:09:17 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A711C061A4A;
        Thu, 17 Dec 2020 10:08:13 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id o17so56905161lfg.4;
        Thu, 17 Dec 2020 10:08:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DnMa2cBERwNvCshkcZIGtYzUizYdSDwH8+FlINjZS+o=;
        b=nGBDtC0LssrkA/xgl49FxWqeuomEM/+ArFanzMzMEGA7xk46eJqVrlO5N6wN2JQXgx
         ASIENxqpmVpFuK7ESxAwjXOiTyJkEmnG6qv7SDFaU0BynG17CnhPdmVlEPOoqGl4mm6N
         +MxaC6pdEu65jWYzV6zRgWGYFLns79jXe8fGVRmiXJ9lvisZbWIOaptqSP35tbVTuqjZ
         GWnXCIBG32kJYzpS4w5GOp74lTeeLOFOgS+Ce4ahS6jgn0biV+2+7pT7nYpr3vOR20Mo
         SEpvYMg9qqttuOc5EiuBgetb2icZ++FBfLBVG1YoVBG/OymCXngPlGOmB/uUD5M+spu4
         VeTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DnMa2cBERwNvCshkcZIGtYzUizYdSDwH8+FlINjZS+o=;
        b=pmdVKIE5AoGeuk4VP+G3zQdLfagW3zF0IpO9goYVBmZpdSMOadJ2/z75L3xXO1/c1Z
         eFv/641xMVMijHwbKHTDTUoxm5p/FOvnlXK6CFFrqIxLKj/juN3HsPXwADhMa9ObgvZY
         61ByqWoQEcWdgRtCgZCiET6/ErN+E2xfOxI6kpK2JllcH4BOrIT4E+V6iBP74jZdZQf3
         ZjoiuUJizN65R81lffm5aWx7MtWv3CsJv41J+rO4fidXuk0nRK+2UsYfc7qo/n+nP5h8
         Z3RkafMVBsPRdx262h4LU1VV15rjts6CrwG66Cpe/I5ky569TphQn+V8iwMH+xHJmAGm
         7R+A==
X-Gm-Message-State: AOAM530EkEVWiAkNQXuwyxb64rhZm9XeNAgMJf/CFM99/jg29Oc/9YNm
        uZJO2WYPZbutGNcB+InoBHM=
X-Google-Smtp-Source: ABdhPJxK1jf/bwqucZvsz55FDatdpoVwAeTBPQ/w/sO44sRzQ468CuHtA9cdQUMcur4nHvtg9vjUgA==
X-Received: by 2002:a05:651c:120f:: with SMTP id i15mr214039lja.339.1608228492131;
        Thu, 17 Dec 2020 10:08:12 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.gmail.com with ESMTPSA id u5sm655596lff.78.2020.12.17.10.08.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Dec 2020 10:08:11 -0800 (PST)
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
Subject: [PATCH v2 45/48] ARM: tegra: acer-a500: Enable core voltage scaling
Date:   Thu, 17 Dec 2020 21:06:35 +0300
Message-Id: <20201217180638.22748-46-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201217180638.22748-1-digetx@gmail.com>
References: <20201217180638.22748-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Allow lower core voltages on Acer A500.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/boot/dts/tegra20-acer-a500-picasso.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts b/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts
index 78b307370a46..6b851cab0efa 100644
--- a/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts
+++ b/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts
@@ -578,7 +578,7 @@ sys_reg: sys {
 
 				vdd_core: sm0 {
 					regulator-name = "vdd_sm0,vdd_core";
-					regulator-min-microvolt = <1200000>;
+					regulator-min-microvolt = <950000>;
 					regulator-max-microvolt = <1300000>;
 					regulator-coupled-with = <&rtc_vdd &vdd_cpu>;
 					regulator-coupled-max-spread = <170000 550000>;
@@ -619,7 +619,7 @@ ldo1 {
 
 				rtc_vdd: ldo2 {
 					regulator-name = "vdd_ldo2,vdd_rtc";
-					regulator-min-microvolt = <1200000>;
+					regulator-min-microvolt = <950000>;
 					regulator-max-microvolt = <1300000>;
 					regulator-coupled-with = <&vdd_core &vdd_cpu>;
 					regulator-coupled-max-spread = <170000 550000>;
-- 
2.29.2

