Return-Path: <linux-media+bounces-38422-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F06B110A6
	for <lists+linux-media@lfdr.de>; Thu, 24 Jul 2025 20:10:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BF5671C861E2
	for <lists+linux-media@lfdr.de>; Thu, 24 Jul 2025 18:10:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B08422ECD17;
	Thu, 24 Jul 2025 18:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="mNIF5KLb"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 231EA2192F4;
	Thu, 24 Jul 2025 18:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753380633; cv=none; b=WG/Tb+v35Q8GAcftk3avI9UY8ZukRia2mHEYP4MFeK1OFA5VXiecDscztikRq3NXyGnAw4XRPUHkGDz/SaOHVJq+MzfL65CqK8Iw8kSx3THeydm4L/h4Ecsjh586NS0jH11yyoOeYsQIWcTa+33/zkV3Cf+7rpZxR1QaXzFA9c8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753380633; c=relaxed/simple;
	bh=2Mr8c8FxtGPTIoVwYf7Q7TaM+B0dAbU50KR7gWn6+Oc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EIsYsRANinSxHvgChqA+7/0WtDhTUr2mGy/aF0gcPxlPYOJkudsEAwlmpDpYs0hTvUU7q4wQbZK4dtVQr5SyQZpPSuW24urzLFLv/sR6qUH9BHkF26gZYjwQQN0XHirem9mQKeS2l0wFqIosforNl14ClHBThUxu8oDKBPS3AEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=mNIF5KLb; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1753380629;
	bh=2Mr8c8FxtGPTIoVwYf7Q7TaM+B0dAbU50KR7gWn6+Oc=;
	h=From:To:Cc:Subject:Date:From;
	b=mNIF5KLb4Ag7xqH0WffmumdVAEnZs9yfLRZZsd1HhKwH3+Ywj0BN54jLAw+tqeUex
	 CRdE0zQCFPSCh1FEaFQNBDm4xTLK6T+Jyst0A80O2Pl8dQGiASbQs/LB/KkP3PZNzs
	 vgCbiyMVXDe3PgzhGLE4auhXdSs0My4is7SW8Mzd9hP5tmRzOnAPjr1P5mahX0CE7S
	 vzTE321NG1+g1W7I2wybLyGFTdmp5l79Lsnfhb+yZI4n28Nshj4kjJHCpB6f5ZCDXU
	 4f4Q8KWm2X9ESSns/L/3MmDDfTtmUe6dg3xTTpIZClvRYLGpmYfJAI3AqSoxAaQ+QU
	 BSLpHtdp8Ql4g==
Received: from earth.mtl.collabora.ca (mtl.collabora.ca [66.171.169.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7DF3A17E0FA8;
	Thu, 24 Jul 2025 20:10:27 +0200 (CEST)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Fritz Koenig <frkoenig@chromium.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Sebastian Fricke <sebastian.fricke@collabora.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Hans de Goede <hansg@kernel.org>,
	Yunke Cao <yunkec@google.com>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	James Cowgill <james.cowgill@blaize.com>,
	linux-media@vger.kernel.org,
	kernel@collabora.com
Subject: [PATCH v2 0/2] media: Add HEVC long and short term ref pic sets controls
Date: Thu, 24 Jul 2025 14:10:17 -0400
Message-ID: <20250724181019.242514-1-detlev.casanova@collabora.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

New v4l2 controls for HEVC are added to be able to send the missing long
and short term RPS information to the driver.

Both controls have a dynamic size to send up to 65 sets each.

The controls take raw data as they are read from the video stream.

Detlev Casanova (2):
  media: uapi: HEVC: Add v4l2_ctrl_hevc_ext_sps_[ls]t_rps controls
  media: v4l2-ctrls: Add hevc_ext_sps_[ls]t_rps controls

 .../media/v4l/ext-ctrls-codec-stateless.rst   | 114 ++++++++++++++++++
 .../media/v4l/vidioc-queryctrl.rst            |  12 ++
 drivers/media/v4l2-core/v4l2-ctrls-core.c     |  18 +++
 drivers/media/v4l2-core/v4l2-ctrls-defs.c     |  10 ++
 include/uapi/linux/v4l2-controls.h            |  61 ++++++++++
 include/uapi/linux/videodev2.h                |   2 +
 6 files changed, 217 insertions(+)

-- 
2.50.1


