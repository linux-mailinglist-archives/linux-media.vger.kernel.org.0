Return-Path: <linux-media+bounces-15522-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED15894096E
	for <lists+linux-media@lfdr.de>; Tue, 30 Jul 2024 09:19:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 286231C22D88
	for <lists+linux-media@lfdr.de>; Tue, 30 Jul 2024 07:19:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5029E18FC6D;
	Tue, 30 Jul 2024 07:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b="c/j0PEYN"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24E12167D98;
	Tue, 30 Jul 2024 07:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.252.153.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722323971; cv=none; b=jpfh+EFGbASK6MwMRE7n33H3SyU7rlGbpu1mNHvpCvzPzsv5NmdOdpSTjzoL7YoYXvZ67u4aFqyyGaDeF4badHvS7ljIge4MYIASFuhpKWPasYRLOeDEYdUk6qzUMntbg/e0bYusbrPXHC+Btres39VsD8vx7ikDmiw/RqVs9HE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722323971; c=relaxed/simple;
	bh=RMaWVUETMYbDGkdMKPLhGUxtjSCrR2DPu/NrgvmaLrk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=eP8KR87YE12Fa058uo0lJPiNXiRMun/bm4l2nlXyX5/XeX2pXVPoa/zQ8kyWhjZ+nRBdhIP+G3ILuT8+c3y2gmhNu6kKJW2Rb/QfbC9YiFI+YWSHdzYmraqqVRwGcWCL9MRmAK6z70xFTjtvmY5bCMoK0Uu0yEYsMWHSc78xSek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net; spf=pass smtp.mailfrom=riseup.net; dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b=c/j0PEYN; arc=none smtp.client-ip=198.252.153.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riseup.net
Received: from fews01-sea.riseup.net (fews01-sea-pn.riseup.net [10.0.1.109])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx0.riseup.net (Postfix) with ESMTPS id 4WY66n3l6Yz9wLp;
	Tue, 30 Jul 2024 07:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
	t=1722323969; bh=RMaWVUETMYbDGkdMKPLhGUxtjSCrR2DPu/NrgvmaLrk=;
	h=From:To:Cc:Subject:Date:From;
	b=c/j0PEYNi1F/HeadiuEFR6SccEBK5gB7H6u2An4+3BeEi1BT/UQ0IufcYPL2mScrX
	 2mjHFWVNhoF9cmQQ/0ctmZjncb6DzTckBn0pjJTnhNT5ruCDJ67E2z7SMOO92vyhRC
	 wfqJIY1PTYca6c/MRtAj7GaQFfVao6l5qciXkF44=
X-Riseup-User-ID: 2F254F26F599A5C4857019593F9CEAF21CBE7D8B47B78CBF02B0D3E66FC6C024
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews01-sea.riseup.net (Postfix) with ESMTPSA id 4WY66h1YhmzJmrB;
	Tue, 30 Jul 2024 07:19:23 +0000 (UTC)
From: Sergio de Almeida Cipriano Junior <sergiosacj@riseup.net>
To: 
Cc: ~lkcamp/patches@lists.sr.ht,
	hdegoede@redhat.com,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	helen.koike@collabora.com
Subject: [PATCH] media: atomisp: move trailing */ to separate lines
Date: Tue, 30 Jul 2024 07:19:04 +0000
Message-Id: <20240730071904.1047-1-sergiosacj@riseup.net>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix checkpatch diagnostic "WARNING: Block comments use a trailing */ on
a separate line" in assert_support.h file.

Signed-off-by: Sergio de Almeida Cipriano Junior <sergiosacj@riseup.net>
---
Hi, this is my first patch to the kernel.
---
 .../media/atomisp/pci/hive_isp_css_include/assert_support.h | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/assert_support.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/assert_support.h
index d294ac402..c5ab13511 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/assert_support.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_include/assert_support.h
@@ -27,7 +27,8 @@
  * #define assert(cnd) BUG_ON(cnd)
  * but that causes many compiler warnings (==errors) under Android
  * because it seems that the BUG_ON() macro is not seen as a check by
- * gcc like the BUG() macro is. */
+ * gcc like the BUG() macro is.
+ */
 #define assert(cnd) \
 	do { \
 		if (!(cnd)) \
@@ -37,7 +38,8 @@
 #ifndef PIPE_GENERATION
 /* Deprecated OP___assert, this is still used in ~1000 places
  * in the code. This will be removed over time.
- * The implementation for the pipe generation tool is in see support.isp.h */
+ * The implementation for the pipe generation tool is in see support.isp.h
+ */
 #define OP___assert(cnd) assert(cnd)
 
 static inline void compile_time_assert(unsigned int cond)
-- 
2.20.1


