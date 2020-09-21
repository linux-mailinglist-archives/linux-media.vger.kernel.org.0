Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85005272BE4
	for <lists+linux-media@lfdr.de>; Mon, 21 Sep 2020 18:25:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727885AbgIUQYq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Sep 2020 12:24:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:51554 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726457AbgIUQYp (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Sep 2020 12:24:45 -0400
Received: from localhost.localdomain (unknown [194.230.155.191])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B1163235F8;
        Mon, 21 Sep 2020 16:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600705485;
        bh=ktQpm1/c6hMxf+7bSnCZAwdBXVtxcU32rqZ4E3N6TuA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=BPb8zz/UJm4zKdYR5mtgPRtcigIP8zJszpkVA2TkLpUMFQtVDn0DHobBJd+byXYD3
         KddxT1gLTQ71tUo1bPkc1yOPvQX+ExmVzpO6capjRoWHNLbvuSqvHYP4+7RKHTl10e
         ZCokIdhd0gEzVZsIw+IOR9pdIpXff46KwjN0fyF4=
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
        Marco Felsch <m.felsch@pengutronix.de>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH 07/25] media: i2c: imx355: silence unused acpi_device_id warning
Date:   Mon, 21 Sep 2020 18:23:24 +0200
Message-Id: <20200921162342.7348-7-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200921162342.7348-1-krzk@kernel.org>
References: <20200921162342.7348-1-krzk@kernel.org>
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
index 51245e71b411..8db287251f49 100644
--- a/drivers/media/i2c/imx355.c
+++ b/drivers/media/i2c/imx355.c
@@ -1833,7 +1833,7 @@ static const struct dev_pm_ops imx355_pm_ops = {
 	SET_SYSTEM_SLEEP_PM_OPS(imx355_suspend, imx355_resume)
 };
 
-static const struct acpi_device_id imx355_acpi_ids[] = {
+static const struct acpi_device_id imx355_acpi_ids[]__maybe_unused = {
 	{ "SONY355A" },
 	{ /* sentinel */ }
 };
-- 
2.17.1

