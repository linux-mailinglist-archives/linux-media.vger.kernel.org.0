Return-Path: <linux-media+bounces-35754-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C5EAE6241
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 12:23:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 044513AFD42
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 10:22:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EADE28CF6D;
	Tue, 24 Jun 2025 10:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Qv+uFFs9"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8EEA280A58;
	Tue, 24 Jun 2025 10:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750760521; cv=none; b=qvs6opZwgtBaX7dKnNSd2FVF9vBQt08BXHimz/U6gfiBsUB+CLIOwyO+NXPBiRH+MgalhtfZ+Tp6vjHPIETrVLiR8uBfTWqHnwckHlCu92ZFT8U5uxFi+thK2Lmqw66oUrpAbyp9iFkix7xqPWgurl1TOcZB/iaNC0HikgefRRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750760521; c=relaxed/simple;
	bh=XhcKFrjoY28GKg9D6Aqw23tdQaVFXQ/JNS7CaputnqE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=X8hBWbO8xhvKbXNgz3OYKwLUgOCKMyL/IJEKCu2nZj1h4joysNaZDhMR3AOnDlJ9p3CnFqFp7jc6+F6Z49/NnDzNKyMexn1Eiua2wPPqP/vQzmi8L0+N3A8zI+aB6VvANKY2Zwcb+8c4FFCgSXE2uZJT22SBA2Dc/UQ+iOyQv1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Qv+uFFs9; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id EB57952A2;
	Tue, 24 Jun 2025 12:21:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750760483;
	bh=XhcKFrjoY28GKg9D6Aqw23tdQaVFXQ/JNS7CaputnqE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Qv+uFFs9Bn/2rBZKYckBG0qWmBpjd/RrK5bZmITeylFE4nBsHSvrDqB2dbNS3nAtF
	 fyyVsNwDiEB0q39A0k5ZmXxz9h7+e7U1fmM1QUDW9wRW/dL78DKvqI0nJg+vhO5gA2
	 LAq9zrCbwlKMYiGEprcsEeriwe/6yYqDMkzsm/4g=
From: Daniel Scally <dan.scally@ideasonboard.com>
Date: Tue, 24 Jun 2025 11:21:27 +0100
Subject: [PATCH v10 14/17] media: mali-c55: Add image formats for Mali-C55
 parameters buffer
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250624-c55-v10-14-54f3d4196990@ideasonboard.com>
References: <20250624-c55-v10-0-54f3d4196990@ideasonboard.com>
In-Reply-To: <20250624-c55-v10-0-54f3d4196990@ideasonboard.com>
To: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
Cc: Anthony.McGivern@arm.com, jacopo.mondi@ideasonboard.com, 
 nayden.kanchev@arm.com, robh+dt@kernel.org, mchehab@kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
 jerome.forissier@linaro.org, kieran.bingham@ideasonboard.com, 
 laurent.pinchart@ideasonboard.com, dan.scally@ideasonboard.com, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2221;
 i=dan.scally@ideasonboard.com; h=from:subject:message-id;
 bh=FNnrYtwFIA1Sg9g/yqfQA0a3/8qQTDkC9l4e8qkkj1s=;
 b=owEBbQKS/ZANAwAKAchJV3psRXUyAcsmYgBoWnwpXePLygVKpjctCISWWNpjiWBD2f4en1mzL
 U6lVces90yJAjMEAAEKAB0WIQQqyuwyDnZdb+mxmm/ISVd6bEV1MgUCaFp8KQAKCRDISVd6bEV1
 MkwKD/915Py5afMcKa+kk5ZlNCUuLRy4zivhGzV6fUf3H6OqbzYvDPDSz9hNyIG82oCxoAP3i1M
 y4L179ZWydON+pf+x4drJgmEumTddIPQnxtjVyVqIfrH5q0+VYdbimt+eUhC5Kt5gvz3HP1UFga
 SKf3D7f0d6MmpNQmR+YjIyI38YPIYqgcajj5wxmnuELu7ccPZ+AHvNa64uZ1abiHPWP0DO9VppN
 XRZfIQFNzBnnDZGiNHBVocen/1F1RGTGwp07xySJj+Xs2zBa/Vba7UvhsLTAYKfnYQklp0+ktum
 kewjHSshBks5QfuU35iycXRNBZ4QmIYsdQIteQ0HwVqMzdcWWlS0UmcfLeoNm3f7nrMXjQ8Cv2v
 AOaPcInU8irgGyBHOPnsXzSHyxwxdodPnzNdRMb1Ww7bhsHCY4GuwPl6vJYeUjMUBpKL3b58+3m
 gyleXzOGEiklnCjrUCGZNUdO5LR5zY484VY47HGeez0CwQZQrEGDe3KkekQYAW4PJx9ePc6m0Iz
 +tAokCihGlj2/nYPMzt8Do5kDmkEsgvMlyJ7J/++FQfhxRfP4QS7pHmk3uInihWGmLUj4eJhhQh
 0Bicw/1ssSburfqtlaQjNQtX/joAvA+oNVDKGotnj/TalTPNXwRytrEZCIoplsKv0+q6CK+rs0s
 2sfcpPe7JfmKZXQ==
