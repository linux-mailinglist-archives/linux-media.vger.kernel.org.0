Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6317711FF4F
	for <lists+linux-media@lfdr.de>; Mon, 16 Dec 2019 09:03:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726722AbfLPIDr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Dec 2019 03:03:47 -0500
Received: from aer-iport-4.cisco.com ([173.38.203.54]:23637 "EHLO
        aer-iport-4.cisco.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726692AbfLPIDr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Dec 2019 03:03:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=6007; q=dns/txt; s=iport;
  t=1576483424; x=1577693024;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Xn5LvvjxldzR9DoYKqUEM3A+BawUQJPVCHOD/pwzZiM=;
  b=Xl4LMZbt52ACiuBB7aCxWsFJUGxyN3tFmfSYK4mfw/UBAcrIVMgPT1Iu
   XvUt8P9zR2xGHn0nCklarUpDGwILcZbvq7ckKlTKBjWBRVdzPze2tclXu
   GzDN2BJZ4dModQkBKOd0v/q2fTN4nJ8UGkeqblg8kRaG72uP4wqosTJ33
   Y=;
X-IronPort-AV: E=Sophos;i="5.69,321,1571702400"; 
   d="scan'208";a="20375986"
Received: from aer-iport-nat.cisco.com (HELO aer-core-4.cisco.com) ([173.38.203.22])
  by aer-iport-4.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 16 Dec 2019 08:03:43 +0000
Received: from BWintherLinux.rd.cisco.com ([10.47.77.148])
        by aer-core-4.cisco.com (8.15.2/8.15.2) with ESMTP id xBG83gKF003549;
        Mon, 16 Dec 2019 08:03:42 GMT
From:   bwinther@cisco.com
To:     linux-media@vger.kernel.org
Cc:     =?UTF-8?q?B=C3=A5rd=20Eirik=20Winther?= <bwinther@cisco.com>
Subject: [PATCH v2] qvidcap: Add stride option to command line
Date:   Mon, 16 Dec 2019 09:03:48 +0100
Message-Id: <20191216080348.6600-1-bwinther@cisco.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 10.47.77.148, [10.47.77.148]
X-Outbound-Node: aer-core-4.cisco.com
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Bård Eirik Winther <bwinther@cisco.com>

Add new hotkeys Shift+Left and Shift+Right to decrase or increase stride.

Signed-off-by: Bård Eirik Winther <bwinther@cisco.com>
---
 utils/qvidcap/capture.cpp  | 38 ++++++++++++++++++++++++++++++++++----
 utils/qvidcap/capture.h    |  2 ++
 utils/qvidcap/qvidcap.1.in |  3 +++
 utils/qvidcap/qvidcap.cpp  |  6 ++++++
 4 files changed, 45 insertions(+), 4 deletions(-)

diff --git a/utils/qvidcap/capture.cpp b/utils/qvidcap/capture.cpp
index a76dd2b6..6c8536be 100644
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
+		if ((w + p) != m_v4l_fmt.g_bytesperline()) {
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
diff --git a/utils/qvidcap/qvidcap.1.in b/utils/qvidcap/qvidcap.1.in
index d7f4af66..10f6fab2 100644
--- a/utils/qvidcap/qvidcap.1.in
+++ b/utils/qvidcap/qvidcap.1.in
@@ -80,6 +80,9 @@ Set width
 \fB\-H,-\-height\fR=\fI<height>\fR
 Set frame (not field!) height
 .TP
+\fB\-A,-\-padding\fR=\fI<bytes>\fR
+set additional horizontal padding (after width)
+.TP
 \fB--fps\fR=\fI<fps>\fR
 Set frames-per-second (default is 30)
 .TP
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

