Return-Path: <linux-media+bounces-21130-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 268489C1940
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2024 10:37:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 57AEF1C213B8
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2024 09:37:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52B161E1C34;
	Fri,  8 Nov 2024 09:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="tzACT7YE"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 476751E47C0;
	Fri,  8 Nov 2024 09:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731058529; cv=none; b=n2+jSHChSHfp3rcEVJqzQXuJNaoPlkA1AVNHExJyO4WXW88T1TqN1g+AYKq8TiHSsNAUVclwJexBMgFvdUG62jpoNJzWQT0SNFEwIo8MP5OwxLb2q1LocLFbN51NS4QSUssGBPBjFavYZsgIfztKI3eFQGO/OmBVORPR+7RVUTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731058529; c=relaxed/simple;
	bh=Bz4feA5yfvPpER9WbwM4rVvWi4EotwX/morzNM8UD0Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kX/WX6ZWWvw4ATAwtv3lqvzsiF1/HKizMtbBnzzUKAVaLjWjxTvytSRaTWk/iyYtBAk8L8ZEOXYbYuvkmYpMOmAS4K0TrYjdz+IMFmQmQfp13UhC6pHMapva3RZLxhC+2FEwda8UV4lvlGLf2BKRt86JQLuPHF9fCogB+/Iw5e4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=tzACT7YE; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-157-155-49.elisa-laajakaista.fi [91.157.155.49])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8B12C353;
	Fri,  8 Nov 2024 10:35:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1731058509;
	bh=Bz4feA5yfvPpER9WbwM4rVvWi4EotwX/morzNM8UD0Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=tzACT7YEuKU3gkcD4ME26Z5iWGOaykKP8dMQgeSY1J+uTwa4m2LKmiOtiGDQVLATa
	 IoD0uZAHM2nqCSCyQb28iQuzLXDq8RE4cGIRyghXi8JzL/psMqQh6S1VuvDAEUkVaY
	 qLTKVaqt5A6Bl0pDkd3PtncfgRnlwAtGB0GOlg1o=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Fri, 08 Nov 2024 11:34:50 +0200
Subject: [PATCH v2 06/15] media: i2c: ds90ub960: Fix UB9702 VC map
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241108-ub9xx-fixes-v2-6-c7db3b2ad89f@ideasonboard.com>
References: <20241108-ub9xx-fixes-v2-0-c7db3b2ad89f@ideasonboard.com>
In-Reply-To: <20241108-ub9xx-fixes-v2-0-c7db3b2ad89f@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jai Luthra <jai.luthra@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1211;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=Bz4feA5yfvPpER9WbwM4rVvWi4EotwX/morzNM8UD0Y=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnLdtPNlYJRSbGS6fLhZqc4f1bWshNwiOAhx9xr
 YKQ26VKpcOJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZy3bTwAKCRD6PaqMvJYe
 9SgVD/9x5X53aADV8vbKOQ385d5hE6UB99XJSAs9SIWEeoL6rHdd3m2W29GiVAHjDDz+T1x3Jx+
 GfVPSB4X/SODycOXP4Amf/c4rySqFg5v5kKFK5GLvOihhYeiQjUggLrrMrMGw4IincRGLQd2qiY
 IsVWrH05oYeDbFeOa/gJSjWEvYRNvSqgzDpMXLDdQVzBKzwEVfiSSm+ztvXeEHYpcLw+M76fbQ3
 PhnkSYZopnK5Py92Om6/jGgmwVbNWz/KcY/d4HZKIR0AW/1cDGlg6jevbRIg3E8EXHUaKxU1/Pn
 bvfRxzpA2tl9RQakm1Hs/9TLtcigLdc5tL79tSROBXFP63cgYsO69vUgVBfZm+VWNXhSqdvTsFF
 A0YUmdflmbpZN8PKqIB7SJqhE+EK1uYW1IBEEWYrSGS/byipo0zWlzFiwZc3UgJZ0aSzZalEfTg
 z8rF3o83DhPZtqDV2js+Ib72SjlJbU6JL14v9HM8kJIow8JahtCQf1gaqZNX8j+uyvb21/L8fg3
 MRd8DdrDtHRXwIJKw5aF/L+5Ew87QsXEkhPNa9bpPkLQCOC1qPemjyWRsCtguvFYX1M5ynXWPO7
 CYFC7oLoOey8BxQmwfB2+kL3Y2idNubOhxxjtubQDOvTPFp8fHWD+V0Rxki9LT26DpO8bB1uDR/
 ClpalB7HpPqbc+A==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

The driver uses a static CSI-2 virtual channel mapping where all virtual
channels from an RX port are mapped to a virtual channel number matching
the RX port number.

The UB960 and UB9702 have different registers for the purpose, and the
UB9702 version is not correct. Each of the VC_ID_MAP registers do not
contain a single mapping, as the driver currently thinks, but two.

This can cause received VCs other than 0 to be mapped in a wrong way.

Fix this by writing both mappings to each register.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Fixes: afe267f2d368 ("media: i2c: add DS90UB960 driver")
---
 drivers/media/i2c/ds90ub960.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ds90ub960.c b/drivers/media/i2c/ds90ub960.c
index 2273e79430c0..98d815526341 100644
--- a/drivers/media/i2c/ds90ub960.c
+++ b/drivers/media/i2c/ds90ub960.c
@@ -2534,7 +2534,7 @@ static int ub960_configure_ports_for_streaming(struct ub960_data *priv,
 				for (i = 0; i < 8; i++)
 					ub960_rxport_write(priv, nport,
 							   UB960_RR_VC_ID_MAP(i),
-							   nport);
+							   (nport << 4) | nport);
 			}
 
 			break;

-- 
2.43.0


