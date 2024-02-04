Return-Path: <linux-media+bounces-4660-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0558484908F
	for <lists+linux-media@lfdr.de>; Sun,  4 Feb 2024 22:07:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 37AFA1C21CCB
	for <lists+linux-media@lfdr.de>; Sun,  4 Feb 2024 21:07:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A07E3399C;
	Sun,  4 Feb 2024 21:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZtXwh6f1"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F42042C690
	for <linux-media@vger.kernel.org>; Sun,  4 Feb 2024 21:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707080821; cv=none; b=tftBA1u8zftmV7Bclb3eROLO1vFXaDyfpX2W96v9UvykqN9yli4lEXts3tcZP0NHBXwCMo4hAEBxixn0GOxJZGWpMg4X3pzuNEj3fYfDGsMqgBRzG5+jH5LOvSIouUGESDvH4VXB/yZASuzG8zfNhfjk6A0fHNrmTN974/oa6y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707080821; c=relaxed/simple;
	bh=s3Q4YPmrEwdqpyv003bKUhE/UnyFNV1MFRcaQYGVlhA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ONyBM0/TPM0VMITefk4UqAD24pNwf/KIL/I73XGjnu4mGmTSEB+s17MnBp9A3Ria8DtaIMnLx35ue4a9hY5dmwlq4JcDNAeA9H+lwQ76v6AwUIBdX98M/slebubCvQdyjQgeHuNm8qad4NCIjYe2vvODHKnyQPrzCTKa2DBhLBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZtXwh6f1; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707080820; x=1738616820;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=s3Q4YPmrEwdqpyv003bKUhE/UnyFNV1MFRcaQYGVlhA=;
  b=ZtXwh6f1LMJTN8xyn3CUa11B/sYOJmeOVzzyRRA3JJOZ8deu8pysnaaX
   Whf1J+eKPUmNLLK6hOshxxeKQ97y0pRHc+3XHAFxbalNkgwafzmm4mo5L
   2vAfuH3hUrO/wzsxhVIK8ppoaJIcs9cFBhNVXPlJlCoIDOQ2Rv0oTa7zR
   0pzf/jdFWovJrD7HIdttr/wBh3321IHSrYF2aj21sG4ObI6LA6SgnLCY6
   yzLOkpklTzaqGTw0EynehPerSKT2RSVWMm1nwBUhmM5zFaEHRxW1pf5Vw
   Ja4YzHvRS+p7DKp5y8iaOZzXp7/KIpOHG/59CDljmnp4IjYDAmAwNEXgI
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10973"; a="309639"
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; 
   d="scan'208";a="309639"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2024 13:06:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10973"; a="823694903"
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; 
   d="scan'208";a="823694903"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2024 13:06:55 -0800
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id B0EC811F8D2;
	Sun,  4 Feb 2024 23:06:52 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1rWjhU-002uX6-26;
	Sun, 04 Feb 2024 23:06:52 +0200
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com
Subject: [PATCH 1/2] media: dt-bindings: Revert changes to video-interfaces.yaml
Date: Sun,  4 Feb 2024 23:06:41 +0200
Message-Id: <20240204210642.693958-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit feb8831be9d4 ("media: ov08x40: Reduce start streaming time")
introduced an unintentional change to
Documentation/devicetree/bindings/media/video-interfaces.yaml. Revert this
change now.

Reported-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Fixes: feb8831be9d4 ("media: ov08x40: Reduce start streaming time")
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 Documentation/devicetree/bindings/media/video-interfaces.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/video-interfaces.yaml b/Documentation/devicetree/bindings/media/video-interfaces.yaml
index ea511f2fed98..26e3e7d7c67b 100644
--- a/Documentation/devicetree/bindings/media/video-interfaces.yaml
+++ b/Documentation/devicetree/bindings/media/video-interfaces.yaml
@@ -190,7 +190,7 @@ properties:
       Allow MIPI CSI-2 non-continuous clock mode.
 
   link-frequencies:
-    $ref: /schemas/types.yaml#/definitions/uint32-array
+    $ref: /schemas/types.yaml#/definitions/uint64-array
     description:
       Allowed data bus frequencies. For MIPI CSI-2, for instance, this is the
       actual frequency of the bus, not bits per clock per lane value. An array
-- 
2.39.2