X-Developer-Key: i=dan.scally@ideasonboard.com; a=openpgp;
 fpr=EEC699ACA1B7CB5D31330C0BBD501C2A3546CCF6

From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Add a new V4L2 meta format code for the Mali-C55 parameters.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Acked-by: Nayden Kanchev  <nayden.kanchev@arm.com>
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---
Changes in v10:

	- None

Changes in v9:

	- None

Changes in v8:

	- None

Changes in v7:

	- None

Changes in v6:

	- None

Changes in v5:

	- New patch
---
 drivers/media/v4l2-core/v4l2-ioctl.c | 1 +
 include/uapi/linux/videodev2.h       | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 674260256681b59ab4919ea1f6bc437487e81ee2..be6e0255130742a1d979139c3229329abad759eb 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1466,6 +1466,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 	case V4L2_META_FMT_RK_ISP1_EXT_PARAMS:	descr = "Rockchip ISP1 Ext 3A Params"; break;
 	case V4L2_META_FMT_C3ISP_PARAMS:	descr = "Amlogic C3 ISP Parameters"; break;
 	case V4L2_META_FMT_C3ISP_STATS:		descr = "Amlogic C3 ISP Statistics"; break;
+	case V4L2_META_FMT_MALI_C55_PARAMS:	descr = "ARM Mali-C55 ISP Parameters"; break;
 	case V4L2_META_FMT_MALI_C55_STATS:	descr = "ARM Mali-C55 ISP 3A Statistics"; break;
 	case V4L2_PIX_FMT_NV12_8L128:	descr = "NV12 (8x128 Linear)"; break;
 	case V4L2_PIX_FMT_NV12M_8L128:	descr = "NV12M (8x128 Linear)"; break;
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 05023c16590db117503259f60f1d762b181c0350..da01b41a04842f7b463a04cde9c59989e5aa253f 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -878,6 +878,7 @@ struct v4l2_pix_format {
 #define V4L2_META_FMT_RPI_FE_STATS	v4l2_fourcc('R', 'P', 'F', 'S') /* PiSP FE stats */
 
 /* Vendor specific - used for Arm Mali-C55 ISP */
+#define V4L2_META_FMT_MALI_C55_PARAMS	v4l2_fourcc('C', '5', '5', 'P') /* ARM Mali-C55 Parameters */
 #define V4L2_META_FMT_MALI_C55_STATS	v4l2_fourcc('C', '5', '5', 'S') /* ARM Mali-C55 3A Statistics */
 
 #ifdef __KERNEL__

-- 
2.34.1


