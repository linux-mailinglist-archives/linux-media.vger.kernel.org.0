Return-Path: <linux-media+bounces-48035-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id CECC8C9A8C6
	for <lists+linux-media@lfdr.de>; Tue, 02 Dec 2025 08:49:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 9ECA14E28B9
	for <lists+linux-media@lfdr.de>; Tue,  2 Dec 2025 07:49:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B54A030276C;
	Tue,  2 Dec 2025 07:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n9x722+z"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E3B61D514E
	for <linux-media@vger.kernel.org>; Tue,  2 Dec 2025 07:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764661747; cv=none; b=epxQAZ6EBWM8lg1/nwk8q83fL86lhM/Jf6KKbtiijCmnT6A59wsoF6KGjTU3ebVwhdOLcFfZ1CBEHna+GU1S5O2I2QL6ShpikvW/njDlmGA5vJFYFHmS34oOpcK1MRDqSCJ3lShFS8tMGn2iuKkcbnrLb92jFNEIUgBfVjJbUVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764661747; c=relaxed/simple;
	bh=UBCG/CfMgFlTFS+us6XKaBsB92C/LIyHzfUb9P7kQWU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cQclM3kzhMWb4UUZSbodo466kE0S0cBylxQeMqwrUPfue4bkRppltxoBsjY7CwiNXA1NhNcthcaCDlUT3vAD8mO9xiPucRV/8J3GCxxsT2KYjo+tGZtMOhxKEmKaZYzQsbHMAnxpW3fvgBzGQx6DxEICJ5qZLFq9h8hWFNKs1YE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n9x722+z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD4C0C4CEF1;
	Tue,  2 Dec 2025 07:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764661747;
	bh=UBCG/CfMgFlTFS+us6XKaBsB92C/LIyHzfUb9P7kQWU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=n9x722+zbjE8Yq9AjhnXzG7qvDHNc+OXJJVBe9isE+ROxwBcK1DqerPXsdLAjPF/5
	 6oyok8FtkKtnH9a+lWROuKq+8S4mICcMJGL6ip0alYsqp0FjTp/SymfY8MSC2QelNj
	 +9QlofTWxOQswZcT134ybqoiBD3EPcVN4giZC60y4MMuIpsCurdjXwdCJlHQ5iZEGQ
	 Jd7/GoXTostu8CcG9nQdgkX++x8bBGJYxLfiwoAGtB9sbwO2zTKU8BmSOSz9yKlC9h
	 hA/Y6aEAgXZdfuJjIJ/CXiVqBltDWnQi48JdxoTjg6xBRsD9nasF2Rob8yXIL1aR4E
	 6+0eaENrzOtAg==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	laurent.pinchart@ideasonboard.com,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: [PATCHv2 04/11] media: omap3isp: use V4L2_COLORSPACE_SRGB instead of _JPEG
Date: Tue,  2 Dec 2025 08:48:05 +0100
Message-ID: <214737df67f5f5a3ce948121645e6e63ab87f4b7.1764661692.git.hverkuil+cisco@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1764661692.git.hverkuil+cisco@kernel.org>
References: <cover.1764661692.git.hverkuil+cisco@kernel.org>
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
index e383a57654de..31b0eda975e8 100644
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
index 87d821b02e5c..f8d3774c54cc 100644
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


