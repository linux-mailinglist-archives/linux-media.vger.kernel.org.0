Return-Path: <linux-media+bounces-36-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7324C7E7F02
	for <lists+linux-media@lfdr.de>; Fri, 10 Nov 2023 18:49:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C8655B21FCA
	for <lists+linux-media@lfdr.de>; Fri, 10 Nov 2023 17:49:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1663638FAB;
	Fri, 10 Nov 2023 17:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AJ04Gznt"
X-Original-To: linux-media@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50AA93AC26
	for <linux-media@vger.kernel.org>; Fri, 10 Nov 2023 17:46:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7ACC5250A2
	for <linux-media@vger.kernel.org>; Fri, 10 Nov 2023 01:47:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699609632; x=1731145632;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nA7G0Y53gAS3piFeZHVu56GQRUW+cW2uvSxx2Uf54wA=;
  b=AJ04GzntXdMeLZpVNzdgDmDdZiGnyjYWtCK7bzB1SQ1fyQGbFxxvXeLm
   eCU0aTiNbCd9dTVGfpKZPNv+uvzR3IF5K3JQaFpVbx4h8aiRGf+E2l2e4
   72id2yT1zWUJfcyC5XBzeo/4o5cvzv4ce39dIhMXuzn8wf3bb+3MJ8XZJ
   PaCKB3AdP19LBD6taCt2vGVtGEE2fwGiBv+nymkOS8ladQZupCzX01FlV
   WxowoEj9hIUKJiACf0OX+HvrTkVQV8LO8c9jz1nNp30x0bWqhbjTcuafm
   JSFwaJkSVOG/7Ft8RnGyCL0FoDVhBEWTlDRcjnfjqI8HXc6c51NIzxOrw
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="421253790"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; 
   d="scan'208";a="421253790"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2023 01:47:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="740114809"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; 
   d="scan'208";a="740114809"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2023 01:47:10 -0800
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id AD33B11FB8D;
	Fri, 10 Nov 2023 11:47:07 +0200 (EET)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	hdegoede@redhat.com
Subject: [PATCH 3/6] media: v4l: cci: Add macros to obtain register width
Date: Fri, 10 Nov 2023 11:47:02 +0200
Message-Id: <20231110094705.1367083-4-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231110094705.1367083-1-sakari.ailus@linux.intel.com>
References: <20231110094705.1367083-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add CCI_REG_WIDTH() macro to obtain register width in bits and similarly,
CCI_REG_WIDTH_BYTES() to obtain it in bytes.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 include/media/v4l2-cci.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/media/v4l2-cci.h b/include/media/v4l2-cci.h
index b4ce0a46092c..80eaa7fdc606 100644
--- a/include/media/v4l2-cci.h
+++ b/include/media/v4l2-cci.h
@@ -40,6 +40,9 @@ struct cci_reg_sequence {
 #define CCI_REG_FLAG_PRIVATE_END	31U
 #define CCI_REG_PRIVATE_MASK		GENMASK(CCI_REG_FLAG_PRIVATE_END, CCI_REG_FLAG_PRIVATE_START)
 
+#define CCI_REG_WIDTH_BYTES(x)		(((x) & CCI_REG_WIDTH_MASK) >> CCI_REG_WIDTH_SHIFT)
+#define CCI_REG_WIDTH(x)		(CCI_REG_WIDTH_BYTES(x) << 3)
+
 #define CCI_REG8(x)			((1 << CCI_REG_WIDTH_SHIFT) | (x))
 #define CCI_REG16(x)			((2 << CCI_REG_WIDTH_SHIFT) | (x))
 #define CCI_REG24(x)			((3 << CCI_REG_WIDTH_SHIFT) | (x))
-- 
2.39.2


