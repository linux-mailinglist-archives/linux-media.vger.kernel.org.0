Return-Path: <linux-media+bounces-9861-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F57B8ACB20
	for <lists+linux-media@lfdr.de>; Mon, 22 Apr 2024 12:45:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 04E0C1F21370
	for <lists+linux-media@lfdr.de>; Mon, 22 Apr 2024 10:45:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 340B61465A8;
	Mon, 22 Apr 2024 10:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="GnWKhz/m"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C961984DE0
	for <linux-media@vger.kernel.org>; Mon, 22 Apr 2024 10:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713782580; cv=none; b=AABHphooNrVv6c4q4zResFj+BgzV8Z7xgU6CR5NeSCIJaCtj/BCkzopCXXkJuqm0UB7MyufvVS77lw8TSi7GC/x5HuoodQYcjP1Cz6ezUTSe9SAiYkBWTx4+i7ANjXLEhAk/v/N3BjtdjvE5kyjhXClZXAB83tJE/B1DK0uNyWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713782580; c=relaxed/simple;
	bh=dQHt2zX8c5yRARbcivPXoW3WnVs76CVa+dMbD/LdVhA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oWhty1onwaqbBZmbMx+FMZGYIg4o4/lIl4SxJvAmI1+Omz6plqxIWxErL4TKm8+T+D2ncbGnrmFeMC4h60AYJEU8oAZ5ZrGgxr2YAljSDzkNwPFIEPiQqkf61C85tsTvR+Sc7pES0kLbu0HubCINrpqc/S2M95ZwtHbAfrUaoB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=GnWKhz/m; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from umang.jain (unknown [103.251.226.10])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5FF89142E;
	Mon, 22 Apr 2024 12:42:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1713782525;
	bh=dQHt2zX8c5yRARbcivPXoW3WnVs76CVa+dMbD/LdVhA=;
	h=From:To:Cc:Subject:Date:From;
	b=GnWKhz/m8C2kLSfBPX/bwYRvzpkMPOlIdSHPP2CiTSQ3JELNVVCTFqlGt+AkCS/1M
	 fOuvJbKKRrsFzNqVYd0OZNzIh3URjNLc0wI3wT4QOtQ+ocODn4FjTrWvT33rnAfoRC
	 FYYzFhtsCBXafapN9Sk5JYA9qh9B0+Il0weslA5k=
From: Umang Jain <umang.jain@ideasonboard.com>
To: Hans Verkuil <hverkuil@xs4all.nl>,
	linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@iki.fi>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Umang Jain <umang.jain@ideasonboard.com>
Subject: [PATCH] media: imx335: Describe CCI struct member
Date: Mon, 22 Apr 2024 16:12:47 +0530
Message-ID: <20240422104247.269816-1-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add description for 'struct regmap *cci' member of struct imx335.

This will fix the following compile-time warning:
warning: Function parameter or struct member 'cci' not described in 'imx335'

Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
---
 drivers/media/i2c/imx335.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/i2c/imx335.c b/drivers/media/i2c/imx335.c
index c43e57455704..990d74214cc2 100644
--- a/drivers/media/i2c/imx335.c
+++ b/drivers/media/i2c/imx335.c
@@ -176,6 +176,7 @@ struct imx335_mode {
  * @pad: Media pad. Only one pad supported
  * @reset_gpio: Sensor reset gpio
  * @supplies: Regulator supplies to handle power control
+ * @cci: CCI register map
  * @inclk: Sensor input clock
  * @ctrl_handler: V4L2 control handler
  * @link_freq_ctrl: Pointer to link frequency control

base-commit: 901c9229172392a119f34aa94b95247a2574173e
-- 
2.43.0


