Return-Path: <linux-media+bounces-21975-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D4EB9D8473
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 12:28:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D47FE1640A5
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 11:28:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11BAC1A0AF0;
	Mon, 25 Nov 2024 11:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toshiba.co.jp header.i=yuji2.ishikawa@toshiba.co.jp header.b="PZeHxaCb"
X-Original-To: linux-media@vger.kernel.org
Received: from mo-csw-fb.securemx.jp (mo-csw-fb1800.securemx.jp [210.130.202.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16D94199924;
	Mon, 25 Nov 2024 11:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.130.202.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732534082; cv=none; b=aueUtsfXFKnJVUorJYe8NPDMCXGUwqxkVM70GWQlKV9jNmSS65kTkabymAvLCbS9L9hVgsYf2yndbmeRopPpcXf3xHMgwBXYb8gA+nXqrzsOCYhBS5W+QGw4TKNQX+FPNHWcCzJViVM3gKElcQEU+rNISxLiiMNXlZnj0ObreFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732534082; c=relaxed/simple;
	bh=J0mvAuwvV6YMmHv11HyZs8PDqoQuS1HOBJbGPaB7TSA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=L5z/8/TP8uH1qfkUEnlMhAG5F2M3LsFLTy4cajZNEH5y2a7CeG7nFy/Xa2wVf0X58M4PIn5fpUGjCvtEGi2l9gDVtAIpUSzhTbuRLCTxz4ZXv06nIOacS5uJVKMjydyZFT7gYKMf5aeX5Z13AIDH+bzmoNpLCubQE0/mwt7FIg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=toshiba.co.jp; spf=pass smtp.mailfrom=toshiba.co.jp; dkim=pass (2048-bit key) header.d=toshiba.co.jp header.i=yuji2.ishikawa@toshiba.co.jp header.b=PZeHxaCb; arc=none smtp.client-ip=210.130.202.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=toshiba.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toshiba.co.jp
Received: by mo-csw-fb.securemx.jp (mx-mo-csw-fb1800) id 4AP9RlYD2993029; Mon, 25 Nov 2024 18:27:47 +0900
DKIM-Signature: v=1;a=rsa-sha256;c=relaxed/simple;d=toshiba.co.jp;h=From:To:Cc
	:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:
	Content-Transfer-Encoding;i=yuji2.ishikawa@toshiba.co.jp;s=key2.smx;t=
	1732526834;x=1733736434;bh=J0mvAuwvV6YMmHv11HyZs8PDqoQuS1HOBJbGPaB7TSA=;b=PZe
	HxaCbq2+aeXygF6D8+UCUIvv4geY7nKngbrTSugMHeKlonV68X246PBwATrTKI63UidHGsw0DjmO3
	Fg41hpsIvxUik02rwer7UiIR6MmCEARv5WtDbAdbkJbcV/TbZEY1f6/dTtrhs2gM3pjq4XAsHImuJ
	ODhgNYcX1mXxJkEcwT8WlDykmlo6u5xQZdHq85ZklRGNuuf5HBdESMqU5tIq3c1W6mE08i5fd9GjM
	EX+ckdbynk1htQAqI5Q8RB4eVuSWM2qQAlul5wee/yxrXO239O0ut96gZ+Jqfco3K4Tf72aYejqvX
	jhJKrBr+s+JiH2U7I1mg6y1Yp3VD/bA==;
Received: by mo-csw.securemx.jp (mx-mo-csw1800) id 4AP9RDcG023988; Mon, 25 Nov 2024 18:27:14 +0900
X-Iguazu-Qid: 2yAa5GSxJ6lY5CrZGV
X-Iguazu-QSIG: v=2; s=0; t=1732526833; q=2yAa5GSxJ6lY5CrZGV; m=zfO2799Q2c8IvxS+F5k0v2J48l4RBfpfn/qT1hIeQLg=
Received: from imx2-a.toshiba.co.jp (imx2-a.toshiba.co.jp [106.186.93.35])
	by relay.securemx.jp (mx-mr1802) id 4AP9RCIP4129100
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 25 Nov 2024 18:27:12 +0900
X-SA-MID: 35004178
From: Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
        Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: [PATCH v12 3/8] media: uapi: add visconti viif meta buffer format
Date: Mon, 25 Nov 2024 18:21:41 +0900
X-TSB-HOP2: ON
Message-Id: <20241125092146.1561901-4-yuji2.ishikawa@toshiba.co.jp>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241125092146.1561901-1-yuji2.ishikawa@toshiba.co.jp>
References: <20241125092146.1561901-1-yuji2.ishikawa@toshiba.co.jp>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds the Toshiba Visconti VIIF specific metadata format

- V4L2_META_FMT_VISCONTI_VIIF_PARAMS for ISP parameters
- V4L2_META_FMT_VISCONTI_VIIF_STATS for ISP statistics

Signed-off-by: Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
---
Changelog v10:
- add entry for V4L2_META_FMT_VISCONTI_VIIF_PARAMS
- add entry for V4L2_META_FMT_VISCONTI_VIIF_STATS

Changelog v11:
- no change

Changelog v12:
- add description for meta formats at v4l2-ioctl.c

 drivers/media/v4l2-core/v4l2-ioctl.c | 2 ++
 include/uapi/linux/videodev2.h       | 4 ++++
 2 files changed, 6 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 0304daa8471d..f7facb63b8ea 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1470,6 +1470,8 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 	case V4L2_META_FMT_RPI_BE_CFG:	descr = "RPi PiSP BE Config format"; break;
 	case V4L2_META_FMT_RPI_FE_CFG:  descr = "RPi PiSP FE Config format"; break;
 	case V4L2_META_FMT_RPI_FE_STATS: descr = "RPi PiSP FE Statistics format"; break;
+	case V4L2_META_FMT_VISCONTI_VIIF_PARAMS: descr = "Visconti ISP Parameters"; break;
+	case V4L2_META_FMT_VISCONTI_VIIF_STATS: descr = "Visconti ISP Statistics"; break;
 	case V4L2_META_FMT_GENERIC_8:	descr = "8-bit Generic Metadata"; break;
 	case V4L2_META_FMT_GENERIC_CSI2_10:	descr = "8-bit Generic Meta, 10b CSI-2"; break;
 	case V4L2_META_FMT_GENERIC_CSI2_12:	descr = "8-bit Generic Meta, 12b CSI-2"; break;
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index a5418759e2ba..9e1f66fdf038 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -863,6 +863,10 @@ struct v4l2_pix_format {
 #define V4L2_META_FMT_RPI_FE_CFG	v4l2_fourcc('R', 'P', 'F', 'C') /* PiSP FE configuration */
 #define V4L2_META_FMT_RPI_FE_STATS	v4l2_fourcc('R', 'P', 'F', 'S') /* PiSP FE stats */
 
+/* Vendor specific - used for Visconti VIIF sub-system */
+#define V4L2_META_FMT_VISCONTI_VIIF_PARAMS	v4l2_fourcc('V', 'I', 'F', 'P') /* ISP Params */
+#define V4L2_META_FMT_VISCONTI_VIIF_STATS	v4l2_fourcc('V', 'I', 'F', 'S') /* ISP Stats */
+
 #ifdef __KERNEL__
 /*
  * Line-based metadata formats. Remember to update v4l_fill_fmtdesc() when
-- 
2.25.1



