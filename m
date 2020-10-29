Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57A6329F1D6
	for <lists+linux-media@lfdr.de>; Thu, 29 Oct 2020 17:43:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727096AbgJ2QnR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Oct 2020 12:43:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:51742 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727030AbgJ2QnQ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Oct 2020 12:43:16 -0400
Received: from localhost.localdomain (adsl-84-226-167-205.adslplus.ch [84.226.167.205])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2456820825;
        Thu, 29 Oct 2020 16:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603989795;
        bh=h9SB15vQcHhQIm0U5uWXO0OnZemAUauo1TeT1Ot+yDE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=b7k8MpSA7DcTpfxKTOSq6g/xvw/BQKjnrsg0tH+lVKEKux8lxnSmbO3unOK8MyU58
         QgfgEfm8B16Gp+qJa2cJ/2OTWO6tc+bFNb2l7SKBSXmKhl3s6Xb94kKZz9C2WspzvH
         3ymwVtvz7TADdKBF9VoEke8RAxGjl42CS7Pv9T2s=
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
Subject: [RESEND PATCH 07/25] media: i2c: imx355: silence unused acpi_device_id warning
Date:   Thu, 29 Oct 2020 17:42:21 +0100
Message-Id: <20201029164239.84240-7-krzk@kernel.org>
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

  drivers/media/i2c/imx355.c:1836:36: warning:
    'imx355_acpi_ids' defined but not used [-Wunused-const-variable=]

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/media/i2c/imx355.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
index 51245e71b411..700f7467fb31 100644
--- a/drivers/media/i2c/imx355.c
+++ b/drivers/media/i2c/imx355.c
@@ -1833,7 +1833,7 @@ static const struct dev_pm_ops imx355_pm_ops = {
 	SET_SYSTEM_SLEEP_PM_OPS(imx355_suspend, imx355_resume)
 };
 
-static const struct acpi_device_id imx355_acpi_ids[] = {
+static const struct acpi_device_id imx355_acpi_ids[] __maybe_unused = {
 	{ "SONY355A" },
 	{ /* sentinel */ }
 };
-- 
2.25.1

