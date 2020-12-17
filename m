Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5AA12DD7EF
	for <lists+linux-media@lfdr.de>; Thu, 17 Dec 2020 19:15:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728184AbgLQSIn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Dec 2020 13:08:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727388AbgLQSIl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Dec 2020 13:08:41 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7852C0611CB;
        Thu, 17 Dec 2020 10:07:30 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id y19so59727177lfa.13;
        Thu, 17 Dec 2020 10:07:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=85Y5Xy0sCYGIXnoBRS4PIkvg6O/T96bo2+JpLeZeoDU=;
        b=HO8B6pRWWY34CmtfEP2kpsIswJ2lPhhfqt6pCe/KhgZFrWjAvhfVC/olegJlNCb7eF
         UI3MKbRzrqIhUSxGSc5Ajvbj/hJs+jZ8oq79wnAhjB7etVTaRWe4bMbSawUlSSLPp3Sm
         gCkoFwyBIrpdeWNZ5sjoyHEP793xOAsMnj6a4mh49sHgbLePE2qqdLPbO9YOXsp09Ar5
         fFnxwvcfqqIwW6ZgiE1KVVbHtu/AdCwcdYddZ+PNfP7cZL8U7GJO6Xf5MAWOk7rTpt8Q
         hKO49nwhSnI90wCCw8KhsSWqHvaLpPRSm/m3rAfl3WzFoYpQz3bkg9b+THJ9m6P12R5F
         8/ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=85Y5Xy0sCYGIXnoBRS4PIkvg6O/T96bo2+JpLeZeoDU=;
        b=hqvikbmLhlXd0xFqhfP0nho4oyNwe2Kp3S0/e8I8vaTm1jUGKfL7A8w08PcmPuGDkb
         qrHEJSwvKOnTkxY3/qfOw1GF7SiA8wqmvjM5W51qto39rB/L5yi6Xox1QpvI6batTFX7
         eMFpk3xNf4tQVWATQPn8dZlzS5eREqpK9hdjRXOSAg3KUdT514t4ds7Nj/M++rRE3b+D
         mDTnEupLCptKWyXBJI3NQa46VVh+b6XwAq2GBi3f8DlGg6LPpRz3oLTrjBoln5p9Bos6
         98ZXGjycH2gVXV1p67HQfvl3T9Qj3rug9gG2rs6I2i4u6zCdldfDr+Ubq2MzTJAeQxS1
         DrVA==
X-Gm-Message-State: AOAM530fKegHDk5LNyu+O5nB3tPvQE9IqJtaMWVMR5GryofX4+yFrTnc
        uwz+Ba42hzjYoJfcgue4RF4=
X-Google-Smtp-Source: ABdhPJxdsk3SmejHPdeEJpjzdTthLwWs3KYuEnkts5yzgKLNEZKMY28YcLV/8fEvQKXp+zJuE2Yd2Q==
X-Received: by 2002:ac2:4359:: with SMTP id o25mr5495403lfl.536.1608228449259;
        Thu, 17 Dec 2020 10:07:29 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.gmail.com with ESMTPSA id u5sm655596lff.78.2020.12.17.10.07.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Dec 2020 10:07:28 -0800 (PST)
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
Subject: [PATCH v2 08/48] regulator: Make regulator_sync_voltage() usable by coupled regulators
Date:   Thu, 17 Dec 2020 21:05:58 +0300
Message-Id: <20201217180638.22748-9-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201217180638.22748-1-digetx@gmail.com>
References: <20201217180638.22748-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Make regulator_sync_voltage() to re-balance voltage state of a coupled
regulators instead of changing the voltage directly.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/regulator/core.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
index ca03d8e70bd1..576efb815eb8 100644
--- a/drivers/regulator/core.c
+++ b/drivers/regulator/core.c
@@ -4131,6 +4131,12 @@ int regulator_sync_voltage(struct regulator *regulator)
 	if (ret < 0)
 		goto out;
 
+	/* balance only if there are regulators coupled */
+	if (rdev->coupling_desc.n_coupled > 1) {
+		ret = regulator_balance_voltage(rdev, PM_SUSPEND_ON);
+		goto out;
+	}
+
 	ret = _regulator_do_set_voltage(rdev, min_uV, max_uV);
 
 out:
-- 
2.29.2

