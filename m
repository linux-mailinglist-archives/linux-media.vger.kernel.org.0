Return-Path: <linux-media+bounces-44655-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BF7C2BE1577
	for <lists+linux-media@lfdr.de>; Thu, 16 Oct 2025 05:18:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4B58019C6925
	for <lists+linux-media@lfdr.de>; Thu, 16 Oct 2025 03:19:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52B5E20010C;
	Thu, 16 Oct 2025 03:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toshiba.co.jp header.i=yuji2.ishikawa@toshiba.co.jp header.b="oHZZ2DFm"
X-Original-To: linux-media@vger.kernel.org
Received: from mo-csw-fb.securemx.jp (mo-csw-fb1801.securemx.jp [210.130.202.160])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4958241C72;
	Thu, 16 Oct 2025 03:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.130.202.160
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760584714; cv=none; b=asH/3iOofuFZ4Q842BrQeUsZRPul11JBv5bRjErGGFW+AYdpc5nXXF1se09J0vOaLCOezK+03w6/rGt1i6NR8hxT3AxI0DNFTCvcQVLj2A4KgyJk9dkBD43zzu9bya2Z4kmplxKyfHkfqEtoGmXLQ2Vwk+ml4J3ujcB2mRCOG48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760584714; c=relaxed/simple;
	bh=bOA/oGB2rYtkxFpZTzh/oxMmndNAWYcCaJrQmbjcKgw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Er4iSd3WzHyH8S+ir4bfXSGQJMIcrhNlDFp+hXAEg3pMqs/UjbyBtt9fjFt6yOD5hOt4K9ZdYrEMXu8FLBT8XymzbmkHVpNhy4ODJrwRldajO2U/WRKocSAovDo1j0OgZg3kOXdpf44zm1ABEeCu53dAnKhb2jz3zapAyXVq7z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=toshiba.co.jp; spf=pass smtp.mailfrom=toshiba.co.jp; dkim=pass (2048-bit key) header.d=toshiba.co.jp header.i=yuji2.ishikawa@toshiba.co.jp header.b=oHZZ2DFm; arc=none smtp.client-ip=210.130.202.160
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=toshiba.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toshiba.co.jp
Received: by mo-csw-fb.securemx.jp (mx-mo-csw-fb1801) id 59G2Umam2735057; Thu, 16 Oct 2025 11:30:48 +0900
DKIM-Signature: v=1;a=rsa-sha256;c=relaxed/simple;d=toshiba.co.jp;h=From:Date:
	Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	References:In-Reply-To:To:Cc;i=yuji2.ishikawa@toshiba.co.jp;s=key1.smx;t=
	1760581820;x=1761791420;bh=bOA/oGB2rYtkxFpZTzh/oxMmndNAWYcCaJrQmbjcKgw=;b=oHZ
	Z2DFmQe/+EFw5+LgBMJnM6P2fzCx5+4jXiMbxdjS4b4gDBvsci3PjOt6aH9+Oa5sztmv1u7v/JGHP
	KowFusrNFE9vf2R6F4MLxtZtYjRjE+lG9XnCgtaLDwZno74mj97ETZQrP+BsgmrbELrPQlQMDR9qn
	P4DumG5XmEikANZ7F6CTpMKWZg1pCn9j1hB8MRjXgYUCuZLIBETAUcD4dN8OCHrX+6AG+T0jlL+cc
	453ZToOC34osYgoBuwL4OPu6XnCcPvyMhau9/Eui3HEL2kxb9ssQ3zOX26vep2RXN9MDEwcQJVNWA
	dJn5D80q4+k4cO1LPO8y29DF0SwMNCg==;
Received: by mo-csw.securemx.jp (mx-mo-csw1800) id 59G2UIsa3796092; Thu, 16 Oct 2025 11:30:18 +0900
X-Iguazu-Qid: 2yAbS6oRblDr5FNpek
X-Iguazu-QSIG: v=2; s=0; t=1760581818; q=2yAbS6oRblDr5FNpek; m=FoK2q6NNAwkwh08nUXs1/KJZdx+AQ7bQHfw3JceL3FQ=
Received: from imx2-a.toshiba.co.jp (imx2-a.toshiba.co.jp [106.186.93.35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	 id 4cnBkd4ydyzyPc; Thu, 16 Oct 2025 11:30:17 +0900 (JST)
X-SA-MID: 53072910
From: Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
Date: Thu, 16 Oct 2025 11:24:40 +0900
Subject: [PATCH v13 3/7] media: uapi: Add visconti viif meta buffer formats
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TSB-HOP2: ON
Message-Id: <20251016-visconti-viif-v13-3-ceca656b9194@toshiba.co.jp>
References: <20251016-visconti-viif-v13-0-ceca656b9194@toshiba.co.jp>
In-Reply-To: <20251016-visconti-viif-v13-0-ceca656b9194@toshiba.co.jp>
To: Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
        Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
X-Mailer: b4 0.14.3

Add the Toshiba Visconti VIIF specific metadata formats.

- V4L2_META_FMT_VISCONTI_VIIF_PARAMS for ISP parameters
- V4L2_META_FMT_VISCONTI_VIIF_STATS for ISP statistics

Signed-off-by: Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
Changelog v10:
- add entry for V4L2_META_FMT_VISCONTI_VIIF_PARAMS
- add entry for V4L2_META_FMT_VISCONTI_VIIF_STATS

Changelog v11:
- no change

Changelog v12:
- add description for meta formats at v4l2-ioctl.c

Changelog v13:
- no change
- Capitalize the first letter of the commit message header.
---
 drivers/media/v4l2-core/v4l2-ioctl.c | 2 ++
 include/uapi/linux/videodev2.h       | 4 ++++
 2 files changed, 6 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 01cf52c3ea33..cfc9a8ab66cb 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1479,6 +1479,8 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 	case V4L2_META_FMT_RPI_BE_CFG:	descr = "RPi PiSP BE Config format"; break;
 	case V4L2_META_FMT_RPI_FE_CFG:  descr = "RPi PiSP FE Config format"; break;
 	case V4L2_META_FMT_RPI_FE_STATS: descr = "RPi PiSP FE Statistics format"; break;
+	case V4L2_META_FMT_VISCONTI_VIIF_PARAMS: descr = "Visconti ISP Parameters"; break;
+	case V4L2_META_FMT_VISCONTI_VIIF_STATS: descr = "Visconti ISP Statistics"; break;
 	case V4L2_META_FMT_GENERIC_8:	descr = "8-bit Generic Metadata"; break;
 	case V4L2_META_FMT_GENERIC_CSI2_10:	descr = "8-bit Generic Meta, 10b CSI-2"; break;
 	case V4L2_META_FMT_GENERIC_CSI2_12:	descr = "8-bit Generic Meta, 12b CSI-2"; break;
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index becd08fdbddb..980ce7d2da1a 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -884,6 +884,10 @@ struct v4l2_pix_format {
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
2.34.1



