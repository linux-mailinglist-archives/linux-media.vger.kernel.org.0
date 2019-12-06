Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D41C7114F18
	for <lists+linux-media@lfdr.de>; Fri,  6 Dec 2019 11:33:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726251AbfLFKdl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Dec 2019 05:33:41 -0500
Received: from aer-iport-1.cisco.com ([173.38.203.51]:61788 "EHLO
        aer-iport-1.cisco.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726157AbfLFKdl (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 6 Dec 2019 05:33:41 -0500
X-Greylist: delayed 427 seconds by postgrey-1.27 at vger.kernel.org; Fri, 06 Dec 2019 05:33:39 EST
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=5520; q=dns/txt; s=iport;
  t=1575628419; x=1576838019;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=5cFMz6XUZqcLRj8d1q/+hDEJTcxFmLaEMUw5lG/1bS8=;
  b=CNQOyiEUghvZEKDLsNhmmzXPtlf19703bKbQaV927nEDxfSeusFcMxVx
   cahUdiW9gwi3wse6xN1lMxoSTYCMr/HpMNjLbNOc0+zO7gCsrMYEQjbcJ
   LBLGBzzC+slnRmhO64WuFqYXzYrfENhywdzFI71hsR7Zet8vxo+rZuoAV
   w=;
X-IronPort-AV: E=Sophos;i="5.69,284,1571702400"; 
   d="scan'208";a="20087399"
Received: from aer-iport-nat.cisco.com (HELO aer-core-2.cisco.com) ([173.38.203.22])
  by aer-iport-1.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 06 Dec 2019 10:26:31 +0000
Received: from BWintherLinux.rd.cisco.com ([10.47.77.148])
        by aer-core-2.cisco.com (8.15.2/8.15.2) with ESMTP id xB6AQURZ002104;
        Fri, 6 Dec 2019 10:26:30 GMT
From:   bwinther@cisco.com
To:     linux-media@vger.kernel.org
Cc:     =?UTF-8?q?B=C3=A5rd=20Eirik=20Winther?= <bwinther@cisco.com>
Subject: [PATCH] qvidcap: Add stride option to command line
Date:   Fri,  6 Dec 2019 11:26:29 +0100
Message-Id: <20191206102629.18196-1-bwinther@cisco.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 10.47.77.148, [10.47.77.148]
X-Outbound-Node: aer-core-2.cisco.com
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Bård Eirik Winther <bwinther@cisco.com>

Add new hotkeys Shift+Left and Shift+Right to decrase or increase stride.

Signed-off-by: Bård Eirik Winther <bwinther@cisco.com>
---
 utils/qvidcap/capture.cpp | 38 ++++++++++++++++++++++++++++++++++----
 utils/qvidcap/capture.h   |  2 ++
 utils/qvidcap/qvidcap.cpp |  6 ++++++
 3 files changed, 42 insertions(+), 4 deletions(-)

diff --git a/utils/qvidcap/capture.cpp b/utils/qvidcap/capture.cpp
index a76dd2b6..e2903fb5 100644
--- a/utils/qvidcap/capture.cpp
+++ b/utils/qvidcap/capture.cpp
@@ -571,6 +571,7 @@ void CaptureWin::keyPressEvent(QKeyEvent *event)
 {
 	unsigned w = m_v4l_fmt.g_width();
 	unsigned h = m_v4l_fmt.g_frame_height();
+	unsigned p = m_overrideHorPadding;
 	bool hasShift = event->modifiers() & Qt::ShiftModifier;
 	bool hasCtrl = event->modifiers() & Qt::ControlModifier;
 	bool scalingEnabled = m_canOverrideResolution &&
@@ -587,12 +588,22 @@ void CaptureWin::keyPressEvent(QKeyEvent *event)
 		if (!m_scrollArea->isFullScreen())
 			return;
 	case Qt::Key_Left:
-		if (scalingEnabled && w > 16)
-			w -= 2;
+		if (hasShift) {
+			if (scalingEnabled && p >= 2)
+				p -= 2;
+		} else {
+			if (scalingEnabled && w > 16)
+				w -= 2;
+		}
 		break;
 	case Qt::Key_Right:
-		if (scalingEnabled && w < 10240)
-			w += 2;
+		if (hasShift) {
+			if (scalingEnabled && p < 10240)
+				p += 2;
+		} else {
+			if (scalingEnabled && w < 10240)
+				w += 2;
+		}
 		break;
 	case Qt::Key_Up:
 		if (scalingEnabled && h > 16)
@@ -675,6 +686,12 @@ void CaptureWin::keyPressEvent(QKeyEvent *event)
 			m_scrollArea->resize(w, h);
 		else
 			resize(w, h);
+
+		if (p != m_v4l_fmt.g_bytesperline()) {
+			printf("New horizontal resolution: %u + %u (%u)\n", w, p, w + p);
+			setOverrideHorPadding(p);
+			updateShader();
+		}
 	}
 }
 
@@ -747,6 +764,14 @@ void CaptureWin::setOverrideHeight(__u32 h)
 		m_resolutionOverride->setChecked(true);
 }
 
