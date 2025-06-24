Return-Path: <linux-media+bounces-35726-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A4F7DAE5F37
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 10:29:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CB3381896E6B
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 08:29:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5665C25A659;
	Tue, 24 Jun 2025 08:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b="a8dlEUfA"
X-Original-To: linux-media@vger.kernel.org
Received: from out203-205-221-173.mail.qq.com (out203-205-221-173.mail.qq.com [203.205.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44DEE257ACA;
	Tue, 24 Jun 2025 08:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750753678; cv=none; b=XvKXX4NzGpL9vEWGCqlitUVu6qcl6CHGpVNhLYpLbzX8y9CN82c0c07A+OnXSJrOPNcxfLeQoBDTWFVs6Z47QdH0z6wKdUIkxxqZrkFpYQRsr4HvdTDjS4ZT9PM3zvzE+s5Vm5x6dd+/b2iWLYWzThNYOCkNiCLo4dpPA4nWaCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750753678; c=relaxed/simple;
	bh=XdXYCnjRgqwOkrvlCdU3yHEE6yIMMFDPC4AjfWaa+Bg=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=q99fMWXJRHRzGPyGDEKYdOqw22ar+Hqww3v7rWBDe+w+yMctfcA0gb8TFPSHXt990HUbOa4icT+GHJ7NCZhMYSq/Szrk2K4WKnixCuqYZkYJtWrNhbVT6QyjkCE46heofPstFdhVkT9qdwyv2edx+4c50TJIoggY2ifM2ikOlGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com; spf=pass smtp.mailfrom=foxmail.com; dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b=a8dlEUfA; arc=none smtp.client-ip=203.205.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foxmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1750753669;
	bh=JKkXa37Boy9N6ftzZePrOeiWpn/48tEY39AZQiHVcWQ=;
	h=From:To:Cc:Subject:Date;
	b=a8dlEUfADMInh2LtcETgrUMJ135Q3//7fXXivRHUc4lpusRMQGIBeIyXHC2OpoiR9
	 EmVrURl4w0Pt6MBoCMC32KPZ65/fB9DawUTsuQJOkpmqFRXk1K/rdUbu+o5HRS0A6M
	 yWeZEIisWyoyg+bMZ5pHr8uzKYR+RSSo3haoNWhw=
Received: from KernelDevBox.byted.org ([115.190.40.13])
	by newxmesmtplogicsvrszc13-0.qq.com (NewEsmtp) with SMTP
	id 6DA23CD4; Tue, 24 Jun 2025 16:27:26 +0800
X-QQ-mid: xmsmtpt1750753646th3ofuslc
Message-ID: <tencent_C32D0CB0210F2605605435098E9BFC5AD107@qq.com>
X-QQ-XMAILINFO: MinfFaxlAYcM9vZt8jNniaXm0if7ASEbcANM8kDoSvgX5HIhl4DGltA2aVZrGw
	 ai5AMsygM5dhCGE2Z0mbOFQoVjXtjY1PzFUO2pEs3wFrTUHogrN67kwZWs1khMNKumwnSBp1nT2i
	 Nq7N9JUyMXkDnblnBXnTn7TWGhRlTzf3Q96cg4IamtMEXWYqRcX/0hSx4jpPHgS+YlO5cglgAcBq
	 93DGbHB4TsmsaechYy1t0nZkKaNb3f/+XSY7XEPrieBlWexLFHtxcdJdMfh8MdfnCyu+UN/S3MY9
	 36AtNT7hEAU/9I4+OFmXu1cUGnQpkZoR/6NZH+gEqHLZnDPFSer/FwQl0mcjL9f8DIJyXCTI3KQU
	 hrjwooXxp6N59rztdHv6JHXxHRLtl1iwMt2H6gg8EZ2E46iqEp+9SJ/ICN3DpwavyeJ5yyNVzlwu
	 V2rY/HcxJ3Pqmk/2l0TkKY+JLsNebv8nOixdSZxu5AbyrYCHxEbLgs7pyZWrocEDdFHaWYuqUc/W
	 JIaw2sPsKc5aSFj5+gqIgeV4gqzD1YClIpDxzkr1SN5Tc3nNczAYMYBbWA7o318HXgEVU1+neenJ
	 X3kG3bQ9+WYaejVIYep1a+/qocGwixrfwE7tSn1fH9krGGWLKegVOXVHqd997FUix3XQwlrRt6c4
	 5EPsQSCYbbVs/hMqk6V3LB0k9ND/c05fV2WxbmlW23o3p97nKIoiL/O3f3AH8n7A6eyvXyflVQ5p
	 c6HvTpmiyz0oQY33l5EoWir5XAoPYk1MmNrPxYQBFWAM+8LUdDF/5I6IhpUDndjy1ZAyoQ/s/js/
	 ITarvoA59MmXdx1Qv1F0HhvXgJcIoFpCUgD062G4JeCEOFxSWhk9WM/Lxk8//p2jbOgDiC7KIXcy
	 eBQjNf6Qrpgras5ITY2XNR8CCwiFqPJELehN8vWyPG/sdLfZDB9z3Iwo3Vz8m6p0N9ZNWC2OEVBG
	 rAOSLssBlQvU3mubcMkCrQjkY3kA93dVoGm2MbRKB06cnxdbuPwACQTnblqJmcbF89GjYwO4o=
X-QQ-XMRINFO: MPJ6Tf5t3I/ycC2BItcBVIA=
From: Zhang Shurong <zhang_shurong@foxmail.com>
To: jacopo@jmondi.org
Cc: mchehab@kernel.org,
	u.kleine-koenig@pengutronix.de,
	hverkuil@xs4all.nl,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhang Shurong <zhang_shurong@foxmail.com>
Subject: [PATCH v4] media: rj54n1cb0c: Fix memleak in rj54n1_probe()
Date: Tue, 24 Jun 2025 16:27:24 +0800
X-OQ-MSGID: <20250624082724.1225931-1-zhang_shurong@foxmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rj54n1_probe() won't clean all the allocated resources in fail
path, which may causes the memleaks. Add v4l2_ctrl_handler_free() to
prevent memleak.

Fixes: f187352dcd45 ("media: i2c: Copy rj54n1cb0c soc_camera sensor driver")
Signed-off-by: Zhang Shurong <zhang_shurong@foxmail.com>
---
Changes in v2:
- Fixed compile error
Changes in v3:
- Fixed coding style warnings identified by scripts/checkpatch.pl
Changes in v4:
- remove empty line between signed-off message and Fixes tag
- Moved ctrl_handler assignment after the error check
- Used existing error label for better code flow
---
 drivers/media/i2c/rj54n1cb0c.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/rj54n1cb0c.c b/drivers/media/i2c/rj54n1cb0c.c
index b7ca39f63dba..6dfc91216851 100644
--- a/drivers/media/i2c/rj54n1cb0c.c
+++ b/drivers/media/i2c/rj54n1cb0c.c
@@ -1329,10 +1329,13 @@ static int rj54n1_probe(struct i2c_client *client)
 			V4L2_CID_GAIN, 0, 127, 1, 66);
 	v4l2_ctrl_new_std(&rj54n1->hdl, &rj54n1_ctrl_ops,
 			V4L2_CID_AUTO_WHITE_BALANCE, 0, 1, 1, 1);
-	rj54n1->subdev.ctrl_handler = &rj54n1->hdl;
-	if (rj54n1->hdl.error)
-		return rj54n1->hdl.error;
 
+	if (rj54n1->hdl.error) {
+		ret = rj54n1->hdl.error;
+		goto err_free_ctrl;
+	}
+
+	rj54n1->subdev.ctrl_handler = &rj54n1->hdl;
 	rj54n1->clk_div		= clk_div;
 	rj54n1->rect.left	= RJ54N1_COLUMN_SKIP;
 	rj54n1->rect.top	= RJ54N1_ROW_SKIP;
-- 
2.39.5


