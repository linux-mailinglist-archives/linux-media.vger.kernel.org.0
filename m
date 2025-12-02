Return-Path: <linux-media+bounces-48048-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 970BFC9A902
	for <lists+linux-media@lfdr.de>; Tue, 02 Dec 2025 08:52:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 3E7C134603D
	for <lists+linux-media@lfdr.de>; Tue,  2 Dec 2025 07:52:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55A723043C9;
	Tue,  2 Dec 2025 07:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZUqA3Egj"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5046302CB0
	for <linux-media@vger.kernel.org>; Tue,  2 Dec 2025 07:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764661961; cv=none; b=dz3QYobMwH4XYWVMqgL+ZCNrlkAmy6bKcv2RCjgKgCS/JBydSm9dn2iAMg3JTHVm5vbV4iWfJEqsNU+Iq8aApyMTtpx1zMa7PMAfcTLAD3uuUiPkpg2K8eYlBXNzlCKF23Sn8CcMaeh+BpdCHPuEz4tsOfrbRQZ78m9IXv44muI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764661961; c=relaxed/simple;
	bh=9W+ZkiZF8RrPzB6qu8FA9+JATPd6DBh/eT33HlRBEqQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t+I4tXNlDAHNUNrxGAP7yhL/qsT0yGGcnHVzADm1c/DdbNXZd1YFml5cvqj3uZJfqN/TSAVPzNoW7mxmv6pou4QMdounYigYjFYYJYUL9IhKFQWw8rPmuNtdSi/Me2zkuq6/kAEoTV6Q3iou7f0Nld6heykP9RjaHEclJd/AA6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZUqA3Egj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33ADEC116B1;
	Tue,  2 Dec 2025 07:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764661961;
	bh=9W+ZkiZF8RrPzB6qu8FA9+JATPd6DBh/eT33HlRBEqQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZUqA3EgjFcSlFLXwOpFlxMWFhcRvdRg4gnT/PmaMS1vpv9e+mu6vgzK/bKAquoj1l
	 PBLcnjYmIaBvymRl9yemGyp2r7HUycXDFVV7JlIUkUlu7jdAnK6I38WUQVtSNAK6zQ
	 ko4Ua32K2U20fpG9on7oEJ7sJOeGnYEwSTy269Xa3J6e2NJpC66kq8ZAn+16a9ttm9
	 TSv6vliA19+lIw5itPN9WY9e+vTz0oicMJoYLt+2rO3stOt4hXJVMH2RTQzx5GgYSC
	 8dCoh1Ct5njpBOdVj5+iR41qAMoQFL67vU6JWOKruDcbXikf2V3NXPiCJ+p7tO5Cxg
	 US/i/3JH3rUGg==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	laurent.pinchart@ideasonboard.com,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: [PATCHv3 05/12] media: omap3isp: use V4L2_COLORSPACE_SRGB instead of _JPEG
Date: Tue,  2 Dec 2025 08:51:13 +0100
Message-ID: <296516c08fe01c5ed8626b22c3c2ae1b31ccaee5.1764661880.git.hverkuil+cisco@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1764661880.git.hverkuil+cisco@kernel.org>
References: <cover.1764661880.git.hverkuil+cisco@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

JPEG colorspace should generally not be used unless it is actually
dealing with JPG data. This fixes v4l2-compliance errors:

	fail: v4l2-test-formats.cpp(416): pixelformat != V4L2_PIX_FMT_JPEG && pixelformat != V4L2_PIX_FMT_MJPEG && colorspace == V4L2_COLORSPACE_JPEG
	fail: v4l2-test-formats.cpp(521): testColorspace(!node->is_io_mc, pix.pixelformat, pix.colorspace, pix.ycbcr_enc, pix.quantization)
test VIDIOC_TRY_FMT: FAIL

Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
 drivers/media/platform/ti/omap3isp/isppreview.c | 2 +-
 drivers/media/platform/ti/omap3isp/ispresizer.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/ti/omap3isp/isppreview.c b/drivers/media/platform/ti/omap3isp/isppreview.c
index 26f7167d1f4f..9992db782870 100644
--- a/drivers/media/platform/ti/omap3isp/isppreview.c
+++ b/drivers/media/platform/ti/omap3isp/isppreview.c
@@ -1796,7 +1796,7 @@ static void preview_try_format(struct isp_prev_device *prev,
 		fmt->width = crop->width;
 		fmt->height = crop->height;
 
-		fmt->colorspace = V4L2_COLORSPACE_JPEG;
+		fmt->colorspace = V4L2_COLORSPACE_SRGB;
 		break;
 	}
 
diff --git a/drivers/media/platform/ti/omap3isp/ispresizer.c b/drivers/media/platform/ti/omap3isp/ispresizer.c
index 5dff48489394..ad0127f5b5cb 100644
--- a/drivers/media/platform/ti/omap3isp/ispresizer.c
+++ b/drivers/media/platform/ti/omap3isp/ispresizer.c
@@ -1405,7 +1405,7 @@ static void resizer_try_format(struct isp_res_device *res,
 		break;
 	}
 
-	fmt->colorspace = V4L2_COLORSPACE_JPEG;
+	fmt->colorspace = V4L2_COLORSPACE_SRGB;
 	fmt->field = V4L2_FIELD_NONE;
 }
 
-- 
2.51.0


