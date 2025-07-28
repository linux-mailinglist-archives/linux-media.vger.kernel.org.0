Return-Path: <linux-media+bounces-38547-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 08866B13820
	for <lists+linux-media@lfdr.de>; Mon, 28 Jul 2025 11:50:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ECFBB7A4EF2
	for <lists+linux-media@lfdr.de>; Mon, 28 Jul 2025 09:48:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE3D025A620;
	Mon, 28 Jul 2025 09:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i/iy5qiO"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D699725A2CD
	for <linux-media@vger.kernel.org>; Mon, 28 Jul 2025 09:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753696112; cv=none; b=FzcfPyHstnIL7HLzowJpjfEgY4DErSADaXHfgeGtz8Zxof43Akzx+TrmIVGTBstYoplERxk2h2FSZgnGHPPnufzjhePerTxoJMepjpt6/XDUX6bD91b2DujCtqB2edb3sguoDWSS+Y8OAmwgCIAQsSqRG6/Qjr/rDJW7pNCVPBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753696112; c=relaxed/simple;
	bh=BR1m7w8c6IEA7tpevv4cxpMHppXtgpO/4fQHCDgog9g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BgSA8GE6GMEFJIyJXcoJrJI4jX4TIcGJ/hKRKY+mi5p8T0Q/+fjX0ChVNLc7KDIWy+AsG8mgV7xHCCx8olGAC7fPDOIzOjDB37bkPrGOv9J688aMrife4RVpZOtnHPETyrf3Ofs9OtEDhBIl0HVal502bmqE/XGLKm0uxWSxGC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i/iy5qiO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE9B8C4CEF6;
	Mon, 28 Jul 2025 09:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753696112;
	bh=BR1m7w8c6IEA7tpevv4cxpMHppXtgpO/4fQHCDgog9g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=i/iy5qiOt4HdFcIL/+RMat8nbPzz+RHMpB1xp0iZWUceUj/wSF27OKgbaa6Dli4K8
	 DmfuF89QZwHOkqZkzbY+FvAgjOnjU1Q2KiJUGuqyCbbCqr1s6h3P16M5OjZY+xMY0X
	 4RGHd4gCqSmCRnw9gtRxmHHfvhyE12Mv6L6gF753ztH1pRJtE9tp+ZoFX8eQWYnnUF
	 sEVGKvkbNRo1iXRdi5jdPR00GBTStdKoHax9DKsyCdOBHVssnDKTENUKCXMImv0PqJ
	 sFPrKmCmQPXqF2l7apx0UBWXh9HfqLFihXNATf0IbDxoxEbCT/v/wdaphhCwXpGeT8
	 iBeB1VXzTKuRw==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil@kernel.org>
Subject: [PATCHv2 3/8] media: v4l2-core: update Hans Verkuil's email address
Date: Mon, 28 Jul 2025 11:46:58 +0200
Message-ID: <2afb8f5bfc09a500a09297aef2855ccbdb0ae8cb.1753696022.git.hverkuil+cisco@kernel.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <cover.1753696022.git.hverkuil+cisco@kernel.org>
References: <cover.1753696022.git.hverkuil+cisco@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hans Verkuil <hverkuil@kernel.org>

Replace hverkuil-cisco@xs4all.nl by hverkuil@kernel.org.

Signed-off-by: Hans Verkuil <hverkuil@kernel.org>
---
 drivers/media/v4l2-core/v4l2-ctrls-api.c     | 2 +-
 drivers/media/v4l2-core/v4l2-ctrls-core.c    | 2 +-
 drivers/media/v4l2-core/v4l2-ctrls-defs.c    | 2 +-
 drivers/media/v4l2-core/v4l2-ctrls-priv.h    | 2 +-
 drivers/media/v4l2-core/v4l2-ctrls-request.c | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-ctrls-api.c b/drivers/media/v4l2-core/v4l2-ctrls-api.c
index d49a68b36c28..1316194015a0 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-api.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-api.c
@@ -2,7 +2,7 @@
 /*
  * V4L2 controls framework uAPI implementation:
  *
- * Copyright (C) 2010-2021  Hans Verkuil <hverkuil-cisco@xs4all.nl>
+ * Copyright (C) 2010-2021  Hans Verkuil <hverkuil@kernel.org>
  */
 
 #define pr_fmt(fmt) "v4l2-ctrls: " fmt
diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
index 98b960775e87..85d07ef44f62 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
@@ -2,7 +2,7 @@
 /*
  * V4L2 controls framework core implementation.
  *
- * Copyright (C) 2010-2021  Hans Verkuil <hverkuil-cisco@xs4all.nl>
+ * Copyright (C) 2010-2021  Hans Verkuil <hverkuil@kernel.org>
  */
 
 #include <linux/export.h>
diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
index 1ea52011247a..ad41f65374e2 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
@@ -2,7 +2,7 @@
 /*
  * V4L2 controls framework control definitions.
  *
- * Copyright (C) 2010-2021  Hans Verkuil <hverkuil-cisco@xs4all.nl>
+ * Copyright (C) 2010-2021  Hans Verkuil <hverkuil@kernel.org>
  */
 
 #include <linux/export.h>
diff --git a/drivers/media/v4l2-core/v4l2-ctrls-priv.h b/drivers/media/v4l2-core/v4l2-ctrls-priv.h
index aba6176fab6c..f4cf273ecf30 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-priv.h
+++ b/drivers/media/v4l2-core/v4l2-ctrls-priv.h
@@ -2,7 +2,7 @@
 /*
  * V4L2 controls framework private header.
  *
- * Copyright (C) 2010-2021  Hans Verkuil <hverkuil-cisco@xs4all.nl>
+ * Copyright (C) 2010-2021  Hans Verkuil <hverkuil@kernel.org>
  */
 
 #ifndef _V4L2_CTRLS_PRIV_H_
diff --git a/drivers/media/v4l2-core/v4l2-ctrls-request.c b/drivers/media/v4l2-core/v4l2-ctrls-request.c
index c637049d7a2b..e77f722b36a4 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-request.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-request.c
@@ -2,7 +2,7 @@
 /*
  * V4L2 controls framework Request API implementation.
  *
- * Copyright (C) 2018-2021  Hans Verkuil <hverkuil-cisco@xs4all.nl>
+ * Copyright (C) 2018-2021  Hans Verkuil <hverkuil@kernel.org>
  */
 
 #define pr_fmt(fmt) "v4l2-ctrls: " fmt
-- 
2.47.2


