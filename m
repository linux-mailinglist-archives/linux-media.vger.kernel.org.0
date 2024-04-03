Return-Path: <linux-media+bounces-8558-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 036EE8973E0
	for <lists+linux-media@lfdr.de>; Wed,  3 Apr 2024 17:22:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AC6951F21803
	for <lists+linux-media@lfdr.de>; Wed,  3 Apr 2024 15:22:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAEF914A616;
	Wed,  3 Apr 2024 15:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=luigi311.com header.i=@luigi311.com header.b="QvPdXUFu"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-108-mta49.mxroute.com (mail-108-mta49.mxroute.com [136.175.108.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B328D149DE5
	for <linux-media@vger.kernel.org>; Wed,  3 Apr 2024 15:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.175.108.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712157556; cv=none; b=fFJv66cxnZrbw5unf0hCX+XGiIuRCW3b6Dl0bFHNkKSfMsHmugV2iL5SlCOaDWH5HQjNIC3Th+dAhgNkur0UelUgO5lk9IvU3zi9x63EjUIP22GaS/JPODf0GF7oyzYxiG8qbfefI8peIS5GRwnl/Brx4Dq5UDeZmQljgufYwuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712157556; c=relaxed/simple;
	bh=P6sFYE2RFyMP+jyTKPG/NPzsohsjE50jpPWJbVR2FnQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Lq0oGg6/ogfwDAJS/x0CBl+wvncZEKejZ9LNA0KknqKc/FvWWesDcadXcA6jT/0UIarywXK/SgmaZ2NeN4OFR/UUflBO88t5Ie9UC/XD7ocms8Gd+vxH7nhvCeCTew+6SjOWYb/3H+90nWJBmXOV+VC6tBR0YCiTwS5k9afDpYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=luigi311.com; spf=pass smtp.mailfrom=luigi311.com; dkim=pass (2048-bit key) header.d=luigi311.com header.i=@luigi311.com header.b=QvPdXUFu; arc=none smtp.client-ip=136.175.108.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=luigi311.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=luigi311.com
Received: from filter006.mxroute.com ([136.175.111.2] filter006.mxroute.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by mail-108-mta49.mxroute.com (ZoneMTA) with ESMTPSA id 18ea48ace6d0003bea.011
 for <linux-media@vger.kernel.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 03 Apr 2024 15:19:04 +0000
X-Zone-Loop: e38e29dcb6fbc13d825811693cfc013161f376f1f7e8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=luigi311.com; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=tn3xRU5mtzTvJZghODMqRw0ULnXG09wTsVZrMIwsFGY=; b=QvPdXUFuy1A7P9ydQKgHJhheqt
	WkdvfyKXwUD+FqZFlZUYxyspghJF4mEzHneCx7CQ6m4BnYfkMAOF8aZy6D9gArVw5WT09Bhsu8Hlu
	qrsgyHQrHFvHG20wAUvM88NEktefZ5yqJ8SUgXzlSzCIAaYAEiw0v2z8Lvayn8eNswCrf+7PxdxXp
	MXgwgvnct48JPZExsc1lGu/vywnnys5hasjdYaO8pXtzcUMya65yu0Yr+JDTuIbE8gKKqJysT6eOe
	9zW9Amw9H0cCF8OGSzZaMRIYWRMEDTyUAPMcL+EAJ62tC87t+xl5ANGN5r9XDpxSDqpAAzKh4Uhps
	G0NUIlrA==;
From: git@luigi311.com
To: linux-media@vger.kernel.org
Cc: dave.stevenson@raspberrypi.com,
	jacopo.mondi@ideasonboard.com,
	mchehab@kernel.org,
	robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	sakari.ailus@linux.intel.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	pavel@ucw.cz,
	phone-devel@vger.kernel.org,
	Luis Garcia <git@luigi311.com>
Subject: [PATCH v3 25/25] media:i2c: imx258: Use v4l2_link_freq_to_bitmap helper
Date: Wed,  3 Apr 2024 09:03:54 -0600
Message-ID: <20240403150355.189229-26-git@luigi311.com>
In-Reply-To: <20240403150355.189229-1-git@luigi311.com>
References: <20240403150355.189229-1-git@luigi311.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated-Id: personal@luigi311.com

From: Luis Garcia <git@luigi311.com>

Use the v4l2_link_freq_to_bitmap() helper to figure out which
driver-supported link freq can be used on a given system.

Signed-off-by: Luis Garcia <git@luigi311.com>
---
 drivers/media/i2c/imx258.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/media/i2c/imx258.c b/drivers/media/i2c/imx258.c
index 4c117c4829f1..038f40a1f800 100644
--- a/drivers/media/i2c/imx258.c
+++ b/drivers/media/i2c/imx258.c
@@ -674,6 +674,7 @@ struct imx258 {
 	/* Current mode */
 	const struct imx258_mode *cur_mode;
 
+	unsigned long link_freq_bitmap;
 	const struct imx258_link_freq_config *link_freq_configs;
 	const s64 *link_freq_menu_items;
 	unsigned int lane_mode_idx;
@@ -1533,6 +1534,17 @@ static int imx258_probe(struct i2c_client *client)
 		return ret;
 	}
 
+	ret = v4l2_link_freq_to_bitmap(&client->dev,
+				ep.link_frequencies,
+				ep.nr_of_link_frequencies,
+				imx258->link_freq_menu_items,
+				ARRAY_SIZE(link_freq_menu_items_19_2),
+				&imx258->link_freq_bitmap);
+	if (ret) {
+		dev_err(&client->dev, "Link frequency not supported\n");
+		goto error_endpoint_free;
+	}
+
 	/* Get number of data lanes */
 	switch (ep.bus.mipi_csi2.num_data_lanes) {
 	case 2:
-- 
2.42.0


