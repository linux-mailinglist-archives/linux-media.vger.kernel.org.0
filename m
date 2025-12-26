Return-Path: <linux-media+bounces-49568-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D7AFCDE66C
	for <lists+linux-media@lfdr.de>; Fri, 26 Dec 2025 07:57:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 11C763007222
	for <lists+linux-media@lfdr.de>; Fri, 26 Dec 2025 06:57:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C18542EAD09;
	Fri, 26 Dec 2025 06:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mac.com header.i=@mac.com header.b="JGsyUQn3"
X-Original-To: linux-media@vger.kernel.org
Received: from outbound.st.icloud.com (p-east2-cluster3-host3-snip4-10.eps.apple.com [57.103.77.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85B1317BA2
	for <linux-media@vger.kernel.org>; Fri, 26 Dec 2025 06:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.77.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766732273; cv=none; b=c+WS7+OakFi725AtaYifg74Eq4o66r8S08oH2fXJKFa2ze8ebMl+tMmfxC4O2iA1m1QgZGTUA5lqwT63nCUV8Kh54rXEv4Ruwqbc0WZvsHRbmKMLLm54LPjbn0bhR15s3gLzppRAzYkcvUYC0pEhYt7KwJO8CM4ZNWHN6Z+Gup0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766732273; c=relaxed/simple;
	bh=rJk6IcKRFE1vfFBgIHDrdPr8IBOT+sUw+uky5TiatMc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=khuARuSppcU2MzIL8pznDVrO45mI/uiB3aSYVq3nZxP1xZxfkqA4wYlzEB654vVXlG8CiJbP1F9mpGUSQWRJNFycMVMS97VJZD9727wzSh7KybH+ckMBhwIq1mvpOqbzHZ9OVV1aU0lgbQ41tyAV9nNnhXGJS2cnizM23ISL89I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mac.com; spf=pass smtp.mailfrom=mac.com; dkim=pass (2048-bit key) header.d=mac.com header.i=@mac.com header.b=JGsyUQn3; arc=none smtp.client-ip=57.103.77.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mac.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mac.com
Received: from outbound.st.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-east-1a-60-percent-6 (Postfix) with ESMTPS id B38121800298;
	Fri, 26 Dec 2025 06:57:46 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mac.com; s=1a1hai; bh=RAroO2ClZIbnC/hB3ui8hfLRmdGMNEQR4jPTC48xlT4=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=JGsyUQn38lfpdDFcJDLr2oXvNkRlbHQl5HPfkZkpZkVM/tahoBhWVBt0UDp/AtiPn0q3XPWmKQKoJCZ2cp9dAhrjXQH011WefiuAOugKdHi4UEX1RfLdOuhpp5xE7Bm0LBgZNrzim8gH6DkYZiWqCcbigffosVvmpjVHGGanbi9+D084KfrrJlMAdHoxsSHBoyM2AW6lXVqM1Dcl0ZTh4K0LGOdojN2x+I2q8Wsq0fS+6JGY+NvMQP5PokQBP3mkz5KMkvglK/EbnLitH/RjM0vc/fd/ClYnd/uSE877tRsVB9j5NGIekAPCTTlTDnnpOK9F6l2LE9Us32olEfYCMw==
Received: from Emu-Server-7.tail5a259e.ts.net (unknown [17.42.251.67])
	by p00-icloudmta-asmtp-us-east-1a-60-percent-6 (Postfix) with ESMTPSA id 0CCF0180028F;
	Fri, 26 Dec 2025 06:57:44 +0000 (UTC)
From: Oliver Collyer <ovcollyer@mac.com>
To: laurent.pinchart@ideasonboard.com,
	hansg@kernel.org
Cc: linux-media@vger.kernel.org,
	Oliver Collyer <ovcollyer@mac.com>
Subject: [PATCH v2] media: uvcvideo: Add support for P010 pixel format
Date: Fri, 26 Dec 2025 06:57:18 +0000
Message-ID: <20251226065718.95504-1-ovcollyer@mac.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <25886965-BB9A-4AFB-BEBA-E845B6CAB43A@mac.com>
References: <25886965-BB9A-4AFB-BEBA-E845B6CAB43A@mac.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI2MDA2MyBTYWx0ZWRfXxlj//iqgj4QX
 ZuwdgWirNA97XT7RWXsySBfqN64N+Q6hqwjHHrzBx9nObVE+NVSkFtu4aPhFPfyrYM502gUop7p
 E8UgRuYGgAzi6Ui2o5I20Qy4y/95Y2dhTz0Sc/ydNICt1jva9dXlPmeAiAXNAnvpgjlMob9Lcq4
 Pak6/SZk/HWO+vLaQJBRsXHT6JeDgp6oyo+4Cv+BgugTElaaSpqSWuOBPKF5bVrWqtrO757mJq3
 kvFYBS7HwYKmnKnAOfrxpNZ/BYFmCv230x1+9341flpGAVXAoPa+OMJfFmPoC6tvdZLGQeDeg5/
 migRDdC2uYLgLw+z85e
X-Proofpoint-GUID: QBXYE-nEj-wr9he_Mh_aJg_wFC2GuZv-
X-Proofpoint-ORIG-GUID: QBXYE-nEj-wr9he_Mh_aJg_wFC2GuZv-
X-Authority-Info: v=2.4 cv=UI7Q3Sfy c=1 sm=1 tr=0 ts=694e31eb cx=c_apl:c_pps
 a=YrL12D//S6tul8v/L+6tKg==:117 a=YrL12D//S6tul8v/L+6tKg==:17
 a=wP3pNCr1ah4A:10 a=x7bEGLp0ZPQA:10 a=_fXtljRHFhkA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=NEAV23lmAAAA:8 a=n-kJSqksAAAA:8
 a=A5ZFctxe7bNW9o5TEMQA:9 a=fMAGXkzVR7cRuVcbbVfL:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-26_02,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 spamscore=0 suspectscore=0 malwarescore=0 bulkscore=0 phishscore=0
 clxscore=1015 mlxlogscore=999 mlxscore=0 classifier=spam authscore=0 adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512260063
X-JNJ: AAAAAAABvqqns6K4Hyg4utwCeUA5teMsDe9UAU5Xf2moW7m2gX6+T2EvMYYs4wUwJNBO4H00gKQfxDePthgbpXYJ3w67ew5SMpYmtB3nuzFdy4ejaw/A3QSXrypxxxgjHhHUU615AF0UNj8Yet7PHmJFG02mtLHbDNVjV+6Nj6tBD7lNfJUul8bkhw1HXj0wCKjRkXKIkOrKwfvXSFUmB9g3Dwgodwy9LguUucconLYyek6fMaOdlTIBUpcaFBuWH0FM/mjHz5uK2p92wfN3cEyONAk2Be3x426nnvbT4cY/VDKqe1kTgaVHNExw+0pjo805HNrN7B70xyPQ+8WlMcTp8nhX/inO0OXAAzrRiylT03fkEPK7C6kHC/BrSDcYqj3J7CzFu6kDHsWVxOX/+JQ/jPb2r9DPt3D8A81Wn5xeIMuO2TlHo05tR5T0DXSTNsuzH1+xDQq4twrt/LIr45kn0E/TxOqFPOiq5Aqu//EwtUCuZDa4nSfJA9VOEQJhd9058H0AameS+DNPCQtNW6eHfVMv7dPQdAr4c4Be3+lojKqxPO+QdNeNM1CQQP8xXwuaLS1Un3LuC4CiSx2GxR47ux3USWByU+2jfd6Q+x8FAW7W9F5s1XeU87SCgxb0M9V7EMiRUZsdoeXnFn1Vs9Y=

Add support for the P010 (10-bit Y/UV 4:2:0) pixel format to the
uvcvideo driver. This format is exposed by USB capture devices such as
the Magewell USB Capture HDMI 4K Pro when capturing HDR10 content.

P010 stores 10-bit Y and interleaved UV samples in 16-bit little-endian
words, with data in the upper 10 bits and zeros in the lower 6 bits.
This requires 2 bytes per sample, so bytesperline is wWidth * 2.

V4L2_PIX_FMT_P010 was added to the V4L2 core in commit 5374d8fb75f3
("media: Add P010 video format").

Based on the community DKMS patch from awawa-dev/P010_for_V4L2.

Link: https://lore.kernel.org/linux-media/[email protected]/
Link: https://github.com/awawa-dev/P010_for_V4L2
Signed-off-by: Oliver Collyer <ovcollyer@mac.com>
---
 drivers/media/common/uvc.c       | 4 ++++
 drivers/media/usb/uvc/uvc_v4l2.c | 3 +++
 include/linux/usb/uvc.h          | 3 +++
 3 files changed, 10 insertions(+)

diff --git a/include/linux/usb/uvc.h b/include/linux/usb/uvc.h
--- a/include/linux/usb/uvc.h
+++ b/include/linux/usb/uvc.h
@@ -109,6 +109,9 @@
 #define UVC_GUID_FORMAT_M420 \
 	{ 'M',  '4',  '2',  '0', 0x00, 0x00, 0x10, 0x00, \
 	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
+#define UVC_GUID_FORMAT_P010 \
+	{ 'P',  '0',  '1',  '0', 0x00, 0x00, 0x10, 0x00, \
+	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}

 #define UVC_GUID_FORMAT_H264 \
 	{ 'H',  '2',  '6',  '4', 0x00, 0x00, 0x10, 0x00, \
diff --git a/drivers/media/common/uvc.c b/drivers/media/common/uvc.c
--- a/drivers/media/common/uvc.c
+++ b/drivers/media/common/uvc.c
@@ -40,6 +40,10 @@ static const struct uvc_format_desc uvc_fmts[] = {
 		.guid		= UVC_GUID_FORMAT_M420,
 		.fcc		= V4L2_PIX_FMT_M420,
 	},
+	{
+		.guid		= UVC_GUID_FORMAT_P010,
+		.fcc		= V4L2_PIX_FMT_P010,
+	},
 	{
 		.guid		= UVC_GUID_FORMAT_UYVY,
 		.fcc		= V4L2_PIX_FMT_UYVY,
diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -235,6 +235,9 @@ static u32 uvc_v4l2_get_bytesperline(const struct uvc_format *format,
 	case V4L2_PIX_FMT_M420:
 		return frame->wWidth;

+	case V4L2_PIX_FMT_P010:
+		return frame->wWidth * 2;
+
 	default:
 		return format->bpp * frame->wWidth / 8;
 	}
--
2.43.0

