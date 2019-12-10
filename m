Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D0C59119C24
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2019 23:19:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727619AbfLJWDX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Dec 2019 17:03:23 -0500
Received: from mail.kernel.org ([198.145.29.99]:33448 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727606AbfLJWDW (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Dec 2019 17:03:22 -0500
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8FE2120838;
        Tue, 10 Dec 2019 22:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576015402;
        bh=uBeKrTh12ypekGU746QAp3NU+4SENXWC93Ns4MRKafE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=eYd9KIfK16gOSgDQMqhW54jazjGM6l59z6cv8I/iV7ci8LK9bOCG//UtEW22kh2V/
         d6iaO3Ta1ugKBjQR4/LIBuNj1vh/vUJ5UjBxC3/XYRa3xNrXNcVDJV8Wo/RIx2GVrR
         FdUg0T0su8Ovo2BefngQCgdexm6K8exP2cNBZ/pA=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Sasha Levin <sashal@kernel.org>, linux-media@vger.kernel.org
Subject: [PATCH AUTOSEL 4.14 017/130] media: ov6650: Fix stored crop rectangle not in sync with hardware
Date:   Tue, 10 Dec 2019 17:01:08 -0500
Message-Id: <20191210220301.13262-17-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191210220301.13262-1-sashal@kernel.org>
References: <20191210220301.13262-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Janusz Krzysztofik <jmkrzyszt@gmail.com>

[ Upstream commit 1463b371aff0682c70141f7521db13cc4bbf3016 ]

The driver stores crop rectangle settings supposed to be in line with
hardware state in a device private structure.  Since the driver initial
submission, crop rectangle width and height settings are not updated
correctly when rectangle offset settings are applied on hardware.  If
an error occurs while the device is updated, the stored settings my no
longer reflect hardware state and consecutive calls to .get_selection()
as well as .get/set_fmt() may return incorrect information.  That in
turn may affect ability of a bridge device to use correct DMA transfer
settings if such incorrect informamtion on active frame format returned
by .get/set_fmt() is used.

Assuming a failed update of the device means its actual settings haven't
changed, update crop rectangle width and height settings stored in the
device private structure correctly while the rectangle offset is
successfully applied on hardware so the stored values always reflect
actual hardware state to the extent possible.

Fixes: 2f6e2404799a ("[media] SoC Camera: add driver for OV6650 sensor")
Signed-off-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/media/i2c/ov6650.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/i2c/ov6650.c b/drivers/media/i2c/ov6650.c
index 81fa21ed25992..348296be49258 100644
--- a/drivers/media/i2c/ov6650.c
+++ b/drivers/media/i2c/ov6650.c
@@ -485,6 +485,7 @@ static int ov6650_set_selection(struct v4l2_subdev *sd,
 
 	ret = ov6650_reg_write(client, REG_HSTRT, sel->r.left >> 1);
 	if (!ret) {
+		priv->rect.width += priv->rect.left - sel->r.left;
 		priv->rect.left = sel->r.left;
 		ret = ov6650_reg_write(client, REG_HSTOP,
 				       (sel->r.left + sel->r.width) >> 1);
@@ -494,6 +495,7 @@ static int ov6650_set_selection(struct v4l2_subdev *sd,
 		ret = ov6650_reg_write(client, REG_VSTRT, sel->r.top >> 1);
 	}
 	if (!ret) {
+		priv->rect.height += priv->rect.top - sel->r.top;
 		priv->rect.top = sel->r.top;
 		ret = ov6650_reg_write(client, REG_VSTOP,
 				       (sel->r.top + sel->r.height) >> 1);
-- 
2.20.1

