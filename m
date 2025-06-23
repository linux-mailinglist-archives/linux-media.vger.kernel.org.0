Return-Path: <linux-media+bounces-35630-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D4B9AE4041
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 14:30:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 13A193A4785
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 12:23:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 362FC242D68;
	Mon, 23 Jun 2025 12:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XIiic/Pv"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC36424293F
	for <linux-media@vger.kernel.org>; Mon, 23 Jun 2025 12:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750681401; cv=none; b=j4Il/I+vM4Lheg4e0HjY/v+nFxLBdtgtktyBvE+bIN/f5LzzAbJTB8ZvEFt0i6BHclhaXvwtt/Wzf0xACTpyYgeo+xJrNUt1DGPZLdMfE1b7l8RAnIX4xM4kiGv61tvttQQMpm5oQA0DNgvMfDee5tdxTeE8FJghrS8r25ujYhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750681401; c=relaxed/simple;
	bh=62V1jIaipwCCCnp3JmD6NrQj3foTLCfQZDR+Ee/3YCw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=uetv88wg1McioVCPVR/okh6Cqnlk3A30oqxuqlidVA7CTg810N757OAK7IkkaUa5gMNo1eItPiUiubMRyFTvO45C8PR/IY1YiWEn9hz7l1tRGfhnbeDholTpVIFNDD/QT01zTDUCd1Nc0XtqS/WsqKZrC9VV/dC/YbOJBGXufDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XIiic/Pv; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750681400; x=1782217400;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=62V1jIaipwCCCnp3JmD6NrQj3foTLCfQZDR+Ee/3YCw=;
  b=XIiic/Pvy+eol7cpvwBAsN2Q2rmW+N2v4jY+gMwY3DPjjar0cJqmujgS
   Nf8KR1bf85noWnuHcOvnlixLGPs0WZn3gIjHX1QiZu2wANlfsE09kmDqt
   jk44pH0aFJpK8Hjut41nJb9Dvbff5TptOKVuljgfhQOBSuCmY+YCv0oJ0
   87rUn4/jzZIURbD8yvliuvSl4vP2YnTew2jLJVvAf6hc8SfKjtk7kXxST
   8c72xD3YfqxSJ1wzmoao+SOhP+pTKK0CI6f1sLRA/+cOmpAJ/WWZZIAvN
   yeICwVhu5Ro2Dogj3CZebQfJUQWkodYjlNJd5eWru6HPSz+WQ+ASC8YB9
   A==;
X-CSE-ConnectionGUID: u/nK+BNuQgy2R+FPZ5+2GQ==
X-CSE-MsgGUID: WeqfrD0sQoSv1YGZWxJgpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="52956840"
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; 
   d="scan'208";a="52956840"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 05:23:19 -0700
X-CSE-ConnectionGUID: iLRGQsBCQWKUhtqfopn7oQ==
X-CSE-MsgGUID: K0CBhuJ7R3C4zgGIh5peFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; 
   d="scan'208";a="151055931"
Received: from abityuts-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.8])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 05:23:18 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 57ABE1201F7;
	Mon, 23 Jun 2025 15:23:15 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uTgCh-009qTF-0n;
	Mon, 23 Jun 2025 15:23:15 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hans@jjverkuil.nl>,
	laurent.pinchart@ideasonboard.com
Subject: [PATCH v3 0/3] Control handler free changes
Date: Mon, 23 Jun 2025 15:23:11 +0300
Message-Id: <20250623122314.2346635-1-sakari.ailus@linux.intel.com>
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

since v3:

- Use ! for NULL checks, instead of comparing with NULL, in 2nd patch

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


