Return-Path: <linux-media+bounces-18345-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AAB0797B1D4
	for <lists+linux-media@lfdr.de>; Tue, 17 Sep 2024 17:34:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 38873B29B13
	for <lists+linux-media@lfdr.de>; Tue, 17 Sep 2024 15:34:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 610AB19F438;
	Tue, 17 Sep 2024 15:03:25 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92F0719F41B
	for <linux-media@vger.kernel.org>; Tue, 17 Sep 2024 15:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.185.170.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726585405; cv=none; b=uRwrS6cght3KXIP5h+MUCR5h7OeYwbNQPRnl8b21/3FPoV+rBKAH9hO/Eni+2H/URvs/cl+y0IBKGPSOGBtKbfteuwBTD1ZOBvuJoQxNq4QZw8fLZZPavi8EL6uKd8byZ3gEAqX8a1w6gW2AR5ld4JsXd6R2P8G+nA/oW4yXCfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726585405; c=relaxed/simple;
	bh=WpM1m8akYeGngebaaTO1twhMB3PgGGeI2xWDI9ftoCA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=BXcPk9z/MSD80mx/K69g+TlWRI3qbySLoP9RLigCfvp9jhyS6E5xBtUOlqixTpfwfh54ExkK4unPvTewV8MEmDxWUJGK5Uel6KhTLOguME5c4SnFhqSa/o0TGE5dYjktfeDEZXNx/el1Rsn5P1rydGA+3M1aEd6E8ihOhKpuigw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=iki.fi; arc=none smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (80-248-247-191.cust.suomicom.net [80.248.247.191])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4X7Q4x1Bs3z49Q5b;
	Tue, 17 Sep 2024 18:02:57 +0300 (EEST)
Received: from vihersipuli.localdomain (vihersipuli.localdomain [IPv6:fd35:1bc8:1a6:d3d5::84:2])
	by hillosipuli.retiisi.eu (Postfix) with ESMTP id BB319634C98;
	Tue, 17 Sep 2024 18:02:54 +0300 (EEST)
Received: from sailus by vihersipuli.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@iki.fi>)
	id 1sqZjC-0004an-0z;
	Tue, 17 Sep 2024 18:02:54 +0300
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	tomi.valkeinen@ideasonboard.com,
	Alain Volmat <alain.volmat@foss.st.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	hverkuil@xs4all.nl
Subject: [PATCH v2 0/3] Update streaming related documentation
Date: Tue, 17 Sep 2024 18:02:51 +0300
Message-Id: <20240917150254.17639-1-sakari.ailus@linux.intel.com>
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


