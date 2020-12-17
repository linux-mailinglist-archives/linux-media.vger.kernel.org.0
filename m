Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E74DD2DD765
	for <lists+linux-media@lfdr.de>; Thu, 17 Dec 2020 19:14:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731303AbgLQSJ3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Dec 2020 13:09:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731125AbgLQSJW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Dec 2020 13:09:22 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12F5EC0619DB;
        Thu, 17 Dec 2020 10:07:48 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id m25so59780833lfc.11;
        Thu, 17 Dec 2020 10:07:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PvpcuwVOPMLvQDnLlBwHPl2O7D8LMz4lLmWlObCh8qc=;
        b=QON1Gl9s1kkROvQY9whWnwGgcnaB4YIR1fgk8dSyGOoCf7hTlJgAN9HZsgUyD+dKDe
         3q5wAqAi82gbM8t3Kg60W2QZvCqEJ4mZCkWVxXXUsHSy6meM8yVP2/afMaiKrpyx4gZO
         /zjzP5nmXt88kR7btX7zCTEao3FMB2pXwQXGXx4Fe1t/7t81y7lIgIMKsoJ7qHrvQtpw
         BA/UP6RzIbd2R9fpk+APa1SZfRIaSGEN9q/0joRs/GfYdpL0EBRFqNkY9DjaQIrww6eB
         6AfE7k+LCj8fUbWfERHHDHMMRLHabE/QJBtxHTsCbNF8/r9FazasHiPJgwj5/7QgpoEO
         WSjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PvpcuwVOPMLvQDnLlBwHPl2O7D8LMz4lLmWlObCh8qc=;
        b=Mr0RtMQEq1NxAKhD371Yb0b1udNSg1oqICqc9Wb8eVBfnhmbQi+445tc5pAedcqujl
         NOmxzH3m8GyJuIn9mSrrpITOcWKhmfonJoBsvVuxbN7fEh1qh4hXEknf1Qts1BK1wk5d
         vjEeb7AqsaZpIb4S7lfHj5OqB/H9ZwoH1Vgk+GymvkHv0Pslk5wM5ASaF42mJ6Nu1EEr
         vdsl19OUusH5eXKPS9DKL5MioTY6hqLFICvWqz91JnUXkxPHz/zNdWc0oU8BBExFJ2Jc
         XORFOPjwiYCblt9CM3J+rgRyR6DkkPEyWrdEbbEzjqqMNhX+FLDynEUT95k8UpXz9+kR
         dh7A==
X-Gm-Message-State: AOAM531hbZVT91IFzkMtB+l7Ev1b5eWwytpBbV2tjjyXBjxd7tjmm6KZ
        4Dn47ui6cuXTIcPN51rDZzo=
X-Google-Smtp-Source: ABdhPJwYSeEwcJLgnqbgKFMXoU0x9dR+BGXQt30RblfxNKDPJUGaANO1daCN6cf8hc1/VZhaI4+xBA==
X-Received: by 2002:a2e:8e63:: with SMTP id t3mr233593ljk.88.1608228466606;
        Thu, 17 Dec 2020 10:07:46 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.gmail.com with ESMTPSA id u5sm655596lff.78.2020.12.17.10.07.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Dec 2020 10:07:46 -0800 (PST)
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
Subject: [PATCH v2 23/48] soc/tegra: pmc: Pulse resets after removing power clamp
Date:   Thu, 17 Dec 2020 21:06:13 +0300
Message-Id: <20201217180638.22748-24-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201217180638.22748-1-digetx@gmail.com>
References: <20201217180638.22748-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The GR3D1 hardware unit needs to pulse hardware reset after removing power
clamp, otherwise reset won't be deasserted. Hence give reset a pulse after
removing the clamp. This stayed unnoticed previously because power
management wasn't supported by the 3D driver until recently and all power
gates are usually ungated after bootloader by default.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/soc/tegra/pmc.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index fd2ba3c59178..985373ce52b1 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -654,6 +654,14 @@ static int tegra_powergate_power_up(struct tegra_powergate *pg,
 
 	usleep_range(10, 20);
 
+	/*
+	 * Some hardware blocks may need a 0->1->0 reset pulse in order
+	 * to propagate the reset, Tegra30 3D1 is one example.
+	 */
+	err = reset_control_reset(pg->reset);
+	if (err)
+		goto powergate_off;
+
 	if (pg->pmc->soc->needs_mbist_war)
 		err = tegra210_clk_handle_mbist_war(pg->id);
 	if (err)
-- 
2.29.2

