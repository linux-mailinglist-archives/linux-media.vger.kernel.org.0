Return-Path: <linux-media+bounces-18347-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 89FAF97B1DC
	for <lists+linux-media@lfdr.de>; Tue, 17 Sep 2024 17:35:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 36E431F23B43
	for <lists+linux-media@lfdr.de>; Tue, 17 Sep 2024 15:35:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4B711A01D5;
	Tue, 17 Sep 2024 15:06:22 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC21117AE01
	for <linux-media@vger.kernel.org>; Tue, 17 Sep 2024 15:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.185.170.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726585582; cv=none; b=VudXaCorh46rQ4CUIDjqu2I9wmXXhap3MYGIcFHPthz1nwBVRhRdy/TATBdi3h2cJSxZWZdzzpojxBlNRaKtk6RymQJhOL/aWr95Ce4inB1sMMA6ZqArbKrFuAgrYo/afEVu1sHRFqP5XGk5aYKYN2u17bp/nKDa7X2c+o/I5A0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726585582; c=relaxed/simple;
	bh=XGPahfHi0/KKq7ydoVtlQPayZbK86kFWN10s/Hjyimg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qGBJ7KEIRRZ/vSfdRSMYNEvTR2Yq65/uqCXKHmCDl8zmHlckSHm7V3QHofxFBnlAztnyCU/pctM5RZY6JKBUoluK7xzN/e9DlbICbyXr1rVssAZR2SE03JC9yi+jrBl70/wSVbrVdCxy8NrG+rNoQ/sRK8ZZGBWerH66yDQSajI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=iki.fi; arc=none smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (2a00-1190-d1dd-0-c641-1eff-feae-163c.v6.cust.suomicom.net [IPv6:2a00:1190:d1dd:0:c641:1eff:feae:163c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4X7Q4w5v9vz49Q5X;
	Tue, 17 Sep 2024 18:02:56 +0300 (EEST)
Received: from vihersipuli.localdomain (vihersipuli.localdomain [IPv6:fd35:1bc8:1a6:d3d5::84:2])
	by hillosipuli.retiisi.eu (Postfix) with ESMTP id B4002634C96;
	Tue, 17 Sep 2024 18:02:54 +0300 (EEST)
Received: from sailus by vihersipuli.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@iki.fi>)
	id 1sqZjC-0004ay-1P;
	Tue, 17 Sep 2024 18:02:54 +0300
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	tomi.valkeinen@ideasonboard.com,
	Alain Volmat <alain.volmat@foss.st.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	hverkuil@xs4all.nl
Subject: [PATCH v2 3/3] media: Documentation: Improve v4l2_subdev_{en,dis}able_streams documentation
Date: Tue, 17 Sep 2024 18:02:54 +0300
Message-Id: <20240917150254.17639-4-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20240917150254.17639-1-sakari.ailus@linux.intel.com>
References: <20240917150254.17639-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document that callers of v4l2_subdev_{en,dis}able_streams() need to set
the mask to BIT_ULL(0).

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 include/media/v4l2-subdev.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index 67a6e6ec58b8..6f207b9bc459 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -1685,6 +1685,8 @@ int v4l2_subdev_routing_validate(struct v4l2_subdev *sd,
  * function implements a best-effort compatibility by calling the .s_stream()
  * operation, limited to subdevs that have a single source pad.
  *
+ * Drivers that are not stream-aware shall set @streams_mask to BIT_ULL(0).
+ *
  * Return:
  * * 0: Success
  * * -EALREADY: One of the streams in streams_mask is already enabled
@@ -1715,6 +1717,8 @@ int v4l2_subdev_enable_streams(struct v4l2_subdev *sd, u32 pad,
  * function implements a best-effort compatibility by calling the .s_stream()
  * operation, limited to subdevs that have a single source pad.
  *
+ * Drivers that are not stream-aware shall set @streams_mask to BIT_ULL(0).
+ *
  * Return:
  * * 0: Success
  * * -EALREADY: One of the streams in streams_mask is not enabled
-- 
2.39.5


