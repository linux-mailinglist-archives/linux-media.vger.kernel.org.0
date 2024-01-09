Return-Path: <linux-media+bounces-3395-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EBD1B8285D1
	for <lists+linux-media@lfdr.de>; Tue,  9 Jan 2024 13:12:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 125FE1C23F39
	for <lists+linux-media@lfdr.de>; Tue,  9 Jan 2024 12:12:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C6DD374F3;
	Tue,  9 Jan 2024 12:12:47 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx.gpxsee.org (mx.gpxsee.org [37.205.14.76])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2503374CB
	for <linux-media@vger.kernel.org>; Tue,  9 Jan 2024 12:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gpxsee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gpxsee.org
Received: from mgb4.digiteq.red (unknown [62.77.71.229])
	by mx.gpxsee.org (Postfix) with ESMTPSA id 142745E49B;
	Tue,  9 Jan 2024 13:12:42 +0100 (CET)
From: tumic@gpxsee.org
To: linux-media@vger.kernel.org
Cc: =?UTF-8?q?Martin=20T=C5=AFma?= <martin.tuma@digiteqautomotive.com>
Subject: [PATCH] Fixed qv4l2 crash with drivers that implement VIDIOC_ENUM_FRAMESIZES for outputs
Date: Tue,  9 Jan 2024 14:12:44 +0100
Message-ID: <20240109131244.10357-1-tumic@gpxsee.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Martin Tůma <martin.tuma@digiteqautomotive.com>

When a v4l2 driver implements VIDIOC_ENUM_FRAMESIZES for an output, qv4l2
crashes on accessing the "frame size widget" that does not exist. This patch
adds a proper check for the widget not being NULL.

Signed-off-by: Martin Tůma <martin.tuma@digiteqautomotive.com>
---
 utils/qv4l2/general-tab.cpp | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/utils/qv4l2/general-tab.cpp b/utils/qv4l2/general-tab.cpp
index ffa44eca..bceaab09 100644
--- a/utils/qv4l2/general-tab.cpp
+++ b/utils/qv4l2/general-tab.cpp
@@ -2165,13 +2165,16 @@ void GeneralTab::updateFrameSize()
 
 	ok = !enum_framesizes(frmsize, m_pixelformat);
 	if (ok && frmsize.type == V4L2_FRMSIZE_TYPE_DISCRETE) {
-		do {
-			m_frameSize->addItem(QString("%1x%2")
-				.arg(frmsize.discrete.width).arg(frmsize.discrete.height));
-			if (frmsize.discrete.width == m_width &&
-			    frmsize.discrete.height == m_height)
-				m_frameSize->setCurrentIndex(frmsize.index);
-		} while (!enum_framesizes(frmsize));
+		if (m_frameSize) {
+			do {
+				m_frameSize->addItem(QString("%1x%2")
+					.arg(frmsize.discrete.width)
+					.arg(frmsize.discrete.height));
+				if (frmsize.discrete.width == m_width &&
+				    frmsize.discrete.height == m_height)
+					m_frameSize->setCurrentIndex(frmsize.index);
+			} while (!enum_framesizes(frmsize));
+		}
 
 		m_discreteSizes = true;
 		m_frameWidth->setEnabled(false);
@@ -2187,7 +2190,8 @@ void GeneralTab::updateFrameSize()
 		m_frameHeight->setMaximum(m_height);
 		m_frameHeight->setValue(m_height);
 		m_frameHeight->blockSignals(false);
-		m_frameSize->setEnabled(!m_haveBuffers);
+		if (m_frameSize)
+			m_frameSize->setEnabled(!m_haveBuffers);
 		updateFrameInterval();
 		return;
 	}
-- 
2.43.0


