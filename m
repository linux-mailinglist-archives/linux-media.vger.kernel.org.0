Return-Path: <linux-media+bounces-44902-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 95565BE8F6D
	for <lists+linux-media@lfdr.de>; Fri, 17 Oct 2025 15:41:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3AF901899FC1
	for <lists+linux-media@lfdr.de>; Fri, 17 Oct 2025 13:39:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E8AD3570D0;
	Fri, 17 Oct 2025 13:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uhFJSuPL"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDB942F6910
	for <linux-media@vger.kernel.org>; Fri, 17 Oct 2025 13:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760708329; cv=none; b=lBPjtMk/d5FviXLGZw2Um93GrgwjKy9a03vLkcXwLn5Zu4ZqinVDGxhKMlNFD5toNGrBQ8CvSXzZndnyfMo9E6ADlcyTyqwb+PD+f51p4G4ulzs9L4hJ+SyMhl6qp7HQM2Ehhi6gYZW6lzOqH/iEfIg2Nbyzk4dUSHE1WWsLgds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760708329; c=relaxed/simple;
	bh=NOojYF3ov7MlW8j+GsHtt8ExAS7Di90lib2/vDODacY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xo6+V0elham180gulrxXkiFOFsqplio1erSKRR1C9Oas5FZ3iQ/db6XPLXFWzyLljydL/Ztty1Yvunsx9iEKWKVE0hQprFjH2s7BMxfzx8u2LfjNCdCwnCYPo4A1bSInpWnhKLGqeo2QIWZ89NGDkrhBc0lcjkqiqu4TOggC8n0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uhFJSuPL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58760C4CEE7;
	Fri, 17 Oct 2025 13:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760708329;
	bh=NOojYF3ov7MlW8j+GsHtt8ExAS7Di90lib2/vDODacY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uhFJSuPLARUySFcT/3JBpBlk0D2MVYrkYKMabYTGAdybonri2kNuz8jI8xyYLtoxy
	 Lk5VnVuY0j9eZG69My+pt9WOGA5m8SNwPMl1UGdMuFykbgmS3sn9FZXYT0LAikw6Az
	 ydKlOvr2Y+Rvf6JF6m1kdVFp99eTs+8Wz60on8iIX3RhcFWY1Ezh+JleeW+opZ+Pjh
	 YkpDNc7IT9uSZ8JWQothMyIEV7ZOxYwREDECzUcicEoitzw+uhMAT/IEFVCNppewr4
	 EAu+D4aEBzjJf0sQBfZg6j2O5fMqsRG8mIxRw1MjJ9UyKunh9PqqHbnPq40XibPuD/
	 zfcUrlRtyEC9w==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	laurent.pinchart@ideasonboard.com,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: [PATCH 11/14] media: omap3isp: ispccp2: always clamp in ccp2_try_format()
Date: Fri, 17 Oct 2025 15:26:48 +0200
Message-ID: <1a02613f035d214ceba431504d9e5567624800ea.1760707611.git.hverkuil+cisco@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1760707611.git.hverkuil+cisco@kernel.org>
References: <cover.1760707611.git.hverkuil+cisco@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If ccp2->input == CCP2_INPUT_NONE, then try_format didn't clamp
the width and height. This can happen with v4l2-compliance tests.

Always clamp.

This fixes this v4l2-compliance error:

	fail: v4l2-test-subdevs.cpp(171): fse.max_width == ~0U || fse.max_height == ~0U
	fail: v4l2-test-subdevs.cpp(270): ret && ret != ENOTTY
test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: FAIL

Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
 drivers/media/platform/ti/omap3isp/ispccp2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/ti/omap3isp/ispccp2.c b/drivers/media/platform/ti/omap3isp/ispccp2.c
index f4147c79639c..d668111b44f4 100644
--- a/drivers/media/platform/ti/omap3isp/ispccp2.c
+++ b/drivers/media/platform/ti/omap3isp/ispccp2.c
@@ -658,7 +658,7 @@ static void ccp2_try_format(struct isp_ccp2_device *ccp2,
 			fmt->height = clamp_t(u32, fmt->height,
 					      ISPCCP2_DAT_SIZE_MIN,
 					      ISPCCP2_DAT_SIZE_MAX);
-		} else if (ccp2->input == CCP2_INPUT_MEMORY) {
+		} else {
 			fmt->width = clamp_t(u32, fmt->width,
 					     ISPCCP2_LCM_HSIZE_COUNT_MIN,
 					     ISPCCP2_LCM_HSIZE_COUNT_MAX);
-- 
2.51.0


