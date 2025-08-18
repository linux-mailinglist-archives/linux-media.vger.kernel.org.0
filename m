Return-Path: <linux-media+bounces-40164-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 70A60B2AA7C
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 16:32:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 499185A3FA6
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 14:25:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E721343D8D;
	Mon, 18 Aug 2025 14:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RBJmUhJH"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4381B322C7A
	for <linux-media@vger.kernel.org>; Mon, 18 Aug 2025 14:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755526493; cv=none; b=uqisI44AW2x/oU5PTRUHZ8wE36jgR7plPbojFcrJ9CeKH4ZM7ekvWIAr/roX5HL/oKPkdMqnI2Un1LNJNCts8skmBbaexVWOjNly9rnPhWnZiWUhp1uV7Y5lB/baBsElBm87kK29bXsfHNbG13s4t4hl+ErZYp5Ic6wDY26Njko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755526493; c=relaxed/simple;
	bh=4uM0tE7dterCNMPMkmaolofe5AjzanIhGB4QuBWD35o=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=tcr3Ir9gv58+Uu8mZP4o1iuGtPeObdDbEk54RkMKJF7JDqqajmJPONAsv3flCU6uipw+vJP6AQyy2IbP7IU+lm7D4HMjXz3XZWLtteSs29BFoDpnZSylfIu49KSYLCxaPD2Rcu9LcM3C++YJIanBCF6Ns62spPLamg4MBHT1AtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RBJmUhJH; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755526492; x=1787062492;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=4uM0tE7dterCNMPMkmaolofe5AjzanIhGB4QuBWD35o=;
  b=RBJmUhJHpz1Y8dlPN2lArEKgdgZdZhZY7NQYRkWLqE/9G1YJHBfMWoD7
   TCHpns4OchU3iT9v2IDQqFdjylXjRnQq9X97w2H25gzuscgrwgOmJxUGg
   Vloy8QW664nv5HHXA4Lo7VwOqS6RFieimdCliUVpY2ptsIZG6bcTfzw5l
   MklaIICqHJxx/nPAh0hu/a4vYc49z53qXvV9yPfwn72TTiTIBJxfOAZNi
   z75E47SIksKZ/D02N9P5csv/2KTRIznfncAeDd+EeTjeDvR53jQUyTiJc
   3KU9mK3JKrKU9wDsRu/5svsfmXWj10rQhHJtu2flFNMlb5LUk5pa4alw2
   Q==;
X-CSE-ConnectionGUID: evncg9xxRGytLtR5BeF1QA==
X-CSE-MsgGUID: 03gsnZjfSCiFxAeLLF9vfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="57606990"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="57606990"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2025 07:14:50 -0700
X-CSE-ConnectionGUID: daVpC/zXTzKAH4n66A1Z2A==
X-CSE-MsgGUID: UWI04gfVTR2gh0s9EARBQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="166755393"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.252])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2025 07:14:47 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id F1EAE11FC4F;
	Mon, 18 Aug 2025 17:14:44 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uo0dI-004rv3-2d;
	Mon, 18 Aug 2025 17:14:44 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Keke Li <keke.li@amlogic.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Daniel Scally <dan.scally+renesas@ideasonboard.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 0/2] Drop control handler argument support for v4l2_get_link_freq()
Date: Mon, 18 Aug 2025 17:14:42 +0300
Message-Id: <20250818141444.1160565-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi folks,

This set removes the workaround from v4l2_get_link_freq() that allowed
calling it on a control handler. The Amlogic c3-mipi-csi2 driver is
converted in the process as well.

As a result there's also no definition of v4l2_get_link_freq() without
CONFIG_MEDIA_CONTROLLER but that should be fine now. The Amlogic patch is
untested.

Sakari Ailus (2):
  media: amlogic: c3-mipi-csi2: Call v4l2_get_link_freq() on source pad
  media: v4l2-common: Drop the workaround from v4l2_get_link_freq()

 .../amlogic/c3/mipi-csi2/c3-mipi-csi2.c         |  6 +++---
 drivers/media/v4l2-core/v4l2-common.c           | 17 ++++++++---------
 include/media/v4l2-common.h                     | 14 ++------------
 3 files changed, 13 insertions(+), 24 deletions(-)

-- 
2.39.5


