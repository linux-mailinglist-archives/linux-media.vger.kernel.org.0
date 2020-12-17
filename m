Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1B4C2DD74A
	for <lists+linux-media@lfdr.de>; Thu, 17 Dec 2020 19:14:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730939AbgLQSJO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Dec 2020 13:09:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730915AbgLQSJN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Dec 2020 13:09:13 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F1DAC061142;
        Thu, 17 Dec 2020 10:08:06 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id m25so59783468lfc.11;
        Thu, 17 Dec 2020 10:08:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wuUSQP0OtIE+mP7axrK+mquBQR4cpQ2zlYIqVpImR1U=;
        b=MZKp8LNgdIqZ2QOb3p3qyevaT+0a/84boORQxHR3hMaNXrSC3gadV90vMzkpXywlqO
         FckztaIM7VXhOnRqguINXOzS4tF2j9k6itr8yj4O2R9bvxTZ/5XixyVBxPEKIdnIzXxo
         K9gvy8DIjfa3cSxXV0BsPlII7FabiMWQBhxX1bphvlTMt5TlBRx/Lqpr0Dj3sXiRPgcU
         tPbBkxDFx22kc8Mr/3oOm9b66RzF8/Qd6eZel5uaevmeWnNeT6xQAp9AqNyvnwQYUoKA
         ikQV9S/5J0i2cxw4+ghP0Hu85LAVoVOVLj9Qy1KHWVmv6zagA/Zo/kAP7wNFjF7gI+2L
         n4nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wuUSQP0OtIE+mP7axrK+mquBQR4cpQ2zlYIqVpImR1U=;
        b=kpvHECqxdjxRnf+0/ZSbe+nils5ouRtkbnQC7FfV4fxsdVu0jvMzkxZDtKgVJ4kT00
         +cpajaLooNxU0aSwButrh+0DMc6CTWezQJHKVdn0UQhVu6LY2+q6iaFeM71KsEv29U5P
         p24RQEEfyCqo+JMCun1aGA2VKJX7efW4zlZtyExPyAtPMUNZdcC1U5AvS0NDSWBIFmUA
         +t0xyV2/1TD7ZBcV/7iHbyWxq1PdVF7fM0THt5iDVb8H81h0F65vBAQPp9ZhItf6c47/
         JyivWiqk3Cis8k/nwTn6ep45Nk/O8tMvTPcKisNNCjho8zCwBB6XuTSRQF01bSWLd/4p
         tiOw==
X-Gm-Message-State: AOAM532CdN36ieJ4HSYDcuKS/aZzrtu3ec3s12+N6MQnNK/ZOisDGny6
        70OPdKerPsTa7ibUIFXTW4Q=
X-Google-Smtp-Source: ABdhPJyVdNBSM8/uZCQbZq0gxNERLS7DuvcuHvgKRtpH+6ID2YxKj6LsqEKEpdk21M9tB3QssKnzhA==
X-Received: by 2002:a2e:b70f:: with SMTP id j15mr240665ljo.60.1608228485098;
        Thu, 17 Dec 2020 10:08:05 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.gmail.com with ESMTPSA id u5sm655596lff.78.2020.12.17.10.08.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Dec 2020 10:08:04 -0800 (PST)
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
Subject: [PATCH v2 39/48] drm/tegra: vic: Stop channel before suspending
Date:   Thu, 17 Dec 2020 21:06:29 +0300
Message-Id: <20201217180638.22748-40-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201217180638.22748-1-digetx@gmail.com>
References: <20201217180638.22748-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Host1x channel should be idling before hardware is turned off, hence
stop the channel in the suspend callback.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/drm/tegra/vic.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/tegra/vic.c b/drivers/gpu/drm/tegra/vic.c
index ade56b860cf9..92d3d48c4277 100644
--- a/drivers/gpu/drm/tegra/vic.c
+++ b/drivers/gpu/drm/tegra/vic.c
@@ -510,8 +510,23 @@ static int vic_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static __maybe_unused int vic_suspend(struct device *dev)
+{
+	struct vic *vic = dev_get_drvdata(dev);
+	int err;
+
+	host1x_channel_stop(vic->channel);
+
+	err = pm_runtime_force_suspend(dev);
+	if (err < 0)
+		return err;
+
+	return 0;
+}
+
 static const struct dev_pm_ops vic_pm_ops = {
 	SET_RUNTIME_PM_OPS(vic_runtime_suspend, vic_runtime_resume, NULL)
+	SET_SYSTEM_SLEEP_PM_OPS(vic_suspend, pm_runtime_force_resume)
 };
 
 struct platform_driver tegra_vic_driver = {
-- 
2.29.2

