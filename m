Return-Path: <linux-media+bounces-28043-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 786C2A5CC36
	for <lists+linux-media@lfdr.de>; Tue, 11 Mar 2025 18:32:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 376CC189A27D
	for <lists+linux-media@lfdr.de>; Tue, 11 Mar 2025 17:32:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EE3A2620D9;
	Tue, 11 Mar 2025 17:32:17 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx.gpxsee.org (mx.gpxsee.org [37.205.14.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FD061876;
	Tue, 11 Mar 2025 17:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.205.14.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741714337; cv=none; b=D7Ms4cPQ6hUtBh1wm+iRuB0WmSbErz/UNSCdLyQUPEViJVRsoaY2MDESPgokrq/6LQEMluyMNPJ8L2N9EaHnXBg7gSj0PKVaTxxX2dsvlhc9tsYDwGuuSbgXMtO6uFJkK+JEIA83hBWuix4v/JsAYKuFZ6iYWnVwyuLkMypMIE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741714337; c=relaxed/simple;
	bh=yeyYZ85Ho06QZ9y/d0NITYgG6Q4IZtDXDMAK19Z5q04=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=IqekAZAjjBnMTTnvlPiaHNr60oHiUeoUO4SAqgHiSRo9pUuxVXsa1aM908maxo9bB/APazaG8jg6BuKtxFvs4Urwp5AGb458xOXvpYpTpKnCVqNLu5f6Df/c4Cmqm+WD8dc9NYFDRK7+4pyD4EgYe54y5dhqdM4O50oRLESY+e4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gpxsee.org; spf=pass smtp.mailfrom=gpxsee.org; arc=none smtp.client-ip=37.205.14.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gpxsee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gpxsee.org
Received: from mgb4.. (unknown [62.77.71.229])
	by mx.gpxsee.org (Postfix) with ESMTPSA id 948CF40AA9;
	Tue, 11 Mar 2025 18:32:05 +0100 (CET)
From: tumic@gpxsee.org
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Martin=20T=C5=AFma?= <martin.tuma@digiteqautomotive.com>
Subject: [PATCH] docs: media: mgb4: Improve mgb4 driver documentation
Date: Tue, 11 Mar 2025 18:31:41 +0100
Message-ID: <20250311173141.6910-1-tumic@gpxsee.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Martin Tůma <martin.tuma@digiteqautomotive.com>

Add some basic info about the HW/driver + contact info.

Signed-off-by: Martin Tůma <martin.tuma@digiteqautomotive.com>
---
 Documentation/admin-guide/media/mgb4.rst | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/admin-guide/media/mgb4.rst b/Documentation/admin-guide/media/mgb4.rst
index f69d331e3cb1..5ac69b833a7a 100644
--- a/Documentation/admin-guide/media/mgb4.rst
+++ b/Documentation/admin-guide/media/mgb4.rst
@@ -1,8 +1,17 @@
 .. SPDX-License-Identifier: GPL-2.0
 
+.. include:: <isonum.txt>
+
 The mgb4 driver
 ===============
 
+Copyright |copy| 2023 - 2025 Digiteq Automotive
+    author: Martin Tůma <martin.tuma@digiteqautomotive.com>
+
+This is a v4l2 device driver for the Digiteq Automotive FrameGrabber 4, a PCIe
+card capable of capturing and generating FPD-Link III and GMSL2/3 video streams
+as used in the automotive industry.
+
 sysfs interface
 ---------------
 

base-commit: f4b211714bcc70effa60c34d9fa613d182e3ef1e
-- 
2.48.1


