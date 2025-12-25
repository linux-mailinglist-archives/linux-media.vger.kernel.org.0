Return-Path: <linux-media+bounces-49562-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 068DDCDE1FC
	for <lists+linux-media@lfdr.de>; Thu, 25 Dec 2025 23:04:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 42B943009420
	for <lists+linux-media@lfdr.de>; Thu, 25 Dec 2025 22:04:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9C752848AD;
	Thu, 25 Dec 2025 22:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mac.com header.i=@mac.com header.b="q/ciq410"
X-Original-To: linux-media@vger.kernel.org
Received: from outbound.mr.icloud.com (p-west2-cluster1-host1-snip4-1.eps.apple.com [57.103.68.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C959F1DF256
	for <linux-media@vger.kernel.org>; Thu, 25 Dec 2025 22:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.68.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766700241; cv=none; b=PzyfVIoMiQHC4MJWGoTMKuxaB20LN743cUwPBRTkM5GNBn/QYg8EM9FNWoNvg7gUDEqRRpNDDUkw39sdeqJyl0A58EOPRvK6/wpnExT5f98JNp0o5MZpRvrAaHpAlYtGnCHO0DTl09RcEtf1LpRK3myWw+qI6PFgfzF8s4RMJ20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766700241; c=relaxed/simple;
	bh=ZqjJCrR/lmmKUigHrHbb32qeIwrq9cfTPKrJtgHJIFo=;
	h=From:Content-Type:Mime-Version:Subject:Message-Id:Date:Cc:To; b=nrlhKkJMZMURtbzMfFxY9kr3nKEmXFfav9zadsJ3niwX9awfObQph/0Eq9BSX8CGMOKujc0WQ27UevLhhQ+LoqcDvuOiBJyToFfDuX9GMArbliAeNxCLGozVoV19/JIFLG4juXuPZAfdHia3iI28WQTlzvPH4CadGkIPPfAv/BQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mac.com; spf=pass smtp.mailfrom=mac.com; dkim=pass (2048-bit key) header.d=mac.com header.i=@mac.com header.b=q/ciq410; arc=none smtp.client-ip=57.103.68.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mac.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mac.com
Received: from outbound.mr.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-2a-100-percent-1 (Postfix) with ESMTPS id 60C991800518;
	Thu, 25 Dec 2025 22:03:58 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mac.com; s=1a1hai; bh=R3Tuw3n+x11CX6bf2NbxMAXQgjXDZaBGx2BXQJOD8Ls=; h=From:Content-Type:Mime-Version:Subject:Message-Id:Date:To:x-icloud-hme; b=q/ciq410D/siBq4zrHMWpxAEWNbcpqMu7nOj10YJbf8GLXEBXIGsjJqAPsXDtQ5J7LQeXBEAC3AHy2iHSgXGdC98IKHCgMU7VOdI4rNEAZyEQ9WlAzi6LoFEmkxUT8gpxp2ARSI/6MpebavCTWS0++AhsaXRuYKCg4zDvVrdCIAs407sGHDGOQSIUzaSR1MwTN1G//yUpr+wf0pvnmLRWD1JsiOPr18Q2iCu80YMxS/tKYrNYnsBFPfhF252WMw9geWsAO1qXqlKh5CTCZ51Xg/4/F8lwnG5mZC7bWOqGMBbe2x1yoUYyurntQcjmXgwysVEjDCYZSkrLEpWaqKPmA==
Received: from smtpclient.apple (unknown [17.57.152.38])
	by p00-icloudmta-asmtp-us-west-2a-100-percent-1 (Postfix) with ESMTPSA id 7CFE118001B5;
	Thu, 25 Dec 2025 22:03:57 +0000 (UTC)
From: Oliver Collyer <ovcollyer@mac.com>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.200.81.1.6\))
Subject: [PATCH] media: uvcvideo: Add support for P010 pixel format
Message-Id: <25886965-BB9A-4AFB-BEBA-E845B6CAB43A@mac.com>
Date: Thu, 25 Dec 2025 22:03:45 +0000
Cc: linux-media@vger.kernel.org
To: laurent.pinchart@ideasonboard.com,
 hansg@kernel.org
