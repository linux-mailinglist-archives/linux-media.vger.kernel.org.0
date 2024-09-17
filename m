Return-Path: <linux-media+bounces-18328-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D642D97B046
	for <lists+linux-media@lfdr.de>; Tue, 17 Sep 2024 14:44:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 428AFB21DA8
	for <lists+linux-media@lfdr.de>; Tue, 17 Sep 2024 12:44:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21247173357;
	Tue, 17 Sep 2024 12:43:57 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99D5843150
	for <linux-media@vger.kernel.org>; Tue, 17 Sep 2024 12:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.185.170.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726577036; cv=none; b=c1NVeY+dgcRh/Gkmm+52021GHXxlN+/95GpY9qKb20bmw+JHY3QJpvYhoJj1wM9wn1Hl0klQjzEAJKrlCQoKCyet8/5I/DB7hyG/Btvly3o22xpujWDI2CB75VDaX5EfaKmLPtWP4PmytKc6QaJyUBByP1NNoYLp8//qTNjsPVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726577036; c=relaxed/simple;
	bh=LzkyaGCkD2JJfd7AmZQhSWn4T2xMLYGK4bCQE5j2kLc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=h4F3EN033lLSmwR9ddhP68t+I9qeSntbkIRMyF5w3p+DuIV+mq1hGdPJwKGoj5Okdq5kqZN0GECKQt/UC4GzDm5g+Do8RQnEX9IRokV7MfSnkl+k36X6evNrb6B/OqGTfLinJYRyFJzA5DxumOIdnD3hjczZrrhGXdLc9/iFVoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=iki.fi; arc=none smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (2a00-1190-d1dd-0-c641-1eff-feae-163c.v6.cust.suomicom.net [IPv6:2a00:1190:d1dd:0:c641:1eff:feae:163c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4X7M0L5ZhKz49Q16;
	Tue, 17 Sep 2024 15:43:46 +0300 (EEST)
Received: from vihersipuli.localdomain (vihersipuli.localdomain [IPv6:fd35:1bc8:1a6:d3d5::84:2])
	by hillosipuli.retiisi.eu (Postfix) with ESMTP id 7C8A3634C97;
	Tue, 17 Sep 2024 15:43:45 +0300 (EEST)
Received: from sailus by vihersipuli.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@iki.fi>)
	id 1sqXYX-0004LK-1B;
	Tue, 17 Sep 2024 15:43:45 +0300
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	tomi.valkeinen@ideasonboard.com,
	Alain Volmat <alain.volmat@foss.st.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	hverkuil@xs4all.nl
Subject: [PATCH 2/2] media: Documentation: Update {enable,disable}_streams documentation
Date: Tue, 17 Sep 2024 15:43:45 +0300
Message-Id: <20240917124345.16681-2-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20240917124345.16681-1-sakari.ailus@linux.intel.com>
References: <20240917124345.16681-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the expected {enable,disable}_streams callback behaviour for
drivers that are stream-unaware i.e. don't specify the
V4L2_SUBDEV_CAP_STREAMS sub-device capability flat. In this specific case,
the mask argument can be ignored.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 include/media/v4l2-subdev.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index 3cc6b4a5935f..67a6e6ec58b8 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -834,11 +834,19 @@ struct v4l2_subdev_state {
  *	v4l2_subdev_init_finalize() at initialization time). Do not call
  *	directly, use v4l2_subdev_enable_streams() instead.
  *
+ *	Drivers that support only a single stream without setting the
+ *	V4L2_SUBDEV_CAP_STREAMS sub-device capatility flag do not need to
+ *	be concerned with the mask argument.
+ *
  * @disable_streams: Disable the streams defined in streams_mask on the given
  *	source pad. Subdevs that implement this operation must use the active
  *	state management provided by the subdev core (enabled through a call to
  *	v4l2_subdev_init_finalize() at initialization time). Do not call
  *	directly, use v4l2_subdev_disable_streams() instead.
+ *
+ *	Drivers that support only a single stream without setting the
+ *	V4L2_SUBDEV_CAP_STREAMS sub-device capatility flag do not need to
+ *	be concerned with the mask argument.
  */
 struct v4l2_subdev_pad_ops {
 	int (*enum_mbus_code)(struct v4l2_subdev *sd,
-- 
2.39.5


