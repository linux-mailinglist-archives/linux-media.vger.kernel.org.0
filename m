Return-Path: <linux-media+bounces-40245-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EEAEB2BDCD
	for <lists+linux-media@lfdr.de>; Tue, 19 Aug 2025 11:45:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 098BC1964669
	for <lists+linux-media@lfdr.de>; Tue, 19 Aug 2025 09:46:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16E1031A046;
	Tue, 19 Aug 2025 09:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gj2Fr7FJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BFF2310630
	for <linux-media@vger.kernel.org>; Tue, 19 Aug 2025 09:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755596743; cv=none; b=X0nSom6T10KKC+VGGvtzXTcK1dx61B0ZlVayn7IUh1cQOUKPpMEOSClFChlCkXTPzWtBqjaWpTQW7H0hmT0MeVFupEDY2JTtMxkPJyCUnpVA9WEP0l3S6E/rRFHiiGCoU3xmPoAIXNTaRaF3/xEoGKV2YxZn0pZ1VZybZNb+NP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755596743; c=relaxed/simple;
	bh=fAQpDOxUYUktRjCZDK2Ho/LLJyHPgH0+0DbUO95Rfhg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QtuDIaAxHBtGG3edXYpA10bFfxGqY8cdq4UkXatCOV/u3SNR4JzqXpOq2GoQwsMi+Vlm+wi1jLkmV0+0IwO8hSW1DTOGgJE9Q1MhvVYjlUqx0mUsmsoKYGOZS10voqT8D/Jlh8AA4mv2S8KEGmyoBPohzty5JH2Rc2DQdGf6F1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gj2Fr7FJ; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755596743; x=1787132743;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=fAQpDOxUYUktRjCZDK2Ho/LLJyHPgH0+0DbUO95Rfhg=;
  b=gj2Fr7FJyw/Z2FiaJA/PWWnKCUKy4oFrK+t+WW2xOyvoVHYr30e8JS5s
   sf+nixTBbpfAyTRtUX6304rgULsYoTMb6OAGUEIw6OB73KHa//cPNBOt2
   15yiZt1BPiH+ZLbraWgd8s0180sSAF9eBVrKsGr1au6mnYvrgiksOUycj
   6UCJCBn7SL0fvFUnn1A6zX1fz3XTbnnBXKPqHvP8auQCAz3LWOgMMW3q+
   1ISPj2UKoHr+8i6w4sTN3KfNJIngakQB2qeL245zmCuUHCRHcWKNaVW6M
   ijEYFyKkCAO4Wtae6v2h4vpaAHUopNnv3ur34gg4yOOGMXUlI7iminf88
   w==;
X-CSE-ConnectionGUID: xpIuhzxTSc+5mnPY5mU4Lg==
X-CSE-MsgGUID: RbLrMo3OSkuuY+6Cdr+cGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="57691409"
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; 
   d="scan'208";a="57691409"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2025 02:45:40 -0700
X-CSE-ConnectionGUID: Ap01yjzgTMOGCryPkZ3+qw==
X-CSE-MsgGUID: RPbzKOoyRGizQvZMh1wUCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; 
   d="scan'208";a="172045333"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.148])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2025 02:45:37 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 1C6BD11FBBB;
	Tue, 19 Aug 2025 12:45:34 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uoIuM-000000000bx-0D85;
	Tue, 19 Aug 2025 12:45:34 +0300
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
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: [PATCH v2 0/2] Drop control handler argument support for v4l2_get_link_freq()
Date: Tue, 19 Aug 2025 12:45:30 +0300
Message-ID: <20250819094533.2335-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.2
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

since v1:

- Remove redundant src_pad argument from c3_mipi_csi_start_stream().

Sakari Ailus (2):
  media: amlogic: c3-mipi-csi2: Call v4l2_get_link_freq() on source pad
  media: v4l2-common: Drop the workaround from v4l2_get_link_freq()

 .../amlogic/c3/mipi-csi2/c3-mipi-csi2.c         |  7 +++----
 drivers/media/v4l2-core/v4l2-common.c           | 17 ++++++++---------
 include/media/v4l2-common.h                     | 14 ++------------
 3 files changed, 13 insertions(+), 25 deletions(-)

-- 
2.47.2


