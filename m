Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8583C29F1D2
	for <lists+linux-media@lfdr.de>; Thu, 29 Oct 2020 17:43:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726719AbgJ2QnI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Oct 2020 12:43:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:51566 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726449AbgJ2QnI (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Oct 2020 12:43:08 -0400
Received: from localhost.localdomain (adsl-84-226-167-205.adslplus.ch [84.226.167.205])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D8AEA214DB;
        Thu, 29 Oct 2020 16:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603989787;
        bh=Dhl956BimS53xTQsVQBFS9A2KaCmEJWe4BIHgTaal0w=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ZlZTvl+l+UQ9Y5MJfNXWbQ2IbOG1PPAS5ROOyG/OP31KzyTfIYDMVetjXuhhn0VwD
         tb4ny9BwSaFwb32dpX+QkrqvH/8ODHurSTXaCa3hZtd3TJjXUc+9hnQWz9Ow4Bvfra
         ViodVUPWNwAzli//4GySrMwWZkq/IheEG8RCDM/Q=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Pavel Machek <pavel@ucw.cz>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Dongchun Zhu <dongchun.zhu@mediatek.com>,
        Shawn Tu <shawnx.tu@intel.com>,
        Ricardo Ribalda <ribalda@kernel.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Shunqian Zheng <zhengsq@rock-chips.com>,
        Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>,
        Hyungwoo Yang <hyungwoo.yang@intel.com>,
        Wenyou Yang <wenyou.yang@microchip.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzk@kernel.org>
Subject: [RESEND PATCH 05/25] media: i2c: imx319: silence unused acpi_device_id warning
Date:   Thu, 29 Oct 2020 17:42:19 +0100
Message-Id: <20201029164239.84240-5-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201029164239.84240-1-krzk@kernel.org>
References: <20201029164239.84240-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If driver is built without ACPI, the struct acpi_device_id won't be
used:

  drivers/media/i2c/imx319.c:2536:36: warning:
    'imx319_acpi_ids' defined but not used [-Wunused-const-variable=]

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/media/i2c/imx319.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/imx319.c b/drivers/media/i2c/imx319.c
index 8b86fc65364e..8473c0bbb35d 100644
--- a/drivers/media/i2c/imx319.c
+++ b/drivers/media/i2c/imx319.c
@@ -2533,7 +2533,7 @@ static const struct dev_pm_ops imx319_pm_ops = {
 	SET_SYSTEM_SLEEP_PM_OPS(imx319_suspend, imx319_resume)
 };
 
-static const struct acpi_device_id imx319_acpi_ids[] = {
+static const struct acpi_device_id imx319_acpi_ids[] __maybe_unused = {
 	{ "SONY319A" },
 	{ /* sentinel */ }
 };
-- 
2.25.1

