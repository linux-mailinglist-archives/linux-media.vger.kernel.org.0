Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0758132517
	for <lists+linux-media@lfdr.de>; Sun,  2 Jun 2019 23:44:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727266AbfFBVol (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 2 Jun 2019 17:44:41 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:36832 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726786AbfFBVok (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 2 Jun 2019 17:44:40 -0400
Received: by mail-lf1-f65.google.com with SMTP id q26so11995112lfc.3;
        Sun, 02 Jun 2019 14:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=v8z6rRyWnHKBHTgKVhKWAyQ8XR13rNpWMzD0eUYSFO0=;
        b=OiCbszUXlmN6Tzhfkv1LwVF4TPTvleSZ7mCi1x0wtGf1dtlipNsDfa/d+e9QrykZ9N
         EbF/ejBx8pnOX4KBCQx9LTlTAydPScDE/BgumKbk1MQOprn9D+Vi68Ab+ardIySV+UVr
         BjRR+s+vVfb6tzIlhxKO9v15ZtETWhSpL0KQ63+bvz3Ga3hutTBPcrM8IdW5nMZvnDgB
         +o6STAuD+ofam0vnf5Y0maIyX7DufRTl32/mXfHJJwSCO0CNJaj18RTPeuEIx8Y2UVc6
         OmBkylgIf8G3FP6LLTGtVR+MLjj+TCHRvC1DRLGkTOcuQ7bQ7aKs6908zUPZctpekNDo
         B7kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=v8z6rRyWnHKBHTgKVhKWAyQ8XR13rNpWMzD0eUYSFO0=;
        b=CwmCnC+jbKdNGh3EAA5WwNBZJ0YZ4b7qfevSU4mn+GtsfZZUNPISEWB/7swcQYTQqV
         WvUjNlpfLXDfhZ+1GhhryGux1iOwzIgVTs56xpmpgM+WQU3b27SOMdFBPxhVk6mcjKi5
         WyMbR9N8gKJpjjSuCwvHbBxOzDB6AuubXWZYAnOTA0RtcqGfztHiqf1G0jGazWmUQ4OK
         6C9Pa5Ab2/ZRw3DiVsPs4RqQ6pMk+SjmdwtF5NQSFyP3hl9UUHLHQl/sVLsRBc59hwJO
         wUrfBcvCoLPjZkEzHe7dqHRLeJuLdwLoNHuPyPYXVn70+LNgl0rfBTwuOb/Rg+UJL+Is
         wL9Q==
X-Gm-Message-State: APjAAAWKjUrHc8sLLOYjN8w5L4C1rqhai9ak+jxdi5hKTH+1U/efG1yZ
        ps2ZeSa2O9CQMjjGvs+KAnOSH3m/
X-Google-Smtp-Source: APXvYqzyORzjm83J0I4MlzrRe1oyXZ2OeIj8QffTLOl0ldVu/NN8oUgdlQ840HpNzpsQXplba0WRaA==
X-Received: by 2002:ac2:43b7:: with SMTP id t23mr11501647lfl.110.1559511878164;
        Sun, 02 Jun 2019 14:44:38 -0700 (PDT)
Received: from localhost.localdomain ([94.29.35.141])
        by smtp.gmail.com with ESMTPSA id g22sm2803653lje.43.2019.06.02.14.44.36
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 02 Jun 2019 14:44:37 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v1] ARM: dts: tegra30: Connect SMMU with Video Decoder Engine
Date:   Mon,  3 Jun 2019 00:37:06 +0300
Message-Id: <20190602213712.26857-2-digetx@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190602213712.26857-1-digetx@gmail.com>
References: <20190602213712.26857-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Enable IOMMU support for the video decoder.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/boot/dts/tegra30.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/tegra30.dtsi b/arch/arm/boot/dts/tegra30.dtsi
index 934caa83c8db..ce162125e7bf 100644
--- a/arch/arm/boot/dts/tegra30.dtsi
+++ b/arch/arm/boot/dts/tegra30.dtsi
@@ -424,6 +424,7 @@
 		clocks = <&tegra_car TEGRA30_CLK_VDE>;
 		reset-names = "vde", "mc";
 		resets = <&tegra_car 61>, <&mc TEGRA30_MC_RESET_VDE>;
+		iommus = <&mc TEGRA_SWGROUP_VDE>;
 	};
 
 	apbmisc@70000800 {
-- 
2.21.0

