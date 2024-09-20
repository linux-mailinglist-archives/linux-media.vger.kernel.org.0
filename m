Return-Path: <linux-media+bounces-18408-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DD5D97D1C9
	for <lists+linux-media@lfdr.de>; Fri, 20 Sep 2024 09:35:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 07E4D2855F6
	for <lists+linux-media@lfdr.de>; Fri, 20 Sep 2024 07:35:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABC0653E15;
	Fri, 20 Sep 2024 07:35:15 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8D184502B
	for <linux-media@vger.kernel.org>; Fri, 20 Sep 2024 07:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.140.195.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726817715; cv=none; b=Pvt//y0kszV5c0iXiXihYKiCZzHKJ4dBAEtQm3MYdenPdv1XuqU9+ihKa5WDnvpJ3pO3XLtjq+kgCYuT3+DH7aW2dqKS67Drzxh1HwtKm8toCvvtTgUSfCFl/1Lr4cucB3K+TOB68kFl+1FHwm5489+1LFIn9avGOJ4ECz+9AAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726817715; c=relaxed/simple;
	bh=Dmpiz/wlLaXONtVaOLS06sgyCSQjvNBMpzvcFUSHrRE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=T7dYvvDtSy7Q2p5lFP6q4Y35icVyjBCjWZJJy28Nx8FQwr0M9e1zD7LRW888y3b9LzqUHXIGkzl3iQ/KMxhbXKWKbG0oSXx88AWcRH6lYdrI4TZjlIbpVzPlz970TJ2Zja5VxwBBIdxKQdjMwVyzxZZ7izZB2oaCOSGP6mQoFLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=iki.fi; arc=none smtp.client-ip=195.140.195.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (2a00-1190-d1dd-0-c641-1eff-feae-163c.v6.cust.suomicom.net [IPv6:2a00:1190:d1dd:0:c641:1eff:feae:163c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4X940m4wLTzyQc;
	Fri, 20 Sep 2024 10:35:04 +0300 (EEST)
Received: from vihersipuli.localdomain (vihersipuli.localdomain [IPv6:fd35:1bc8:1a6:d3d5::84:2])
	by hillosipuli.retiisi.eu (Postfix) with ESMTP id 6B09F634C98;
	Fri, 20 Sep 2024 10:35:03 +0300 (EEST)
Received: from sailus by vihersipuli.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@iki.fi>)
	id 1srYAR-0005rt-0b;
	Fri, 20 Sep 2024 10:35:03 +0300
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	tomi.valkeinen@ideasonboard.com,
	Alain Volmat <alain.volmat@foss.st.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	hverkuil@xs4all.nl
Subject: [PATCH v3 2/3] media: Documentation: Update {enable,disable}_streams documentation
Date: Fri, 20 Sep 2024 10:35:02 +0300
Message-Id: <20240920073503.22536-3-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20240920073503.22536-1-sakari.ailus@linux.intel.com>
References: <20240920073503.22536-1-sakari.ailus@linux.intel.com>
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
index 3cc6b4a5935f..ff63fb6046b1 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -834,11 +834,19 @@ struct v4l2_subdev_state {
  *	v4l2_subdev_init_finalize() at initialization time). Do not call
  *	directly, use v4l2_subdev_enable_streams() instead.
  *
+ *	Drivers that support only a single stream without setting the
+ *	V4L2_SUBDEV_CAP_STREAMS sub-device capability flag can ignore the mask
+ *	argument.
+ *
  * @disable_streams: Disable the streams defined in streams_mask on the given
  *	source pad. Subdevs that implement this operation must use the active
  *	state management provided by the subdev core (enabled through a call to
  *	v4l2_subdev_init_finalize() at initialization time). Do not call
  *	directly, use v4l2_subdev_disable_streams() instead.
+ *
+ *	Drivers that support only a single stream without setting the
+ *	V4L2_SUBDEV_CAP_STREAMS sub-device capability flag can ignore the mask
+ *	argument.
  */
 struct v4l2_subdev_pad_ops {
 	int (*enum_mbus_code)(struct v4l2_subdev *sd,
-- 
2.39.5


