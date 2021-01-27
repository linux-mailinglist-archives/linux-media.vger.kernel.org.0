Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A1C830629A
	for <lists+linux-media@lfdr.de>; Wed, 27 Jan 2021 18:51:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344213AbhA0Ru3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 Jan 2021 12:50:29 -0500
Received: from mail.kernel.org ([198.145.29.99]:47200 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1344110AbhA0Rr0 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 Jan 2021 12:47:26 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3B02F64DA3;
        Wed, 27 Jan 2021 17:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611769605;
        bh=zWUF7gy1Qf1dX62rn0FAOk2xbwwQdbfUgsxvI5Sklh4=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=YfLthjvquvzDDERQauptCyaJCTSpyzmA3O+wbLxSSeY/r0N7yaNmtSONSR8K52tIZ
         F9qvpIohUGF87//0ndXFGWO83GA/KReBQSwangMAvQ26OdkMqma+gyyRGj0zrqdk/g
         t3U1kzGBq6aI4EkvwAdUF7u4DZvIk0yWk141HLFaee+FY8MQAMFJe7Fq/qT7tcPcSy
         HU+on82lWY2AfzsYK7MsQf7yqabxHtdrkw+6hI4BpkokSbpjfvZT4e1SAHIbeVx8lD
         W3OsMV8wv/4wDIz+uR5G4ktYQOT0TtVAKEKsXnLKuL4tZhjPAb+1qeOSggWgQzM4Xn
         98+89PeJdpfTg==
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v7 3/4] media: i2c: imx258: simplify getting state container
Date:   Wed, 27 Jan 2021 18:46:34 +0100
Message-Id: <20210127174635.3596-3-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210127174635.3596-1-krzk@kernel.org>
References: <20210127174635.3596-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The pointer to 'struct v4l2_subdev' is stored in drvdata via
v4l2_i2c_subdev_init() so there is no point of a dance like:

struct i2c_client *client = to_i2c_client(struct device *dev)
struct v4l2_subdev *sd = i2c_get_clientdata(client);

This allows to remove local variable 'client' and few pointer
dereferences.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

---

Changes since v3:
1. None

Changes since v2:
1. New patch
---
 drivers/media/i2c/imx258.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/imx258.c b/drivers/media/i2c/imx258.c
index ba7f29622974..505981e02cff 100644
--- a/drivers/media/i2c/imx258.c
+++ b/drivers/media/i2c/imx258.c
@@ -1018,8 +1018,7 @@ static int imx258_set_stream(struct v4l2_subdev *sd, int enable)
 
 static int __maybe_unused imx258_suspend(struct device *dev)
 {
-	struct i2c_client *client = to_i2c_client(dev);
-	struct v4l2_subdev *sd = i2c_get_clientdata(client);
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
 	struct imx258 *imx258 = to_imx258(sd);
 
 	if (imx258->streaming)
@@ -1030,8 +1029,7 @@ static int __maybe_unused imx258_suspend(struct device *dev)
 
 static int __maybe_unused imx258_resume(struct device *dev)
 {
-	struct i2c_client *client = to_i2c_client(dev);
-	struct v4l2_subdev *sd = i2c_get_clientdata(client);
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
 	struct imx258 *imx258 = to_imx258(sd);
 	int ret;
 
-- 
2.25.1