+void CaptureWin::setOverrideHorPadding(__u32 p)
+{
+	m_overrideHorPadding = p;
+
+	if (!m_overrideHorPadding && m_canOverrideResolution)
+		m_resolutionOverride->setChecked(true);
+}
+
 void CaptureWin::setModeV4L2(cv4l_fd *fd)
 {
 	m_mode = AppModeV4L2;
@@ -953,6 +978,8 @@ bool CaptureWin::setV4LFormat(cv4l_fmt &fmt)
 	}
 	if (m_mode == AppModeFile && m_overrideWidth)
 		fmt.s_width(m_overrideWidth);
+	if (m_mode == AppModeFile && m_overrideHorPadding)
+		fmt.s_bytesperline(fmt.g_bytesperline() + m_overrideHorPadding);
 	if (m_mode == AppModeFile && m_overrideField != 0xffffffff)
 		fmt.s_field(m_overrideField);
 	if (m_mode == AppModeFile && m_overrideHeight)
@@ -1350,6 +1377,9 @@ void CaptureWin::initImageFormat()
 	tpg_s_quantization(&m_tpg, m_v4l_fmt.g_quantization());
 	m_v4l_fmt.s_num_planes(tpg_g_buffers(&m_tpg));
 	for (unsigned p = 0; p < m_v4l_fmt.g_num_planes(); p++) {
+		if (m_mode == AppModeFile && m_overrideHorPadding)
+			tpg_s_bytesperline(&m_tpg, p, tpg_g_bytesperline(&m_tpg, p) + m_overrideHorPadding);
+
 		m_v4l_fmt.s_bytesperline(tpg_g_bytesperline(&m_tpg, p), p);
 		m_v4l_fmt.s_sizeimage(tpg_calc_plane_size(&m_tpg, p), p);
 	}
diff --git a/utils/qvidcap/capture.h b/utils/qvidcap/capture.h
index 19e845a8..a6debb47 100644
--- a/utils/qvidcap/capture.h
+++ b/utils/qvidcap/capture.h
@@ -82,6 +82,7 @@ public:
 	bool updateV4LFormat(const cv4l_fmt &fmt);
 	void setOverrideWidth(__u32 w);
 	void setOverrideHeight(__u32 h);
+	void setOverrideHorPadding(__u32 p);
 	void setCount(unsigned cnt) { m_cnt = cnt; }
 	void setReportTimings(bool report) { m_reportTimings = report; }
 	void setVerbose(bool verbose) { m_verbose = verbose; }
@@ -192,6 +193,7 @@ private:
 	__u32 m_overridePixelFormat;
 	__u32 m_overrideWidth;
 	__u32 m_overrideHeight;
+	__u32 m_overrideHorPadding;
 	__u32 m_overrideField;
 	__u32 m_overrideColorspace;
 	__u32 m_overrideYCbCrEnc;
diff --git a/utils/qvidcap/qvidcap.cpp b/utils/qvidcap/qvidcap.cpp
index a8a5905d..5c1356c1 100644
--- a/utils/qvidcap/qvidcap.cpp
+++ b/utils/qvidcap/qvidcap.cpp
@@ -72,6 +72,7 @@ static void usage()
 	       "\n"
 	       "  -W, --width=<width>      set width\n"
 	       "  -H, --height=<height>    set frame (not field!) height\n"
+	       "  -A, --padding=<bytes>    set additional horizontal padding (after width)\n"
 	       "  --fps=<fps>              set frames-per-second (default is 30)\n"
 	       "\n"
 	       "  The following option is only valid when reading from a file:\n"
@@ -446,6 +447,7 @@ int main(int argc, char **argv)
 	__u32 overridePixelFormat = 0;
 	__u32 overrideWidth = 0;
 	__u32 overrideHeight = 0;
+	__u32 overrideHorPadding = 0;
 	__u32 overrideField = 0xffffffff;
 	__u32 overrideColorspace = 0xffffffff;
 	__u32 overrideYCbCrEnc = 0xffffffff;
@@ -516,6 +518,9 @@ int main(int argc, char **argv)
 		} else if (isOptArg(args[i], "--height", "-H")) {
 			if (!processOption(args, i, overrideHeight))
 				return 0;
+		} else if (isOptArg(args[i], "--padding", "-A")) {
+			if (!processOption(args, i, overrideHorPadding))
+				return 0;
 		} else if (isOptArg(args[i], "--field", "-F")) {
 			if (!processOption(args, i, s))
 				return 0;
@@ -749,6 +754,7 @@ int main(int argc, char **argv)
 	}
 	win.setOverrideWidth(overrideWidth);
 	win.setOverrideHeight(overrideHeight);
+	win.setOverrideHorPadding(overrideHorPadding);
 	win.setFps(fps);
 	win.setFormat(format);
 	win.setReportTimings(report_timings);
-- 
2.20.1

