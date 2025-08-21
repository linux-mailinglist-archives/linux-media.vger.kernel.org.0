Return-Path: <linux-media+bounces-40563-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 82B7BB2F79D
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 14:13:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9779E3AD387
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 12:12:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 800C8311962;
	Thu, 21 Aug 2025 12:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bsaUYHKo"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 716D331158C
	for <linux-media@vger.kernel.org>; Thu, 21 Aug 2025 12:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755778336; cv=none; b=E9axnq8RHQ7rVjAAAQOOD5JYW9q0v1JLpBNRjsnKRZnFPSy/8pmw920D9N7yVxFCXr5rvf/BVx5OxfYZq3wlWdzWp7s9QzlcnVeRprcLFFgJkfMN89C9719jP/HqhCwV2jeXoyU2k/dcQ+pGiEpleUa4L67eHwHxF44lLseLbLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755778336; c=relaxed/simple;
	bh=V+uhF3Rtxgi8Ittcl+bD6Dl3UK5Nh2Zqop7Q8Fwf9iU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=lTqw4Otgxk+OMKdaN1pJb4SVuEdjt/cXnqzUI9Vqa9O9nYgGS6y9ikx8DshmHyCNq7C4r5KzwcFCGj2PjK80WjWRhzyRSFw/Hdwp3Mjo7epZEwqI3a+FF1Vj0DtcsLCMPkGbZaQ71rQsdpy9TFpRXtnJrAINuT9ZDXW4mUMFga4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bsaUYHKo; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755778335; x=1787314335;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=V+uhF3Rtxgi8Ittcl+bD6Dl3UK5Nh2Zqop7Q8Fwf9iU=;
  b=bsaUYHKonsrCbP14YuOqnIa9e99KtSz9d0YhaMHyda1fkn/cWjjsijhy
   B9Uu2U7tYNRby2mrHm5IKZAxzOSh0juLnWw9li5ydCivmTMyxyyLt5/9Q
   HlQ3xTJ2gXTOwEEZDECBp7Mbo8LcHKNQFOgW7Fc3/v+1pe4vSf6u5nmhv
   G//OcaSMxG0S005SpExd2677iWFVw7RPWUbXT6psQIB9Bd0qz2Rpldmn1
   MbEQLPWWHxYKNY64nc7IKhlkX7FM/ENpzjuFpaVOGNfJPpzPbUc52BU3T
   cCszFyZI0WdyCA8hw9TqaW7qdKqp0q1N2QoeYRBeG8eZX9DyG8Kf+Gtsi
   g==;
X-CSE-ConnectionGUID: zTktkU24QBaUNfhqLF1C+A==
X-CSE-MsgGUID: AqWAvTImRH6+WBj9wzW+TA==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="57089508"
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; 
   d="scan'208";a="57089508"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2025 05:12:12 -0700
X-CSE-ConnectionGUID: 8ALM9+viT2SeKmEzRRuFMQ==
X-CSE-MsgGUID: zTdm0skDQCy63Kn2bLFbtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; 
   d="scan'208";a="192077012"
Received: from vpanait-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.237])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2025 05:12:10 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 1548411FC36;
	Thu, 21 Aug 2025 15:12:08 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1up49I-00000002JrX-09IM;
	Thu, 21 Aug 2025 15:12:08 +0300
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
Subject: [PATCH v2 0/3] Drop control handler argument support for v4l2_get_link_freq()
Date: Thu, 21 Aug 2025 15:12:04 +0300
Message-ID: <20250821121207.552993-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi folks,

This set removes the workaround from v4l2_get_link_freq() that allowed
calling it on a control handler. The Amlogic c3-mipi-csi2 driver is
converted in the process as well.

As a result there's also no definition of v4l2_get_link_freq() without
CONFIG_MEDIA_CONTROLLER but that should be fine now. The Amlogic patch is
untested.

since v2:

- Improve documentation for v4l2_get_link_freq(), aligning it to the
  removal of control handler argument support.

- Add a patch to mention the primary source of the link frequency is the
  get_mbus_config pad operation.

since v1:

- Remove redundant src_pad argument from c3_mipi_csi_start_stream().

Sakari Ailus (3):
  media: amlogic: c3-mipi-csi2: Call v4l2_get_link_freq() on source pad
  media: v4l2-common: Drop the workaround from v4l2_get_link_freq()
  media: v4l2-common: Update v4l2_get_link_freq() documentation

 .../amlogic/c3/mipi-csi2/c3-mipi-csi2.c       |  7 +++---
 drivers/media/v4l2-core/v4l2-common.c         | 17 ++++++-------
 include/media/v4l2-common.h                   | 25 ++++++-------------
 3 files changed, 19 insertions(+), 30 deletions(-)

-- 
2.47.2