X-Mailer: Apple Mail (2.3864.200.81.1.6)
X-Proofpoint-GUID: tphnvuAQ10A-2uZSXk5fB6RwS4p2r1PS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI1MDIxNCBTYWx0ZWRfXwQXRwDEpw4uG
 vORjdJ8vkdD77Vn+VdVHHbNVL37l5yVE/gZRhp+tQCVItSrlIYWHPaNMrxLcTASnP6qMeutWDqS
 4vros80wwolb9VtSm89b7sq3gYYwj0N9JGnCxNVytTFWB1lkCjoJu6LGyHxA3OQ5DuKQY0yzigs
 Fn0Or09bDKkwZUZI9ZvhD3ofikRJzUo24zDJa4VVEgd/ydv5TJsOuI4OtNqjjsljrJWBc3y3qGq
 ZEsUviz95DvdFHgTeus6M0xjUPMsFRJehAGsKkiWKrXO3o/VftIzm+UEyIanvag19CMB0hjZbz5
 amqEnPETJ7LjkgDwKBA
X-Proofpoint-ORIG-GUID: tphnvuAQ10A-2uZSXk5fB6RwS4p2r1PS
X-Authority-Info: v=2.4 cv=Y/z1cxeN c=1 sm=1 tr=0 ts=694db4ce cx=c_apl:c_pps
 a=9OgfyREA4BUYbbCgc0Y0oA==:117 a=9OgfyREA4BUYbbCgc0Y0oA==:17
 a=kj9zAlcOel0A:10 a=wP3pNCr1ah4A:10 a=x7bEGLp0ZPQA:10 a=_fXtljRHFhkA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=NEAV23lmAAAA:8 a=n-kJSqksAAAA:8
 a=RU8XQ9ca3D3-k_yrzKUA:9 a=CjuIK1q_8ugA:10 a=fMAGXkzVR7cRuVcbbVfL:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-25_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 adultscore=0 phishscore=0 malwarescore=0 clxscore=1011 suspectscore=0
 mlxscore=0 spamscore=0 bulkscore=0 classifier=spam authscore=0 adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512250214
X-JNJ: AAAAAAABAv0O/lsSx/Pa47yoJhx5kt32c/wYebXMiY5Ner/U8fSCQALLyCV4CQcLvSHpmckpTIKWWDL8ToV/Ndg/21Prmwv+8CtgIsb5aNwePjuPCHY6QpfKRkd+lNBGviG5d8nz4t/VH6PaUldNBR98UDAAma7TLhl/uILdmT1jjLw/dV1KZEvu7fDHH+K08qxqdqW7riltJZ9/T7mEZmHv38ktd+sxzmDO5s5aWMzrvykNLGCbol1ukzWmC94QQzuUCNyS+FNMvrdIkFTCN1gbNqXU7aKsjfp5o8M0fOWIJc3e7WJ9npp4zVAIblXaMednqa524lodjFGwp1E67rsCAD8nXOSvIxzVjdc5IX3M6ei830rjmPtI+Mf9v5ZY0QvidIr7wkjAO8heAjXEVJQ8ZxQXu3BwlBcKoJfw8XBbpRQyIiyu+cUhFSfFx81ylyUNZ39otEdBS78S+gCXvYdCYB3IL+VarkOb7DMJZlIik81rLvfmOmteqIW/Eh+1egVymQlR6SjP4pZsazjJCde1EAI2tbfc4pozVMMli10/0P5gok53iV+nBvhU+srIy9jo7HqdkulUPO4/xYeVTRNbZmrYoDVnpBIcJ/xMVrK18oImKG0Nvc9g/+k7d8kX0CdCz0RrsXwMevgIiJ2tP3ZalRqJHpadrtAJUf4=

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
@@ -40,6 +40,10 @@ static const struct uvc_format_desc uvc_fmts[] =3D {
		.guid		=3D UVC_GUID_FORMAT_M420,
		.fcc		=3D V4L2_PIX_FMT_M420,
	},
+	{
+		.guid		=3D UVC_GUID_FORMAT_P010,
+		.fcc		=3D V4L2_PIX_FMT_P010,
+	},
	{
		.guid		=3D UVC_GUID_FORMAT_UYVY,
		.fcc		=3D V4L2_PIX_FMT_UYVY,
diff --git a/drivers/media/usb/uvc/uvc_v4l2.c =
b/drivers/media/usb/uvc/uvc_v4l2.c
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -235,6 +235,9 @@ static u32 uvc_v4l2_get_bytesperline(const struct =
uvc_format *format,
	case V4L2_PIX_FMT_M420:
		return frame->wWidth;

+	case V4L2_PIX_FMT_P010:
+		return frame->wWidth * 2;
+
	default:
		return format->bpp * frame->wWidth / 8;
	}
--
2.43.0=

