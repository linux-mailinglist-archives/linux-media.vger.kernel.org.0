Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B7BD2DD7FF
	for <lists+linux-media@lfdr.de>; Thu, 17 Dec 2020 19:15:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731739AbgLQSN6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Dec 2020 13:13:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729976AbgLQSIa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Dec 2020 13:08:30 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BA72C061257;
        Thu, 17 Dec 2020 10:07:27 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id l11so59857334lfg.0;
        Thu, 17 Dec 2020 10:07:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TJhYseBJYkwEkfQOyblPdMpOOHz4A7k16XFAy7Oga6w=;
        b=F5gtx0dqcxZkkcTo7UWZnaw7Qj9Ra9yO77AeY5iLggl9m6erRwHxn4BW1pJ97VJKGq
         YcV+1PWkv4C8mO3HuprA0toW5oQVPvXyvypDcHfQ3LBMW/83TcsKkn75giHcRn87HTw6
         QHwCfKcwAJgFjFtNJWyVh1MOkNixWO0nCb0tiEwngi5LyZ7owU4oF7G1k/+5HCx3qSNJ
         lCmnEQPNPTiNBzucIDBPweD4miL9n3PayTyhzS4PPj+lRRFXYO6GgrVItV4NhaeW9pUD
         tZEr43oWkWFIJ+ExDBzEDwy7s8y7AfoiZuB0VBikcGqe27kygYQJ0VNNhK+CFDbU67Dt
         ggHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TJhYseBJYkwEkfQOyblPdMpOOHz4A7k16XFAy7Oga6w=;
        b=trMK2ChBX0g8gz3s9E+MNRORh++wvs2/c521BYozbT+b7u+Qd6+QSV/P5I/ViTsvBd
         A5O425cqElDuHIgVeU/zno8sW5PD86nloPUjJpI4djUOLfRKXYnNohjStgowEIMJ4wN/
         dSN251dg7yFMNMVbKwUv42js/uiRSk/3Iy9D/VLT9cGvvbgW1NN/UEzpRiwUT2RNSMMu
         JFzIeI8Ady9+0XKJxPz6CXDxyT20mrfk+IoscQigfD1XDpAf/EJMd/4KrA19syA44wT1
         ZnsYsPVyuXHOG7u9hhG2HYwXiLOP/dwXCPv4UTloq1REpNUc7UwCwseEKVjDkzrTqML5
         er8Q==
X-Gm-Message-State: AOAM532VDZCaLgk4oSDGOxR6/Yidi7JoCrIHUz41X8VCTh4FnOpWObi/
        aKthjp2CUXuVd9Uc8zSi+Sc=
X-Google-Smtp-Source: ABdhPJwIgGAwCQwaSYDTBeW0kNDGf+AD0VQyaJlAS233nqerThHuruFM4Tg3UsndwI906n0c5dBsSA==
X-Received: by 2002:a2e:b558:: with SMTP id a24mr212325ljn.328.1608228445790;
        Thu, 17 Dec 2020 10:07:25 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.gmail.com with ESMTPSA id u5sm655596lff.78.2020.12.17.10.07.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Dec 2020 10:07:25 -0800 (PST)
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
Subject: [PATCH v2 05/48] media: dt: bindings: tegra-vde: Document OPP and power domain properties
Date:   Thu, 17 Dec 2020 21:05:55 +0300
Message-Id: <20201217180638.22748-6-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201217180638.22748-1-digetx@gmail.com>
References: <20201217180638.22748-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Document new DVFS OPP table and power domain properties of the video
decoder engine.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 .../devicetree/bindings/media/nvidia,tegra-vde.txt   | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/nvidia,tegra-vde.txt b/Documentation/devicetree/bindings/media/nvidia,tegra-vde.txt
index 602169b8aa19..02fe2af3bd13 100644
--- a/Documentation/devicetree/bindings/media/nvidia,tegra-vde.txt
+++ b/Documentation/devicetree/bindings/media/nvidia,tegra-vde.txt
@@ -36,6 +36,16 @@ Optional properties:
 - reset-names : Must include the following entries:
   - mc
 - iommus: Must contain phandle to the IOMMU device node.
+- operating-points-v2: See ../bindings/opp/opp.txt for details.
+- power-domains: Phandle to VDEC power domain.
+
+For each opp entry in 'operating-points-v2' table:
+- opp-supported-hw: One bitfield indicating:
+	On Tegra20: SoC process ID mask
+	On Tegra30+: SoC speedo ID mask
+
+	A bitwise AND is performed against the value and if any bit
+	matches, the OPP gets enabled.
 
 Example:
 
@@ -61,4 +71,6 @@ video-codec@6001a000 {
 	reset-names = "vde", "mc";
 	resets = <&tegra_car 61>, <&mc TEGRA20_MC_RESET_VDE>;
 	iommus = <&mc TEGRA_SWGROUP_VDE>;
+	operating-points-v2 = <&dvfs_opp_table>;
+	power-domains = <&domain>;
 };
-- 
2.29.2

