Return-Path: <linux-media+bounces-35568-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DF577AE35AF
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 08:28:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A685F1891B7B
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 06:28:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4BCE1E47A8;
	Mon, 23 Jun 2025 06:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JWn09SFr"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8A4D1DFDBB
	for <linux-media@vger.kernel.org>; Mon, 23 Jun 2025 06:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750660084; cv=none; b=PbX9FAhRlSA2pd+Z3neiNmv6b7KL970EeuimhbsbXY5Qaap5ZhBhCQvwvCkpjCmlVx3RLCV9x1l6Lcl5lQEy62V4AJBPEyuZ075HfBbcNMEP9kPQHJScKxOb9Qc2Eas1ZkSrEtIUU7304bsEoG0fZXOIP+e0yMM6Zf8WJekiKBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750660084; c=relaxed/simple;
	bh=Zo+6A93bSvTi7hSgiDBFNsvOyQjuD7cefsM4X8tXF6c=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=FlwKvYFwJIWWLDBMTo5FVn89k4SLOj1nmfKMpSF0H0kMwpkaYZ4MylBuImzwGH0N8uECOR3F6+PFXNe4jutI0KupALOECKQok1yUM0XSDSjN7OW7/0EzEhZEeXTa380wQcBNIDYaeMiVhsI+grNRwkkq1xxw0Or/uoJQ0UwrSuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JWn09SFr; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750660083; x=1782196083;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Zo+6A93bSvTi7hSgiDBFNsvOyQjuD7cefsM4X8tXF6c=;
  b=JWn09SFr1vgOB3X6BU+Uc8LWIJuJW2opSGXJ2ZI0mp2HdReTA8VMOCaQ
   6anCYGNC1vKzYjAuNwlRUSm+OLsmx9Oy9e9vc5Es0NByTqqzIl3MO1EHz
   AzWqHY5UQPxgXJf66FvpwtyabKieCuBVWCZpUTu7iLHb4YWQgVCtUbMyv
   mLbHEnyYWEsFmk4b+WhoKwPxaiKwkiQDxPD3j3eTXSyN0MAv947NwxDse
   tQRjZuLbkC+aw4f+rjpaAwoZf+mbd/MXOYYscrNkBEmCCySqOkKCoin3K
   +Ee0Jwqxzks2KGBDoU/miEODdhMX8DmwSuMA/cdn5Lo6dty8LJ5KsFwyb
   A==;
X-CSE-ConnectionGUID: ymXOmXnBR8qYP6vNi8rjvg==
X-CSE-MsgGUID: dcw85ouSTq+SpdbpHVWYpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11472"; a="52985213"
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; 
   d="scan'208";a="52985213"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2025 23:27:59 -0700
X-CSE-ConnectionGUID: PmoUKEn4QSu8NzuXZRMSjA==
X-CSE-MsgGUID: QmMhHf91R1CpHAvkkWNPzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; 
   d="scan'208";a="175106230"
Received: from abityuts-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.8])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2025 23:27:57 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id E57CE1203EB;
	Mon, 23 Jun 2025 09:27:54 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uTaeo-009ZoO-2g;
	Mon, 23 Jun 2025 09:27:54 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hans@jjverkuil.nl>,
	laurent.pinchart@ideasonboard.com
Subject: [PATCH v3 0/3] Control handler free changes
Date: Mon, 23 Jun 2025 09:27:51 +0300
Message-Id: <20250623062754.2282598-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi folks,

This set changes the control handler's error code handing when the handler
is free and documents it.

since v2:

- Note in the 2nd patch v4l2_ctrl_handler_free() returns 0 if hdl is NULL, also
  avoid NULL pointer dereference in the same case.

- Only Documentation/ changes left in 3rd patch.

since v1:

- Added the Fixes: / Cc: stable tags.

- Added two patches to return the handler's error and document the error
  isn't changed when the handler is freed.

Sakari Ailus (3):
  media: v4l2-ctrls: Don't reset handler's error in
    v4l2_ctrl_handler_free()
  media: v4l2-ctrls: Return the handler's error in
    v4l2_ctrl_handler_free()
  media: Documentation: Document new v4l2_ctrl_handler_free() behaviour

 Documentation/driver-api/media/v4l2-controls.rst |  9 +++------
 drivers/media/v4l2-core/v4l2-ctrls-core.c        | 12 ++++++++----
 include/media/v4l2-ctrls.h                       |  4 +++-
 3 files changed, 14 insertions(+), 11 deletions(-)

-- 
2.39.5


