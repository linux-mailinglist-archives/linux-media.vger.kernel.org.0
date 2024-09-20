Return-Path: <linux-media+bounces-18407-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E44F697D1C8
	for <lists+linux-media@lfdr.de>; Fri, 20 Sep 2024 09:35:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 207511C220B2
	for <lists+linux-media@lfdr.de>; Fri, 20 Sep 2024 07:35:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D3D34D8D0;
	Fri, 20 Sep 2024 07:35:15 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8D4245948
	for <linux-media@vger.kernel.org>; Fri, 20 Sep 2024 07:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.140.195.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726817714; cv=none; b=dIRiz66+cFeEwcs3Y1D2g6IOmKoKAnODhiQrdBO8N1MzNbRuuL/KJoQHB7euobx4mJzuM9ea7fagQF7qKwZMztCZUsiJZeNf0Fqa2nuMNoST+hcdG/5i7M0l5msrlLr6E49YQpB0EXOFH83I8NJflo0I/gCrtpbsn0qu46ZLkfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726817714; c=relaxed/simple;
	bh=ZFlg0wDL3/hRzACYIEEg8XpVlK1+xmIbiDwKCYeBjW8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=vAJYtft5DSCZ31hLoVjC+hsK/7KFA38qvG7iXoeGX8pTuRqXW1x8DMjJ1jUEL4RzDfJaPYu4bfKwlQqH9M0X9OX1F9wCxmJIDYw2bkEj7alVuCy8DsTx/Oz9afEpmmeHVQZos3KBHYgnedf6o8mzFBCwqu+NKnfsHeFEb8hW0Wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=iki.fi; arc=none smtp.client-ip=195.140.195.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (2a00-1190-d1dd-0-c641-1eff-feae-163c.v6.cust.suomicom.net [IPv6:2a00:1190:d1dd:0:c641:1eff:feae:163c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4X940m56KHzyTZ;
	Fri, 20 Sep 2024 10:35:04 +0300 (EEST)
Received: from vihersipuli.localdomain (vihersipuli.localdomain [IPv6:fd35:1bc8:1a6:d3d5::84:2])
	by hillosipuli.retiisi.eu (Postfix) with ESMTP id 4822B634C96;
	Fri, 20 Sep 2024 10:35:03 +0300 (EEST)
Received: from sailus by vihersipuli.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@iki.fi>)
	id 1srYAR-0005rm-0H;
	Fri, 20 Sep 2024 10:35:03 +0300
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	tomi.valkeinen@ideasonboard.com,
	Alain Volmat <alain.volmat@foss.st.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	hverkuil@xs4all.nl
Subject: [PATCH v3 0/3] Update streaming related documentation
Date: Fri, 20 Sep 2024 10:35:00 +0300
Message-Id: <20240920073503.22536-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi folks,

This set updates streaming starting and stopping related documentation.

since v2:

- Fix spelling in the commit message of the 1st patch.

- Improved language in the 2nd patch as suggested by Laurent.

since v1:

- Document the use of v4l2_subdev_{en,dis}able_streams() and setting the
  streams_mask for drivers that do not support streams.

Sakari Ailus (3):
  media: Documentation: Deprecate s_stream video op, update docs
  media: Documentation: Update {enable,disable}_streams documentation
  media: Documentation: Improve v4l2_subdev_{en,dis}able_streams
    documentation

 .../driver-api/media/camera-sensor.rst          |  8 ++++----
 Documentation/driver-api/media/tx-rx.rst        | 13 ++++++++-----
 include/media/v4l2-subdev.h                     | 17 +++++++++++++++--
 3 files changed, 27 insertions(+), 11 deletions(-)

-- 
2.39.5


